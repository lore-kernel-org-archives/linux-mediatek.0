Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 06:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hg17fcRTlXE66gFKm6czUuEhVt3ZQiQ7Qjw5c9ZeHIc=; b=Sy6lKGntTqginp
	QSaEXfucAQOlJNuaGj7NVLJOQg1gYtUIUE6/JRntGCbILJIp4bToXmLK97E4FjfAsBMHUg/yqnMCu
	TIIaSyb8I/UhUPYHD6H1+REiSAe8m2KAWNyxRMpd+i77DyiZNewuTe2uASRjBJuqBlg97nplSMKwI
	FY/Wc2tzKSPTEz89jaRArRQnGznFWDnUIU+sm1oxgv6wmRWCfJ09U4hxi5UIOh/5tZ/Iw6YGPPPh+
	mShEIWn5jQvc1rYZ8gRkIvGknRF0AoS2yw+3kewtde2gMdqhDZGpqPVz57Fb3x4XNTEIWC8Dtts1+
	2PfqViHNpwe/z2RFPDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np1tM-00AK2p-Gt; Thu, 12 May 2022 06:01:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np1tA-00AJz4-Us; Thu, 12 May 2022 06:01:30 +0000
X-UUID: 82a7229be2c44ada866733e0684c1428-20220511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YJEmSRrre3cFsZoTBO2J0tq3rmoNzL+aaV1W++9tFLY=; 
 b=SBFW5OPRleCnWo11p92ud8KctWkgKOHxv8XOvSYJ7esgnjKxRzaVfrSCvSv4BbUs/YEZtHxo2v2cB1EvKgVsZ+t96ZAyH5HeGYGtdsdCzYfuZOY1Tc96tVSv/bj7Tq8GNN/ZOgfmGpv6rrGvf2j6OBftt6aXpBg+DhFKnlu2enk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:80ea514a-fb4c-4b28-b94f-e765e1a0ede3, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:9,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:14
X-CID-META: VersionHash:faefae9, CLOUDID:d4245448-e22d-4f1a-9d3f-55c4a2b00ea4,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 82a7229be2c44ada866733e0684c1428-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 983197911; Wed, 11 May 2022 23:01:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 22:51:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 12 May 2022 13:51:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 13:51:11 +0800
Message-ID: <2ff41b86a7f7c7ce73cf800a7c1ecb531b835786.camel@mediatek.com>
Subject: Re: [PATCH] iommu/dma: Fix iova map result check bug
From: Yong Wu <yong.wu@mediatek.com>
To: <yf.wang@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Logan
 Gunthorpe" <logang@deltatee.com>, "open list:IOMMU DRIVERS"
 <iommu@lists.linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Ning Li
 <Ning.Li@mediatek.com>, <stable@vger.kernel.org>
Date: Thu, 12 May 2022 13:51:11 +0800
In-Reply-To: <20220507085204.16914-1-yf.wang@mediatek.com>
References: <20220507085204.16914-1-yf.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_230129_043283_BAFA039F 
X-CRM114-Status: GOOD (  26.19  )
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

On Sat, 2022-05-07 at 16:52 +0800, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> The data type of the return value of the iommu_map_sg_atomic
> is ssize_t, but the data type of iova size is size_t,
> e.g. one is int while the other is unsigned int.
> 
> When iommu_map_sg_atomic return value is compared with iova size,
> it will force the signed int to be converted to unsigned int, if
> iova map fails and iommu_map_sg_atomic return error code is less
> than 0, then (ret < iova_len) is false, which will to cause not
> do free iova, and the master can still successfully get the iova
> of map fail, which is not expected.
> 
> Therefore, we need to check the return value of iommu_map_sg_atomic
> in two cases according to whether it is less than 0.
> 
> Fixes: ad8f36e4b6b1 ("iommu: return full error code from
> iommu_map_sg[_atomic]()")
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> Cc: <stable@vger.kernel.org> # 5.15.*
> ---
>  drivers/iommu/dma-iommu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 09f6e1c0f9c0..2932281e93fc 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -776,6 +776,7 @@ static struct page
> **__iommu_dma_alloc_noncontiguous(struct device *dev,
>  	unsigned int count, min_size, alloc_sizes = domain-
> >pgsize_bitmap;
>  	struct page **pages;
>  	dma_addr_t iova;
> +	ssize_t ret;
>  
>  	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
>  	    iommu_deferred_attach(dev, domain))
> @@ -813,8 +814,8 @@ static struct page
> **__iommu_dma_alloc_noncontiguous(struct device *dev,
>  			arch_dma_prep_coherent(sg_page(sg), sg-
> >length);
>  	}
>  
> -	if (iommu_map_sg_atomic(domain, iova, sgt->sgl, sgt-
> >orig_nents, ioprot)
> -			< size)
> +	ret = iommu_map_sg_atomic(domain, iova, sgt->sgl, sgt-
> >orig_nents, ioprot);
> +	if (ret < 0 || ret < size)

        if (IS_ERR_VALUE(ret) || ret < size) for readable?

>  		goto out_free_sg;
>  
>  	sgt->sgl->dma_address = iova;
> @@ -1209,7 +1210,7 @@ static int iommu_dma_map_sg(struct device *dev,
> struct scatterlist *sg,
>  	 * implementation - it knows better than we do.
>  	 */
>  	ret = iommu_map_sg_atomic(domain, iova, sg, nents, prot);
> -	if (ret < iova_len)
> +	if (ret < 0 || ret < iova_len)
>  		goto out_free_iova;
>  
>  	return __finalise_sg(dev, sg, nents, iova);
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
