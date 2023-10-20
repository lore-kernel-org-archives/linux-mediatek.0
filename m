Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0538C07480
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yojani6yn2+kJJ61hD9zQcUn8nFUjZtEJH18DxEg50k=; b=uhxqzO/WaAqaTRmuZsNJqQIJTp
	Si0p64frc5rVIQwKA1byh1/RKhhd1J+m3/T4sPCIS4DN9Vqz5NcSVntzAqkU4DIBNev5rFpg3OUsD
	Huq+GWOE4vB84DXdmGAbIPYmBxtq3XbMJKIMYRm2Zc+Ts5sKfkYDUAWjH5EYAmCeHfa2Nv7gKljU7
	YL8WaTisjQnhOlOzu01E2v/tLH3U8uatPNcFGn6ZngJ6H/S/2iRiTSZUhIww5C2EIVbDbEoHexeGA
	RJXk5uI96E168KzSkteXtZt7CqoFTza0Y5BWyTn4OF4Ecg+Tqs3gqPmi1lk9g3iiOC7jD4LD3LK8M
	dmhwGPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmnM-001mUZ-1y;
	Fri, 20 Oct 2023 10:31:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmnJ-001mTC-14
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 10:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB5E6CE35F6;
	Fri, 20 Oct 2023 10:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FB6C433C9;
	Fri, 20 Oct 2023 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697797910;
	bh=YdZwi7PiVHPeDTOb8qJp4IGfc6Ab3P3P06xqpebgMOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PeQkqlkrKwhwOuMrgCDVdmzEk+/EMUkWdzasJzPNwzOLhONHsD9j0cg8Ok+8aTif8
	 VwOytIPt52bPYtiif3eSVk2M0ZKEV0C9GFUAx1/SsatBdciHWBkyzdlnyI9W7UYqpX
	 wpkhsl0iz02v7lK48mTGU9hs+gXKgciY4AFpuiLUtLrV/49qzQTYVVBOIsBhQlikJK
	 zR45lGIKYQ3aZfFoCtzG6ZtvQSdZIdYxt7/NJ69bbcFnAXutjkPfUtSMQUdOXBwDbq
	 iewNOmRoD49nxi4BFlKSNpudzUzb0EXTVyEBGUpjz66WL6WEP3k1Hz0xMJaEba9kL/
	 OpnQSwS9REJig==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 08/13] wifi: mt76: dma: introduce __mt76_dma_queue_reset utility routine
Date: Fri, 20 Oct 2023 12:30:55 +0200
Message-ID: <df768b5e76729d8043eb3c04f5030726062698e6.1697797423.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697797422.git.lorenzo@kernel.org>
References: <cover.1697797422.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_033153_544247_D3F84013 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

This is a preliminary patch to introduce WED support for mt7996

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 64027572a5e6..7b622e966f58 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -195,7 +195,8 @@ mt76_dma_sync_idx(struct mt76_dev *dev, struct mt76_queue *q)
 }
 
 static void
-mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
+__mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
+		       bool reset_idx)
 {
 	int i;
 
@@ -206,11 +207,19 @@ mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
 	for (i = 0; i < q->ndesc; i++)
 		q->desc[i].ctrl = cpu_to_le32(MT_DMA_CTL_DMA_DONE);
 
-	Q_WRITE(q, cpu_idx, 0);
-	Q_WRITE(q, dma_idx, 0);
+	if (reset_idx) {
+		Q_WRITE(q, cpu_idx, 0);
+		Q_WRITE(q, dma_idx, 0);
+	}
 	mt76_dma_sync_idx(dev, q);
 }
 
+static void
+mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
+{
+	__mt76_dma_queue_reset(dev, q, true);
+}
+
 static int
 mt76_dma_add_rx_buf(struct mt76_dev *dev, struct mt76_queue *q,
 		    struct mt76_queue_buf *buf, void *data)
-- 
2.41.0


