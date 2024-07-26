Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47344C3DA49
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jul 2024 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=adbeiw8mhZXnVlqswKhVAzGjiOlGpKozbWfNjla6L4w=; b=C6+uQ8coOXCC9FXOxV4UmzzQCj
	m2Q6AmlicqRrur8CNVsaMsLkAu+YIAPRM6d7xXVYXvF3vnWDPIh2FkmdblEiM430br1ypiEAUPEfm
	/SDCE+DLXV0hyk87Hf0ycHDWSGR2Auk21OMbjj1SmMNlST/v71YUKHZ686aQaKNoQ6s3s+hNnRfyx
	8S1J4iK0oMZYgMkOxtqg0WCPmsFuH1snD8ZqtMU0NDyrEQH20hu5gxLTp9L+giVOXWNZNy8Bh5G+E
	RzhqpQD1mCrtVzJnE1JMIc2O4BpmzvoG6zKmVXoRjZ5sUossYdEozQrYJyAwzPzjW0DCRgE+GGkLb
	9246C1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOVe-00000004Uti-0kVS;
	Fri, 26 Jul 2024 17:13:38 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOVb-00000004Urm-1mzh;
	Fri, 26 Jul 2024 17:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1722013999; x=1722618799; i=frank-w@public-files.de;
	bh=adbeiw8mhZXnVlqswKhVAzGjiOlGpKozbWfNjla6L4w=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ix/RfOf2Dxisid/T5P8VR4OXu/Mu0DRIcquNwj8+BSDuqIJSxwS1VVGw5D3+qNf6
	 nhAt0SGcH7A4CpIPEsl1Y9M0bpm6fNnMMP/HcaaPOn5VYNhW9CYDm46CQ8viNAvRs
	 q9mcNkAPaWAshY4UFS5itYCxW8I6YIRWlLX++et78w+kkBN3JG3TtMVP08ATA6EQn
	 4reFD/7XJ3zqtBcu9m+qvikGL1OmnQMO2QoORSBIvjSD25oyHXeeA+5LKgTZ3U7Td
	 0cKPXjugQ0fDR4fol6QZM0LzzHkZoagXGg61O0IuKujHaAbv4MXIM44/3b6vnde/9
	 upzOH44J/ZzpMbMnKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.150.223] ([217.61.150.223]) by web-mail.gmx.net
 (3c-app-gmx-bap12.server.lan [172.19.172.82]) (via HTTP); Fri, 26 Jul 2024
 19:13:19 +0200
MIME-Version: 1.0
Message-ID: <trinity-c8e0af34-2704-476a-9454-bf5001256eb9-1722013999541@3c-app-gmx-bap12>
From: Frank Wunderlich <frank-w@public-files.de>
To: Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, John Crispin <john@phrozen.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: mt7988 usb broken on 6.10
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jul 2024 19:13:19 +0200
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: V03:K1:3rKMsO/Abw28KhJy7BtxmXg9Ite3PaZNCS5EXwfq70cWabR+1gYuODQOgQsAJsNTiL5TM
 ENZkaeKRQ4FzS9xwohL3cS03fRGvGnQxd55WBErLZNt6wsPDfP1AhpkZ2NYGHDkzN1lNzNk2pTWJ
 BQ9lk00eVDUpf1qNLT+YClEEOhHlTeX/P8+6D/C+Cl/j5M+0n2a/LM9UDfTK2AaZYUThwPAhCcm6
 yhxEH8DaNdn4lsv3c2tovFHtQUbC0hzcvN9dwsYD6tFzUl/DzLPKe7I+R+Bg3ad6uLyoQgnoZs/c
 Ug=
UI-OutboundReport: notjunk:1;M01:P0:JnFneIi32xM=;QiickcppS5KUkwD/4RYxSSh7gtn
 /eTr0X3Zble+hw3aTYnlQxznaXVylljQND7MqOTrnpYFeBIxCo69Hryq81/VPAQuTyjPvTUSK
 0s9cbs6CZJSOgnarPia1Q3JIsCxlAIy8qFm2NqEhKm/fTGZbK0z111RuhfZ43DsN4Zgs4eOZy
 ZiVuSTQcLgvXtNuP92xRWqs39Wn5BRM1LKlWpAZVH+8afdMLDSATSnOibSShcLjB5hIInywvw
 /WMeZl62T0QSsiPLRedMw4/GaMBYJnC1W52cjsq5eLkC5GUXWoNmpqPwDYgU/T3+2WpEnjaOZ
 BNvXqHC4OSm0BE0qr2uQMc7S3r3lJ0Wt3L6KHkAisAyX6Njd5fCKwUWFcC2dRjOlv5NfIXO61
 XD43ImcKpzx/mKVz5ihymk3p4dCnJLD/QkFOVJL3VgRf9IaiWNd9jims9VA3E6fTBYsGeu9Lw
 ggL7ic8HQh+vHFJH78ZOkVt8jZko+QsjR2ENmkr3hzqZttw/ZGCQr1XSWidtRySmzhVDiKqD6
 2VAKTZVna6AUq8ql0iHdiOymv8o8XHCihAFNP9rDNJsZ+hs9nvlmRDEFnrSEze+V7tj7g1h0L
 c6DnioZXTAJxfy9YgsCmb4Ow7UbUGHqs05Q4KKGtuE8cQJAav4Y+7MKMDmlGqrDAUSSfT9EoE
 e6E4oxTd4/uCDJj+Nsg4MOYTa7aKVl6PPdeEdz1Rxw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_101335_868537_AF0062C2 
X-CRM114-Status: GOOD (  10.27  )
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

Hi,

i've noticed that usb on mt7988 is broken in 6=2E10, was working on 6=2E9 =
(with some additional patches like
for pinctrl and dts as this chipset is not completely supported by mainlin=
e yet)=2E

i see this in my dmesg

[    6=2E147068] irq 105: nobody cared (try booting with the "irqpoll" opt=
ion)                                                                    =20
[    6=2E153851] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6=2E10=2E0-bpi-=
r4-main #1                                                                 =
 =20
[    6=2E160803] Hardware name: Banana Pi BPI-R4 (DT)                     =
                                                                        =20
[    6=2E165409] Call trace:                                              =
                                                                        =20
[    6=2E167846]  dump_backtrace+0x94/0x114                               =
                                                                        =20
[    6=2E171593]  show_stack+0x18/0x24                                    =
                                                                        =20
[    6=2E174898]  dump_stack_lvl+0x74/0x8c                                =
                                                                        =20
[    6=2E178553]  dump_stack+0x18/0x24                                    =
                                                                        =20
[    6=2E181859]  __report_bad_irq+0x38/0x120                             =
                                                                        =20
[    6=2E185775]  note_interrupt+0x308/0x358                              =
                                                                        =20
[    6=2E189601]  handle_irq_event+0xd8/0xec                              =
                                                                        =20
[    6=2E193427]  handle_fasteoi_irq+0xb0/0x284                           =
                                                                        =20
[    6=2E197515]  generic_handle_domain_irq+0x2c/0x44                     =
                                                                        =20
[    6=2E202121]  gic_handle_irq+0x4c/0x118                               =
                                                                        =20
[    6=2E205861]  call_on_irq_stack+0x24/0x4c                             =
                                                                        =20
[    6=2E209774]  do_interrupt_handler+0x80/0x84                          =
                                                                        =20
[    6=2E213947]  el1_interrupt+0x34/0x54                                 =
                                                                        =20
[    6=2E217514]  el1h_64_irq_handler+0x18/0x24                           =
                                                                        =20
[    6=2E221600]  el1h_64_irq+0x68/0x6c                                   =
                                                                        =20
[    6=2E224991]  default_idle_call+0x50/0xf0                             =
                                                                        =20
[    6=2E228905]  do_idle+0xac/0xfc                                       =
                                                                        =20
[    6=2E231952]  cpu_startup_entry+0x38/0x3c                             =
                                                                        =20
[    6=2E235865]  kernel_init+0x0/0x1d8                                   =
                                                                        =20
[    6=2E239259]  start_kernel+0x4ac/0x710                                =
                                                                        =20
[    6=2E242914]  __primary_switched+0x80/0x88                            =
                                                                        =20
[    6=2E246916] handlers:                                                =
                                                                        =20
[    6=2E249177] [<(____ptrval____)>] usb_hcd_irq                         =
                                                                        =20
[    6=2E253443] Disabling IRQ #105
=2E=2E=2E
[   45=2E305428] xhci-mtk 11200000=2Eusb: xHCI host not responding to stop=
 endpoint command                                                       =20
[   45=2E351865] xhci-mtk 11200000=2Eusb: Host halt failed, -110          =
                                                                          =
=20
[   45=2E357253] xhci-mtk 11200000=2Eusb: xHCI host controller not respond=
ing, assume dead                                                          =
=20
[   45=2E364918] xhci-mtk 11200000=2Eusb: HC died; cleaning up=20

maybe anybody can point me to possible rootcause? as this seem to happen s=
omewhere in interrupt-handling i have no idea where to search

this is what i did till now:

# cat /proc/interrupts| grep xhci
104:          0          0          0          0     GICv3 205 Level     x=
hci-hcd:usb1
105:     100201          0          0          0     GICv3 204 Level     x=
hci-hcd:usb3

mtk xhci driver itself seems unchanged so far

$ git logone drivers/usb/host/xhci-mtk*
06790c19086f 2024-02-29 xhci: replace real & fake port with pointer to roo=
t hub port Niklas Neronin=20
017dbfc05c31 2024-01-04 usb: xhci-mtk: fix a short packet issue of gen1 is=
oc-in transfer Chunfeng Yun=20

clocks seems also not the cause

$ git logone drivers/clk/mediatek/
878e845d8db0 2024-06-13 clk: mediatek: mt8183: Only enable runtime PM on m=
t8183-mfgcfg Pin-yen Lin=20
619b92b9c8fe 2024-05-18 Merge tag 'clk-for-linus' of git://git=2Ekernel=2E=
org/pub/scm/linux/kernel/git/clk/linux Linus Torvalds=20
4c0c087772d7 2024-04-18 clk: mediatek: mt8365-mm: fix DPI0 parent Alexandr=
e Mergnat=20
bb7b3c8e7180 2024-03-08 clk: mediatek: pllfh: Don't log error for missing =
fhctl node N=C3=ADcolas F=2E R=2E A=2E Prado=20


also when trying to find any error like pinctrl or similar seems not showi=
ng any more like above related to usb

root@bpi-r4-v11:~
# dmesg | grep -i 'err\|fail\|unable'
[    0=2E000000] CPU features: detected: ARM erratum 858921
[    0=2E000000] arch_timer: Enabling local workaround for ARM erratum 858=
921
[    0=2E044091] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0=2E070823] arch_timer: Enabling local workaround for ARM erratum 858=
921
[    0=2E071164] arch_timer: Enabling local workaround for ARM erratum 858=
921
[    0=2E071448] arch_timer: Enabling local workaround for ARM erratum 858=
921
[    0=2E330245] platform 11280000=2Epcie: Fixed dependency cycle(s) with =
/soc/pcie@11280000/interrupt-controller
[    0=2E340164] platform 11290000=2Epcie: Fixed dependency cycle(s) with =
/soc/pcie@11290000/interrupt-controller
[    0=2E350045] platform 11300000=2Epcie: Fixed dependency cycle(s) with =
/soc/pcie@11300000/interrupt-controller
[    0=2E359926] platform 11310000=2Epcie: Fixed dependency cycle(s) with =
/soc/pcie@11310000/interrupt-controller
[    0=2E671440] mtk-xsphy soc:xphy@11e10000: failed to get ref_clk(id-1)
[    0=2E686306] mtk-socinfo mtk-socinfo=2E0=2Eauto: error -ENOENT: Failed=
 to get socinfo data
[    0=2E694258] mtk-socinfo mtk-socinfo=2E0=2Eauto: probe with driver mtk=
-socinfo failed with error -2
[    1=2E344755] ubi0 error: ubi_read_volume_table: the layout volume was =
not found
[    1=2E352050] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, er=
ror -22
[    1=2E714508] rtc-pcf8563 2-0051: hctosys: unable to read the hardware =
clock
[    1=2E805626] mtk-msdc 11230000=2Emmc: msdc_track_cmd_data: cmd=3D52 ar=
g=3D00000C00; host->error=3D0x00000002
[    1=2E818727] mtk-msdc 11230000=2Emmc: msdc_track_cmd_data: cmd=3D52 ar=
g=3D80000C08; host->error=3D0x00000002
[    1=2E835940] mtk-msdc 11230000=2Emmc: msdc_track_cmd_data: cmd=3D5 arg=
=3D00000000; host->error=3D0x00000002
[    1=2E850219] mtk-msdc 11230000=2Emmc: msdc_track_cmd_data: cmd=3D5 arg=
=3D00000000; host->error=3D0x00000002
[    1=2E867994] mtk-msdc 11230000=2Emmc: msdc_track_cmd_data: cmd=3D5 arg=
=3D00000000; host->error=3D0x00000002
[    1=2E877061] mtk-msdc 11230000=2Emmc: msdc_track_cmd_data: cmd=3D5 arg=
=3D00000000; host->error=3D0x00000002
[    2=2E005070] GPT: Use GNU Parted to correct GPT errors=2E
[    2=2E184228] mtk-pcie-gen3 11280000=2Epcie: probe with driver mtk-pcie=
-gen3 failed with error -110
[    6=2E185775]  note_interrupt+0x308/0x358
[    6=2E209774]  do_interrupt_handler+0x80/0x84
[    6=2E213947]  el1_interrupt+0x34/0x54
[    6=2E809767] systemd[1]: Failed to look up module alias 'autofs4': Fun=
ction not implemented
[    7=2E765542] systemd[1]: Arbitrary Executable File Formats File System=
 Automount Point was skipped because of a failed condition check (Condit=2E
[    8=2E099430] systemd[1]: Journal Audit Socket was skipped because of a=
 failed condition check (ConditionSecurity=3Daudit)=2E
[    8=2E285821] systemd[1]: Huge Pages File System was skipped because of=
 a failed condition check (ConditionPathExists=3D/sys/kernel/mm/hugepages)=
=2E
[    8=2E455617] systemd[1]: Create List of Static Device Nodes was skippe=
d because of a failed condition check (ConditionFileNotEmpty=3D/lib/module=
=2E
[    8=2E685692] systemd[1]: Repartition Root Disk was skipped because all=
 trigger condition checks failed=2E
[   45=2E351865] xhci-mtk 11200000=2Eusb: Host halt failed, -110

because of the pcie interrupt messages i checked my nvme and wifi-card and=
 look sgood, so it seems no generic interrupt issue

# lspci
0000:00:00=2E0 PCI bridge: MEDIATEK Corp=2E Device 7988 (rev 01)
0000:01:00=2E0 Network controller: MEDIATEK Corp=2E Device 7990
0001:00:00=2E0 PCI bridge: MEDIATEK Corp=2E Device 7988 (rev 01)
0001:01:00=2E0 Network controller: MEDIATEK Corp=2E Device 7991
0002:00:00=2E0 PCI bridge: MEDIATEK Corp=2E Device 7988 (rev 01)
0002:01:00=2E0 Non-Volatile memory controller: ADATA Technology Co=2E, Ltd=
=2E ADATA XPG GAMMIXS1 1L Media (rev 01)

full source is here:

https://github=2Ecom/frank-w/BPI-Router-Linux/tree/6=2E10-main

regards Frank

