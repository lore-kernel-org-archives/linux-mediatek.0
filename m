Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D225C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:56:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B070A20684
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B070A20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8LhH1fcLbrusLealGKrNzPe8LrSjkAO4qntt+n2gQZ0=; b=a3jKinQUHLb7ogg0g7g1NTuiN
	tMlX4ikAAGyw4AKtjb6Bm9oGNzVSOwuddsCD1scKkI8G7di1rEXHLB91muVtv6ZY8Mem5t5c1f9kF
	rnzxcq/EKIP/3BqXUpti4j+8f3ogIMMJSX+VAOcW8C/GptjxpcHwWUlyF2xgp1LMc75MGXJoTvG8N
	YElj3GfFLU57GsmfLh1SBtTzFRNCyCHkXrql1uD7yDBhNdY36ne7ufLDK5t6KsyWBBxoyGAn2HuNk
	7SS6ufbOT8OjZYzIs2Zz26TNuLWWKaSJKgAXLW9virNAklEAJ4UTIpkyX7oZZVbdV5SptEvWudOD5
	TN53QWMAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzwV-0001Qe-4z; Wed, 23 Dec 2020 08:56:23 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzwO-0001OQ-JD
 for linux-mediatek@lists.infradead.org; Wed, 23 Dec 2020 08:56:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id f9so9979148pfc.11
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Dec 2020 00:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6K+sLQbds6lT1EQKsvW+QH4EoaymFe0n2zEViQ0TTtE=;
 b=cVvERGAR9ZDjsCLfMz6MESVacPIuLG8icEg0rKSPWxT7+6NFoAASq2s3H/KmoVuUl4
 9f59HEeGpHfRj9NFe22Y+kqk8O+bpnzFwnzCkvgfvLgrlr6USEUjIHm3Tc8UerarnDSX
 fp5cTKX4HJLd7AWU7MtYsQS7UU4xel2Z1eh3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6K+sLQbds6lT1EQKsvW+QH4EoaymFe0n2zEViQ0TTtE=;
 b=hxnI5BvWt1gHUXMN2EUBFil/3FhiZR4zKCuTPRUudCy6fG+iTbQvBIGl7sS27cOExv
 YGn1Aalkx2HRk6jbxHoR2VkwWKkfFjYQSgS6HzfA45g2SE1EJNOFhvFaDy9lrho25usM
 u1SaOL40CPvSUpDmGUAwuZZMw9qL05PNjJRpdZmd45rb0ug2AIpCbmxMSfNrbzB3ZCqu
 96WInCBYK/HhXeuL8jWHfpeDGocdZ0av4PRxLyf8kkB2dwLx/u6eJYJvzh58zSJmfwyT
 sFRC0WIOgUs9wC+Qd5u2eEagklZC73cU4+p/zvJiPnlhQdny/QvWBfq+xezALiuvoPXA
 Uf1g==
X-Gm-Message-State: AOAM532/EVj03EHNBZoq3py2rRQcdaK0G57y3gWmmFAFVJxble3Ki8R0
 FLu++O1nX5L6QRykiBgLH78NsA==
X-Google-Smtp-Source: ABdhPJzQmPns0kBAA60ayRdmhDvciIE9lgEoYhfBVgerB6EDy1NMQs0Tx7MT1YRWXh23VK7AIUSXHQ==
X-Received: by 2002:a63:4c5d:: with SMTP id m29mr24117617pgl.368.1608713774304; 
 Wed, 23 Dec 2020 00:56:14 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
 by smtp.gmail.com with ESMTPSA id c10sm23942098pfj.54.2020.12.23.00.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 00:56:13 -0800 (PST)
Date: Wed, 23 Dec 2020 17:56:08 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 6/7] iommu/mediatek: Gather iova in iommu_unmap to
 achieve tlb sync once
Message-ID: <X+MGKBYKdmPNz7VL@chromium.org>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216103607.23050-7-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_035616_769145_110D7A8D 
X-CRM114-Status: GOOD (  26.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
 Greg Kroah-Hartman <gregkh@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 06:36:06PM +0800, Yong Wu wrote:
> In current iommu_unmap, this code is:
> 
> 	iommu_iotlb_gather_init(&iotlb_gather);
> 	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
> 	iommu_iotlb_sync(domain, &iotlb_gather);
> 
> We could gather the whole iova range in __iommu_unmap, and then do tlb
> synchronization in the iommu_iotlb_sync.
> 
> This patch implement this, Gather the range in mtk_iommu_unmap.
> then iommu_iotlb_sync call tlb synchronization for the gathered iova range.
> we don't call iommu_iotlb_gather_add_page since our tlb synchronization
> could be regardless of granule size.
> 
> In this way, gather->start is impossible ULONG_MAX, remove the checking.
> 
> This patch aims to do tlb synchronization *once* in the iommu_unmap.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index db7d43adb06b..89cec51405cd 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -506,7 +506,12 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
>  			      struct iommu_iotlb_gather *gather)
>  {
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> +	unsigned long long end = iova + size;
>  
> +	if (gather->start > iova)
> +		gather->start = iova;
> +	if (gather->end < end)
> +		gather->end = end;

I don't know how common the case is, but what happens if
gather->start...gather->end is a disjoint range from iova...end? E.g.

 | gather      | ..XXX... | iova |
 |             |          |      |
 gather->start |          iova   |
               gather->end       end

We would also end up invalidating the TLB for the XXX area, which could
affect the performance.

Also, why is the existing code in __arm_v7s_unmap() not enough? It seems
to call io_pgtable_tlb_add_page() already, so it should be batching the
flushes.

>  	return dom->iop->unmap(dom->iop, iova, size, gather);
>  }
>  
> @@ -523,9 +528,6 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>  	size_t length = gather->end - gather->start;
>  
> -	if (gather->start == ULONG_MAX)
> -		return;
> -
>  	mtk_iommu_tlb_flush_range_sync(gather->start, length, gather->pgsize,
>  				       dom->data);
>  }
> -- 
> 2.18.0
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
