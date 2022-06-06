Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE27C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 19:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnyiomIMVVIGCBLKLI4yxFvsCKTUFc22Dw156lBZ1y8=; b=g/xBSJj3z6UiDe
	k7gwfsVh2oZ7JBq8e0xGS25Bu3Ux9IbO4VsJu2irPwMlIQ8kA2BdxPOuucnvaFlA3cDGvAcJ5Er9l
	yIjBUleADXRqTRMQixeplMad9VppiU3YCWa5lvVxjhTz0V3fr6zaSUfzHNln3sITBsTxAd/MeeG4v
	YyJFvZkGDb/5ZzFRL3fOaDmlQge+T+dsMz2B1oKt+vjZdt/vFtNqgAECZ9294dRey+RsNggMZoiMk
	91CaZ3ld6UD43Ru4CSMH9V8f7QPD8U6FoPOcgjhDTeQ0zkwgTS3IQ3cmDYrBoVsfxhpnC3BS1JOwX
	t3mBiSlmjJrd1Rgxzf3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIS5-002TJ5-6I; Mon, 06 Jun 2022 19:31:49 +0000
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com ([46.30.210.183])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIRs-002TEY-JM
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 19:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=wCRPXxH3TgL7AtKRIM4kQGYE5THJ1u4cAVHFfmnp23I=;
	b=SF0ovNOODl+ysB/CTvSKPbEriSHX/CRcfHRXG7MwzpxRCOlXVl2RHxnESjLDrzS2aGC2EVVbE3rvy
	 XZ/tqcXYkX+0ZVagpfEWkXAhjQLKX8wOsJsVUOPk8s9aRpUr/97pTCnpXLo4fpiRYe0foBikXx/6wv
	 NN2t48g57sOU2tYk0V2FI5M27BHRrdYwE5HBqO6qkmvjy8q+Gayyf2Lk8HpdH42OjJfPyAYX3E1nd4
	 H5k3a4/An1fRWJW31BA/jmYggXs4eD1ATWFbX9xTE1B/L4LYiEvY2T/pkQAvuCk82vqt3nEMKQKix0
	 tXx+TGTXm7eOjCZVneJFXhXkl5L7gLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=wCRPXxH3TgL7AtKRIM4kQGYE5THJ1u4cAVHFfmnp23I=;
	b=1F+wwMxDLCppDOU47omnaGMHoNwunuSPx33O8NmEVcVnFC/y171hv+XSeRzP12e3EInOVRzuZeNRm
	 1Dgt8V3Cg==
X-HalOne-Cookie: 2bafee458b238af5551c965e6954a36589d2a2e0
X-HalOne-ID: 45c8e030-e5cf-11ec-a911-d0431ea8a290
Received: from mailproxy3.cst.dirpod3-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 45c8e030-e5cf-11ec-a911-d0431ea8a290;
	Mon, 06 Jun 2022 19:31:33 +0000 (UTC)
Date: Mon, 6 Jun 2022 21:31:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] drm/mediatek: Config orientation property if
 panel provides it
Message-ID: <Yp5WFA2H52nHVP3d@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-9-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606152431.1889185-9-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_123136_977604_F7A493A2 
X-CRM114-Status: GOOD (  26.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

On Mon, Jun 06, 2022 at 11:24:31PM +0800, Hsin-Yi Wang wrote:
> Panel orientation property should be set before drm_dev_register().
> Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
> 
> Let the drm driver check if the remote end point is a panel and if it
> contains the orientation property. If it does, set it before
> drm_dev_register() is called.

I do not know the best way to do what you need to do here.
But it seems wrong to introduce a deprecated function
(drm_of_find_panel_or_bridge), to set the rotation property early.

I think you need to find a way to do this utilising the panel_bridge or
something.

	Sam

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d9f10a33e6fa..c56282412bfa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -185,6 +185,7 @@ struct mtk_dsi {
>  	struct drm_encoder encoder;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next_bridge;
> +	struct drm_panel *panel;
>  	struct drm_connector *connector;
>  	struct phy *phy;
>  
> @@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>  		ret = PTR_ERR(dsi->connector);
>  		goto err_cleanup_encoder;
>  	}
> +
> +	/* Read panel orientation */
> +	if (dsi->panel)
> +		drm_connector_set_panel_orientation(dsi->connector,
> +				drm_panel_get_orientation(dsi->panel));
> +
>  	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>  
>  	return 0;
> @@ -837,6 +844,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>  	struct drm_device *drm = data;
>  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
>  
> +	/* Get panel if existed */
> +	drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
> +
>  	ret = mtk_dsi_encoder_init(drm, dsi);
>  	if (ret)
>  		return ret;
> -- 
> 2.36.1.255.ge46751e96f-goog

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
