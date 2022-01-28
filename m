Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FCCC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 05:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BOkTK+J6A5hogmnj3+vE2sdKoWYXw+ijv8d0Udh4H0=; b=2lVuThNbn9ZM72
	gz2ZcISGLMcdZ0jVhLRv/FGi2dPtw4RnRxgEdJzEw7LnQLjGNcOlsOB3yfWJ59dLP7riLRjkA3mDM
	vFNOjXe//eT72aA8GIPJi261x3mF5A5iI7IY1ouXBa8toUPa6toYqB6PA48Cb12CIq8G/cH2oGJRU
	b0zufaHtZL1D/snPpR7pdrWr185cZrcb4TnT8f56Vp7vRY5csX6Gf31QtM0YRcCMJX53177Rw1YMW
	apmr1HtvoAGOXWEsDtt1zdaverW9ny30xW9aseoVi84FI/zFKo5r0bHtAtGG4aDSFjmqk9NgU3guv
	nIu0bjmOumEEmlA594Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJQe-000PDm-V7; Fri, 28 Jan 2022 05:04:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJQb-000PC4-Rs; Fri, 28 Jan 2022 05:04:07 +0000
X-UUID: 14da215924334b6a9384b0ff6af1c3a1-20220127
X-UUID: 14da215924334b6a9384b0ff6af1c3a1-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 792299379; Thu, 27 Jan 2022 22:03:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 21:03:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 28 Jan 2022 13:03:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 13:03:55 +0800
Message-ID: <092258211c47eca805c4dea6c4bf4ecc4c246cea.camel@mediatek.com>
Subject: Re: [v1, 3/3] drm/mediatek: Move the getting bridge node function
 to mtk_dsi_bind
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <jitao.shi@mediatek.com>
Date: Fri, 28 Jan 2022 13:03:55 +0800
In-Reply-To: <1643283773-7081-4-git-send-email-xinlei.lee@mediatek.com>
References: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
 <1643283773-7081-4-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_210405_949455_16063025 
X-CRM114-Status: GOOD (  20.54  )
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

Hi, Xinlei:

On Thu, 2022-01-27 at 19:42 +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> The order of probe function for bridge drivers and dsi drivers is
> uncertain.
> To avoid the dsi probe cannot be executed, we place getting bridge
> node function in
> mtk_dsi_bind.

It seems this patch want to fix the same problem as [1]. Does [1] fix
your problem? If so, let's ignore this patch.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220127143623.123025-1-angelogioacchino.delregno@collabora.com/

Regards,
CK

> 
> Signed-off-by:Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 29 +++++++++++++++-------------
> -
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 62af60d..a390f26 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -991,6 +991,21 @@ static int mtk_dsi_bind(struct device *dev,
> struct device *master, void *data)
>  	int ret;
>  	struct drm_device *drm = data;
>  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +	struct drm_panel *panel;
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> +					  &panel, &dsi->next_bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		dsi->next_bridge = devm_drm_panel_bridge_add(dev,
> panel);
> +		if (IS_ERR(dsi->next_bridge)) {
> +			ret = PTR_ERR(dsi->next_bridge);
> +			dev_err(dev, "failed to add bridge: %d\n",
> ret);
> +			return ret;
> +		}
> +	}
>  
>  	ret = mtk_dsi_encoder_init(drm, dsi);
>  	if (ret)
> @@ -1016,7 +1031,6 @@ static int mtk_dsi_probe(struct platform_device
> *pdev)
>  {
>  	struct mtk_dsi *dsi;
>  	struct device *dev = &pdev->dev;
> -	struct drm_panel *panel;
>  	struct resource *regs;
>  	int irq_num;
>  	int ret;
> @@ -1033,19 +1047,6 @@ static int mtk_dsi_probe(struct
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
