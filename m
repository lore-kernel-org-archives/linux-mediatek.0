Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8586C3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 15:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kciCQvrkoUWCt4HcHnjs9NYS3EE+wJ/FPYu7QP0vRIE=; b=EO7l7xWIxKLFAiWr9DemeVKbRV
	T27pM20TC7I/P+5j8bKTih3qWqcB6I8pCeZ5KVs64kvOwO8/u/YBS4x4JhaNi1aTQcdJ5HaHH3ldH
	uXAbd/DXuzp3cWh9rlGglBjWnyCLWKrZ0oN4tFbFnkfDli3WfubYa9tJgLEgvWZWeO2yCXNCauf4T
	nFX02hgCmhbri2fnWF+ecFtOFRPv1waOiJFnT46ULeMIqFywQFTNzSbQVO2jd+4yc2KbFaeGgk9cT
	HcM2sT2iwJc9WAaFDeuGfQprKX3AfJMoX/QK6Tqa0N6nl3KOxMXkDuyXdsvFmDYsdqR+161PSgRK0
	vSwwgTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYxz-005hTJ-2D;
	Fri, 25 Aug 2023 15:43:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYxv-005hSj-0q;
	Fri, 25 Aug 2023 15:43:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78EA860D3D;
	Fri, 25 Aug 2023 15:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEAAC433C7;
	Fri, 25 Aug 2023 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692978193;
	bh=G9n/YPFGOVSkbEMJy6OZc/r3PTQEJOCu7MoRuHGRBqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y7KI8dqWWKtEC8q2IiKsLvTqqQ7GnFkrnEH23Hw+QAQlKTvGA01ZNoDwsn98W4mgE
	 O2N+gXOxmgQ0WQVSkSYbszV9VMDWETufTkVAjQALTWyR2+EWmUEMT5rU1o5ycIodnW
	 AAsU3VNB5eQF1b4OoJ3Tc1e+I699bsezD/ANKhYLOXBJspIYC02bQUx7AyUqIDA7Ow
	 MY94ukBRbq9Ci1MQJS9GEza4eflcCyYrTp/g3/2nEXisyk8uv+qdAWJZO27u5fH13g
	 qhS/TKQLxOuoQ2o3LnaI+NXxoqklWDcKPZnRTyPTNgi8N//f/Gxa/CyWRAijik+tdL
	 Xsu9rmemZXONQ==
MIME-Version: 1.0
Date: Fri, 25 Aug 2023 17:42:59 +0200
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, airlied@gmail.com,
 amergnat@baylibre.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, ehristev@collabora.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, wenst@chromium.org
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
In-Reply-To: <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
Message-ID: <fc6c054941420ac2d016496ccbeecad4@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_084315_393422_0B7B0E54 
X-CRM114-Status: GOOD (  37.04  )
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

Hi Nicolas,

>> > For the eDP case we can support using aux-bus on MediaTek DP: this
>> > gives us the possibility to declare our panel as generic "panel-edp"
>> > which will automatically configure the timings and available modes
>> > via the EDID that we read from it.
>> >
>> > To do this, move the panel parsing at the end of the probe function
>> > so that the hardware is initialized beforehand and also initialize
>> > the DPTX AUX block and power both on as, when we populate the
>> > aux-bus, the panel driver will trigger an EDID read to perform
>> > panel detection.
>> >
>> > Last but not least, since now the AUX transfers can happen in the
>> > separated aux-bus, it was necessary to add an exclusion for the
>> > cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
>> > way to do this is to simply ignore checking that when the bridge
>> > type is eDP.
>> 
>> This patch breaks my board based on the MT8195 which only has one
>> DisplayPort output port. I suspect it might also break the 
>> mt8195-cherry
>> board.
> 
> Do you mean that your board does not have an internal display, only the 
> one
> output port? If so, why are you enabling the nodes for the internal 
> display path
> in your board specific DT?

Well, that depends. The board actually has an eDP socket, but because we
are an OEM, there might be no display connected to it. (And I haven't
tried it yet). It should probably go into an own device tree or overlay
if it is used. I agree. But it looked like it was auto-detectable (it
even has a HDP pin on the eDP socket, not sure about its use case..)

But the real reason I've enabled it was because I'll get an kernel
oops otherwise. I thought it might be some quirk that you'll need both,
because eDP will register even if theres no display - as you've
mentioned below.

Here's the splat:
[    3.237064] mediatek-drm mediatek-drm.10.auto: bound 
1c110000.vpp-merge (ops mtk_disp_merge_component_ops)
[    3.238274] mediatek-drm mediatek-drm.8.auto: Not creating crtc 0 
because component 8 is disabled or missing
[    3.239504] mediatek-drm mediatek-drm.8.auto: Not creating crtc 0 
because component 9 is disabled or missing
[    3.240741] Unable to handle kernel NULL pointer dereference at 
virtual address 00000000000004a0
[    3.241841] Mem abort info:
[    3.242192]   ESR = 0x0000000096000004
[    3.242662]   EC = 0x25: DABT (current EL), IL = 32 bits
[    3.243328]   SET = 0, FnV = 0
[    3.243710]   EA = 0, S1PTW = 0
[    3.244104]   FSC = 0x04: level 0 translation fault
[    3.244717] Data abort info:
[    3.245078]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    3.245765]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    3.246398]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    3.247063] [00000000000004a0] user address but active_mm is swapper
[    3.247860] Internal error: Oops: 0000000096000004 [#1] SMP
[    3.248559] Modules linked in:
[    3.248945] CPU: 4 PID: 11 Comm: kworker/u16:0 Not tainted 
6.5.0-rc7-next-20230821+ #2225
[    3.249970] Hardware name: Kontron 3.5"-SBC-i1200 (DT)
[    3.250614] Workqueue: events_unbound deferred_probe_work_func
[    3.251347] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    3.252220] pc : mtk_drm_crtc_dma_dev_get+0x8/0x18
[    3.252824] lr : mtk_drm_bind+0x458/0x558
[    3.253326] sp : ffff800082b23a20
[    3.253741] x29: ffff800082b23a20 x28: ffff000002c78880 x27: 
ffff8000816466d0
[    3.254635] x26: ffff000002c6f010 x25: 0000000000000003 x24: 
0000000000000000
[    3.255529] x23: ffff000002c78880 x22: 0000000000000002 x21: 
0000000000000000
[    3.256423] x20: ffff000006516800 x19: ffff000002c78880 x18: 
ffffffffffffffff
[    3.257317] x17: 6f63206573756163 x16: 6562203020637472 x15: 
6320676e69746165
[    3.258211] x14: 726320746f4e203a x13: 676e697373696d20 x12: 
726f2064656c6261
[    3.259106] x11: 7369642073692039 x10: ffff80008275c0c0 x9 : 
ffff80008091ebf8
[    3.260000] x8 : 00000000ffffefff x7 : ffff80008275c0c0 x6 : 
80000000fffff000
[    3.260895] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 
ffff000006516ae0
[    3.261789] x2 : ffff000006516ae0 x1 : 0000000000000000 x0 : 
0000000000000000
[    3.262684] Call trace:
[    3.262991]  mtk_drm_crtc_dma_dev_get+0x8/0x18
[    3.263549]  try_to_bring_up_aggregate_device+0x16c/0x1e0
[    3.264227]  __component_add+0xac/0x180
[    3.264708]  component_add+0x1c/0x30
[    3.265158]  mtk_disp_rdma_probe+0x17c/0x270
[    3.265695]  platform_probe+0x70/0xd0
[    3.266155]  really_probe+0x150/0x2c0
[    3.266615]  __driver_probe_device+0x80/0x140
[    3.267162]  driver_probe_device+0x44/0x170
[    3.267687]  __device_attach_driver+0xc0/0x148
[    3.268245]  bus_for_each_drv+0x88/0xf0
[    3.268727]  __device_attach+0xa4/0x198
[    3.269208]  device_initial_probe+0x1c/0x30
[    3.269732]  bus_probe_device+0xb4/0xc0
[    3.270214]  deferred_probe_work_func+0x90/0xd0
[    3.270783]  process_one_work+0x144/0x3a0
[    3.271289]  worker_thread+0x2ac/0x4b8
[    3.271761]  kthread+0xec/0xf8
[    3.272145]  ret_from_fork+0x10/0x20
[    3.272597] Code: 814f7858 ffff8000 aa1e03e9 d503201f (f9425000)
[    3.273361] ---[ end trace 0000000000000000 ]---

Here's the complete bootlog:
https://pastebin.com/raw/SekMYBj4

Any help is where to look is appreciated.

>> While the mediatek-dpi driver finds the DP port:
>> [    3.131645] mediatek-dpi 1c113000.dp-intf: Found bridge node: 
>> /soc/dp-tx@1c600000
>> 
>> The probing of the eDP is deferred:
>> [   13.289009] platform 1c015000.dp-intf: deferred probe pending
>> 
>> So I don't know why, but to make dp_intf1 work, it seems that dp_intf0
>> must be probed successfully. After this patch, the edp (which is
>> connected to the dp_intf1) probe will return with an -ENODEV and
>> the previous call to devm_drm_bridge_add() will be rolled back.
> 
> The MediaTek DRM driver uses the component framework, so it waits for 
> all of its
> components to register until it binds them all (which includes both 
> intf0 and
> intf1, unless they're disabled on the DT).

Oh with "I don't know why, but to make dp_intf1 work.." I meant the 
splat
above. I figured that dpi won't probe if a dependency is still deferred 
;)

-michael

> It's true that before this patch no panel being found for edp-tx 
> wouldn't
> prevent it to probe, but it really should.
> 
> Thanks,
> Nícolas
> 
>> 
>> Before this patch, bridge_add() was called in any case (in the
>> error case with next_bridge = NULL) and the mediatek-dpi probed
>> like that:
>> 
>> [    3.121011] mediatek-dpi 1c015000.dp-intf: Found bridge node: 
>> /soc/edp-tx@1c500000
>> [    3.122111] mediatek-dpi 1c113000.dp-intf: Found bridge node: 
>> /soc/dp-tx@1c600000
>> 
>> Eventually resulting in a framebuffer device:
>> [    4.451081] mediatek-drm mediatek-drm.8.auto: [drm] fb0: 
>> mediatekdrmfb frame buffer device
>> 
>> 
>> NB, somehow this series broke the initial display output. I always 
>> have
>> to replug the DisplayPort to get some output. I'll dig deeper into 
>> that
>> later.
>> 
>> ..
>> 
>> > @@ -2519,21 +2553,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
>> >  		return dev_err_probe(dev, mtk_dp->irq,
>> >  				     "failed to request dp irq resource\n");
>> >
>> > -	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>> > -	if (IS_ERR(mtk_dp->next_bridge) &&
>> > -	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
>> > -		mtk_dp->next_bridge = NULL;
>> 
>> In my case, this branch was taken.
>> 
>> -michael
>> 
>> > -	else if (IS_ERR(mtk_dp->next_bridge))
>> > -		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
>> > -				     "Failed to get bridge\n");
>> > -
>> >  	ret = mtk_dp_dt_parse(mtk_dp, pdev);
>> >  	if (ret)
>> >  		return dev_err_probe(dev, ret, "Failed to parse dt\n");
>> >
>> > -	drm_dp_aux_init(&mtk_dp->aux);
>> >  	mtk_dp->aux.name = "aux_mtk_dp";
>> > +	mtk_dp->aux.dev = dev;
>> >  	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
>> > +	drm_dp_aux_init(&mtk_dp->aux);
>> >
>> >  	spin_lock_init(&mtk_dp->irq_thread_lock);
>> >

