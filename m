Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2c1HhWtDIHsURC5mQ49E1uvCVDZP8Bpo/BagcTZukIw=; b=twcdJ/ChPvmhlvwh5noudko0Bd
	LMH26rUjx9vn3ojwbhNhyeHllWTufSBYGUFEwW7c//T0iyJhYoBgp80eMS3IVrqVnHq/zxv+qiWIg
	AFbF7jEJwJmnmm6G1jTWq/x+gOUmtPQMNUaVjnBBt8bIEOogvnsqSPjDli8INIoknkkuYV0ajOhQg
	gXRfTb+DP+5MKij8GdJcTGsGAxze9YWS7lDr+FSXMCWSzVm7vlTBo4w29vl5xr/FVdrxDwd1O1r9m
	MuqaUyafBi1F6RBOZGw6dIvr5Nc3hwkNLlOC5ZBrKlM853yFJXqJ5ldBisINtkK3pq8qHvkqo/Zab
	BDLEpefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3zkr-00AMXQ-4p; Wed, 22 Jun 2022 12:46:45 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889] helo=theia.8bytes.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3zkf-00AMV1-Bo; Wed, 22 Jun 2022 12:46:35 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 994612D0; Wed, 22 Jun 2022 14:46:26 +0200 (CEST)
Date: Wed, 22 Jun 2022 14:46:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: yf.wang@mediatek.com
Cc: Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Yong Wu <Yong.Wu@mediatek.com>, Ning Li <ning.li@mediatek.com>
Subject: Re: [PATCH] iommu/dma: Fix race condition during iova_domain
 initialization
Message-ID: <YrMPG4dIEnFkCbi9@8bytes.org>
References: <20220530120748.31733-1-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530120748.31733-1-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_054633_746599_C1FE7F1A 
X-CRM114-Status: GOOD (  23.28  )
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

Please re-send with

	Robin Murphy <robin.murphy@arm.com>

in Cc.

On Mon, May 30, 2022 at 08:07:45PM +0800, yf.wang@mediatek.com wrote:
> From: Yunfei Wang <yf.wang@mediatek.com>
> 
> When many devices share the same iova domain, iommu_dma_init_domain()
> may be called at the same time. The checking of iovad->start_pfn will
> all get false in iommu_dma_init_domain() and both enter init_iova_domain()
> to do iovad initialization.
> 
> Fix this by protecting init_iova_domain() with iommu_dma_cookie->mutex.
> 
> Exception backtrace:
> rb_insert_color(param1=0xFFFFFF80CD2BDB40, param3=1) + 64
> init_iova_domain() + 180
> iommu_setup_dma_ops() + 260
> arch_setup_dma_ops() + 132
> of_dma_configure_id() + 468
> platform_dma_configure() + 32
> really_probe() + 1168
> driver_probe_device() + 268
> __device_attach_driver() + 524
> __device_attach() + 524
> bus_probe_device() + 64
> deferred_probe_work_func() + 260
> process_one_work() + 580
> worker_thread() + 1076
> kthread() + 332
> ret_from_fork() + 16
> 
> Signed-off-by: Ning Li <ning.li@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> ---
>  drivers/iommu/dma-iommu.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 09f6e1c0f9c0..b38c5041eeab 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -63,6 +63,7 @@ struct iommu_dma_cookie {
>  
>  	/* Domain for flush queue callback; NULL if flush queue not in use */
>  	struct iommu_domain		*fq_domain;
> +	struct mutex			mutex;
>  };
>  
>  static DEFINE_STATIC_KEY_FALSE(iommu_deferred_attach_enabled);
> @@ -309,6 +310,7 @@ int iommu_get_dma_cookie(struct iommu_domain *domain)
>  	if (!domain->iova_cookie)
>  		return -ENOMEM;
>  
> +	mutex_init(&domain->iova_cookie->mutex);
>  	return 0;
>  }
>  
> @@ -549,26 +551,33 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>  	}
>  
>  	/* start_pfn is always nonzero for an already-initialised domain */
> +	mutex_lock(&cookie->mutex);
>  	if (iovad->start_pfn) {
>  		if (1UL << order != iovad->granule ||
>  		    base_pfn != iovad->start_pfn) {
>  			pr_warn("Incompatible range for DMA domain\n");
> -			return -EFAULT;
> +			ret = -EFAULT;
> +			goto done_unlock;
>  		}
>  
> -		return 0;
> +		ret = 0;
> +		goto done_unlock;
>  	}
>  
>  	init_iova_domain(iovad, 1UL << order, base_pfn);
>  	ret = iova_domain_init_rcaches(iovad);
>  	if (ret)
> -		return ret;
> +		goto done_unlock;
>  
>  	/* If the FQ fails we can simply fall back to strict mode */
>  	if (domain->type == IOMMU_DOMAIN_DMA_FQ && iommu_dma_init_fq(domain))
>  		domain->type = IOMMU_DOMAIN_DMA;
>  
> -	return iova_reserve_iommu_regions(dev, domain);
> +	ret = iova_reserve_iommu_regions(dev, domain);
> +
> +done_unlock:
> +	mutex_unlock(&cookie->mutex);
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.18.0

