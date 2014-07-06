   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2173                     	switch	.data
2174  0000               _b1000Hz:
2175  0000 00            	dc.b	0
2176  0001               _b100Hz:
2177  0001 00            	dc.b	0
2178  0002               _b10Hz:
2179  0002 00            	dc.b	0
2180  0003               _b5Hz:
2181  0003 00            	dc.b	0
2182  0004               _b2Hz:
2183  0004 00            	dc.b	0
2184  0005               _b1Hz:
2185  0005 00            	dc.b	0
2186  0006               _t0_cnt0:
2187  0006 00            	dc.b	0
2188  0007               _t0_cnt1:
2189  0007 00            	dc.b	0
2190  0008               _t0_cnt2:
2191  0008 00            	dc.b	0
2192  0009               _t0_cnt3:
2193  0009 00            	dc.b	0
2194  000a               _t0_cnt4:
2195  000a 00            	dc.b	0
2196  000b               _bTIME_WRK:
2197  000b 00            	dc.b	0
2198  000c               _time_wrk_cnt_max:
2199  000c 0064          	dc.w	100
2200  000e               _program_stat:
2201  000e 08            	dc.b	8
2202                     .const:	section	.text
2203  0000               _program_steps_max:
2204  0000 06            	dc.b	6
2205  0001 06            	dc.b	6
2206  0002 0c            	dc.b	12
2207  0003 0c            	dc.b	12
2208  0004 0c            	dc.b	12
2209  0005 0c            	dc.b	12
2210  0006 0c            	dc.b	12
2211  0007 06            	dc.b	6
2212  0008 06            	dc.b	6
2213  0009 1c            	dc.b	28
2214  000a 1c            	dc.b	28
2215  000b               _program_repeat_max:
2216  000b 0a            	dc.b	10
2217  000c 0a            	dc.b	10
2218  000d 05            	dc.b	5
2219  000e 05            	dc.b	5
2220  000f 05            	dc.b	5
2221  0010 05            	dc.b	5
2222  0011 05            	dc.b	5
2223  0012 0a            	dc.b	10
2224  0013 0a            	dc.b	10
2225  0014 03            	dc.b	3
2226  0015 03            	dc.b	3
2227  0016               _p1_const:
2228  0016 01            	dc.b	1
2229  0017 02            	dc.b	2
2230  0018 04            	dc.b	4
2231  0019 08            	dc.b	8
2232  001a 10            	dc.b	16
2233  001b 20            	dc.b	32
2234  001c               _p2_const:
2235  001c 20            	dc.b	32
2236  001d 10            	dc.b	16
2237  001e 08            	dc.b	8
2238  001f 04            	dc.b	4
2239  0020 02            	dc.b	2
2240  0021 01            	dc.b	1
2241  0022               _p3_const:
2242  0022 01            	dc.b	1
2243  0023 03            	dc.b	3
2244  0024 07            	dc.b	7
2245  0025 0f            	dc.b	15
2246  0026 1f            	dc.b	31
2247  0027 3f            	dc.b	63
2248  0028 3e            	dc.b	62
2249  0029 3c            	dc.b	60
2250  002a 38            	dc.b	56
2251  002b 30            	dc.b	48
2252  002c 20            	dc.b	32
2253  002d 00            	dc.b	0
2254  002e               _p4_const:
2255  002e 20            	dc.b	32
2256  002f 30            	dc.b	48
2257  0030 38            	dc.b	56
2258  0031 3c            	dc.b	60
2259  0032 3e            	dc.b	62
2260  0033 3f            	dc.b	63
2261  0034 1f            	dc.b	31
2262  0035 0f            	dc.b	15
2263  0036 07            	dc.b	7
2264  0037 03            	dc.b	3
2265  0038 01            	dc.b	1
2266  0039 00            	dc.b	0
2267  003a               _p5_const:
2268  003a 01            	dc.b	1
2269  003b 03            	dc.b	3
2270  003c 02            	dc.b	2
2271  003d 06            	dc.b	6
2272  003e 04            	dc.b	4
2273  003f 0c            	dc.b	12
2274  0040 08            	dc.b	8
2275  0041 18            	dc.b	24
2276  0042 10            	dc.b	16
2277  0043 30            	dc.b	48
2278  0044 20            	dc.b	32
2279  0045 21            	dc.b	33
2280  0046               _p6_const:
2281  0046 20            	dc.b	32
2282  0047 30            	dc.b	48
2283  0048 10            	dc.b	16
2284  0049 18            	dc.b	24
2285  004a 08            	dc.b	8
2286  004b 0c            	dc.b	12
2287  004c 04            	dc.b	4
2288  004d 06            	dc.b	6
2289  004e 02            	dc.b	2
2290  004f 03            	dc.b	3
2291  0050 01            	dc.b	1
2292  0051 21            	dc.b	33
2293  0052               _p7_const:
2294  0052 20            	dc.b	32
2295  0053 21            	dc.b	33
2296  0054 31            	dc.b	49
2297  0055 33            	dc.b	51
2298  0056 3b            	dc.b	59
2299  0057 3f            	dc.b	63
2300  0058 3b            	dc.b	59
2301  0059 33            	dc.b	51
2302  005a 31            	dc.b	49
2303  005b 21            	dc.b	33
2304  005c 20            	dc.b	32
2305  005d 00            	dc.b	0
2306  005e               _p8_const:
2307  005e 3e            	dc.b	62
2308  005f 3d            	dc.b	61
2309  0060 3b            	dc.b	59
2310  0061 37            	dc.b	55
2311  0062 2f            	dc.b	47
2312  0063 1f            	dc.b	31
2313  0064               _p9_const:
2314  0064 1f            	dc.b	31
2315  0065 2f            	dc.b	47
2316  0066 37            	dc.b	55
2317  0067 3b            	dc.b	59
2318  0068 3d            	dc.b	61
2319  0069 3e            	dc.b	62
2320  006a               _p10_const:
2321  006a 00            	dc.b	0
2322  006b 01            	dc.b	1
2323  006c 02            	dc.b	2
2324  006d 04            	dc.b	4
2325  006e 08            	dc.b	8
2326  006f 10            	dc.b	16
2327  0070 20            	dc.b	32
2328  0071 21            	dc.b	33
2329  0072 22            	dc.b	34
2330  0073 24            	dc.b	36
2331  0074 28            	dc.b	40
2332  0075 30            	dc.b	48
2333  0076 31            	dc.b	49
2334  0077 32            	dc.b	50
2335  0078 34            	dc.b	52
2336  0079 38            	dc.b	56
2337  007a 39            	dc.b	57
2338  007b 3a            	dc.b	58
2339  007c 3c            	dc.b	60
2340  007d 3d            	dc.b	61
2341  007e 3e            	dc.b	62
2342  007f 3f            	dc.b	63
2343  0080 3e            	dc.b	62
2344  0081 3c            	dc.b	60
2345  0082 38            	dc.b	56
2346  0083 30            	dc.b	48
2347  0084 20            	dc.b	32
2348  0085 00            	dc.b	0
2349  0086               _p11_const:
2350  0086 00            	dc.b	0
2351  0087 20            	dc.b	32
2352  0088 10            	dc.b	16
2353  0089 08            	dc.b	8
2354  008a 04            	dc.b	4
2355  008b 02            	dc.b	2
2356  008c 01            	dc.b	1
2357  008d 21            	dc.b	33
2358  008e 11            	dc.b	17
2359  008f 09            	dc.b	9
2360  0090 05            	dc.b	5
2361  0091 03            	dc.b	3
2362  0092 23            	dc.b	35
2363  0093 13            	dc.b	19
2364  0094 0b            	dc.b	11
2365  0095 07            	dc.b	7
2366  0096 27            	dc.b	39
2367  0097 17            	dc.b	23
2368  0098 0f            	dc.b	15
2369  0099 2f            	dc.b	47
2370  009a 1f            	dc.b	31
2371  009b 3f            	dc.b	63
2372  009c 1f            	dc.b	31
2373  009d 0f            	dc.b	15
2374  009e 07            	dc.b	7
2375  009f 03            	dc.b	3
2376  00a0 01            	dc.b	1
2377  00a1 00            	dc.b	0
2410                     ; 184 void time_wrk(void)
2410                     ; 185 {
2412                     	switch	.text
2413  0000               _time_wrk:
2417                     ; 186 time_wrk_cnt_max=adc_buff_*2;
2419  0000 ce0001        	ldw	x,_adc_buff_
2420  0003 58            	sllw	x
2421  0004 cf000c        	ldw	_time_wrk_cnt_max,x
2422                     ; 188 time_wrk_cnt++;
2424  0007 ce0026        	ldw	x,_time_wrk_cnt
2425  000a 1c0001        	addw	x,#1
2426  000d cf0026        	ldw	_time_wrk_cnt,x
2427                     ; 189 if(time_wrk_cnt>=time_wrk_cnt_max)
2429  0010 9c            	rvf
2430  0011 ce0026        	ldw	x,_time_wrk_cnt
2431  0014 c3000c        	cpw	x,_time_wrk_cnt_max
2432  0017 2f08          	jrslt	L1441
2433                     ; 191 	time_wrk_cnt=0;
2435  0019 5f            	clrw	x
2436  001a cf0026        	ldw	_time_wrk_cnt,x
2437                     ; 192 	bTIME_WRK=1;
2439  001d 3501000b      	mov	_bTIME_WRK,#1
2440  0021               L1441:
2441                     ; 195 }
2444  0021 81            	ret
2485                     ; 198 void wrk_hndl(void)
2485                     ; 199 {
2486                     	switch	.text
2487  0022               _wrk_hndl:
2491                     ; 200 if(bTIME_WRK)
2493  0022 725d000b      	tnz	_bTIME_WRK
2494  0026 2603          	jrne	L01
2495  0028 cc014a        	jp	L3541
2496  002b               L01:
2497                     ; 202 	program_steps++;
2499  002b 725c0024      	inc	_program_steps
2500                     ; 203 	if(program_steps>=program_steps_max[program_stat])
2502  002f c6000e        	ld	a,_program_stat
2503  0032 5f            	clrw	x
2504  0033 97            	ld	xl,a
2505  0034 d60000        	ld	a,(_program_steps_max,x)
2506  0037 c10024        	cp	a,_program_steps
2507  003a 2228          	jrugt	L5541
2508                     ; 205 		program_steps=0;
2510  003c 725f0024      	clr	_program_steps
2511                     ; 206 		program_repeat++;
2513  0040 725c0023      	inc	_program_repeat
2514                     ; 207 		if(program_repeat>=program_repeat_max[program_stat])
2516  0044 c6000e        	ld	a,_program_stat
2517  0047 5f            	clrw	x
2518  0048 97            	ld	xl,a
2519  0049 d6000b        	ld	a,(_program_repeat_max,x)
2520  004c c10023        	cp	a,_program_repeat
2521  004f 2213          	jrugt	L5541
2522                     ; 209 			program_repeat=0;
2524  0051 725f0023      	clr	_program_repeat
2525                     ; 210 			program_stat++;
2527  0055 725c000e      	inc	_program_stat
2528                     ; 211 			if(program_stat>=MAX_PROGRAM_STAT)program_stat=0;
2530  0059 c6000e        	ld	a,_program_stat
2531  005c a10b          	cp	a,#11
2532  005e 2504          	jrult	L5541
2535  0060 725f000e      	clr	_program_stat
2536  0064               L5541:
2537                     ; 215 	if(program_stat==p1)
2539  0064 725d000e      	tnz	_program_stat
2540  0068 260f          	jrne	L3641
2541                     ; 217 		port_temp=p1_const[program_steps];	
2543  006a c60024        	ld	a,_program_steps
2544  006d 5f            	clrw	x
2545  006e 97            	ld	xl,a
2546  006f d60016        	ld	a,(_p1_const,x)
2547  0072 c70025        	ld	_port_temp,a
2549  0075 ac450145      	jpf	L5641
2550  0079               L3641:
2551                     ; 219 	else if(program_stat==p2)
2553  0079 c6000e        	ld	a,_program_stat
2554  007c a101          	cp	a,#1
2555  007e 260f          	jrne	L7641
2556                     ; 221 		port_temp=p2_const[program_steps];	
2558  0080 c60024        	ld	a,_program_steps
2559  0083 5f            	clrw	x
2560  0084 97            	ld	xl,a
2561  0085 d6001c        	ld	a,(_p2_const,x)
2562  0088 c70025        	ld	_port_temp,a
2564  008b ac450145      	jpf	L5641
2565  008f               L7641:
2566                     ; 223 	else if(program_stat==p3)
2568  008f c6000e        	ld	a,_program_stat
2569  0092 a102          	cp	a,#2
2570  0094 260f          	jrne	L3741
2571                     ; 225 		port_temp=p3_const[program_steps];	
2573  0096 c60024        	ld	a,_program_steps
2574  0099 5f            	clrw	x
2575  009a 97            	ld	xl,a
2576  009b d60022        	ld	a,(_p3_const,x)
2577  009e c70025        	ld	_port_temp,a
2579  00a1 ac450145      	jpf	L5641
2580  00a5               L3741:
2581                     ; 227 	else if(program_stat==p4)
2583  00a5 c6000e        	ld	a,_program_stat
2584  00a8 a103          	cp	a,#3
2585  00aa 260f          	jrne	L7741
2586                     ; 229 		port_temp=p4_const[program_steps];	
2588  00ac c60024        	ld	a,_program_steps
2589  00af 5f            	clrw	x
2590  00b0 97            	ld	xl,a
2591  00b1 d6002e        	ld	a,(_p4_const,x)
2592  00b4 c70025        	ld	_port_temp,a
2594  00b7 ac450145      	jpf	L5641
2595  00bb               L7741:
2596                     ; 231 	else if(program_stat==p5)
2598  00bb c6000e        	ld	a,_program_stat
2599  00be a104          	cp	a,#4
2600  00c0 260d          	jrne	L3051
2601                     ; 233 		port_temp=p5_const[program_steps];	
2603  00c2 c60024        	ld	a,_program_steps
2604  00c5 5f            	clrw	x
2605  00c6 97            	ld	xl,a
2606  00c7 d6003a        	ld	a,(_p5_const,x)
2607  00ca c70025        	ld	_port_temp,a
2609  00cd 2076          	jra	L5641
2610  00cf               L3051:
2611                     ; 235 	else if(program_stat==p6)
2613  00cf c6000e        	ld	a,_program_stat
2614  00d2 a105          	cp	a,#5
2615  00d4 260d          	jrne	L7051
2616                     ; 237 		port_temp=p6_const[program_steps];	
2618  00d6 c60024        	ld	a,_program_steps
2619  00d9 5f            	clrw	x
2620  00da 97            	ld	xl,a
2621  00db d60046        	ld	a,(_p6_const,x)
2622  00de c70025        	ld	_port_temp,a
2624  00e1 2062          	jra	L5641
2625  00e3               L7051:
2626                     ; 239 	else if(program_stat==p7)
2628  00e3 c6000e        	ld	a,_program_stat
2629  00e6 a106          	cp	a,#6
2630  00e8 260d          	jrne	L3151
2631                     ; 241 		port_temp=p7_const[program_steps];	
2633  00ea c60024        	ld	a,_program_steps
2634  00ed 5f            	clrw	x
2635  00ee 97            	ld	xl,a
2636  00ef d60052        	ld	a,(_p7_const,x)
2637  00f2 c70025        	ld	_port_temp,a
2639  00f5 204e          	jra	L5641
2640  00f7               L3151:
2641                     ; 243 	else if(program_stat==p8)
2643  00f7 c6000e        	ld	a,_program_stat
2644  00fa a107          	cp	a,#7
2645  00fc 260d          	jrne	L7151
2646                     ; 245 		port_temp=p8_const[program_steps];	
2648  00fe c60024        	ld	a,_program_steps
2649  0101 5f            	clrw	x
2650  0102 97            	ld	xl,a
2651  0103 d6005e        	ld	a,(_p8_const,x)
2652  0106 c70025        	ld	_port_temp,a
2654  0109 203a          	jra	L5641
2655  010b               L7151:
2656                     ; 247 	else if(program_stat==p9)
2658  010b c6000e        	ld	a,_program_stat
2659  010e a108          	cp	a,#8
2660  0110 260d          	jrne	L3251
2661                     ; 249 		port_temp=p9_const[program_steps];	
2663  0112 c60024        	ld	a,_program_steps
2664  0115 5f            	clrw	x
2665  0116 97            	ld	xl,a
2666  0117 d60064        	ld	a,(_p9_const,x)
2667  011a c70025        	ld	_port_temp,a
2669  011d 2026          	jra	L5641
2670  011f               L3251:
2671                     ; 251 	else if(program_stat==p10)
2673  011f c6000e        	ld	a,_program_stat
2674  0122 a109          	cp	a,#9
2675  0124 260d          	jrne	L7251
2676                     ; 253 		port_temp=p10_const[program_steps];	
2678  0126 c60024        	ld	a,_program_steps
2679  0129 5f            	clrw	x
2680  012a 97            	ld	xl,a
2681  012b d6006a        	ld	a,(_p10_const,x)
2682  012e c70025        	ld	_port_temp,a
2684  0131 2012          	jra	L5641
2685  0133               L7251:
2686                     ; 255 	else if(program_stat==p11)
2688  0133 c6000e        	ld	a,_program_stat
2689  0136 a10a          	cp	a,#10
2690  0138 260b          	jrne	L5641
2691                     ; 257 		port_temp=p11_const[program_steps];	
2693  013a c60024        	ld	a,_program_steps
2694  013d 5f            	clrw	x
2695  013e 97            	ld	xl,a
2696  013f d60086        	ld	a,(_p11_const,x)
2697  0142 c70025        	ld	_port_temp,a
2698  0145               L5641:
2699                     ; 259 	GPIOD->ODR=port_temp;
2701  0145 550025500f    	mov	20495,_port_temp
2702  014a               L3541:
2703                     ; 261 bTIME_WRK=0;
2705  014a 725f000b      	clr	_bTIME_WRK
2706                     ; 262 }
2709  014e 81            	ret
2732                     ; 265 void gpio_init(void)
2732                     ; 266 {
2733                     	switch	.text
2734  014f               _gpio_init:
2738                     ; 269 GPIOD->DDR|=0xff;
2740  014f c65011        	ld	a,20497
2741  0152 aaff          	or	a,#255
2742  0154 c75011        	ld	20497,a
2743                     ; 270 GPIOD->CR1|=0xff;
2745  0157 c65012        	ld	a,20498
2746  015a aaff          	or	a,#255
2747  015c c75012        	ld	20498,a
2748                     ; 271 GPIOD->CR2&=~0xff;
2750  015f c65013        	ld	a,20499
2751  0162 a400          	and	a,#0
2752  0164 c75013        	ld	20499,a
2753                     ; 274 }
2756  0167 81            	ret
2779                     ; 277 void t4_init(void)
2779                     ; 278 {
2780                     	switch	.text
2781  0168               _t4_init:
2785                     ; 279 TIM4->PSCR = 7;
2787  0168 35075347      	mov	21319,#7
2788                     ; 280 TIM4->ARR= 123;
2790  016c 357b5348      	mov	21320,#123
2791                     ; 281 TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
2793  0170 72105343      	bset	21315,#0
2794                     ; 283 TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
2796  0174 35855340      	mov	21312,#133
2797                     ; 284 }
2800  0178 81            	ret
2823                     ; 286 void adc_init(void){
2824                     	switch	.text
2825  0179               _adc_init:
2829                     ; 287 	GPIOB->DDR&=~(1<<2);
2831  0179 72155007      	bres	20487,#2
2832                     ; 288 	GPIOB->CR1&=~(1<<2);
2834  017d 72155008      	bres	20488,#2
2835                     ; 289 	GPIOB->CR2&=~(1<<2);
2837  0181 72155009      	bres	20489,#2
2838                     ; 290 	ADC1->TDRL|=(1<<2);
2840  0185 72145407      	bset	21511,#2
2841                     ; 293 	ADC1->CR2=0x08;
2843  0189 35085402      	mov	21506,#8
2844                     ; 294 	ADC1->CR1=0x40;
2846  018d 35405401      	mov	21505,#64
2847                     ; 295 	ADC1->CSR=0x20+2;
2849  0191 35225400      	mov	21504,#34
2850                     ; 297 	ADC1->CR1|=1;
2852  0195 72105401      	bset	21505,#0
2853                     ; 298 ADC1->CR1|=1;
2855  0199 72105401      	bset	21505,#0
2856                     ; 299 }
2859  019d 81            	ret
2896                     ; 306 @far @interrupt void TIM4_UPD_Interrupt (void) 
2896                     ; 307 {
2898                     	switch	.text
2899  019e               f_TIM4_UPD_Interrupt:
2903                     ; 308 b1000Hz=1;
2905  019e 35010000      	mov	_b1000Hz,#1
2906                     ; 309 if(++t0_cnt0>=10)
2908  01a2 725c0006      	inc	_t0_cnt0
2909  01a6 c60006        	ld	a,_t0_cnt0
2910  01a9 a10a          	cp	a,#10
2911  01ab 2575          	jrult	L5751
2912                     ; 311 	t0_cnt0=0;
2914  01ad 725f0006      	clr	_t0_cnt0
2915                     ; 312 	b100Hz=1;
2917  01b1 35010001      	mov	_b100Hz,#1
2918                     ; 314 	if(++t0_cnt1>=10)
2920  01b5 725c0007      	inc	_t0_cnt1
2921  01b9 c60007        	ld	a,_t0_cnt1
2922  01bc a10a          	cp	a,#10
2923  01be 2508          	jrult	L7751
2924                     ; 316 		t0_cnt1=0;
2926  01c0 725f0007      	clr	_t0_cnt1
2927                     ; 317 		b10Hz=1;
2929  01c4 35010002      	mov	_b10Hz,#1
2930  01c8               L7751:
2931                     ; 320 	if(++t0_cnt2>=20)
2933  01c8 725c0008      	inc	_t0_cnt2
2934  01cc c60008        	ld	a,_t0_cnt2
2935  01cf a114          	cp	a,#20
2936  01d1 2513          	jrult	L1061
2937                     ; 322 		t0_cnt2=0;
2939  01d3 725f0008      	clr	_t0_cnt2
2940                     ; 323 		b5Hz=1;
2942  01d7 35010003      	mov	_b5Hz,#1
2943                     ; 324 		bFL5=!bFL5;
2945  01db 3d03          	tnz	_bFL5
2946  01dd 2604          	jrne	L22
2947  01df a601          	ld	a,#1
2948  01e1 2001          	jra	L42
2949  01e3               L22:
2950  01e3 4f            	clr	a
2951  01e4               L42:
2952  01e4 b703          	ld	_bFL5,a
2953  01e6               L1061:
2954                     ; 327 	if(++t0_cnt3>=50)
2956  01e6 725c0009      	inc	_t0_cnt3
2957  01ea c60009        	ld	a,_t0_cnt3
2958  01ed a132          	cp	a,#50
2959  01ef 2513          	jrult	L3061
2960                     ; 329 		t0_cnt3=0;
2962  01f1 725f0009      	clr	_t0_cnt3
2963                     ; 330 		b2Hz=1;
2965  01f5 35010004      	mov	_b2Hz,#1
2966                     ; 331 		bFL2=!bFL2;		
2968  01f9 3d02          	tnz	_bFL2
2969  01fb 2604          	jrne	L62
2970  01fd a601          	ld	a,#1
2971  01ff 2001          	jra	L03
2972  0201               L62:
2973  0201 4f            	clr	a
2974  0202               L03:
2975  0202 b702          	ld	_bFL2,a
2976  0204               L3061:
2977                     ; 334 	if(++t0_cnt4>=100)
2979  0204 725c000a      	inc	_t0_cnt4
2980  0208 c6000a        	ld	a,_t0_cnt4
2981  020b a164          	cp	a,#100
2982  020d 2513          	jrult	L5751
2983                     ; 336 		t0_cnt4=0;
2985  020f 725f000a      	clr	_t0_cnt4
2986                     ; 337 		b1Hz=1;
2988  0213 35010005      	mov	_b1Hz,#1
2989                     ; 338 		bFL1=!bFL1;
2991  0217 3d01          	tnz	_bFL1
2992  0219 2604          	jrne	L23
2993  021b a601          	ld	a,#1
2994  021d 2001          	jra	L43
2995  021f               L23:
2996  021f 4f            	clr	a
2997  0220               L43:
2998  0220 b701          	ld	_bFL1,a
2999  0222               L5751:
3000                     ; 342 TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
3002  0222 72115344      	bres	21316,#0
3003                     ; 343 return;
3006  0226 80            	iret
3060                     ; 346 @far @interrupt void ADC_EOC_Interrupt (void) {
3061                     	switch	.text
3062  0227               f_ADC_EOC_Interrupt:
3064       00000009      OFST:	set	9
3065  0227 be00          	ldw	x,c_x
3066  0229 89            	pushw	x
3067  022a be00          	ldw	x,c_y
3068  022c 89            	pushw	x
3069  022d be02          	ldw	x,c_lreg+2
3070  022f 89            	pushw	x
3071  0230 be00          	ldw	x,c_lreg
3072  0232 89            	pushw	x
3073  0233 5209          	subw	sp,#9
3076                     ; 356 ADC1->CSR&=~(1<<7);
3078  0235 721f5400      	bres	21504,#7
3079                     ; 358 temp_adc=(((signed long)(ADC1->DRH))*256)+((signed long)(ADC1->DRL));
3081  0239 c65405        	ld	a,21509
3082  023c b703          	ld	c_lreg+3,a
3083  023e 3f02          	clr	c_lreg+2
3084  0240 3f01          	clr	c_lreg+1
3085  0242 3f00          	clr	c_lreg
3086  0244 96            	ldw	x,sp
3087  0245 1c0001        	addw	x,#OFST-8
3088  0248 cd0000        	call	c_rtol
3090  024b c65404        	ld	a,21508
3091  024e 5f            	clrw	x
3092  024f 97            	ld	xl,a
3093  0250 90ae0100      	ldw	y,#256
3094  0254 cd0000        	call	c_umul
3096  0257 96            	ldw	x,sp
3097  0258 1c0001        	addw	x,#OFST-8
3098  025b cd0000        	call	c_ladd
3100  025e 96            	ldw	x,sp
3101  025f 1c0006        	addw	x,#OFST-3
3102  0262 cd0000        	call	c_rtol
3104                     ; 364 adc_buff[adc_cnt]=temp_adc;
3106  0265 c60000        	ld	a,_adc_cnt
3107  0268 5f            	clrw	x
3108  0269 97            	ld	xl,a
3109  026a 58            	sllw	x
3110  026b 1608          	ldw	y,(OFST-1,sp)
3111  026d df0003        	ldw	(_adc_buff,x),y
3112                     ; 369 adc_cnt++;
3114  0270 725c0000      	inc	_adc_cnt
3115                     ; 370 if(adc_cnt>=16)
3117  0274 c60000        	ld	a,_adc_cnt
3118  0277 a110          	cp	a,#16
3119  0279 2504          	jrult	L5361
3120                     ; 372 	adc_cnt=0;
3122  027b 725f0000      	clr	_adc_cnt
3123  027f               L5361:
3124                     ; 376 if((adc_cnt&0x03)==0)
3126  027f c60000        	ld	a,_adc_cnt
3127  0282 a503          	bcp	a,#3
3128  0284 2637          	jrne	L7361
3129                     ; 380 	tempSS=0;
3131  0286 ae0000        	ldw	x,#0
3132  0289 1f08          	ldw	(OFST-1,sp),x
3133  028b ae0000        	ldw	x,#0
3134  028e 1f06          	ldw	(OFST-3,sp),x
3135                     ; 384 	for(i=0;i<16;i++)
3137  0290 0f05          	clr	(OFST-4,sp)
3138  0292               L1461:
3139                     ; 386 		tempSS+=(signed long)adc_buff[i];
3141  0292 7b05          	ld	a,(OFST-4,sp)
3142  0294 5f            	clrw	x
3143  0295 97            	ld	xl,a
3144  0296 58            	sllw	x
3145  0297 de0003        	ldw	x,(_adc_buff,x)
3146  029a cd0000        	call	c_itolx
3148  029d 96            	ldw	x,sp
3149  029e 1c0006        	addw	x,#OFST-3
3150  02a1 cd0000        	call	c_lgadd
3152                     ; 384 	for(i=0;i<16;i++)
3154  02a4 0c05          	inc	(OFST-4,sp)
3157  02a6 7b05          	ld	a,(OFST-4,sp)
3158  02a8 a110          	cp	a,#16
3159  02aa 25e6          	jrult	L1461
3160                     ; 388 	adc_buff_=(signed short)(tempSS>>4);
3162  02ac 96            	ldw	x,sp
3163  02ad 1c0006        	addw	x,#OFST-3
3164  02b0 cd0000        	call	c_ltor
3166  02b3 a604          	ld	a,#4
3167  02b5 cd0000        	call	c_lrsh
3169  02b8 be02          	ldw	x,c_lreg+2
3170  02ba cf0001        	ldw	_adc_buff_,x
3171  02bd               L7361:
3172                     ; 410 }
3175  02bd 5b09          	addw	sp,#9
3176  02bf 85            	popw	x
3177  02c0 bf00          	ldw	c_lreg,x
3178  02c2 85            	popw	x
3179  02c3 bf02          	ldw	c_lreg+2,x
3180  02c5 85            	popw	x
3181  02c6 bf00          	ldw	c_y,x
3182  02c8 85            	popw	x
3183  02c9 bf00          	ldw	c_x,x
3184  02cb 80            	iret
3206                     ; 412 @far @interrupt void TIM1_Ovf_Interrupt (void) 
3206                     ; 413 {
3207                     	switch	.text
3208  02cc               f_TIM1_Ovf_Interrupt:
3212                     ; 415 TIM1->SR1&=~TIM1_SR1_UIF;			
3214  02cc 72115255      	bres	21077,#0
3215                     ; 416 }
3218  02d0 80            	iret
3253                     ; 421 main()
3253                     ; 422 {
3255                     	switch	.text
3256  02d1               _main:
3260                     ; 423 CLK->CKDIVR=0;
3262  02d1 725f50c6      	clr	20678
3263                     ; 425 gpio_init();
3265  02d5 cd014f        	call	_gpio_init
3267                     ; 429 FLASH_DUKR=0xae;
3269  02d8 35ae5064      	mov	_FLASH_DUKR,#174
3270                     ; 430 FLASH_DUKR=0x56;	
3272  02dc 35565064      	mov	_FLASH_DUKR,#86
3273                     ; 434 t4_init();
3275  02e0 cd0168        	call	_t4_init
3277                     ; 435 enableInterrupts();	
3280  02e3 9a            rim
3282                     ; 437 adc_init();
3285  02e4 cd0179        	call	_adc_init
3287  02e7               L7661:
3288                     ; 442 	if(b1000Hz)
3290  02e7 725d0000      	tnz	_b1000Hz
3291  02eb 2707          	jreq	L3761
3292                     ; 444 		b1000Hz=0;
3294  02ed 725f0000      	clr	_b1000Hz
3295                     ; 445 		time_wrk();
3297  02f1 cd0000        	call	_time_wrk
3299  02f4               L3761:
3300                     ; 448 	if(b100Hz)
3302  02f4 725d0001      	tnz	_b100Hz
3303  02f8 2707          	jreq	L5761
3304                     ; 450 		b100Hz=0;
3306  02fa 725f0001      	clr	_b100Hz
3307                     ; 451 		wrk_hndl();	
3309  02fe cd0022        	call	_wrk_hndl
3311  0301               L5761:
3312                     ; 454 	if(b10Hz)
3314  0301 725d0002      	tnz	_b10Hz
3315  0305 2707          	jreq	L7761
3316                     ; 456 		b10Hz=0;
3318  0307 725f0002      	clr	_b10Hz
3319                     ; 457 		adc_init();	
3321  030b cd0179        	call	_adc_init
3323  030e               L7761:
3324                     ; 460 	if(b5Hz)
3326  030e 725d0003      	tnz	_b5Hz
3327  0312 2704          	jreq	L1071
3328                     ; 462 		b5Hz=0;
3330  0314 725f0003      	clr	_b5Hz
3331  0318               L1071:
3332                     ; 466 	if(b2Hz)
3334  0318 725d0004      	tnz	_b2Hz
3335  031c 2704          	jreq	L3071
3336                     ; 468 		b2Hz=0;
3338  031e 725f0004      	clr	_b2Hz
3339  0322               L3071:
3340                     ; 472 	if(b1Hz)
3342  0322 725d0005      	tnz	_b1Hz
3343  0326 27bf          	jreq	L7661
3344                     ; 474 		b1Hz=0;
3346  0328 725f0005      	clr	_b1Hz
3347  032c 20b9          	jra	L7661
3833                     	xdef	_main
3834                     	xdef	f_TIM1_Ovf_Interrupt
3835                     	xdef	f_ADC_EOC_Interrupt
3836                     	xdef	f_TIM4_UPD_Interrupt
3837                     	xdef	_adc_init
3838                     	xdef	_t4_init
3839                     	xdef	_gpio_init
3840                     	xdef	_wrk_hndl
3841                     	xdef	_time_wrk
3842                     	xdef	_p11_const
3843                     	xdef	_p10_const
3844                     	xdef	_p9_const
3845                     	xdef	_p8_const
3846                     	xdef	_p7_const
3847                     	xdef	_p6_const
3848                     	xdef	_p5_const
3849                     	xdef	_p4_const
3850                     	xdef	_p3_const
3851                     	xdef	_p2_const
3852                     	xdef	_p1_const
3853                     	switch	.bss
3854  0000               _adc_cnt:
3855  0000 00            	ds.b	1
3856                     	xdef	_adc_cnt
3857  0001               _adc_buff_:
3858  0001 0000          	ds.b	2
3859                     	xdef	_adc_buff_
3860  0003               _adc_buff:
3861  0003 000000000000  	ds.b	32
3862                     	xdef	_adc_buff
3863  0023               _program_repeat:
3864  0023 00            	ds.b	1
3865                     	xdef	_program_repeat
3866  0024               _program_steps:
3867  0024 00            	ds.b	1
3868                     	xdef	_program_steps
3869                     	xdef	_program_repeat_max
3870                     	xdef	_program_steps_max
3871  0025               _port_temp:
3872  0025 00            	ds.b	1
3873                     	xdef	_port_temp
3874                     	xdef	_program_stat
3875                     	xdef	_time_wrk_cnt_max
3876  0026               _time_wrk_cnt:
3877  0026 0000          	ds.b	2
3878                     	xdef	_time_wrk_cnt
3879                     	xdef	_bTIME_WRK
3880                     	switch	.ubsct
3881  0000               _bFL_:
3882  0000 00            	ds.b	1
3883                     	xdef	_bFL_
3884  0001               _bFL1:
3885  0001 00            	ds.b	1
3886                     	xdef	_bFL1
3887  0002               _bFL2:
3888  0002 00            	ds.b	1
3889                     	xdef	_bFL2
3890  0003               _bFL5:
3891  0003 00            	ds.b	1
3892                     	xdef	_bFL5
3893                     	xdef	_t0_cnt4
3894                     	xdef	_t0_cnt3
3895                     	xdef	_t0_cnt2
3896                     	xdef	_t0_cnt1
3897                     	xdef	_t0_cnt0
3898                     	xdef	_b1Hz
3899                     	xdef	_b2Hz
3900                     	xdef	_b5Hz
3901                     	xdef	_b10Hz
3902                     	xdef	_b100Hz
3903                     	xdef	_b1000Hz
3904                     	xref.b	c_lreg
3905                     	xref.b	c_x
3906                     	xref.b	c_y
3926                     	xref	c_lrsh
3927                     	xref	c_ltor
3928                     	xref	c_lgadd
3929                     	xref	c_itolx
3930                     	xref	c_ladd
3931                     	xref	c_rtol
3932                     	xref	c_umul
3933                     	end
