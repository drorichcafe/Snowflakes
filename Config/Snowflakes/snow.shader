// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 12.6KB

Shader "Custom/snow" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 39 math
 //        d3d9 : 152 math
 //      opengl : 162 math
 // Stats for Fragment shader:
 //       d3d11 : 0 math, 1 texture
 //        d3d9 : 1 math, 1 texture
 //      opengl : 1 math, 1 texture
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
// Stats: 162 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Float 15 [_Range]
Float 16 [_Size]
Vector 17 [_Offset]
Vector 18 [_CamPos]
Vector 19 [_CamUp]
"3.0-!!ARBvp1.0
PARAM c[26] = { { 0, 0.5, 1, 2 },
		state.matrix.mvp,
		state.matrix.texture[0],
		program.local[9..19],
		{ 0.031830981, 0, 0.25, 0.047746476 },
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -1, 1 },
		{ -9, 0.75, 0.14323941, 0 },
		{ 0.12732393, 0, 0.015915491, 0.1909859 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, vertex.position, c[17];
ADD R1.xyz, -R0, c[18];
RCP R0.w, c[15].x;
MUL R1.xyz, R1, R0.w;
MAD R1.xyz, R1, c[0].y, c[0].y;
FLR R1.xyz, R1;
MUL R1.xyz, R1, c[15].x;
MAD R2.xyz, R1, c[0].w, R0;
MAD R0.y, R2, c[20].x, -c[20].z;
FRC R1.w, R0.y;
MUL R0.x, R2, c[25].z;
ADD R0.x, R0, -c[20].z;
FRC R0.w, R0.x;
ADD R0.xyz, -R1.w, c[0];
MUL R0.xyz, R0, R0;
MAD R4.xyz, R0, c[21].xyxw, c[21].zwzw;
MAD R4.xyz, R4, R0, c[22].xyxw;
MAD R4.xyz, R4, R0, c[22].zwzw;
MAD R4.xyz, R4, R0, c[23].xyxw;
ADD R1.xyz, -R0.w, c[0];
MUL R1.xyz, R1, R1;
MAD R3.xyz, R1, c[21].xyxw, c[21].zwzw;
MAD R3.xyz, R3, R1, c[22].xyxw;
MAD R3.xyz, R3, R1, c[22].zwzw;
MAD R3.xyz, R3, R1, c[23].xyxw;
MAD R4.xyz, R4, R0, c[23].zwzw;
SLT R5.x, R1.w, c[20].z;
SGE R5.yz, R1.w, c[24].xxyw;
MOV R0.xz, R5;
DP3 R0.y, R5, c[23].zwzw;
DP3 R1.w, R4, -R0;
MAD R0.xyz, R3, R1, c[23].zwzw;
SLT R1.x, R0.w, c[20].z;
SGE R1.yz, R0.w, c[24].xxyw;
MOV R3.xz, R1;
DP3 R3.y, R1, c[23].zwzw;
DP3 R0.x, R0, -R3;
MUL R0.w, R0.x, R1;
MUL R0.x, R2, c[25];
MUL R0.y, R2, c[25].w;
ADD R0.x, R0, -c[20].z;
FRC R2.w, R0.x;
ADD R0.y, R0, -c[20].z;
FRC R1.w, R0.y;
ADD R1.xyz, -R1.w, c[0];
MUL R3.xyz, R1, R1;
MAD R4.xyz, R3, c[21].xyxw, c[21].zwzw;
MAD R4.xyz, R4, R3, c[22].xyxw;
MAD R4.xyz, R4, R3, c[22].zwzw;
ADD R0.xyz, -R2.w, c[0];
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[21].xyxw, c[21].zwzw;
MAD R1.xyz, R1, R0, c[22].xyxw;
MAD R1.xyz, R1, R0, c[22].zwzw;
MAD R1.xyz, R1, R0, c[23].xyxw;
MAD R1.xyz, R1, R0, c[23].zwzw;
MAD R4.xyz, R4, R3, c[23].xyxw;
SLT R5.x, R2.w, c[20].z;
SGE R5.yz, R2.w, c[24].xxyw;
MOV R0.xz, R5;
DP3 R0.y, R5, c[23].zwzw;
DP3 R2.w, R1, -R0;
MAD R0.xyz, R4, R3, c[23].zwzw;
SLT R1.x, R1.w, c[20].z;
SGE R1.yz, R1.w, c[24].xxyw;
MOV R3.xz, R1;
DP3 R3.y, R1, c[23].zwzw;
DP3 R0.y, R0, -R3;
MUL R0.x, R0.w, R2.w;
MAD R0.w, R0.x, R0.y, R2.z;
MAD R0.x, R2, c[20], -c[20].z;
FRC R2.z, R0.x;
MAD R0.y, R2, c[20].w, -c[20].z;
FRC R1.w, R0.y;
ADD R1.xyz, -R1.w, c[0];
MUL R3.xyz, R1, R1;
MAD R4.xyz, R3, c[21].xyxw, c[21].zwzw;
MAD R4.xyz, R4, R3, c[22].xyxw;
MAD R4.xyz, R4, R3, c[22].zwzw;
ADD R0.xyz, -R2.z, c[0];
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[21].xyxw, c[21].zwzw;
MAD R1.xyz, R1, R0, c[22].xyxw;
MAD R1.xyz, R1, R0, c[22].zwzw;
MAD R1.xyz, R1, R0, c[23].xyxw;
MAD R1.xyz, R1, R0, c[23].zwzw;
MAD R4.xyz, R4, R3, c[23].xyxw;
SLT R5.x, R2.z, c[20].z;
SGE R5.yz, R2.z, c[24].xxyw;
MOV R0.xz, R5;
DP3 R0.y, R5, c[23].zwzw;
DP3 R2.z, R1, -R0;
MAD R0.xyz, R4, R3, c[23].zwzw;
SLT R1.x, R1.w, c[20].z;
SGE R1.yz, R1.w, c[24].xxyw;
MOV R3.xz, R1;
DP3 R3.y, R1, c[23].zwzw;
DP3 R0.x, R0, -R3;
MUL R0.y, R2.x, c[24].z;
MUL R1.w, R2.z, R0.x;
ADD R0.x, R0.y, -c[20].z;
FRC R2.w, R0.x;
MUL R0.y, R2, c[25].x;
ADD R1.x, R0.y, -c[20].z;
FRC R2.z, R1.x;
ADD R3.xyz, -R2.z, c[0];
MUL R3.xyz, R3, R3;
MAD R4.xyz, R3, c[21].xyxw, c[21].zwzw;
MAD R4.xyz, R4, R3, c[22].xyxw;
ADD R0.xyz, -R2.w, c[0];
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[21].xyxw, c[21].zwzw;
MAD R1.xyz, R1, R0, c[22].xyxw;
MAD R1.xyz, R1, R0, c[22].zwzw;
MAD R1.xyz, R1, R0, c[23].xyxw;
MAD R1.xyz, R1, R0, c[23].zwzw;
MAD R4.xyz, R4, R3, c[22].zwzw;
SLT R5.x, R2.w, c[20].z;
SGE R5.yz, R2.w, c[24].xxyw;
MOV R0.xz, R5;
DP3 R0.y, R5, c[23].zwzw;
DP3 R1.x, R1, -R0;
MUL R1.w, R1, R1.x;
MAD R0.xyz, R4, R3, c[23].xyxw;
MAD R0.xyz, R0, R3, c[23].zwzw;
SLT R1.x, R2.z, c[20].z;
SGE R1.yz, R2.z, c[24].xxyw;
MOV R3.xz, R1;
DP3 R3.y, R1, c[23].zwzw;
DP3 R0.x, R0, -R3;
MAD R3.x, R1.w, R0, R2;
MOV R3.y, R2;
MOV R1.w, c[0].z;
MOV R1.xyz, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MOV R0.z, R0.w;
MOV R0.xy, R3;
MOV R3.z, R0.w;
MAD R1.xyz, R2, c[14].w, -R0;
MOV R1.w, c[16].x;
MUL R0.xyz, R1.w, c[19];
MUL R2.xyz, R0.yzxw, R1.zxyw;
MAD R1.xyz, R0.zxyw, R1.yzxw, -R2;
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
ADD R0.w, vertex.texcoord[0].x, -c[0].y;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R0.w, R1;
MAD R2.xyz, R1, c[16].x, R3;
ADD R1.x, vertex.texcoord[0].y, -c[0].y;
MAD R0.xyz, R1.x, R0, R2;
MOV R0.w, c[0].z;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MOV R0.zw, c[0].x;
MOV R0.xy, vertex.texcoord[0];
DP4 result.texcoord[0].y, R0, c[6];
DP4 result.texcoord[0].x, R0, c[5];
END
# 162 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 152 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_texture0]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Float 14 [_Range]
Float 15 [_Size]
Vector 16 [_Offset]
Vector 17 [_CamPos]
Vector 18 [_CamUp]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
def c19, -0.50000000, 1.00000000, 0.50000000, 2.00000000
def c20, 0.03183098, 0.50000000, 6.28318501, -3.14159298
def c21, 0.04774648, 0.50000000, 0.14323941, 0.12732393
def c22, 0.01591549, 0.50000000, 0.19098590, 0.00000000
dcl_position0 v0
dcl_texcoord0 v1
add r0.xyz, v0, c16
add r1.xyz, -r0, c17
rcp r0.w, c14.x
mul r1.xyz, r1, r0.w
mad r1.xyz, r1, c19.z, c19.z
frc r2.xyz, r1
add r1.xyz, r1, -r2
mul r1.xyz, r1, c14.x
mad r1.xyz, r1, c19.w, r0
mad r0.y, r1, c20.x, c20
mad r0.x, r1, c22, c22.y
frc r0.y, r0
frc r0.x, r0
mad r2.x, r0.y, c20.z, c20.w
mad r1.w, r0.x, c20.z, c20
sincos r0.xy, r2.x
sincos r2.xy, r1.w
mul r1.w, r2.y, r0.y
mad r0.x, r1, c21.w, c21.y
mad r0.y, r1, c22.z, c22
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c20.z, c20.w
sincos r2.xy, r0.x
mad r3.x, r0.y, c20.z, c20.w
sincos r0.xy, r3.x
mul r0.x, r1.w, r2.y
mad r0.w, r0.x, r0.y, r1.z
mad r0.y, r1.x, c21.z, c21
mad r0.z, r1.y, c21.x, c21.y
mad r0.x, r1, c20, c20.y
frc r0.z, r0
mad r0.z, r0, c20, c20.w
sincos r2.xy, r0.z
mad r0.z, r1.y, c21.w, c21.y
frc r0.x, r0
mad r0.x, r0, c20.z, c20.w
sincos r3.xy, r0.x
frc r0.y, r0
mov r1.w, c19.y
mul r0.x, r3.y, r2.y
mad r0.y, r0, c20.z, c20.w
sincos r3.xy, r0.y
mul r0.x, r0, r3.y
frc r0.z, r0
mad r0.y, r0.z, c20.z, c20.w
sincos r2.xy, r0.y
mad r3.x, r0, r2.y, r1
mov r3.y, r1
mov r1.xyz, c12
dp4 r2.z, r1, c10
dp4 r2.y, r1, c9
dp4 r2.x, r1, c8
mov r1.xyz, c18
mul r1.xyz, c15.x, r1
mov r0.z, r0.w
mov r3.z, r0.w
mov r0.xy, r3
mad r0.xyz, r2, c13.w, -r0
mul r2.xyz, r1.yzxw, r0.zxyw
mad r0.xyz, r1.zxyw, r0.yzxw, -r2
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r0.xyz, r1.w, r0
add r0.w, v1.x, c19.x
mul r0.xyz, r0.w, r0
mov r0.w, c19.y
mad r0.xyz, r0, c15.x, r3
add r1.w, v1.y, c19.x
mad r0.xyz, r1.w, r1, r0
dp4 o0.w, r0, c3
dp4 o0.z, r0, c2
dp4 o0.y, r0, c1
dp4 o0.x, r0, c0
mov r0.zw, c22.w
mov r0.xy, v1
dp4 o1.y, r0, c5
dp4 o1.x, r0, c4
"
}
SubProgram "d3d11 " {
// Stats: 39 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Float 80 [_Range]
Float 84 [_Size]
Vector 96 [_Offset] 3
Vector 112 [_CamPos] 3
Vector 128 [_CamUp] 3
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
ConstBuffer "UnityPerDrawTexMatrices" 768
Matrix 512 [glstate_matrix_texture0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityPerDrawTexMatrices" 3
"vs_4_0
eefiecedpokemeoplblcdfbpdmhkiaaehfmgpncpabaaaaaalaagaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcnaafaaaa
eaaaabaaheabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaccaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaac
aeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaacgijcaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaacgijcaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
cgijcaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaacgijcaaaacaaaaaabdaaaaaa
aaaaaaaihcaabaaaabaaaaaaegbcbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaa
aaaaaaajhcaabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaaaaaaaaa
ahaaaaaadiaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaoaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaafaaaaaaaaaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaebaaaaafhcaabaaaacaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaafaaaaaadcaaaaamhcaabaaaabaaaaaaegacbaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaaegacbaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaaegaebaaaabaaaaaaaceaaaaamnmmemdojkjjjjdoggggggdpmnmmemdp
enaaaaagpcaabaaaacaaaaaaaanaaaaaegaobaaaacaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaa
ckaabaaaacaaaaaadkaabaaaaaaaaaaadcaaaaajbcaabaaaacaaaaaadkaabaaa
aaaaaaaadkaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaakpcaabaaaadaaaaaa
egaebaaaabaaaaaaaceaaaaamnmmmmdnmnmmemdomnmmemdpjkjjjjdpenaaaaag
pcaabaaaadaaaaaaaanaaaaaegaobaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaadaaaaaaakaabaaaadaaaaaadiaaaaahicaabaaaaaaaaaaackaabaaa
adaaaaaadkaabaaaaaaaaaaadcaaaaajecaabaaaacaaaaaadkaabaaaaaaaaaaa
dkaabaaaadaaaaaackaabaaaabaaaaaadgaaaaafccaabaaaacaaaaaabkaabaaa
abaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaacgajbaiaebaaaaaaacaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
aaaaaaaaafaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaadaaaaaa
egacbaaaaaaaaaaajgaebaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaacgajbaaa
aaaaaaaacgajbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaakdcaabaaaadaaaaaaegbabaaaabaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agaabaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaafgifcaaa
aaaaaaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaafgafbaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipccabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaabaaaaaaegiacaaaadaaaaaa
cbaaaaaadcaaaaakdccabaaaabaaaaaaegiacaaaadaaaaaacaaaaaaaagbabaaa
abaaaaaaegaabaaaaaaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 1 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
"3.0-!!ARBfp1.0
TEX result.color, fragment.texcoord[0], texture[0], 2D;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 1 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
"ps_3_0
dcl_2d s0
dcl_texcoord0 v0.xy
texld r0, v0, s0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 0 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
"ps_4_0
eefiecedejmlhadafglglkphccimbgjbjggkahdaabaaaaaaceabaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgeaaaaaa
eaaaaaaabjaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaaefaaaaaj
pccabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
doaaaaab"
}
}
 }
}
}