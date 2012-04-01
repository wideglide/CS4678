
# final_win.exe:     file format pei-i386


Disassembly of section .text:

00401000 <_atexit>:
  401000:	55                   	push   ebp
  401001:	89 e5                	mov    ebp,esp
  401003:	83 ec 08             	sub    esp,0x8
  401006:	a1 64 51 40 00       	mov    eax,ds:0x405164
  40100b:	c9                   	leave  
  40100c:	ff e0                	jmp    eax
  40100e:	66 90                	xchg   ax,ax

00401010 <__onexit>:
  401010:	55                   	push   ebp
  401011:	89 e5                	mov    ebp,esp
  401013:	83 ec 08             	sub    esp,0x8
  401016:	a1 58 51 40 00       	mov    eax,ds:0x405158
  40101b:	c9                   	leave  
  40101c:	ff e0                	jmp    eax
  40101e:	66 90                	xchg   ax,ax

00401020 <___mingw_CRTStartup>:
  401020:	55                   	push   ebp
  401021:	89 e5                	mov    ebp,esp
  401023:	53                   	push   ebx
  401024:	83 ec 34             	sub    esp,0x34
  401027:	c7 04 24 50 11 40 00 	mov    DWORD PTR [esp],0x401150
  40102e:	e8 f5 0e 00 00       	call   401f28 <_SetUnhandledExceptionFilter@4>
  401033:	83 ec 04             	sub    esp,0x4
  401036:	e8 75 06 00 00       	call   4016b0 <___cpu_features_init>
  40103b:	e8 e0 0a 00 00       	call   401b20 <__fpreset>
  401040:	8d 45 f0             	lea    eax,[ebp-0x10]
  401043:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  40104a:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40104e:	a1 10 20 40 00       	mov    eax,ds:0x402010
  401053:	c7 44 24 04 04 40 40 	mov    DWORD PTR [esp+0x4],0x404004
  40105a:	00 
  40105b:	c7 04 24 00 40 40 00 	mov    DWORD PTR [esp],0x404000
  401062:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401066:	8d 45 f4             	lea    eax,[ebp-0xc]
  401069:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40106d:	e8 16 0e 00 00       	call   401e88 <___getmainargs>
  401072:	a1 08 40 40 00       	mov    eax,ds:0x404008
  401077:	85 c0                	test   eax,eax
  401079:	75 4a                	jne    4010c5 <___mingw_CRTStartup+0xa5>
  40107b:	e8 10 0e 00 00       	call   401e90 <___p__fmode>
  401080:	8b 15 14 20 40 00    	mov    edx,DWORD PTR ds:0x402014
  401086:	89 10                	mov    DWORD PTR [eax],edx
  401088:	e8 33 08 00 00       	call   4018c0 <__pei386_runtime_relocator>
  40108d:	83 e4 f0             	and    esp,0xfffffff0
  401090:	e8 6b 0a 00 00       	call   401b00 <___main>
  401095:	e8 fe 0d 00 00       	call   401e98 <___p__environ>
  40109a:	8b 00                	mov    eax,DWORD PTR [eax]
  40109c:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4010a0:	a1 04 40 40 00       	mov    eax,ds:0x404004
  4010a5:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4010a9:	a1 00 40 40 00       	mov    eax,ds:0x404000
  4010ae:	89 04 24             	mov    DWORD PTR [esp],eax
  4010b1:	e8 75 04 00 00       	call   40152b <_main>
  4010b6:	89 c3                	mov    ebx,eax
  4010b8:	e8 e3 0d 00 00       	call   401ea0 <__cexit>
  4010bd:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4010c0:	e8 6b 0e 00 00       	call   401f30 <_ExitProcess@4>
  4010c5:	8b 1d 54 51 40 00    	mov    ebx,DWORD PTR ds:0x405154
  4010cb:	a3 14 20 40 00       	mov    ds:0x402014,eax
  4010d0:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4010d4:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  4010d7:	89 04 24             	mov    DWORD PTR [esp],eax
  4010da:	e8 c9 0d 00 00       	call   401ea8 <__setmode>
  4010df:	a1 08 40 40 00       	mov    eax,ds:0x404008
  4010e4:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4010e8:	8b 43 30             	mov    eax,DWORD PTR [ebx+0x30]
  4010eb:	89 04 24             	mov    DWORD PTR [esp],eax
  4010ee:	e8 b5 0d 00 00       	call   401ea8 <__setmode>
  4010f3:	a1 08 40 40 00       	mov    eax,ds:0x404008
  4010f8:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4010fc:	8b 43 50             	mov    eax,DWORD PTR [ebx+0x50]
  4010ff:	89 04 24             	mov    DWORD PTR [esp],eax
  401102:	e8 a1 0d 00 00       	call   401ea8 <__setmode>
  401107:	e9 6f ff ff ff       	jmp    40107b <___mingw_CRTStartup+0x5b>
  40110c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00401110 <_WinMainCRTStartup>:
  401110:	55                   	push   ebp
  401111:	89 e5                	mov    ebp,esp
  401113:	83 ec 18             	sub    esp,0x18
  401116:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  40111d:	ff 15 48 51 40 00    	call   DWORD PTR ds:0x405148
  401123:	e8 f8 fe ff ff       	call   401020 <___mingw_CRTStartup>
  401128:	90                   	nop
  401129:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00401130 <_mainCRTStartup>:
  401130:	55                   	push   ebp
  401131:	89 e5                	mov    ebp,esp
  401133:	83 ec 18             	sub    esp,0x18
  401136:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  40113d:	ff 15 48 51 40 00    	call   DWORD PTR ds:0x405148
  401143:	e8 d8 fe ff ff       	call   401020 <___mingw_CRTStartup>
  401148:	90                   	nop
  401149:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00401150 <__gnu_exception_handler@4>:
  401150:	55                   	push   ebp
  401151:	89 e5                	mov    ebp,esp
  401153:	53                   	push   ebx
  401154:	83 ec 14             	sub    esp,0x14
  401157:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40115a:	8b 00                	mov    eax,DWORD PTR [eax]
  40115c:	8b 00                	mov    eax,DWORD PTR [eax]
  40115e:	3d 91 00 00 c0       	cmp    eax,0xc0000091
  401163:	77 3b                	ja     4011a0 <__gnu_exception_handler@4+0x50>
  401165:	3d 8d 00 00 c0       	cmp    eax,0xc000008d
  40116a:	72 4b                	jb     4011b7 <__gnu_exception_handler@4+0x67>
  40116c:	bb 01 00 00 00       	mov    ebx,0x1
  401171:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  401178:	00 
  401179:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  401180:	e8 2b 0d 00 00       	call   401eb0 <_signal>
  401185:	83 f8 01             	cmp    eax,0x1
  401188:	0f 84 ff 00 00 00    	je     40128d <__gnu_exception_handler@4+0x13d>
  40118e:	85 c0                	test   eax,eax
  401190:	0f 85 aa 00 00 00    	jne    401240 <__gnu_exception_handler@4+0xf0>
  401196:	31 c0                	xor    eax,eax
  401198:	83 c4 14             	add    esp,0x14
  40119b:	5b                   	pop    ebx
  40119c:	5d                   	pop    ebp
  40119d:	c2 04 00             	ret    0x4
  4011a0:	3d 94 00 00 c0       	cmp    eax,0xc0000094
  4011a5:	74 59                	je     401200 <__gnu_exception_handler@4+0xb0>
  4011a7:	3d 96 00 00 c0       	cmp    eax,0xc0000096
  4011ac:	74 1b                	je     4011c9 <__gnu_exception_handler@4+0x79>
  4011ae:	3d 93 00 00 c0       	cmp    eax,0xc0000093
  4011b3:	75 e1                	jne    401196 <__gnu_exception_handler@4+0x46>
  4011b5:	eb b5                	jmp    40116c <__gnu_exception_handler@4+0x1c>
  4011b7:	3d 05 00 00 c0       	cmp    eax,0xc0000005
  4011bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4011c0:	74 45                	je     401207 <__gnu_exception_handler@4+0xb7>
  4011c2:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
  4011c7:	75 cd                	jne    401196 <__gnu_exception_handler@4+0x46>
  4011c9:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  4011d0:	00 
  4011d1:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  4011d8:	e8 d3 0c 00 00       	call   401eb0 <_signal>
  4011dd:	83 f8 01             	cmp    eax,0x1
  4011e0:	74 73                	je     401255 <__gnu_exception_handler@4+0x105>
  4011e2:	85 c0                	test   eax,eax
  4011e4:	74 b0                	je     401196 <__gnu_exception_handler@4+0x46>
  4011e6:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  4011ed:	8d 76 00             	lea    esi,[esi+0x0]
  4011f0:	ff d0                	call   eax
  4011f2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4011f7:	eb 9f                	jmp    401198 <__gnu_exception_handler@4+0x48>
  4011f9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401200:	31 db                	xor    ebx,ebx
  401202:	e9 6a ff ff ff       	jmp    401171 <__gnu_exception_handler@4+0x21>
  401207:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  40120e:	00 
  40120f:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  401216:	e8 95 0c 00 00       	call   401eb0 <_signal>
  40121b:	83 f8 01             	cmp    eax,0x1
  40121e:	74 51                	je     401271 <__gnu_exception_handler@4+0x121>
  401220:	85 c0                	test   eax,eax
  401222:	0f 84 6e ff ff ff    	je     401196 <__gnu_exception_handler@4+0x46>
  401228:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  40122f:	90                   	nop
  401230:	ff d0                	call   eax
  401232:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401237:	e9 5c ff ff ff       	jmp    401198 <__gnu_exception_handler@4+0x48>
  40123c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401240:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  401247:	ff d0                	call   eax
  401249:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40124e:	66 90                	xchg   ax,ax
  401250:	e9 43 ff ff ff       	jmp    401198 <__gnu_exception_handler@4+0x48>
  401255:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  40125c:	00 
  40125d:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  401264:	e8 47 0c 00 00       	call   401eb0 <_signal>
  401269:	83 c8 ff             	or     eax,0xffffffff
  40126c:	e9 27 ff ff ff       	jmp    401198 <__gnu_exception_handler@4+0x48>
  401271:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401278:	00 
  401279:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  401280:	e8 2b 0c 00 00       	call   401eb0 <_signal>
  401285:	83 c8 ff             	or     eax,0xffffffff
  401288:	e9 0b ff ff ff       	jmp    401198 <__gnu_exception_handler@4+0x48>
  40128d:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401294:	00 
  401295:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  40129c:	e8 0f 0c 00 00       	call   401eb0 <_signal>
  4012a1:	85 db                	test   ebx,ebx
  4012a3:	75 0a                	jne    4012af <__gnu_exception_handler@4+0x15f>
  4012a5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4012aa:	e9 e9 fe ff ff       	jmp    401198 <__gnu_exception_handler@4+0x48>
  4012af:	90                   	nop
  4012b0:	e8 6b 08 00 00       	call   401b20 <__fpreset>
  4012b5:	eb ee                	jmp    4012a5 <__gnu_exception_handler@4+0x155>
  4012b7:	90                   	nop
  4012b8:	90                   	nop
  4012b9:	90                   	nop
  4012ba:	90                   	nop
  4012bb:	90                   	nop
  4012bc:	90                   	nop
  4012bd:	90                   	nop
  4012be:	90                   	nop
  4012bf:	90                   	nop

004012c0 <___do_sjlj_init>:
  4012c0:	55                   	push   ebp
  4012c1:	89 e5                	mov    ebp,esp
  4012c3:	5d                   	pop    ebp
  4012c4:	e9 17 09 00 00       	jmp    401be0 <___w32_sharedptr_initialize>
  4012c9:	90                   	nop
  4012ca:	90                   	nop
  4012cb:	90                   	nop
  4012cc:	90                   	nop
  4012cd:	90                   	nop
  4012ce:	90                   	nop
  4012cf:	90                   	nop

004012d0 <_validateUser>:
  4012d0:	55                   	push   ebp
  4012d1:	89 e5                	mov    ebp,esp
  4012d3:	83 ec 04             	sub    esp,0x4
  4012d6:	8d 45 08             	lea    eax,[ebp+0x8]
  4012d9:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4012dc:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  4012df:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4012e2:	40                   	inc    eax
  4012e3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  4012e6:	0f b6 12             	movzx  edx,BYTE PTR [edx]
  4012e9:	30 c2                	xor    dl,al
  4012eb:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4012ee:	83 c0 02             	add    eax,0x2
  4012f1:	32 10                	xor    dl,BYTE PTR [eax]
  4012f3:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4012f6:	83 c0 03             	add    eax,0x3
  4012f9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  4012fc:	30 d0                	xor    al,dl
  4012fe:	3c a6                	cmp    al,0xa6
  401300:	0f 94 c0             	sete   al
  401303:	0f b6 c0             	movzx  eax,al
  401306:	c9                   	leave  
  401307:	c3                   	ret    

00401308 <_realHandler>:
  401308:	55                   	push   ebp
  401309:	89 e5                	mov    ebp,esp
  40130b:	81 ec 38 02 00 00    	sub    esp,0x238
  401311:	c7 45 f4 0d f0 ce fa 	mov    DWORD PTR [ebp-0xc],0xfacef00d
  401318:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  40131f:	a1 00 20 40 00       	mov    eax,ds:0x402000
  401324:	89 04 24             	mov    DWORD PTR [esp],eax
  401327:	e8 bc 0b 00 00       	call   401ee8 <_strlen>
  40132c:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  401333:	00 
  401334:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401338:	a1 00 20 40 00       	mov    eax,ds:0x402000
  40133d:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401341:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401344:	89 04 24             	mov    DWORD PTR [esp],eax
  401347:	e8 5c 03 00 00       	call   4016a8 <_send@16>
  40134c:	83 ec 10             	sub    esp,0x10
  40134f:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  401356:	00 
  401357:	c7 44 24 08 ff 01 00 	mov    DWORD PTR [esp+0x8],0x1ff
  40135e:	00 
  40135f:	8d 85 e8 fd ff ff    	lea    eax,[ebp-0x218]
  401365:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401369:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40136c:	89 04 24             	mov    DWORD PTR [esp],eax
  40136f:	e8 2c 03 00 00       	call   4016a0 <_recv@16>
  401374:	83 ec 10             	sub    esp,0x10
  401377:	89 85 e0 fd ff ff    	mov    DWORD PTR [ebp-0x220],eax
  40137d:	8d 45 f8             	lea    eax,[ebp-0x8]
  401380:	03 85 e0 fd ff ff    	add    eax,DWORD PTR [ebp-0x220]
  401386:	2d 10 02 00 00       	sub    eax,0x210
  40138b:	c6 00 00             	mov    BYTE PTR [eax],0x0
  40138e:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  401395:	00 
  401396:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  40139d:	00 
  40139e:	8d 85 e8 fd ff ff    	lea    eax,[ebp-0x218]
  4013a4:	89 04 24             	mov    DWORD PTR [esp],eax
  4013a7:	e8 34 0b 00 00       	call   401ee0 <_strtoul>
  4013ac:	a3 74 40 40 00       	mov    ds:0x404074,eax
  4013b1:	a1 74 40 40 00       	mov    eax,ds:0x404074
  4013b6:	89 04 24             	mov    DWORD PTR [esp],eax
  4013b9:	e8 12 ff ff ff       	call   4012d0 <_validateUser>
  4013be:	85 c0                	test   eax,eax
  4013c0:	0f 84 d7 00 00 00    	je     40149d <_realHandler+0x195>
  4013c6:	a1 04 20 40 00       	mov    eax,ds:0x402004
  4013cb:	89 04 24             	mov    DWORD PTR [esp],eax
  4013ce:	e8 15 0b 00 00       	call   401ee8 <_strlen>
  4013d3:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  4013da:	00 
  4013db:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4013df:	a1 04 20 40 00       	mov    eax,ds:0x402004
  4013e4:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4013e8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4013eb:	89 04 24             	mov    DWORD PTR [esp],eax
  4013ee:	e8 b5 02 00 00       	call   4016a8 <_send@16>
  4013f3:	83 ec 10             	sub    esp,0x10
  4013f6:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0		; do {
  4013fd:	00 
  4013fe:	c7 44 24 08 01 00 00 	mov    DWORD PTR [esp+0x8],0x1
  401405:	00 
  401406:	8d 85 e7 fd ff ff    	lea    eax,[ebp-0x219]
  40140c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401410:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]		; sock
  401413:	89 04 24             	mov    DWORD PTR [esp],eax
  401416:	e8 85 02 00 00       	call   4016a0 <_recv@16>			; recv(sock, &ch, 1, 0)
  40141b:	83 ec 10             	sub    esp,0x10
  40141e:	83 f8 01             	cmp    eax,0x1
  401421:	74 02                	je     401425 <_realHandler+0x11d>
  401423:	eb 33                	jmp    401458 <_realHandler+0x150>
  401425:	8d 45 f8             	lea    eax,[ebp-0x8]
  401428:	03 45 f0             	add    eax,DWORD PTR [ebp-0x10]
  40142b:	8d 90 f0 fd ff ff    	lea    edx,[eax-0x210]
  401431:	a1 74 40 40 00       	mov    eax,ds:0x404074
  401436:	32 85 e7 fd ff ff    	xor    al,BYTE PTR [ebp-0x219]
  40143c:	88 02                	mov    BYTE PTR [edx],al
  40143e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  401441:	8d 55 f8             	lea    edx,[ebp-0x8]
  401444:	01 d0                	add    eax,edx
  401446:	8d 90 f0 fd ff ff    	lea    edx,[eax-0x210]
  40144c:	8d 45 f0             	lea    eax,[ebp-0x10]
  40144f:	ff 00                	inc    DWORD PTR [eax]
  401451:	80 3a 0a             	cmp    BYTE PTR [edx],0xa				; } while (
  401454:	74 02                	je     401458 <_realHandler+0x150>
  401456:	eb 9e                	jmp    4013f6 <_realHandler+0xee>
  401458:	81 7d f4 0d f0 ce fa 	cmp    DWORD PTR [ebp-0xc],0xfacef00d
  40145f:	74 6c                	je     4014cd <_realHandler+0x1c5>
  401461:	a1 0c 20 40 00       	mov    eax,ds:0x40200c
  401466:	89 04 24             	mov    DWORD PTR [esp],eax
  401469:	e8 7a 0a 00 00       	call   401ee8 <_strlen>
  40146e:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  401475:	00 
  401476:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40147a:	a1 0c 20 40 00       	mov    eax,ds:0x40200c
  40147f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401483:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401486:	89 04 24             	mov    DWORD PTR [esp],eax
  401489:	e8 1a 02 00 00       	call   4016a8 <_send@16>
  40148e:	83 ec 10             	sub    esp,0x10
  401491:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  401498:	e8 3b 0a 00 00       	call   401ed8 <_exit>
  40149d:	a1 08 20 40 00       	mov    eax,ds:0x402008
  4014a2:	89 04 24             	mov    DWORD PTR [esp],eax
  4014a5:	e8 3e 0a 00 00       	call   401ee8 <_strlen>
  4014aa:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  4014b1:	00 
  4014b2:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4014b6:	a1 08 20 40 00       	mov    eax,ds:0x402008
  4014bb:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4014bf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4014c2:	89 04 24             	mov    DWORD PTR [esp],eax
  4014c5:	e8 de 01 00 00       	call   4016a8 <_send@16>
  4014ca:	83 ec 10             	sub    esp,0x10
  4014cd:	c9                   	leave  
  4014ce:	c3                   	ret    

004014cf <_bumpStack>:
  4014cf:	55                   	push   ebp
  4014d0:	89 e5                	mov    ebp,esp
  4014d2:	53                   	push   ebx
  4014d3:	83 ec 14             	sub    esp,0x14
  4014d6:	89 e3                	mov    ebx,esp
  4014d8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  4014db:	83 c0 0f             	add    eax,0xf
  4014de:	83 c0 0f             	add    eax,0xf
  4014e1:	c1 e8 04             	shr    eax,0x4
  4014e4:	c1 e0 04             	shl    eax,0x4
  4014e7:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  4014ea:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4014ed:	e8 5e 09 00 00       	call   401e50 <___chkstk>
  4014f2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4014f5:	89 04 24             	mov    DWORD PTR [esp],eax
  4014f8:	e8 0b fe ff ff       	call   401308 <_realHandler>
  4014fd:	89 dc                	mov    esp,ebx
  4014ff:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401502:	c9                   	leave  
  401503:	c3                   	ret    

00401504 <_handler>:
  401504:	55                   	push   ebp
  401505:	89 e5                	mov    ebp,esp
  401507:	83 ec 18             	sub    esp,0x18
  40150a:	e8 c1 09 00 00       	call   401ed0 <_rand>
  40150f:	25 ff 7f 00 00       	and    eax,0x7fff
  401514:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  401517:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  40151a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40151e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401521:	89 04 24             	mov    DWORD PTR [esp],eax
  401524:	e8 a6 ff ff ff       	call   4014cf <_bumpStack>
  401529:	c9                   	leave  
  40152a:	c3                   	ret    

0040152b <_main>:
  40152b:	55                   	push   ebp
  40152c:	89 e5                	mov    ebp,esp
  40152e:	81 ec d8 01 00 00    	sub    esp,0x1d8
  401534:	83 e4 f0             	and    esp,0xfffffff0
  401537:	b8 00 00 00 00       	mov    eax,0x0
  40153c:	83 c0 0f             	add    eax,0xf
  40153f:	83 c0 0f             	add    eax,0xf
  401542:	c1 e8 04             	shr    eax,0x4
  401545:	c1 e0 04             	shl    eax,0x4
  401548:	89 85 44 fe ff ff    	mov    DWORD PTR [ebp-0x1bc],eax
  40154e:	8b 85 44 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1bc]
  401554:	e8 f7 08 00 00       	call   401e50 <___chkstk>
  401559:	e8 a2 05 00 00       	call   401b00 <___main>
  40155e:	8d 85 58 fe ff ff    	lea    eax,[ebp-0x1a8]
  401564:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401568:	c7 04 24 02 02 00 00 	mov    DWORD PTR [esp],0x202
  40156f:	e8 24 01 00 00       	call   401698 <_WSAStartup@8>
  401574:	83 ec 08             	sub    esp,0x8
  401577:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  40157e:	00 
  40157f:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  401586:	00 
  401587:	8d 45 e8             	lea    eax,[ebp-0x18]
  40158a:	89 04 24             	mov    DWORD PTR [esp],eax
  40158d:	e8 36 09 00 00       	call   401ec8 <_memset>
  401592:	66 c7 45 e8 02 00    	mov    WORD PTR [ebp-0x18],0x2
  401598:	c7 04 24 b3 15 00 00 	mov    DWORD PTR [esp],0x15b3
  40159f:	e8 ec 00 00 00       	call   401690 <_htons@4>
  4015a4:	83 ec 04             	sub    esp,0x4
  4015a7:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
  4015ab:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4015b2:	00 
  4015b3:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4015ba:	00 
  4015bb:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  4015c2:	e8 c1 00 00 00       	call   401688 <_socket@12>
  4015c7:	83 ec 0c             	sub    esp,0xc
  4015ca:	89 85 54 fe ff ff    	mov    DWORD PTR [ebp-0x1ac],eax
  4015d0:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  4015d7:	00 
  4015d8:	8d 45 e8             	lea    eax,[ebp-0x18]
  4015db:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4015df:	8b 85 54 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1ac]
  4015e5:	89 04 24             	mov    DWORD PTR [esp],eax
  4015e8:	e8 93 00 00 00       	call   401680 <_bind@12>
  4015ed:	83 ec 0c             	sub    esp,0xc
  4015f0:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  4015f7:	00 
  4015f8:	8b 85 54 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1ac]
  4015fe:	89 04 24             	mov    DWORD PTR [esp],eax
  401601:	e8 72 00 00 00       	call   401678 <_listen@8>
  401606:	83 ec 08             	sub    esp,0x8
  401609:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  401610:	e8 a3 08 00 00       	call   401eb8 <_time>
  401615:	89 04 24             	mov    DWORD PTR [esp],eax
  401618:	e8 a3 08 00 00       	call   401ec0 <_srand>
  40161d:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  401624:	00 
  401625:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  40162c:	00 
  40162d:	8b 85 54 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1ac]
  401633:	89 04 24             	mov    DWORD PTR [esp],eax
  401636:	e8 35 00 00 00       	call   401670 <_accept@12>
  40163b:	83 ec 0c             	sub    esp,0xc
  40163e:	89 85 50 fe ff ff    	mov    DWORD PTR [ebp-0x1b0],eax
  401644:	8b 85 54 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1ac]
  40164a:	89 04 24             	mov    DWORD PTR [esp],eax
  40164d:	e8 2e 08 00 00       	call   401e80 <_close>
  401652:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1b0]
  401658:	89 04 24             	mov    DWORD PTR [esp],eax
  40165b:	e8 a4 fe ff ff       	call   401504 <_handler>
  401660:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1b0]
  401666:	89 04 24             	mov    DWORD PTR [esp],eax
  401669:	e8 12 08 00 00       	call   401e80 <_close>
  40166e:	eb ad                	jmp    40161d <_main+0xf2>

00401670 <_accept@12>:
  401670:	ff 25 a4 51 40 00    	jmp    DWORD PTR ds:0x4051a4
  401676:	90                   	nop
  401677:	90                   	nop

00401678 <_listen@8>:
  401678:	ff 25 b0 51 40 00    	jmp    DWORD PTR ds:0x4051b0
  40167e:	90                   	nop
  40167f:	90                   	nop

00401680 <_bind@12>:
  401680:	ff 25 a8 51 40 00    	jmp    DWORD PTR ds:0x4051a8
  401686:	90                   	nop
  401687:	90                   	nop

00401688 <_socket@12>:
  401688:	ff 25 bc 51 40 00    	jmp    DWORD PTR ds:0x4051bc
  40168e:	90                   	nop
  40168f:	90                   	nop

00401690 <_htons@4>:
  401690:	ff 25 ac 51 40 00    	jmp    DWORD PTR ds:0x4051ac
  401696:	90                   	nop
  401697:	90                   	nop

00401698 <_WSAStartup@8>:
  401698:	ff 25 a0 51 40 00    	jmp    DWORD PTR ds:0x4051a0
  40169e:	90                   	nop
  40169f:	90                   	nop

004016a0 <_recv@16>:
  4016a0:	ff 25 b4 51 40 00    	jmp    DWORD PTR ds:0x4051b4
  4016a6:	90                   	nop
  4016a7:	90                   	nop

004016a8 <_send@16>:
  4016a8:	ff 25 b8 51 40 00    	jmp    DWORD PTR ds:0x4051b8
  4016ae:	90                   	nop
  4016af:	90                   	nop

004016b0 <___cpu_features_init>:
  4016b0:	55                   	push   ebp
  4016b1:	89 e5                	mov    ebp,esp
  4016b3:	53                   	push   ebx
  4016b4:	9c                   	pushf  
  4016b5:	9c                   	pushf  
  4016b6:	58                   	pop    eax
  4016b7:	89 c2                	mov    edx,eax
  4016b9:	35 00 00 20 00       	xor    eax,0x200000
  4016be:	50                   	push   eax
  4016bf:	9d                   	popf   
  4016c0:	9c                   	pushf  
  4016c1:	58                   	pop    eax
  4016c2:	9d                   	popf   
  4016c3:	31 d0                	xor    eax,edx
  4016c5:	a9 00 00 20 00       	test   eax,0x200000
  4016ca:	0f 84 a3 00 00 00    	je     401773 <___cpu_features_init+0xc3>
  4016d0:	31 c0                	xor    eax,eax
  4016d2:	0f a2                	cpuid  
  4016d4:	85 c0                	test   eax,eax
  4016d6:	0f 84 97 00 00 00    	je     401773 <___cpu_features_init+0xc3>
  4016dc:	b8 01 00 00 00       	mov    eax,0x1
  4016e1:	0f a2                	cpuid  
  4016e3:	f6 c6 01             	test   dh,0x1
  4016e6:	74 07                	je     4016ef <___cpu_features_init+0x3f>
  4016e8:	83 0d 0c 40 40 00 01 	or     DWORD PTR ds:0x40400c,0x1
  4016ef:	66 85 d2             	test   dx,dx
  4016f2:	79 07                	jns    4016fb <___cpu_features_init+0x4b>
  4016f4:	83 0d 0c 40 40 00 02 	or     DWORD PTR ds:0x40400c,0x2
  4016fb:	f7 c2 00 00 80 00    	test   edx,0x800000
  401701:	74 07                	je     40170a <___cpu_features_init+0x5a>
  401703:	83 0d 0c 40 40 00 04 	or     DWORD PTR ds:0x40400c,0x4
  40170a:	f7 c2 00 00 00 01    	test   edx,0x1000000
  401710:	74 07                	je     401719 <___cpu_features_init+0x69>
  401712:	83 0d 0c 40 40 00 08 	or     DWORD PTR ds:0x40400c,0x8
  401719:	f7 c2 00 00 00 02    	test   edx,0x2000000
  40171f:	74 07                	je     401728 <___cpu_features_init+0x78>
  401721:	83 0d 0c 40 40 00 10 	or     DWORD PTR ds:0x40400c,0x10
  401728:	81 e2 00 00 00 04    	and    edx,0x4000000
  40172e:	74 07                	je     401737 <___cpu_features_init+0x87>
  401730:	83 0d 0c 40 40 00 20 	or     DWORD PTR ds:0x40400c,0x20
  401737:	f6 c1 01             	test   cl,0x1
  40173a:	74 07                	je     401743 <___cpu_features_init+0x93>
  40173c:	83 0d 0c 40 40 00 40 	or     DWORD PTR ds:0x40400c,0x40
  401743:	80 e5 20             	and    ch,0x20
  401746:	75 2e                	jne    401776 <___cpu_features_init+0xc6>
  401748:	b8 00 00 00 80       	mov    eax,0x80000000
  40174d:	0f a2                	cpuid  
  40174f:	3d 00 00 00 80       	cmp    eax,0x80000000
  401754:	76 1d                	jbe    401773 <___cpu_features_init+0xc3>
  401756:	b8 01 00 00 80       	mov    eax,0x80000001
  40175b:	0f a2                	cpuid  
  40175d:	85 d2                	test   edx,edx
  40175f:	78 21                	js     401782 <___cpu_features_init+0xd2>
  401761:	81 e2 00 00 00 40    	and    edx,0x40000000
  401767:	74 0a                	je     401773 <___cpu_features_init+0xc3>
  401769:	81 0d 0c 40 40 00 00 	or     DWORD PTR ds:0x40400c,0x200
  401770:	02 00 00 
  401773:	5b                   	pop    ebx
  401774:	5d                   	pop    ebp
  401775:	c3                   	ret    
  401776:	81 0d 0c 40 40 00 80 	or     DWORD PTR ds:0x40400c,0x80
  40177d:	00 00 00 
  401780:	eb c6                	jmp    401748 <___cpu_features_init+0x98>
  401782:	81 0d 0c 40 40 00 00 	or     DWORD PTR ds:0x40400c,0x100
  401789:	01 00 00 
  40178c:	eb d3                	jmp    401761 <___cpu_features_init+0xb1>
  40178e:	90                   	nop
  40178f:	90                   	nop

00401790 <___report_error>:
  401790:	55                   	push   ebp
  401791:	89 e5                	mov    ebp,esp
  401793:	83 ec 18             	sub    esp,0x18
  401796:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  401799:	8b 1d 54 51 40 00    	mov    ebx,DWORD PTR ds:0x405154
  40179f:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
  4017a2:	8d 75 0c             	lea    esi,[ebp+0xc]
  4017a5:	c7 44 24 08 17 00 00 	mov    DWORD PTR [esp+0x8],0x17
  4017ac:	00 
  4017ad:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4017b4:	00 
  4017b5:	83 c3 40             	add    ebx,0x40
  4017b8:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  4017bc:	c7 04 24 6c 30 40 00 	mov    DWORD PTR [esp],0x40306c
  4017c3:	e8 28 07 00 00       	call   401ef0 <_fwrite>
  4017c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4017cb:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  4017cf:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4017d2:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4017d6:	e8 1d 07 00 00       	call   401ef8 <_vfprintf>
  4017db:	e8 20 07 00 00       	call   401f00 <_abort>

004017e0 <___write_memory>:
  4017e0:	55                   	push   ebp
  4017e1:	89 e5                	mov    ebp,esp
  4017e3:	83 ec 48             	sub    esp,0x48
  4017e6:	85 c9                	test   ecx,ecx
  4017e8:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  4017eb:	89 c3                	mov    ebx,eax
  4017ed:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
  4017f0:	89 d6                	mov    esi,edx
  4017f2:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
  4017f5:	89 cf                	mov    edi,ecx
  4017f7:	75 0d                	jne    401806 <___write_memory+0x26>
  4017f9:	8b 5d f4             	mov    ebx,DWORD PTR [ebp-0xc]
  4017fc:	8b 75 f8             	mov    esi,DWORD PTR [ebp-0x8]
  4017ff:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
  401802:	89 ec                	mov    esp,ebp
  401804:	5d                   	pop    ebp
  401805:	c3                   	ret    
  401806:	8d 45 c8             	lea    eax,[ebp-0x38]
  401809:	c7 44 24 08 1c 00 00 	mov    DWORD PTR [esp+0x8],0x1c
  401810:	00 
  401811:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401815:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401818:	e8 1b 07 00 00       	call   401f38 <_VirtualQuery@12>
  40181d:	83 ec 0c             	sub    esp,0xc
  401820:	85 c0                	test   eax,eax
  401822:	74 76                	je     40189a <___write_memory+0xba>
  401824:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  401827:	83 f8 04             	cmp    eax,0x4
  40182a:	74 29                	je     401855 <___write_memory+0x75>
  40182c:	83 f8 40             	cmp    eax,0x40
  40182f:	74 24                	je     401855 <___write_memory+0x75>
  401831:	8d 45 e4             	lea    eax,[ebp-0x1c]
  401834:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401838:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  40183b:	c7 44 24 08 40 00 00 	mov    DWORD PTR [esp+0x8],0x40
  401842:	00 
  401843:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401847:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  40184a:	89 04 24             	mov    DWORD PTR [esp],eax
  40184d:	e8 ee 06 00 00       	call   401f40 <_VirtualProtect@16>
  401852:	83 ec 10             	sub    esp,0x10
  401855:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  401859:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  40185d:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401860:	e8 a3 06 00 00       	call   401f08 <_memcpy>
  401865:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  401868:	83 f8 04             	cmp    eax,0x4
  40186b:	74 8c                	je     4017f9 <___write_memory+0x19>
  40186d:	83 f8 40             	cmp    eax,0x40
  401870:	74 87                	je     4017f9 <___write_memory+0x19>
  401872:	8d 45 e4             	lea    eax,[ebp-0x1c]
  401875:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401879:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  40187c:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401880:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  401883:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401887:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  40188a:	89 04 24             	mov    DWORD PTR [esp],eax
  40188d:	e8 ae 06 00 00       	call   401f40 <_VirtualProtect@16>
  401892:	83 ec 10             	sub    esp,0x10
  401895:	e9 5f ff ff ff       	jmp    4017f9 <___write_memory+0x19>
  40189a:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  40189e:	c7 44 24 04 1c 00 00 	mov    DWORD PTR [esp+0x4],0x1c
  4018a5:	00 
  4018a6:	c7 04 24 84 30 40 00 	mov    DWORD PTR [esp],0x403084
  4018ad:	e8 de fe ff ff       	call   401790 <___report_error>
  4018b2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4018b9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004018c0 <__pei386_runtime_relocator>:
  4018c0:	55                   	push   ebp
  4018c1:	89 e5                	mov    ebp,esp
  4018c3:	83 ec 38             	sub    esp,0x38
  4018c6:	a1 10 40 40 00       	mov    eax,ds:0x404010
  4018cb:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  4018ce:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
  4018d1:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
  4018d4:	85 c0                	test   eax,eax
  4018d6:	74 0d                	je     4018e5 <__pei386_runtime_relocator+0x25>
  4018d8:	8b 5d f4             	mov    ebx,DWORD PTR [ebp-0xc]
  4018db:	8b 75 f8             	mov    esi,DWORD PTR [ebp-0x8]
  4018de:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
  4018e1:	89 ec                	mov    esp,ebp
  4018e3:	5d                   	pop    ebp
  4018e4:	c3                   	ret    
  4018e5:	b8 d8 31 40 00       	mov    eax,0x4031d8
  4018ea:	2d d8 31 40 00       	sub    eax,0x4031d8
  4018ef:	83 f8 07             	cmp    eax,0x7
  4018f2:	c7 05 10 40 40 00 01 	mov    DWORD PTR ds:0x404010,0x1
  4018f9:	00 00 00 
  4018fc:	7e da                	jle    4018d8 <__pei386_runtime_relocator+0x18>
  4018fe:	83 f8 0b             	cmp    eax,0xb
  401901:	bb d8 31 40 00       	mov    ebx,0x4031d8
  401906:	7e 28                	jle    401930 <__pei386_runtime_relocator+0x70>
  401908:	8b 3d d8 31 40 00    	mov    edi,DWORD PTR ds:0x4031d8
  40190e:	85 ff                	test   edi,edi
  401910:	75 1e                	jne    401930 <__pei386_runtime_relocator+0x70>
  401912:	8b 35 dc 31 40 00    	mov    esi,DWORD PTR ds:0x4031dc
  401918:	85 f6                	test   esi,esi
  40191a:	75 14                	jne    401930 <__pei386_runtime_relocator+0x70>
  40191c:	8b 0d e0 31 40 00    	mov    ecx,DWORD PTR ds:0x4031e0
  401922:	85 c9                	test   ecx,ecx
  401924:	75 0a                	jne    401930 <__pei386_runtime_relocator+0x70>
  401926:	bb e4 31 40 00       	mov    ebx,0x4031e4
  40192b:	90                   	nop
  40192c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401930:	8b 13                	mov    edx,DWORD PTR [ebx]
  401932:	85 d2                	test   edx,edx
  401934:	75 5c                	jne    401992 <__pei386_runtime_relocator+0xd2>
  401936:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  401939:	85 c0                	test   eax,eax
  40193b:	75 55                	jne    401992 <__pei386_runtime_relocator+0xd2>
  40193d:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  401940:	83 f8 01             	cmp    eax,0x1
  401943:	0f 85 0d 01 00 00    	jne    401a56 <__pei386_runtime_relocator+0x196>
  401949:	83 c3 0c             	add    ebx,0xc
  40194c:	81 fb d8 31 40 00    	cmp    ebx,0x4031d8
  401952:	73 84                	jae    4018d8 <__pei386_runtime_relocator+0x18>
  401954:	be 00 00 40 00       	mov    esi,0x400000
  401959:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40195c:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  40195e:	0f b6 53 08          	movzx  edx,BYTE PTR [ebx+0x8]
  401962:	01 f0                	add    eax,esi
  401964:	01 f1                	add    ecx,esi
  401966:	83 fa 10             	cmp    edx,0x10
  401969:	8b 39                	mov    edi,DWORD PTR [ecx]
  40196b:	74 63                	je     4019d0 <__pei386_runtime_relocator+0x110>
  40196d:	83 fa 20             	cmp    edx,0x20
  401970:	0f 84 9a 00 00 00    	je     401a10 <__pei386_runtime_relocator+0x150>
  401976:	83 fa 08             	cmp    edx,0x8
  401979:	74 75                	je     4019f0 <__pei386_runtime_relocator+0x130>
  40197b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  401982:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  401986:	c7 04 24 ec 30 40 00 	mov    DWORD PTR [esp],0x4030ec
  40198d:	e8 fe fd ff ff       	call   401790 <___report_error>
  401992:	81 fb d8 31 40 00    	cmp    ebx,0x4031d8
  401998:	0f 83 3a ff ff ff    	jae    4018d8 <__pei386_runtime_relocator+0x18>
  40199e:	be 00 00 40 00       	mov    esi,0x400000
  4019a3:	8d 7d e0             	lea    edi,[ebp-0x20]
  4019a6:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  4019a9:	b9 04 00 00 00       	mov    ecx,0x4
  4019ae:	01 f0                	add    eax,esi
  4019b0:	8b 10                	mov    edx,DWORD PTR [eax]
  4019b2:	03 13                	add    edx,DWORD PTR [ebx]
  4019b4:	83 c3 08             	add    ebx,0x8
  4019b7:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
  4019ba:	89 fa                	mov    edx,edi
  4019bc:	e8 1f fe ff ff       	call   4017e0 <___write_memory>
  4019c1:	81 fb d8 31 40 00    	cmp    ebx,0x4031d8
  4019c7:	72 dd                	jb     4019a6 <__pei386_runtime_relocator+0xe6>
  4019c9:	e9 0a ff ff ff       	jmp    4018d8 <__pei386_runtime_relocator+0x18>
  4019ce:	66 90                	xchg   ax,ax
  4019d0:	0f b7 10             	movzx  edx,WORD PTR [eax]
  4019d3:	66 85 d2             	test   dx,dx
  4019d6:	78 6f                	js     401a47 <__pei386_runtime_relocator+0x187>
  4019d8:	29 ca                	sub    edx,ecx
  4019da:	8d 3c 3a             	lea    edi,[edx+edi*1]
  4019dd:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
  4019e0:	b9 02 00 00 00       	mov    ecx,0x2
  4019e5:	8d 55 e4             	lea    edx,[ebp-0x1c]
  4019e8:	e8 f3 fd ff ff       	call   4017e0 <___write_memory>
  4019ed:	eb 35                	jmp    401a24 <__pei386_runtime_relocator+0x164>
  4019ef:	90                   	nop
  4019f0:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  4019f3:	84 d2                	test   dl,dl
  4019f5:	78 41                	js     401a38 <__pei386_runtime_relocator+0x178>
  4019f7:	29 ca                	sub    edx,ecx
  4019f9:	8d 3c 3a             	lea    edi,[edx+edi*1]
  4019fc:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
  4019ff:	b9 01 00 00 00       	mov    ecx,0x1
  401a04:	8d 55 e4             	lea    edx,[ebp-0x1c]
  401a07:	e8 d4 fd ff ff       	call   4017e0 <___write_memory>
  401a0c:	eb 16                	jmp    401a24 <__pei386_runtime_relocator+0x164>
  401a0e:	66 90                	xchg   ax,ax
  401a10:	03 38                	add    edi,DWORD PTR [eax]
  401a12:	8d 55 e4             	lea    edx,[ebp-0x1c]
  401a15:	29 cf                	sub    edi,ecx
  401a17:	b9 04 00 00 00       	mov    ecx,0x4
  401a1c:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
  401a1f:	e8 bc fd ff ff       	call   4017e0 <___write_memory>
  401a24:	83 c3 0c             	add    ebx,0xc
  401a27:	81 fb d8 31 40 00    	cmp    ebx,0x4031d8
  401a2d:	0f 82 26 ff ff ff    	jb     401959 <__pei386_runtime_relocator+0x99>
  401a33:	e9 a0 fe ff ff       	jmp    4018d8 <__pei386_runtime_relocator+0x18>
  401a38:	81 ca 00 ff ff ff    	or     edx,0xffffff00
  401a3e:	29 ca                	sub    edx,ecx
  401a40:	01 fa                	add    edx,edi
  401a42:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  401a45:	eb b8                	jmp    4019ff <__pei386_runtime_relocator+0x13f>
  401a47:	81 ca 00 00 ff ff    	or     edx,0xffff0000
  401a4d:	29 ca                	sub    edx,ecx
  401a4f:	01 fa                	add    edx,edi
  401a51:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  401a54:	eb 8a                	jmp    4019e0 <__pei386_runtime_relocator+0x120>
  401a56:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401a5a:	c7 04 24 b8 30 40 00 	mov    DWORD PTR [esp],0x4030b8
  401a61:	e8 2a fd ff ff       	call   401790 <___report_error>
  401a66:	90                   	nop
  401a67:	90                   	nop
  401a68:	90                   	nop
  401a69:	90                   	nop
  401a6a:	90                   	nop
  401a6b:	90                   	nop
  401a6c:	90                   	nop
  401a6d:	90                   	nop
  401a6e:	90                   	nop
  401a6f:	90                   	nop

00401a70 <___do_global_dtors>:
  401a70:	55                   	push   ebp
  401a71:	89 e5                	mov    ebp,esp
  401a73:	83 ec 08             	sub    esp,0x8
  401a76:	a1 18 20 40 00       	mov    eax,ds:0x402018
  401a7b:	8b 00                	mov    eax,DWORD PTR [eax]
  401a7d:	85 c0                	test   eax,eax
  401a7f:	74 17                	je     401a98 <___do_global_dtors+0x28>
  401a81:	ff d0                	call   eax
  401a83:	a1 18 20 40 00       	mov    eax,ds:0x402018
  401a88:	8d 50 04             	lea    edx,[eax+0x4]
  401a8b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401a8e:	89 15 18 20 40 00    	mov    DWORD PTR ds:0x402018,edx
  401a94:	85 c0                	test   eax,eax
  401a96:	75 e9                	jne    401a81 <___do_global_dtors+0x11>
  401a98:	c9                   	leave  
  401a99:	c3                   	ret    
  401a9a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00401aa0 <___do_global_ctors>:
  401aa0:	55                   	push   ebp
  401aa1:	89 e5                	mov    ebp,esp
  401aa3:	56                   	push   esi
  401aa4:	53                   	push   ebx
  401aa5:	83 ec 10             	sub    esp,0x10
  401aa8:	8b 1d 58 1f 40 00    	mov    ebx,DWORD PTR ds:0x401f58
  401aae:	83 fb ff             	cmp    ebx,0xffffffff
  401ab1:	74 2d                	je     401ae0 <___do_global_ctors+0x40>
  401ab3:	85 db                	test   ebx,ebx
  401ab5:	74 13                	je     401aca <___do_global_ctors+0x2a>
  401ab7:	8d 34 9d 58 1f 40 00 	lea    esi,[ebx*4+0x401f58]
  401abe:	66 90                	xchg   ax,ax
  401ac0:	ff 16                	call   DWORD PTR [esi]
  401ac2:	83 ee 04             	sub    esi,0x4
  401ac5:	83 eb 01             	sub    ebx,0x1
  401ac8:	75 f6                	jne    401ac0 <___do_global_ctors+0x20>
  401aca:	c7 04 24 70 1a 40 00 	mov    DWORD PTR [esp],0x401a70
  401ad1:	e8 2a f5 ff ff       	call   401000 <_atexit>
  401ad6:	83 c4 10             	add    esp,0x10
  401ad9:	5b                   	pop    ebx
  401ada:	5e                   	pop    esi
  401adb:	5d                   	pop    ebp
  401adc:	c3                   	ret    
  401add:	8d 76 00             	lea    esi,[esi+0x0]
  401ae0:	31 db                	xor    ebx,ebx
  401ae2:	eb 02                	jmp    401ae6 <___do_global_ctors+0x46>
  401ae4:	89 c3                	mov    ebx,eax
  401ae6:	8d 43 01             	lea    eax,[ebx+0x1]
  401ae9:	8b 14 85 58 1f 40 00 	mov    edx,DWORD PTR [eax*4+0x401f58]
  401af0:	85 d2                	test   edx,edx
  401af2:	75 f0                	jne    401ae4 <___do_global_ctors+0x44>
  401af4:	eb bd                	jmp    401ab3 <___do_global_ctors+0x13>
  401af6:	8d 76 00             	lea    esi,[esi+0x0]
  401af9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401b00 <___main>:
  401b00:	55                   	push   ebp
  401b01:	89 e5                	mov    ebp,esp
  401b03:	83 ec 08             	sub    esp,0x8
  401b06:	8b 0d 20 40 40 00    	mov    ecx,DWORD PTR ds:0x404020
  401b0c:	85 c9                	test   ecx,ecx
  401b0e:	74 02                	je     401b12 <___main+0x12>
  401b10:	c9                   	leave  
  401b11:	c3                   	ret    
  401b12:	c7 05 20 40 40 00 01 	mov    DWORD PTR ds:0x404020,0x1
  401b19:	00 00 00 
  401b1c:	c9                   	leave  
  401b1d:	eb 81                	jmp    401aa0 <___do_global_ctors>
  401b1f:	90                   	nop

00401b20 <__fpreset>:
  401b20:	55                   	push   ebp
  401b21:	89 e5                	mov    ebp,esp
  401b23:	db e3                	fninit 
  401b25:	5d                   	pop    ebp
  401b26:	c3                   	ret    
  401b27:	90                   	nop
  401b28:	90                   	nop
  401b29:	90                   	nop
  401b2a:	90                   	nop
  401b2b:	90                   	nop
  401b2c:	90                   	nop
  401b2d:	90                   	nop
  401b2e:	90                   	nop
  401b2f:	90                   	nop

00401b30 <___w32_sharedptr_default_unexpected>:
  401b30:	55                   	push   ebp
  401b31:	a1 94 40 40 00       	mov    eax,ds:0x404094
  401b36:	89 e5                	mov    ebp,esp
  401b38:	5d                   	pop    ebp
  401b39:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  401b3c:	ff e1                	jmp    ecx
  401b3e:	89 f6                	mov    esi,esi

00401b40 <___w32_sharedptr_get>:
  401b40:	55                   	push   ebp
  401b41:	ba 42 00 00 00       	mov    edx,0x42
  401b46:	89 e5                	mov    ebp,esp
  401b48:	53                   	push   ebx
  401b49:	0f b7 c0             	movzx  eax,ax
  401b4c:	83 ec 64             	sub    esp,0x64
  401b4f:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401b53:	8d 55 a8             	lea    edx,[ebp-0x58]
  401b56:	31 db                	xor    ebx,ebx
  401b58:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  401b5c:	89 04 24             	mov    DWORD PTR [esp],eax
  401b5f:	ff 15 20 51 40 00    	call   DWORD PTR ds:0x405120
  401b65:	ba 1f 00 00 00       	mov    edx,0x1f
  401b6a:	b9 01 00 00 00       	mov    ecx,0x1
  401b6f:	83 ec 0c             	sub    esp,0xc
  401b72:	85 c0                	test   eax,eax
  401b74:	75 07                	jne    401b7d <___w32_sharedptr_get+0x3d>
  401b76:	eb 3d                	jmp    401bb5 <___w32_sharedptr_get+0x75>
  401b78:	01 c9                	add    ecx,ecx
  401b7a:	4a                   	dec    edx
  401b7b:	78 0e                	js     401b8b <___w32_sharedptr_get+0x4b>
  401b7d:	80 7c 2a a8 41       	cmp    BYTE PTR [edx+ebp*1-0x58],0x41
  401b82:	75 f4                	jne    401b78 <___w32_sharedptr_get+0x38>
  401b84:	09 cb                	or     ebx,ecx
  401b86:	01 c9                	add    ecx,ecx
  401b88:	4a                   	dec    edx
  401b89:	79 f2                	jns    401b7d <___w32_sharedptr_get+0x3d>
  401b8b:	83 3b 54             	cmp    DWORD PTR [ebx],0x54
  401b8e:	75 07                	jne    401b97 <___w32_sharedptr_get+0x57>
  401b90:	89 d8                	mov    eax,ebx
  401b92:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401b95:	c9                   	leave  
  401b96:	c3                   	ret    
  401b97:	c7 04 24 3c 31 40 00 	mov    DWORD PTR [esp],0x40313c
  401b9e:	ba f7 00 00 00       	mov    edx,0xf7
  401ba3:	b8 6c 31 40 00       	mov    eax,0x40316c
  401ba8:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401bac:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401bb0:	e8 5b 03 00 00       	call   401f10 <__assert>
  401bb5:	c7 04 24 a0 31 40 00 	mov    DWORD PTR [esp],0x4031a0
  401bbc:	bb f1 00 00 00       	mov    ebx,0xf1
  401bc1:	b9 6c 31 40 00       	mov    ecx,0x40316c
  401bc6:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401bca:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  401bce:	e8 3d 03 00 00       	call   401f10 <__assert>
  401bd3:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401bd9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401be0 <___w32_sharedptr_initialize>:
  401be0:	55                   	push   ebp
  401be1:	89 e5                	mov    ebp,esp
  401be3:	57                   	push   edi
  401be4:	56                   	push   esi
  401be5:	53                   	push   ebx
  401be6:	81 ec bc 00 00 00    	sub    esp,0xbc
  401bec:	8b 3d 94 40 40 00    	mov    edi,DWORD PTR ds:0x404094
  401bf2:	85 ff                	test   edi,edi
  401bf4:	74 08                	je     401bfe <___w32_sharedptr_initialize+0x1e>
  401bf6:	8d 65 f4             	lea    esp,[ebp-0xc]
  401bf9:	5b                   	pop    ebx
  401bfa:	5e                   	pop    esi
  401bfb:	5f                   	pop    edi
  401bfc:	5d                   	pop    ebp
  401bfd:	c3                   	ret    
  401bfe:	c7 45 98 41 41 41 41 	mov    DWORD PTR [ebp-0x68],0x41414141
  401c05:	a1 18 31 40 00       	mov    eax,ds:0x403118
  401c0a:	8d 7d 98             	lea    edi,[ebp-0x68]
  401c0d:	c7 45 9c 41 41 41 41 	mov    DWORD PTR [ebp-0x64],0x41414141
  401c14:	c7 45 a0 41 41 41 41 	mov    DWORD PTR [ebp-0x60],0x41414141
  401c1b:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  401c1e:	a1 1c 31 40 00       	mov    eax,ds:0x40311c
  401c23:	c7 45 a4 41 41 41 41 	mov    DWORD PTR [ebp-0x5c],0x41414141
  401c2a:	c7 45 a8 41 41 41 41 	mov    DWORD PTR [ebp-0x58],0x41414141
  401c31:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  401c34:	a1 20 31 40 00       	mov    eax,ds:0x403120
  401c39:	c7 45 ac 41 41 41 41 	mov    DWORD PTR [ebp-0x54],0x41414141
  401c40:	c7 45 b0 41 41 41 41 	mov    DWORD PTR [ebp-0x50],0x41414141
  401c47:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  401c4a:	a1 24 31 40 00       	mov    eax,ds:0x403124
  401c4f:	c7 45 b4 41 41 41 41 	mov    DWORD PTR [ebp-0x4c],0x41414141
  401c56:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  401c59:	a1 28 31 40 00       	mov    eax,ds:0x403128
  401c5e:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  401c61:	a1 2c 31 40 00       	mov    eax,ds:0x40312c
  401c66:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  401c69:	a1 30 31 40 00       	mov    eax,ds:0x403130
  401c6e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  401c71:	a1 34 31 40 00       	mov    eax,ds:0x403134
  401c76:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  401c79:	0f b7 05 38 31 40 00 	movzx  eax,WORD PTR ds:0x403138
  401c80:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
  401c84:	89 3c 24             	mov    DWORD PTR [esp],edi
  401c87:	ff 15 1c 51 40 00    	call   DWORD PTR ds:0x40511c
  401c8d:	0f b7 c0             	movzx  eax,ax
  401c90:	83 ec 04             	sub    esp,0x4
  401c93:	85 c0                	test   eax,eax
  401c95:	0f 85 71 01 00 00    	jne    401e0c <___w32_sharedptr_initialize+0x22c>
  401c9b:	c7 04 24 54 00 00 00 	mov    DWORD PTR [esp],0x54
  401ca2:	e8 79 02 00 00       	call   401f20 <_malloc>
  401ca7:	85 c0                	test   eax,eax
  401ca9:	89 c3                	mov    ebx,eax
  401cab:	0f 84 8f 01 00 00    	je     401e40 <___w32_sharedptr_initialize+0x260>
  401cb1:	89 04 24             	mov    DWORD PTR [esp],eax
  401cb4:	31 c9                	xor    ecx,ecx
  401cb6:	be 54 00 00 00       	mov    esi,0x54
  401cbb:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  401cbf:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  401cc3:	e8 00 02 00 00       	call   401ec8 <_memset>
  401cc8:	c7 43 04 00 1f 40 00 	mov    DWORD PTR [ebx+0x4],0x401f00
  401ccf:	b9 01 00 00 00       	mov    ecx,0x1
  401cd4:	c7 43 08 30 1b 40 00 	mov    DWORD PTR [ebx+0x8],0x401b30
  401cdb:	a1 34 40 40 00       	mov    eax,ds:0x404034
  401ce0:	c7 03 54 00 00 00    	mov    DWORD PTR [ebx],0x54
  401ce6:	8b 15 38 40 40 00    	mov    edx,DWORD PTR ds:0x404038
  401cec:	c7 43 28 00 00 00 00 	mov    DWORD PTR [ebx+0x28],0x0
  401cf3:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
  401cf6:	a1 1c 20 40 00       	mov    eax,ds:0x40201c
  401cfb:	89 53 18             	mov    DWORD PTR [ebx+0x18],edx
  401cfe:	8b 15 20 20 40 00    	mov    edx,DWORD PTR ds:0x402020
  401d04:	89 43 1c             	mov    DWORD PTR [ebx+0x1c],eax
  401d07:	a1 44 40 40 00       	mov    eax,ds:0x404044
  401d0c:	c7 43 2c ff ff ff ff 	mov    DWORD PTR [ebx+0x2c],0xffffffff
  401d13:	89 53 20             	mov    DWORD PTR [ebx+0x20],edx
  401d16:	89 43 30             	mov    DWORD PTR [ebx+0x30],eax
  401d19:	a1 24 20 40 00       	mov    eax,ds:0x402024
  401d1e:	8b 15 28 20 40 00    	mov    edx,DWORD PTR ds:0x402028
  401d24:	89 43 34             	mov    DWORD PTR [ebx+0x34],eax
  401d27:	a1 54 40 40 00       	mov    eax,ds:0x404054
  401d2c:	89 53 38             	mov    DWORD PTR [ebx+0x38],edx
  401d2f:	8b 15 58 40 40 00    	mov    edx,DWORD PTR ds:0x404058
  401d35:	89 43 3c             	mov    DWORD PTR [ebx+0x3c],eax
  401d38:	a1 64 40 40 00       	mov    eax,ds:0x404064
  401d3d:	c7 43 44 ff ff ff ff 	mov    DWORD PTR [ebx+0x44],0xffffffff
  401d44:	89 53 40             	mov    DWORD PTR [ebx+0x40],edx
  401d47:	89 43 48             	mov    DWORD PTR [ebx+0x48],eax
  401d4a:	8b 15 30 20 40 00    	mov    edx,DWORD PTR ds:0x402030
  401d50:	a1 2c 20 40 00       	mov    eax,ds:0x40202c
  401d55:	89 53 50             	mov    DWORD PTR [ebx+0x50],edx
  401d58:	ba 1f 00 00 00       	mov    edx,0x1f
  401d5d:	89 43 4c             	mov    DWORD PTR [ebx+0x4c],eax
  401d60:	89 d8                	mov    eax,ebx
  401d62:	21 c8                	and    eax,ecx
  401d64:	83 f8 01             	cmp    eax,0x1
  401d67:	19 c0                	sbb    eax,eax
  401d69:	24 20                	and    al,0x20
  401d6b:	01 c9                	add    ecx,ecx
  401d6d:	04 41                	add    al,0x41
  401d6f:	88 84 2a 48 ff ff ff 	mov    BYTE PTR [edx+ebp*1-0xb8],al
  401d76:	4a                   	dec    edx
  401d77:	79 e7                	jns    401d60 <___w32_sharedptr_initialize+0x180>
  401d79:	a1 18 31 40 00       	mov    eax,ds:0x403118
  401d7e:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
  401d84:	a1 1c 31 40 00       	mov    eax,ds:0x40311c
  401d89:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
  401d8f:	a1 20 31 40 00       	mov    eax,ds:0x403120
  401d94:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
  401d9a:	a1 24 31 40 00       	mov    eax,ds:0x403124
  401d9f:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  401da5:	a1 28 31 40 00       	mov    eax,ds:0x403128
  401daa:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  401db0:	a1 2c 31 40 00       	mov    eax,ds:0x40312c
  401db5:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  401dbb:	a1 30 31 40 00       	mov    eax,ds:0x403130
  401dc0:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
  401dc3:	a1 34 31 40 00       	mov    eax,ds:0x403134
  401dc8:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  401dcb:	0f b7 05 38 31 40 00 	movzx  eax,WORD PTR ds:0x403138
  401dd2:	66 89 45 88          	mov    WORD PTR [ebp-0x78],ax
  401dd6:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  401ddc:	89 04 24             	mov    DWORD PTR [esp],eax
  401ddf:	ff 15 14 51 40 00    	call   DWORD PTR ds:0x405114
  401de5:	0f b7 f0             	movzx  esi,ax
  401de8:	83 ec 04             	sub    esp,0x4
  401deb:	85 f6                	test   esi,esi
  401ded:	75 42                	jne    401e31 <___w32_sharedptr_initialize+0x251>
  401def:	31 d2                	xor    edx,edx
  401df1:	85 d2                	test   edx,edx
  401df3:	75 1e                	jne    401e13 <___w32_sharedptr_initialize+0x233>
  401df5:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401df8:	e8 1b 01 00 00       	call   401f18 <_free>
  401dfd:	89 3c 24             	mov    DWORD PTR [esp],edi
  401e00:	ff 15 1c 51 40 00    	call   DWORD PTR ds:0x40511c
  401e06:	83 ec 04             	sub    esp,0x4
  401e09:	0f b7 c0             	movzx  eax,ax
  401e0c:	e8 2f fd ff ff       	call   401b40 <___w32_sharedptr_get>
  401e11:	89 c3                	mov    ebx,eax
  401e13:	89 1d 94 40 40 00    	mov    DWORD PTR ds:0x404094,ebx
  401e19:	8d 43 04             	lea    eax,[ebx+0x4]
  401e1c:	a3 84 40 40 00       	mov    ds:0x404084,eax
  401e21:	8d 43 08             	lea    eax,[ebx+0x8]
  401e24:	a3 a4 40 40 00       	mov    ds:0x4040a4,eax
  401e29:	8d 65 f4             	lea    esp,[ebp-0xc]
  401e2c:	5b                   	pop    ebx
  401e2d:	5e                   	pop    esi
  401e2e:	5f                   	pop    edi
  401e2f:	5d                   	pop    ebp
  401e30:	c3                   	ret    
  401e31:	89 f0                	mov    eax,esi
  401e33:	e8 08 fd ff ff       	call   401b40 <___w32_sharedptr_get>
  401e38:	39 d8                	cmp    eax,ebx
  401e3a:	89 f2                	mov    edx,esi
  401e3c:	75 b1                	jne    401def <___w32_sharedptr_initialize+0x20f>
  401e3e:	eb b1                	jmp    401df1 <___w32_sharedptr_initialize+0x211>
  401e40:	e8 bb 00 00 00       	call   401f00 <_abort>
  401e45:	90                   	nop
  401e46:	90                   	nop
  401e47:	90                   	nop
  401e48:	90                   	nop
  401e49:	90                   	nop
  401e4a:	90                   	nop
  401e4b:	90                   	nop
  401e4c:	90                   	nop
  401e4d:	90                   	nop
  401e4e:	90                   	nop
  401e4f:	90                   	nop

00401e50 <___chkstk>:
  401e50:	51                   	push   ecx
  401e51:	89 e1                	mov    ecx,esp
  401e53:	83 c1 08             	add    ecx,0x8

00401e56 <probe>:
  401e56:	3d 00 10 00 00       	cmp    eax,0x1000
  401e5b:	72 10                	jb     401e6d <done>
  401e5d:	81 e9 00 10 00 00    	sub    ecx,0x1000
  401e63:	83 09 00             	or     DWORD PTR [ecx],0x0
  401e66:	2d 00 10 00 00       	sub    eax,0x1000
  401e6b:	eb e9                	jmp    401e56 <probe>

00401e6d <done>:
  401e6d:	29 c1                	sub    ecx,eax
  401e6f:	83 09 00             	or     DWORD PTR [ecx],0x0
  401e72:	89 e0                	mov    eax,esp
  401e74:	89 cc                	mov    esp,ecx
  401e76:	8b 08                	mov    ecx,DWORD PTR [eax]
  401e78:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401e7b:	ff e0                	jmp    eax
  401e7d:	90                   	nop
  401e7e:	90                   	nop
  401e7f:	90                   	nop

00401e80 <_close>:
  401e80:	ff 25 34 51 40 00    	jmp    DWORD PTR ds:0x405134
  401e86:	90                   	nop
  401e87:	90                   	nop

00401e88 <___getmainargs>:
  401e88:	ff 25 3c 51 40 00    	jmp    DWORD PTR ds:0x40513c
  401e8e:	90                   	nop
  401e8f:	90                   	nop

00401e90 <___p__fmode>:
  401e90:	ff 25 44 51 40 00    	jmp    DWORD PTR ds:0x405144
  401e96:	90                   	nop
  401e97:	90                   	nop

00401e98 <___p__environ>:
  401e98:	ff 25 40 51 40 00    	jmp    DWORD PTR ds:0x405140
  401e9e:	90                   	nop
  401e9f:	90                   	nop

00401ea0 <__cexit>:
  401ea0:	ff 25 50 51 40 00    	jmp    DWORD PTR ds:0x405150
  401ea6:	90                   	nop
  401ea7:	90                   	nop

00401ea8 <__setmode>:
  401ea8:	ff 25 5c 51 40 00    	jmp    DWORD PTR ds:0x40515c
  401eae:	90                   	nop
  401eaf:	90                   	nop

00401eb0 <_signal>:
  401eb0:	ff 25 84 51 40 00    	jmp    DWORD PTR ds:0x405184
  401eb6:	90                   	nop
  401eb7:	90                   	nop

00401eb8 <_time>:
  401eb8:	ff 25 94 51 40 00    	jmp    DWORD PTR ds:0x405194
  401ebe:	90                   	nop
  401ebf:	90                   	nop

00401ec0 <_srand>:
  401ec0:	ff 25 88 51 40 00    	jmp    DWORD PTR ds:0x405188
  401ec6:	90                   	nop
  401ec7:	90                   	nop

00401ec8 <_memset>:
  401ec8:	ff 25 7c 51 40 00    	jmp    DWORD PTR ds:0x40517c
  401ece:	90                   	nop
  401ecf:	90                   	nop

00401ed0 <_rand>:
  401ed0:	ff 25 80 51 40 00    	jmp    DWORD PTR ds:0x405180
  401ed6:	90                   	nop
  401ed7:	90                   	nop

00401ed8 <_exit>:
  401ed8:	ff 25 68 51 40 00    	jmp    DWORD PTR ds:0x405168
  401ede:	90                   	nop
  401edf:	90                   	nop

00401ee0 <_strtoul>:
  401ee0:	ff 25 90 51 40 00    	jmp    DWORD PTR ds:0x405190
  401ee6:	90                   	nop
  401ee7:	90                   	nop

00401ee8 <_strlen>:
  401ee8:	ff 25 8c 51 40 00    	jmp    DWORD PTR ds:0x40518c
  401eee:	90                   	nop
  401eef:	90                   	nop

00401ef0 <_fwrite>:
  401ef0:	ff 25 70 51 40 00    	jmp    DWORD PTR ds:0x405170
  401ef6:	90                   	nop
  401ef7:	90                   	nop

00401ef8 <_vfprintf>:
  401ef8:	ff 25 98 51 40 00    	jmp    DWORD PTR ds:0x405198
  401efe:	90                   	nop
  401eff:	90                   	nop

00401f00 <_abort>:
  401f00:	ff 25 60 51 40 00    	jmp    DWORD PTR ds:0x405160
  401f06:	90                   	nop
  401f07:	90                   	nop

00401f08 <_memcpy>:
  401f08:	ff 25 78 51 40 00    	jmp    DWORD PTR ds:0x405178
  401f0e:	90                   	nop
  401f0f:	90                   	nop

00401f10 <__assert>:
  401f10:	ff 25 4c 51 40 00    	jmp    DWORD PTR ds:0x40514c
  401f16:	90                   	nop
  401f17:	90                   	nop

00401f18 <_free>:
  401f18:	ff 25 6c 51 40 00    	jmp    DWORD PTR ds:0x40516c
  401f1e:	90                   	nop
  401f1f:	90                   	nop

00401f20 <_malloc>:
  401f20:	ff 25 74 51 40 00    	jmp    DWORD PTR ds:0x405174
  401f26:	90                   	nop
  401f27:	90                   	nop

00401f28 <_SetUnhandledExceptionFilter@4>:
  401f28:	ff 25 24 51 40 00    	jmp    DWORD PTR ds:0x405124
  401f2e:	90                   	nop
  401f2f:	90                   	nop

00401f30 <_ExitProcess@4>:
  401f30:	ff 25 18 51 40 00    	jmp    DWORD PTR ds:0x405118
  401f36:	90                   	nop
  401f37:	90                   	nop

00401f38 <_VirtualQuery@12>:
  401f38:	ff 25 2c 51 40 00    	jmp    DWORD PTR ds:0x40512c
  401f3e:	90                   	nop
  401f3f:	90                   	nop

00401f40 <_VirtualProtect@16>:
  401f40:	ff 25 28 51 40 00    	jmp    DWORD PTR ds:0x405128
  401f46:	90                   	nop
  401f47:	90                   	nop

00401f48 <___sjlj_init_ctor>:
  401f48:	55                   	push   ebp
  401f49:	89 e5                	mov    ebp,esp
  401f4b:	5d                   	pop    ebp
  401f4c:	e9 6f f3 ff ff       	jmp    4012c0 <___do_sjlj_init>
  401f51:	90                   	nop
  401f52:	90                   	nop
  401f53:	90                   	nop
  401f54:	90                   	nop
  401f55:	90                   	nop
  401f56:	90                   	nop
  401f57:	90                   	nop

00401f58 <__CTOR_LIST__>:
  401f58:	ff                   	(bad)  
  401f59:	ff                   	(bad)  
  401f5a:	ff                   	(bad)  
  401f5b:	ff 48 1f             	dec    DWORD PTR [eax+0x1f]

00401f5c <.ctors>:
  401f5c:	48                   	dec    eax
  401f5d:	1f                   	pop    ds
  401f5e:	40                   	inc    eax
  401f5f:	00 00                	add    BYTE PTR [eax],al
  401f61:	00 00                	add    BYTE PTR [eax],al
	...

00401f64 <__DTOR_LIST__>:
  401f64:	ff                   	(bad)  
  401f65:	ff                   	(bad)  
  401f66:	ff                   	(bad)  
  401f67:	ff 00                	inc    DWORD PTR [eax]
  401f69:	00 00                	add    BYTE PTR [eax],al
	...
