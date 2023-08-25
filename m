Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B65C71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/D321ZkzjYsaMmEcWZZY4lRT4qlt10fZ29fC/LfGt4=; b=BFjRWRhRb7ebqnlmkJBkqiFVck
	s1NIviMg2Aw5TO7aJ/SEXuZs9j+yZprG9i8+Kp6L535xWzwguDtYzsG/F3K2CcyfMYKZQeXkc6r+v
	Fr2zltN0Zv7Pf0/qZCplIEFyuvSqmdYDXyqHw+DJQxLtsLtCaqzzCrc4J0tGAR1JilMm17G7V2amB
	B/4MS8hpoL5IdyDVsYgkPyKSaU7GNjL94hq6ajHibgRZ4xyXDrVQxz9JCAMi8wXf3pv0w8vDEvHWe
	WoAbpDQAu/B0k8RUjsYIGzq4kkEe8xa9HoE65Jk/ofIuOderV7telacEiErVw4rscUOChn8EnbFEY
	LQLRMMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVVM-005KSe-2g;
	Fri, 25 Aug 2023 12:01:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVVI-005KRe-2F;
	Fri, 25 Aug 2023 12:01:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C97166323D;
	Fri, 25 Aug 2023 12:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043B1C433C8;
	Fri, 25 Aug 2023 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692964886;
	bh=DkaQY49NCfEp3URelzQqFMcnMc9cI/W/Kd4KxUDsdP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kpxFzYXNwWgfxY8NNYJlMX4BJy36WR3HvNPFBufzFvuc+1G+3dkUXzrHL7ecq6mrA
	 S+KFw5hGxzStAZDEnRnBk4WifvWMZuoZBBrcmgn/Dn9+zQa078bUaJyvGrejf9V6X5
	 RWyFIhHXbppXCO/spDu7kvAEYcLk29nfQ88Rm6z74iJbixllna1t3ik3LHDEt+IONO
	 iesMsfH9UMEvHZ6Z21UZ1aTtRRKDc85QPw8bHHYeUViA3BA3OwHDK67vDf5tgiYaUx
	 0I7ShYr0Jd6zDxGifpdP/+pP3ynXQg+ReQY+kywslBe73Q49XNTLzNZqZDjulJNQ1w
	 NBTKCDVjyc/KQ==
From: Michael Walle <mwalle@kernel.org>
To: angelogioacchino.delregno@collabora.com
Cc: airlied@gmail.com,
	amergnat@baylibre.com,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ehristev@collabora.com,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	p.zabel@pengutronix.de,
	wenst@chromium.org,
	Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
Date: Fri, 25 Aug 2023 14:01:09 +0200
Message-Id: <20230825120109.3132209-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_050129_347978_692497F2 
X-CRM114-Status: GOOD (  23.85  )
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

Hi AngeloGioacchino,

> For the eDP case we can support using aux-bus on MediaTek DP: this
> gives us the possibility to declare our panel as generic "panel-edp"
> which will automatically configure the timings and available modes
> via the EDID that we read from it.
> 
> To do this, move the panel parsing at the end of the probe function
> so that the hardware is initialized beforehand and also initialize
> the DPTX AUX block and power both on as, when we populate the
> aux-bus, the panel driver will trigger an EDID read to perform
> panel detection.
> 
> Last but not least, since now the AUX transfers can happen in the
> separated aux-bus, it was necessary to add an exclusion for the
> cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
> way to do this is to simply ignore checking that when the bridge
> type is eDP.

This patch breaks my board based on the MT8195 which only has one
DisplayPort output port. I suspect it might also break the mt8195-cherry
board.

While the mediatek-dpi driver finds the DP port:
[    3.131645] mediatek-dpi 1c113000.dp-intf: Found bridge node: /soc/dp-tx@1c600000

The probing of the eDP is deferred:
[   13.289009] platform 1c015000.dp-intf: deferred probe pending

So I don't know why, but to make dp_intf1 work, it seems that dp_intf0
must be probed successfully. After this patch, the edp (which is
connected to the dp_intf1) probe will return with an -ENODEV and
the previous call to devm_drm_bridge_add() will be rolled back.

Before this patch, bridge_add() was called in any case (in the
error case with next_bridge = NULL) and the mediatek-dpi probed
like that:

[    3.121011] mediatek-dpi 1c015000.dp-intf: Found bridge node: /soc/edp-tx@1c500000
[    3.122111] mediatek-dpi 1c113000.dp-intf: Found bridge node: /soc/dp-tx@1c600000

Eventually resulting in a framebuffer device:
[    4.451081] mediatek-drm mediatek-drm.8.auto: [drm] fb0: mediatekdrmfb frame buffer device


NB, somehow this series broke the initial display output. I always have
to replug the DisplayPort to get some output. I'll dig deeper into that
later.

..

> @@ -2519,21 +2553,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, mtk_dp->irq,
>  				     "failed to request dp irq resource\n");
>  
> -	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> -	if (IS_ERR(mtk_dp->next_bridge) &&
> -	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
> -		mtk_dp->next_bridge = NULL;

In my case, this branch was taken.

-michael

> -	else if (IS_ERR(mtk_dp->next_bridge))
> -		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
> -				     "Failed to get bridge\n");
> -
>  	ret = mtk_dp_dt_parse(mtk_dp, pdev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to parse dt\n");
>  
> -	drm_dp_aux_init(&mtk_dp->aux);
>  	mtk_dp->aux.name = "aux_mtk_dp";
> +	mtk_dp->aux.dev = dev;
>  	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
> +	drm_dp_aux_init(&mtk_dp->aux);
>  
>  	spin_lock_init(&mtk_dp->irq_thread_lock);
>  

