Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C07C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/z5+iX/FtyHN52ZyuzgtaXjolgiQBc+YCMLzvEQzWk=; b=j18iMQHt3PTkED
	UJ2SK2EOrFJIcopp7NInZLU3TiaqHD3MlpR7GTFB5co2ZU701FBinljDyVEeRnEu1tr53HY774pwc
	sHVpD7RKZDLndOzLYZajK6wtfkCJQlh7oCcz2eVrpDz6NCLx3DD8b2028AWFnnwVhvN5EgqjEWu4g
	e0PBtyc3eUyyr1NabxG8mjVdwlUERRtxJGDEBzqaSgoRFysyyDNa3/4wWJFldBk0Mnxh02tLqTjbx
	9sMbtOkjAkNy7+L6nYBP2u00fbvua7L6j+FU3DWWl4CFDqkjCmSPkwUDo5g6WH2lxrlDfxK8MTJew
	CP3xPtgDR2ssHjf2gCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpQw2-001DNS-Pi; Tue, 23 Nov 2021 08:13:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpQjN-0019ov-2t
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 08:00:47 +0000
X-UUID: a004b384dd4a4493bb3c47a3f1592e88-20211123
X-UUID: a004b384dd4a4493bb3c47a3f1592e88-20211123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1111325117; Tue, 23 Nov 2021 01:00:38 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 23:50:35 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Nov 2021 15:50:33 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 23 Nov 2021 15:50:32 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v3 06/11] mt76: mt7915: enlarge wcid size to 544
Date: Tue, 23 Nov 2021 15:49:50 +0800
Message-ID: <9de3a585a1b7309906af6db283dc8e3de28c0169.1637652742.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1637652742.git.Bo.Jiao@mediatek.com>
References: <cover.1637652742.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_000045_189737_48DE2144 
X-CRM114-Status: GOOD (  13.22  )
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
index c2eae36..1b8a47c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -427,7 +427,7 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
 	/* enable hardware de-agg */
 	mt76_set(dev, MT_MDP_DCR0, MT_MDP_DCR0_DAMSDU_EN);
 
-	for (i = 0; i < MT7915_WTBL_SIZE; i++)
+	for (i = 0; i < mt7915_wtbl_size(dev); i++)
 		mt7915_mac_wtbl_update(dev, i,
 				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	for (i = 0; i < 2; i++)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 311d17d..40e8252 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1576,7 +1576,7 @@ static void mt7915_mac_add_txs(struct mt7915_dev *dev, void *data)
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
