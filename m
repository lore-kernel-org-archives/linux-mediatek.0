Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6No7+k0uTnQOaFaPpQPaCeJgEXpq5cbZRrPSIESdZ4=; b=iSV515bAu5yj+i
	kVtblhFQZcPmVAMk0yY7We2949eLIlaTsQ6NRcG2GzjL/BZdPQuo/nuHwNvhOx9OOqJ2RDSzrtVxO
	b85GfHHGfawVIQnOrrtzbY31+zD+W2YzMH2UBsH9CBDrA+PnVq+7hQlOyKCBzXY2gDxGBTwCd4vZC
	3Zomi0Lw0BXJn5E31I4n3uO0qr1iKyNuWcGG/y+SFhzP4xdB7OhAMT0ulWm3ZI6QIdfKLvKyGzrOB
	z3jU5qX/FEqNNc6ga1RmP/S0QOdux6sbAF/nLvJLhQ/D3xcCCtLDrXvX1ox9niwoa5nFqv5Jl+oNv
	aSEVjLmq6nxwm+r2Gm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHoHM-000R8Q-05; Wed, 09 Feb 2022 14:49:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHoH4-000R0e-Eq; Wed, 09 Feb 2022 14:48:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 6C6821F45889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644418126;
 bh=YWqRaMse8wkQ3xG+y49Y53HHw6xq39YdnDTzPQLGhG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRpMhCDeuLo46HyugPFzku6BZLxKedezPp7Q8IOBKp0H0dDcL1tMLyifesywMEF7t
 G93lB0CMI7KtPFjzizw+1N7ON3aKdbniI8jYhWlp483pY4i3SBsZQrsMOv6z74OQso
 CC9PEB79/0BrfbQMlQNjRVtVhr9T4IMqMEHFVfmQBoUHkvH1ukOj0NrLNzo+IZ6h4j
 bego9MTTkEA8ptxEF4KnE4ykofQDZGjmH/OYYawLCaoEHuTihcQ/Ueseqb8poKxkL6
 qTFotTEkhgEC1qqKaA6c2bNfI5/hI/OTOpfgBMpMQaszyS4EX4gpNNfzI5g0bCHkcS
 psv46BxK3Z1iQ==
Date: Wed, 9 Feb 2022 09:48:41 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com,
 andrzej.hajda@intel.com, stable@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v4] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
Message-ID: <20220209144841.v2kjzy5kniukbunq@notapiano>
References: <20220131085520.287105-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131085520.287105-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_064850_853680_0930881C 
X-CRM114-Status: GOOD (  31.27  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Angelo,

On Mon, Jan 31, 2022 at 09:55:20AM +0100, AngeloGioacchino Del Regno wrote:
> DRM bridge drivers are now attaching their DSI device at probe time,
> which requires us to register our DSI host in order to let the bridge
> to probe: this recently started producing an endless -EPROBE_DEFER
> loop on some machines that are using external bridges, like the
> parade-ps8640, found on the ACER Chromebook R13.
> =

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
> =

> Cc: <stable@vger.kernel.org> # 5.15.x
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> =

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++--------------
>  1 file changed, 84 insertions(+), 83 deletions(-)
> =

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 5d90d2eb0019..bced4c7d668e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -786,18 +786,101 @@ void mtk_dsi_ddp_stop(struct device *dev)
>  	mtk_dsi_poweroff(dsi);
>  }
>  =

> +static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *=
dsi)
> +{
> +	int ret;
> +
> +	ret =3D drm_simple_encoder_init(drm, &dsi->encoder,
> +				      DRM_MODE_ENCODER_DSI);
> +	if (ret) {
> +		DRM_ERROR("Failed to encoder init to drm\n");
> +		return ret;
> +	}
> +
> +	dsi->encoder.possible_crtcs =3D mtk_drm_find_possible_crtc_by_comp(drm,=
 dsi->host.dev);
> +
> +	ret =3D drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		goto err_cleanup_encoder;
> +
> +	dsi->connector =3D drm_bridge_connector_init(drm, &dsi->encoder);
> +	if (IS_ERR(dsi->connector)) {
> +		DRM_ERROR("Unable to create bridge connector\n");
> +		ret =3D PTR_ERR(dsi->connector);
> +		goto err_cleanup_encoder;
> +	}
> +	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> +
> +	return 0;
> +
> +err_cleanup_encoder:
> +	drm_encoder_cleanup(&dsi->encoder);
> +	return ret;
> +}
> +
> +static int mtk_dsi_bind(struct device *dev, struct device *master, void =
*data)
> +{
> +	int ret;
> +	struct drm_device *drm =3D data;
> +	struct mtk_dsi *dsi =3D dev_get_drvdata(dev);
> +
> +	ret =3D mtk_dsi_encoder_init(drm, dsi);
> +	if (ret)
> +		return ret;
> +
> +	return device_reset_optional(dev);
> +}
> +
> +static void mtk_dsi_unbind(struct device *dev, struct device *master,
> +			   void *data)
> +{
> +	struct mtk_dsi *dsi =3D dev_get_drvdata(dev);
> +
> +	drm_encoder_cleanup(&dsi->encoder);
> +}
> +
> +static const struct component_ops mtk_dsi_component_ops =3D {
> +	.bind =3D mtk_dsi_bind,
> +	.unbind =3D mtk_dsi_unbind,
> +};
> +
>  static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>  			       struct mipi_dsi_device *device)
>  {
>  	struct mtk_dsi *dsi =3D host_to_dsi(host);
> +	struct device *dev =3D host->dev;
> +	int ret;
>  =

>  	dsi->lanes =3D device->lanes;
>  	dsi->format =3D device->format;
>  	dsi->mode_flags =3D device->mode_flags;
> +	dsi->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +	if (IS_ERR(dsi->next_bridge))
> +		return PTR_ERR(dsi->next_bridge);
> +
> +	drm_bridge_add(&dsi->bridge);
> +
> +	ret =3D component_add(host->dev, &mtk_dsi_component_ops);
> +	if (ret) {
> +		DRM_ERROR("failed to add dsi_host component: %d\n", ret);
> +		drm_bridge_remove(&dsi->bridge);
> +		return ret;
> +	}
>  =

>  	return 0;
>  }
>  =

> +static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
> +			       struct mipi_dsi_device *device)
> +{
> +	struct mtk_dsi *dsi =3D host_to_dsi(host);
> +
> +	component_del(host->dev, &mtk_dsi_component_ops);
> +	drm_bridge_remove(&dsi->bridge);
> +	return 0;
> +}
> +
>  static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
>  {
>  	int ret;
> @@ -938,73 +1021,14 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_d=
si_host *host,
>  =

>  static const struct mipi_dsi_host_ops mtk_dsi_ops =3D {
>  	.attach =3D mtk_dsi_host_attach,
> +	.detach =3D mtk_dsi_host_detach,
>  	.transfer =3D mtk_dsi_host_transfer,
>  };
>  =

> -static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *=
dsi)
> -{
> -	int ret;
> -
> -	ret =3D drm_simple_encoder_init(drm, &dsi->encoder,
> -				      DRM_MODE_ENCODER_DSI);
> -	if (ret) {
> -		DRM_ERROR("Failed to encoder init to drm\n");
> -		return ret;
> -	}
> -
> -	dsi->encoder.possible_crtcs =3D mtk_drm_find_possible_crtc_by_comp(drm,=
 dsi->host.dev);
> -
> -	ret =3D drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
> -				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -	if (ret)
> -		goto err_cleanup_encoder;
> -
> -	dsi->connector =3D drm_bridge_connector_init(drm, &dsi->encoder);
> -	if (IS_ERR(dsi->connector)) {
> -		DRM_ERROR("Unable to create bridge connector\n");
> -		ret =3D PTR_ERR(dsi->connector);
> -		goto err_cleanup_encoder;
> -	}
> -	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> -
> -	return 0;
> -
> -err_cleanup_encoder:
> -	drm_encoder_cleanup(&dsi->encoder);
> -	return ret;
> -}
> -
> -static int mtk_dsi_bind(struct device *dev, struct device *master, void =
*data)
> -{
> -	int ret;
> -	struct drm_device *drm =3D data;
> -	struct mtk_dsi *dsi =3D dev_get_drvdata(dev);
> -
> -	ret =3D mtk_dsi_encoder_init(drm, dsi);
> -	if (ret)
> -		return ret;
> -
> -	return device_reset_optional(dev);
> -}
> -
> -static void mtk_dsi_unbind(struct device *dev, struct device *master,
> -			   void *data)
> -{
> -	struct mtk_dsi *dsi =3D dev_get_drvdata(dev);
> -
> -	drm_encoder_cleanup(&dsi->encoder);
> -}
> -
> -static const struct component_ops mtk_dsi_component_ops =3D {
> -	.bind =3D mtk_dsi_bind,
> -	.unbind =3D mtk_dsi_unbind,
> -};
> -
>  static int mtk_dsi_probe(struct platform_device *pdev)
>  {
>  	struct mtk_dsi *dsi;
>  	struct device *dev =3D &pdev->dev;
> -	struct drm_panel *panel;
>  	struct resource *regs;
>  	int irq_num;
>  	int ret;
> @@ -1021,19 +1045,6 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>  		return ret;
>  	}
>  =

> -	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &panel, &dsi->next_bridge);
> -	if (ret)
> -		goto err_unregister_host;
> -
> -	if (panel) {
> -		dsi->next_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> -		if (IS_ERR(dsi->next_bridge)) {
> -			ret =3D PTR_ERR(dsi->next_bridge);
> -			goto err_unregister_host;
> -		}
> -	}
> -
>  	dsi->driver_data =3D of_device_get_match_data(dev);
>  =

>  	dsi->engine_clk =3D devm_clk_get(dev, "engine");
> @@ -1098,14 +1109,6 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>  	dsi->bridge.of_node =3D dev->of_node;
>  	dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>  =

> -	drm_bridge_add(&dsi->bridge);
> -
> -	ret =3D component_add(&pdev->dev, &mtk_dsi_component_ops);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to add component: %d\n", ret);
> -		goto err_unregister_host;
> -	}
> -
>  	return 0;
>  =

>  err_unregister_host:
> @@ -1118,8 +1121,6 @@ static int mtk_dsi_remove(struct platform_device *p=
dev)
>  	struct mtk_dsi *dsi =3D platform_get_drvdata(pdev);
>  =

>  	mtk_output_dsi_disable(dsi);
> -	drm_bridge_remove(&dsi->bridge);
> -	component_del(&pdev->dev, &mtk_dsi_component_ops);
>  	mipi_dsi_host_unregister(&dsi->host);
>  =

>  	return 0;
> -- =

> 2.33.1
> =

> =

> -- =

> To unsubscribe, send mail to kernel-unsubscribe@lists.collabora.co.uk.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
