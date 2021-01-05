Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7660C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 843A222525
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 843A222525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kJCu2FdXQsigyl0hhDhTRQqenWGX/NR0VvtCAN4MuB4=; b=24Z2U9FkL0klkECPTNARtQ/bl
	FQ1owj2CkejVLhJfoAnxaouajtYNV2tiVyoTnskqkqFQV6pjZ6G2/x9cWJABmXIhp3ttbwO3bPWyw
	OrK9sX8Vjx7UxCDdbmgoQc0Y9Nq7dHtsWG8CBLdT/Wbt+kcVM3MVllTYIqJSi2KGQKteNZ5/FFBgC
	AWklUrpYTaWT8NhQC54ghAS0L6/7f72PlcA3UMuL9Tw97MUgNtzqAiaPcqScsupfm30E0nQ26gcUz
	tF5MNwIxQkKZQuZ3mQBi7FG9oe3SnCbXxVqqxgarG/EkBv9iyTLLCaopMrpBB9rCwIAGWDEyUn3Wm
	F16z9Uq4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwiDt-0003yM-Tu; Tue, 05 Jan 2021 09:01:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwiDo-0003uu-Ss
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 09:01:47 +0000
X-UUID: 3a747a62ff2c421fa5bfea61d335868c-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZEuhNP9P/Nj5QmCgX00EgTZP/6hDbj4c+d6R8Ge7a40=; 
 b=QNuaIeINWMHfqCRqBsBt2RqfhF+I5amBCsv57c/VgIfatSMpQkmZ/tMl9g74MASEGDK02Mk9O0V5uRYwm+v6f/Rl+Mh5S5YA6h7vORQ8NR75FG3YGDIUcF9SRDNA23ZBNxTkAXWgJzoPQ5+06D66GDFndObF7zj0D/GVJu3ZgcY=;
X-UUID: 3a747a62ff2c421fa5bfea61d335868c-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1019283453; Tue, 05 Jan 2021 01:01:38 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 00:56:15 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 16:56:06 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 3/6] mt76: mt7915: split edca update function
Date: Tue, 5 Jan 2021 16:55:26 +0800
Message-ID: <20210105085529.14206-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105085529.14206-1-shayne.chen@mediatek.com>
References: <20210105085529.14206-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FBCBC90558B69950083831F363CB329449BD05C88BD47257D909451921DC7F312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_040145_145898_96EB6787 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Split parameter settings and mcu command update in mt7915_mcu_set_tx().
This is for reusing edca update function in testmode ipg setting.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 37 +++++++------------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 24 ++++++++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 3 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 0baef70fc522..9f78e4ec14c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2977,30 +2977,21 @@ int mt7915_mcu_set_rts_thresh(struct mt7915_phy *phy, u32 val)
 				 sizeof(req), true);
 }
 
+int mt7915_mcu_update_edca(struct mt7915_dev *dev, void *param)
+{
+	struct mt7915_mcu_tx *req = (struct mt7915_mcu_tx *)param;
+	u8 num = req->total;
+	size_t len = sizeof(*req) -
+		     (IEEE80211_NUM_ACS - num) * sizeof(struct edca);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE, req,
+				 len, true);
+}
+
 int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif)
 {
-#define WMM_AIFS_SET		BIT(0)
-#define WMM_CW_MIN_SET		BIT(1)
-#define WMM_CW_MAX_SET		BIT(2)
-#define WMM_TXOP_SET		BIT(3)
-#define WMM_PARAM_SET		GENMASK(3, 0)
 #define TX_CMD_MODE		1
-	struct edca {
-		u8 queue;
-		u8 set;
-		u8 aifs;
-		u8 cw_min;
-		__le16 cw_max;
-		__le16 txop;
-	};
-	struct mt7915_mcu_tx {
-		u8 total;
-		u8 action;
-		u8 valid;
-		u8 mode;
-
-		struct edca edca[IEEE80211_NUM_ACS];
-	} __packed req = {
+	struct mt7915_mcu_tx req = {
 		.valid = true,
 		.mode = TX_CMD_MODE,
 		.total = IEEE80211_NUM_ACS,
@@ -3027,8 +3018,8 @@ int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif)
 		else
 			e->cw_max = cpu_to_le16(10);
 	}
-	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE, &req,
-				 sizeof(req), true);
+
+	return mt7915_mcu_update_edca(dev, &req);
 }
 
 int mt7915_mcu_set_pm(struct mt7915_dev *dev, int band, int enter)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 30ec2ef4cc74..ee6d70339d92 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -182,6 +182,30 @@ struct mt7915_mcu_phy_rx_info {
 #define MT_RA_RATE_DCM_EN		BIT(4)
 #define MT_RA_RATE_BW			GENMASK(14, 13)
 
+struct edca {
+	u8 queue;
+	u8 set;
+	u8 aifs;
+	u8 cw_min;
+	__le16 cw_max;
+	__le16 txop;
+};
+
+struct mt7915_mcu_tx {
+	u8 total;
+	u8 action;
+	u8 valid;
+	u8 mode;
+
+	struct edca edca[IEEE80211_NUM_ACS];
+} __packed;
+
+#define WMM_AIFS_SET		BIT(0)
+#define WMM_CW_MIN_SET		BIT(1)
+#define WMM_CW_MAX_SET		BIT(2)
+#define WMM_TXOP_SET		BIT(3)
+#define WMM_PARAM_SET		GENMASK(3, 0)
+
 #define MCU_PQ_ID(p, q)			(((p) << 15) | ((q) << 10))
 #define MCU_PKT_ID			0xa0
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index df7ac2cf052f..c9c9aefacd88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -327,6 +327,7 @@ int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 int mt7915_set_channel(struct mt7915_phy *phy);
 int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd);
 int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif);
+int mt7915_mcu_update_edca(struct mt7915_dev *dev, void *req);
 int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
 			      struct ieee80211_sta *sta, u32 rate);
 int mt7915_mcu_set_eeprom(struct mt7915_dev *dev);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
