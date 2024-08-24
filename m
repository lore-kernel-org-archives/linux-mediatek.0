Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF4AC5472C
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Aug 2024 03:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfCFH7RPHdPA6U8oxZwM/RzFKw4srQhejXrAt6uaIy8=; b=g2BILz2zEUrsqr5kjT06hPnrji
	TQxUb888pWrT4ZgvWsivQPWXKt/BRSlkHPS3z/1OQo21/g3FoxaVIAzq0PtBw4n7qvo7GYOhNDwdr
	Zcri2uJxmyhsPUMELgcZRIt1cVwpSvumlPzmTLJ/dEnFEjxbxTu+BrduMEJt2VwsBY4XP4GQyTt66
	k/2sZ1r54dhjQHc48P+Cn7LNoXM5Yqi7SCYDR2mBeXOZNdppUO01Et7KvEhgHzOks8zUGwWMoIarG
	kEbKl9nt4YxjkbB5ZY6RltyztUqDchm0ZkmmYjp/q1Rn7d3EBTd2FLXUNulLON2wAdcYFm1nVNb6r
	PErsGGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhnr-00000001NOT-0Odd;
	Sat, 24 Aug 2024 03:51:03 +0000
Received: from 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhmM-00000001N07-2TWU;
	Sat, 24 Aug 2024 03:49:31 +0000
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
Subject: [PATCH 1/4] scsi: check that busses support the DMA API before setting dma parameters
Date: Sat, 24 Aug 2024 05:49:12 +0200
Message-ID: <20240824034925.1163244-2-hch@lst.de>
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

We'll start throwing warnings soon when dma_set_seg_boundary and
dma_set_max_seg_size are called on devices for buses that don't fully
support the DMA API.  Prepare for that by making the calls in the SCSI
midlayer conditional.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/scsi_lib.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 3958a6d14bf457..7f0394c4492033 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1988,8 +1988,15 @@ void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
 	if (shost->no_highmem)
 		lim->features |= BLK_FEAT_BOUNCE_HIGH;
 
-	dma_set_seg_boundary(dev, shost->dma_boundary);
-	dma_set_max_seg_size(dev, shost->max_segment_size);
+	/*
+	 * Propagate the DMA formation properties to the dma-mapping layer as
+	 * a courtesy service to the LLDDs.  This needs to check that the buses
+	 * actually support the DMA API first, though.
+	 */
+	if (dev->dma_parms) {
+		dma_set_seg_boundary(dev, shost->dma_boundary);
+		dma_set_max_seg_size(dev, shost->max_segment_size);
+	}
 }
 EXPORT_SYMBOL_GPL(scsi_init_limits);
 
-- 
2.43.0


