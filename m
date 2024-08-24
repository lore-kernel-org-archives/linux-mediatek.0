Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BDCC5472C
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Aug 2024 03:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7hSBdR/JVARfpeK58WO4kcqQWPz9QPRrMIi46F/pbw=; b=xWDtjrlICbotnWi8UlQ089wBwB
	WXmvXqixUkj6Eqkm5ScwzIRm43PkQisA87jskLVLSYdZdxZFZ5vrJzQJyRVZ1SYA/LkwuHSWRIbP7
	R5zH/omR4DairFGyyyDkSDUUcM5U82xTx9xONjuUXRb7ihtTy9elWj15JlmjFiHhqtafEmuixCSm/
	f6oKdiys+0sjvG98ZP9drjsIt/9o4/mZ2yFJSDOdhhcBoWZ7esS1ZUB1zPETACdhWJlVnjkXY9639
	0whtmAAU38Pr7RtXpD8AandUejngEu+jGBj2SLWK50Ojxoh2Lvv7U0hRxT48O4cfwHfsDM76OgCKU
	1019UXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhpL-00000001Np6-2duS;
	Sat, 24 Aug 2024 03:52:35 +0000
Received: from 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhmS-00000001N17-18bn;
	Sat, 24 Aug 2024 03:49:36 +0000
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
Subject: [PATCH 3/4] dma-mapping: don't return errors from dma_set_seg_boundary
Date: Sat, 24 Aug 2024 05:49:14 +0200
Message-ID: <20240824034925.1163244-4-hch@lst.de>
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
 include/linux/dma-mapping.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index cfd6bafec3f944..6bd1333dbacb9b 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -559,13 +559,11 @@ static inline unsigned long dma_get_seg_boundary_nr_pages(struct device *dev,
 	return (dma_get_seg_boundary(dev) >> page_shift) + 1;
 }
 
-static inline int dma_set_seg_boundary(struct device *dev, unsigned long mask)
+static inline void dma_set_seg_boundary(struct device *dev, unsigned long mask)
 {
-	if (dev->dma_parms) {
-		dev->dma_parms->segment_boundary_mask = mask;
-		return 0;
-	}
-	return -EIO;
+	if (WARN_ON_ONCE(!dev->dma_parms))
+		return;
+	dev->dma_parms->segment_boundary_mask = mask;
 }
 
 static inline unsigned int dma_get_min_align_mask(struct device *dev)
-- 
2.43.0


