Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D797C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S18Saq6VatiiEpHtAVt6MI2FWJWANirRMZOf4ey7IR4=; b=zfZ8L62kGYS3Lm
	w5XvczaQ0eYFFiMz4kRve1b2Du7+T1c+WxpNlKrYcq6cyO5Uc2b2QsRgieoi4DBXkwHw1Za7mmhD8
	dZSrhrrxNFDFjBMBvJE64s2ppNd++O9/UG+tY0pa5+qA20J7ojPtfJvdvvG10HloZYXcjHZEGXi2R
	3oaBMmprFl3Gvccc44RKsQbYZtezikCDHvhfQ/MI/xjiAx0TvAtMPEoypd5rqlSNBN++3opqRO9gf
	QEeRAwuTdybUk5epwJGjxVYUcItOy4wLkdCbphSRNaOK/HZweanbUfFF6Izr89IORApWKuHKuYYXs
	oNNoqvBCMXZXNg+1XXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLaG-002yK8-Ns; Thu, 09 Jun 2022 17:04:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLa5-002yGK-6H; Thu, 09 Jun 2022 17:04:26 +0000
X-UUID: 31a91b88713740eb8f7de52007d894f2-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:7a589591-43a6-495a-9f82-8410d185c16e,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:d2aa48e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 31a91b88713740eb8f7de52007d894f2-20220609
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2126769035; Thu, 09 Jun 2022 10:04:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 10:04:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 10 Jun 2022 01:04:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 01:04:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <yf.wang@mediatek.com>
CC: <Libo.Kang@mediatek.com>, <Yong.Wu@mediatek.com>,
	<iommu@lists.linux-foundation.org>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<miles.chen@mediatek.com>, <ning.li@mediatek.com>, <will@kernel.org>,
	<wsd_upstream@mediatek.com>
Subject: Re: [PATCH] iommu/dma: Fix race condition during iova_domain initialization
Date: Fri, 10 Jun 2022 01:04:12 +0800
Message-ID: <20220609170412.30690-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220530120748.31733-1-yf.wang@mediatek.com>
References: <20220530120748.31733-1-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_100425_278545_38877162 
X-CRM114-Status: GOOD (  16.12  )
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

Hi YF,

>When many devices share the same iova domain, iommu_dma_init_domain()
>may be called at the same time. The checking of iovad->start_pfn will
>all get false in iommu_dma_init_domain() and both enter init_iova_domain()
>to do iovad initialization.

After reading this patch.
It means that we use iovad->start_pfn as a key to tell if an iovad is already initialized,
but we do not protect iovad->start_pfn from concurrent access.

So what's happening is like:

   cpu0                                    cpu1
of_dma_configure_id()              of_dma_configure_id()
  arch_setup_dma_ops()               arch_setup_dma_ops()
    iommu_setup_dma_ops()              iommu_setup_dma_ops()
      init_iova_domain()	 	 init_iova_domain()
         if (iovad->start_pfn) {           if (iovad->start_pfn) {
         }                                 }
         init_iova_domain()                init_iova_domain()


init_iova_domain() is called at the same time.

>Fix this by protecting init_iova_domain() with iommu_dma_cookie->mutex.

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

>Exception backtrace:
>rb_insert_color(param1=0xFFFFFF80CD2BDB40, param3=1) + 64
>init_iova_domain() + 180
>iommu_setup_dma_ops() + 260
>arch_setup_dma_ops() + 132
>of_dma_configure_id() + 468
>platform_dma_configure() + 32
>really_probe() + 1168
>driver_probe_device() + 268
>__device_attach_driver() + 524
>__device_attach() + 524
>bus_probe_device() + 64
>deferred_probe_work_func() + 260
>process_one_work() + 580
>worker_thread() + 1076
>kthread() + 332
>ret_from_fork() + 16
>
>Signed-off-by: Ning Li <ning.li@mediatek.com>
>Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
>---
> drivers/iommu/dma-iommu.c | 17 +++++++++++++----
> 1 file changed, 13 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
>index 09f6e1c0f9c0..b38c5041eeab 100644
>--- a/drivers/iommu/dma-iommu.c
>+++ b/drivers/iommu/dma-iommu.c
>@@ -63,6 +63,7 @@ struct iommu_dma_cookie {
> 
> 	/* Domain for flush queue callback; NULL if flush queue not in use */
> 	struct iommu_domain		*fq_domain;
>+	struct mutex			mutex;
> };
> 
> static DEFINE_STATIC_KEY_FALSE(iommu_deferred_attach_enabled);
>@@ -309,6 +310,7 @@ int iommu_get_dma_cookie(struct iommu_domain *domain)
> 	if (!domain->iova_cookie)
> 		return -ENOMEM;
> 
>+	mutex_init(&domain->iova_cookie->mutex);
> 	return 0;
> }
> 
>@@ -549,26 +551,33 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
> 	}
> 
> 	/* start_pfn is always nonzero for an already-initialised domain */
>+	mutex_lock(&cookie->mutex);
>
> 	if (iovad->start_pfn) {
> 		if (1UL << order != iovad->granule ||
> 		    base_pfn != iovad->start_pfn) {
> 			pr_warn("Incompatible range for DMA domain\n");
>-			return -EFAULT;
>+			ret = -EFAULT;
>+			goto done_unlock;
> 		}
> 
>-		return 0;
>+		ret = 0;
>+		goto done_unlock;
> 	}
> 
> 	init_iova_domain(iovad, 1UL << order, base_pfn);
> 	ret = iova_domain_init_rcaches(iovad);
> 	if (ret)
>-		return ret;
>+		goto done_unlock;
> 
> 	/* If the FQ fails we can simply fall back to strict mode */
> 	if (domain->type == IOMMU_DOMAIN_DMA_FQ && iommu_dma_init_fq(domain))
> 		domain->type = IOMMU_DOMAIN_DMA;
> 
>-	return iova_reserve_iommu_regions(dev, domain);
>+	ret = iova_reserve_iommu_regions(dev, domain);
>+
>+done_unlock:
>+	mutex_unlock(&cookie->mutex);
>+	return ret;
> }
> 
> /**
>-- 
>2.18.0
>
>
>_______________________________________________
>Linux-mediatek mailing list
>Linux-mediatek@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
