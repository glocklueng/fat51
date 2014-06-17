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
2201  000e 03            	dc.b	3
2202                     .const:	section	.text
2203  0000               _program_steps_max:
2204  0000 06            	dc.b	6
2205  0001 06            	dc.b	6
2206  0002 0c            	dc.b	12
2207  0003 0c            	dc.b	12
2208  0004 0c            	dc.b	12
2209  0005               _program_repeat_max:
2210  0005 0a            	dc.b	10
2211  0006 0a            	dc.b	10
2212  0007 05            	dc.b	5
2213  0008 05            	dc.b	5
2214  0009 05            	dc.b	5
2215  000a               _p1_const:
2216  000a 01            	dc.b	1
2217  000b 02            	dc.b	2
2218  000c 04            	dc.b	4
2219  000d 08            	dc.b	8
2220  000e 10            	dc.b	16
2221  000f 20            	dc.b	32
2222  0010               _p2_const:
2223  0010 20            	dc.b	32
2224  0011 10            	dc.b	16
2225  0012 08            	dc.b	8
2226  0013 04            	dc.b	4
2227  0014 02            	dc.b	2
2228  0015 01            	dc.b	1
2229  0016               _p3_const:
2230  0016 01            	dc.b	1
2231  0017 03            	dc.b	3
2232  0018 07            	dc.b	7
2233  0019 0f            	dc.b	15
2234  001a 1f            	dc.b	31
2235  001b 3f            	dc.b	63
2236  001c 3e            	dc.b	62
2237  001d 3c            	dc.b	60
2238  001e 38            	dc.b	56
2239  001f 30            	dc.b	48
2240  0020 20            	dc.b	32
2241  0021 00            	dc.b	0
2242  0022               _p4_const:
2243  0022 20            	dc.b	32
2244  0023 30            	dc.b	48
2245  0024 38            	dc.b	56
2246  0025 3c            	dc.b	60
2247  0026 3e            	dc.b	62
2248  0027 3f            	dc.b	63
2249  0028 1f            	dc.b	31
2250  0029 0f            	dc.b	15
2251  002a 07            	dc.b	7
2252  002b 03            	dc.b	3
2253  002c 01            	dc.b	1
2254  002d 00            	dc.b	0
2255  002e               _p5_const:
2256  002e 01            	dc.b	1
2257  002f 03            	dc.b	3
2258  0030 02            	dc.b	2
2259  0031 06            	dc.b	6
2260  0032 04            	dc.b	4
2261  0033 0c            	dc.b	12
2262  0034 08            	dc.b	8
2263  0035 18            	dc.b	24
2264  0036 10            	dc.b	16
2265  0037 30            	dc.b	48
2266  0038 20            	dc.b	32
2267  0039 21            	dc.b	33
2299                     ; 79 void time_wrk(void)
2299                     ; 80 {
2301                     	switch	.text
2302  0000               _time_wrk:
2306                     ; 81 time_wrk_cnt++;
2308  0000 ce0003        	ldw	x,_time_wrk_cnt
2309  0003 1c0001        	addw	x,#1
2310  0006 cf0003        	ldw	_time_wrk_cnt,x
2311                     ; 82 if(time_wrk_cnt>=time_wrk_cnt_max)
2313  0009 9c            	rvf
2314  000a ce0003        	ldw	x,_time_wrk_cnt
2315  000d c3000c        	cpw	x,_time_wrk_cnt_max
2316  0010 2f08          	jrslt	L1441
2317                     ; 84 	time_wrk_cnt=0;
2319  0012 5f            	clrw	x
2320  0013 cf0003        	ldw	_time_wrk_cnt,x
2321                     ; 85 	bTIME_WRK=1;
2323  0016 3501000b      	mov	_bTIME_WRK,#1
2324  001a               L1441:
2325                     ; 88 }
2328  001a 81            	ret
2363                     ; 91 void wrk_hndl(void)
2363                     ; 92 {
2364                     	switch	.text
2365  001b               _wrk_hndl:
2369                     ; 93 if(bTIME_WRK)
2371  001b 725d000b      	tnz	_bTIME_WRK
2372  001f 2603          	jrne	L01
2373  0021 cc00c3        	jp	L3541
2374  0024               L01:
2375                     ; 95 	program_steps++;
2377  0024 725c0001      	inc	_program_steps
2378                     ; 96 	if(program_steps>=program_steps_max[program_stat])
2380  0028 c6000e        	ld	a,_program_stat
2381  002b 5f            	clrw	x
2382  002c 97            	ld	xl,a
2383  002d d60000        	ld	a,(_program_steps_max,x)
2384  0030 c10001        	cp	a,_program_steps
2385  0033 2228          	jrugt	L5541
2386                     ; 98 		program_steps=0;
2388  0035 725f0001      	clr	_program_steps
2389                     ; 99 		program_repeat++;
2391  0039 725c0000      	inc	_program_repeat
2392                     ; 100 		if(program_repeat>=program_repeat_max[program_stat])
2394  003d c6000e        	ld	a,_program_stat
2395  0040 5f            	clrw	x
2396  0041 97            	ld	xl,a
2397  0042 d60005        	ld	a,(_program_repeat_max,x)
2398  0045 c10000        	cp	a,_program_repeat
2399  0048 2213          	jrugt	L5541
2400                     ; 102 			program_repeat=0;
2402  004a 725f0000      	clr	_program_repeat
2403                     ; 103 			program_stat++;
2405  004e 725c000e      	inc	_program_stat
2406                     ; 104 			if(program_stat>=MAX_PROGRAM_STAT)program_stat=0;
2408  0052 c6000e        	ld	a,_program_stat
2409  0055 a105          	cp	a,#5
2410  0057 2504          	jrult	L5541
2413  0059 725f000e      	clr	_program_stat
2414  005d               L5541:
2415                     ; 108 	if(program_stat==p1)
2417  005d 725d000e      	tnz	_program_stat
2418  0061 260d          	jrne	L3641
2419                     ; 110 		port_temp=p1_const[program_steps];	
2421  0063 c60001        	ld	a,_program_steps
2422  0066 5f            	clrw	x
2423  0067 97            	ld	xl,a
2424  0068 d6000a        	ld	a,(_p1_const,x)
2425  006b c70002        	ld	_port_temp,a
2427  006e 204e          	jra	L5641
2428  0070               L3641:
2429                     ; 112 	else if(program_stat==p2)
2431  0070 c6000e        	ld	a,_program_stat
2432  0073 a101          	cp	a,#1
2433  0075 260d          	jrne	L7641
2434                     ; 114 		port_temp=p2_const[program_steps];	
2436  0077 c60001        	ld	a,_program_steps
2437  007a 5f            	clrw	x
2438  007b 97            	ld	xl,a
2439  007c d60010        	ld	a,(_p2_const,x)
2440  007f c70002        	ld	_port_temp,a
2442  0082 203a          	jra	L5641
2443  0084               L7641:
2444                     ; 116 	else if(program_stat==p3)
2446  0084 c6000e        	ld	a,_program_stat
2447  0087 a102          	cp	a,#2
2448  0089 260d          	jrne	L3741
2449                     ; 118 		port_temp=p3_const[program_steps];	
2451  008b c60001        	ld	a,_program_steps
2452  008e 5f            	clrw	x
2453  008f 97            	ld	xl,a
2454  0090 d60016        	ld	a,(_p3_const,x)
2455  0093 c70002        	ld	_port_temp,a
2457  0096 2026          	jra	L5641
2458  0098               L3741:
2459                     ; 120 	else if(program_stat==p4)
2461  0098 c6000e        	ld	a,_program_stat
2462  009b a103          	cp	a,#3
2463  009d 260d          	jrne	L7741
2464                     ; 122 		port_temp=p4_const[program_steps];	
2466  009f c60001        	ld	a,_program_steps
2467  00a2 5f            	clrw	x
2468  00a3 97            	ld	xl,a
2469  00a4 d60022        	ld	a,(_p4_const,x)
2470  00a7 c70002        	ld	_port_temp,a
2472  00aa 2012          	jra	L5641
2473  00ac               L7741:
2474                     ; 124 	else if(program_stat==p5)
2476  00ac c6000e        	ld	a,_program_stat
2477  00af a104          	cp	a,#4
2478  00b1 260b          	jrne	L5641
2479                     ; 126 		port_temp=p5_const[program_steps];	
2481  00b3 c60001        	ld	a,_program_steps
2482  00b6 5f            	clrw	x
2483  00b7 97            	ld	xl,a
2484  00b8 d6002e        	ld	a,(_p5_const,x)
2485  00bb c70002        	ld	_port_temp,a
2486  00be               L5641:
2487                     ; 129 	GPIOD->ODR=port_temp;
2489  00be 550002500f    	mov	20495,_port_temp
2490  00c3               L3541:
2491                     ; 131 bTIME_WRK=0;
2493  00c3 725f000b      	clr	_bTIME_WRK
2494                     ; 132 }
2497  00c7 81            	ret
2520                     ; 135 void gpio_init(void)
2520                     ; 136 {
2521                     	switch	.text
2522  00c8               _gpio_init:
2526                     ; 139 GPIOD->DDR|=0xff;
2528  00c8 c65011        	ld	a,20497
2529  00cb aaff          	or	a,#255
2530  00cd c75011        	ld	20497,a
2531                     ; 140 GPIOD->CR1|=0xff;
2533  00d0 c65012        	ld	a,20498
2534  00d3 aaff          	or	a,#255
2535  00d5 c75012        	ld	20498,a
2536                     ; 141 GPIOD->CR2&=~0xff;
2538  00d8 c65013        	ld	a,20499
2539  00db a400          	and	a,#0
2540  00dd c75013        	ld	20499,a
2541                     ; 144 }
2544  00e0 81            	ret
2567                     ; 147 void t4_init(void)
2567                     ; 148 {
2568                     	switch	.text
2569  00e1               _t4_init:
2573                     ; 149 TIM4->PSCR = 7;
2575  00e1 35075347      	mov	21319,#7
2576                     ; 150 TIM4->ARR= 123;
2578  00e5 357b5348      	mov	21320,#123
2579                     ; 151 TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
2581  00e9 72105343      	bset	21315,#0
2582                     ; 153 TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
2584  00ed 35855340      	mov	21312,#133
2585                     ; 154 }
2588  00f1 81            	ret
2625                     ; 160 @far @interrupt void TIM4_UPD_Interrupt (void) 
2625                     ; 161 {
2627                     	switch	.text
2628  00f2               f_TIM4_UPD_Interrupt:
2632                     ; 162 b1000Hz=1;
2634  00f2 35010000      	mov	_b1000Hz,#1
2635                     ; 163 if(++t0_cnt0>=10)
2637  00f6 725c0006      	inc	_t0_cnt0
2638  00fa c60006        	ld	a,_t0_cnt0
2639  00fd a10a          	cp	a,#10
2640  00ff 2575          	jrult	L5351
2641                     ; 165 	t0_cnt0=0;
2643  0101 725f0006      	clr	_t0_cnt0
2644                     ; 166 	b100Hz=1;
2646  0105 35010001      	mov	_b100Hz,#1
2647                     ; 168 	if(++t0_cnt1>=10)
2649  0109 725c0007      	inc	_t0_cnt1
2650  010d c60007        	ld	a,_t0_cnt1
2651  0110 a10a          	cp	a,#10
2652  0112 2508          	jrult	L7351
2653                     ; 170 		t0_cnt1=0;
2655  0114 725f0007      	clr	_t0_cnt1
2656                     ; 171 		b10Hz=1;
2658  0118 35010002      	mov	_b10Hz,#1
2659  011c               L7351:
2660                     ; 174 	if(++t0_cnt2>=20)
2662  011c 725c0008      	inc	_t0_cnt2
2663  0120 c60008        	ld	a,_t0_cnt2
2664  0123 a114          	cp	a,#20
2665  0125 2513          	jrult	L1451
2666                     ; 176 		t0_cnt2=0;
2668  0127 725f0008      	clr	_t0_cnt2
2669                     ; 177 		b5Hz=1;
2671  012b 35010003      	mov	_b5Hz,#1
2672                     ; 178 		bFL5=!bFL5;
2674  012f 3d03          	tnz	_bFL5
2675  0131 2604          	jrne	L02
2676  0133 a601          	ld	a,#1
2677  0135 2001          	jra	L22
2678  0137               L02:
2679  0137 4f            	clr	a
2680  0138               L22:
2681  0138 b703          	ld	_bFL5,a
2682  013a               L1451:
2683                     ; 181 	if(++t0_cnt3>=50)
2685  013a 725c0009      	inc	_t0_cnt3
2686  013e c60009        	ld	a,_t0_cnt3
2687  0141 a132          	cp	a,#50
2688  0143 2513          	jrult	L3451
2689                     ; 183 		t0_cnt3=0;
2691  0145 725f0009      	clr	_t0_cnt3
2692                     ; 184 		b2Hz=1;
2694  0149 35010004      	mov	_b2Hz,#1
2695                     ; 185 		bFL2=!bFL2;		
2697  014d 3d02          	tnz	_bFL2
2698  014f 2604          	jrne	L42
2699  0151 a601          	ld	a,#1
2700  0153 2001          	jra	L62
2701  0155               L42:
2702  0155 4f            	clr	a
2703  0156               L62:
2704  0156 b702          	ld	_bFL2,a
2705  0158               L3451:
2706                     ; 188 	if(++t0_cnt4>=100)
2708  0158 725c000a      	inc	_t0_cnt4
2709  015c c6000a        	ld	a,_t0_cnt4
2710  015f a164          	cp	a,#100
2711  0161 2513          	jrult	L5351
2712                     ; 190 		t0_cnt4=0;
2714  0163 725f000a      	clr	_t0_cnt4
2715                     ; 191 		b1Hz=1;
2717  0167 35010005      	mov	_b1Hz,#1
2718                     ; 192 		bFL1=!bFL1;
2720  016b 3d01          	tnz	_bFL1
2721  016d 2604          	jrne	L03
2722  016f a601          	ld	a,#1
2723  0171 2001          	jra	L23
2724  0173               L03:
2725  0173 4f            	clr	a
2726  0174               L23:
2727  0174 b701          	ld	_bFL1,a
2728  0176               L5351:
2729                     ; 196 TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
2731  0176 72115344      	bres	21316,#0
2732                     ; 197 return;
2735  017a 80            	iret
2757                     ; 200 @far @interrupt void TIM1_Ovf_Interrupt (void) 
2757                     ; 201 {
2758                     	switch	.text
2759  017b               f_TIM1_Ovf_Interrupt:
2763                     ; 203 TIM1->SR1&=~TIM1_SR1_UIF;			
2765  017b 72115255      	bres	21077,#0
2766                     ; 204 }
2769  017f 80            	iret
2803                     ; 209 main()
2803                     ; 210 {
2805                     	switch	.text
2806  0180               _main:
2810                     ; 211 CLK->CKDIVR=0;
2812  0180 725f50c6      	clr	20678
2813                     ; 213 gpio_init();
2815  0184 cd00c8        	call	_gpio_init
2817                     ; 217 FLASH_DUKR=0xae;
2819  0187 35ae5064      	mov	_FLASH_DUKR,#174
2820                     ; 218 FLASH_DUKR=0x56;	
2822  018b 35565064      	mov	_FLASH_DUKR,#86
2823                     ; 222 t4_init();
2825  018f cd00e1        	call	_t4_init
2827                     ; 223 enableInterrupts();	
2830  0192 9a            rim
2832  0193               L7651:
2833                     ; 228 	if(b1000Hz)
2835  0193 725d0000      	tnz	_b1000Hz
2836  0197 2707          	jreq	L3751
2837                     ; 230 		b1000Hz=0;
2839  0199 725f0000      	clr	_b1000Hz
2840                     ; 231 		time_wrk();
2842  019d cd0000        	call	_time_wrk
2844  01a0               L3751:
2845                     ; 234 	if(b100Hz)
2847  01a0 725d0001      	tnz	_b100Hz
2848  01a4 2707          	jreq	L5751
2849                     ; 236 		b100Hz=0;
2851  01a6 725f0001      	clr	_b100Hz
2852                     ; 237 		wrk_hndl();	
2854  01aa cd001b        	call	_wrk_hndl
2856  01ad               L5751:
2857                     ; 240 	if(b10Hz)
2859  01ad 725d0002      	tnz	_b10Hz
2860  01b1 2704          	jreq	L7751
2861                     ; 242 		b10Hz=0;
2863  01b3 725f0002      	clr	_b10Hz
2864  01b7               L7751:
2865                     ; 246 	if(b5Hz)
2867  01b7 725d0003      	tnz	_b5Hz
2868  01bb 2704          	jreq	L1061
2869                     ; 248 		b5Hz=0;
2871  01bd 725f0003      	clr	_b5Hz
2872  01c1               L1061:
2873                     ; 252 	if(b2Hz)
2875  01c1 725d0004      	tnz	_b2Hz
2876  01c5 2704          	jreq	L3061
2877                     ; 254 		b2Hz=0;
2879  01c7 725f0004      	clr	_b2Hz
2880  01cb               L3061:
2881                     ; 258 	if(b1Hz)
2883  01cb 725d0005      	tnz	_b1Hz
2884  01cf 27c2          	jreq	L7651
2885                     ; 260 		b1Hz=0;
2887  01d1 725f0005      	clr	_b1Hz
2888  01d5 20bc          	jra	L7651
3244                     	xdef	_main
3245                     	xdef	f_TIM1_Ovf_Interrupt
3246                     	xdef	f_TIM4_UPD_Interrupt
3247                     	xdef	_t4_init
3248                     	xdef	_gpio_init
3249                     	xdef	_wrk_hndl
3250                     	xdef	_time_wrk
3251                     	xdef	_p5_const
3252                     	xdef	_p4_const
3253                     	xdef	_p3_const
3254                     	xdef	_p2_const
3255                     	xdef	_p1_const
3256                     	switch	.bss
3257  0000               _program_repeat:
3258  0000 00            	ds.b	1
3259                     	xdef	_program_repeat
3260  0001               _program_steps:
3261  0001 00            	ds.b	1
3262                     	xdef	_program_steps
3263                     	xdef	_program_repeat_max
3264                     	xdef	_program_steps_max
3265  0002               _port_temp:
3266  0002 00            	ds.b	1
3267                     	xdef	_port_temp
3268                     	xdef	_program_stat
3269                     	xdef	_time_wrk_cnt_max
3270  0003               _time_wrk_cnt:
3271  0003 0000          	ds.b	2
3272                     	xdef	_time_wrk_cnt
3273                     	xdef	_bTIME_WRK
3274                     	switch	.ubsct
3275  0000               _bFL_:
3276  0000 00            	ds.b	1
3277                     	xdef	_bFL_
3278  0001               _bFL1:
3279  0001 00            	ds.b	1
3280                     	xdef	_bFL1
3281  0002               _bFL2:
3282  0002 00            	ds.b	1
3283                     	xdef	_bFL2
3284  0003               _bFL5:
3285  0003 00            	ds.b	1
3286                     	xdef	_bFL5
3287                     	xdef	_t0_cnt4
3288                     	xdef	_t0_cnt3
3289                     	xdef	_t0_cnt2
3290                     	xdef	_t0_cnt1
3291                     	xdef	_t0_cnt0
3292                     	xdef	_b1Hz
3293                     	xdef	_b2Hz
3294                     	xdef	_b5Hz
3295                     	xdef	_b10Hz
3296                     	xdef	_b100Hz
3297                     	xdef	_b1000Hz
3317                     	end
