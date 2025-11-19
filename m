Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF717CF34AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i80dj0GflYpB1hZNEEPgVvWiw8lZXjOo2MgG9uRoiXg=; b=tnGGMRTtTk5e6DC5ehKmD69iDe
	hwgU0kq+gJrIV/5jzP1wGoBK/ryALpztRS7UbwwmC/k2DeyS20tM7+Vx/MxnYvO0Kgs4/JWuclsNu
	fyX4itNM7n0lnABulPp5sY14Gc83/9M7w9j1G0SwZFqUfufB5+EQfT/CdtbaBpvCO/GEGc9NhAbPZ
	MHybZFFLWGK//N0V7e3nyn6o9ZJqwKAWnNbb+sa642s3xZU1f6HtuAJo0KOkzTXFmyt9lTg59Psj7
	7RXMRzYBoIWjZUES1d3eKv3h3YFt65XbElUVFdquVJkmpyyqCuVNJy7ABQuN5uITZdQcsQ2G+Iusg
	4jV7f0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjIE-00000003O98-3djc;
	Wed, 19 Nov 2025 14:36:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjIB-00000003O85-1R7u
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 14:36:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B8BD51A1BE0;
	Wed, 19 Nov 2025 14:36:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E7AC60699;
	Wed, 19 Nov 2025 14:36:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3D1810371A0D;
	Wed, 19 Nov 2025 15:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763562975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=i80dj0GflYpB1hZNEEPgVvWiw8lZXjOo2MgG9uRoiXg=;
	b=cyOEp89nJrCZoYG3avsOq17lwj2MmFPr9JJNV8uJoRbiUf4i0FpASC7DYih3+kt22Z4JLK
	hSfQAKmElJaMv6eTW96h32EOAkaD/+EFkR9eQ9wj6eOaNWPXmFuek8CAOxBduzaCp3MKqE
	SRSwfh/p42u24j0seruGdGX03vsbe1FXL1+wnIiKztiT4pTasuKQA7XQ5fMZEt1qxhkfkX
	Lkm5OLbXHB4C5ilnR5VnsNMMw4PF073vGSCHsvLUZo2v92DoVPJWTUfnDbHwDmg8DEvTRD
	G2tqiz9kie5yiw/RfMiYlKZFRz6f0jK5xnKofaGhGeYtBD9xgQSkRsDygt5W+A==
Message-ID: <3c257fa4-764c-486a-b4b0-74b137df59fc@bootlin.com>
Date: Wed, 19 Nov 2025 14:36:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/26] drm/bridge: ite-it66121: use
 devm_drm_of_find_bridge() to put the next bridge
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
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-7-0db98a7fe474@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-7-0db98a7fe474@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_063619_523397_69365371 
X-CRM114-Status: GOOD (  17.25  )
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



On 11/19/25 13:05, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to devm_drm_of_find_bridge() which puts the bridge
> reference on remove or on probe failure.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index aa7b1dcc5d70..5bc4e5afb823 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1542,7 +1542,7 @@ static int it66121_probe(struct i2c_client *client)
>   		return -EINVAL;
>   	}
>   
> -	ctx->next_bridge = of_drm_find_bridge(ep);
> +	ctx->next_bridge = devm_drm_of_find_bridge(dev, ep);
>   	of_node_put(ep);
>   	if (!ctx->next_bridge) {

And for all the patches converting of_drm_find_bridge to 
devm_drm_of_find_bridge, I think the pattern:

	bridge = devm_drm_of_find_bridge(dev, ep);
	if(!bridge)
		return -E...;

is wrong, because devm_drm_of_find_bridge can return a non-null error code.


>   		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
> 


