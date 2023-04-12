Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DF2C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+o5ReY+oZ/UrMSbO9TjM2NPAwZL+TDT/jBB85AGbcgQ=; b=WNDM0bBQKpqllKsIsk3sRlzB8E
	fXZdUr6wH/N6+/OR/sSGeBn8gS8E2QeDOUcu2lTHkBDYlmBSNVeeOz+az8yKUA2hvYVy1EB0jeCwO
	OfXplpefzSLC1rTRKXFMnQvWdnvjh48vpxLkE0VEsyQuXjZaIxvUOi4FfbguTOedDATghGU+j03pQ
	rni1jYnoRC17BxxMX/lVAbVOSy7jio1lUP0ik0R3u47K7rbMjPGGHB1y6r8luw22+Bn73n/YTCSZV
	rOq7c4drfSJUTh6pqXsEcFJMqYdBwAtON5mqjYBqzXt1HUaKscdPNtNlxiYpzmqwCHRmoehBoSCj3
	RnoeY1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmbYX-003VJn-0W;
	Wed, 12 Apr 2023 14:34:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmbYS-003VGp-1Z;
	Wed, 12 Apr 2023 14:34:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E861562F9D;
	Wed, 12 Apr 2023 14:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C72C433EF;
	Wed, 12 Apr 2023 14:34:30 +0000 (UTC)
Message-ID: <4ae9a945-6cde-8083-432a-94b6b250d88c@xs4all.nl>
Date: Wed, 12 Apr 2023 16:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 11/14] media: mediatek: vcodec: Remove the setting for
 dma_mask
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 nfraprado@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, jianjiao.zeng@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 irui wang <irui.wang@mediatek.com>
References: <20230411093144.2690-1-yong.wu@mediatek.com>
 <20230411093144.2690-12-yong.wu@mediatek.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230411093144.2690-12-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_073436_606534_BC8C4A0F 
X-CRM114-Status: GOOD (  20.91  )
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

On 11/04/2023 11:31, Yong Wu wrote:
> In order to simplify the masters to set their respective dma masks, MTK
> IOMMU helps to centralize the processing. Because all the dma ranges is
> set in IOMMU, IOMMU knows well the dma mask requirements of masters. After
> this patch, the masters(codec here) code does not need care
> dma-ranges/dma_mask related information.
> 
> Cc: Tiffany Lin <tiffany.lin@mediatek.com>
> Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: irui wang <irui.wang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c   | 8 --------
>  .../media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c   | 3 ---
>  2 files changed, 11 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> index 174a6eec2f54..11583405cf61 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> @@ -321,14 +321,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL)) {
> -		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> -		if (ret) {
> -			mtk_v4l2_err("Failed to set mask");
> -			goto err_core_workq;
> -		}
> -	}
> -
>  	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>  		mutex_init(&dev->dec_mutex[i]);
>  	mutex_init(&dev->dev_mutex);
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> index 9095186d5495..50e5571608cd 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> @@ -344,9 +344,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		goto err_event_workq;
>  	}
>  
> -	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> -		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> -
>  	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		mtk_v4l2_err("Failed to register video device");


