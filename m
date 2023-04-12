Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BBFC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWS09ORcC4RjXnfe2YzVrMOW2iZk0HPLhsY78Tcjru4=; b=yplrzg/tYbCjen7t2rF3dBWuRH
	Ctj/CDroDh0Rx2AG6QsNuSO8hUesUwRKwIWHMmMJwR3EnUl88pVQ/usJcTxSeWvbQOATB2HVWrZ3g
	nbD82twexZuFmpV6Z4C8EU7BkZqdY+oN68YSj/aC0eTOlwACs3K/EKP8F8hRmNUAcb3i/jNq68YFf
	ThY3zNp/Jfg83NGsMKCO4RCVyHCHYWpt9lZ6uGIuFq7gzhO9ZmzzebRXlTYHwg8tUvMNqe5Hl22wy
	mPuQmOXk1Ucmr5FJKPRelsVy5lIl7qXa/b2NVCl4R/IP/eHlO3V4aCxwBwehDCMk+GcRBfZ90Bsk+
	22RDKCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmbZm-003VlJ-1O;
	Wed, 12 Apr 2023 14:35:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmbZf-003ViD-30;
	Wed, 12 Apr 2023 14:35:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75875635B9;
	Wed, 12 Apr 2023 14:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B94C433EF;
	Wed, 12 Apr 2023 14:35:46 +0000 (UTC)
Message-ID: <2c3105d4-2e60-e77a-df5d-e2a7e37c6f4a@xs4all.nl>
Date: Wed, 12 Apr 2023 16:35:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 00/14] Adjust the dma-ranges for MTK IOMMU
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
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230411093144.2690-1-yong.wu@mediatek.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230411093144.2690-1-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_073552_043783_320F7965 
X-CRM114-Status: GOOD (  24.74  )
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
> After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers"), the dma-ranges is not allowed for dts leaf node.
> but we still would like to separate the different masters into
> different iova regions. Thus we adjust the internal flow, separate
> the 16GB iova range by the master HW larbid/portid and add the
> dma-ranges property in the parent "soc" node. This also could avoid
> the users forget/abuse the iova regions.
> 
> The commit f1ad5338a4d5 did affect the mt8195 venc, But it is not
> a fatal issue, it could also work well at 0-4GB iova. thus I don't
> add "Fixes:" tag.
> 
> In this series, I add functions for mt8192/mt8195/mt8186, mt8188 will
> be in its special patchset. and the previous mt8173/mt8183...support
> 0-4GB only, no need this function.

I've Acked patches 10 and 11 as well. I assume this series will be merged
through the iommu subsystem? If not, and I need to take the media patches,
then please let me know!

Regards,

	Hans

> 
> Change note:
> v7: Remove the change about mediatek,vcodec-subdev-decoder.yaml since
>     this was merged at:
>     https://lore.kernel.org/all/98c48690-631d-1086-9b7c-004c61cc8dbb@xs4all.nl/
> 
> v6: https://lore.kernel.org/linux-mediatek/20230403091337.26745-1-yong.wu@mediatek.com/
>    Add three patches for set dma-mask for iommu master devices.
> 
> v5: Nothing change. Just rebase on v6.3-rc1.
> 
> v4: https://lore.kernel.org/linux-mediatek/20230215062544.8677-1-yong.wu@mediatek.com/
>     Improve the comment in the code from AngeloGioacchino.
> 
> v3: https://lore.kernel.org/linux-mediatek/20230214031114.926-1-yong.wu@mediatek.com/
>    Add a new patch only for comment more in the code.
> 
> v2: https://lore.kernel.org/linux-mediatek/20230208053643.28249-1-yong.wu@mediatek.com/
>    a) Base on next-20230206 since mt8195 jpeg node is applied which affect
>       this patch.
>    b) Reword the commit message [1/10][2/10] to explain effect.
> 
> v1: https://lore.kernel.org/linux-mediatek/20230113060133.9394-1-yong.wu@mediatek.com/
>    Base on v6.2-rc3.
> 
> Yong Wu (14):
>   dt-bindings: media: mediatek,vcodec: Remove dma-ranges property
>   dt-bindings: media: mediatek,jpeg: Remove dma-ranges property
>   iommu/mediatek: Improve comment for the current region/bank
>   iommu/mediatek: Get regionid from larb/port id
>   iommu/mediatek: mt8192: Add iova_region_larb_msk
>   iommu/mediatek: mt8195: Add iova_region_larb_msk
>   iommu/mediatek: mt8186: Add iova_region_larb_msk
>   iommu/mediatek: Add a gap for the iova regions
>   iommu/mediatek: Set dma_mask for the master devices
>   media: mtk-jpegdec: Remove the setting for dma_mask
>   media: mediatek: vcodec: Remove the setting for dma_mask
>   arm64: dts: mt8195: Remove the unnecessary dma-ranges
>   arm64: dts: mt8195: Add dma-ranges for the parent "soc" node
>   arm64: dts: mt8186: Add dma-ranges for the parent "soc" node
> 
>  .../media/mediatek,mt8195-jpegdec.yaml        |   7 -
>  .../media/mediatek,mt8195-jpegenc.yaml        |   7 -
>  .../media/mediatek,vcodec-decoder.yaml        |   5 -
>  .../media/mediatek,vcodec-encoder.yaml        |   5 -
>  .../bindings/media/mediatek-jpeg-encoder.yaml |   5 -
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi      |   1 +
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   4 +-
>  drivers/iommu/mtk_iommu.c                     | 145 ++++++++++++++----
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    |   3 -
>  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   8 -
>  .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |   3 -
>  11 files changed, 117 insertions(+), 76 deletions(-)
> 


