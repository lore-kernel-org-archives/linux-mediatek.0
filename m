Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9C8C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBKR7o7Gzy58FlXvJnYeyByOpSRX45Z4mks7ah4+Kw4=; b=1OoLX0LwwCvq+p7hO/ts9AX3Mc
	yXKSCGGsiyeXMx1q2qhdntqrXq4TnHh9HI81ZhDHf7QCbVmdeZiOVhwE/Nux75aUeVoyqdxKxzLnb
	IzgxmrRDyPlbyh+QZYDkBEuA0nme0XYT2itGVFaXx6FV/algOcUIuBS2Hw2n2q46tAoXB1vCQYdWo
	IAQL93yI/jDRgJOuF8xrazA7O2wP2tsS4+o4ROA/aPC6LZF2tNISiTHCrgvFSvca8noI3kIfWP/8L
	YY9wvcxqoRGlfVVv1AoVGmraZZ/7IqZ+P78PqEk6XcInurr9NuGpP0abw+arS/b3GdmES6i0m+Ty6
	Dnb7ay2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXP3-005XQR-33;
	Fri, 25 Aug 2023 14:03:09 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXP0-005XNv-1a;
	Fri, 25 Aug 2023 14:03:08 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D326966071BE;
	Fri, 25 Aug 2023 15:02:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692972181;
	bh=Tf0lRvLk4egxaG6ZSwOtjS0aVzUEep0x+fFK3VC8laM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bpsA+ZN1hxW5O80D1U5sVzFN2ALmtNalrJ2+D2NfBXy/Yak3TYoY2Ye9xBdwBkg9l
	 nfK+B8Dvskeud9iRprmTOPiRaSrRvODue8tiAajdVq6VgY0bolTnHicKfaWjsrFTH4
	 OTZ03Q9O5YT7zwoBoviGtuadsZWlPsTr7qX1UeCUS3jUI4Cyhd6qBE7i8tSVC0LWoU
	 32QFdqMB9HneZuZgdqY6fEMHb2z5Mzf2rN+6MTzcXHlBnuNQSw33EOcUjJpeyFuzqH
	 62EhZgjDEiE4pMcfSxHFObTo3AdPEZqn87SvvIU9CZQFcYJ18YYJGTQmfhuucl6XA7
	 hlsqHbc2UrVbw==
Date: Fri, 25 Aug 2023 10:02:56 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Michael Walle <mwalle@kernel.org>
Cc: angelogioacchino.delregno@collabora.com, airlied@gmail.com,
	amergnat@baylibre.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	ehristev@collabora.com, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	p.zabel@pengutronix.de, wenst@chromium.org
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Message-ID: <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230825120109.3132209-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070306_868146_7DDB3493 
X-CRM114-Status: GOOD (  34.26  )
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

On Fri, Aug 25, 2023 at 02:01:09PM +0200, Michael Walle wrote:
> Hi AngeloGioacchino,
> 
> > For the eDP case we can support using aux-bus on MediaTek DP: this
> > gives us the possibility to declare our panel as generic "panel-edp"
> > which will automatically configure the timings and available modes
> > via the EDID that we read from it.
> > 
> > To do this, move the panel parsing at the end of the probe function
> > so that the hardware is initialized beforehand and also initialize
> > the DPTX AUX block and power both on as, when we populate the
> > aux-bus, the panel driver will trigger an EDID read to perform
> > panel detection.
> > 
> > Last but not least, since now the AUX transfers can happen in the
> > separated aux-bus, it was necessary to add an exclusion for the
> > cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
> > way to do this is to simply ignore checking that when the bridge
> > type is eDP.
> 
> This patch breaks my board based on the MT8195 which only has one
> DisplayPort output port. I suspect it might also break the mt8195-cherry
> board.

Do you mean that your board does not have an internal display, only the one
output port? If so, why are you enabling the nodes for the internal display path
in your board specific DT?

> 
> While the mediatek-dpi driver finds the DP port:
> [    3.131645] mediatek-dpi 1c113000.dp-intf: Found bridge node: /soc/dp-tx@1c600000
> 
> The probing of the eDP is deferred:
> [   13.289009] platform 1c015000.dp-intf: deferred probe pending
> 
> So I don't know why, but to make dp_intf1 work, it seems that dp_intf0
> must be probed successfully. After this patch, the edp (which is
> connected to the dp_intf1) probe will return with an -ENODEV and
> the previous call to devm_drm_bridge_add() will be rolled back.

The MediaTek DRM driver uses the component framework, so it waits for all of its
components to register until it binds them all (which includes both intf0 and
intf1, unless they're disabled on the DT).

It's true that before this patch no panel being found for edp-tx wouldn't
prevent it to probe, but it really should.

Thanks,
Nícolas

> 
> Before this patch, bridge_add() was called in any case (in the
> error case with next_bridge = NULL) and the mediatek-dpi probed
> like that:
> 
> [    3.121011] mediatek-dpi 1c015000.dp-intf: Found bridge node: /soc/edp-tx@1c500000
> [    3.122111] mediatek-dpi 1c113000.dp-intf: Found bridge node: /soc/dp-tx@1c600000
> 
> Eventually resulting in a framebuffer device:
> [    4.451081] mediatek-drm mediatek-drm.8.auto: [drm] fb0: mediatekdrmfb frame buffer device
> 
> 
> NB, somehow this series broke the initial display output. I always have
> to replug the DisplayPort to get some output. I'll dig deeper into that
> later.
> 
> ..
> 
> > @@ -2519,21 +2553,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
> >  		return dev_err_probe(dev, mtk_dp->irq,
> >  				     "failed to request dp irq resource\n");
> >  
> > -	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> > -	if (IS_ERR(mtk_dp->next_bridge) &&
> > -	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
> > -		mtk_dp->next_bridge = NULL;
> 
> In my case, this branch was taken.
> 
> -michael
> 
> > -	else if (IS_ERR(mtk_dp->next_bridge))
> > -		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
> > -				     "Failed to get bridge\n");
> > -
> >  	ret = mtk_dp_dt_parse(mtk_dp, pdev);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "Failed to parse dt\n");
> >  
> > -	drm_dp_aux_init(&mtk_dp->aux);
> >  	mtk_dp->aux.name = "aux_mtk_dp";
> > +	mtk_dp->aux.dev = dev;
> >  	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
> > +	drm_dp_aux_init(&mtk_dp->aux);
> >  
> >  	spin_lock_init(&mtk_dp->irq_thread_lock);
> >  

