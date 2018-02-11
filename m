From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Questions about bringing up MT7623 board
Date: Sun, 11 Feb 2018 15:01:25 +0100
Message-ID: <CAKfDRXiQb3LMSdjfE=CkfJE5bj9H+GAVD2Kj4syNfQD-eUPmWg@mail.gmail.com>
References: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q@mail.gmail.com>
 <CAKfDRXg0jeHP9xZRGDNm5tfW1afZd-TPfwbwUzEPiWsy_bfuUQ@mail.gmail.com>
 <fc2bf32a-eb81-6cd1-9085-b8786ddf0f9c@phrozen.org>
 <CAKfDRXjpG4CNeHfKC1Kg=6mrqUTZ8A7bD1aivLkSQ2L0eK755Q@mail.gmail.com>
 <6ae4103b-45bf-c427-d0d9-87f6f4eb83b5@phrozen.org>
 <CAKfDRXiJCMpA+qj4HmoSg0F_Yt4LnjQ=Dvy_tkxa=Dnh_pN13g@mail.gmail.com>
 <12343512-196f-c89f-e7dc-2e35cad49fc8@phrozen.org>
 <CAKfDRXg66Un3c7U=WTSUYoduDkAD+jsL-tzxnYUSLHKrmFKiOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAKfDRXg66Un3c7U=WTSUYoduDkAD+jsL-tzxnYUSLHKrmFKiOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

It turns out that enabling early printk in the kernel config did the
trick, thank you very much for pointing me to this error. I also
changed my defconfig a bit, I merged the two OpenWRT 4.9 configs
(generic and mediatek), created a new defconfig and used that as a
starting point (make ..._defconfig). Now I can finally see what is
going on and I see that the boot progresses quite far. My boot now
gets to the point where it looks for the root filesystem, but here I
have hit another problem. The kernel only produces the following
error:

[    2.037354] mmc0: new high speed MMC card at address 0001
[    2.045252] mmcblk0: mmc0:0001 008G70 7.28 GiB
[    2.053533] mmcblk0boot0: mmc0:0001 008G70 partition 1 4.00 MiB
[    2.053723] mmcblk0boot1: mmc0:0001 008G70 partition 2 4.00 MiB
[    2.053910] mmcblk0rpmb: mmc0:0001 008G70 partition 3 4.00 MiB
[    2.055456]  mmcblk0: p2 p3
[    2.056986] xhci-mtk 1a1c0000.usb: 1a1c0000.usb supply vbus not
found, using dummy regulator
[    2.153894] vpa: disabling
[    2.156608] vmc: disabling
[    2.159296] vmch: disabling
[    2.162103] vgp1: disabling
[    2.164897] vcamaf: disabling
[    2.168241] VFS: Cannot open root device "(null)" or
unknown-block(0,0): error -6
[    2.175712] Please append a correct "root=" boot option; here are
the available partitions:
[    2.184031] b300         7634944 mmcblk0
[    2.184036]  driver: mmcblk
[    2.190775]   b302         1048576 mmcblk0p2 00000000-02
[    2.190779]
[    2.197563]   b303         2097152 mmcblk0p3 00000000-03
[    2.197566]
[    2.204332] b318            4096 mmcblk0rpmb
[    2.204335]  (driver?)
[    2.210988] b310            4096 mmcblk0boot1
[    2.210992]  (driver?)
[    2.217747] b308            4096 mmcblk0boot0
[    2.217750]  (driver?)
[    2.224504] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)

My rootfs, etc, is stored on mmcblk0 and the partitioning is specified
in the boot arguments (which are:
block2mtd.block2mtd=/dev/mmcblk0,65536,eMMC,5
mtdparts=eMMC:256k(mbr)ro,512k(uboot)ro,256k(config)ro,256k(factory)ro,32M(kernel),32M(recovery),1024M(rootfs),2048M(usrdata),-(bmtpool)
 rootfstype=squashfs,jffs2). I have doublecheked, and I can't find any
missing MTD-options compared to the 4.9 config. Could it be that new
options have been added and have to be specified? For example,
MTD_BLOCK2MTD and MTD_CMDLINE_PARTS is set.

The log are also contains the following warnings:

[    1.845280] ------------[ cut here ]------------
[    1.845296] WARNING: CPU: 0 PID: 70 at drivers/clk/clk.c:594
clk_core_disable_lock+0x18/0x24
[    1.845299] Modules linked in:
[    1.845310] CPU: 0 PID: 70 Comm: kworker/0:2 Not tainted
4.14.18-ft-try-owrt-config #20
[    1.845313] Hardware name: Mediatek Cortex-A7 (Device Tree)
[    1.845323] Workqueue: pm genpd_power_off_work_fn
[    1.845347] [<c010dc80>] (unwind_backtrace) from [<c010a734>]
(show_stack+0x10/0x14)
[    1.845361] [<c010a734>] (show_stack) from [<c049a420>]
(dump_stack+0x70/0x8c)
[    1.845373] [<c049a420>] (dump_stack) from [<c01158b8>] (__warn+0xd8/0xf8)
[    1.845384] [<c01158b8>] (__warn) from [<c011597c>]
(warn_slowpath_null+0x1c/0x24)
[    1.845393] [<c011597c>] (warn_slowpath_null) from [<c02eed48>]
(clk_core_disable_lock+0x18/0x24)
[    1.845404] [<c02eed48>] (clk_core_disable_lock) from [<c02f7a70>]
(scpsys_power_off+0xd8/0x188)
[    1.845416] [<c02f7a70>] (scpsys_power_off) from [<c032afb0>]
(genpd_power_off+0x1d4/0x238)
[    1.845427] [<c032afb0>] (genpd_power_off) from [<c032b040>]
(genpd_power_off_work_fn+0x2c/0x40)
[    1.845437] [<c032b040>] (genpd_power_off_work_fn) from
[<c01298d8>] (process_one_work+0x1c0/0x310)
[    1.845448] [<c01298d8>] (process_one_work) from [<c012a79c>]
(worker_thread+0x2a0/0x400)
[    1.845460] [<c012a79c>] (worker_thread) from [<c012eab4>]
(kthread+0x114/0x12c)
[    1.845471] [<c012eab4>] (kthread) from [<c01070a8>]
(ret_from_fork+0x14/0x2c)
[    1.845476] ---[ end trace 5ecff3fb65f610bb ]---
[    1.845518] ------------[ cut here ]------------
[    1.845527] WARNING: CPU: 0 PID: 70 at drivers/clk/clk.c:476
clk_unprepare+0x24/0x2c
[    1.845529] Modules linked in:
[    1.845538] CPU: 0 PID: 70 Comm: kworker/0:2 Tainted: G        W
   4.14.18-ft-try-owrt-config #20
[    1.845541] Hardware name: Mediatek Cortex-A7 (Device Tree)
[    1.845547] Workqueue: pm genpd_power_off_work_fn
[    1.845561] [<c010dc80>] (unwind_backtrace) from [<c010a734>]
(show_stack+0x10/0x14)
[    1.845574] [<c010a734>] (show_stack) from [<c049a420>]
(dump_stack+0x70/0x8c)
[    1.845584] [<c049a420>] (dump_stack) from [<c01158b8>] (__warn+0xd8/0xf8)
[    1.845594] [<c01158b8>] (__warn) from [<c011597c>]
(warn_slowpath_null+0x1c/0x24)
[    1.845603] [<c011597c>] (warn_slowpath_null) from [<c02eef38>]
(clk_unprepare+0x24/0x2c)
[    1.845612] [<c02eef38>] (clk_unprepare) from [<c02f7a78>]
(scpsys_power_off+0xe0/0x188)
[    1.845623] [<c02f7a78>] (scpsys_power_off) from [<c032afb0>]
(genpd_power_off+0x1d4/0x238)
[    1.845633] [<c032afb0>] (genpd_power_off) from [<c032b040>]
(genpd_power_off_work_fn+0x2c/0x40)
[    1.845643] [<c032b040>] (genpd_power_off_work_fn) from
[<c01298d8>] (process_one_work+0x1c0/0x310)
[    1.845653] [<c01298d8>] (process_one_work) from [<c012a79c>]
(worker_thread+0x2a0/0x400)
[    1.845664] [<c012a79c>] (worker_thread) from [<c012eab4>]
(kthread+0x114/0x12c)
[    1.845675] [<c012eab4>] (kthread) from [<c01070a8>]
(ret_from_fork+0x14/0x2c)
[    1.845679] ---[ end trace 5ecff3fb65f610bc ]---

Based on some searching, these errors seems to be related to missing
PINCTRL. However, MT2701 is enabled.

Does anyone have any (more :)) tips on what could be wrong or where to look?

BR,
Kristian
