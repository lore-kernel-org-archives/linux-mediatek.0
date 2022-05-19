Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNp9yKY/iW7Y348Q+qe2FeY1WBikCng27vJ7LHiIXWg=; b=aLl0HNGDEOcbbG
	z9dbl6FebQ45wwoEDspXJ4oeEZr1hk8mCpRjK+4gxnGTM8my4GeYu5TvjWE6vdE9jpO1IHiyjirS/
	EkxLEosREDFoMAnWMbgbf6t1z65qJ6abYWq2RagNB1euntF3AUMjvfoGWUDiPmm1rkBIi8MSx877T
	nmIfSY5jMZQxCXCtsOTow0gJZYvycZ/lxh3Old3/lNYtXZdjKxljJairmuDkIOAMg1b/KmEh8zd0T
	sOONlI9wpZW0rF81UtMbOSPQoGtPFeAn4OP4OXI4KIm7JijN3rLxUJ18/Vhv4ll5uQQESz8oUkTpR
	OQWn1N8dh+OuP/YuYimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrblE-005wCo-V7; Thu, 19 May 2022 08:43:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrbkz-005w5q-E6; Thu, 19 May 2022 08:43:42 +0000
X-UUID: 7d719ff44e6843398e5bb0afd17cecc1-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:b4b3656a-f7dc-4d87-ac22-d115910886a2, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:dc43d879-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 7d719ff44e6843398e5bb0afd17cecc1-20220519
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 7589712; Thu, 19 May 2022 01:43:34 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 01:43:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 16:43:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 16:43:30 +0800
Message-ID: <769fc1d52e2401b389f5611cb5d74d5e99ce9639.camel@mediatek.com>
Subject: Re: [V1,2/2] media: media: jpegenc: set bit mask for jpegenc
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: kyrie.wu <kyrie.wu@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
 <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Thu, 19 May 2022 16:43:30 +0800
In-Reply-To: <1652948174-7123-3-git-send-email-kyrie.wu@mediatek.com>
References: <1652948174-7123-1-git-send-email-kyrie.wu@mediatek.com>
 <1652948174-7123-3-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_014341_520897_1DA1BF87 
X-CRM114-Status: GOOD (  16.57  )
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

On Thu, 2022-05-19 at 16:16 +0800, kyrie.wu wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> set bit mask for jpeg encode
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index bc5b0a0168ec..87685a62a5c2 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1369,6 +1369,9 @@ static int mtk_jpeg_probe(struct
> platform_device *pdev)
>  	jpeg->vdev->device_caps = V4L2_CAP_STREAMING |
>  				  V4L2_CAP_VIDEO_M2M_MPLANE;
>  
> +	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> +		dma_set_mask_and_coherent(&pdev->dev,
> DMA_BIT_MASK(34));
> +
>  	ret = video_register_device(jpeg->vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		v4l2_err(&jpeg->v4l2_dev, "Failed to register video
> device\n");

Hello Kyrie,

if you want to add this property in dts, you need to add a new property
description to descript this.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
