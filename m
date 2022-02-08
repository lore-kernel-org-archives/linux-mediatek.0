Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F11DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 08:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLuYqzJVqg3YfO9RfiF0tK3y2SZkwpX5KlURhbUGiiY=; b=E79JP53DQVxlzq
	qIm/3BrKjXK+COxsTg/1LAC5JUc8CYsucuOAWDx1jaffWP2aHM8ChIP8xaTgRmK3WNDidGwRxTmrT
	byOCLVPlobAs0uI9DlvwKqgmvzogwqvKy0flzP+jKxJiTCBRRRLaDZAf8US5+/sOPHxTaEQqW3rEA
	Oceof2FjsEd8kgtWPYpMZQJ6ZhTaixr4QnhH850N/CLQ4nJxWZGRq5fmad/QX/sBJ7DWe/vGP/iLm
	ltCTDbqYKvJk4W+I9/RHq7eBS/JJ0eurCT1BqDgEyOQHvNSUuH+Yya0R2mnxEHrzQJQq8ui57aKdV
	FAN1JQ/sbzq9d2eU2jRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHLmT-00CvkZ-ME; Tue, 08 Feb 2022 08:23:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHLkU-00CugX-JS; Tue, 08 Feb 2022 08:21:20 +0000
X-UUID: 3025f1875b1e4e8fa35403da1e7331e9-20220208
X-UUID: 3025f1875b1e4e8fa35403da1e7331e9-20220208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2127330601; Tue, 08 Feb 2022 01:21:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 00:21:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Feb 2022 16:21:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Feb 2022 16:21:00 +0800
Message-ID: <20755168cc2be0d1bb5e40907cfe27cea25a9363.camel@mediatek.com>
Subject: Re: [PATCH v4] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
From: CK Hu <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>
CC: <chunkuang.hu@kernel.org>, <airlied@linux.ie>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
 <andrzej.hajda@intel.com>, <linux-mediatek@lists.infradead.org>, Jagan Teki
 <jagan@amarulasolutions.com>, <matthias.bgg@gmail.com>,
 <kernel@collabora.com>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 8 Feb 2022 16:20:58 +0800
In-Reply-To: <20220131085520.287105-1-angelogioacchino.delregno@collabora.com>
References: <20220131085520.287105-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_002118_687219_73485208 
X-CRM114-Status: GOOD (  31.12  )
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

Hi, Angelo:

On Mon, 2022-01-31 at 09:55 +0100, AngeloGioacchino Del Regno wrote:
> DRM bridge drivers are now attaching their DSI device at probe time,
> which requires us to register our DSI host in order to let the bridge
> to probe: this recently started producing an endless -EPROBE_DEFER
> loop on some machines that are using external bridges, like the
> parade-ps8640, found on the ACER Chromebook R13.
> 
> Now that the DSI hosts/devices probe sequence is documented, we can
> do adjustments to the mtk_dsi driver as to both fix now and make sure
> to avoid this situation in the future: for this, following what is
> documented in drm_bridge.c, move the mtk_dsi component_add() to the
> mtk_dsi_ops.attach callback and delete it in the detach callback;
> keeping in mind that we are registering a drm_bridge for our DSI,
> which is only used/attached if the DSI Host is bound, it wouldn't
> make sense to keep adding our bridge at probe time (as it would
> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
> that one to the dsi host attach function (and remove it in detach).
> 
> Cc: <stable@vger.kernel.org> # 5.15.x
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> 
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++----------
> ----
>  1 file changed, 84 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..bced4c7d668e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -786,18 +786,101 @@ void mtk_dsi_ddp_stop(struct device *dev)
>  	mtk_dsi_poweroff(dsi);
>  }
>  
> 

[snip]

> +
>  static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>  			       struct mipi_dsi_device *device)
>  {
>  	struct mtk_dsi *dsi = host_to_dsi(host);
> +	struct device *dev = host->dev;
> +	int ret;
>  
>  	dsi->lanes = device->lanes;
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
> +	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0,
> 0);

The original would process panel. Why do you remove the panel part?
It's better that someone has a platform of DSI->Panel to test this
patch.

Regards,
CK

> +	if (IS_ERR(dsi->next_bridge))
> +		return PTR_ERR(dsi->next_bridge);
> +
> +	drm_bridge_add(&dsi->bridge);
> +
> +	ret = component_add(host->dev, &mtk_dsi_component_ops);
> +	if (ret) {
> +		DRM_ERROR("failed to add dsi_host component: %d\n",
> ret);
> +		drm_bridge_remove(&dsi->bridge);
> +		return ret;
> +	}
>  
>  	return 0;
>  }
>  
> +static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
> +			       struct mipi_dsi_device *device)
> +{
> +	struct mtk_dsi *dsi = host_to_dsi(host);
> +
> +	component_del(host->dev, &mtk_dsi_component_ops);
> +	drm_bridge_remove(&dsi->bridge);
> +	return 0;
> +}
> +
>  static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
>  {
>  	int ret;
> @@ -938,73 +1021,14 @@ static ssize_t mtk_dsi_host_transfer(struct
> mipi_dsi_host *host,
>  
>  static const struct mipi_dsi_host_ops mtk_dsi_ops = {
>  	.attach = mtk_dsi_host_attach,
> +	.detach = mtk_dsi_host_detach,
>  	.transfer = mtk_dsi_host_transfer,
>  };
>  
> 

[snip]

> -
>  static int mtk_dsi_probe(struct platform_device *pdev)
>  {
>  	struct mtk_dsi *dsi;
>  	struct device *dev = &pdev->dev;
> -	struct drm_panel *panel;
>  	struct resource *regs;
>  	int irq_num;
>  	int ret;
> @@ -1021,19 +1045,6 @@ static int mtk_dsi_probe(struct
> platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &panel, &dsi->next_bridge);
> -	if (ret)
> -		goto err_unregister_host;
> -
> -	if (panel) {
> -		dsi->next_bridge = devm_drm_panel_bridge_add(dev,
> panel);
> -		if (IS_ERR(dsi->next_bridge)) {
> -			ret = PTR_ERR(dsi->next_bridge);
> -			goto err_unregister_host;
> -		}
> -	}
> -
>  	dsi->driver_data = of_device_get_match_data(dev);
>  
>  	dsi->engine_clk = devm_clk_get(dev, "engine");
> @@ -1098,14 +1109,6 @@ static int mtk_dsi_probe(struct
> platform_device *pdev)
>  	dsi->bridge.of_node = dev->of_node;
>  	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>  
> -	drm_bridge_add(&dsi->bridge);
> -
> -	ret = component_add(&pdev->dev, &mtk_dsi_component_ops);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to add component: %d\n",
> ret);
> -		goto err_unregister_host;
> -	}
> -
>  	return 0;
>  
>  err_unregister_host:
> @@ -1118,8 +1121,6 @@ static int mtk_dsi_remove(struct
> platform_device *pdev)
>  	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
>  
>  	mtk_output_dsi_disable(dsi);
> -	drm_bridge_remove(&dsi->bridge);
> -	component_del(&pdev->dev, &mtk_dsi_component_ops);
>  	mipi_dsi_host_unregister(&dsi->host);
>  
>  	return 0;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
