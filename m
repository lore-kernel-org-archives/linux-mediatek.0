Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3444D116EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Nov 2025 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUAdZeQP94vW72b4SJ//V/MtjinN884gsD5QWNElCrg=; b=aUQWoBSEne8CPFjvk5gX+wBSGN
	0xSnwdtBMRkFiOA+Vr4nDJeDp0IalCxRti+oAoMabk0o340tN8cIExgie9lz6m93YQdYBQDdAysoK
	X85eOD+6gOr8gm75bQ6st8SOmN7aecrsrH/NWcbjJ+rGifWhy94gZgDPD8jTWE+QwRXcr7ejMjlcm
	YdA1P/jP1Rvc3BleQR202OiwdKZ8PWMtbLAR7zvx1umiwPjDF73VhN1G7QDQYvruu2Cz4hIfU+0gj
	nDw5MBPEr6LgoAtQpl0jBmGB4Ak7HB755B0HnX1kmVGTkavMgtjZor/5jgKeMrmWjrIqvlENd9u+R
	cOT62oNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP6MF-00000000zPu-0jal;
	Fri, 28 Nov 2025 21:50:27 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP6M8-00000000zPG-37J4;
	Fri, 28 Nov 2025 21:50:20 +0000
Message-ID: <a23be1b4-89ce-4db9-bb68-9a5aa248f4a0@infradead.org>
Date: Fri, 28 Nov 2025 13:50:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] drm/bridge: make of_drm_find_bridge() a wrapper
 of of_drm_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-4-88f8a107eca2@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-4-88f8a107eca2@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/28/25 8:50 AM, Luca Ceresoli wrote:
> of_drm_find_bridge() is identical to of_drm_get_bridge() except it does
> not increment the refcount. Rewrite it as a wrapper and put the bridge
> being returned so the behaviour is still the same.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v2:
> - Added comment to document why we put the reference
> ---
>  drivers/gpu/drm/drm_bridge.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 21a84715d221..9b7e3f859973 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1467,19 +1467,17 @@ EXPORT_SYMBOL(of_drm_get_bridge);
>   */
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  {
> -	struct drm_bridge *bridge;
> -
> -	mutex_lock(&bridge_lock);
> +	struct drm_bridge *bridge = of_drm_get_bridge(np);
>  
> -	list_for_each_entry(bridge, &bridge_list, list) {
> -		if (bridge->of_node == np) {
> -			mutex_unlock(&bridge_lock);
> -			return bridge;
> -		}
> -	}
> +	/**

This isn't a kernel-doc comment, so please don't use "/**" here.
Just use "/*".

> +	 * We need to emulate the original semantics of
> +	 * of_drm_find_bridge(), which was not getting any bridge
> +	 * reference. Being now based on of_drm_get_bridge() which gets a
> +	 * reference, put it before returning.
> +	 */
> +	drm_bridge_put(bridge);
>  
> -	mutex_unlock(&bridge_lock);
> -	return NULL;
> +	return bridge;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
>  #endif
> 

-- 
~Randy


