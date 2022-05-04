Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17022C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJNmK0iEIkRq8Mwe0WROTnsKge2U1rYAQPFEOGSBz+0=; b=f9to+BvPG2wZbJ
	NR9YNeKYxzvMLdVO13Rvx2rOtzhHspbsce/+Fu69rYJm8NPTxw9d7z98fMx2GxkGfmJZMLofn1SOn
	Ec6xDd6ykUb1y0Q+T2bHK+lgN0wqCSVgyCwgj5s0nF5NEikO0l7yBZM8gn07ukNpWC29SMN4wpg7L
	ne0d3tSt0sPzM9jHC2ZLp8VVM7aBm9zS8RSO4lgnYuNLjDjoxUoRMJpkk2mGQKgCfZtvrl4GiGKPd
	tRoC4P+DlmoYkPZ+Qal5KLiKIyyNPdMN0eET6b8U9oTi5b7mIUQzHgCEPNwgpiBxVRXcR3adLayb8
	qzhTadghGvoDzqCReJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9lb-009KN9-7B; Wed, 04 May 2022 07:49:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9lR-009KH8-KO; Wed, 04 May 2022 07:49:39 +0000
X-UUID: 85cdbb15beb34ca1bd53f5607349d825-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:da799ac3-3f5b-42eb-8c5d-9c59f65b34fb, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:9f89a82f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 85cdbb15beb34ca1bd53f5607349d825-20220504
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 136985814; Wed, 04 May 2022 00:49:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 00:49:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 15:49:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 15:49:30 +0800
Message-ID: <41eb4b05c703d0377b7139ad0868cebea8f6fc47.camel@mediatek.com>
Subject: Re: [PATCH -next] drm: mediatek: mtk_dsi: Remove unnecessary print
 function dev_err()
From: CK Hu <ck.hu@mediatek.com>
To: Yang Li <yang.lee@linux.alibaba.com>, <matthias.bgg@gmail.com>
CC: <chunkuang.hu@kernel.org>, <airlied@linux.ie>, Abaci Robot
 <abaci@linux.alibaba.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 4 May 2022 15:49:30 +0800
In-Reply-To: <20220224012318.84935-1-yang.lee@linux.alibaba.com>
References: <20220224012318.84935-1-yang.lee@linux.alibaba.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_004937_761142_B3D288DD 
X-CRM114-Status: GOOD (  17.47  )
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

Hi, Yang:

On Thu, 2022-02-24 at 09:23 +0800, Yang Li wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
> 
> Eliminate the follow coccicheck warning:
> ./drivers/gpu/drm/mediatek/mtk_dsi.c:1092:2-9: line 1092 is redundant
> because platform_get_irq() already prints an error

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index bced4c7d668e..704252ee1198 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1089,7 +1089,6 @@ static int mtk_dsi_probe(struct platform_device
> *pdev)
>  
>  	irq_num = platform_get_irq(pdev, 0);
>  	if (irq_num < 0) {
> -		dev_err(&pdev->dev, "failed to get dsi irq_num: %d\n",
> irq_num);
>  		ret = irq_num;
>  		goto err_unregister_host;
>  	}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
