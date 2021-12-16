Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E641C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 17:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dgD92zIFq8ULjLzL8uXFdHPD7I1q40RaJ+ge9Cmuuoc=; b=MZ15nXFFcQ4qvZ
	9EeTeQB3hnoOk1jty0YL+WwOhIrchKVV9lGFwAskPrC7bR6toQxA58DTsaT7s9WFHZAryRRg9vr5d
	MGLovaNDF+AhL4WDgDqe2xPfG3pUkRfrw9RVTryk61UfT102AIsq1kuE9mnBpu94+MEHOyzT1Iys0
	2N8CQR1lq1zke4m1uBKkqsnkCWU0qSANIQJ3fzNL/nWlc68EXNOOwVrYERmjm/dJXN6pj3jmhrmVe
	lLaLrCgr1KHuTnHd8AjBXtu2YPXOSFAlb57v4R/a2b+lKmyNiyAhCVvG/JCb11SIfLxuxx6XdcG3w
	IcEsiLldZAnkvhvffhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxuRm-006sSm-Ja; Thu, 16 Dec 2021 17:21:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxu9W-006my0-Ql
 for linux-mediatek@lists.infradead.org; Thu, 16 Dec 2021 17:02:48 +0000
X-UUID: fb859afe8b7b4812b784f64ef5791ea1-20211216
X-UUID: fb859afe8b7b4812b784f64ef5791ea1-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1800894470; Thu, 16 Dec 2021 10:02:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 09:02:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 01:02:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Dec 2021 01:02:39 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921s: fix cmd timeout in throughput test
Date: Fri, 17 Dec 2021 01:02:09 +0800
Message-ID: <d187e530a37a7941912e356e356606ffaad88b8a.1639673722.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_090246_917646_12A99DA0 
X-CRM114-Status: GOOD (  11.17  )
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

From: Deren Wu <deren.wu@mediatek.com>

During heavy loading throughtput test, the RX buffer (128)
would be exhausted and some RX pkts dropped randomly. Increase
buffer size from 128 to 512 (a safer length) to avoid tput degrade
or cmd-timeout problem.

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 2 ++
 drivers/net/wireless/mediatek/mt76/sdio.c | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 239742112e16..2a4120f71534 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -495,6 +495,8 @@ struct mt76_usb {
 };
 
 #define MT76S_XMIT_BUF_SZ	(16 * PAGE_SIZE)
+#define MT76S_NUM_TX_ENTRIES	256
+#define MT76S_NUM_RX_ENTRIES	512
 struct mt76_sdio {
 	struct mt76_worker txrx_worker;
 	struct mt76_worker status_worker;
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index b0bc7be0fb1f..54f72d215948 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -305,12 +305,12 @@ int mt76s_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid)
 
 	spin_lock_init(&q->lock);
 	q->entry = devm_kcalloc(dev->dev,
-				MT_NUM_RX_ENTRIES, sizeof(*q->entry),
+				MT76S_NUM_RX_ENTRIES, sizeof(*q->entry),
 				GFP_KERNEL);
 	if (!q->entry)
 		return -ENOMEM;
 
-	q->ndesc = MT_NUM_RX_ENTRIES;
+	q->ndesc = MT76S_NUM_RX_ENTRIES;
 	q->head = q->tail = 0;
 	q->queued = 0;
 
@@ -328,12 +328,12 @@ static struct mt76_queue *mt76s_alloc_tx_queue(struct mt76_dev *dev)
 
 	spin_lock_init(&q->lock);
 	q->entry = devm_kcalloc(dev->dev,
-				MT_NUM_TX_ENTRIES, sizeof(*q->entry),
+				MT76S_NUM_TX_ENTRIES, sizeof(*q->entry),
 				GFP_KERNEL);
 	if (!q->entry)
 		return ERR_PTR(-ENOMEM);
 
-	q->ndesc = MT_NUM_TX_ENTRIES;
+	q->ndesc = MT76S_NUM_TX_ENTRIES;
 
 	return q;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
