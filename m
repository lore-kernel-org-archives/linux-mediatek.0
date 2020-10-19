Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95037C43457
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11BCC22257
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u9mVkv8k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jb2iflGA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11BCC22257
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j0zIOuri7C+Ui7T+3yl8JqNAsV3ds+M5kFKsqhqeFkw=; b=u9mVkv8k5iKgH345sDvROYpNR
	vg5Es/i/ckkMnPVR86+sXh2t9EKYpqkq3Uyg4x8twec1t6wIMtsaeJUaepqVL6sDi0Isi6z/o6cLg
	ijpmAduahmF4chV3aCsBBCFXq9NbniIJhI10uu0jrXhv+isfZJpgOn2598bnwAZ3Rmy5lzVpPK2Dt
	ZFkFZX7r5IRSy4JASuKYJ7Q2nFoHTTHsp90IQWCSKQ6VMQDbTDk5mk0xXt54M41m07hMdxBZTlfOH
	Ud7NpWWOMK6yvz59aG1hVJ/QCHN/gQAvB7BK3s3my7HeFlY7yCvPC8ZLTN/3SOux8AiZuaeFCbfOs
	VrI4Zmm5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUTUf-00056m-Q3; Mon, 19 Oct 2020 11:38:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUTUC-0004vT-8q; Mon, 19 Oct 2020 11:37:59 +0000
X-UUID: 86ea1227b75b49a3a519098d919dfe49-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oEzAIyyKOrLuaYK1wIzE5YkCFMQ6bLo9DbyNA4jwhMU=; 
 b=jb2iflGAEjBWVPsC/qEz3cAAq2AN77aYyB5hUIuvfGGHbuVmHakB4inGgEcQK6DuIQbbk5yceGsdrxHuXlrxMmO41cThz+okK7igoeXIcYCajit7wUA8SC74wgiHVZeNBmGbmW4TPacIqJr8oxyBDoaNo3QLTTEpQf1fxiT4jxA=;
X-UUID: 86ea1227b75b49a3a519098d919dfe49-20201019
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1086324713; Mon, 19 Oct 2020 03:37:47 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 04:37:45 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:37:30 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Oct 2020 19:37:30 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/4] iommu: Introduce iotlb_sync_range callback
Date: Mon, 19 Oct 2020 19:30:57 +0800
Message-ID: <20201019113100.23661-2-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201019113100.23661-1-chao.hao@mediatek.com>
References: <20201019113100.23661-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_073756_497417_FA80D050 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: Jun Wen <jun.wen@mediatek.com>, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mingyuan Ma <mingyuan.ma@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add iotlb_sync_range callback to support that driver can appoint iova
and size to do tlb sync.
Iommu will call iotlb_sync_range() after the whole mapping/unmapping
is completed, and the iova and size of iotlb_sync_range() are start_iova
and buffer total_size respectively. At the same time, iotlb_sync() and
tlb_flush_walk/leaf() can be skipped. So iotlb_sync_range() will enhance
performance by reducing the time of tlb sync.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/dma-iommu.c | 9 +++++++++
 drivers/iommu/iommu.c     | 7 +++++++
 include/linux/iommu.h     | 2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 4959f5df21bd..e2e9114c4ae2 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -479,6 +479,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		size_t size, int prot, u64 dma_mask)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	const struct iommu_ops *ops = domain->ops;
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_off = iova_offset(iovad, phys);
@@ -497,6 +498,10 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		iommu_dma_free_iova(cookie, iova, size);
 		return DMA_MAPPING_ERROR;
 	}
+
+	if (ops->iotlb_sync_range)
+		ops->iotlb_sync_range(iova, size);
+
 	return iova + iova_off;
 }
 
@@ -1165,6 +1170,7 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 size)
 static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 		phys_addr_t msi_addr, struct iommu_domain *domain)
 {
+	const struct iommu_ops *ops = domain->ops;
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iommu_dma_msi_page *msi_page;
 	dma_addr_t iova;
@@ -1187,6 +1193,9 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	if (iommu_map(domain, iova, msi_addr, size, prot))
 		goto out_free_iova;
 
+	if (ops->iotlb_sync_range)
+		ops->iotlb_sync_range(iova, size);
+
 	INIT_LIST_HEAD(&msi_page->list);
 	msi_page->phys = msi_addr;
 	msi_page->iova = iova;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 609bd25bf154..e399a238d1e9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2304,6 +2304,9 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 		unmapped += unmapped_page;
 	}
 
+	if (ops->iotlb_sync_range)
+		ops->iotlb_sync_range(iova, size);
+
 	trace_unmap(orig_iova, size, unmapped);
 	return unmapped;
 }
@@ -2334,6 +2337,7 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			     struct scatterlist *sg, unsigned int nents, int prot,
 			     gfp_t gfp)
 {
+	const struct iommu_ops *ops = domain->ops;
 	size_t len = 0, mapped = 0;
 	phys_addr_t start;
 	unsigned int i = 0;
@@ -2364,6 +2368,9 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			sg = sg_next(sg);
 	}
 
+	if (ops->iotlb_sync_range)
+		ops->iotlb_sync_range(iova, mapped);
+
 	return mapped;
 
 out_err:
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index fee209efb756..4be90324bd23 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -192,6 +192,7 @@ struct iommu_iotlb_gather {
  * @map: map a physically contiguous memory region to an iommu domain
  * @unmap: unmap a physically contiguous memory region from an iommu domain
  * @flush_iotlb_all: Synchronously flush all hardware TLBs for this domain
+ * @iotlb_sync_range: Sync specific iova and size mappings to the hardware
  * @iotlb_sync_map: Sync mappings created recently using @map to the hardware
  * @iotlb_sync: Flush all queued ranges from the hardware TLBs and empty flush
  *            queue
@@ -244,6 +245,7 @@ struct iommu_ops {
 	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
 		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
 	void (*flush_iotlb_all)(struct iommu_domain *domain);
+	void (*iotlb_sync_range)(unsigned long iova, size_t size);
 	void (*iotlb_sync_map)(struct iommu_domain *domain);
 	void (*iotlb_sync)(struct iommu_domain *domain,
 			   struct iommu_iotlb_gather *iotlb_gather);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
