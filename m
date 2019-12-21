Return-Path: <SRS0=6qD2=2L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10477C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Dec 2019 15:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D262070C
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Dec 2019 15:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V2HEJs3N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tcd-ie.20150623.gappssmtp.com header.i=@tcd-ie.20150623.gappssmtp.com header.b="CTktPvnN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9D262070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tcd.ie
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S465UCoZQqURBMufVEYu5V/pa5U9w1OE47ULk+hCuf4=; b=V2HEJs3NeZo7KX
	qtVHbUgJoF5Mq/Do1IIPRLbitY+tYMzBuFp/plc39g2UcdwKatcCnZQlQO0tXORBiDt0MWGGf2bQ0
	yaz0WzT4QZnPvhdBsYvLedbR8/X1J05WvlC6V8vqsWQyPfktZKmWdjKgN/AVu8GIMs1FMOd/6jb+E
	+F1876sr9ieCSkNo2kEe+79iNUlb7dPCBAsnKH83CWxIerqjfDXswnlC2q3LvMkOjMYxb2OPD9wo+
	tVug19jO8wnj1wRl7J1gNsfGXGcJB//MmE6/bDcE+uRng66GN00QL1jmpOnIyoLrUQRafKiNtpJvP
	HkleMlLQUrbsA73V2inw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iigKI-0001a4-EY; Sat, 21 Dec 2019 15:05:54 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iigIt-0007d2-Ln
 for linux-mediatek@lists.infradead.org; Sat, 21 Dec 2019 15:04:29 +0000
Received: by mail-ed1-x542.google.com with SMTP id dc19so11377648edb.10
 for <linux-mediatek@lists.infradead.org>; Sat, 21 Dec 2019 07:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g9kFTz+OIjtd02sboEb/xPH2umLLduJGHZnkezx3k0U=;
 b=CTktPvnNq1jyejKuw4FPmsDHJqlMqnIK+LqTDjsTZ1ZsJVdD5K3EVXU9H9QfhP1vZi
 Dr+qg3qIXY699xoJ8F0TOCouYc1BBGbU43hDF2kmAYXm04HO5vI0AZGZAi2jkV0r6EFN
 Uqqu8MF/N0nkVC19U2nfYFQHC/XM6Mw8TaFgZUgu9czVrLEwvawDZRjnsTBB+/yigVh0
 MNGrdrt/6eys15k3D6741eDIFVQEakAIF0yLafdCTI/WakOrjNrokbN5gIZLsHdv6rvT
 JHYoqwNQsVMDBB0wYNztnmjEhP8hzVgepORwDvLZVBZd6aM2+hZeuyiCzwGgtYXJJ1Dy
 5Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g9kFTz+OIjtd02sboEb/xPH2umLLduJGHZnkezx3k0U=;
 b=Zp0ZrYtSWegTUJKHEujSn5QZuFXjq0VkeVto1tHeGlStLkT1bF6/jKrVvplAkITn4/
 hvfAfk7Yz427JW795AM6LtlLLbwoAUrYTVSl3bFyEeWLudWNJOp4JXlJMxY2YwdsA6Cx
 5dXBgZJWh0md0nrOWyUyCm/S5oKsHrfLRbnuWmqv8GkWc3GLm2p/n9F9L4VBJbKNWu3+
 9MZJlPNfgjet0AnV8sKZtMfGKldj4j39OwV0b7eNxhsyTizg931mmFTSgJCrbX5oJh99
 R1YpNFSretaGJlQF0NWQhxhoc67jrQo4tAZxwc+lAgcjjdvMfTBF5hEmwl7LfLHusOgV
 rpoQ==
X-Gm-Message-State: APjAAAVDMmsWz7mhRL0jdyoZrFmY+aDy+XXwj81S4W6bBOhe5VqV1DhY
 ijdp2Z5VP+9swTWjSguKbo/KAQ==
X-Google-Smtp-Source: APXvYqz53m9hdZ0HCFwnxdnPVWgrcBCgGDP73tz51CWh/bfe9HlHp6dFxdkAOOP0s/SRLuvh29w7og==
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr22057226edf.75.1576940666211; 
 Sat, 21 Dec 2019 07:04:26 -0800 (PST)
Received: from localhost.localdomain ([80.233.37.20])
 by smtp.googlemail.com with ESMTPSA id u13sm1517639ejz.69.2019.12.21.07.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 07:04:25 -0800 (PST)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 2/8] iommu/vt-d: Use default dma_direct_* mapping functions
 for direct mapped devices
Date: Sat, 21 Dec 2019 15:03:54 +0000
Message-Id: <20191221150402.13868-3-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191221_070427_812933_27F7681E 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We should only assign intel_dma_ops to devices which will actually use
the iommu and let the default fall back dma_direct_* functions handle
all other devices. This won't change any behaviour but will just use the
generic implementations for direct mapped devices rather than intel
specific ones.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/intel-iommu.c | 52 +++++--------------------------------
 1 file changed, 6 insertions(+), 46 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index c1ea66467918..64b1a9793daa 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2794,17 +2794,6 @@ static int __init si_domain_init(int hw)
 	return 0;
 }
 
-static int identity_mapping(struct device *dev)
-{
-	struct device_domain_info *info;
-
-	info = dev->archdata.iommu;
-	if (info && info != DUMMY_DEVICE_DOMAIN_INFO && info != DEFER_DEVICE_DOMAIN_INFO)
-		return (info->domain == si_domain);
-
-	return 0;
-}
-
 static int domain_add_dev_info(struct dmar_domain *domain, struct device *dev)
 {
 	struct dmar_domain *ndomain;
@@ -3461,12 +3450,6 @@ static struct dmar_domain *get_private_domain_for_dev(struct device *dev)
 	return domain;
 }
 
-/* Check if the dev needs to go through non-identity map and unmap process.*/
-static bool iommu_no_mapping(struct device *dev)
-{
-	return iommu_dummy(dev) || identity_mapping(dev);
-}
-
 static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
 				     size_t size, int dir, u64 dma_mask)
 {
@@ -3531,9 +3514,6 @@ static dma_addr_t intel_map_page(struct device *dev, struct page *page,
 				 enum dma_data_direction dir,
 				 unsigned long attrs)
 {
-	if (iommu_no_mapping(dev))
-		return dma_direct_map_page(dev, page, offset, size, dir, attrs);
-
 	return __intel_map_single(dev, page_to_phys(page) + offset, size, dir,
 			*dev->dma_mask);
 }
@@ -3542,10 +3522,6 @@ static dma_addr_t intel_map_resource(struct device *dev, phys_addr_t phys_addr,
 				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
-	if (iommu_no_mapping(dev))
-		return dma_direct_map_resource(dev, phys_addr, size, dir,
-				attrs);
-
 	return __intel_map_single(dev, phys_addr, size, dir, *dev->dma_mask);
 }
 
@@ -3597,17 +3573,13 @@ static void intel_unmap_page(struct device *dev, dma_addr_t dev_addr,
 			     size_t size, enum dma_data_direction dir,
 			     unsigned long attrs)
 {
-	if (iommu_no_mapping(dev))
-		dma_direct_unmap_page(dev, dev_addr, size, dir, attrs);
-	else
-		intel_unmap(dev, dev_addr, size);
+	intel_unmap(dev, dev_addr, size);
 }
 
 static void intel_unmap_resource(struct device *dev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	if (!iommu_no_mapping(dev))
-		intel_unmap(dev, dev_addr, size);
+	intel_unmap(dev, dev_addr, size);
 }
 
 static void *intel_alloc_coherent(struct device *dev, size_t size,
@@ -3617,9 +3589,6 @@ static void *intel_alloc_coherent(struct device *dev, size_t size,
 	struct page *page = NULL;
 	int order;
 
-	if (iommu_no_mapping(dev))
-		return dma_direct_alloc(dev, size, dma_handle, flags, attrs);
-
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
 
@@ -3653,9 +3622,6 @@ static void intel_free_coherent(struct device *dev, size_t size, void *vaddr,
 	int order;
 	struct page *page = virt_to_page(vaddr);
 
-	if (iommu_no_mapping(dev))
-		return dma_direct_free(dev, size, vaddr, dma_handle, attrs);
-
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
 
@@ -3673,9 +3639,6 @@ static void intel_unmap_sg(struct device *dev, struct scatterlist *sglist,
 	struct scatterlist *sg;
 	int i;
 
-	if (iommu_no_mapping(dev))
-		return dma_direct_unmap_sg(dev, sglist, nelems, dir, attrs);
-
 	for_each_sg(sglist, sg, nelems, i) {
 		nrpages += aligned_nrpages(sg_dma_address(sg), sg_dma_len(sg));
 	}
@@ -3699,8 +3662,6 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 	struct intel_iommu *iommu;
 
 	BUG_ON(dir == DMA_NONE);
-	if (iommu_no_mapping(dev))
-		return dma_direct_map_sg(dev, sglist, nelems, dir, attrs);
 
 	domain = deferred_attach_domain(dev);
 	if (!domain)
@@ -3747,8 +3708,6 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 
 static u64 intel_get_required_mask(struct device *dev)
 {
-	if (iommu_no_mapping(dev))
-		return dma_direct_get_required_mask(dev);
 	return DMA_BIT_MASK(32);
 }
 
@@ -5014,7 +4973,6 @@ int __init intel_iommu_init(void)
 	if (!has_untrusted_dev() || intel_no_bounce)
 		swiotlb = 0;
 #endif
-	dma_ops = &intel_dma_ops;
 
 	init_iommu_pm_ops();
 
@@ -5623,6 +5581,8 @@ static int intel_iommu_add_device(struct device *dev)
 				dev_info(dev,
 					 "Device uses a private identity domain.\n");
 			}
+		} else {
+			dev->dma_ops = &intel_dma_ops;
 		}
 	} else {
 		if (device_def_domain_type(dev) == IOMMU_DOMAIN_DMA) {
@@ -5639,6 +5599,7 @@ static int intel_iommu_add_device(struct device *dev)
 				dev_info(dev,
 					 "Device uses a private dma domain.\n");
 			}
+			dev->dma_ops = &intel_dma_ops;
 		}
 	}
 
@@ -5665,8 +5626,7 @@ static void intel_iommu_remove_device(struct device *dev)
 
 	iommu_device_unlink(&iommu->iommu, dev);
 
-	if (device_needs_bounce(dev))
-		set_dma_ops(dev, NULL);
+	set_dma_ops(dev, NULL);
 }
 
 static void intel_iommu_get_resv_regions(struct device *device,
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
