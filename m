Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E547CC54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucUVa3vBeKVA7/+t2p6qNPzz5T9dSkQm/dmT7JC8vdw=; b=3EDgyC/NwfiDBsmIpCsqOLP3Wf
	WVZ5ZE1l+02A7yhl8tK+xrnIY3fxvi67hq3eUKvUAnKkrf3TDibuyvxUlTX7juxvmM8WqTb8L+xLl
	ZBJbFpCI1W6dn9IcrVFFhcRw4GPtLm7dpCDX/9X3TxASm2Zufth/BZbgQu8nXT7g7aaV9RTqjORJk
	MVX4bUhPeAombyrDg16GKTWb1IRYZ912oJWv9xvNl+JBRSWqmyXVB0Im3+r2L/TfyTQGRKRk6t0LM
	bhSH/7uZ0yuiOtw1vdfGdCdv4rkSJvi30G/xA5f9Pb/Nd8OazUwMCXi6dhZuMwf7gLvn95Ng6albV
	RT/IlSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIrt-00CZ1z-GX; Mon, 19 Sep 2022 15:39:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIjV-00CTqw-MX; Mon, 19 Sep 2022 15:30:55 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB6C1D02;
	Mon, 19 Sep 2022 17:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1663601452;
	bh=sYSOlMy28kH/P+QBBNi9ArlEboFiuqMn4exN23qOcCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7t6TxF9jeuA5e3gYBG9/oPrmeuKock53bxAIfHgCoiaqweE/8GClM2yunbjHy6nJ
	 yr7FXfCotngmEOvzDV91b8RUEk19QX1/I0i4SETf0lsNaU7U8yTlKYjqun/GycR1Yw
	 1eVny6FgGx0y86lm57zYJ7VQeV5BPgNTYJNXtg7c=
Date: Mon, 19 Sep 2022 18:30:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Benson Leung <bleung@chromium.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	chrome-platform@lists.linux.dev,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philip Chen <philipchen@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 08/12] drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
Message-ID: <YyiLHvZ8emrUDicw@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_083053_933377_2089C84B 
X-CRM114-Status: GOOD (  17.43  )
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

Hi Sam,

Thank you for the patch.

On Sun, Jul 17, 2022 at 07:57:57PM +0200, Sam Ravnborg wrote:
> The implementation of drm_bridge_funcs.mode_fixup is optional
> so there is no need to provide an empty implementation.
> Drop mtk_hdmi_bridge_mode_fixup() so the driver no longer uses the
> deprecated drm_bridge_funcs.mode_fixup() operation.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index a63b76055f81..7321aa1ee6f0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1293,13 +1293,6 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
>  	return 0;
>  }
>  
> -static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> -				       const struct drm_display_mode *mode,
> -				       struct drm_display_mode *adjusted_mode)
> -{
> -	return true;
> -}
> -
>  static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>  					   struct drm_bridge_state *old_bridge_state)
>  {
> @@ -1399,7 +1392,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.attach = mtk_hdmi_bridge_attach,
> -	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
>  	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
>  	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
>  	.mode_set = mtk_hdmi_bridge_mode_set,

-- 
Regards,

Laurent Pinchart

