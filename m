Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E66C5472C
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Aug 2024 03:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9jVhl7oJxULjz2/rXwXfEOWQLpDc7NeMcx1BhhLUUk=; b=Xdb74dTnBuyJcXzyTTTzV4JdC2
	1qvv3k2uAUkfNPcA045YXjp29wfb2pdcy8KMC1ZfY8EAC//T5DMeoeyRK0Lmazc4kzx+8wT7yu36e
	dyrvAnQK0RoAeDVZW5tSFQgqYRuuBwB/X2hUs0m4rsXXhyO0Er5n488+Px+595ghqfjBvbII5rVAD
	kACvUutsfXvynTUt00SY2VR6yAORFTq7Zg5DuSuvajs+VD1cxhz0sEODqsX7/VUvvFIZz+PS0UEcf
	Lyax/aQ09XuiTwOZoIG5L6RSgEUQgWyqxVyQQrPNlwdaD5KLbD1VmwTt/4T3bOZOjoML9MvGWwi9P
	vsUlAm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhob-00000001Nce-1LrJ;
	Sat, 24 Aug 2024 03:51:49 +0000
Received: from 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhmP-00000001N0f-2L3A;
	Sat, 24 Aug 2024 03:49:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 2/4] dma-mapping: don't return errors from dma_set_min_align_mask
Date: Sat, 24 Aug 2024 05:49:13 +0200
Message-ID: <20240824034925.1163244-3-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240824034925.1163244-1-hch@lst.de>
References: <20240824034925.1163244-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

A NULL dev->dma_parms indicates either a bus that is not DMA capable or
grave bug in the implementation of the bus code.

There isn't much the driver can do in terms of error handling for either
case, so just warn and continue as DMA operations will fail anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 include/linux/dma-mapping.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index f693aafe221f2c..cfd6bafec3f944 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -575,13 +575,12 @@ static inline unsigned int dma_get_min_align_mask(struct device *dev)
 	return 0;
 }
 
-static inline int dma_set_min_align_mask(struct device *dev,
+static inline void dma_set_min_align_mask(struct device *dev,
 		unsigned int min_align_mask)
 {
 	if (WARN_ON_ONCE(!dev->dma_parms))
-		return -EIO;
+		return;
 	dev->dma_parms->min_align_mask = min_align_mask;
-	return 0;
 }
 
 #ifndef dma_get_cache_alignment
-- 
2.43.0


