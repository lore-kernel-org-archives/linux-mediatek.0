Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272B8C432C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 06:44:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4EAC206DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 06:44:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGfRzplS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v2/pr/F9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4EAC206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ldiqhQYcvBjIVJlftHqOsSsaxe4YqRzSM6bvBcn4yE=; b=kGfRzplS9VAP1A
	jeTRrkqdO0AnRTiB5gVO/mK2VeAH1YoSdldvHXD7VdAMeaXOP1Ht0oCEc0xtFF8G+ADfYaOBoW/zC
	i5+EgIQHiBCAY+Lij8SYBxoSDFOqEdzGdtogsbF7XM8WdYzPsVJHpGxDfaOxe9+XnqYIRkDZn4HRW
	x6tKAIl9+IdAurFV/419EQAh1cqec+/Z355+Cprn9at+rPCnPxx4qKlMyvxqf0Pd4XRe8DEasKox8
	t2fJ0z9iqGhtU4/9FUjNmSnZ2qJhYtpe+ByUZODDFtD5kAP+zx318J0O0zq7DufFpkxrnbcTjjgrB
	03xdxngVoz1NjpG1EsbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic1vG-0001pe-Bn; Tue, 03 Dec 2019 06:44:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic1v5-0001h0-H6; Tue, 03 Dec 2019 06:44:25 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C443309;
 Tue,  3 Dec 2019 07:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1575355461;
 bh=g/3jjUGzt/ZPk4oebHW3YfmYOgHqwdzbZQuepaZXnZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v2/pr/F9edrxg9ZBPVTOYa8P9ikzqJhOu4ROsO8ftPE8VHwx4EgD78nZi+ZYlO0mB
 5H3mAZICncryXfGSu8OoTEKCEe2GYcFlMRt+09pOXdmEMFp0scnGdQG6U2hkbu/HCd
 s+eKKGxEAQHDPgJZtE9suYSiN0MVpAb6R2OBuXY4=
Date: Tue, 3 Dec 2019 08:44:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 04/26] drm: get drm_bridge_panel connector via helper
Message-ID: <20191203064414.GD4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-5-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_224423_862999_29F75637 
X-CRM114-Status: GOOD (  18.96  )
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
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Eric Anholt <eric@anholt.net>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:08PM +0100, Sam Ravnborg wrote:
> The drm_connector created by drm_panel_bridge was accessed
> via drm_panel.connector.
> Avoid the detour around drm_panel by providing a simple get method.
> This avoids direct access to the connector field in drm_panel in
> the two users.

You may want to add that this is needed to prepare for removal of
drm_panel.connector.

> Update pl111 and tve200 to use the new helper.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/bridge/panel.c      | 16 ++++++++++++++++
>  drivers/gpu/drm/pl111/pl111_drv.c   |  2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c |  2 +-
>  include/drm/drm_bridge.h            |  1 +
>  4 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index f4e293e7cf64..c5e27b81588a 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -289,3 +289,19 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
> +
> +/**
> + * drm_panel_bridge_connector - return pointer to connector

Maybe "return the connector for the panel bridge" ?

> + *
> + * drm_panel_bridge creates the connector.
> + * This function gives external access to the connector.
> + *
> + * Returns: Pointer to drm_conneector

s/drm_conneector/drm_connector/

> + */
> +struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
> +{
> +	struct panel_bridge * panel_bridge;

s/\* panel_bridge/*panel_bridge/

There's also a missing blank line, didn't checkpatch warn about this ?

With those small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +
> +	return &panel_bridge->connector;
> +}
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index 63dfcda04147..aa8aa8d9e405 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -166,7 +166,7 @@ static int pl111_modeset_init(struct drm_device *dev)
>  	priv->bridge = bridge;
>  	if (panel) {
>  		priv->panel = panel;
> -		priv->connector = panel->connector;
> +		priv->connector = drm_panel_bridge_connector(bridge);
>  	}
>  
>  	ret = pl111_display_init(dev);
> diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
> index 954b09c948eb..00ba9e5ce130 100644
> --- a/drivers/gpu/drm/tve200/tve200_drv.c
> +++ b/drivers/gpu/drm/tve200/tve200_drv.c
> @@ -110,7 +110,7 @@ static int tve200_modeset_init(struct drm_device *dev)
>  	}
>  
>  	priv->panel = panel;
> -	priv->connector = panel->connector;
> +	priv->connector = drm_panel_bridge_connector(bridge);
>  	priv->bridge = bridge;
>  
>  	dev_info(dev->dev, "attached to panel %s\n",
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index c0a2286a81e9..9a4902accfe5 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -438,6 +438,7 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
>  struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  						   struct drm_panel *panel,
>  						   u32 connector_type);
> +struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
>  #endif
>  
>  #endif

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
