Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A48C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:16:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CF2C206DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nkh0+L9w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EiQraoXi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CF2C206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3M6FYvXj6RgPyj9+PqRBdeKQPBnBrUP/2L+v6u1YSe8=; b=Nkh0+L9wpJzHd2
	dq6F8ghgB3f02JoicTbAz61pMk+plFzQd1d6hahI/HFH/gxLv80cz3svELMLGBRdpUDmGztFyZCUQ
	d6PJjEWdexh1OB9kZ6ylRFBu+V2+RazdB7dsG5CK2gQ+GhvQJa2zAwCIz/BANDo2wwCjtYzcW3X6p
	A9IajYXnk7JW6lpWqZ+PQauF95ELGPeaFx9XEUPx6uwLG87ebHzUjep/lTYP9tkFy/CMcq28CwWsT
	qyCHhsM2RH91fOyz5f05ccvdVp0J/BRg+CxQopKm4sWoQeoR9cnsSbnmRKi6lNuzRHY4BtAx1ipDl
	uxY2Tp/r6oEtE8ApN/Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic2Q4-0000sz-MB; Tue, 03 Dec 2019 07:16:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic2Pw-0000kq-83; Tue, 03 Dec 2019 07:16:17 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D64A309;
 Tue,  3 Dec 2019 08:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1575357374;
 bh=Usz0JCCqQIuQdvNt1yfGPlfXkflUIxoUH5/BVcfHsms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EiQraoXiOk0tFDXgQR8u+pBrTji0fGFm+sxcGtcEKKQdZrQTqo6FLDlJk24zPCmST
 dfFb87DQO6U1M0tkWieUqiQwF6+RLsI0lq/uHKz8XyBsGo5yPqNvJdG3DUQIkRT3o8
 jgqksOEqxV7ih0CGrpHhjUAg6ampkDU6jxHorZJs=
Date: Tue, 3 Dec 2019 09:16:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 13/26] drm/panel: lvds: use drm_panel backlight support
Message-ID: <20191203071606.GI4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-14-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-14-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_231616_591458_6B06EB39 
X-CRM114-Status: GOOD (  16.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stefan Agner <stefan@agner.ch>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:17PM +0100, Sam Ravnborg wrote:
> Use the backlight support in drm_panel to simplify the driver
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 40 ++++--------------------------
>  1 file changed, 5 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 5e40b674bb15..5ce3f4a2b7a1 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -8,7 +8,6 @@
>   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  
> -#include <linux/backlight.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> @@ -34,7 +33,6 @@ struct panel_lvds {
>  	unsigned int bus_format;
>  	bool data_mirror;
>  
> -	struct backlight_device *backlight;
>  	struct regulator *supply;
>  
>  	struct gpio_desc *enable_gpio;
> @@ -46,19 +44,6 @@ static inline struct panel_lvds *to_panel_lvds(struct drm_panel *panel)
>  	return container_of(panel, struct panel_lvds, panel);
>  }
>  
> -static int panel_lvds_disable(struct drm_panel *panel)
> -{
> -	struct panel_lvds *lvds = to_panel_lvds(panel);
> -
> -	if (lvds->backlight) {
> -		lvds->backlight->props.power = FB_BLANK_POWERDOWN;
> -		lvds->backlight->props.state |= BL_CORE_FBBLANK;
> -		backlight_update_status(lvds->backlight);
> -	}
> -
> -	return 0;
> -}
> -
>  static int panel_lvds_unprepare(struct drm_panel *panel)
>  {
>  	struct panel_lvds *lvds = to_panel_lvds(panel);
> @@ -93,19 +78,6 @@ static int panel_lvds_prepare(struct drm_panel *panel)
>  	return 0;
>  }
>  
> -static int panel_lvds_enable(struct drm_panel *panel)
> -{
> -	struct panel_lvds *lvds = to_panel_lvds(panel);
> -
> -	if (lvds->backlight) {
> -		lvds->backlight->props.state &= ~BL_CORE_FBBLANK;
> -		lvds->backlight->props.power = FB_BLANK_UNBLANK;
> -		backlight_update_status(lvds->backlight);
> -	}
> -
> -	return 0;
> -}
> -
>  static int panel_lvds_get_modes(struct drm_panel *panel,
>  				struct drm_connector *connector)
>  {
> @@ -132,10 +104,8 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
>  }
>  
>  static const struct drm_panel_funcs panel_lvds_funcs = {
> -	.disable = panel_lvds_disable,
>  	.unprepare = panel_lvds_unprepare,
>  	.prepare = panel_lvds_prepare,
> -	.enable = panel_lvds_enable,
>  	.get_modes = panel_lvds_get_modes,
>  };
>  
> @@ -242,10 +212,6 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	lvds->backlight = devm_of_find_backlight(lvds->dev);
> -	if (IS_ERR(lvds->backlight))
> -		return PTR_ERR(lvds->backlight);
> -
>  	/*
>  	 * TODO: Handle all power supplies specified in the DT node in a generic
>  	 * way for panels that don't care about power supply ordering. LVDS
> @@ -257,6 +223,10 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  	drm_panel_init(&lvds->panel, lvds->dev, &panel_lvds_funcs,
>  		       DRM_MODE_CONNECTOR_LVDS);
>  
> +	ret = drm_panel_of_backlight(&lvds->panel);
> +	if (ret)
> +		return ret;
> +
>  	ret = drm_panel_add(&lvds->panel);
>  	if (ret < 0)
>  		return ret;
> @@ -271,7 +241,7 @@ static int panel_lvds_remove(struct platform_device *pdev)
>  
>  	drm_panel_remove(&lvds->panel);
>  
> -	panel_lvds_disable(&lvds->panel);
> +	drm_panel_disable(&lvds->panel);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
