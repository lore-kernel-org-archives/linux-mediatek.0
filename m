Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAF7C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 05:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSrSiqxFVyFO+m78c7exA25bvjQQCbyzUczT3HYLyV4=; b=or6RFJbqfWnoNgQsD20TcnuuPd
	NyxmcZq6Z8K3kILhy43R8E4VcGpIpCzITMSVDsPAR2pXth6o0FHVXE7cxeOZ+zrCNezRL6+Rhby1e
	Lg1wrB5T2qAnjkxlu3Bk41ZzEy/CwfVN0d8aLNccU52ksYEYNlIBfR3gSqHtX9lwbWOKG+HbH9Mwv
	o7TXj50nY2S5+MvIg7emZDsmL+wMyvRx9PW5gJe/3REvstT9OtSKG4Gg5C61Qdj1+kuhfbC61lYL9
	uUsvCqFpkRc/KJ9o18pzpDNtwLcJ3VA/QXctVn1hkgjUgeKEtkPzlVhm8WEPTLuJ9e75f+B8vBOC5
	w4nbawcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24SL-005ZaY-S1; Fri, 17 Jun 2022 05:23:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24SI-005ZYs-3k; Fri, 17 Jun 2022 05:23:40 +0000
X-UUID: 9b8d61ddb33b42d6b7286184d29c5892-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:759f877c-8840-4023-8116-99e8a2b0641c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:2bf3da48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9b8d61ddb33b42d6b7286184d29c5892-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 871362573; Thu, 16 Jun 2022 22:23:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 22:23:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:23:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 13:23:21 +0800
Message-ID: <81d35568f1caf58f420704f504bf78b7182c9975.camel@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix crtc index computation
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 17 Jun 2022 13:23:21 +0800
In-Reply-To: <20220530142407.781187-1-fparent@baylibre.com>
References: <20220530142407.781187-1-fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_222338_207128_A5C5B626 
X-CRM114-Status: GOOD (  19.58  )
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

Hi, Fabien:

On Mon, 2022-05-30 at 16:24 +0200, Fabien Parent wrote:
> The code always assume that the main path is enabled, which is not
> always the case. When the main path is not enabled, the CRTC index
> of the ext path is incorrect which makes the secondary path
> not usable. Fix the CRTC index calculation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 46 +++++++++++++++--
> ----
>  1 file changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 5d7504a72b11..6f2abfc608fb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -430,25 +430,47 @@ int mtk_ddp_comp_get_id(struct device_node
> *node,
>  	return -EINVAL;
>  }
>  
> +static bool mtk_drm_comp_is_enabled(struct drm_device *drm,
> +				    const enum mtk_ddp_comp_id *path,
> +				    unsigned int path_len)
> +{
> +	struct mtk_drm_private *priv = drm->dev_private;
> +
> +	return path && path_len && !!priv->comp_node[path[path_len -
> 1]];

Why just check priv->comp_node[path[path_len - 1]]?
In mtk_drm_crtc_create(), crtc would not be created if any comp node in
the path is null.

Regards,
CK

> +}
> +
>  unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device
> *drm,
>  						struct device *dev)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> -	unsigned int ret = 0;
> +	unsigned int index = 0;
>  
> -	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
> private->data->main_len,
> +	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
> +				     private->data->main_len,
>  				     private->ddp_comp))
> -		ret = BIT(0);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> -					  private->data->ext_len,
> private->ddp_comp))
> -		ret = BIT(1);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data-
> >third_path,
> -					  private->data->third_len,
> private->ddp_comp))
> -		ret = BIT(2);
> -	else
> -		DRM_INFO("Failed to find comp in ddp table\n");
> +		return BIT(index);
> +
> +	if (mtk_drm_comp_is_enabled(drm, private->data->main_path,
> +				    private->data->main_len))
> +		index++;
>  
> -	return ret;
> +	if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> +				     private->data->ext_len,
> +				     private->ddp_comp))
> +		return BIT(index);
> +
> +	if (mtk_drm_comp_is_enabled(drm, private->data->ext_path,
> +				    private->data->ext_len))
> +		index++;
> +
> +	if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
> +					  private->data->third_len,
> +					  private->ddp_comp))
> +		return BIT(index);
> +
> +	DRM_INFO("Failed to find comp in ddp table\n");
> +
> +	return 0;
>  }
>  
>  int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp
> *comp,


