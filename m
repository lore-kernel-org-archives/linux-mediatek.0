Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9947BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 03:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MaefGZzEjKv+zTIher4rYDK3FE8d4+BhG7NM2LZp8rA=; b=iuQQDvP+nv+g97VpJ1O6jGlGoC
	iQUSTwzdR0am7qtZFj1CiXpTaeSD7ko9FnhHjBwLG6MBsQHFqLJvMLFpHHGc5eIrn8cr+ttnf3F9e
	6CsA2jsWOfrOT0fcFaa/bbliLy7JYFCq2viqiLUseKF1OTmViaDNrMLGYQRphZb3zgnzJN6wBdGha
	lJUmK2PgdsMp9IftEGW0gaGWZnV79M9fkdOhHT1rUg8Z6Tkqn46PWh4/jkG29Su0gPZn5o1uQA4W5
	sRCf6O8s6GFrCZNsT4IikLBtPkbc0uBogEjGSs3o3aV4J4Yttfh7KYy38cZV7I7lx4VXKbjN0XmVT
	79CpDt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozUpl-00FU9a-DF; Mon, 28 Nov 2022 03:29:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozUpi-00FU6q-Sf
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 03:29:28 +0000
X-UUID: 10ea5dd02cc34a6fa46c1da92f74bf7e-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MaefGZzEjKv+zTIher4rYDK3FE8d4+BhG7NM2LZp8rA=;
	b=PPOQNUXRDNTRvzPg+evCKYNaI9HJ05e/x8qB3smqGVwtPZx8lLHqjoPljaZxgn4jpUy0Q/vwP3IARNPUzBT3COYB6UGXQdbZMlH9IXoQlu1NdKTXsKDka9xkC0DVrQHFZydiXB8Gk6hcagxjIWdgxs6V1TtDQvjmOMBQZ8SIPVk=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:86766469-f24e-4610-8c8b-7ee644350cc5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.14,REQID:86766469-f24e-4610-8c8b-7ee644350cc5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:dcaaed0,CLOUDID:0192751e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:221128112856GL2ZMPHK,BulkQuantity:2,Recheck:0,SF:28|16|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 10ea5dd02cc34a6fa46c1da92f74bf7e-20221127
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1189295410; Sun, 27 Nov 2022 20:29:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 28 Nov 2022 11:28:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 28 Nov 2022 11:28:42 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: add missing argument in mt7996_queue_rx_skb()
Date: Mon, 28 Nov 2022 11:28:26 +0800
Message-ID: <20221128032826.9696-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_192926_957091_5AA8039A 
X-CRM114-Status: GOOD (  11.55  )
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

An argument has been added in .rx_skb driver ops callback after
introducing WED RX support. Align it to fix the following compile error:

>> drivers/net/wireless/mediatek/mt76/mt7996/mmio.c:328:13: error: incompatible function pointer types initializing 'void (*)(struct mt76_dev *, enum mt76_rxq_id, struct sk_buff *, u32 *)' (aka 'void (*)(struct mt76_dev *, enum mt76_rxq_id, struct sk_buff *, unsigned int *)') with an expression of type 'void (struct mt76_dev *, enum mt76_rxq_id, struct sk_buff *)' [-Werror,-Wincompatible-function-pointer-types]
                   .rx_skb = mt7996_queue_rx_skb,
                             ^~~~~~~~~~~~~~~~~~~
   1 error generated.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
@Felix, could you please help to fold this patch? Thanks.
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 9650590a5d4b..c9c9b82352eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1514,7 +1514,7 @@ bool mt7996_rx_check(struct mt76_dev *mdev, void *data, int len)
 }
 
 void mt7996_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
-			 struct sk_buff *skb)
+			 struct sk_buff *skb, u32 *info)
 {
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
 	__le32 *rxd = (__le32 *)skb->data;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 371195e4597d..167f615f099e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -489,7 +489,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 void mt7996_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
 void mt7996_tx_token_put(struct mt7996_dev *dev);
 void mt7996_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
-			 struct sk_buff *skb);
+			 struct sk_buff *skb, u32 *info);
 bool mt7996_rx_check(struct mt76_dev *mdev, void *data, int len);
 void mt7996_sta_ps(struct mt76_dev *mdev, struct ieee80211_sta *sta, bool ps);
 void mt7996_stats_work(struct work_struct *work);
-- 
2.25.1


