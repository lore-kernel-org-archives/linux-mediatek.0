Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF4AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMihZZ+pFSaXTnQZDYAwSglCV7xDJr9yc5LKbLRiOjw=; b=T/zgL2H0mKLauNRUyQDv0xPCY7
	lR9vJsUiKZUt8xjy4Rm/oWnwLEc8It+c0IHd9y3hW0oj6x9l7dPI3A349IxyLXsiSl2rd/59s+beY
	eW185DOC8Ng5zJOGz2IlAF5CAqDDcpwBVk4merX4vVmUDu6Jxk5p6dHvja9NmdCkHzpIf99+HXFy1
	3ie+aQD4jDauFwWl74CFKVwauAdQd/HQE5Xq2D6yu3ftrKHoDF+XUTSj6WpuNc5lcDQRY7w1U8BY7
	ebOusLQU1XsufsAaxuGjKDberGTxKXtJs3jNi+vZryI3HuyFfyFTS9NYMNUhWPNeksdTdFoS2GgkL
	Sdp8wj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmbYH-003VCe-39;
	Wed, 12 Apr 2023 14:34:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmbYD-003V9s-0C;
	Wed, 12 Apr 2023 14:34:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E74E6358D;
	Wed, 12 Apr 2023 14:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D9DC433EF;
	Wed, 12 Apr 2023 14:34:15 +0000 (UTC)
Message-ID: <f74031f0-3c88-e3b4-0fa1-b406aacb11fd@xs4all.nl>
Date: Wed, 12 Apr 2023 16:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 10/14] media: mtk-jpegdec: Remove the setting for
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
 Bin Liu <bin.liu@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
References: <20230411093144.2690-1-yong.wu@mediatek.com>
 <20230411093144.2690-11-yong.wu@mediatek.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230411093144.2690-11-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_073421_139303_19834FF2 
X-CRM114-Status: GOOD (  18.72  )
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
> this patch, the masters code does not need care
> dma-ranges/dma_mask related information.
> 
> Cc: Bin Liu <bin.liu@mediatek.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 969516a940ba..9b96d2436311 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1757,9 +1757,6 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	jpeg->vdev->device_caps = V4L2_CAP_STREAMING |
>  				  V4L2_CAP_VIDEO_M2M_MPLANE;
>  
> -	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> -		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> -
>  	ret = video_register_device(jpeg->vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");


