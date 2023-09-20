Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE19CE79A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 00:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:
	From:Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gnvTSVejABHO5wWQQ3vBHCeXE64eUxPjwgqfzipT3OI=; b=Xb5popt47EtQRFnlyOs1ezccsk
	pkrly7SMwoCYHQQnEN1ioExgJ4NEiztQ4Eh5V/v4VB46dhvO2E/iPeIY6EVUIKgDBVfM/V2kWpZyU
	nM3MkHt1RU+Nw99GzrKY0yFnY+zl83fe+APuUFhCQsZHyEAHK4gMK0YkhD1zpr12gSKv2+F8BIETC
	lfLmUUzPUzMtQYYk/2yjvDVT7rkuSLA8TRVGEuUzvGahgS0yzScFaALCeZtj5mlaUVvWcp2WxrOlz
	V9XNShfvfUcs8IVw0Qp4yGk1oZnsU/23n9Qn+GWTRl01kyAD802hI0RXWyJKMrBk+pLSFdUFpxale
	CwzJx/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qilXt-001Xo0-0B;
	Wed, 20 Sep 2023 00:58:25 +0000
Received: from devico.uberspace.de ([185.26.156.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qilXo-001Xla-1J
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Sep 2023 00:58:24 +0000
Received: (qmail 25248 invoked by uid 990); 20 Sep 2023 00:58:08 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
MIME-Version: 1.0
Date: Wed, 20 Sep 2023 00:58:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <ca32347a879c794577f272a1473e44ee39f2acdc@lausen.nl>
TLS-Required: No
Subject: PROBLEM: MT8192 panel_edp_probe trace despite recent eDP and aux-bus
 support patches
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
X-Rspamd-Bar: -
X-Rspamd-Report: BAYES_HAM(-1.650084) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.750084
Received: from unknown (HELO unkown) (::1)
	by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 20 Sep 2023 02:58:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from;
	bh=Rw3LgHFJThsAgut9VwRfx6D9WPAl8cLdqXsSp1h9/bk=;
	b=YSFk0GkAn7UhB5Hi300l0R0thdimCeehuxWJrCbjmwaR037kcJrV34bSg/FBPXGnKFl6y4XA9T
	VT8WtFCxKcQB7hVJvCCSclNDBmxRC50vIMf9sk1psEZNPUfqJ2Kip+r13kwNkwg3jjcAZu60aTYO
	8JuSO5+VwIMVO+0zWR4Qfq20yQrTgWleeFsfgQShygmQ5W2j1h/iugjGl9ZW45jmEryhwnCccA0b
	qXyax8aZFAh9MpjQNuZUJo25I+djBXZm5ZLfyCramrLrx/AKkiQyWk2HmSkxSoURcUfyupHlK6QI
	B0BZxmW/1WY+SmnW8fc1xl0AYrXlGsn/ZE/xXlyW3l5xvBYgecl+ZCza11NSb5NDJk5M3z3jFI3G
	Sdu60Y86rv+6tL67nY8sQvNphwJh0Xy6kH/brWth7Rhj5G8CciSbgLQpopnEXL3eO60FzHtjR6yr
	ro6llrPst60Ct7s6fUyK0/mC779KxdvhaZNsabmHad7jal2Cp0K8Gr/V72VIqXlOksxzrp2hZEAa
	MuEyFD4O+ApsYUSz9K9j2p9h8vwrL9BlXFeDhiQV8YcGZwTYM+CUH9igAdZ46mrGJHFEZPScYI6f
	LfLULOemJfb/ccv7FnUefFPTR6+bBC28cWkR9vvsqR4JQDxao/s+Kz8zTSy14ODhVljEXbrNjqwv
	0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_175821_175985_92F87F67 
X-CRM114-Status: UNSURE (   2.76  )
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

Dear AngeloGioacchino, Dear Maintainers,

on MT8192 Asurada Spherion (Acer 514), I observe the following trace rela=
ted to
eDP and aux-bus during bootup with tags/mediatek-drm-next-6.6 merged to v=
6.5.4
as well as on plain v6.5.4. Despite the trace, the laptop display works. =
Given
your recent eDP and aux-bus support patches are included in
tags/mediatek-drm-next-6.6, I thought reporting this may be helpful. (I'm
unable to validate v6.6-rc2 currently, as there's a regression breaking b=
oot.)=20

[=20   3.808189] ------------[ cut here ]------------
[    3.812840] WARNING: CPU: 7 PID: 10 at drivers/gpu/drm/panel/panel-edp=
.c:758 panel_edp_probe+0x488/0x4f0
[    3.822370] Modules linked in:
[    3.825428] CPU: 7 PID: 10 Comm: kworker/u16:0 Not tainted 6.5.4-cos-m=
t9+ #1
[    3.832476] Hardware name: Google Spherion (rev0 - 3) (DT)
[    3.837959] Workqueue: events_unbound deferred_probe_work_func
[    3.843797] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
[    3.850757] pc : panel_edp_probe+0x488/0x4f0
[    3.855025] lr : panel_edp_probe+0x29c/0x4f0
[    3.859291] sp : ffff8000800d3710
[    3.862600] x29: ffff8000800d3710 x28: 0000000000000000 x27: 000000000=
0000000
[    3.869737] x26: ffff60b44002d005 x25: ffffa4a68e990418 x24: 000000000=
0000000
[    3.875193] usb 1-1: new high-speed USB device number 2 using xhci-mtk
[    3.876862] x23: ffff60b446542680 x22: ffffa4a68db8d5b0 x21: ffff60b44=
52d0000
[    3.876869] x20: 0000000000000000 x19: ffff60b441052480 x18: 000000000=
00a8360
[    3.876873] x17: 001fffffffffffff x16: 0000000000000000 x15: 000000000=
0000001
[    3.904812] x14: 000000000060f827 x13: 9b00200a4341452d x12: 000000000=
0000000
[    3.911948] x11: 0000000000000001 x10: 0000000000000000 x9 : ffff60b44=
6523900
[    3.919084] x8 : ffff60b446523900 x7 : 00000000435e6d06 x6 : 40395246b=
460ffff
[    3.926220] x5 : 0000000000000043 x4 : 000000000000142b x3 : 000000000=
000004e
[    3.933356] x2 : 0000000000000000 x1 : ffffa4a68db8d9a0 x0 : 000000000=
dae142b
[    3.940492] Call trace:
[    3.942933]  panel_edp_probe+0x488/0x4f0
[    3.946851]  panel_edp_dp_aux_ep_probe+0x38/0x50
[    3.951466]  dp_aux_ep_probe+0x34/0xf4
[    3.955211]  really_probe+0x148/0x2ac
[    3.958868]  __driver_probe_device+0x78/0x12c
[    3.963221]  driver_probe_device+0x3c/0x160
[    3.967400]  __device_attach_driver+0xb8/0x138
[    3.971841]  bus_for_each_drv+0x80/0xdc
[    3.975672]  __device_attach+0x9c/0x188
[    3.979503]  device_initial_probe+0x14/0x20
[    3.983683]  bus_probe_device+0xac/0xb0
[    3.987515]  device_add+0x5bc/0x778
[    3.990999]  device_register+0x20/0x30
[    3.994742]  of_dp_aux_populate_bus+0xc8/0x19c
[    3.999181]  devm_of_dp_aux_populate_bus+0x18/0x80
[    4.003968]  anx7625_i2c_probe+0x7bc/0x9b4
[    4.008062]  i2c_device_probe+0x148/0x290
[    4.011724] usb 1-1: New USB device found, idVendor=3D05e3, idProduct=
=3D0610, bcdDevice=3D65.01
[    4.012062]  really_probe+0x148/0x2ac
[    4.012064]  __driver_probe_device+0x78/0x12c
[    4.020243] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    4.023879]  driver_probe_device+0x3c/0x160
[    4.023882]  __device_attach_driver+0xb8/0x138
[    4.023884]  bus_for_each_drv+0x80/0xdc
[    4.028232] usb 1-1: Product: USB2.1 Hub
[    4.035347]  __device_attach+0x9c/0x188
[    4.035350]  device_initial_probe+0x14/0x20
[    4.035353]  bus_probe_device+0xac/0xb0
[    4.035355]  deferred_probe_work_func+0x8c/0xc8
[    4.039530] usb 1-1: Manufacturer: GenesysLogic
[    4.043955]  process_one_work+0x2d0/0x598
[    4.048830] hub 1-1:1.0: USB hub found
[    4.051689]  worker_thread+0x70/0x434
[    4.051691]  kthread+0xfc/0x100
[    4.051693]  ret_from_fork+0x10/0x20
[    4.051699] irq event stamp: 136828
[    4.051701] hardirqs last  enabled at (136827): [<ffffa4a68d991ba4>] _=
raw_spin_unlock_irqrestore+0x6c/0x98
[    4.055841] hub 1-1:1.0: 4 ports detected
[    4.059699] hardirqs last disabled at (136828): [<ffffa4a68d9811e8>] e=
l1_dbg+0x24/0x8c
[    4.059704] softirqs last  enabled at (134796): [<ffffa4a68c810794>] _=
_do_softirq+0x424/0x51c
[    4.059706] softirqs last disabled at (134787): [<ffffa4a68c816af0>] _=
___do_softirq+0x10/0x1c
[    4.059709] ---[ end trace 0000000000000000 ]---

Without your patches, on 6.5.4, the trace looks as follows

[    3.834478] ------------[ cut here ]------------
[    3.839126] WARNING: CPU: 5 PID: 10 at drivers/gpu/drm/panel/panel-edp=
.c:758 panel_edp_probe+0x488/0x4f0
[    3.848629] Modules linked in:
[    3.851684] CPU: 5 PID: 10 Comm: kworker/u16:0 Not tainted 6.5.4-cos-m=
t9 #1
[    3.858646] Hardware name: Google Spherion (rev0 - 3) (DT)
[    3.864129] Workqueue: events_unbound deferred_probe_work_func
[    3.869966] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
[    3.876927] pc : panel_edp_probe+0x488/0x4f0
[    3.881195] lr : panel_edp_probe+0x29c/0x4f0
[    3.885461] sp : ffff8000800d3710
[    3.888770] x29: ffff8000800d3710 x28: 0000000000000000 x27: 000000000=
0000000
[    3.895907] x26: ffff31fec002c005 x25: ffffa839d1b90418 x24: 000000000=
0000000
[    3.899112] usb 1-1: new high-speed USB device number 2 using xhci-mtk
[    3.903031] x23: ffff31fec13fc500 x22: ffffa839d0d8d5b0 x21: ffff31fec=
51ec000
[    3.903038] x20: 0000000000000000 x19: ffff31fec536fe80 x18: 000000000=
0078570
[    3.903041] x17: 001fffffffffffff x16: 0000000000000000 x15: 000000000=
0000001
[    3.930981] x14: 0000000000350cdf x13: 9b00200a4341452d x12: 000000000=
0000000
[    3.938117] x11: 0000000000000001 x10: 0000000000000000 x9 : ffff31fec=
10b2300
[    3.945253] x8 : ffff31fec10b2300 x7 : 0000000037343f4b x6 : 40230bc1f=
e31ffff
[    3.952388] x5 : 0000000000000043 x4 : 000000000000142b x3 : 000000000=
000004e
[    3.959524] x2 : 0000000000000000 x1 : ffffa839d0d8d9a0 x0 : 000000000=
dae142b
[    3.966660] Call trace:
[    3.969099]  panel_edp_probe+0x488/0x4f0
[    3.973018]  panel_edp_dp_aux_ep_probe+0x38/0x50
[    3.977633]  dp_aux_ep_probe+0x34/0xf4
[    3.981378]  really_probe+0x148/0x2ac
[    3.985036]  __driver_probe_device+0x78/0x12c
[    3.989390]  driver_probe_device+0x3c/0x160
[    3.993569]  __device_attach_driver+0xb8/0x138
[    3.998009]  bus_for_each_drv+0x80/0xdc
[    4.001840]  __device_attach+0x9c/0x188
[    4.005672]  device_initial_probe+0x14/0x20
[    4.009851]  bus_probe_device+0xac/0xb0
[    4.013682]  device_add+0x5bc/0x778
[    4.017166]  device_register+0x20/0x30
[    4.020911]  of_dp_aux_populate_bus+0xc8/0x19c
[    4.025349]  devm_of_dp_aux_populate_bus+0x18/0x80
[    4.030136]  anx7625_i2c_probe+0x7bc/0x9b4
[    4.034229]  i2c_device_probe+0x148/0x290
[    4.038237]  really_probe+0x148/0x2ac
[    4.038692] usb 1-1: New USB device found, idVendor=3D05e3, idProduct=
=3D0610, bcdDevice=3D65.01
[    4.041887]  __driver_probe_device+0x78/0x12c
[    4.041890]  driver_probe_device+0x3c/0x160
[    4.041892]  __device_attach_driver+0xb8/0x138
[    4.041895]  bus_for_each_drv+0x80/0xdc
[    4.041897]  __device_attach+0x9c/0x188
[    4.050077] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    4.054409]  device_initial_probe+0x14/0x20
[    4.054412]  bus_probe_device+0xac/0xb0
[    4.058588] usb 1-1: Product: USB2.1 Hub
[    4.063012]  deferred_probe_work_func+0x8c/0xc8
[    4.063014]  process_one_work+0x2d0/0x598
[    4.066841] usb 1-1: Manufacturer: GenesysLogic
[    4.070658]  worker_thread+0x70/0x434
[    4.070660]  kthread+0xfc/0x100
[    4.070663]  ret_from_fork+0x10/0x20
[    4.078915] hub 1-1:1.0: USB hub found
[    4.081952] irq event stamp: 141216
[    4.081953] hardirqs last  enabled at (141215): [<ffffa839d0b936a4>] _=
raw_spin_unlock_irqrestore+0x6c/0x98
[    4.081960] hardirqs last disabled at (141216): [<ffffa839d0b82ce8>] e=
l1_dbg+0x24/0x8c
[    4.081965] softirqs last  enabled at (140754): [<ffffa839cfa10794>] _=
_do_softirq+0x424/0x51c
[    4.086058] hub 1-1:1.0: 4 ports detected
[    4.089700] softirqs last disabled at (140749): [<ffffa839cfa16af0>] _=
___do_softirq+0x10/0x1c
[    4.089702] ---[ end trace 0000000000000000 ]---
[    4.089721] panel-simple-dp-aux aux-3-0058: Unknown panel=20CMN 0x142b=
, using conservative timings

