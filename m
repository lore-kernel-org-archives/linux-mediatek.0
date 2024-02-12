Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AC6C4829A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 02:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPPuRYsfb12FLZ+dir48GUMejvoPjJwikEh9pqvBTsA=; b=bhwqUFjCw5GK9+pFkF2oGSlkGp
	mFssRU7M7wvh5OWQvs5cRA5J/9wYrSHP5WKEBnqNvRu4H3P6LR/Drkb1wIb3cJ0e3TSy9bR8AH3BZ
	oKeAjVg5OE+QT0Oku1BVT5AXnMU3p8InW7ox7HNKys9nzueO3SDULWxLstovGNLbrV0kKFNl8+5g0
	Ooi7zKY7bmqRA8Nal97rY+Hp3O7ik5Iw6eywFdX/PlDYT80Z4OXqwJYY6jc3PPw3bLlOf+Ef/Ky+0
	3LiBhrWsIZOcO6D6v+JGRdFFMz0vw3V74VjDX6ccDyjiLuz49CWe/VF/iFJMCA52iTzCVgQckeL8I
	a6b8volQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZM5K-000000048xr-2Xwm;
	Mon, 12 Feb 2024 02:30:18 +0000
Received: from devico.uberspace.de ([185.26.156.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZL2g-00000003ubo-48GD
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Feb 2024 01:23:34 +0000
Received: (qmail 18826 invoked by uid 990); 12 Feb 2024 01:23:20 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Mon, 12 Feb 2024 02:23:20 +0100
MIME-Version: 1.0
Date: Mon, 12 Feb 2024 01:23:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <c148b24cf7696004148bd46fc679d5a3a6642df8@lausen.nl>
TLS-Required: No
Subject: Re: PROBLEM: MT8192 panel_edp_probe trace despite recent eDP and
 aux-bus support patches
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
In-Reply-To: <6dd87d1b-255f-aeea-0445-37d34d242282@collabora.com>
References: <6dd87d1b-255f-aeea-0445-37d34d242282@collabora.com>
 <ca32347a879c794577f272a1473e44ee39f2acdc@lausen.nl>
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.917256) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.017256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from;
	bh=pstkD1K9701cx26gprTBkrDUczL2TTtR5WJyEJwy5hs=;
	b=AgQkFLRzcRPdzkoJsQPdaQVqWzKve0LblgnCJUJWAKjYhb/fJJWkVaBVgONjt9POxriJRPcge9
	fOvkHAB2zx5MxgiVFFrEL7/RcweMqGW2xV482ThrJIuUrP+tBOBaGVTNQcWJDdWzwzeyyYOlV4fB
	JXNfvCuaV82MhJa50YdcLWIZXLqXLkckqZQe/f0H5J2RTcIxaM8OpCgGbrq7L3MNEldZoUSuMSZS
	NI5ubSCKR7g8EVwI16G0+HlJ6dm5rbcJhIzDkFMspt2LdfU0vBXJLh5GEUXGNBGy7AJznBryUuPU
	+cT6tXagNiYVAvfyPaENMsvYiLb9jeG4k0Y+6K4Fv6qONWay1cUPvCKqM7cmENx6Gg+JQKU2DegT
	M3nP2WhJ/uqTA+89Hypr25KicmCmEdzRFPVhKAj79e9vNSahs+q4vWYOfpzD3RgYSH4IDaGt9XgT
	G4//nmhtJobTtbfb1WohRbS+jZYXKPy8mJRgPmNjDJvk9+dVhTUuTSbmP1zzX8pEgBreGYuTh6a/
	DVHrRkMxnXZrr4mY2weLnJ2L9ivNl5Y4NNtxYMbTp1gaXyvSB8H+0itn5si0x2qbqCmiHXdTbW+C
	+WK6xs/RAYPMKHXMq/g58bNOLo9+Px5Y7tdVO46ICnA+FQ39pAfvgfwq81hhuIsTQkNrxaRiUfgz
	Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_172331_806623_57CF2206 
X-CRM114-Status: UNSURE (   8.78  )
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

Hello Angelo,

thank you for taking a look at these MT8192 issues before. The panel issu=
e reported in this thread is resolved on v6.8, possibly by the "drm for 6=
.8" changes including "chromebook panel support" and we can thus "close" =
this thread. Unfortunately, suspend [1] and sound still do not work and I=
'll follow up on them in separate threads.

Thank you
Leonard

[1] PROBLEM: mtk_pcie_suspend_noirq sleep hang breaking suspend on MT8192=
 Asurada Spherion https://lore.kernel.org/linux-mediatek/600bf03e-3be3-e6=
75-1d59-ecc5aaa2aefd@collabora.com/T/#t

September 20, 2023 at 4:14 AM, "AngeloGioacchino Del Regno" <angelogioacc=
hino.delregno@collabora.com> wrote:=20
>=20Il 20/09/23 02:58, Leonard Lausen ha scritto:
>=20
>=20>=20
>=20> Dear AngeloGioacchino, Dear Maintainers,
> >=20
>=20>  on MT8192 Asurada Spherion (Acer 514), I observe the following tra=
ce related to
> >=20
>=20>  eDP and aux-bus during bootup with tags/mediatek-drm-next-6.6 merg=
ed to v6.5.4
> >=20
>=20>  as well as on plain v6.5.4. Despite the trace, the laptop display =
works. Given
> >=20
>=20>  your recent eDP and aux-bus support patches are included in
> >=20
>=20>  tags/mediatek-drm-next-6.6, I thought reporting this may be helpfu=
l. (I'm
> >=20
>=20>  unable to validate v6.6-rc2 currently, as there's a regression bre=
aking boot.)
> >=20
>=20
> Hello Leonard,
>=20
>=20thanks for sending me this snippet.
>=20
>=20This is not in any way connected to my eDP/aux-bus patch series, infa=
ct this
>=20
>=20warning happens because your machine has got a new/different panel, r=
ead below:
>=20
>=20 if (WARN_ON(!panel->detected_panel)) {
>=20
>=20 dev_warn(dev,
>=20
>=20 "Unknown panel %s %#06x, using conservative timings\n",
>=20
>=20 vend, product_id);
>=20
>=20[ 4.089721] panel-simple-dp-aux aux-3-0058: Unknown panel CMN 0x142b,=
 using conservative timings
>=20
>=20I'll try to retrieve informations about this new panel and add it to =
panel-edp
>=20
>=20as soon as possible.
>=20
>=20Thanks!
>=20
>=20Angelo
>=20
>=20>=20
>=20> [ 3.808189] ------------[ cut here ]------------
> >=20
>=20>  [ 3.812840] WARNING: CPU: 7 PID: 10 at drivers/gpu/drm/panel/panel=
-edp.c:758 panel_edp_probe+0x488/0x4f0
> >=20
>=20>  [ 3.822370] Modules linked in:
> >=20
>=20>  [ 3.825428] CPU: 7 PID: 10 Comm: kworker/u16:0 Not tainted 6.5.4-c=
os-mt9+ #1
> >=20
>=20>  [ 3.832476] Hardware name: Google Spherion (rev0 - 3) (DT)
> >=20
>=20>  [ 3.837959] Workqueue: events_unbound deferred_probe_work_func
> >=20
>=20>  [ 3.843797] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> >=20
>=20>  [ 3.850757] pc : panel_edp_probe+0x488/0x4f0
> >=20
>=20>  [ 3.855025] lr : panel_edp_probe+0x29c/0x4f0
> >=20
>=20>  [ 3.859291] sp : ffff8000800d3710
> >=20
>=20>  [ 3.862600] x29: ffff8000800d3710 x28: 0000000000000000 x27: 00000=
00000000000
> >=20
>=20>  [ 3.869737] x26: ffff60b44002d005 x25: ffffa4a68e990418 x24: 00000=
00000000000
> >=20
>=20>  [ 3.875193] usb 1-1: new high-speed USB device number 2 using xhci=
-mtk
> >=20
>=20>  [ 3.876862] x23: ffff60b446542680 x22: ffffa4a68db8d5b0 x21: ffff6=
0b4452d0000
> >=20
>=20>  [ 3.876869] x20: 0000000000000000 x19: ffff60b441052480 x18: 00000=
000000a8360
> >=20
>=20>  [ 3.876873] x17: 001fffffffffffff x16: 0000000000000000 x15: 00000=
00000000001
> >=20
>=20>  [ 3.904812] x14: 000000000060f827 x13: 9b00200a4341452d x12: 00000=
00000000000
> >=20
>=20>  [ 3.911948] x11: 0000000000000001 x10: 0000000000000000 x9 : ffff6=
0b446523900
> >=20
>=20>  [ 3.919084] x8 : ffff60b446523900 x7 : 00000000435e6d06 x6 : 40395=
246b460ffff
> >=20
>=20>  [ 3.926220] x5 : 0000000000000043 x4 : 000000000000142b x3 : 00000=
0000000004e
> >=20
>=20>  [ 3.933356] x2 : 0000000000000000 x1 : ffffa4a68db8d9a0 x0 : 00000=
0000dae142b
> >=20
>=20>  [ 3.940492] Call trace:
> >=20
>=20>  [ 3.942933] panel_edp_probe+0x488/0x4f0
> >=20
>=20>  [ 3.946851] panel_edp_dp_aux_ep_probe+0x38/0x50
> >=20
>=20>  [ 3.951466] dp_aux_ep_probe+0x34/0xf4
> >=20
>=20>  [ 3.955211] really_probe+0x148/0x2ac
> >=20
>=20>  [ 3.958868] __driver_probe_device+0x78/0x12c
> >=20
>=20>  [ 3.963221] driver_probe_device+0x3c/0x160
> >=20
>=20>  [ 3.967400] __device_attach_driver+0xb8/0x138
> >=20
>=20>  [ 3.971841] bus_for_each_drv+0x80/0xdc
> >=20
>=20>  [ 3.975672] __device_attach+0x9c/0x188
> >=20
>=20>  [ 3.979503] device_initial_probe+0x14/0x20
> >=20
>=20>  [ 3.983683] bus_probe_device+0xac/0xb0
> >=20
>=20>  [ 3.987515] device_add+0x5bc/0x778
> >=20
>=20>  [ 3.990999] device_register+0x20/0x30
> >=20
>=20>  [ 3.994742] of_dp_aux_populate_bus+0xc8/0x19c
> >=20
>=20>  [ 3.999181] devm_of_dp_aux_populate_bus+0x18/0x80
> >=20
>=20>  [ 4.003968] anx7625_i2c_probe+0x7bc/0x9b4
> >=20
>=20>  [ 4.008062] i2c_device_probe+0x148/0x290
> >=20
>=20>  [ 4.011724] usb 1-1: New USB device found, idVendor=3D05e3, idProd=
uct=3D0610, bcdDevice=3D65.01
> >=20
>=20>  [ 4.012062] really_probe+0x148/0x2ac
> >=20
>=20>  [ 4.012064] __driver_probe_device+0x78/0x12c
> >=20
>=20>  [ 4.020243] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> >=20
>=20>  [ 4.023879] driver_probe_device+0x3c/0x160
> >=20
>=20>  [ 4.023882] __device_attach_driver+0xb8/0x138
> >=20
>=20>  [ 4.023884] bus_for_each_drv+0x80/0xdc
> >=20
>=20>  [ 4.028232] usb 1-1: Product: USB2.1 Hub
> >=20
>=20>  [ 4.035347] __device_attach+0x9c/0x188
> >=20
>=20>  [ 4.035350] device_initial_probe+0x14/0x20
> >=20
>=20>  [ 4.035353] bus_probe_device+0xac/0xb0
> >=20
>=20>  [ 4.035355] deferred_probe_work_func+0x8c/0xc8
> >=20
>=20>  [ 4.039530] usb 1-1: Manufacturer: GenesysLogic
> >=20
>=20>  [ 4.043955] process_one_work+0x2d0/0x598
> >=20
>=20>  [ 4.048830] hub 1-1:1.0: USB hub found
> >=20
>=20>  [ 4.051689] worker_thread+0x70/0x434
> >=20
>=20>  [ 4.051691] kthread+0xfc/0x100
> >=20
>=20>  [ 4.051693] ret_from_fork+0x10/0x20
> >=20
>=20>  [ 4.051699] irq event stamp: 136828
> >=20
>=20>  [ 4.051701] hardirqs last enabled at (136827): [<ffffa4a68d991ba4>=
] _raw_spin_unlock_irqrestore+0x6c/0x98
> >=20
>=20>  [ 4.055841] hub 1-1:1.0: 4 ports detected
> >=20
>=20>  [ 4.059699] hardirqs last disabled at (136828): [<ffffa4a68d9811e8=
>] el1_dbg+0x24/0x8c
> >=20
>=20>  [ 4.059704] softirqs last enabled at (134796): [<ffffa4a68c810794>=
] __do_softirq+0x424/0x51c
> >=20
>=20>  [ 4.059706] softirqs last disabled at (134787): [<ffffa4a68c816af0=
>] ____do_softirq+0x10/0x1c
> >=20
>=20>  [ 4.059709] ---[ end trace 0000000000000000 ]---
> >=20
>=20>  Without your patches, on 6.5.4, the trace looks as follows
> >=20
>=20>  [ 3.834478] ------------[ cut here ]------------
> >=20
>=20>  [ 3.839126] WARNING: CPU: 5 PID: 10 at drivers/gpu/drm/panel/panel=
-edp.c:758 panel_edp_probe+0x488/0x4f0
> >=20
>=20>  [ 3.848629] Modules linked in:
> >=20
>=20>  [ 3.851684] CPU: 5 PID: 10 Comm: kworker/u16:0 Not tainted 6.5.4-c=
os-mt9 #1
> >=20
>=20>  [ 3.858646] Hardware name: Google Spherion (rev0 - 3) (DT)
> >=20
>=20>  [ 3.864129] Workqueue: events_unbound deferred_probe_work_func
> >=20
>=20>  [ 3.869966] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> >=20
>=20>  [ 3.876927] pc : panel_edp_probe+0x488/0x4f0
> >=20
>=20>  [ 3.881195] lr : panel_edp_probe+0x29c/0x4f0
> >=20
>=20>  [ 3.885461] sp : ffff8000800d3710
> >=20
>=20>  [ 3.888770] x29: ffff8000800d3710 x28: 0000000000000000 x27: 00000=
00000000000
> >=20
>=20>  [ 3.895907] x26: ffff31fec002c005 x25: ffffa839d1b90418 x24: 00000=
00000000000
> >=20
>=20>  [ 3.899112] usb 1-1: new high-speed USB device number 2 using xhci=
-mtk
> >=20
>=20>  [ 3.903031] x23: ffff31fec13fc500 x22: ffffa839d0d8d5b0 x21: ffff3=
1fec51ec000
> >=20
>=20>  [ 3.903038] x20: 0000000000000000 x19: ffff31fec536fe80 x18: 00000=
00000078570
> >=20
>=20>  [ 3.903041] x17: 001fffffffffffff x16: 0000000000000000 x15: 00000=
00000000001
> >=20
>=20>  [ 3.930981] x14: 0000000000350cdf x13: 9b00200a4341452d x12: 00000=
00000000000
> >=20
>=20>  [ 3.938117] x11: 0000000000000001 x10: 0000000000000000 x9 : ffff3=
1fec10b2300
> >=20
>=20>  [ 3.945253] x8 : ffff31fec10b2300 x7 : 0000000037343f4b x6 : 40230=
bc1fe31ffff
> >=20
>=20>  [ 3.952388] x5 : 0000000000000043 x4 : 000000000000142b x3 : 00000=
0000000004e
> >=20
>=20>  [ 3.959524] x2 : 0000000000000000 x1 : ffffa839d0d8d9a0 x0 : 00000=
0000dae142b
> >=20
>=20>  [ 3.966660] Call trace:
> >=20
>=20>  [ 3.969099] panel_edp_probe+0x488/0x4f0
> >=20
>=20>  [ 3.973018] panel_edp_dp_aux_ep_probe+0x38/0x50
> >=20
>=20>  [ 3.977633] dp_aux_ep_probe+0x34/0xf4
> >=20
>=20>  [ 3.981378] really_probe+0x148/0x2ac
> >=20
>=20>  [ 3.985036] __driver_probe_device+0x78/0x12c
> >=20
>=20>  [ 3.989390] driver_probe_device+0x3c/0x160
> >=20
>=20>  [ 3.993569] __device_attach_driver+0xb8/0x138
> >=20
>=20>  [ 3.998009] bus_for_each_drv+0x80/0xdc
> >=20
>=20>  [ 4.001840] __device_attach+0x9c/0x188
> >=20
>=20>  [ 4.005672] device_initial_probe+0x14/0x20
> >=20
>=20>  [ 4.009851] bus_probe_device+0xac/0xb0
> >=20
>=20>  [ 4.013682] device_add+0x5bc/0x778
> >=20
>=20>  [ 4.017166] device_register+0x20/0x30
> >=20
>=20>  [ 4.020911] of_dp_aux_populate_bus+0xc8/0x19c
> >=20
>=20>  [ 4.025349] devm_of_dp_aux_populate_bus+0x18/0x80
> >=20
>=20>  [ 4.030136] anx7625_i2c_probe+0x7bc/0x9b4
> >=20
>=20>  [ 4.034229] i2c_device_probe+0x148/0x290
> >=20
>=20>  [ 4.038237] really_probe+0x148/0x2ac
> >=20
>=20>  [ 4.038692] usb 1-1: New USB device found, idVendor=3D05e3, idProd=
uct=3D0610, bcdDevice=3D65.01
> >=20
>=20>  [ 4.041887] __driver_probe_device+0x78/0x12c
> >=20
>=20>  [ 4.041890] driver_probe_device+0x3c/0x160
> >=20
>=20>  [ 4.041892] __device_attach_driver+0xb8/0x138
> >=20
>=20>  [ 4.041895] bus_for_each_drv+0x80/0xdc
> >=20
>=20>  [ 4.041897] __device_attach+0x9c/0x188
> >=20
>=20>  [ 4.050077] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> >=20
>=20>  [ 4.054409] device_initial_probe+0x14/0x20
> >=20
>=20>  [ 4.054412] bus_probe_device+0xac/0xb0
> >=20
>=20>  [ 4.058588] usb 1-1: Product: USB2.1 Hub
> >=20
>=20>  [ 4.063012] deferred_probe_work_func+0x8c/0xc8
> >=20
>=20>  [ 4.063014] process_one_work+0x2d0/0x598
> >=20
>=20>  [ 4.066841] usb 1-1: Manufacturer: GenesysLogic
> >=20
>=20>  [ 4.070658] worker_thread+0x70/0x434
> >=20
>=20>  [ 4.070660] kthread+0xfc/0x100
> >=20
>=20>  [ 4.070663] ret_from_fork+0x10/0x20
> >=20
>=20>  [ 4.078915] hub 1-1:1.0: USB hub found
> >=20
>=20>  [ 4.081952] irq event stamp: 141216
> >=20
>=20>  [ 4.081953] hardirqs last enabled at (141215): [<ffffa839d0b936a4>=
] _raw_spin_unlock_irqrestore+0x6c/0x98
> >=20
>=20>  [ 4.081960] hardirqs last disabled at (141216): [<ffffa839d0b82ce8=
>] el1_dbg+0x24/0x8c
> >=20
>=20>  [ 4.081965] softirqs last enabled at (140754): [<ffffa839cfa10794>=
] __do_softirq+0x424/0x51c
> >=20
>=20>  [ 4.086058] hub 1-1:1.0: 4 ports detected
> >=20
>=20>  [ 4.089700] softirqs last disabled at (140749): [<ffffa839cfa16af0=
>] ____do_softirq+0x10/0x1c
> >=20
>=20>  [ 4.089702] ---[ end trace 0000000000000000 ]---
> >=20
>=20>  [ 4.089721] panel-simple-dp-aux aux-3-0058: Unknown panel CMN 0x14=
2b, using conservative timings
> >
>

