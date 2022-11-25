Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73901C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 22:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rja1eW5wCZnhqubaIIClqRCiUYLTCEdcEtknkp8dHw4=; b=lsJeImIZ0xH0vzfRl9J8khUBCF
	H/fBZAV2HhAIAq+HrMsiNr16JbtdeJ1bTPcPKg0Cy3wOiPphSFe8xmle8TYWzt/sKIN0QfznVqsZM
	WCCltjOlq74JwsrxhbCKv6+ioSKl7fJrqPXa8vTxut9/963QxQFGJH0zBtIxlmu5iW3e0NGKEKvRH
	pR9ZbA2xK7QTI14O5JOC2dASXlvr5xefofFWw6eu54YTqZ0/pu4qNwWb0jlopVD+pAMWVkgThU00E
	xcpWpycApyfTgAHiGU0tw9b6xBju/1UI2tKS/9kP9FLEM3yZ8Naf5xRhzzmXzWFSHniR/n2TdeoPi
	kca2Bk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyh7P-002Rmi-3W; Fri, 25 Nov 2022 22:24:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyh7D-002RhY-Hd; Fri, 25 Nov 2022 22:24:13 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 169BD6602B6F;
	Fri, 25 Nov 2022 22:24:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669415048;
	bh=n/JLhB9y1lHTrAqStH1aXYwPM6mB/oILrr8xuIpUxBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hL1D4Rz9csbBTpf1Zc8BME8cRYbNoiwVf+91duBmWBmSu3hj0B/x0mxj9IayaaEIF
	 ZuRYN0f0bP4uheKt2VXEj61N1VnnDAzSmNKXfudty00OIalGaLuSTbLN/Hkgt23QOQ
	 Lkd0dCcu5gqhI3S7O5m+O4ePoMFPq2dV4ybUNFRuVJIOLHiQUJ4NXJOrrGySa78inN
	 ke/aQ/9ywGMunB4khwu9lr2l6PyFcvejc9M2a5d+4t7xePZKCqbNez4bkA/zopnbVZ
	 eLjJySiDFw+mxFZW2jVoiFaXV8VW7/YY3jktdQ8LKTnULKmrPAMYL5tSmFXvTxp6+c
	 KxtGmHbs3kcZQ==
Date: Fri, 25 Nov 2022 17:24:02 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v28 6/7] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Message-ID: <20221125222402.u4qiolkqi2nsv7ae@notapiano>
References: <20221107072413.16178-1-nancy.lin@mediatek.com>
 <20221107072413.16178-7-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107072413.16178-7-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_142411_818392_39C7CB00 
X-CRM114-Status: GOOD (  23.05  )
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

On Mon, Nov 07, 2022 at 03:24:12PM +0800, Nancy.Lin wrote:
> Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> the component exists in the path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
[..]
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 30dcb65d8a5a..ce5617ad04cb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
[..]
> @@ -897,22 +906,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  		crtc_i++;
>  
>  	for (i = 0; i < path_len; i++) {
> -		enum mtk_ddp_comp_id comp_id = path[i];
> +		unsigned int comp_id = path[i];
>  		struct device_node *node;
> -		struct mtk_ddp_comp *comp;
>  
>  		node = priv->comp_node[comp_id];
> -		comp = &priv->ddp_comp[comp_id];
> -
> -		if (!node) {
> -			dev_info(dev,
> -				 "Not creating crtc %d because component %d is disabled or missing\n",
> -				 crtc_i, comp_id);
> -			return 0;
> -		}
>  
> -		if (!comp->dev) {
> -			dev_err(dev, "Component %pOF not initialized\n", node);
> +		/* Not all drm components have a DTS device node, such as ovl_adaptor,
> +		 * which is the drm bring up sub driver
> +		 */
> +		if (!node && comp_id != DDP_COMPONENT_DRM_OVL_ADAPTOR) {
> +			dev_err(dev,
> +				"Not creating crtc %d because component %d is disabled, missing or not initialized\n",
> +				crtc_i, comp_id);
>  			return -ENODEV;

Why do you change the behavior here? If !node, the return should be 0, because
there are two separate data streams, for internal and external display, and they
are optional. It should be possible to for example have the nodes for external
display disabled in DT and still have the driver probe and have a working
internal display. But with this change you're breaking that. Also, this message
should stay as dev_info and not mention "not initialized", so basically it
should stay the same as before the change.

Thanks,
Nícolas

