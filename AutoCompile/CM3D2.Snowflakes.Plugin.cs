using System;
using System.Collections.Generic;
using UnityEngine;
using UnityInjector;
using UnityInjector.Attributes;

namespace CM3D2.Snowflakes
{
	[PluginFilter("CM3D2x64"), PluginFilter("CM3D2x86"), PluginName("Snowflakes"), PluginVersion("0.0.0.0")]
	public class Snowflakes : PluginBase
	{
		public class Config
		{
			public KeyCode KeyBoot = KeyCode.F6;
			public int Particles = 16000;
			public float Range = 16.0f;
			public float Size = 0.1f;
			public string Shader = "snow.shader";
			public string Texture = "snow.png";
			public Vector3 PNoiseAmplitude = new Vector3(5.0f, 0.0f, 5.0f);
			public Vector3 PNoiseFrequencyU = new Vector3(0.1f, 0.0f, 0.0f);
			public Vector3 PNoiseFrequencyV = new Vector3(0.0f, 0.0f, 0.1f);
			public Vector3 PNoiseOffsetU = Vector3.zero;
			public Vector3 PNoiseOffsetV = Vector3.zero;
			public Vector3 FixedVector = new Vector3(0.0f, -1.0f, 0.0f);
		}

		private Config m_config = new Config();
		private Vector3 m_offset = Vector3.zero;
		private bool m_boot = false;

		public void Awake()
		{
			UnityEngine.Object.DontDestroyOnLoad(this);
			m_config = loadXml<Config>(System.IO.Path.Combine(this.DataPath, "Snowflakes/Snowflakes.xml"));
			m_boot = false;
		}

		public void Update()
		{
			if (Input.GetKeyDown(m_config.KeyBoot))
			{
				m_boot = !m_boot;
				if (m_boot)
				{
					CreateSnowflakes();
				}
				else
				{
					var go = GameObject.Find("Snowflakes");
					if (go != null) UnityEngine.Object.Destroy(go);
				}
			}
		}

		public void LateUpdate()
		{
			var go = GameObject.Find("Snowflakes");
			if (go == null) return;

			var cam = GameObject.Find("CameraMain");
			if (cam == null) return;

			var pos = cam.transform.TransformPoint(Vector3.forward * m_config.Range);
			var mr = go.GetComponent<MeshRenderer>();
			mr.material.SetFloat("_Range", m_config.Range);
			mr.material.SetFloat("_Size", m_config.Size);
			mr.material.SetVector("_Offset", m_offset);
			mr.material.SetVector("_CamUp", cam.transform.up);
			mr.material.SetVector("_CamPos", pos);

			float x = Mathf.PerlinNoise(Time.time * m_config.PNoiseFrequencyU.x + m_config.PNoiseOffsetU.x, Time.time * m_config.PNoiseFrequencyV.x + m_config.PNoiseOffsetV.x) * 2.0f - 1.0f;
			float y = Mathf.PerlinNoise(Time.time * m_config.PNoiseFrequencyU.y + m_config.PNoiseOffsetU.y, Time.time * m_config.PNoiseFrequencyV.y + m_config.PNoiseOffsetV.y) * 2.0f - 1.0f;
			float z = Mathf.PerlinNoise(Time.time * m_config.PNoiseFrequencyU.z + m_config.PNoiseOffsetU.z, Time.time * m_config.PNoiseFrequencyV.z + m_config.PNoiseOffsetV.z) * 2.0f - 1.0f;
			m_offset += new Vector3(
				x * m_config.PNoiseAmplitude.x + m_config.FixedVector.x,
				y * m_config.PNoiseAmplitude.y + m_config.FixedVector.y,
				z * m_config.PNoiseAmplitude.z + m_config.FixedVector.z) * Time.deltaTime;
			m_offset.x = Mathf.Repeat(m_offset.x, m_config.Range * 2.0f);
			m_offset.y = Mathf.Repeat(m_offset.y, m_config.Range * 2.0f);
			m_offset.z = Mathf.Repeat(m_offset.z, m_config.Range * 2.0f);
		}

		private void CreateSnowflakes()
		{
			m_config = loadXml<Config>(System.IO.Path.Combine(this.DataPath, "Snowflakes/Snowflakes.xml"));

			var vertices = new Vector3[m_config.Particles * 4];
			for (var i = 0; i < m_config.Particles; ++i)
			{
				vertices[i * 4 + 0] = vertices[i * 4 + 1] = vertices[i * 4 + 2] = vertices[i * 4 + 3] = new Vector3(
					UnityEngine.Random.Range(-m_config.Range, m_config.Range),
					UnityEngine.Random.Range(-m_config.Range, m_config.Range),
					UnityEngine.Random.Range(-m_config.Range, m_config.Range));
			}

			var triangles = new int[m_config.Particles * 6];
			for (int i = 0; i < m_config.Particles; ++i)
			{
				triangles[i * 6 + 0] = i * 4 + 0;
				triangles[i * 6 + 1] = triangles[i * 6 + 4] = i * 4 + 1;
				triangles[i * 6 + 2] = triangles[i * 6 + 3] = i * 4 + 2;
				triangles[i * 6 + 5] = i * 4 + 3;
			}

			var uvs = new Vector2[m_config.Particles * 4];
			for (var i = 0; i < m_config.Particles; ++i)
			{
				uvs[i * 4 + 0] = new Vector2(0.0f, 0.0f);
				uvs[i * 4 + 1] = new Vector2(1.0f, 0.0f);
				uvs[i * 4 + 2] = new Vector2(0.0f, 1.0f);
				uvs[i * 4 + 3] = new Vector2(1.0f, 1.0f);
			}

			Mesh mesh = new Mesh();
			mesh.name = "Snowflakes";
			mesh.vertices = vertices;
			mesh.triangles = triangles;
			mesh.uv = uvs;
			mesh.bounds = new Bounds(Vector3.zero, Vector3.one * 99999999);

			var go = GameObject.Find("Snowflakes");
			if (go == null) go = new GameObject("Snowflakes");
			var mf = go.GetComponent<MeshFilter>();
			if (mf == null) mf = go.AddComponent<MeshFilter>();
			var mr = go.GetComponent<MeshRenderer>();
			if (mr == null) mr = go.AddComponent<MeshRenderer>();

			mf.sharedMesh = mesh;
			var f = System.IO.Path.Combine(this.DataPath, "Snowflakes/" + m_config.Shader);
			using (var sr = new System.IO.StreamReader(f)) { mr.material = new Material(sr.ReadToEnd()); }
			var tex = new Texture2D(2, 2);
			tex.LoadImage(System.IO.File.ReadAllBytes(System.IO.Path.Combine(this.DataPath, "Snowflakes/" + m_config.Texture)));
			mr.material.SetTexture("_MainTex", tex);
		}

		private T loadXml<T>(string path)
		{
			var serializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
			using (var sr = new System.IO.StreamReader(path, new System.Text.UTF8Encoding(true)))
			{
				return (T)serializer.Deserialize(sr);
			}
		}
	}
}
