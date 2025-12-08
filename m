Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249B7D3B7EA
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 18:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zob8aimDdZepzG4aLLMFzGb3El7bSuhl1poL3r0KHW4=; b=kXqr0/YmFOgRs9rN7EDqYRc+o1
	sZJrnI1TKulW02mmG5GX11YD/wQThRj+N9kaJuy4oI9o+1rvcdPRO9dwvOKU6lLT7P7wxIaUEGqis
	ZQvYmy8LWBbN4DvuZ54+5f09MWmkYK9zrL9SfXjfrw4AAZpfoySqjAxWHkJOM6jG7t+LlmWxscG/y
	22++bRaI9Oi1qWLuKE5htpAYF1rCgYBzKlaoNb/3QMZ3qmBzRXPbxjVAHy81JDZHGpupb4KZO+rGS
	jLiSyb55wDdXpaATPC7hj47rlXXv/LDgHT7hlbWSsdM9vOp5/2c4XPsATiKbWwOSuOHVFtZ1QefNZ
	PHgcMqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSgNS-0000000DRbn-2aHK;
	Mon, 08 Dec 2025 18:54:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSgNQ-0000000DRbY-3ouD;
	Mon, 08 Dec 2025 18:54:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1901D60133;
	Mon,  8 Dec 2025 18:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B346C4CEF1;
	Mon,  8 Dec 2025 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765220067;
	bh=+j42bWBM6FxWkedAG9VsQO2lPFNc7TyTq/4KGNmXP3A=;
	h=From:Date:Subject:To:Cc:From;
	b=jCFLtg+cx1OBvUAqbzFG6wdHu+kXNLLSbgE7JcKRpLeyBtQbz6x6IMsDPyZi7HKaj
	 bvMbxbBYsj35U9j123agnI4wrpI98aOsyEd6eUQWqv+PQSJ1JUIywKprE/ZWCzYLhN
	 eCyQrTePCAwVUmWiO6GaFuBhFPplZTQLmVRLPM/+I9ufPnRV+LLbcNQWonYtLHmmOC
	 ipsTQK/3Tyznzsdl3wIdBxFpH3sdWbdhrvthFiJSggX9uksPCFR6APsE6MNj5ZUWRH
	 QT7HJmIcT23Lsv9iwjYt19t6+xc5i3DyyIx/VYFMd/ewQW5ZQk9Xy+uoNyOR5Qk2aF
	 oEyZpEi1ktOhw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 08 Dec 2025 19:54:08 +0100
Subject: [PATCH mt76] wifi: mt76: Fix memory leak destroying device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-mt76-fix-memory-leak-v1-1-cba813fc62b8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAMBRAf0X32a1tMsuvyMNwx42hTSL5d8vjq
 XPOA5ECU4Q6eyDQyZG3NYHMM+gnu46EPCQGJVQplTDoj0qj4ws9+S3cuJCdUZpCG9FJ65yAlO6
 BkvJvm/Z9PzQeRrpmAAAA
X-Change-ID: 20251208-mt76-fix-memory-leak-183680b1aff0
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

All MT76 rx queues have an associated page_pool even if the queue is not
associated to a NAPI (e.g. WED RRO queues with WED enabled). Destroy the
page_pool running mt76_dma_cleanup routine during module unload.
Moreover returns pages to the page pool if WED is not enabled for WED RRO
queues.

Fixes: 950d0abb5cd94 ("wifi: mt76: mt7996: add wed rx support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f240016ed9f0ead27e98e350f4fdb818e1686781..893ac14285cab3c22f70945d490627a64b643efe 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -874,7 +874,12 @@ mt76_dma_rx_cleanup(struct mt76_dev *dev, struct mt76_queue *q)
 		if (!buf)
 			break;
 
-		if (!mt76_queue_is_wed_rro(q))
+		if (mtk_wed_device_active(&dev->mmio.wed) &&
+		    mt76_queue_is_wed_rro(q))
+			continue;
+
+		if (!mt76_queue_is_wed_rro_rxdmad_c(q) &&
+		    !mt76_queue_is_wed_rro_ind(q))
 			mt76_put_page_pool_buf(buf, false);
 	} while (1);
 
@@ -1168,10 +1173,6 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
 	mt76_for_each_q_rx(dev, i) {
 		struct mt76_queue *q = &dev->q_rx[i];
 
-		if (mtk_wed_device_active(&dev->mmio.wed) &&
-		    mt76_queue_is_wed_rro(q))
-			continue;
-
 		netif_napi_del(&dev->napi[i]);
 		mt76_dma_rx_cleanup(dev, q);
 

---
base-commit: 53d1548612670aa8b5d89745116cc33d9d172863
change-id: 20251208-mt76-fix-memory-leak-183680b1aff0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


