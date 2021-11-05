Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0ADC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 10:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CAA860EBC
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 10:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CAA860EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khf3fhUd1noBVDQ1E52vtrZ/gD+dMK8NhO9n5Ihfzr4=; b=swFLiOZ8Xd3nmV
	UFI8tmd/7Vun2+7+wCTObqy8vur9cbs8NtYQEMGhhw4CrXQQNUR4j4NtI7ejPhvPFmwqVN+ylBwMs
	Q5X1nJXg5vO29M777xG5KsNWv7duiY7vck2To4+OniMryxLM/zgEQF83QCzofs5UcSuiWSzhOgRE7
	gDPYKkmsezA7RuXsSVG5nE5GtgkYCZp83lS/cp2FT6QkIvDx8EnN+ViCLh4JRFhWHA1WozDOYPUGJ
	kHNxDq/YV1t0naA9/O3RlrS/W9kHK1gPSnxRRAH0h0M41y0zjy++g6oGOZVs5exsVgjTPxscOjhij
	BVhm57QHwBvrXvLwhF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miwD6-00B4gN-Ae; Fri, 05 Nov 2021 10:12:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miwCz-00B4aJ-S3
 for linux-mediatek@lists.infradead.org; Fri, 05 Nov 2021 10:12:31 +0000
X-UUID: 5becf8942cf142cc98e1484ccd390df3-20211105
X-UUID: 5becf8942cf142cc98e1484ccd390df3-20211105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 169658132; Fri, 05 Nov 2021 03:12:21 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Nov 2021 03:02:23 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 5 Nov 2021 18:02:16 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 5 Nov 2021 18:02:16 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v2 06/11] mt76: mt7915: enlarge wcid size to 544
Date: Fri, 5 Nov 2021 18:02:05 +0800
Message-ID: <12494e24664dd5920fcc263986cf8052ce6a96fa.1636105953.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1636105953.git.Bo.Jiao@mediatek.com>
References: <cover.1636105953.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_031229_953740_2A31E251 
X-CRM114-Status: GOOD (  12.43  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

The mt7916 can support up to 544 wcid entries.
This is an intermediate patch to add mt7916 support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h          | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h | 8 +++++++-
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8fd6890..814ed21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -225,7 +225,7 @@ enum mt76_wcid_flags {
 	MT_WCID_FLAG_HDR_TRANS,
 };
 
-#define MT76_N_WCIDS 288
+#define MT76_N_WCIDS 544
 
 /* stored in ieee80211_tx_info::hw_queue */
 #define MT_TX_HW_QUEUE_EXT_PHY		BIT(3)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 92b13ee..86f2062 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -430,7 +430,7 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
 	/* enable hardware de-agg */
 	mt76_set(dev, MT_MDP_DCR0, MT_MDP_DCR0_DAMSDU_EN);
 
-	for (i = 0; i < MT7915_WTBL_SIZE; i++)
+	for (i = 0; i < mt7915_wtbl_size(dev); i++)
 		mt7915_mac_wtbl_update(dev, i,
 				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	for (i = 0; i < 2; i++)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index ba39f3d..4212dbb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1492,7 +1492,7 @@ static void mt7915_mac_add_txs(struct mt7915_dev *dev, void *data)
 	if (pid < MT_PACKET_ID_FIRST)
 		return;
 
-	if (wcidx >= MT7915_WTBL_SIZE)
+	if (wcidx >= mt7915_wtbl_size(dev))
 		return;
 
 	rcu_read_lock();
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 3e2e900..e8fbe69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -12,7 +12,8 @@
 #define MT7915_MAX_INTERFACES		19
 #define MT7915_MAX_WMM_SETS		4
 #define MT7915_WTBL_SIZE		288
-#define MT7915_WTBL_RESERVED		(MT7915_WTBL_SIZE - 1)
+#define MT7916_WTBL_SIZE		544
+#define MT7915_WTBL_RESERVED		(mt7915_wtbl_size(dev) - 1)
 #define MT7915_WTBL_STA			(MT7915_WTBL_RESERVED - \
 					 MT7915_MAX_INTERFACES)
 
@@ -477,6 +478,11 @@ static inline bool is_mt7915(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7915;
 }
 
+static inline u16 mt7915_wtbl_size(struct mt7915_dev *dev)
+{
+	return is_mt7915(&dev->mt76) ? MT7915_WTBL_SIZE : MT7916_WTBL_SIZE;
+}
+
 void mt7915_dual_hif_set_irq_mask(struct mt7915_dev *dev, bool write_reg,
 				  u32 clear, u32 set);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
