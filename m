Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CDECA101E
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Sep 2024 12:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OBBLeongJa/cLctN2YniAvxesNQLzlzCR0WU7+qvGQY=; b=zOOddNKiCTyhxOQii/pfVCXZpd
	RImC7dsMhtBKMOX0yWOySa+zl9DwP9QUwFxU0ihg5yiyYiqukL0J5GDHM5lCq5VpT7yZFZKgkuF8E
	8in+LO2JFxFdJAw1ljuUSbLf9E3i/6+AbJBlIiwKCZ07l1ZMgON212YL28zkc2hT/CUbD+yMjXKpf
	EpVAdvRrv1RZkstb332V03WU3f4LL6pp3rtEl+Q7WsYf21nTTW34+v7rqt0ccrGdobjduIJRlKVQa
	ZRSFmXjpAXDrhI0oUHDw+hbJiWjhNucSo0DJUqCC6Xj8JZr025sDI0E9rZlXDze1FhfRmoKjPNXRr
	t0BkzRUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skkAv-0000000BfOd-1Kib;
	Sun, 01 Sep 2024 12:59:25 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skkAo-0000000BfO3-0TT9
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Sep 2024 12:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1725195554; x=1725800354; i=zillevdr@gmx.de;
	bh=OBBLeongJa/cLctN2YniAvxesNQLzlzCR0WU7+qvGQY=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=s8pTmvsfHPyXyVqH54OmKLaGCUKY9btUAi9DYQKCtfVP/aLIWhaXO/IXBXWzii2E
	 T7W4tW4rvFJQbtdqZa/DgljUugb6PNa/kit+wf59lsLoT6YbyapL5kttIzXg7ciBl
	 hxZxAS4K26DvdMA6E1m6hFOMApMFxI7AJOmIAgcj+O5SRaerZjHd+Y7l8bwgyUoBM
	 evxB+4+0CfV/aX/X4vAvGDonuDkhsLrEPLIEjAcASnIRWujAgqe7s7yTFYI9jiZwl
	 c2qKK/odri/hvcOENyiBobUv6xkuTJs8X+Pr08PeCyrWW0JQhHkwhs9OAoQSvsDaH
	 VZaYquzgIb3jl84IxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from zotac.lan ([91.14.238.3]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatRZ-1sEibq3hSl-00eWJL for
 <linux-mediatek@lists.infradead.org>; Sun, 01 Sep 2024 14:59:14 +0200
Date: Sun, 1 Sep 2024 14:58:46 +0200
From: Jens Ziller <zillevdr@gmx.de>
To: linux-mediatek@lists.infradead.org
Subject: mt8186-corsola-tentacruel panel flickers
Message-ID: <20240901145846.56b07482@zotac.lan>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n0UyHUKnqfLH6Bqkc8cEPQOyijH6KjXi3KMcEqaRw4gwL6rzlbP
 AYpPTMlOPjY+E2LiJOpDCmLbowIEcjwkDZl77+/l+KRF9Apdh2HXfMR3KFD6nMC0foiX2R0
 9Ew9gd1yYD9PifktuP4G4Cmu6Knl+HjfZi33Pj1tnvIo22GMJ7ZK6HIFv8kNrkUxX0r3tkS
 4+jGzot4HHUEgRlAJjgwg==
UI-OutboundReport: notjunk:1;M01:P0:UIMIOQJ7jbs=;7pTEP8lgz1GPGoIiL4K6nYGOfbq
 /v9lbTZXAexrvyiACpEqH5ctl3Wgb7VzUNkfO8p9dW+SY/HX+GRinDp/tWR+JOs2ybvK0E85q
 v/alGfiWopWH7a4iQpGGrH3RaoYQtt1QFK6q35V6C9kenEFDuoY1YVCx0y0SqKVqjdYkDvK5x
 yH6KwcnxMaTG5vssIo96kSk/KhabWaHagDIW/7HSLXhyxb5rPdgCBcoDvk5nkt7KQvpWAb1+T
 Pkn7O+8w+8pLCAk7EgcUnchsWAFTxppf5MZ4z2y7wOSEf95ULWb11epgCRzq81vKjm9KjJEFV
 7M0vo3OP40Gxo747sFYhXaYNw30eC0SldGl0V9DOAmfljvdG92T77Wv4R94ceOiWKo5CcDXYf
 Th94wkckIe9754DMH7fL7/maBt3L14LZzAERtFP3hhGg/J6WL+618H+McpapYLN7ZLyOrrA1n
 y/eQNmozIfQZuBH7YhP4oSwUB+ctYyNObiJjQ8ThcjvTAMCQKex1oPphL+OIbLvdN5KPA+o4E
 kGy4PktUbOpgwFIozG/5veecqb+J5IE6hEsxX/Z/88nSeqm03mPEkYeWGdP/nRCrtkpPwcTHe
 tRIkecjT/KEXfHDk7IC16G5tVi8aRk+smBDA8OX+TRDmmvoEo/JvBtAR+UqcUbMM04dmsUwyq
 t4U6kpkPaZZzrxzOJaFbNog+hXuFsp3yMlwFwcdmsS3LvJIuJ7XlkTp3ijSyeJ+vvRNAL+IHV
 T7RBB+V0D6taW4ox8X2z8H/YTIw2zREAdmZqXW472n4iLAHqC9NBBSsTtJbpMydtBzEwub5Xm
 HQPd5fxwTY15HOp6Ripi/EDg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_055918_861229_3CFE7022 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Hi list,

I wish boot linux on an ASUS Chromebook CM14 Flip (CM1402F). I test
with Kernel from Collabora for-kernelci branch and linux-6.11.0-rc5.
The patch from [1] enable the display. But the panel flickers. It
looks like 1 or 2 times per second are a black framebuffer. Xorg
flickers also. I found no relevant fail message. With vendor kernel are
no flickers, but no panfrost acceleration for xorg.

Thank's for help
Jens

[1] https://www.spinics.net/lists/kernel/msg5332153.html

dmesg:
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd050]
[    0.000000] Linux version 6.11.0-rc5 (root@book) (aarch64-unknown-linux=
-gnu-gcc (Gentoo 13.2.1_p20240210 p14) 13.2.1 20240210, GNU ld (Gentoo 2.4=
2 p3) 2.42.0) #2 SMP PREEMPT Sat Aug 31 19:14:13 CEST 2024
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Google Tentacruel board
[    0.000000] Reserved memory: created DMA memory pool at 0x0000000050000=
000, size 16 MiB
[    0.000000] OF: reserved mem: initialized node memory@50000000, compati=
ble id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000050000000..0x000000005109ffff (1=
7024 KiB) nomap non-reusable memory@50000000
[    0.000000] Reserved memory: created DMA memory pool at 0x0000000060000=
000, size 10 MiB
[    0.000000] OF: reserved mem: initialized node memory@60000000, compati=
ble id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000060000000..0x00000000609fffff (1=
0240 KiB) nomap non-reusable memory@60000000
[    0.000000] Reserved memory: created DMA memory pool at 0x0000000061000=
000, size 1 MiB
[    0.000000] OF: reserved mem: initialized node memory@61000000, compati=
ble id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000061000000..0x00000000610fffff (1=
024 KiB) nomap non-reusable memory@61000000
[    0.000000] OF: reserved mem: 0x00000000ffec4000..0x00000000fffc3fff (1=
024 KiB) map non-reusable ramoops
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000023fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x000000004fffffff]
[    0.000000]   node   0: [mem 0x0000000050000000-0x000000005109ffff]
[    0.000000]   node   0: [mem 0x00000000510a0000-0x00000000545fffff]
[    0.000000]   node   0: [mem 0x0000000054700000-0x000000005fffffff]
[    0.000000]   node   0: [mem 0x0000000060000000-0x00000000609fffff]
[    0.000000]   node   0: [mem 0x0000000060a00000-0x0000000060ffffff]
[    0.000000]   node   0: [mem 0x0000000061000000-0x00000000610fffff]
[    0.000000]   node   0: [mem 0x0000000061100000-0x0000000069ffffff]
[    0.000000]   node   0: [mem 0x000000006a100000-0x00000000ffdfffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000023fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000023fff=
ffff]
[    0.000000] On node 0, zone DMA: 256 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 256 pages in unavailable ranges
[    0.000000] On node 0, zone Normal: 512 pages in unavailable ranges
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] percpu: Embedded 31 pages/cpu s88088 r8192 d30696 u126976
[    0.000000] pcpu-alloc: s88088 r8192 d30696 u126976 alloc=3D31*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Virtualization Host Extensions
[    0.000000] CPU features: kernel page table isolation forced ON by KASL=
R
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: Qualcomm erratum 1009, or ARM errat=
um 1286807, 2441009
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 153=
0923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: cros_secure console=3DttyS0,115200n8 c=
onsole=3Dtty0 noinitrd root=3D/dev/sda3 rootfstype=3Dext4 rw rootwait lsm.=
module_locking=3D0 vt.global_cursor_default=3D1
[    0.000000] Unknown kernel command line parameters "cros_secure noinitr=
d", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 838860=
8 bytes, linear)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 =
bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2096=
128
[    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:of=
f
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: mapped [mem 0x00000000fbe00000-0x00000000f=
fe00000] (64MB)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, =
Nodes=3D1
[    0.000000] ftrace: allocating 42001 entries in 165 pages
[    0.000000] ftrace: allocated 165 pages with 4 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is =
100 jiffies.
[    0.000000] RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_adju=
st=3D1.
[    0.000000] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    0.000000] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_c=
b_adjust=3D1.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 480 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: GICD_CTRL.DS=3D0, SCR_EL3.FIQ=3D0
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x000000000c040=
000
[    0.000000] GICv3: GIC: PPI partition interrupt-partition-0[0] { /cpus/=
cpu@0[0] /cpus/cpu@100[1] /cpus/cpu@200[2] /cpus/cpu@300[3] /cpus/cpu@400[=
4] /cpus/cpu@500[5] }
[    0.000000] GICv3: GIC: PPI partition interrupt-partition-1[1] { /cpus/=
cpu@600[6] /cpus/cpu@700[7] }
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: 0-7.
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contenti=
on.
[    0.000000] arch_timer: cp15 timer(s) running at 13.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_c=
ycles: 0x2ff89eacb, max_idle_ns: 440795202429 ns
[    0.000000] sched_clock: 56 bits at 13MHz, resolution 76ns, wraps every=
 4398046511101ns
[    0.000410] kfence: initialized - using 2097152 bytes for 255 objects a=
t 0x(____ptrval____)-0x(____ptrval____)
[    0.000516] Console: colour dummy device 80x25
[    0.000524] printk: legacy console [tty0] enabled
[    0.000996] Calibrating delay loop (skipped), value calculated using ti=
mer frequency.. 26.00 BogoMIPS (lpj=3D13000)
[    0.001011] pid_max: default: 32768 minimum: 301
[    0.001093] LSM: initializing lsm=3Dcapability,landlock,yama,loadpin,sa=
fesetid,selinux
[    0.001143] landlock: Up and running.
[    0.001149] Yama: becoming mindful.
[    0.001163] LoadPin: ready to pin (currently enforcing)
[    0.001176] SELinux:  Initializing.
[    0.001314] Mount-cache hash table entries: 16384 (order: 5, 131072 byt=
es, linear)
[    0.001337] Mountpoint-cache hash table entries: 16384 (order: 5, 13107=
2 bytes, linear)
[    0.002853] rcu: Hierarchical SRCU implementation.
[    0.002868] rcu: 	Max phase no-delay instances is 400.
[    0.003121] Timer migration: 1 hierarchy levels; 8 children per group; =
1 crossnode level
[    0.003497] smp: Bringing up secondary CPUs ...
[    0.003840] Detected VIPT I-cache on CPU1
[    0.003892] GICv3: CPU1: found redistributor 100 region 0:0x000000000c0=
60000
[    0.003918] CPU1: Booted secondary processor 0x0000000100 [0x411fd050]
[    0.004304] Detected VIPT I-cache on CPU2
[    0.004338] GICv3: CPU2: found redistributor 200 region 0:0x000000000c0=
80000
[    0.004354] CPU2: Booted secondary processor 0x0000000200 [0x411fd050]
[    0.004688] Detected VIPT I-cache on CPU3
[    0.004719] GICv3: CPU3: found redistributor 300 region 0:0x000000000c0=
a0000
[    0.004733] CPU3: Booted secondary processor 0x0000000300 [0x411fd050]
[    0.005118] Detected VIPT I-cache on CPU4
[    0.005150] GICv3: CPU4: found redistributor 400 region 0:0x000000000c0=
c0000
[    0.005164] CPU4: Booted secondary processor 0x0000000400 [0x411fd050]
[    0.005497] Detected VIPT I-cache on CPU5
[    0.005530] GICv3: CPU5: found redistributor 500 region 0:0x000000000c0=
e0000
[    0.005544] CPU5: Booted secondary processor 0x0000000500 [0x411fd050]
[    0.006007] CPU features: detected: Spectre-v4
[    0.006012] CPU features: detected: Spectre-BHB
[    0.006015] CPU features: detected: ARM erratum 1463225
[    0.006018] Detected PIPT I-cache on CPU6
[    0.006053] GICv3: CPU6: found redistributor 600 region 0:0x000000000c1=
00000
[    0.006066] CPU6: Booted secondary processor 0x0000000600 [0x413fd0b0]
[    0.006444] Detected PIPT I-cache on CPU7
[    0.006484] GICv3: CPU7: found redistributor 700 region 0:0x000000000c1=
20000
[    0.006497] CPU7: Booted secondary processor 0x0000000700 [0x413fd0b0]
[    0.006554] smp: Brought up 1 node, 8 CPUs
[    0.006676] SMP: Total of 8 processors activated.
[    0.006683] CPU: All CPU(s) started at EL2
[    0.006689] CPU features: detected: 32-bit EL0 Support
[    0.006696] CPU features: detected: Data cache clean to the PoU not req=
uired for I/D coherence
[    0.006705] CPU features: detected: Common not Private translations
[    0.006712] CPU features: detected: CRC32 instructions
[    0.006721] CPU features: detected: RCpc load-acquire (LDAPR)
[    0.006728] CPU features: detected: LSE atomic instructions
[    0.006735] CPU features: detected: Privileged Access Never
[    0.006741] CPU features: detected: RAS Extension Support
[    0.006749] CPU features: detected: Speculative Store Bypassing Safe (S=
SBS)
[    0.006794] alternatives: applying system-wide alternatives
[    0.008948] CPU features: detected: Hardware dirty bit management on CP=
U6-7
[    0.009125] Memory: 8092716K/8384512K available (12544K kernel code, 27=
34K rwdata, 4708K rodata, 5504K init, 582K bss, 284408K reserved, 0K cma-r=
eserved)
[    0.010216] devtmpfs: initialized
[    0.014532] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 1911260446275000 ns
[    0.014561] futex hash table entries: 2048 (order: 5, 131072 bytes, lin=
ear)
[    0.014611] 2G module region forced by RANDOMIZE_MODULE_REGION_FULL
[    0.014616] 0 pages in range for non-PLT usage
[    0.014619] 517712 pages in range for PLT usage
[    0.014737] pinctrl core: initialized pinctrl subsystem
[    0.015073] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.015532] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic alloc=
ations
[    0.015692] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atom=
ic allocations
[    0.015843] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for at=
omic allocations
[    0.015863] audit: initializing netlink subsys (disabled)
[    0.015954] audit: type=3D2000 audit(0.014:1): state=3Dinitialized audi=
t_enabled=3D0 res=3D1
[    0.016237] thermal_sys: Registered thermal governor 'step_wise'
[    0.016241] thermal_sys: Registered thermal governor 'user_space'
[    0.016248] thermal_sys: Registered thermal governor 'power_allocator'
[    0.016281] cpuidle: using governor ladder
[    0.016300] cpuidle: using governor menu
[    0.016371] hw-breakpoint: found 6 breakpoint and 4 watchpoint register=
s.
[    0.016462] ASID allocator initialised with 32768 entries
[    0.023397] gpiochip_find_base_unlocked: found new base at 512
[    0.023531] gpio gpiochip0: (pinctrl_paris): created GPIO range 0->184 =
=3D=3D> 10005000.pinctrl PIN 0->184
[    0.023700] gpio gpiochip0: (pinctrl_paris): added GPIO chardev (254:0)
[    0.023729] gpio gpiochip0: registered GPIOs 512 to 708 on pinctrl_pari=
s
[    0.027414] platform 14013000.dsi: Fixed dependency cycle(s) with /soc/=
i2c@11007000/edp-bridge@8
[    0.031415] cryptd: max_cpu_qlen set to 1000
[    0.031901] iommu: Default domain type: Translated
[    0.031911] iommu: DMA domain TLB invalidation policy: strict mode
[    0.031941] reg-fixed-voltage regulator-ppvar-sys: using DT '/regulator=
-ppvar-sys' for '(default)' GPIO lookup
[    0.031953] of_get_named_gpiod_flags: can't parse 'gpios' property of n=
ode '/regulator-ppvar-sys[0]'
[    0.031960] of_get_named_gpiod_flags: can't parse 'gpio' property of no=
de '/regulator-ppvar-sys[0]'
[    0.031966] reg-fixed-voltage regulator-ppvar-sys: using lookup tables =
for GPIO lookup
[    0.031969] reg-fixed-voltage regulator-ppvar-sys: No GPIO consumer (de=
fault) found
[    0.034338] SCSI subsystem initialized
[    0.034402] usbcore: registered new interface driver usbfs
[    0.034417] usbcore: registered new interface driver hub
[    0.034435] usbcore: registered new device driver usb
[    0.034484] mc: Linux media interface: v0.10
[    0.034504] videodev: Linux video capture interface: v2.00
[    0.034938] mediatek,efuse 11cb0000.efuse: using DT '/soc/efuse@11cb000=
0' for 'wp' GPIO lookup
[    0.034949] of_get_named_gpiod_flags: can't parse 'wp-gpios' property o=
f node '/soc/efuse@11cb0000[0]'
[    0.034957] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of=
 node '/soc/efuse@11cb0000[0]'
[    0.034963] mediatek,efuse 11cb0000.efuse: using lookup tables for GPIO=
 lookup
[    0.034967] mediatek,efuse 11cb0000.efuse: No GPIO consumer wp found
[    0.035165] Advanced Linux Sound Architecture Driver Initialized.
[    0.035737] clocksource: Switched to clocksource arch_sys_counter
[    0.484904] NET: Registered PF_INET protocol family
[    0.485039] IP idents hash table entries: 131072 (order: 8, 1048576 byt=
es, linear)
[    0.488319] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4=
, 65536 bytes, linear)
[    0.488420] Table-perturb hash table entries: 65536 (order: 6, 262144 b=
ytes, linear)
[    0.488471] TCP established hash table entries: 65536 (order: 7, 524288=
 bytes, linear)
[    0.489012] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes=
, linear)
[    0.490445] TCP: Hash tables configured (established 65536 bind 65536)
[    0.490517] UDP hash table entries: 4096 (order: 5, 131072 bytes, linea=
r)
[    0.490670] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, =
linear)
[    0.490881] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.491111] RPC: Registered named UNIX socket transport module.
[    0.491120] RPC: Registered udp transport module.
[    0.491124] RPC: Registered tcp transport module.
[    0.491128] RPC: Registered tcp-with-tls transport module.
[    0.491133] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.492006] Initialise system trusted keyrings
[    0.492083] workingset: timestamp_bits=3D62 max_order=3D21 bucket_order=
=3D0
[    0.492524] NFS: Registering the id_resolver key type
[    0.492537] Key type id_resolver registered
[    0.492542] Key type id_legacy registered
[    0.492555] nfs4filelayout_init: NFSv4 File Layout Driver Registering..=
.
[    0.492562] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regis=
tering...
[    0.521344] Key type asymmetric registered
[    0.521352] Asymmetric key parser 'x509' registered
[    0.521404] io scheduler bfq registered
[    0.522524] mediatek-mipi-tx 11cc0000.dsi-phy: can't get nvmem_cell_get=
, ignore it
[    0.524602] cannot find "mediatek,mt8186-fhctl"
[    0.531055] mtk-socinfo mtk-socinfo.0.auto: MediaTek Kompanio 520 (MT81=
86) SoC detected.
[    0.531840] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.532801] printk: legacy console [ttyS0] disabled
[    0.553028] 11002000.serial: ttyS0 at MMIO 0x11002000 (irq =3D 245, bas=
e_baud =3D 1625000) is a ST16650V2
[    0.553067] printk: legacy console [ttyS0] enabled
[    1.816937] usbcore: registered new interface driver udl
[    1.827949] loop: module loaded
[    1.831158] lkdtm: No crash points registered, enable through debugfs
[    1.838058] mt6359-auxadc: Failed to locate of_node [id: -1]
[    1.843974] platform mt6358-regulator: Fixed dependency cycle(s) with /=
soc/pwrap@1000d000/pmic/regulators/vs2
[    1.853908] platform mt6358-regulator: Fixed dependency cycle(s) with /=
soc/pwrap@1000d000/pmic/regulators/vdram1
[    1.864103] platform mt6358-regulator: Fixed dependency cycle(s) with /=
soc/pwrap@1000d000/pmic/regulators/vs1
[    1.874549] mt6358-keys: Failed to locate of_node [id: -1]
[    1.881225] spi_master spi1: using DT '/soc/spi@11012000' for 'cs' GPIO=
 lookup
[    1.881242] of_get_named_gpiod_flags: parsed 'cs-gpios' property of nod=
e '/soc/spi@11012000[0]' - status (0)
[    1.881256] gpio gpiochip0: Persistence not supported for GPIO 45
[    1.882086] spi-nor spi2.0: using DT '/soc/spi@11000000/flash@0' for 'r=
eset' GPIO lookup
[    1.882097] of_get_named_gpiod_flags: can't parse 'reset-gpios' propert=
y of node '/soc/spi@11000000/flash@0[0]'
[    1.882106] of_get_named_gpiod_flags: can't parse 'reset-gpio' property=
 of node '/soc/spi@11000000/flash@0[0]'
[    1.882112] spi-nor spi2.0: using lookup tables for GPIO lookup
[    1.882115] spi-nor spi2.0: No GPIO consumer reset found
[    1.883291] mtk-spi-nor 11000000.spi: spi frequency: 39000000 Hz
[    1.889723] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    1.889728] mdio_bus fixed-0: No GPIO consumer reset found
[    1.890450] usbcore: registered new interface driver cdc_acm
[    1.892789] tpm_tis_spi spi1.0: TPM ready IRQ confirmed on attempt 2
[    1.896113] cdc_acm: USB Abstract Control Model driver for USB modems a=
nd ISDN adapters
[    1.896125] usbcore: registered new interface driver usb-storage
[    1.912213] tpm_tis_spi spi1.0: 2.0 TPM (device-id 0x504A, rev-id 83)
[    1.917464] mt6397-rtc mt6358-rtc: registered as rtc0
[    1.928104] mt6397-rtc mt6358-rtc: setting system clock to 2024-09-01T0=
9:27:19 UTC (1725182839)
[    1.936827] i2c_dev: i2c /dev entries driver
[    1.941618] platform 14013000.dsi: Fixed dependency cycle(s) with /soc/=
i2c@11007000/edp-bridge@8
[    1.950436] i2c 0-0008: Fixed dependency cycle(s) with /soc/i2c@1100700=
0/edp-bridge@8/aux-bus/panel
[    1.959488] i2c 0-0008: Fixed dependency cycle(s) with /soc/dsi@1401300=
0
[    1.965222] tpm_tis_spi spi1.0: Cr50 firmware version: Ti50/D3C1 RO_B:0=
.0.46/- RW_B:0.23.40/ti50_common_mp-15224.B:v0.0
[    1.969507] mtk-wdt 10007000.watchdog: Watchdog enabled (timeout=3D31 s=
ec, nowayout=3D0)
[    1.985721] pwrseq_simple wifi-pwrseq: using DT '/wifi-pwrseq' for 'res=
et' GPIO lookup
[    1.985746] of_get_named_gpiod_flags: parsed 'reset-gpios' property of =
node '/wifi-pwrseq[0]' - status (0)
[    1.985761] gpio gpiochip0: Persistence not supported for GPIO 54
[    1.985864] sdhci: Secure Digital Host Controller Interface driver
[    1.992049] sdhci: Copyright(c) Pierre Ossman
[    1.996629] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.003033] SMCCC: SOC_ID: ID =3D jep106:0426:8186 Revision =3D 0x00000=
000
[    2.009579] hid: raw HID events driver (C) Jiri Kosina
[    2.015150] spi_master spi0: will run message pump with realtime priori=
ty
[    2.022170] hw perfevents: enabled with armv8_cortex_a55 PMU driver, 7 =
counters available
[    2.031538] hw perfevents: enabled with armv8_cortex_a76 PMU driver, 7 =
counters available
[    2.040118] watchdog: Delayed init of the lockup detector failed: -19
[    2.042240] rt1015p speaker-codec: using DT '/speaker-codec' for 'sdb' =
GPIO lookup
[    2.046562] watchdog: Hard watchdog permanently disabled
[    2.046568] of_get_named_gpiod_flags: parsed 'sdb-gpios' property of no=
de '/speaker-codec[0]' - status (0)
[    2.051878] gpio gpiochip0: Persistence not supported for GPIO 150
[    2.052819] mt8186-audio 11210000.audio-controller: mtk_afe_combine_sub=
_dai(), num of dai 41
[    2.061417] mt8186-audio 11210000.audio-controller: No cache defaults, =
reading back from HW
[    2.071186] Initializing XFRM netlink socket
[    2.075475] NET: Registered PF_PACKET protocol family
[    2.080534] Key type dns_resolver registered
[    2.087800] registered taskstats version 1
[    2.092012] Loading compiled-in X.509 certificates
[    2.100680] Key type .fscrypt registered
[    2.104608] Key type fscrypt-provisioning registered
[    2.109658] Key type encrypted registered
[    2.122850] reg-fixed-voltage regulator-pp3300-ldo-z5: using DT '/regul=
ator-pp3300-ldo-z5' for '(default)' GPIO lookup
[    2.122877] of_get_named_gpiod_flags: can't parse 'gpios' property of n=
ode '/regulator-pp3300-ldo-z5[0]'
[    2.122888] of_get_named_gpiod_flags: can't parse 'gpio' property of no=
de '/regulator-pp3300-ldo-z5[0]'
[    2.122897] reg-fixed-voltage regulator-pp3300-ldo-z5: using lookup tab=
les for GPIO lookup
[    2.122902] reg-fixed-voltage regulator-pp3300-ldo-z5: No GPIO consumer=
 (default) found
[    2.123322] reg-fixed-voltage regulator-pp4200-z2: using DT '/regulator=
-pp4200-z2' for '(default)' GPIO lookup
[    2.123322] reg-fixed-voltage regulator-pp3300-z2: using DT '/regulator=
-pp3300-z2' for '(default)' GPIO lookup
[    2.123341] of_get_named_gpiod_flags: can't parse 'gpios' property of n=
ode '/regulator-pp4200-z2[0]'
[    2.123344] of_get_named_gpiod_flags: can't parse 'gpios' property of n=
ode '/regulator-pp3300-z2[0]'
[    2.123351] of_get_named_gpiod_flags: can't parse 'gpio' property of no=
de '/regulator-pp4200-z2[0]'
[    2.123354] of_get_named_gpiod_flags: can't parse 'gpio' property of no=
de '/regulator-pp3300-z2[0]'
[    2.123361] reg-fixed-voltage regulator-pp3300-z2: using lookup tables =
for GPIO lookup
[    2.123361] reg-fixed-voltage regulator-pp4200-z2: using lookup tables =
for GPIO lookup
[    2.123365] reg-fixed-voltage regulator-pp3300-z2: No GPIO consumer (de=
fault) found
[    2.123367] reg-fixed-voltage regulator-pp4200-z2: No GPIO consumer (de=
fault) found
[    2.123532] reg-fixed-voltage regulator-pp5000-z2: using DT '/regulator=
-pp5000-z2' for '(default)' GPIO lookup
[    2.123546] of_get_named_gpiod_flags: can't parse 'gpios' property of n=
ode '/regulator-pp5000-z2[0]'
[    2.123555] of_get_named_gpiod_flags: can't parse 'gpio' property of no=
de '/regulator-pp5000-z2[0]'
[    2.123560] reg-fixed-voltage regulator-pp5000-z2: using lookup tables =
for GPIO lookup
[    2.123564] reg-fixed-voltage regulator-pp5000-z2: No GPIO consumer (de=
fault) found
[    2.124283] pwm-backlight backlight-lcd0: using DT '/backlight-lcd0' fo=
r 'enable' GPIO lookup
[    2.124306] of_get_named_gpiod_flags: parsed 'enable-gpios' property of=
 node '/backlight-lcd0[0]' - status (0)
[    2.124326] gpio gpiochip0: Persistence not supported for GPIO 152
[    2.124331] gpio-664 (enable): no flags found for GPIO enable
[    2.127377] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/ovl@14005000
[    2.135722] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/ovl@14006000
[    2.137202] gpiochip_find_base_unlocked: found new base at 709
[    2.144031] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/rdma@14007000
[    2.152415] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/color@14009000
[    2.160898] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/ccorr@1400b000
[    2.169368] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/aal@1400c000
[    2.177767] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/gamma@1400d000
[    2.186297] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/dsi@14013000
[    2.194592] mediatek-drm mediatek-drm.6.auto: Adding component match fo=
r /soc/rdma@1401f000
[    2.208654] reg-fixed-voltage regulator-pp3300-disp-x: using DT '/regul=
ator-pp3300-disp-x' for '(default)' GPIO lookup
[    2.208702] of_get_named_gpiod_flags: parsed 'gpios' property of node '=
/regulator-pp3300-disp-x[0]' - status (0)
[    2.208722] gpio gpiochip0: Persistence not supported for GPIO 153
[    2.208751] reg-fixed-voltage regulator-pp3300-s3: using DT '/regulator=
-pp3300-s3' for '(default)' GPIO lookup
[    2.208766] of_get_named_gpiod_flags: can't parse 'gpios' property of n=
ode '/regulator-pp3300-s3[0]'
[    2.208776] of_get_named_gpiod_flags: can't parse 'gpio' property of no=
de '/regulator-pp3300-s3[0]'
[    2.208782] reg-fixed-voltage regulator-usb-p1-vbus: using DT '/regulat=
or-usb-p1-vbus' for '(default)' GPIO lookup
[    2.208784] reg-fixed-voltage regulator-pp3300-s3: using lookup tables =
for GPIO lookup
[    2.208790] reg-fixed-voltage regulator-pp3300-s3: No GPIO consumer (de=
fault) found
[    2.208791] of_get_named_gpiod_flags: can't parse 'gpios' property of n=
ode '/regulator-usb-p1-vbus[0]'
[    2.208803] of_get_named_gpiod_flags: parsed 'gpio' property of node '/=
regulator-usb-p1-vbus[0]' - status (0)
[    2.208815] gpio gpiochip0: Persistence not supported for GPIO 148
[    2.213361] cpufreq: cpufreq_online: CPU0: Running at unlisted initial =
frequency: 1999998 KHz, changing to: 2000000 KHz
[    2.221297] pp2760_vsim2_x: Bringing 1860000uV into 2700000-2700000uV
[    2.224470] cpu cpu0: EM: created perf domain
[    2.235336] cpufreq: cpufreq_online: CPU6: Running at unlisted initial =
frequency: 1084999 KHz, changing to: 1085000 KHz
[    2.238994] gpio gpiochip1: (cros-ec-gpio.4.auto): added GPIO chardev (=
254:1)
[    2.246174] gpio gpiochip1: registered GPIOs 709 to 748 on cros-ec-gpio=
.4.auto
[    2.246354] cpu cpu6: EM: created perf domain
[    2.251794] i2c_hid_of 1-0010: using DT '/soc/i2c@11008000/touchscreen@=
10' for 'reset' GPIO lookup
[    2.251900] of_get_named_gpiod_flags: can't parse 'reset-gpios' propert=
y of node '/soc/i2c@11008000/touchscreen@10[0]'
[    2.252001] of_get_named_gpiod_flags: can't parse 'reset-gpio' property=
 of node '/soc/i2c@11008000/touchscreen@10[0]'
[    2.252075] i2c_hid_of 1-0010: using lookup tables for GPIO lookup
[    2.252084] i2c_hid_of 1-0010: No GPIO consumer reset found
[    2.252337] i2c_hid_of 1-0010: supply vddl not found, using dummy regul=
ator
[    2.252803] mtk-msdc 11230000.mmc: using DT '/soc/mmc@11230000' for 'wp=
' GPIO lookup
[    2.252950] mtk-msdc 11240000.mmc: using DT '/soc/mmc@11240000' for 'wp=
' GPIO lookup
[    2.252968] of_get_named_gpiod_flags: can't parse 'wp-gpios' property o=
f node '/soc/mmc@11240000[0]'
[    2.252982] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of=
 node '/soc/mmc@11240000[0]'
[    2.252992] mtk-msdc 11240000.mmc: using lookup tables for GPIO lookup
[    2.252997] mtk-msdc 11240000.mmc: No GPIO consumer wp found
[    2.253092] mtk-msdc 11240000.mmc: allocated mmc-pwrseq
[    2.254248] mt6358-sound mt6358-sound: mt6358_platform_driver_probe(), =
dev name mt6358-sound
[    2.254403] rt5682s 5-001a: Using default DAI clk names: rt5682-dai-wcl=
k, rt5682-dai-bclk
[    2.254974] reg-fixed-voltage regulator-pp1800-dpbrdg-dx: using DT '/re=
gulator-pp1800-dpbrdg-dx' for '(default)' GPIO lookup
[    2.254986] of_get_named_gpiod_flags: parsed 'gpios' property of node '=
/regulator-pp1800-dpbrdg-dx[0]' - status (0)
[    2.254997] gpio gpiochip0: Persistence not supported for GPIO 39
[    2.256627] stackdepot: allocating hash table of 524288 entries via kvc=
alloc
[    2.256740] rt5682s 5-001a: using DT '/soc/i2c@11016000/codec@1a' for '=
realtek,ldo1-en' GPIO lookup
[    2.256748] of_get_named_gpiod_flags: can't parse 'realtek,ldo1-en-gpio=
s' property of node '/soc/i2c@11016000/codec@1a[0]'
[    2.256753] of_get_named_gpiod_flags: can't parse 'realtek,ldo1-en-gpio=
' property of node '/soc/i2c@11016000/codec@1a[0]'
[    2.256757] rt5682s 5-001a: using lookup tables for GPIO lookup
[    2.256759] rt5682s 5-001a: No GPIO consumer realtek,ldo1-en found
[    2.258059] panfrost 13040000.gpu: clock rate =3D 249999863
[    2.259341] panfrost 13040000.gpu: EM: created perf domain
[    2.264585] of_get_named_gpiod_flags: can't parse 'wp-gpios' property o=
f node '/soc/mmc@11230000[0]'
[    2.273400] panfrost 13040000.gpu: mali-g52 id 0x7402 major 0x1 minor 0=
x0 status 0x0
[    2.281173] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of=
 node '/soc/mmc@11230000[0]'
[    2.288217] panfrost 13040000.gpu: features: 00000000,00000cf7, issues:=
 00000000,00000400
[    2.288220] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x000=
00002 Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
[    2.288223] panfrost 13040000.gpu: shader_present=3D0x3 l2_present=3D0x=
1
[    2.289004] [drm] Initialized panfrost 1.2.0 for 13040000.gpu on minor =
0
[    2.293676] mtk-msdc 11230000.mmc: using lookup tables for GPIO lookup
[    2.299304] mtu3 11201000.usb: supply vusb33 not found, using dummy reg=
ulator
[    2.306876] mtk-msdc 11230000.mmc: No GPIO consumer wp found
[    2.315215] mtu3 11201000.usb: dr_mode: 3, drd: auto
[    2.324824] elan_i2c 2-0015: Elan Touchpad: Module ID: 0x0124, Firmware=
: 0x0002, Sample: 0x0004, IAP: 0x0003
[    2.325150] input: Elan Touchpad as /devices/platform/soc/11009000.i2c/=
i2c-2/2-0015/input/input0
[    2.327394] mmc0: CQHCI version 5.10
[    2.332918] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=3D52 arg=3D=
00000C00; host->error=3D0x00000002
[    2.333203] mtu3 11201000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
[    2.333532] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=3D52 arg=3D=
80000C08; host->error=3D0x00000002
[    2.362911] mmc1: new ultra high speed SDR104 SDIO card at address 0001
[    2.370661] mtu3 11201000.usb: usb3-drd: 0
[    2.384344] i2c_hid_of 1-0010: i2c_hid_get_input: IRQ triggered but the=
re's no data
[    2.389369] xhci-mtk 11200000.usb: supply vusb33 not found, using dummy=
 regulator
[    2.398375] input: hid-over-i2c 04F3:4112 Touchscreen as /devices/platf=
orm/soc/11008000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input1
[    2.404680] xhci-mtk 11200000.usb: uwk - reg:0x420, version:2
[    2.408880] input: hid-over-i2c 04F3:4112 as /devices/platform/soc/1100=
8000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input2
[    2.416440] xhci-mtk 11200000.usb: xHCI Host Controller
[    2.424030] input: hid-over-i2c 04F3:4112 as /devices/platform/soc/1100=
8000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input3
[    2.431422] sbs-battery 6-000b: using DT '/soc/spi@11010000/ec@0/i2c-tu=
nnel/sbs-battery@b' for 'sbs,battery-detect' GPIO lookup
[    2.431436] of_get_named_gpiod_flags: can't parse 'sbs,battery-detect-g=
pios' property of node '/soc/spi@11010000/ec@0/i2c-tunnel/sbs-battery@b[0]=
'
[    2.431448] of_get_named_gpiod_flags: can't parse 'sbs,battery-detect-g=
pio' property of node '/soc/spi@11010000/ec@0/i2c-tunnel/sbs-battery@b[0]'
[    2.431457] sbs-battery 6-000b: using lookup tables for GPIO lookup
[    2.431461] sbs-battery 6-000b: No GPIO consumer sbs,battery-detect fou=
nd
[    2.432872] thermal thermal_zone0: power_allocator: sustainable_power w=
ill be estimated
[    2.432957] sbs-battery 6-000b: sbs-battery: battery gas gauge device r=
egistered
[    2.434641] mtk-msdc 11230000.mmc: Final PAD_DS_TUNE: 0x11814
[    2.436245] xhci-mtk 11200000.usb: new USB bus registered, assigned bus=
 number 1
[    2.438329] mmc0: Command Queue Engine enabled
[    2.438334] mmc0: new HS400 MMC card at address 0001
[    2.438645] mmcblk0: mmc0:0001 DA4128 116 GiB
[    2.440440]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
[    2.441293] mmcblk0boot0: mmc0:0001 DA4128 4.00 MiB
[    2.441483] mmcblk0boot1: mmc0:0001 DA4128 4.00 MiB
[    2.441639] mmcblk0rpmb: mmc0:0001 DA4128 16.0 MiB, chardev (245:0)
[    2.442203] input: hid-over-i2c 04F3:4112 Stylus as /devices/platform/s=
oc/11008000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input4
[    2.449049] input: cros_ec as /devices/platform/soc/11010000.spi/spi_ma=
ster/spi0/spi0.0/11010000.spi:ec@0:keyboard-controller/input/input7
[    2.453246] xhci-mtk 11200000.usb: USB3 root hub has no ports
[    2.458801] hid-generic 0018:04F3:4112.0001: input,hidraw0: I2C HID v1.=
00 Device [hid-over-i2c 04F3:4112] on 1-0010
[    2.459398] input: cros_ec_buttons as /devices/platform/soc/11010000.sp=
i/spi_master/spi0/spi0.0/11010000.spi:ec@0:keyboard-controller/input/input=
8
[    2.469721] xhci-mtk 11200000.usb: hcc params 0x01400f99 hci version 0x=
110 quirks 0x0000000000200010
[    2.469745] cros-ec-spi spi0.0: Chrome EC device registered
[    2.469746] xhci-mtk 11200000.usb: irq 273, io mem 0x11200000
[    2.480397] sbs-battery 6-000b: I2C adapter does not support I2C_FUNC_S=
MBUS_READ_BLOCK_DATA.
               Fallback method does not support PEC.
[    2.485365] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.11
[    2.495052] sbs-battery 6-000b: Unknown chemistry: OTI0
[    2.498275] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.498278] usb usb1: Product: xHCI Host Controller
[    2.498280] usb usb1: Manufacturer: Linux 6.11.0-rc5 xhci-hcd
[    2.498282] usb usb1: SerialNumber: 11200000.usb
[    2.498835] hub 1-0:1.0: USB hub found
[    2.660760] hub 1-0:1.0: 1 port detected
[    2.665213] mtu3 11201000.usb: xHCI platform device register success...
[    2.672374] mtu3 11281000.usb: supply vusb33 not found, using dummy reg=
ulator
[    2.679849] mtu3 11281000.usb: dr_mode: 3, drd: auto
[    2.684826] mtu3 11281000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
[    2.690726] mtu3 11281000.usb: usb3-drd: 1
[    2.695133] xhci-mtk 11280000.usb: supply vusb33 not found, using dummy=
 regulator
[    2.702705] xhci-mtk 11280000.usb: uwk - reg:0x424, version:2
[    2.708587] xhci-mtk 11280000.usb: xHCI Host Controller
[    2.713999] xhci-mtk 11280000.usb: new USB bus registered, assigned bus=
 number 2
[    2.722889] xhci-mtk 11280000.usb: hcc params 0x01400f99 hci version 0x=
110 quirks 0x0000000000200010
[    2.732033] xhci-mtk 11280000.usb: irq 274, io mem 0x11280000
[    2.737818] xhci-mtk 11280000.usb: xHCI Host Controller
[    2.743138] xhci-mtk 11280000.usb: new USB bus registered, assigned bus=
 number 3
[    2.750533] xhci-mtk 11280000.usb: Host supports USB 3.2 Enhanced Super=
Speed
[    2.758162] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.11
[    2.766478] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.773713] usb usb2: Product: xHCI Host Controller
[    2.778586] usb usb2: Manufacturer: Linux 6.11.0-rc5 xhci-hcd
[    2.784340] usb usb2: SerialNumber: 11280000.usb
[    2.789333] hub 2-0:1.0: USB hub found
[    2.793169] hub 2-0:1.0: 1 port detected
[    2.797258] usb usb3: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.805670] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.11
[    2.814124] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.821399] usb usb3: Product: xHCI Host Controller
[    2.826323] usb usb3: Manufacturer: Linux 6.11.0-rc5 xhci-hcd
[    2.832075] usb usb3: SerialNumber: 11280000.usb
[    2.837138] hub 3-0:1.0: USB hub found
[    2.840907] hub 3-0:1.0: 1 port detected
[    2.844959] mtu3 11281000.usb: xHCI platform device register success...
[    2.851851] ps8640 0-0008: using DT '/soc/i2c@11007000/edp-bridge@8' fo=
r 'powerdown' GPIO lookup
[    2.851863] of_get_named_gpiod_flags: parsed 'powerdown-gpios' property=
 of node '/soc/i2c@11007000/edp-bridge@8[0]' - status (0)
[    2.851886] gpio gpiochip0: Persistence not supported for GPIO 96
[    2.851892] ps8640 0-0008: using DT '/soc/i2c@11007000/edp-bridge@8' fo=
r 'reset' GPIO lookup
[    2.851897] of_get_named_gpiod_flags: parsed 'reset-gpios' property of =
node '/soc/i2c@11007000/edp-bridge@8[0]' - status (0)
[    2.851903] gpio gpiochip0: Persistence not supported for GPIO 98
[    3.059863] usb 1-1: new high-speed USB device number 2 using xhci-mtk
[    3.161994] panel-simple-dp-aux aux-0-0008: using DT '/soc/i2c@11007000=
/edp-bridge@8/aux-bus/panel' for 'hpd' GPIO lookup
[    3.162023] of_get_named_gpiod_flags: can't parse 'hpd-gpios' property =
of node '/soc/i2c@11007000/edp-bridge@8/aux-bus/panel[0]'
[    3.162039] of_get_named_gpiod_flags: can't parse 'hpd-gpio' property o=
f node '/soc/i2c@11007000/edp-bridge@8/aux-bus/panel[0]'
[    3.162050] panel-simple-dp-aux aux-0-0008: using lookup tables for GPI=
O lookup
[    3.162055] panel-simple-dp-aux aux-0-0008: No GPIO consumer hpd found
[    3.162236] panel-simple-dp-aux aux-0-0008: using DT '/soc/i2c@11007000=
/edp-bridge@8/aux-bus/panel' for 'enable' GPIO lookup
[    3.162250] of_get_named_gpiod_flags: can't parse 'enable-gpios' proper=
ty of node '/soc/i2c@11007000/edp-bridge@8/aux-bus/panel[0]'
[    3.162262] of_get_named_gpiod_flags: can't parse 'enable-gpio' propert=
y of node '/soc/i2c@11007000/edp-bridge@8/aux-bus/panel[0]'
[    3.162271] panel-simple-dp-aux aux-0-0008: using lookup tables for GPI=
O lookup
[    3.162275] panel-simple-dp-aux aux-0-0008: No GPIO consumer enable fou=
nd
[    3.188064] usb 2-1: new high-speed USB device number 2 using xhci-mtk
[    3.197181] usb 1-1: New USB device found, idVendor=3D13d3, idProduct=
=3D56ee, bcdDevice=3D22.01
[    3.205377] usb 1-1: New USB device strings: Mfr=3D3, Product=3D1, Seri=
alNumber=3D2
[    3.212510] usb 1-1: Product: USB2.0 HD UVC WebCam
[    3.217295] usb 1-1: Manufacturer: Azurewave
[    3.221557] usb 1-1: SerialNumber: 0x0001
[    3.318191] panel-simple-dp-aux aux-0-0008: Detected AUO B140HAN04.0 (0=
x403d)
[    3.326281] it6505 3-005c: can not get extcon device!
[    3.333237] usb 2-1: New USB device found, idVendor=3D05e3, idProduct=
=3D0610, bcdDevice=3D20.03
[    3.339100] mtk-iommu 14016000.iommu: bound 14003000.smi (ops 0xffffffd=
be59f7e80)
[    3.341485] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.349004] mtk-iommu 14016000.iommu: bound 14004000.smi (ops 0xffffffd=
be59f7e80)
[    3.356067] usb 2-1: Product: USB2.1 Hub
[    3.356072] usb 2-1: Manufacturer: GenesysLogic
[    3.363547] mtk-iommu 14016000.iommu: bound 1b002000.smi (ops 0xffffffd=
be59f7e80)
[    3.363556] mtk-iommu 14016000.iommu: bound 1602e000.smi (ops 0xffffffd=
be59f7e80)
[    3.368385] hub 2-1:1.0: USB hub found
[    3.372021] mtk-iommu 14016000.iommu: bound 17010000.smi (ops 0xffffffd=
be59f7e80)
[    3.379786] hub 2-1:1.0: 4 ports detected
[    3.402321] mtk-iommu 14016000.iommu: bound 14023000.smi (ops 0xffffffd=
be59f7e80)
[    3.409810] mtk-iommu 14016000.iommu: bound 1502e000.smi (ops 0xffffffd=
be59f7e80)
[    3.417286] mtk-iommu 14016000.iommu: bound 1582e000.smi (ops 0xffffffd=
be59f7e80)
[    3.424759] mtk-iommu 14016000.iommu: bound 1a001000.smi (ops 0xffffffd=
be59f7e80)
[    3.432232] mtk-iommu 14016000.iommu: bound 1a002000.smi (ops 0xffffffd=
be59f7e80)
[    3.439704] mtk-iommu 14016000.iommu: bound 1a00f000.smi (ops 0xffffffd=
be59f7e80)
[    3.447176] mtk-iommu 14016000.iommu: bound 1a010000.smi (ops 0xffffffd=
be59f7e80)
[    3.454517] usb 3-1: new SuperSpeed USB device number 2 using xhci-mtk
[    3.454648] mtk-iommu 14016000.iommu: bound 1c10f000.smi (ops 0xffffffd=
be59f7e80)
[    3.454651] mtk-iommu 14016000.iommu: bound 1c00f000.smi (ops 0xffffffd=
be59f7e80)
[    3.476301] mediatek-disp-ovl 14005000.ovl: Adding to iommu group 0
[    3.478054] usb 3-1: New USB device found, idVendor=3D05e3, idProduct=
=3D0620, bcdDevice=3D20.03
[    3.482998] mediatek-disp-ovl 14006000.ovl: Adding to iommu group 0
[    3.490781] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.497203] mediatek-disp-rdma 14007000.rdma: Adding to iommu group 0
[    3.504185] usb 3-1: Product: USB3.2 Hub
[    3.510762] mediatek-disp-rdma 1401f000.rdma: Adding to iommu group 0
[    3.514545] usb 3-1: Manufacturer: GenesysLogic
[    3.521208] mediatek-drm mediatek-drm.6.auto: bound 14005000.ovl (ops 0=
xffffffdbe598b0e0)
[    3.526413] hub 3-1:1.0: USB hub found
[    3.533687] mediatek-drm mediatek-drm.6.auto: bound 14006000.ovl (ops 0=
xffffffdbe598b0e0)
[    3.533691] mediatek-drm mediatek-drm.6.auto: bound 14007000.rdma (ops =
0xffffffdbe598c290)
[    3.533693] mediatek-drm mediatek-drm.6.auto: bound 14009000.color (ops=
 0xffffffdbe598a890)
[    3.533696] mediatek-drm mediatek-drm.6.auto: bound 1400b000.ccorr (ops=
 0xffffffdbe598a618)
[    3.533699] mediatek-drm mediatek-drm.6.auto: bound 1400c000.aal (ops 0=
xffffffdbe598a3a8)
[    3.533701] mediatek-drm mediatek-drm.6.auto: bound 1400d000.gamma (ops=
 0xffffffdbe598abd8)
[    3.534033] hub 3-1:1.0: 4 ports detected
[    3.539047] mediatek-drm mediatek-drm.6.auto: bound 14013000.dsi (ops 0=
xffffffdbe5990a70)
[    3.599341] mediatek-drm mediatek-drm.6.auto: bound 1401f000.rdma (ops =
0xffffffdbe598c290)
[    3.607783] mediatek-drm mediatek-drm.6.auto: Not creating crtc 1 becau=
se component 10 is disabled or missing
[    3.618925] [drm] Initialized mediatek 1.0.0 for mediatek-drm.6.auto on=
 minor 1
[    3.772082] Console: switching to colour frame buffer device 240x67
[    3.791363] mediatek-drm mediatek-drm.6.auto: [drm] fb0: mediatekdrmfb =
frame buffer device
[    3.800520] gpio-keys gpio-keys: using DT '/gpio-keys/pen-insert-switch=
' for '(default)' GPIO lookup
[    3.800536] of_get_named_gpiod_flags: parsed 'gpios' property of node '=
/gpio-keys/pen-insert-switch[0]' - status (0)
[    3.800546] gpio gpiochip0: Persistence not supported for GPIO 18
[    3.800624] input: gpio-keys as /devices/platform/gpio-keys/input/input=
9
[    3.807724] gpio-keys wifi-wakeup: using DT '/wifi-wakeup/wowlan-event'=
 for '(default)' GPIO lookup
[    3.807752] of_get_named_gpiod_flags: parsed 'gpios' property of node '=
/wifi-wakeup/wowlan-event[0]' - status (0)
[    3.807763] gpio gpiochip0: Persistence not supported for GPIO 7
[    3.807835] input: wifi-wakeup as /devices/platform/wifi-wakeup/input/i=
nput10
[    3.815507] clk: Disabling unused clocks
[    3.819806] PM: genpd: Disabling unused power domains
[    3.824962] ALSA device list:
[    3.827963]   No soundcards found.
[    3.831432] Waiting for root device /dev/sda3...
[    5.434880] usb 2-1.2: new high-speed USB device number 3 using xhci-mt=
k
[    6.189085] usb 3-1.2: new SuperSpeed USB device number 3 using xhci-mt=
k
[    6.209312] usb 3-1.2: New USB device found, idVendor=3D152d, idProduct=
=3D0578, bcdDevice=3D 4.04
[    6.217957] usb 3-1.2: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D3
[    6.225490] usb 3-1.2: Product: USB 3.0 Device
[    6.230076] usb 3-1.2: Manufacturer: USB 3.0 Device
[    6.235186] usb 3-1.2: SerialNumber: 000000004590
[    6.241623] usb-storage 3-1.2:1.0: USB Mass Storage device detected
[    6.248354] usb-storage 3-1.2:1.0: Quirks match for vid 152d pid 0578: =
1000000
[    6.255824] scsi host0: usb-storage 3-1.2:1.0
[    7.267713] scsi 0:0:0:0: Direct-Access     TOSHIBA  MQ01ABD075       0=
404 PQ: 0 ANSI: 6
[    7.304124] sd 0:0:0:0: [sda] 1465149168 512-byte logical blocks: (750 =
GB/699 GiB)
[    7.312782] sd 0:0:0:0: [sda] Write Protect is off
[    7.317603] sd 0:0:0:0: [sda] Mode Sense: 47 00 00 08
[    7.318062] sd 0:0:0:0: [sda] Disabling FUA
[    7.322289] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled=
, doesn't support DPO or FUA
[    7.447302]  sda: sda1 sda2 sda3
[    7.451363] sd 0:0:0:0: [sda] Attached SCSI disk
[    7.575863] EXT4-fs (sda3): mounted filesystem a9105ace-70f4-4ead-80ee-=
101047c8bc0e r/w with ordered data mode. Quota mode: disabled.
[    7.588052] VFS: Mounted root (ext4 filesystem) on device 8:3.
[    7.619419] devtmpfs: mounted
[    7.625648] Freeing unused kernel memory: 5504K
[    7.630387] Run /sbin/init as init process
[    7.634539]   with arguments:
[    7.634542]     /sbin/init
[    7.634545]     cros_secure
[    7.634548]     noinitrd
[    7.634551]   with environment:
[    7.634553]     HOME=3D/
[    7.634556]     TERM=3Dlinux
[   14.306874] platform sound: deferred probe pending: mt8186_mt6366: I2S3=
: codec dai not found
[   19.052320] LoadPin: sda3 (8:3): writable
[   19.052359] LoadPin: kernel-module pinned obj=3D"/lib/modules/6.11.0-rc=
5/kernel/drivers/hid/hid-multitouch.ko" pid=3D616 cmdline=3D"(udev-worker)=
"
[   19.368186] input: hid-over-i2c 04F3:4112 as /devices/platform/soc/1100=
8000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input11
[   19.368449] input: hid-over-i2c 04F3:4112 UNKNOWN as /devices/platform/=
soc/11008000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input12
[   19.368696] input: hid-over-i2c 04F3:4112 UNKNOWN as /devices/platform/=
soc/11008000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input13
[   19.368898] input: hid-over-i2c 04F3:4112 Stylus as /devices/platform/s=
oc/11008000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input14
[   19.369080] input: hid-over-i2c 04F3:4112 UNKNOWN as /devices/platform/=
soc/11008000.i2c/i2c-1/1-0010/0018:04F3:4112.0001/input/input15
[   19.369421] hid-multitouch 0018:04F3:4112.0001: input,hidraw0: I2C HID =
v1.00 Device [hid-over-i2c 04F3:4112] on 1-0010
[   21.257490] mtk-scp 10500000.scp: assigned reserved memory node memory@=
50000000
[   21.258407] remoteproc remoteproc0: scp is available
[   22.161303] remoteproc remoteproc0: powering up scp
[   22.161320] remoteproc remoteproc0: Booting fw image mediatek/mt8186/sc=
p.img, size 419212
[   22.161332] mtk-scp 10500000.scp: IPI buf addr 0x0003bdb0
[   22.249273] mtk-scp 10500000.scp: creating channel cros-ec-rpmsg addr 0=
xd
[   22.249349] mtk-scp 10500000.scp: SCP is ready. FW version corsola_scp_=
v2.0.19842-a90fda81
[   22.249361] remoteproc remoteproc0: remote processor scp is now up
[   22.249951] cros-ec-dev cros-ec-dev.19.auto: CrOS System Control Proces=
sor MCU detected
[   22.250253] gpiochip_find_base_unlocked: found new base at 749
[   22.250629] gpio gpiochip2: (cros-ec-gpio.20.auto): added GPIO chardev =
(254:2)
[   22.250696] gpio gpiochip2: registered GPIOs 749 to 750 on cros-ec-gpio=
.20.auto
[   22.252181] cros-ec-rpmsg 10500000.scp.cros-ec-rpmsg.13.-1: Chrome EC d=
evice registered
[   22.968966] Bluetooth: Core ver 2.22
[   22.969058] NET: Registered PF_BLUETOOTH protocol family
[   22.969062] Bluetooth: HCI device and connection manager initialized
[   22.969080] Bluetooth: HCI socket layer initialized
[   22.969085] Bluetooth: L2CAP socket layer initialized
[   22.969097] Bluetooth: SCO socket layer initialized
[   23.649963] sx9324 4-0028: error -ETIMEDOUT: Unable to initialize senso=
r
[   23.650918] sx9324 4-0028: probe with driver sx9324 failed with error -=
110
[   24.213358] usb 1-1: using lookup tables for GPIO lookup
[   24.213377] usb 1-1: No GPIO consumer privacy found
[   24.213382] usb 1-1: Found UVC 1.10 device USB2.0 HD UVC WebCam (13d3:5=
6ee)
[   24.215025] usbcore: registered new interface driver uvcvideo
[   24.322277] btmtksdio mmc1:0001:2: using DT '/soc/mmc@11240000/bluetoot=
h@2' for 'reset' GPIO lookup
[   24.322321] of_get_named_gpiod_flags: parsed 'reset-gpios' property of =
node '/soc/mmc@11240000/bluetooth@2[0]' - status (0)
[   24.322352] gpio gpiochip0: Persistence not supported for GPIO 155
[   24.341662] mtk-jpeg 17030000.jpeg-encoder: Adding to iommu group 1
[   24.342745] mtk-jpeg 17030000.jpeg-encoder: mtk-jpeg-enc device registe=
red as /dev/video2 (81,2)
[   24.403427] Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 202=
30526131214
[   24.421448] mtk-vcodec-enc 17020000.video-encoder: Adding to iommu grou=
p 1
[   24.621415] sof-audio-of-mt8186 10680000.adsp: DT DSP detected
[   24.621584] sof-audio-of-mt8186 10680000.adsp: assigned reserved memory=
 node memory@61000000
[   24.796260] sof-audio-of-mt8186 10680000.adsp: Firmware paths/files for=
 ipc type 0:
[   24.796283] sof-audio-of-mt8186 10680000.adsp:  Firmware file:     medi=
atek/sof/sof-mt8186.ri
[   24.796290] sof-audio-of-mt8186 10680000.adsp:  Topology file:     medi=
atek/sof-tplg/sof-mt8186.tplg
[   24.796614] sof-audio-of-mt8186 10680000.adsp: Firmware info: version 2=
:0:0-714c6
[   24.796635] sof-audio-of-mt8186 10680000.adsp: Firmware: ABI 3:22:1 Ker=
nel ABI 3:23:0
[   24.796663] sof-audio-of-mt8186 10680000.adsp: unknown sof_ext_man head=
er type 3 size 0x30
[   24.801693] sof-audio-of-mt8186 10680000.adsp: Firmware info: version 2=
:0:0-714c6
[   24.801715] sof-audio-of-mt8186 10680000.adsp: Firmware: ABI 3:22:1 Ker=
nel ABI 3:23:0
[   25.095285] mtk-vcodec-dec 16000000.video-decoder: Adding to iommu grou=
p 1
[   25.199190] mtk-vdec-comp 16025000.video-codec: Adding to iommu group 1
[   25.760881] mt7921s mmc1:0001:1: HW/SW Version: 0x8a108a10, Build Time:=
 20230331110902a

[   26.023720] mt7921s mmc1:0001:1: WM Firmware Version: ____010000, Build=
 Time: 20230331110939
[   27.663146] Bluetooth: hci0: Device setup in 3260231 usecs
[   27.744137] Bluetooth: hci0: AOSP extensions version v1.00
[   27.744160] Bluetooth: hci0: AOSP quality report is supported
[   31.420497] wlan0: authenticate with 94:10:3e:8c:ab:ae (local address=
=3Dcc:47:40:a3:19:2a)
[   31.562664] wlan0: send auth to 94:10:3e:8c:ab:ae (try 1/3)
[   31.567625] wlan0: authenticated
[   31.568821] wlan0: associate with 94:10:3e:8c:ab:ae (try 1/3)
[   31.601217] wlan0: RX AssocResp from 94:10:3e:8c:ab:ae (capab=3D0x431 s=
tatus=3D0 aid=3D1)
[   31.668122] wlan0: associated
[   34.274342] pp1840_vaux18: disabling
[   34.274634] pp2800_vaud28: disabling

cat /sys/kernel/debug/devices_deferred
sound	mt8186_mt6366: I2S3: codec dai not found

