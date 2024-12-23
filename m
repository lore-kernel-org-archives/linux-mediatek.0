Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00435E7718D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 11:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35GGMG3Kgjuuel2wGx5ATWBh5+gwXHKlbWDUjdmtWkk=; b=PLspIgSSVoT4Mg69n079bh2EUS
	99C4+wC9YAJT31owG8rbpV9s+UGmSU0nBb4Yamn++aHDzOhwjnu05QhLlv/leYLdIwoaVPGgOAoc5
	uWLiJBtiw4KqdDOhZw/zxPEHpK1IFetCyoOItyxGVvaHqqnyKdlm6aJabnImwpl5JcxrCDThUbHvp
	IB9nKWFp+V9AYeCiltIYMj+GCqghgglGxtKhxcRjShL/56TVkeUDVLhFY9W7/vxB6vg17Gm0/2f+w
	NDuSKThPNlx75bd9GDPAae24srmbfYiHJxpVRBG6Nq669CXVcmhwcwsC5XYj9GaMOghEM+/VIDqC1
	5lkX8BXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgaX-00000009tmm-3zow;
	Mon, 23 Dec 2024 11:27:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgUz-00000009sza-27Vc;
	Mon, 23 Dec 2024 11:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952880;
	bh=U+h12ja8Ysc0QdvTz+lE2rmCJ9YZC/oOoBL4ZHJWASY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1ChrWZUkAPapKWkQQocX5/tVyCl+dHsUOtL8jiyL9kSMQMpQr7SbhDGjIEnQGBnx
	 ScnR1LKSsULQTrXZXsEKd7n9mmN1piwCR6lqOsBbHCx3ZT7nkIfpMNI4b4oAp/R7qH
	 aeeGeS6n4BFOoavKeyH+/GTgtteJPv9KOAniZrHJhumszd3Qajc+lWQjWc/1s61ZlQ
	 zGYeXns5V9kq5bCdB17VbgMsOu2soKbCuQOxXL3xihot+c+toasjhqLUG24vhN22iT
	 3XjpCfj5AunEV0VPH1NahWqQ62FoGWXmgjoo0pjBuwVXOsk7Q94w/aZXz6rM3gEB39
	 oumVZwOjPmKcA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79D1D17E366D;
	Mon, 23 Dec 2024 12:21:19 +0100 (CET)
Message-ID: <dc21b01f-e89f-42f5-b6d1-f6a00a524235@collabora.com>
Date: Mon, 23 Dec 2024 12:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mt6358-regulator does not probe automatically on MT8183 and
 MT8186 Chromebooks
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <f3c6ea1d-da0f-40cc-ba70-7cabb5c3189f@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f3c6ea1d-da0f-40cc-ba70-7cabb5c3189f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/12/24 16:38, Alper Nebi Yasak ha scritto:
> Hello,
> 
> I'm left with one small problem trying to boot Debian on MT8183 and
> MT8186 Chromebooks (Cozmo and Magneton respectively). I see a lot of
> probe deferrals and get dropped into an initramfs shell. All of them
> get resolved if I run `modprobe mt6358-regulator`, after which I can
> exit the initramfs shell to continue booting.
> 
> It has been happening for a long time, still unsolved as of v6.12 and
> next-20241220. I am using `softdep mediatek-drm pre: mt6358-regulator`
> and so on in /etc/modprobe.d/ to trigger it to probe, as a workaround.
> 
> But I would like if it was solved upstream so distro kernels can work
> "out of the box". Any ideas why isn't it probing automatically, and how
> to make it so it works?
> 
> More info from a serial connection below (on mt8183-kukui-jacuzzi-cozmo):
> 

It's a bit odd, thanks for reporting.

I'll check that next year........ (which is really in 2 weeks anyway, but it's fun
to say)

Btw, that softdep is obviously not right, but I think I shouldn't even have pointed
that out; still, better safe than sorry, anyway.

Cheers,
Angelo

> --------8<-------
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 6.13.0-rc3-next-20241220-deb-00006-g27967b92c9c6 (alpernebbi@ALPER-PC) (aarch64-linux-gnu-gcc (Debian 14.2.0-6) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241215) #2 SMP Sat Dec 21 17:13:28 +03 2024
> [    0.000000] KASLR enabled
> [    0.000000] random: crng init done
> [    0.000000] Machine model: Google cozmo board
> [    0.000000] printk: debug: skip boot console de-registration.
> [    0.000000] efi: UEFI not found.
> [    0.000000] earlycon: mtk8250 at MMIO32 0x0000000011002000 (options '115200n8')
> [    0.000000] printk: legacy bootconsole [mtk8250] enabled
> [    0.000000] OF: reserved mem: 0x00000000ffedb000..0x00000000fffdafff (1024 KiB) map non-reusable ramoops
> [    0.000000] Reserved memory: created DMA memory pool at 0x0000000050000000, size 41 MiB
> [    0.000000] OF: reserved mem: initialized node memory@50000000, compatible id shared-dma-pool
> [    0.000000] OF: reserved mem: 0x0000000050000000..0x00000000528fffff (41984 KiB) nomap non-reusable memory@50000000
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000023fffffff]
> [    0.000000] NODE_DATA(0) allocated [mem 0x23efa4c80-0x23efa83bf]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000023fffffff]
> [    0.000000]   Device   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000004fffffff]
> [    0.000000]   node   0: [mem 0x0000000050000000-0x00000000528fffff]
> [    0.000000]   node   0: [mem 0x0000000052900000-0x00000000545fffff]
> [    0.000000]   node   0: [mem 0x0000000054700000-0x00000000ffdfffff]
> [    0.000000]   node   0: [mem 0x0000000100000000-0x000000023fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000023fffffff]
> [    0.000000] On node 0, zone DMA: 256 pages in unavailable ranges
> [    0.000000] On node 0, zone Normal: 512 pages in unavailable ranges
> [    0.000000] cma: Reserved 64 MiB at 0x00000000fbe00000 on node -1
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> [    0.000000] psci: SMC Calling Convention v1.2
> [    0.000000] percpu: Embedded 32 pages/cpu s94040 r8192 d28840 u131072
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: detected: GIC system register CPU interface
> [    0.000000] CPU features: kernel page table isolation forced ON by KASLR
> [    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
> [    0.000000] CPU features: detected: ARM erratum 845719
> [    0.000000] alternatives: applying boot alternatives
> [    0.000000] Kernel command line: cros_secure kern_guid=a9929630-3087-4788-a049-103dcb7a1baa earlycon keep_bootcon console=tty1 console=ttyS0,115200n8 splash plymouth.ignore-serial-consoles ipv6.disable=1 kasan_multi_shot root=UUID=c16826e5-0b66-4648-87db-8a2601010f0a
> [    0.000000] Unknown kernel command line parameters "cros_secure splash kasan_multi_shot kern_guid=a9929630-3087-4788-a049-103dcb7a1baa", will be passed to user space.
> [    0.000000] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
> [    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
> [    0.000000] Fallback order for Node 0: 0
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2096384
> [    0.000000] Policy zone: Normal
> [    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
> [    0.000000] software IO TLB: area num 8.
> [    0.000000] software IO TLB: mapped [mem 0x00000000f7e00000-0x00000000fbe00000] (64MB)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
> [    0.000000] ftrace: allocating 49134 entries in 192 pages
> [    0.000000] ftrace: allocated 192 pages with 2 groups
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=8.
> [    0.000000]  Rude variant of Tasks RCU enabled.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
> [    0.000000] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
> [    0.000000] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
> [    0.000000] GICv3: 640 SPIs implemented
> [    0.000000] GICv3: 0 Extended SPIs implemented
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] GICv3: GICv3 features: 16 PPIs
> [    0.000000] GICv3: GICD_CTRL.DS=0, SCR_EL3.FIQ=0
> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x000000000c100000
> [    0.000000] GICv3: GIC: PPI partition interrupt-partition-0[0] { /cpus/cpu@0[0] /cpus/cpu@1[1] /cpus/cpu@2[2] /cpus/cpu@3[3] }
> [    0.000000] GICv3: GIC: PPI partition interrupt-partition-1[1] { /cpus/cpu@100[4] /cpus/cpu@101[5] /cpus/cpu@102[6] /cpus/cpu@103[7] }
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.000000] arch_timer: cp15 timer(s) running at 13.00MHz (phys).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x2ff89eacb, max_idle_ns: 440795202429 ns
> [    0.000000] sched_clock: 56 bits at 13MHz, resolution 76ns, wraps every 4398046511101ns
> [    0.009035] Console: colour dummy device 80x25
> [    0.013501] printk: legacy console [tty1] enabled
> [    0.018656] Calibrating delay loop (skipped), value calculated using timer frequency.. 26.00 BogoMIPS (lpj=52000)
> [    0.028976] pid_max: default: 32768 minimum: 301
> [    0.033714] LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,tomoyo,bpf,ima,evm
> [    0.042591] landlock: Up and running.
> [    0.046265] Yama: becoming mindful.
> [    0.049968] AppArmor: AppArmor initialized
> [    0.054137] TOMOYO Linux initialized
> [    0.058187] LSM support for eBPF active
> [    0.062205] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    0.069834] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    0.081920] rcu: Hierarchical SRCU implementation.
> [    0.086740] rcu:     Max phase no-delay instances is 1000.
> [    0.096054] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
> [    0.106017] EFI services will not be available.
> [    0.114589] smp: Bringing up secondary CPUs ...
> [    0.131510] Detected VIPT I-cache on CPU1
> [    0.131572] GICv3: CPU1: found redistributor 1 region 0:0x000000000c120000
> [    0.131615] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
> [    0.147584] Detected VIPT I-cache on CPU2
> [    0.147614] GICv3: CPU2: found redistributor 2 region 0:0x000000000c140000
> [    0.147630] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
> [    0.155578] Detected VIPT I-cache on CPU3
> [    0.155609] GICv3: CPU3: found redistributor 3 region 0:0x000000000c160000
> [    0.155623] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
> [    0.163592] CPU features: detected: Spectre-v2
> [    0.163604] CPU features: detected: Spectre-BHB
> [    0.163609] CPU features: detected: ARM erratum 858921
> [    0.163614] Detected VIPT I-cache on CPU4
> [    0.163662] GICv3: CPU4: found redistributor 100 region 0:0x000000000c180000
> [    0.163671] arch_timer: Enabling local workaround for ARM erratum 858921
> [    0.163683] arch_timer: CPU4: Trapping CNTVCT access
> [    0.163693] CPU4: Booted secondary processor 0x0000000100 [0x410fd092]
> [    0.179494] Detected VIPT I-cache on CPU5
> [    0.179533] GICv3: CPU5: found redistributor 101 region 0:0x000000000c1a0000
> [    0.179541] arch_timer: Enabling local workaround for ARM erratum 858921
> [    0.179549] arch_timer: CPU5: Trapping CNTVCT access
> [    0.179555] CPU5: Booted secondary processor 0x0000000101 [0x410fd092]
> [    0.187597] Detected VIPT I-cache on CPU6
> [    0.187638] GICv3: CPU6: found redistributor 102 region 0:0x000000000c1c0000
> [    0.187646] arch_timer: Enabling local workaround for ARM erratum 858921
> [    0.187655] arch_timer: CPU6: Trapping CNTVCT access
> [    0.187661] CPU6: Booted secondary processor 0x0000000102 [0x410fd092]
> [    0.203603] Detected VIPT I-cache on CPU7
> [    0.203647] GICv3: CPU7: found redistributor 103 region 0:0x000000000c1e0000
> [    0.203655] arch_timer: Enabling local workaround for ARM erratum 858921
> [    0.203663] arch_timer: CPU7: Trapping CNTVCT access
> [    0.203670] CPU7: Booted secondary processor 0x0000000103 [0x410fd092]
> [    0.203769] smp: Brought up 1 node, 8 CPUs
> [    0.391945] SMP: Total of 8 processors activated.
> [    0.396670] CPU: All CPU(s) started at EL2
> [    0.400784] CPU features: detected: 32-bit EL0 Support
> [    0.405945] CPU features: detected: CRC32 instructions
> [    0.411162] alternatives: applying system-wide alternatives
> [    0.435812] node 0 deferred pages initialised in 16ms
> [    0.440969] Memory: 8001644K/8385536K available (15168K kernel code, 3732K rwdata, 6332K rodata, 2752K init, 923K bss, 312244K reserved, 65536K cma-reserved)
> [    0.456786] devtmpfs: initialized
> [    0.468104] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.477967] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
> [    0.485864] 2G module region forced by RANDOMIZE_MODULE_REGION_FULL
> [    0.492197] 0 pages in range for non-PLT usage
> [    0.492201] 517008 pages in range for PLT usage
> [    0.496907] pinctrl core: initialized pinctrl subsystem
> [    0.508334] DMI not present or invalid.
> [    0.514033] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.521221] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
> [    0.528886] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.537405] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.545501] audit: initializing netlink subsys (disabled)
> [    0.551053] audit: type=2000 audit(0.448:1): state=initialized audit_enabled=0 res=1
> [    0.552353] thermal_sys: Registered thermal governor 'fair_share'
> [    0.558855] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.564986] thermal_sys: Registered thermal governor 'step_wise'
> [    0.571029] thermal_sys: Registered thermal governor 'user_space'
> [    0.577069] thermal_sys: Registered thermal governor 'power_allocator'
> [    0.583243] cpuidle: using governor ladder
> [    0.593948] cpuidle: using governor menu
> [    0.598067] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> [    0.605031] ASID allocator initialised with 32768 entries
> [    0.611231] Serial: AMBA PL011 UART driver
> [    0.616158] ------------[ cut here ]------------
> [    0.620808] Missing '#address-cells' in /firmware
> [    0.625569] WARNING: CPU: 7 PID: 1 at drivers/of/base.c:106 of_bus_n_addr_cells+0x94/0xf0
> [    0.633809] Modules linked in:
> [    0.636882] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc3-next-20241220-deb-00006-g27967b92c9c6 #2
> [    0.647122] Hardware name: Google cozmo board (DT)
> [    0.651937] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.658940] pc : of_bus_n_addr_cells+0x94/0xf0
> [    0.663408] lr : of_bus_n_addr_cells+0x94/0xf0
> [    0.667876] sp : ffff80008008ba60
> [    0.671203] x29: ffff80008008ba70 x28: 0000000000000000 x27: 0000000000000000
> [    0.678386] x26: ffff36737efa8de0 x25: ffffdc00aef81e58 x24: ffff36737efa8bf0
> [    0.685567] x23: ffff80008008bb60 x22: ffff80008008bb5c x21: ffffdc00af215b28
> [    0.692747] x20: ffffdc00af922771 x19: ffff36737efa8bf0 x18: 0000000000000006
> [    0.699927] x17: ffffdc00af892610 x16: 00000000f7c75b63 x15: 0720072007200720
> [    0.707108] x14: 0765077207610777 x13: 0720072007200720 x12: ffffdc00af659cd0
> [    0.714288] x11: ffffdc00af601d28 x10: ffffdc00af659d28 x9 : ffffdc00adf04994
> [    0.721468] x8 : 0000000000000001 x7 : 0000000000017fe8 x6 : c0000000ffffefff
> [    0.728648] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : 0000000000000000
> [    0.735828] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff36724028a500
> [    0.743009] Call trace:
> [    0.745463]  of_bus_n_addr_cells+0x94/0xf0 (P)
> [    0.749933]  of_n_addr_cells+0x24/0x38
> [    0.753702]  of_bus_default_count_cells+0x30/0x60
> [    0.758433]  __of_get_address+0xbc/0x1e8
> [    0.762377]  __of_address_to_resource+0x50/0x1c0
> [    0.767019]  of_address_to_resource+0x20/0x40
> [    0.771399]  of_device_alloc+0x84/0x1b8
> [    0.775255]  of_platform_device_create_pdata+0x60/0x148
> [    0.780511]  of_platform_bus_create+0x1c4/0x4d8
> [    0.785066]  of_platform_populate+0x84/0x178
> [    0.789359]  of_platform_default_populate_init+0x94/0x110
> [    0.794791]  do_one_initcall+0x60/0x298
> [    0.798650]  kernel_init_freeable+0x280/0x2f0
> [    0.803031]  kernel_init+0x28/0x150
> [    0.806536]  ret_from_fork+0x10/0x20
> [    0.810131] ---[ end trace 0000000000000000 ]---
> [    0.814786] ------------[ cut here ]------------
> [    0.819429] Missing '#size-cells' in /firmware
> [    0.823918] WARNING: CPU: 7 PID: 1 at drivers/of/base.c:133 of_bus_n_size_cells+0x94/0xf8
> [    0.832150] Modules linked in:
> [    0.835218] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.13.0-rc3-next-20241220-deb-00006-g27967b92c9c6 #2
> [    0.846943] Tainted: [W]=WARN
> [    0.849921] Hardware name: Google cozmo board (DT)
> [    0.854734] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.861737] pc : of_bus_n_size_cells+0x94/0xf8
> [    0.866204] lr : of_bus_n_size_cells+0x94/0xf8
> [    0.870671] sp : ffff80008008ba60
> [    0.873998] x29: ffff80008008ba70 x28: 0000000000000000 x27: 0000000000000000
> [    0.881179] x26: ffff36737efa8de0 x25: ffffdc00aef81e58 x24: ffff36737efa8bf0
> [    0.888359] x23: ffff80008008bb60 x22: ffff80008008bb5c x21: ffffdc00af215b60
> [    0.895540] x20: ffffdc00af922771 x19: ffff36737efa8bf0 x18: 0000000000000006
> [    0.902720] x17: ffffdc00af892610 x16: 00000000f7c75b63 x15: 0720072007200720
> [    0.909900] x14: 0720072007200765 x13: 0720072007200720 x12: ffffdc00af659cd0
> [    0.917081] x11: ffffdc00af601d28 x10: ffffdc00af659d28 x9 : ffffdc00adf04994
> [    0.924261] x8 : 0000000000000001 x7 : 0000000000017fe8 x6 : c0000000ffffefff
> [    0.931441] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : 0000000000000000
> [    0.938621] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff36724028a500
> [    0.945801] Call trace:
> [    0.948254]  of_bus_n_size_cells+0x94/0xf8 (P)
> [    0.952722]  of_n_size_cells+0x24/0x60
> [    0.956491]  of_bus_default_count_cells+0x40/0x60
> [    0.961221]  __of_get_address+0xbc/0x1e8
> [    0.965164]  __of_address_to_resource+0x50/0x1c0
> [    0.969806]  of_address_to_resource+0x20/0x40
> [    0.974186]  of_device_alloc+0x84/0x1b8
> [    0.978042]  of_platform_device_create_pdata+0x60/0x148
> [    0.983297]  of_platform_bus_create+0x1c4/0x4d8
> [    0.987853]  of_platform_populate+0x84/0x178
> [    0.992146]  of_platform_default_populate_init+0x94/0x110
> [    0.997575]  do_one_initcall+0x60/0x298
> [    1.001432]  kernel_init_freeable+0x280/0x2f0
> [    1.005811]  kernel_init+0x28/0x150
> [    1.009316]  ret_from_fork+0x10/0x20
> [    1.012911] ---[ end trace 0000000000000000 ]---
> [    1.023591] /soc/interrupt-controller@c000000: Fixed dependency cycle(s) with /soc/interrupt-controller@c000000
> [    1.033922] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58/aux-bus/panel
> [    1.044440] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/dsi@14014000
> [    1.052774] /soc/i2c@11008000/anx7625@58/aux-bus/panel: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58
> [    1.063452] /soc/dsi@14014000: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58
> [    1.079559] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58/aux-bus/panel
> [    1.090109] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/dsi@14014000
> [    1.098444] /soc/i2c@11008000/anx7625@58/aux-bus/panel: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58
> [    1.114734] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/dsi@14014000
> [    1.123106] /soc/dsi@14014000: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58
> [    1.138430] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> [    1.145287] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
> [    1.151593] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
> [    1.158421] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
> [    1.164725] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    1.171551] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
> [    1.177854] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
> [    1.184681] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
> [    1.192767] ACPI: Interpreter disabled.
> [    1.197439] iommu: Default domain type: Translated
> [    1.202265] iommu: DMA domain TLB invalidation policy: strict mode
> [    1.208909] pps_core: LinuxPPS API ver. 1 registered
> [    1.213911] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    1.223128] PTP clock support registered
> [    1.227100] EDAC MC: Ver: 3.0.0
> [    1.230853] scmi_core: SCMI protocol bus registered
> [    1.236950] NetLabel: Initializing
> [    1.240377] NetLabel:  domain hash size = 128
> [    1.244760] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [    1.250493] NetLabel:  unlabeled traffic allowed by default
> [    1.256230] vgaarb: loaded
> [    1.259322] clocksource: Switched to clocksource arch_sys_counter
> [    1.265838] VFS: Disk quotas dquot_6.6.0
> [    1.269856] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    1.277309] AppArmor: AppArmor Filesystem Enabled
> [    1.282118] pnp: PnP ACPI: disabled
> [    1.289907] NET: Registered PF_INET protocol family
> [    1.295042] IP idents hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    1.307412] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
> [    1.316086] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    1.323961] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
> [    1.332441] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
> [    1.340890] TCP: Hash tables configured (established 65536 bind 65536)
> [    1.347718] MPTCP token hash table entries: 8192 (order: 5, 196608 bytes, linear)
> [    1.355393] UDP hash table entries: 4096 (order: 6, 262144 bytes, linear)
> [    1.362436] UDP-Lite hash table entries: 4096 (order: 6, 262144 bytes, linear)
> [    1.370016] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    1.375747] NET: Registered PF_XDP protocol family
> [    1.380576] PCI: CLS 0 bytes, default 64
> [    1.384706] Trying to unpack rootfs image as initramfs...
> [    1.391531] Initialise system trusted keyrings
> [    1.396092] Key type blacklist registered
> [    1.400279] workingset: timestamp_bits=42 max_order=21 bucket_order=0
> [    1.406839] zbud: loaded
> [    1.409746] fuse: init (API version 7.41)
> [    1.414155] integrity: Platform Keyring initialized
> [    1.419098] integrity: Machine keyring initialized
> [    1.423939] Key type asymmetric registered
> [    1.428064] Asymmetric key parser 'x509' registered
> [    4.497368] Freeing initrd memory: 13520K
> [    4.519431] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
> [    4.526991] io scheduler mq-deadline registered
> [    4.541433] ledtrig-cpu: registered to indicate activity on CPUs
> [    4.547581] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
> [    4.566150] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    4.574627] Serial: AMBA driver
> [    4.578349] msm_serial: driver initialized
> [    4.582568] SuperH (H)SCI(F) driver initialized
> [    4.590039] mousedev: PS/2 mouse device common for all mice
> [    4.599935] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
> [    4.609556] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 (0,8000003f) counters available
> [    4.621770] hw perfevents: enabled with armv8_cortex_a73 PMU driver, 7 (0,8000003f) counters available
> [    4.633609] IPv6: Loaded, but administratively disabled, reboot required to enable
> [    4.641273] mip6: Mobile IPv6
> [    4.644260] mip6: mip6_init: can't add xfrm type(destopt)
> [    4.649716] NET: Registered PF_PACKET protocol family
> [    4.655264] mpls_gso: MPLS GSO support
> [    4.664506] registered taskstats version 1
> [    4.668828] Loading compiled-in X.509 certificates
> [    4.718281] Loaded X.509 cert 'Build time autogenerated kernel key: 8f1018666c39d478c83e31c266cb18fd5514c7a6'
> [    4.733956] Demotion targets for Node 0: null
> [    4.739150] Key type .fscrypt registered
> [    4.743113] Key type fscrypt-provisioning registered
> [    4.824876] Key type encrypted registered
> [    4.828967] AppArmor: AppArmor sha256 policy hashing enabled
> [    4.834713] ima: No TPM chip found, activating TPM-bypass!
> [    4.840238] ima: Allocated hash algorithm: sha256
> [    4.845004] ima: No architecture policies found
> [    4.849600] evm: Initialising EVM extended attributes:
> [    4.854770] evm: security.selinux
> [    4.858102] evm: security.SMACK64 (disabled)
> [    4.862395] evm: security.SMACK64EXEC (disabled)
> [    4.867038] evm: security.SMACK64TRANSMUTE (disabled)
> [    4.872117] evm: security.SMACK64MMAP (disabled)
> [    4.876760] evm: security.apparmor
> [    4.880178] evm: security.ima
> [    4.883156] evm: security.capability
> [    4.886750] evm: HMAC attrs: 0x1
> [    4.899683] clk: Disabling unused clocks
> [    4.903677] PM: genpd: Disabling unused power domains
> [    4.915177] Freeing unused kernel memory: 2752K
> [    4.993054] Checked W+X mappings: passed, no W+X pages found
> [    4.998784] Run /init as init process
> [    5.390760] printk: legacy console [ttyS0] disabled
> [    5.393383] /soc/dsi@14014000: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58
> [    5.404235] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58/aux-bus/panel
> [    5.414853] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/dsi@14014000
> [    5.423586] /soc/i2c@11008000/anx7625@58/aux-bus/panel: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58
> [    5.457937] 11002000.serial: ttyS0 at MMIO 0x11002000 (irq = 239, base_baud = 1625000) is a ST16650V2
> [    5.468139] printk: legacy console [ttyS0] enabled
> [    5.468139] printk: legacy console [ttyS0] enabled
> [    5.502757] 11003000.serial: ttyS1 at MMIO 0x11003000 (irq = 254, base_baud = 1625000) is a ST16650V2
> [    5.506500] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@14008000
> [    5.512294] serial serial0: tty port ttyS1 registered
> [    5.520347] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@14009000
> [    5.502757] 11003000.serial: ttyS1 at MMIO 0x11003000 (irq = 254, base_baud = 1625000) is a ST16650V2
> [    5.506500] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@14008000
> [    5.543758] spi_master spi2: will run message pump with realtime priority
> [    5.551244] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@1400a000
> [    5.512294] serial serial0: tty port ttyS1 registered
> [    5.553636] /soc/pwrap@1000d000/pmic/regulators: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/buck_vs2
> [    5.553662] /soc/pwrap@1000d000/pmic/regulators: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/buck_vdram1
> [    5.520347] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@14009000
> [    5.553676] /soc/pwrap@1000d000/pmic/regulators: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/buck_vs1
> [    5.570356] cros-ec-spi spi2.0: Chrome EC device registered
> [    5.571581] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/rdma@1400b000
> [    5.604761] mt6397-rtc mt6358-rtc: registered as rtc0
> [    5.613749] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/rdma@1400c000
> [    5.543758] spi_master spi2: will run message pump with realtime priority
> [    5.619486] mt6397-rtc mt6358-rtc: setting system clock to 2024-12-21T15:01:33 UTC (1734793293)
> [    5.551244] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@1400a000
> [    5.627686] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/color@1400e000
> [    5.553636] /soc/pwrap@1000d000/pmic/regulators: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/buck_vs2
> [    5.628677] input: cros_ec as /devices/platform/soc/11012000.spi/spi_master/spi2/spi2.0/11012000.spi:cros-ec@0:keyboard-controller/input/input0
> [    5.553662] /soc/pwrap@1000d000/pmic/regulators: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/buck_vdram1
> [    5.630459] input: cros_ec_buttons as /devices/platform/soc/11012000.spi/spi_master/spi2/spi2.0/11012000.spi:cros-ec@0:keyboard-controller/input/input1
> [    5.553676] /soc/pwrap@1000d000/pmic/regulators: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/buck_vs1
> [    5.570356] cros-ec-spi spi2.0: Chrome EC device registered
> [    5.571581] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/rdma@1400b000
> [    5.604761] mt6397-rtc mt6358-rtc: registered as rtc0
> [    5.613749] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/rdma@1400c000
> [    5.619486] mt6397-rtc mt6358-rtc: setting system clock to 2024-12-21T15:01:33 UTC (1734793293)
> [    5.627686] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/color@1400e000
> [    5.628677] input: cros_ec as /devices/platform/soc/11012000.spi/spi_master/spi2/spi2.0/11012000.spi:cros-ec@0:keyboard-controller/input/input0
> [    5.630459] input: cros_ec_buttons as /devices/platform/soc/11012000.spi/spi_master/spi2/spi2.0/11012000.spi:cros-ec@0:keyboard-controller/input/input1
> [    5.805069] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ccorr@1400f000
> [    5.805069] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ccorr@1400f000
> [    5.822041] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/aal@14010000
> [    5.822041] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/aal@14010000
> [    5.838639] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/gamma@14011000
> [    5.838639] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/gamma@14011000
> [    5.869987] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@14008000
> [    5.869987] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@14008000
> [    5.886723] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@14009000
> [    5.886723] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@14009000
> [    5.903475] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@1400a000
> [    5.903475] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ovl@1400a000
> [    5.920109] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/rdma@1400b000
> [    5.920109] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/rdma@1400b000
> [    5.936875] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/rdma@1400c000
> [    5.936875] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/rdma@1400c000
> [    5.953644] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/color@1400e000
> [    5.953644] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/color@1400e000
> [    5.970576] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ccorr@1400f000
> [    5.970576] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/ccorr@1400f000
> [    5.987536] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/aal@14010000
> [    5.987536] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/aal@14010000
> [    6.004138] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/gamma@14011000
> [    6.004138] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/gamma@14011000
> [    6.021179] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/dsi@14014000
> [    6.021179] mediatek-drm mediatek-drm.2.auto: Adding component match for /soc/dsi@14014000
> [    6.119843] raid6: neonx8   gen()  3739 MB/s
> [    6.119843] raid6: neonx8   gen()  3739 MB/s
> [    6.195844] raid6: neonx4   gen()  3682 MB/s
> [    6.195844] raid6: neonx4   gen()  3682 MB/s
> [    6.271825] raid6: neonx2   gen()  3520 MB/s
> [    6.271825] raid6: neonx2   gen()  3520 MB/s
> [    6.347846] raid6: neonx1   gen()  2998 MB/s
> [    6.347846] raid6: neonx1   gen()  2998 MB/s
> [    6.423842] raid6: int64x8  gen()  2276 MB/s
> [    6.423842] raid6: int64x8  gen()  2276 MB/s
> [    6.499842] raid6: int64x4  gen()  2597 MB/s
> [    6.499842] raid6: int64x4  gen()  2597 MB/s
> [    6.575591] raid6: int64x2  gen()  2311 MB/s
> [    6.575591] raid6: int64x2  gen()  2311 MB/s
> [    6.651595] raid6: int64x1  gen()  1679 MB/s
> [    6.651595] raid6: int64x1  gen()  1679 MB/s
> [    6.660143] raid6: using algorithm neonx8 gen() 3739 MB/s
> [    6.660143] raid6: using algorithm neonx8 gen() 3739 MB/s
> [    6.735591] raid6: .... xor() 2736 MB/s, rmw enabled
> [    6.735591] raid6: .... xor() 2736 MB/s, rmw enabled
> [    6.745526] raid6: using neon recovery algorithm
> [    6.745526] raid6: using neon recovery algorithm
> [    6.758748] async_tx: api initialized (async)
> [    6.758748] async_tx: api initialized (async)
> [    6.774789] xor: measuring software checksum speed
> [    6.774789] xor: measuring software checksum speed
> [    6.785092]    8regs           :  4845 MB/sec
> [    6.785092]    8regs           :  4845 MB/sec
> [    6.794486]    32regs          :  4897 MB/sec
> [    6.794486]    32regs          :  4897 MB/sec
> [    6.804086]    arm64_neon      :  3734 MB/sec
> [    6.804086]    arm64_neon      :  3734 MB/sec
> [    6.812810] xor: using function: 32regs (4897 MB/sec)
> [    6.812810] xor: using function: 32regs (4897 MB/sec)
> 
> 
> BusyBox v1.37.0 (Debian 1:1.37.0-4) built-in shell (ash)
> Enter 'help' for a list of built-in commands.
> 
> (initramfs) mount -t debugfs none /sys/kernel/debug
> (initramfs) cat /sys/kernel/debug/devices_deferred
> 14014000.dsi    platform: supplier 10006000.syscon:power-controller not ready
> 1400f000.ccorr  platform: supplier 10006000.syscon:power-controller not ready
> 1400e000.color  platform: supplier 10006000.syscon:power-controller not ready
> 14011000.gamma  platform: supplier 10006000.syscon:power-controller not ready
> 14008000.ovl    platform: supplier 10006000.syscon:power-controller not ready
> 14009000.ovl    platform: supplier 10006000.syscon:power-controller not ready
> 1400a000.ovl    platform: supplier 10006000.syscon:power-controller not ready
> 1400b000.rdma   platform: supplier 10006000.syscon:power-controller not ready
> 1400c000.rdma   platform: supplier 10006000.syscon:power-controller not ready
> backlight_lcd0  platform: supplier 1100e000.pwm not ready
> 4-0058  anx7625: fail to find dsi host.
> 10006000.syscon:power-controller        mtk-power-controller: /soc/syscon@10006000/power-controller/power-domain@2: failed to get power supply.
> 13000000.syscon platform: supplier 10006000.syscon:power-controller not ready
> 10205000.iommu  mtk-iommu: mm dts parse fail
> 14019000.smi    platform: supplier 10006000.syscon:power-controller not ready
> 11201000.usb    platform: wait for supplier /soc/pwrap@1000d000/pmic/regulators/ldo_vusb
> 14017000.larb   platform: supplier 10006000.syscon:power-controller not ready
> 15021000.larb   platform: supplier 10006000.syscon:power-controller not ready
> 1502f000.larb   platform: supplier 10006000.syscon:power-controller not ready
> 16010000.larb   platform: supplier 10006000.syscon:power-controller not ready
> 17010000.larb   platform: supplier 10006000.syscon:power-controller not ready
> 1a001000.larb   platform: supplier 10006000.syscon:power-controller not ready
> 1100e000.pwm    platform: supplier 10006000.syscon:power-controller not ready
> 1a002000.larb   platform: supplier 10006000.syscon:power-controller not ready
> 14016000.mutex  platform: supplier 10006000.syscon:power-controller not ready
> 14010000.aal    platform: supplier 10006000.syscon:power-controller not ready
> 
> (initramfs) lsmod
> Module                  Size  Used by    Tainted: G
> raid10                 69632  0
> raid456               176128  0
> async_raid6_recov      20480  1 raid456
> async_memcpy           16384  2 raid456,async_raid6_recov
> async_pq               16384  2 raid456,async_raid6_recov
> async_xor              16384  3 raid456,async_raid6_recov,async_pq
> xor                    12288  1 async_xor
> xor_neon               16384  1 xor
> async_tx               16384  5 raid456,async_raid6_recov,async_memcpy,async_pq,async_xor
> raid6_pq               98304  3 raid456,async_raid6_recov,async_pq
> raid1                  57344  0
> raid0                  20480  0
> md_mod                167936  4 raid10,raid456,raid1,raid0
> clk_mt8183_mm          12288  1
> evdev                  20480  0
> cros_ec_keyb           16384  0
> matrix_keymap          12288  1 cros_ec_keyb
> rtc_mt6397             12288  1
> extcon_usbc_cros_ec    16384  0
> cros_ec_dev            12288  0
> mt6397                 24576  0
> anx7625                49152  0
> cros_ec_spi            20480  0
> cros_ec                16384  1 cros_ec_spi
> drm_dp_aux_bus         12288  1 anx7625
> mediatek_drm          139264  0
> clk_mt8183_cam         12288  0
> drm_client_lib         12288  1 mediatek_drm
> phy_mtk_tphy           28672  0
> drm_dma_helper         16384  1 mediatek_drm
> clk_mt8183_ipu1        12288  0
> clk_mt8183_ipu_adl     12288  0
> clk_mt8183_ipu0        12288  0
> clk_mt8183_ipu_conn    12288  0
> clk_mt8183_venc        12288  0
> clk_mt8183_vdec        12288  0
> drm_display_helper    143360  2 anx7625,mediatek_drm
> drm_kms_helper        135168  5 anx7625,mediatek_drm,drm_client_lib,drm_dma_helper,drm_display_helper
> clk_mt8183_img         12288  0
> mtu3                  106496  0
> mtk_mutex              20480  1 mediatek_drm
> drm                   487424  6 anx7625,mediatek_drm,drm_client_lib,drm_dma_helper,drm_display_helper,drm_kms_helper
> mtk_mmsys              24576  1 mediatek_drm
> phy_mtk_mipi_dsi_drv    20480  0
> udc_core               53248  1 mtu3
> mtk_smi                20480  0
> clk_mt8183_mfgcfg      12288  0
> mtk_cmdq_helper        16384  3 mediatek_drm,mtk_mutex,mtk_mmsys
> mtk_iommu              32768  0
> pwm_mediatek           12288  0
> pwm_mtk_disp           12288  0
> usb_common             12288  2 mtu3,udc_core
> nvmem_mtk_efuse        12288  0
> clk_mt8183_audio       12288  0
> spi_mt65xx             24576  0
> i2c_mt65xx             28672  0
> mtk_pmic_wrap          36864  0
> mtk_cmdq_mailbox       20480  0
> clk_mt8183_apmixedsys    12288  1 [permanent]
> clk_mt8183             28672 34
> fixed                  16384  7
> pwm_bl                 16384  0
> 
> (initramfs) modprobe mt6358-regulator
> [   84.781724] vsim1: Bringing 1860000uV into 2700000-2700000uV
> [   84.781724] vsim1: Bringing 1860000uV into 2700000-2700000uV
> [   84.817501] mtu3 11201000.usb: uwk - reg:0x420, version:101
> [   84.817501] mtu3 11201000.usb: uwk - reg:0x420, version:101
> [   84.828766] mtu3 11201000.usb: supply vbus not found, using dummy regulator
> [   84.828766] mtu3 11201000.usb: supply vbus not found, using dummy regulator
> [   84.842791] mtu3 11201000.usb: dr_mode: 1, drd: auto
> [   84.842791] mtu3 11201000.usb: dr_mode: 1, drd: auto
> [   84.852738] mtu3 11201000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
> [   84.852738] mtu3 11201000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
> [   84.864451] mtu3 11201000.usb: usb3-drd: 0
> [   84.864451] mtu3 11201000.usb: usb3-drd: 0
> [   84.873689] mtu3 11201000.usb: xHCI platform device register success...
> [   84.873689] mtu3 11201000.usb: xHCI platform device register success...
> [   84.891447] usbcore: registered new interface driver usbfs
> [   84.891447] usbcore: registered new interface driver usbfs
> [   84.898931] mediatek-disp-ovl 14008000.ovl: deferred probe timeout, ignoring dependency
> [   84.902532] usbcore: registered new interface driver hub
> [   84.911333] mediatek-disp-ovl 14009000.ovl: deferred probe timeout, ignoring dependency
> [   84.915850] usbcore: registered new device driver usb
> [   84.924548] mediatek-disp-ovl 1400a000.ovl: deferred probe timeout, ignoring dependency
> [   84.898931] mediatek-disp-ovl 14008000.ovl: deferred probe timeout, ignoring dependency
> [   84.902532] usbcore: registered new interface driver hub
> [   84.911333] mediatek-disp-ovl 14009000.ovl: deferred probe timeout, ignoring dependency
> [   84.915850] usbcore: registered new device driver usb
> [   84.924548] mediatek-disp-ovl 1400a000.ovl: deferred probe timeout, ignoring dependency
> [   84.972360] mediatek-disp-rdma 1400b000.rdma: deferred probe timeout, ignoring dependency
> [   84.972360] mediatek-disp-rdma 1400b000.rdma: deferred probe timeout, ignoring dependency
> [   84.988856] xhci-mtk 11200000.usb: supply vbus not found, using dummy regulator
> [   84.989636] mediatek-disp-rdma 1400c000.rdma: deferred probe timeout, ignoring dependency
> [   84.997012] xhci-mtk 11200000.usb: xHCI Host Controller
> [   85.006737] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58/aux-bus/panel
> [   85.009614] xhci-mtk 11200000.usb: new USB bus registered, assigned bus number 1
> [   85.020130] /soc/i2c@11008000/anx7625@58/aux-bus/panel: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58
> [   85.027514] xhci-mtk 11200000.usb: USB3 root hub has no ports
> [   84.988856] xhci-mtk 11200000.usb: supply vbus not found, using dummy regulator
> [   84.989636] mediatek-disp-rdma 1400c000.rdma: deferred probe timeout, ignoring dependency
> [   84.997012] xhci-mtk 11200000.usb: xHCI Host Controller
> [   85.006737] /soc/i2c@11008000/anx7625@58: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58/aux-bus/panel
> [   85.009614] xhci-mtk 11200000.usb: new USB bus registered, assigned bus number 1
> [   85.020130] /soc/i2c@11008000/anx7625@58/aux-bus/panel: Fixed dependency cycle(s) with /soc/i2c@11008000/anx7625@58
> [   85.027514] xhci-mtk 11200000.usb: USB3 root hub has no ports
> [   85.098588] xhci-mtk 11200000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x0000000000200010
> [   85.098588] xhci-mtk 11200000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x0000000000200010
> [   85.116936] xhci-mtk 11200000.usb: irq 266, io mem 0x11200000
> [   85.116936] xhci-mtk 11200000.usb: irq 266, io mem 0x11200000
> [   85.128660] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
> [   85.128660] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
> [   85.145245] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [   85.145245] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [   85.159716] usb usb1: Product: xHCI Host Controller
> [   85.159716] usb usb1: Product: xHCI Host Controller
> [   85.169485] usb usb1: Manufacturer: Linux 6.13.0-rc3-next-20241220-deb-00006-g27967b92c9c6 xhci-hcd
> [   85.169485] usb usb1: Manufacturer: Linux 6.13.0-rc3-next-20241220-deb-00006-g27967b92c9c6 xhci-hcd
> [   85.187610] usb usb1: SerialNumber: 11200000.usb
> [   85.187610] usb usb1: SerialNumber: 11200000.usb
> [   85.198340] hub 1-0:1.0: USB hub found
> [   85.198340] hub 1-0:1.0: USB hub found
> [   85.205919] hub 1-0:1.0: 1 port detected
> [   85.205919] hub 1-0:1.0: 1 port detected
> [   85.362255] panel-simple-dp-aux aux-4-0058: Detected CMN N140HCA-EAC (0x14d4)
> [   85.362255] panel-simple-dp-aux aux-4-0058: Detected CMN N140HCA-EAC (0x14d4)
> [   85.377287] mediatek-drm mediatek-drm.2.auto: bound 14008000.ovl (ops mtk_drm_exit [mediatek_drm])
> [   85.377287] mediatek-drm mediatek-drm.2.auto: bound 14008000.ovl (ops mtk_drm_exit [mediatek_drm])
> [   85.395274] mediatek-drm mediatek-drm.2.auto: bound 14009000.ovl (ops mtk_drm_exit [mediatek_drm])
> [   85.395274] mediatek-drm mediatek-drm.2.auto: bound 14009000.ovl (ops mtk_drm_exit [mediatek_drm])
> [   85.413239] mediatek-drm mediatek-drm.2.auto: bound 1400a000.ovl (ops mtk_drm_exit [mediatek_drm])
> [   85.413239] mediatek-drm mediatek-drm.2.auto: bound 1400a000.ovl (ops mtk_drm_exit [mediatek_drm])
> [   85.431202] mediatek-drm mediatek-drm.2.auto: bound 1400b000.rdma (ops mtk_drm_exit [mediatek_drm])
> [   85.431202] mediatek-drm mediatek-drm.2.auto: bound 1400b000.rdma (ops mtk_drm_exit [mediatek_drm])
> [   85.449335] mediatek-drm mediatek-drm.2.auto: bound 1400c000.rdma (ops mtk_drm_exit [mediatek_drm])
> [   85.449335] mediatek-drm mediatek-drm.2.auto: bound 1400c000.rdma (ops mtk_drm_exit [mediatek_drm])
> [   85.467468] mediatek-drm mediatek-drm.2.auto: bound 1400e000.color (ops mtk_drm_exit [mediatek_drm])
> [   85.467468] mediatek-drm mediatek-drm.2.auto: bound 1400e000.color (ops mtk_drm_exit [mediatek_drm])
> [   85.485781] mediatek-drm mediatek-drm.2.auto: bound 1400f000.ccorr (ops mtk_drm_exit [mediatek_drm])
> [   85.485781] mediatek-drm mediatek-drm.2.auto: bound 1400f000.ccorr (ops mtk_drm_exit [mediatek_drm])
> [   85.504095] mediatek-drm mediatek-drm.2.auto: bound 14010000.aal (ops mtk_drm_exit [mediatek_drm])
> [   85.504095] mediatek-drm mediatek-drm.2.auto: bound 14010000.aal (ops mtk_drm_exit [mediatek_drm])
> [   85.522057] mediatek-drm mediatek-drm.2.auto: bound 14011000.gamma (ops mtk_drm_exit [mediatek_drm])
> [   85.522057] mediatek-drm mediatek-drm.2.auto: bound 14011000.gamma (ops mtk_drm_exit [mediatek_drm])
> [   85.542472] mediatek-drm mediatek-drm.2.auto: bound 14014000.dsi (ops mtk_drm_exit [mediatek_drm])
> [   85.542472] mediatek-drm mediatek-drm.2.auto: bound 14014000.dsi (ops mtk_drm_exit [mediatek_drm])
> [   85.560640] mediatek-drm mediatek-drm.2.auto: Not creating crtc 1 because component 10 is disabled or missing
> [   85.560640] mediatek-drm mediatek-drm.2.auto: Not creating crtc 1 because component 10 is disabled or missing
> [   85.583418] [drm] Initialized mediatek 1.0.0 for mediatek-drm.2.auto on minor 0
> [   85.583418] [drm] Initialized mediatek 1.0.0 for mediatek-drm.2.auto on minor 0
> [   85.615629] usb 1-1: new high-speed USB device number 2 using xhci-mtk
> [   85.615629] usb 1-1: new high-speed USB device number 2 using xhci-mtk
> [   85.766040] usb 1-1: New USB device found, idVendor=1a40, idProduct=0101, bcdDevice= 1.00
> [   85.766040] usb 1-1: New USB device found, idVendor=1a40, idProduct=0101, bcdDevice= 1.00
> [   85.766058] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
> [   85.766058] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
> [   85.766063] usb 1-1: Product: USB 2.0 Hub [MTT]
> [   85.766063] usb 1-1: Product: USB 2.0 Hub [MTT]
> [   85.767080] hub 1-1:1.0: USB hub found
> [   85.767080] hub 1-1:1.0: USB hub found
> [   85.767128] hub 1-1:1.0: 4 ports detected
> [   85.767128] hub 1-1:1.0: 4 ports detected
> [   85.913599] Console: switching to colour frame buffer device 240x67
> [   85.913599] Console: switching to colour frame buffer device 240x67
> [   86.003114] mediatek-drm mediatek-drm.2.auto: [drm] fb0: mediatekdrmfb frame buffer device
> [   86.003114] mediatek-drm mediatek-drm.2.auto: [drm] fb0: mediatekdrmfb frame buffer device
> [   86.045484] mtk-iommu 10205000.iommu: bound 14017000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.045484] mtk-iommu 10205000.iommu: bound 14017000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.061636] mtk-iommu 10205000.iommu: bound 16010000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.061636] mtk-iommu 10205000.iommu: bound 16010000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.077806] mtk-iommu 10205000.iommu: bound 1502f000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.077806] mtk-iommu 10205000.iommu: bound 1502f000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.093728] mtk-iommu 10205000.iommu: bound 1a002000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.093728] mtk-iommu 10205000.iommu: bound 1a002000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.109632] mtk-iommu 10205000.iommu: bound 17010000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.109632] mtk-iommu 10205000.iommu: bound 17010000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.125531] mtk-iommu 10205000.iommu: bound 15021000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.125531] mtk-iommu 10205000.iommu: bound 15021000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.141432] mtk-iommu 10205000.iommu: bound 1a001000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.141432] mtk-iommu 10205000.iommu: bound 1a001000.larb (ops mtk_smi_exit [mtk_smi])
> [   86.447638] usb 1-1.2: new high-speed USB device number 3 using xhci-mtk
> [   86.447638] usb 1-1.2: new high-speed USB device number 3 using xhci-mtk
> [   86.690318] usb 1-1.2: New USB device found, idVendor=04e8, idProduct=61f5, bcdDevice= 1.00
> [   86.690318] usb 1-1.2: New USB device found, idVendor=04e8, idProduct=61f5, bcdDevice= 1.00
> [   86.707158] usb 1-1.2: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> [   86.707158] usb 1-1.2: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> [   86.721833] usb 1-1.2: Product: Portable SSD T5
> [   86.721833] usb 1-1.2: Product: Portable SSD T5
> [   86.730922] usb 1-1.2: Manufacturer: Samsung
> [   86.730922] usb 1-1.2: Manufacturer: Samsung
> [   86.739487] usb 1-1.2: SerialNumber: 1234567E4FF2
> [   86.739487] usb 1-1.2: SerialNumber: 1234567E4FF2
> [   86.774845] SCSI subsystem initialized
> [   86.774845] SCSI subsystem initialized
> [   86.791580] usbcore: registered new interface driver usb-storage
> [   86.791580] usbcore: registered new interface driver usb-storage
> [   86.814550] scsi host0: uas
> [   86.814550] scsi host0: uas
> [   86.820552] usbcore: registered new interface driver uas
> [   86.821455] scsi 0:0:0:0: Direct-Access     Samsung  Portable SSD T5  0    PQ: 0 ANSI: 6
> [   86.820552] usbcore: registered new interface driver uas
> [   86.821455] scsi 0:0:0:0: Direct-Access     Samsung  Portable SSD T5  0    PQ: 0 ANSI: 6
> [   86.881117] sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
> [   86.881117] sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
> [   86.897532] sd 0:0:0:0: [sda] Write Protect is off
> [   86.897532] sd 0:0:0:0: [sda] Write Protect is off
> [   86.908938] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [   86.908938] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [   86.927787] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
> [   86.927787] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
> [   86.940223] sd 0:0:0:0: [sda] Optimal transfer size 33553920 bytes
> [   86.940310] usb 1-1.3: new high-speed USB device number 4 using xhci-mtk
> [   86.940223] sd 0:0:0:0: [sda] Optimal transfer size 33553920 bytes
> [   86.940310] usb 1-1.3: new high-speed USB device number 4 using xhci-mtk
> [   86.997400]  sda: sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9 sda10
> [   86.997400]  sda: sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9 sda10
> [   87.016593] sd 0:0:0:0: [sda] Attached SCSI disk
> [   87.016593] sd 0:0:0:0: [sda] Attached SCSI disk
> [   87.194979] usb 1-1.3: New USB device found, idVendor=0408, idProduct=a064, bcdDevice= 0.04
> [   87.194979] usb 1-1.3: New USB device found, idVendor=0408, idProduct=a064, bcdDevice= 0.04
> [   87.211821] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [   87.211821] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [   87.226537] usb 1-1.3: Product: HD User Facing
> [   87.226537] usb 1-1.3: Product: HD User Facing
> [   87.235475] usb 1-1.3: Manufacturer: Quanta
> [   87.235475] usb 1-1.3: Manufacturer: Quanta
> 
> (initramfs) exit
> 
> [   91.764596] EXT4-fs (sda4): mounted filesystem c16826e5-0b66-4648-87db-8a2601010f0a ro with ordered data mode. Quota mode: none.
> [   91.764596] EXT4-fs (sda4): mounted filesystem c16826e5-0b66-4648-87db-8a2601010f0a ro with ordered data mode. Quota mode: none.
> [   91.919969] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
> [   91.919969] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
> [   92.677014] systemd[1]: Inserted module 'autofs4'
> [   92.677014] systemd[1]: Inserted module 'autofs4'
> p104
> [   92.755800] systemd[1]: systemd 257.1-3 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
> [   92.755800] systemd[1]: systemd 257.1-3 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
> [   92.826544] systemd[1]: Detected architecture arm64.
> [   92.826544] systemd[1]: Detected architecture arm64.
> 
> Welcome to Debian GNU/Linux trixie/sid!
> 
> [   92.857213] systemd[1]: Hostname set to <DEBIAN-T5-ARM64>.
> [   92.857213] systemd[1]: Hostname set to <DEBIAN-T5-ARM64>.
> [   93.090596] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No such process
> [   93.090596] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No such process
> [   94.011554] systemd[1]: Queued start job for default target graphical.target.
> [   94.011554] systemd[1]: Queued start job for default target graphical.target.
> [   94.089466] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
> [   94.089466] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
> [  OK  ] Created slice system-getty.slice - Slice /system/getty.
> [   94.121486] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
> [   94.121486] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
> [  OK  ] Created slice system-modprobe.slice - Slice /system/modprobe.
> [   94.150133] systemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/serial-getty.
> [   94.150133] systemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/serial-getty.
> [  OK  ] Created slice system-serial\x2dget…slice - Slice /system/serial-getty.
> [   94.185501] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
> [   94.185501] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
> [  OK  ] Created slice system-systemd\x2dfs…slice - Slice /system/systemd-fsck.
> [   94.220931] systemd[1]: Created slice user.slice - User and Session Slice.
> [   94.220931] systemd[1]: Created slice user.slice - User and Session Slice.
> [  OK  ] Created slice user.slice - User and Session Slice.
> [   94.252234] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
> [   94.252234] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
> [  OK  ] Started systemd-ask-password-wall.…d Requests to Wall Directory Watch.
> [   94.292630] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
> [   94.292630] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
> [  OK  ] Set up automount proc-sys-fs-binfm…ormats File System Automount Point.
> [   94.335966] systemd[1]: Expecting device dev-disk-by\x2duuid-605450ef\x2d43fc\x2d41e4\x2d83d7\x2d9c204d5c1c03.device - /dev/disk/by-uuid/605450ef-43fc-41e4-83d7-9c204d5c1c03...
> [   94.335966] systemd[1]: Expecting device dev-disk-by\x2duuid-605450ef\x2d43fc\x2d41e4\x2d83d7\x2d9c204d5c1c03.device - /dev/disk/by-uuid/605450ef-43fc-41e4-83d7-9c204d5c1c03...
>           Expecting device dev-disk-by\x2duu…50ef-43fc-41e4-83d7-9c204d5c1c03...
> [   94.378870] systemd[1]: Expecting device dev-disk-by\x2duuid-92da49dd\x2d921b\x2d4e87\x2d9b65\x2d3ecbd9905707.device - /dev/disk/by-uuid/92da49dd-921b-4e87-9b65-3ecbd9905707...
> [   94.378870] systemd[1]: Expecting device dev-disk-by\x2duuid-92da49dd\x2d921b\x2d4e87\x2d9b65\x2d3ecbd9905707.device - /dev/disk/by-uuid/92da49dd-921b-4e87-9b65-3ecbd9905707...
>           Expecting device dev-disk-by\x2duu…49dd-921b-4e87-9b65-3ecbd9905707...
> [   94.422543] systemd[1]: Expecting device dev-disk-by\x2duuid-9409\x2dDA15.device - /dev/disk/by-uuid/9409-DA15...
> [   94.422543] systemd[1]: Expecting device dev-disk-by\x2duuid-9409\x2dDA15.device - /dev/disk/by-uuid/9409-DA15...
>           Expecting device dev-disk-by\x2duu…ce - /dev/disk/by-uuid/9409-DA15...
> [   94.454676] systemd[1]: Expecting device dev-ttyAMA0.device - /dev/ttyAMA0...
> [   94.454676] systemd[1]: Expecting device dev-ttyAMA0.device - /dev/ttyAMA0...
>           Expecting device dev-ttyAMA0.device - /dev/ttyAMA0...
> [   94.483864] systemd[1]: Expecting device dev-ttyS0.device - /dev/ttyS0...
> [   94.483864] systemd[1]: Expecting device dev-ttyS0.device - /dev/ttyS0...
>           Expecting device dev-ttyS0.device - /dev/ttyS0...
> [   94.511951] systemd[1]: Reached target integritysetup.target - Local Integrity Protected Volumes.
> [   94.511951] systemd[1]: Reached target integritysetup.target - Local Integrity Protected Volumes.
> [  OK  ] Reached target integritysetup.targ… Local Integrity Protected Volumes.
> [   94.547991] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
> [   94.547991] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
> [  OK  ] Reached target nss-user-lookup.target - User and Group Name Lookups.
> [   94.583935] systemd[1]: Reached target remote-fs.target - Remote File Systems.
> [   94.583935] systemd[1]: Reached target remote-fs.target - Remote File Systems.
> [  OK  ] Reached target remote-fs.target - Remote File Systems.
> [   94.615929] systemd[1]: Reached target slices.target - Slice Units.
> [   94.615929] systemd[1]: Reached target slices.target - Slice Units.
> [  OK  ] Reached target slices.target - Slice Units.
> [   94.644013] systemd[1]: Reached target veritysetup.target - Local Verity Protected Volumes.
> [   94.644013] systemd[1]: Reached target veritysetup.target - Local Verity Protected Volumes.
> [  OK  ] Reached target veritysetup.target - Local Verity Protected Volumes.
> [   94.680317] systemd[1]: Listening on dm-event.socket - Device-mapper event daemon FIFOs.
> [   94.680317] systemd[1]: Listening on dm-event.socket - Device-mapper event daemon FIFOs.
> [  OK  ] Listening on dm-event.socket - Device-mapper event daemon FIFOs.
> [   94.716336] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
> [   94.716336] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
> [  OK  ] Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
> [   94.753071] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
> [   94.753071] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
> [  OK  ] Listening on systemd-creds.socket - Credential Encryption/Decryption.
> [   94.788241] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
> [   94.788241] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
> [  OK  ] Listening on systemd-initctl.socke…- initctl Compatibility Named Pipe.
> [   94.824404] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
> [   94.824404] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
> [  OK  ] Listening on systemd-journald-dev-…socket - Journal Socket (/dev/log).
> [   94.860423] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
> [   94.860423] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
> [  OK  ] Listening on systemd-journald.socket - Journal Sockets.
> [   94.891976] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> [   94.891976] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> [   94.921442] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> [   94.921442] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> [   94.950695] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
> [   94.950695] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
> [  OK  ] Listening on systemd-udevd-control.socket - udev Control Socket.
> [   94.984208] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
> [   94.984208] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
> [  OK  ] Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
> [   95.018083] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
> [   95.018083] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
>           Mounting dev-hugepages.mount - Huge Pages File System...
> [   95.089042] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
> [   95.089042] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
>           Mounting dev-mqueue.mount [   95.110680] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
> [ - POSIX Message  Queue File Syste m...
> 95.110680] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
>           Mounting run-lock.mount - Legacy Locks Directory /run/lock...
> [   95.172799] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
> [   95.172799] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
>           Mounting sys-kernel-tracing.mo[   95.194881] systemd[1]: Starting blk-availability.service - Availability of block devices...
> [ unt - Kernel  Trace File System...
>   95.194881] systemd[1]: Starting blk-availability.service - Availability of block devices...
>           Starting blk-availability.service - Availa[   95.224217] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
> [bility of block  devices...
>    95.224217] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
>           Starting keyboard-setup.servic[   95.251756] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
> e - Set the [console keyboard layout...
>     95.251756] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
>           Starting kmod-static-nodes.ser[   95.280582] systemd[1]: Starting lvm2-monitor.service - Monitoring of LVM2 mirrors, snapshots etc.
> using dmeventd or progress polling...
> vice…eate [List of Static Device Nodes...
>     95.280582] systemd[1]: Starting lvm2-monitor.service - Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
>           Starting lvm2-monitor.service  95.316334] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
>    9m - Mo…ing dmeventd or progr ess polling...
>     5.316334] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
>           Starting modprobe@configfs.service - Load Kernel Module configfs...
> [   95.360045] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
> [   95.360045] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
>           Starting modprobe@drm.service - Load Kernel Module drm...
> [   95.389198] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
> [   95.389198] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
>           Starting modprobe@efi_pstore.s[   95.413073] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
> 5rvi… - Lo[   ad Kernel Module9 efi_pstore...
>   .413073] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
>           Startin[   95.440427] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
> g modpr[obe@fuse.service  - Load Kern el Module fuse.. 9.
> 5.440427] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
> [   95.482041] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
> [   95.482041] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
> [   95.555711] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
> [   95.555711] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
> [   95.583976] device-mapper: uevent: version 1.0.3
> [   95.583976] device-mapper: uevent: version 1.0.3
> [   95.595427] systemd[1]: Starting systemd-journald.service - Journal Service...
> [   95.595893] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@lists.linux.dev
> [   95.595427] systemd[1]: Starting systemd-journald.service - Journal Service...
> [   95.595893] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@lists.linux.dev
>           Starting systemd-journald.service - Journal Service...
> [   95.678592] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
> [   95.678592] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
>           Startin[   95.698421] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> g syste[   95.698421] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> md-modules-load.service - Load Kernel Modules...
> [   95.738070] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
> [   95.738070] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
>           Startin[   95.760276] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> [ g syste md-remount-fs.se rvic…unt R95oot and Kernel F.ile Systems...
> 760276] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> [   95.785292] systemd-journald[690]: Collecting audit messages is disabled.
> [   95.785292] systemd-journald[690]: Collecting audit messages is disabled.
> [   95.830316] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
> [   95.830316] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
>           Starting systemd-udev-load-cre[   95.856273] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
>   dent…Load udev Rules from  Credentials...
>    95.856273] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
>           Starting systemd-udev-trigger.service - Coldplug All udev Devices...
> [   95.889609] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
> [   95.893628] EXT4-fs (sda4): re-mounted c16826e5-0b66-4648-87db-8a2601010f0a r/w. Quota mode: none.
> [   95.889609] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
> [   95.893628] EXT4-fs (sda4): re-mounted c16826e5-0b66-4648-87db-8a2601010f0a r/w. Quota mode: none.
> [  OK  ] Mounted dev-hugepages.mount - Huge Pages File System.
> [   95.947212] systemd[1]: Started systemd-journald.service - Journal Service.
> [   95.947212] systemd[1]: Started systemd-journald.service - Journal Service.
> [  OK  ] Started systemd-journald.service - Journal Service.
> [  OK  ] Mounted dev-mqueue.mount - POSIX Message Queue File System.
> [  OK  ] Mounted run-lock.mount - Legacy Locks Directory /run/lock.
> [  OK  ] Mounted sys-kernel-tracing.mount - Kernel Trace File System.
> [  OK  ] Finished blk-availability.service - Availability of block devices.
> [  OK  ] Finished keyboard-setup.service - Set the console keyboard layout.
> [  OK  ] Finished kmod-static-nodes.service…Create List of Static Device Nodes.
> [  OK  ] Finished lvm2-monitor.service - Mo…using dmeventd or progress polling.
> [  OK  ] Finished modprobe@configfs.service - Load Kernel Module configfs.
> [  OK  ] Finished modprobe@drm.service - Load Kernel Module drm.
> [  OK  ] Finished modprobe@efi_pstore.service - Load Kernel Module efi_pstore.
> [  OK  ] Finished modprobe@fuse.service - Load Kernel Module fuse.
> [  OK  ] Finished systemd-modules-load.service - Load Kernel Modules.
> [  OK  ] Finished systemd-remount-fs.servic…mount Root and Kernel File Systems.
> [  OK  ] Finished systemd-udev-load-credent…- Load udev Rules from Credentials.
>           Mounting sys-fs-fuse-connections.mount - FUSE Control File System...
>           Mounting sys-kernel-config.mount - Kernel Configuration File System...
>           Starting systemd-journal-flush.ser…sh Journal to Persistent Storage...
>           Starting systemd-random-seed.service - Load/Save OS Random Seed...
>           Starting syste[   96.346205] systemd-journald[690]: Received client request to flush runtime journal.
> md-sysctl.servic[e - Apply Kernel Variables...
>     96.346205] systemd-journald[690]: Received client request to flush runtime journal.
>           Starting systemd-tmpfiles-setup-de… Device Nodes in /dev gracefully...
> [  OK  ] Finished systemd-udev-trigger.service - Coldplug All udev Devices.
> [  OK  ] Mounted sys-fs-fuse-connections.mount - FUSE Control File System.
> [  OK  ] Mounted sys-kernel-config.mount - Kernel Configuration File System.
>           Starting ifupdown-pre.service - He…synchronize boot up for ifupdown...
> [  OK  ] Finished systemd-sysctl.service - Apply Kernel Variables.
> [  OK  ] Finished ifupdown-pre.service - He…o synchronize boot up for ifupdown.
> [  OK  ] Finished systemd-random-seed.service - Load/Save OS Random Seed.
> [  OK  ] Finished systemd-tmpfiles-setup-de…ic Device Nodes in /dev gracefully.
>           Starting systemd-timesyncd.service - Network Time Synchronization...
>           Starting systemd-tmpfiles-setup-de…eate Static Device Nodes in /dev...
> [  OK  ] Finished systemd-journal-flush.ser…lush Journal to Persistent Storage.
> [  OK  ] Finished systemd-tmpfiles-setup-de…Create Static Device Nodes in /dev.
> [  OK  ] Reached target local-fs-pre.target…Preparation for Local File Systems.
>           Starting systemd-udevd.service - R…ager for Device Events and Files...
> [  OK  ] Started systemd-timesyncd.service - Network Time Synchronization.
> [  OK  ] Reached target time-set.target - System Time Set.
> [  OK  ] Started systemd-udevd.service - Ru…anager for Device Events and Files.
>           Starting plymouth-start.service - Show Plymouth Boot Screen...
> [   97.841625] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [   97.841625] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [   97.858795] pstore: Using crash dump compression: deflate
> [   97.858795] pstore: Using crash dump compression: deflate
> [   97.872253] pstore: Registered ramoops as persistent store backend
> [   97.875829] mtk-ccifreq cci: failed to add devfreq device: -517
> [   97.878550] ramoops: using 0x100000@0xffedb000, ecc: 0
> [   97.872253] pstore: Registered ramoops as persistent store backend
> [   97.875829] mtk-ccifreq cci: failed to add devfreq device: -517
> [   97.878550] ramoops: using 0x100000@0xffedb000, ecc: 0
> [   97.936696] elants_i2c 0-0010: supply vcc33 not found, using dummy regulator
> [   97.942791] mtk-ccifreq cci: failed to add devfreq device: -517
> [   97.947095] tpm_tis_spi spi0.0: TPM ready IRQ confirmed on attempt 2
> [   97.952339] elants_i2c 0-0010: supply vccio not found, using dummy regulator
> [   97.957657] mtk-wdt 10007000.watchdog: Watchdog enabled (timeout=31 sec, nowayout=0)
> [   97.936696] elants_i2c 0-0010: supply vcc33 not found, using dummy regulator
> [   97.973067] tpm_tis_spi spi0.0: 2.0 TPM (device-id 0x28, rev-id 0)
> [   97.942791] mtk-ccifreq cci: failed to add devfreq device: -517
> [   97.991516] elants_i2c 0-0010: nothing at this address
> [   97.947095] tpm_tis_spi spi0.0: TPM ready IRQ confirmed on attempt 2
> [   97.952339] elants_i2c 0-0010: supply vccio not found, using dummy regulator
> [   97.957657] mtk-wdt 10007000.watchdog: Watchdog enabled (timeout=31 sec, nowayout=0)
> [   97.973067] tpm_tis_spi spi0.0: 2.0 TPM (device-id 0x28, rev-id 0)
> [   97.991516] elants_i2c 0-0010: nothing at this address
> [   98.053635] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.053635] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.069764] elan_i2c 2-0015: supply vcc not found, using dummy regulator
> [   98.071998] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.069764] elan_i2c 2-0015: supply vcc not found, using dummy regulator
> [   98.071998] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.099461] ACPI: battery: new hook: cros-charge-control.7.auto
> [   98.100689] usbcore: registered new device driver onboard-usb-dev
> [   98.103988] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.107892] hid: raw HID events driver (C) Jiri Kosina
> [   98.099461] ACPI: battery: new hook: cros-charge-control.7.auto
> [   98.109077] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.100689] usbcore: registered new device driver onboard-usb-dev
> [   98.112499] onboard-usb-dev 11200000.usb:hub@1: supply vdd not found, using dummy regulator
> [   98.113360] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.103988] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.113601] mc: Linux media interface: v0.10
> [   98.107892] hid: raw HID events driver (C) Jiri Kosina
> [   98.145156] tpm_tis_spi spi0.0: Cr50 firmware version: B2-C:0 RO_B:0.0.12/9eb618de RW_B:0.5.241/cr50_v4.11_mp.62-2ef05a
> [   98.109077] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.151245] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.112499] onboard-usb-dev 11200000.usb:hub@1: supply vdd not found, using dummy regulator
> [   98.113360] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.113601] mc: Linux media interface: v0.10
> [   98.145156] tpm_tis_spi spi0.0: Cr50 firmware version: B2-C:0 RO_B:0.0.12/9eb618de RW_B:0.5.241/cr50_v4.11_mp.62-2ef05a
> [   98.151245] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.248837] mtk-scp 10500000.scp: assigned reserved memory node memory@50000000
> [   98.248837] mtk-scp 10500000.scp: assigned reserved memory node memory@50000000
> [   98.275223] videodev: Linux video capture interface: v2.00
> [   98.278002] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: No cache defaults, reading back from HW
> [   98.281709] mt6358-sound mt6358-sound: mt6358_platform_driver_probe(), dev name mt6358-sound
> [   98.288913] i2c_hid_of 2-002c: supply vdd not found, using dummy regulator
> [   98.291402] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: mtk_afe_combine_sub_dai(), num of dai 20
> [   98.291949] i2c_hid_of 2-002c: supply vddl not found, using dummy regulator
> [   98.292954] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.298329] mtk-msdc 11240000.mmc: allocated mmc-pwrseq
> [   98.275223] videodev: Linux video capture interface: v2.00
> [   98.302911] remoteproc remoteproc0: scp is available
> [   98.313865] panfrost 13040000.gpu: clock rate = 511999970
> [   98.278002] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: No cache defaults, reading back from HW
> [   98.316532] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.281709] mt6358-sound mt6358-sound: mt6358_platform_driver_probe(), dev name mt6358-sound
> [   98.325259]  cs_system_cfg: CoreSight Configuration manager initialised
> [   98.288913] i2c_hid_of 2-002c: supply vdd not found, using dummy regulator
> [   98.335602] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.291402] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: mtk_afe_combine_sub_dai(), num of dai 20
> [   98.338264] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
> [   98.291949] i2c_hid_of 2-002c: supply vddl not found, using dummy regulator
> [   98.338282] panfrost 13040000.gpu: features: 00000000,000004f7, issues: 00000000,00000400
> [   98.292954] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.338288] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [   98.298329] mtk-msdc 11240000.mmc: allocated mmc-pwrseq
> [   98.338294] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> [   98.302911] remoteproc remoteproc0: scp is available
> [   98.339164] input: wifi-wakeup as /devices/platform/wifi-wakeup/input/input2
> [   98.313865] panfrost 13040000.gpu: clock rate = 511999970
> [   98.339951] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=00000C00; host->error=0x00000002
> [   98.316532] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.340000] input: volume-buttons as /devices/platform/volume-buttons/input/input3
> [   98.325259]  cs_system_cfg: CoreSight Configuration manager initialised
> [   98.341761] thermal_sys: No trip points found for thermal-sensor1 id=0
> [   98.335602] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.342277] thermal_sys: No trip points found for thermal-sensor2 id=0
> [   98.338264] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
> [   98.343343] [drm] Initialized panfrost 1.3.0 for 13040000.gpu on minor 1
> [   98.338282] panfrost 13040000.gpu: features: 00000000,000004f7, issues: 00000000,00000400
> [   98.338288] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [   98.338294] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> [   98.339164] input: wifi-wakeup as /devices/platform/wifi-wakeup/input/input2
> [   98.339951] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=00000C00; host->error=0x00000002
> [   98.340000] input: volume-buttons as /devices/platform/volume-buttons/input/input3
> [   98.341761] thermal_sys: No trip points found for thermal-sensor1 id=0
> [   98.342277] thermal_sys: No trip points found for thermal-sensor2 id=0
> [   98.343343] [drm] Initialized panfrost 1.3.0 for 13040000.gpu on minor 1
> [   98.605692] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=80000C08; host->error=0x00000002
> [   98.606017] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.605692] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=80000C08; host->error=0x00000002
> [   98.610299] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.644346] remoteproc remoteproc0: powering up scp
> [   98.606017] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.646022] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
> [   98.653349] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
> [   98.659089] remoteproc remoteproc0: Booting fw image mediatek/mt8183/scp.img, size 1030776
> [   98.659113] mtk-scp 10500000.scp: IPI buf addr 0x0007bdb0
> [   98.677929] mtk-msdc 11230000.mmc: Final PAD_DS_TUNE: 0x13014
> [   98.610299] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.681570] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
> [   98.689025] mmc0: Host Software Queue enabled
> [   98.695498] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
> [   98.644346] remoteproc remoteproc0: powering up scp
> [   98.701313] mmc0: new HS400 MMC card at address 0001
> [   98.709352] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.646022] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
> [   98.717623] mmc1: new UHS-I speed SDR104 SDIO card at address 0001
> [   98.736299] mmcblk0: mmc0:0001 DA4064 58.2 GiB
> [   98.745409] coresight-cpu-debug d410000.cpu-debug: Coresight debug-CPU0 initialized
> [   98.748010] mt8183_mt6358_ts3a227 mt8183-sound: mt8183_mt6358_ts3a227_max98357_dev_probe Can't find pin state wov -19
> [   98.754889] alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
> [   98.759282] coresight-cpu-debug d510000.cpu-debug: Coresight debug-CPU1 initialized
> [   98.653349] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
> [   98.762231] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.659089] remoteproc remoteproc0: Booting fw image mediatek/mt8183/scp.img, size 1030776
> [   98.776414] debugfs: Directory '11220000.audio-controller:mt8183-afe-pcm' with parent 'mt8183_mt6358_ts3a227_max98357' already present!
> [   98.779547] mt8183_mt6358_ts3a227 mt8183-sound: ASoC: driver name too long 'mt8183_mt6358_ts3a227_max98357' -> 'mt8183_mt6358_t'
> [   98.659113] mtk-scp 10500000.scp: IPI buf addr 0x0007bdb0
> [   98.781802]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
> [   98.677929] mtk-msdc 11230000.mmc: Final PAD_DS_TUNE: 0x13014
> [   98.783936] mmcblk0boot0: mmc0:0001 DA4064 4.00 MiB
> [   98.681570] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
> [   98.785212] coresight-cpu-debug d610000.cpu-debug: Coresight debug-CPU2 initialized
> [   98.689025] mmc0: Host Software Queue enabled
> [   98.787014] mmcblk0boot1: mmc0:0001 DA4064 4.00 MiB
> [   98.695498] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
> [   98.788848] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.701313] mmc0: new HS400 MMC card at address 0001
> [   98.789879] mmcblk0rpmb: mmc0:0001 DA4064 16.0 MiB, chardev (239:0)
> [   98.709352] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.790380] debugfs: File 'Playback' in directory 'dapm' already present!
> [   98.717623] mmc1: new UHS-I speed SDR104 SDIO card at address 0001
> [   98.790393] debugfs: File 'Capture' in directory 'dapm' already present!
> [   98.792182] input: mt8183_mt6358_ts3a227_max98357 Headset Jack as /devices/platform/mt8183-sound/sound/card0/input4
> [   98.736299] mmcblk0: mmc0:0001 DA4064 58.2 GiB
> [   98.796317] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.745409] coresight-cpu-debug d410000.cpu-debug: Coresight debug-CPU0 initialized
> [   98.797143] coresight-cpu-debug d710000.cpu-debug: Coresight debug-CPU3 initialized
> [   98.748010] mt8183_mt6358_ts3a227 mt8183-sound: mt8183_mt6358_ts3a227_max98357_dev_probe Can't find pin state wov -19
> [   98.801074] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.754889] alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
> [   98.807456] mtk-scp 10500000.scp: creating channel cros-ec-rpmsg addr 0xd
> [   98.759282] coresight-cpu-debug d510000.cpu-debug: Coresight debug-CPU1 initialized
> [   98.807459] mtk-scp 10500000.scp: SCP is ready. FW version kukui_scp_v2.0.13324-280b9fce97
> [   98.762231] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.807473] remoteproc remoteproc0: remote processor scp is now up
> [   98.776414] debugfs: Directory '11220000.audio-controller:mt8183-afe-pcm' with parent 'mt8183_mt6358_ts3a227_max98357' already present!
> [   98.812539] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.821107] coresight-cpu-debug d810000.cpu-debug: Coresight debug-CPU4 initialized
> [   98.821314] coresight-cpu-debug d910000.cpu-debug: Coresight debug-CPU5 initialized
> [   98.779547] mt8183_mt6358_ts3a227 mt8183-sound: ASoC: driver name too long 'mt8183_mt6358_ts3a227_max98357' -> 'mt8183_mt6358_t'
> [   98.827141] Bluetooth: Core ver 2.22
> [   98.781802]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
> [   98.827280] NET: Registered PF_BLUETOOTH protocol family
> [   98.783936] mmcblk0boot0: mmc0:0001 DA4064 4.00 MiB
> [   98.827283] Bluetooth: HCI device and connection manager initialized
> [   98.785212] coresight-cpu-debug d610000.cpu-debug: Coresight debug-CPU2 initialized
> [   98.827612] Bluetooth: HCI socket layer initialized
> [   98.787014] mmcblk0boot1: mmc0:0001 DA4064 4.00 MiB
> [   98.827620] Bluetooth: L2CAP socket layer initialized
> [   98.827638] Bluetooth: SCO socket layer initialized
> [   98.788848] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.835448] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.789879] mmcblk0rpmb: mmc0:0001 DA4064 16.0 MiB, chardev (239:0)
> [   98.842630] coresight-cpu-debug da10000.cpu-debug: Coresight debug-CPU6 initialized
> [   98.790380] debugfs: File 'Playback' in directory 'dapm' already present!
> [   98.845625] usb 1-1.3: Found UVC 1.00 device HD User Facing (0408:a064)
> [   98.790393] debugfs: File 'Capture' in directory 'dapm' already present!
> [   98.846671] mtk-mdp3 14001000.dma-controller0: Adding to iommu group 0
> [   98.792182] input: mt8183_mt6358_ts3a227_max98357 Headset Jack as /devices/platform/mt8183-sound/sound/card0/input4
> [   98.849465] mtk-mdp3 14001000.dma-controller0: can't get SCP node
> [   98.850234] mtk-mdp3 14001000.dma-controller0: Driver registered as /dev/video0
> [   98.866362] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.796317] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.868492] usbcore: registered new interface driver uvcvideo
> [   98.880818] coresight-cpu-debug db10000.cpu-debug: Coresight debug-CPU7 initialized
> [   98.891243] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.797143] coresight-cpu-debug d710000.cpu-debug: Coresight debug-CPU3 initialized
> [   98.978123] mtk-vcodec-enc 17020000.vcodec: Adding to iommu group 0
> [   98.801074] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.023073] Bluetooth: HCI UART driver ver 2.3
> [   99.037096] mtk-jpeg 17030000.jpeg-encoder: Adding to iommu group 0
> [   98.807456] mtk-scp 10500000.scp: creating channel cros-ec-rpmsg addr 0xd
> [   99.041622] Bluetooth: HCI UART protocol H4 registered
> [   98.807459] mtk-scp 10500000.scp: SCP is ready. FW version kukui_scp_v2.0.13324-280b9fce97
> [   99.050610] Bluetooth: HCI UART protocol LL registered
> [   99.084966] mtk-vcodec-dec 16020000.video-codec: Adding to iommu group 0
> [   98.807473] remoteproc remoteproc0: remote processor scp is now up
> [   99.091044] Bluetooth: HCI UART protocol ATH3K registered
> [   98.812539] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.100734] mtk-jpeg 17030000.jpeg-encoder: mtk-jpeg-enc device registered as /dev/video4 (81,4)
> [   98.821107] coresight-cpu-debug d810000.cpu-debug: Coresight debug-CPU4 initialized
> [   99.112987] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [   98.821314] coresight-cpu-debug d910000.cpu-debug: Coresight debug-CPU5 initialized
> [   99.174743] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.827141] Bluetooth: Core ver 2.22
> [   99.179032] Bluetooth: HCI UART protocol Intel registered
> [   98.827280] NET: Registered PF_BLUETOOTH protocol family
> [   99.243610] cros-ec-dev cros-ec-dev.15.auto: CrOS System Control Processor MCU detected
> [   98.827283] Bluetooth: HCI device and connection manager initialized
> [   99.251928] Bluetooth: HCI UART protocol Broadcom registered
> [   98.827612] Bluetooth: HCI socket layer initialized
> [   99.264970] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.827620] Bluetooth: L2CAP socket layer initialized
> [   99.265958] input: hid-over-i2c 06CB:CDB6 Mouse as /devices/platform/soc/11009000.i2c/i2c-2/2-002c/0018:06CB:CDB6.0001/input/input5
> [   99.270786] Bluetooth: HCI UART protocol QCA registered
> [   99.281886] Bluetooth: hci0: setting up ROME/QCA6390
> [   98.827638] Bluetooth: SCO socket layer initialized
> [   99.287459] Bluetooth: HCI UART protocol AG6XX registered
> [   98.835448] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.298100] hid-generic 0018:06CB:CDB6.0001: input,hidraw0: I2C HID v1.00 Mouse [hid-over-i2c 06CB:CDB6] on 2-002c
> [   99.311778] Bluetooth: HCI UART protocol Marvell registered
> [   98.842630] coresight-cpu-debug da10000.cpu-debug: Coresight debug-CPU6 initialized
> [   99.321749] sbs-battery 13-000b: sbs-battery: battery gas gauge device registered
> [   98.845625] usb 1-1.3: Found UVC 1.00 device HD User Facing (0408:a064)
> [   99.327620] cros-ec-rpmsg 10500000.scp.cros-ec-rpmsg.13.-1: Chrome EC device registered
> [   98.846671] mtk-mdp3 14001000.dma-controller0: Adding to iommu group 0
> [   99.329329] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.849465] mtk-mdp3 14001000.dma-controller0: can't get SCP node
> [   99.344911] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [   98.850234] mtk-mdp3 14001000.dma-controller0: Driver registered as /dev/video0
> [   99.345487] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [   98.866362] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.357866] sbs-battery 13-000b: I2C adapter does not support I2C_FUNC_SMBUS_READ_BLOCK_DATA.
> [   99.357866] Fallback method does not support PEC.
> [   98.868492] usbcore: registered new interface driver uvcvideo
> [   99.360871] mtk-ccifreq cci: failed to add devfreq device: -517
> [   98.880818] coresight-cpu-debug db10000.cpu-debug: Coresight debug-CPU7 initialized
> [   99.362492] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
> [   98.891243] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.409645] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: mt8183_adda_dmic_set(), kcontrol name MTKAIF_DMIC, mtkaif_dmic 0
> [   99.506322] Bluetooth: hci0: Frame reassembly failed (-84)
> [   98.978123] mtk-vcodec-enc 17020000.vcodec: Adding to iommu group 0
> [   99.518562] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.023073] Bluetooth: HCI UART driver ver 2.3
> [   99.551815] cfg80211: loaded regulatory.db is malformed or signature is missing/invalid
> [   99.037096] mtk-jpeg 17030000.jpeg-encoder: Adding to iommu group 0
> [   99.701877] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.041622] Bluetooth: HCI UART protocol H4 registered
> [   99.713728] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.050610] Bluetooth: HCI UART protocol LL registered
> [   99.714587] power_supply sbs-13-000b: driver failed to report `constant_charge_voltage_max' property: -6
> [   99.749165] ath10k_sdio mmc1:0001:1: qca6174 hw3.2 sdio target 0x05030000 chip_id 0x00000000 sub 0000:0000
> [   99.782186] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.783174] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> [   99.783339] power_supply sbs-13-000b: driver failed to report `current_avg' property: -6
> [   99.084966] mtk-vcodec-dec 16020000.video-codec: Adding to iommu group 0
> [   99.793963] Bluetooth: hci0: QCA Product ID   :0x00000008
> [   99.091044] Bluetooth: HCI UART protocol ATH3K registered
> [   99.802716] ath10k_sdio mmc1:0001:1: firmware ver WLAN.RMH.4.4.1-00174 api 6 features wowlan,ignore-otp,mfp crc32 7319fa77
> [   99.810897] Bluetooth: hci0: QCA SOC Version  :0x00000044
> [   99.100734] mtk-jpeg 17030000.jpeg-encoder: mtk-jpeg-enc device registered as /dev/video4 (81,4)
> [   99.849289] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.112987] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [   99.850346] Bluetooth: hci0: QCA ROM Version  :0x00000302
> [   99.174743] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.179032] Bluetooth: HCI UART protocol Intel registered
> [   99.243610] cros-ec-dev cros-ec-dev.15.auto: CrOS System Control Processor MCU detected
> [   99.919794] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.926295] Bluetooth: hci0: QCA Patch Version:0x00000111
> [   99.251928] Bluetooth: HCI UART protocol Broadcom registered
> [   99.926303] Bluetooth: hci0: QCA controller version 0x00440302
> [   99.264970] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.265958] input: hid-over-i2c 06CB:CDB6 Mouse as /devices/platform/soc/11009000.i2c/i2c-2/2-002c/0018:06CB:CDB6.0001/input/input5
> [   99.270786] Bluetooth: HCI UART protocol QCA registered
> [   99.281886] Bluetooth: hci0: setting up ROME/QCA6390
> [   99.988099] ath10k_sdio mmc1:0001:1: board_file api 2 bmi_id 0:4 crc32 d2863f91
> [   99.990823] Bluetooth: hci0: QCA Downloading qca/rampatch_00440302.bin
> [   99.287459] Bluetooth: HCI UART protocol AG6XX registered
> [   99.993154] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.298100] hid-generic 0018:06CB:CDB6.0001: input,hidraw0: I2C HID v1.00 Mouse [hid-over-i2c 06CB:CDB6] on 2-002c
> [   99.311778] Bluetooth: HCI UART protocol Marvell registered
> [   99.321749] sbs-battery 13-000b: sbs-battery: battery gas gauge device registered
> [  100.048847] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.327620] cros-ec-rpmsg 10500000.scp.cros-ec-rpmsg.13.-1: Chrome EC device registered
> [   99.329329] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.344911] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [   99.345487] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [   99.357866] sbs-battery 13-000b: I2C adapter does not support I2C_FUNC_SMBUS_READ_BLOCK_DATA.
> [   99.357866] Fallback method does not support PEC.
> [  100.103790] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.360871] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.362492] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
> [   99.409645] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: mt8183_adda_dmic_set(), kcontrol name MTKAIF_DMIC, mtkaif_dmic 0
> [   99.506322] Bluetooth: hci0: Frame reassembly failed (-84)
> [   99.518562] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.551815] cfg80211: loaded regulatory.db is malformed or signature is missing/invalid
> [   99.701877] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.713728] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.714587] power_supply sbs-13-000b: driver failed to report `constant_charge_voltage_max' property: -6
> [  100.197412] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3510-001, fw id: 2998990
> [   99.749165] ath10k_sdio mmc1:0001:1: qca6174 hw3.2 sdio target 0x05030000 chip_id 0x00000000 sub 0000:0000
> [   99.782186] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.783174] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> [   99.783339] power_supply sbs-13-000b: driver failed to report `current_avg' property: -6
> [   99.793963] Bluetooth: hci0: QCA Product ID   :0x00000008
> [  100.261367] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.802716] ath10k_sdio mmc1:0001:1: firmware ver WLAN.RMH.4.4.1-00174 api 6 features wowlan,ignore-otp,mfp crc32 7319fa77
> [  100.276460] mtk-ccifreq cci: failed to add devfreq device: -517
> [   99.810897] Bluetooth: hci0: QCA SOC Version  :0x00000044
> [   99.849289] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.850346] Bluetooth: hci0: QCA ROM Version  :0x00000302
> [   99.919794] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.926295] Bluetooth: hci0: QCA Patch Version:0x00000111
> [   99.926303] Bluetooth: hci0: QCA controller version 0x00440302
> [   99.988099] ath10k_sdio mmc1:0001:1: board_file api 2 bmi_id 0:4 crc32 d2863f91
> [  100.341315] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [   99.990823] Bluetooth: hci0: QCA Downloading qca/rampatch_00440302.bin
> [   99.993154] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [  100.048847] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [  100.377998] mtk-ccifreq cci: failed to add devfreq device: -517
> [  100.103790] mtk-ccifreq cci: failed to add devfreq device: -517
> [  100.197412] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3510-001, fw id: 2998990
> [  100.261367] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [  100.276460] mtk-ccifreq cci: failed to add devfreq device: -517
> [  100.420178] input: Synaptics TM3510-001 as /devices/platform/soc/11009000.i2c/i2c-2/2-002c/0018:06CB:CDB6.0001/input/input7
> [  100.420456] Bluetooth: hci0: Frame reassembly failed (-84)
> [  100.424930] ath10k_sdio mmc1:0001:1: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> [  100.341315] power_supply sbs-13-000b: driver failed to report `time_to_empty_now' property: -5
> [  100.431312] mtk-ccifreq cci: failed to add devfreq device: -517
> [  100.437510] hid-rmi 0018:06CB:CDB6.0001: input,hidraw0: I2C HID v1.00 Mouse [hid-over-i2c 06CB:CDB6] on 2-002c
> [  100.377998] mtk-ccifreq cci: failed to add devfreq device: -517
> [  100.467827] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=00000C00; host->error=0x00000002
> [  100.420178] input: Synaptics TM3510-001 as /devices/platform/soc/11009000.i2c/i2c-2/2-002c/0018:06CB:CDB6.0001/input/input7
> [  100.420456] Bluetooth: hci0: Frame reassembly failed (-84)
> [  100.424930] ath10k_sdio mmc1:0001:1: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> [  100.431312] mtk-ccifreq cci: failed to add devfreq device: -517
> [  100.437510] hid-rmi 0018:06CB:CDB6.0001: input,hidraw0: I2C HID v1.00 Mouse [hid-over-i2c 06CB:CDB6] on 2-002c
> [  100.467827] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=00000C00; host->error=0x00000002
> [  100.650347] mtk-ccifreq cci: failed to add devfreq device: -517
> [  100.650772] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=80000C08; host->error=0x00000002
> [  100.650347] mtk-ccifreq cci: failed to add devfreq device: -517
> [  100.667817] Bluetooth: hci0: QCA Downloading qca/nvm_00440302_i2s.bin
> [  100.676307] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=8 arg=000001AA; host->error=0x00000002
> [  100.650772] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=80000C08; host->error=0x00000002
> [  100.667817] Bluetooth: hci0: QCA Downloading qca/nvm_00440302_i2s.bin
> [  100.676307] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=8 arg=000001AA; host->error=0x00000002
> [  100.725077] bluetooth hci0: Direct firmware load for qca/nvm_00440302_i2s.bin failed with error -2
> [  100.725077] bluetooth hci0: Direct firmware load for qca/nvm_00440302_i2s.bin failed with error -2
> [  100.725100] Bluetooth: hci0: QCA Failed to request file: qca/nvm_00440302_i2s.bin (-2)
> [  100.725100] Bluetooth: hci0: QCA Failed to request file: qca/nvm_00440302_i2s.bin (-2)
> [  100.725106] Bluetooth: hci0: QCA Failed to download NVM (-2)
> [  100.725106] Bluetooth: hci0: QCA Failed to download NVM (-2)
> [  100.755303] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
> [  100.755303] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
> [  100.804808] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
> [  100.804808] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
> [  100.807990] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
> [  100.807990] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
> [  100.808624] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
> [  100.808624] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
> [  OK  ] Reached target tpm2.target - Trusted Platform Module.
> [  OK  ] Listening on systemd-rfkill.socket…ll Switch Status /dev/rfkill Watch.
>           Activating swap dev-disk-by\x2duui…49dd-921b-4e87-9b65-3ecbd9905707...
>           Starting modprobe@efi_pstore.servi… - Load Kernel Module efi_pstore...
>           Starting plymouth-start.service - Show Plymouth Boot Screen...
>           Starting systemd-fsck@dev-disk-by\…50ef-43fc-41e4-83d7-9c204d5c1c03...
> [  101.705665] Adding 31457276k swap on /dev/sda6.  Priority:-2 extents:1 across:31457276k SS
> [  101.705665] Adding 31457276k swap on /dev/sda6.  Priority:-2 extents:1 across:31457276k SS
> [  102.263862] EXT4-fs (sda2): mounted filesystem 605450ef-43fc-41e4-83d7-9c204d5c1c03 r/w with ordered data mode. Quota mode: none.
> [  102.263862] EXT4-fs (sda2): mounted filesystem 605450ef-43fc-41e4-83d7-9c204d5c1c03 r/w with ordered data mode. Quota mode: none.
> [  OK  ] Mounted home.mount - /home.
> [  OK  ] Finished systemd-fsck@dev-disk-by\…eck on /dev/disk/by-uuid/9409-DA15.
>           Mounting boot-efi.mount - /boot/efi...
> [  OK  ] Mounted boot-efi.mount - /boot/efi.
> [  OK  ] Reached target local-fs.target - Local File Systems.
> [  OK  ] Listening on systemd-sysext.socket… System Extension Image Management.
>           Starting apparmor.service - Load AppArmor profiles...
>           Starting console-setup.service - Set console font and keymap...
>           Starting plymouth-read-write.servi…ymouth To Write Out Runtime Data...
>           Starting systemd-binfmt.service - Set Up Additional Binary Formats...
>           Starting systemd-tmpfiles-setup.se…ate System Files and Directories...
> [  OK  ] Finished console-setup.service - Set console font and keymap.
> [  OK  ] Finished plymouth-read-write.servi…Plymouth To Write Out Runtime Data.
>           Mounting proc-sys-fs-binfmt_misc.m…cutable File Formats File System...
> [  102.762200] audit: type=1400 audit(1734793390.636:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=1046 comm="apparmor_parser"
> [  102.762200] audit: type=1400 audit(1734793390.636:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=1046 comm="apparmor_parser"
> [  102.795038] audit: type=1400 audit(1734793390.640:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=1041 comm="apparmor_parser"
> [  102.795038] audit: type=1400 audit(1734793390.640:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=1041 comm="apparmor_parser"
> [  102.827054] audit: type=1400 audit(1734793390.640:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=1041 comm="apparmor_parser"
> [  102.827054] audit: type=1400 audit(1734793390.640:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=1041 comm="apparmor_parser"
> [  102.860137] audit: type=1400 audit(1734793390.640:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=1040 comm="apparmor_parser"
> [  102.860137] audit: type=1400 audit(1734793390.640:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=1040 comm="apparmor_parser"
> [  102.891535] audit: type=1400 audit(1734793390.640:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oosplash" pid=1045 comm="apparmor_parser"
> [  102.891535] audit: type=1400 audit(1734793390.640:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oosplash" pid=1045 comm="apparmor_parser"
> [  102.924446] audit: type=1400 audit(1734793390.652:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=1049 comm="apparmor_parser"
> [  102.924446] audit: type=1400 audit(1734793390.652:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=1049 comm="apparmor_parser"
> [  102.957663] audit: type=1400 audit(1734793390.656:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=1042 comm="apparmor_parser"
> [  102.957663] audit: type=1400 audit(1734793390.656:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=1042 comm="apparmor_parser"
> [  102.994909] audit: type=1400 audit(1734793390.656:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=1042 comm="apparmor_parser"
> [  102.994909] audit: type=1400 audit(1734793390.656:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=1042 comm="apparmor_parser"
> [  103.030930] audit: type=1400 audit(1734793390.656:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=1042 comm="apparmor_parser"
> [  103.030930] audit: type=1400 audit(1734793390.656:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=1042 comm="apparmor_parser"
> [  103.067515] audit: type=1400 audit(1734793390.656:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/{,usr/}sbin/dhclient" pid=1042 comm="apparmor_parser"
> [  103.067515] audit: type=1400 audit(1734793390.656:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/{,usr/}sbin/dhclient" pid=1042 comm="apparmor_parser"
> [  OK  ] Finished systemd-tmpfiles-setup.se…reate System Files and Directories.
> [  OK  ] Finished apparmor.service - Load AppArmor profiles.
> [  OK  ] Mounted proc-sys-fs-binfmt_misc.mo…xecutable File Formats File System.
>           Starting networking.service - Raise network interfaces...
> [  OK  ] Finished systemd-binfmt.service - Set Up Additional Binary Formats.
> [  OK  ] Reached target sysinit.target - System Initialization.
> [  OK  ] Started cups.path - CUPS Scheduler.
> [  OK  ] Started anacron.timer - Trigger anacron every hour.
> [  OK  ] Started apt-daily.timer - Daily apt download activities.
> [  OK  ] Started apt-daily-upgrade.timer - …y apt upgrade and clean activities.
> [  OK  ] Started dpkg-db-backup.timer - Daily dpkg database backup timer.
> [  OK  ] Started e2scrub_all.timer - Period…Metadata Check for All Filesystems.
> [  OK  ] Started exim4-base.timer - Daily exim4-base housekeeping.
> [  OK  ] Started fstrim.timer - Discard unused filesystem blocks once a week.
> [  OK  ] Started fwupd-refresh.timer - Refresh fwupd metadata regularly.
> [  OK  ] Started logrotate.timer - Daily rotation of log files.
> [  OK  ] Started man-db.timer - Daily man-db regeneration.
> [  OK  ] Started systemd-tmpfiles-clean.tim…y Cleanup of Temporary Directories.
> [  OK  ] Reached target boot-complete.target - Boot Completion Check.
> [  OK  ] Reached target paths.target - Path Units.
> [  OK  ] Reached target timers.target - Timer Units.
> [  OK  ] Listening on avahi-daemon.socket -…DNS/DNS-SD Stack Activation Socket.
> [  OK  ] Listening on cups.socket - CUPS Scheduler.
> [  OK  ] Listening on dbus.socket - D-Bus System Message Bus Socket.
> [  OK  ] Listening on sshd-unix-local.socke…temd-ssh-generator, AF_UNIX Local).
> [  OK  ] Listening on systemd-hostnamed.socket - Hostname Service Socket.
> [  OK  ] Reached target sockets.target - Socket Units.
>           Starting depthcharge-tools.service…thcharge partition as successful...
> [  OK  ] Reached target basic.target - Basic System.
>           Starting accounts-daemon.service - Accounts Service...
> [  OK  ] Started anacron.service - Run anacron jobs.
>           Starting avahi-daemon.service - Avahi mDNS/DNS-SD Stack...
>           Starting bluetooth.service - Bluetooth service...
> [  OK  ] Started cron.service - Regular background program processing daemon.
>           Starting dbus.service - D-Bus System Message Bus...
>           Starting dracut-shutdown.service -…store /run/initramfs on shutdown...
>           Starting e2scrub_reap.service - Re…ne ext4 Metadata Check Snapshots...
>           Starting gnome-remote-desktop-conf…- Configure GNOME Remote Desktop...
>           Starting gnome-remote-desktop.service - GNOME Remote Desktop...
>           Starting grub-common.service - Record successful boot for GRUB...
>           Starting lm-sensors.service - Init…lize hardware monitoring sensors...
> [  OK  ] Started low-memory-monitor.service - Low Memory Monitor.
>           Starting polkit.service - Authorization Manager...
>           Starting smartmontools.service - S…orting Technology (SMART) Daemon...
>           Starting switcheroo-control.servic…Switcheroo Control Proxy service...
>           Starting systemd-logind.service - User Login Management...
>           Starting udisks2.service - Disk Manager...
> [  OK  ] Finished dracut-shutdown.service - Restore /run/initramfs on shutdown.
> [  OK  ] Finished e2scrub_reap.service - Re…line ext4 Metadata Check Snapshots.
> [  OK  ] Finished lm-sensors.service - Initialize hardware monitoring sensors.
> [  OK  ] Finished networking.service - Raise network interfaces.
> [  OK  ] Started systemd-logind.service - User Login Management.
> [  OK  ] Finished grub-common.service - Record successful boot for GRUB.
> [  OK  ] Started smartmontools.service - Se…eporting Technology (SMART) Daemon.
> [  OK  ] Started dbus.service - D-Bus System Message Bus.
>           Starting NetworkManager.service - Network Manager...
>           Starting wpa_supplicant.service - WPA supplicant...
> [  OK  ] Started switcheroo-control.service - Switcheroo Control Proxy service.
> [  106.742252] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [
>    106.742252] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [  106.756267] Bluetooth: BNEP filters: protocol multicast
> [[  OK  ] Started 1;39mavahi-daemon.service - Avahi mDNS/DNS-S D Stack.
> 106.756267] Bluetooth: BNEP filters: protocol multicast
> [  106.776763] Bluetooth: BNEP socket layer initialized
> [  106.776763] Bluetooth: BNEP socket layer initialized
> [  OK  ] Reached target bluetooth.target - Bluetooth Support.
>           Starting alsa-restore.service - Save/Restore Sound Card State...
>           Starting systemd-hostnamed.service - Hostname Service...
> [  106.847872] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: mt8183_adda_dmic_set(), kcontrol name MTKAIF_DMIC, mtkaif_dmic 0
> [  106.847872] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: mt8183_adda_dmic_set(), kcontrol name MTKAIF_DMIC, mtkaif_dmic 0
> [  106.861024] Bluetooth: MGMT ver 1.23
> [  106.861024] Bluetooth: MGMT ver 1.23
> [  OK  ] Finished alsa-restore.service - Save/Restore Sound Card State.
> [  OK  ] Reached target sound.target - Sound Card.
> [  107.061618] NET: Registered PF_ALG protocol family
> [  107.061618] NET: Registered PF_ALG protocol family
> [  OK  ] Started systemd-hostnamed.service - Hostname Service.
> [  OK  ] Started polkit.service - Authorization Manager.
>           Starting ModemManager.service - Modem Manager...
> [  OK  ] Started wpa_supplicant.service - WPA supplicant.
> [  107.249656] Bluetooth: RFCOMM TTY layer initialized
> [  107.249656] Bluetooth: RFCOMM TTY layer initialized
> [  107.260930] Bluetooth: RFCOMM socket layer initialized
> [  107.260930] Bluetooth: RFCOMM socket layer initialized
> [  107.272727] Bluetooth: RFCOMM ver 1.11
> [  107.272727] Bluetooth: RFCOMM ver 1.11
> [  OK  ] Started accounts-daemon.service[  107.286675] Bluetooth: hci0: setting up ROME/QCA6390
> [  - Accounts Serv 10ice.
> 7.286675] Bluetooth: hci0: setting up ROME/QCA6390
> [  107.511052] Bluetooth: hci0: Frame reassembly failed (-84)
> [  107.511052] Bluetooth: hci0: Frame reassembly failed (-84)
> [  107.781368] Bluetooth: hci0: QCA Product ID   :0x00000008
> [  107.781368] Bluetooth: hci0: QCA Product ID   :0x00000008
> [  107.793677] Bluetooth: hci0: QCA SOC Version  :0x00000044
> [  107.793677] Bluetooth: hci0: QCA SOC Version  :0x00000044
> [  107.805863] Bluetooth: hci0: QCA ROM Version  :0x00000302
> [  107.805863] Bluetooth: hci0: QCA ROM Version  :0x00000302
> [  107.818055] Bluetooth: hci0: QCA Patch Version:0x00000111
> [  107.818055] Bluetooth: hci0: QCA Patch Version:0x00000111
> [  107.830252] Bluetooth: hci0: QCA controller version 0x00440302
> [  107.830252] Bluetooth: hci0: QCA controller version 0x00440302
> [  107.843330] Bluetooth: hci0: QCA Downloading qca/rampatch_00440302.bin
> [  107.843330] Bluetooth: hci0: QCA Downloading qca/rampatch_00440302.bin
> [  108.128808] Bluetooth: hci0: Frame reassembly failed (-84)
> [  108.128808] Bluetooth: hci0: Frame reassembly failed (-84)
> [  108.255609] Bluetooth: hci0: QCA Downloading qca/nvm_00440302_i2s.bin
> [  108.255609] Bluetooth: hci0: QCA Downloading qca/nvm_00440302_i2s.bin
> [  108.270121] bluetooth hci0: Direct firmware load for qca/nvm_00440302_i2s.bin failed with error -2
> [  108.270121] bluetooth hci0: Direct firmware load for qca/nvm_00440302_i2s.bin failed with error -2
> [  108.289610] Bluetooth: hci0: QCA Failed to request file: qca/nvm_00440302_i2s.bin (-2)
> [  108.289610] Bluetooth: hci0: QCA Failed to request file: qca/nvm_00440302_i2s.bin (-2)
> [  108.306991] Bluetooth: hci0: QCA Failed to download NVM (-2)
> [  108.306991] Bluetooth: hci0: QCA Failed to download NVM (-2)
>           Starting NetworkManager-dispatcher…anager Script Dispatcher Service...
> [  OK  ] Started udisks2.service - Disk Manager.
> [  OK  ] Started NetworkManager-dispatcher.… Manager Script Dispatcher Service.
> [  108.907883] NET: Registered PF_QIPCRTR protocol family
> [  108.907883] NET: Registered PF_QIPCRTR protocol family
> [  OK  ] Started ModemManager.service - Modem Manager.
> [  109.228115] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=00000C00; host->error=0x00000002
> [  109.228115] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=00000C00; host->error=0x00000002
> [  109.249528] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=80000C08; host->error=0x00000002
> [  109.249528] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=80000C08; host->error=0x00000002
> [  109.276045] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=8 arg=000001AA; host->error=0x00000002
> [  109.276045] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=8 arg=000001AA; host->error=0x00000002
> [  109.337878] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
> [  109.337878] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
> [  109.364891] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
> [  109.364891] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
> [  109.383947] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
> [  109.383947] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
> [  109.402039] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
> [  109.402039] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)
> [  OK  ] Started gnome-remote-desktop.service - GNOME Remote Desktop.
> [  OK  ] Started gnome-remote-desktop-confi…e - Configure GNOME Remote Desktop.
> [  OK  ] Started NetworkManager.service - Network Manager.
> [  OK  ] Reached target network.target - Network.
>           Starting NetworkManager-wait-onlin…ce - Network Manager Wait Online...
>           Starting cups.service - CUPS Scheduler...
>           Starting ssh.service - OpenBSD Secure Shell server...
>           Starting systemd-user-sessions.service - Permit User Sessions...
> [  OK  ] Finished systemd-user-sessions.service - Permit User Sessions.
>           Starting gdm.service - GNOME Display Manager...
>           Starting plymouth-quit-wait.servic…d until boot process finishes up...
> [  110.011177] kauditd_printk_skb: 18 callbacks suppressed
> [  110.011177] kauditd_printk_skb: 18 callbacks suppressed
> [  110.011191] audit: type=1400 audit(1734793397.884:30): apparmor="DENIED" operation="capable" class="cap" profile="/usr/sbin/cupsd" pid=1247 comm="cupsd" capability=12  capname="net_admin"
> [  110.011191] audit: type=1400 audit(1734793397.884:30): apparmor="DENIED" operation="capable" class="cap" profile="/usr/sbin/cupsd" pid=1247 comm="cupsd" capability=12  capname="net_admin"
> [  OK  ] Started cups.service - CUPS Scheduler.
> [  OK  ] Finished plymouth-quit-wait.servic…old until boot process finishes up.
> [  OK  ] Started ssh.service - OpenBSD Secure Shell server.
> [  OK  ] Finished depthcharge-tools.service…epthcharge partition as successful.
> [  OK  ] Started serial-getty@ttyS0.service - Serial Getty on ttyS0.
> [  OK  ] Started gdm.service - GNOME Display Manager.
> [  OK  ] Created slice user-1000.slice - User Slice of UID 1000.
>           Starting user-runtime-dir@1000.ser…Runtime Directory /run/user/1000...
> [  OK  ] Finished user-runtime-dir@1000.ser…r Runtime Directory /run/user/1000.
>           Starting user@1000.service - User Manager for UID 1000...
> [  OK  ] Started user@1000.service - User Manager for UID 1000.
> [  OK  ] Started session-1.scope - Session 1 of User alpernebbi.
>           Starting rtkit-daemon.service - Re…imeKit Scheduling Policy Service...
> [  OK  ] Started rtkit-daemon.service - RealtimeKit Scheduling Policy Service.
> [  114.053128]  Playback_1: ASoC: no backend DAIs enabled for Playback_1, possibly missing ALSA mixer-based routing or UCM profile
> [  114.053128]  Playback_1: ASoC: no backend DAIs enabled for Playback_1, possibly missing ALSA mixer-based routing or UCM profile
> [  114.990662] wlan0: authenticate with 00:1c:7b:cc:83:c6 (local address=5c:fb:3a:cf:26:4d)
> [  114.990662] wlan0: authenticate with 00:1c:7b:cc:83:c6 (local address=5c:fb:3a:cf:26:4d)
> [  115.006953] wlan0: send auth to 00:1c:7b:cc:83:c6 (try 1/3)
> [  115.006953] wlan0: send auth to 00:1c:7b:cc:83:c6 (try 1/3)
> [  115.021208] wlan0: authenticated
> [  115.021208] wlan0: authenticated
> [  115.031945] wlan0: associate with 00:1c:7b:cc:83:c6 (try 1/3)
> [  115.031945] wlan0: associate with 00:1c:7b:cc:83:c6 (try 1/3)
> [  115.050205] wlan0: RX AssocResp from 00:1c:7b:cc:83:c6 (capab=0x1411 status=0 aid=3)
> [  115.050205] wlan0: RX AssocResp from 00:1c:7b:cc:83:c6 (capab=0x1411 status=0 aid=3)
> [  115.069858] wlan0: associated
> [  115.069858] wlan0: associated
> p104p104
> Debian GNU/Linux trixie/sid DEBIAN-T5-ARM64 ttyS0
> 
> DEBIAN-T5-ARM64 login:
> 

