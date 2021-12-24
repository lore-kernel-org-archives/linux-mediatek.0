Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FFFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+EMMvN4GGUsrFWoZCTjI52jr+71od+Tb60Y4E9Qykc=; b=EZkWF4z5d/y8Vl
	c+RBx5A2k+42oK0nxd8YOiATaugQIXjaFGEcARURssBMe11ufM+ad3J6oHrtlyMNF2NHX9zl2HYxb
	L2bhEVgypGajdCnevCcgCp2BoYkVWT716NeE04/kDPHLy0czqOKudO1oVWutz4MKFWVBoYFAMAJRg
	1J9pkNySPQ/7DJHz6PPYJ9ZQ3LWzBOC0j1qpCCTmohQzWvNNHYxvqrwRpYiSkF5x3k69egZ3Xunj/
	QcJUj3uFPn4b19QSjSyeYzV9QWl/Z97CvSD9EipSIJzq+Y0HDOq1jGjAEdxQf0COge8WITgGX7KhL
	++pf2g3xbUi9hCu6J/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gBP-00Dx8d-5z; Fri, 24 Dec 2021 08:44:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gBM-00Dx7l-Kq
 for linux-mediatek@lists.infradead.org; Fri, 24 Dec 2021 08:44:10 +0000
X-UUID: 80e95fc1c4fc44d893b7aa93f9444e11-20211224
X-UUID: 80e95fc1c4fc44d893b7aa93f9444e11-20211224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1584654091; Fri, 24 Dec 2021 01:44:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Dec 2021 00:34:06 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Dec 2021 16:34:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Dec 2021 16:34:04 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] mt76: mt7921: set EDCA parameters with the MCU CE command
Date: Fri, 24 Dec 2021 16:33:56 +0800
Message-ID: <6205eecc21a1a02762ffeb1f6499799b0cfc40b5.1640332407.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a6323ac53fca2bf3221a1e9178ba1ca3f827dde4.1640332407.git.sean.wang@kernel.org>
References: <a6323ac53fca2bf3221a1e9178ba1ca3f827dde4.1640332407.git.sean.wang@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_004408_714635_6A7AEE62 
X-CRM114-Status: GOOD (  12.52  )
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

From: Sean Wang <sean.wang@mediatek.com>

The command MCU_EXT_CMD_EDCA_UPDATE is not fully supported by the MT7921
firmware, so we apply CE command MCU_CE_CMD_SET_EDCA_PARAMS instead which
is supported even in the oldest firmware to properly set up EDCA parameters
for each AC.

Fixes: 1c099ab44727 ("mt76: mt7921: add MCU support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 49 ++++++++-----------
 2 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 0f4a9d2edb5c..ceb0784be395 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -998,6 +998,7 @@ enum {
 	MCU_CE_CMD_SET_BSS_ABORT = 0x17,
 	MCU_CE_CMD_CANCEL_HW_SCAN = 0x1b,
 	MCU_CE_CMD_SET_ROC = 0x1c,
+	MCU_CE_CMD_SET_EDCA_PARMS = 0x1d,
 	MCU_CE_CMD_SET_P2P_OPPPS = 0x33,
 	MCU_CE_CMD_SET_RATE_TX_POWER = 0x5d,
 	MCU_CE_CMD_SCHED_SCAN_ENABLE = 0x61,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index d014e574ce6a..ba8a91d56b6a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -785,33 +785,28 @@ EXPORT_SYMBOL_GPL(mt7921_mcu_exit);
 
 int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 {
-#define WMM_AIFS_SET		BIT(0)
-#define WMM_CW_MIN_SET		BIT(1)
-#define WMM_CW_MAX_SET		BIT(2)
-#define WMM_TXOP_SET		BIT(3)
-#define WMM_PARAM_SET		GENMASK(3, 0)
-#define TX_CMD_MODE		1
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+
 	struct edca {
-		u8 queue;
-		u8 set;
-		u8 aifs;
-		u8 cw_min;
+		__le16 cw_min;
 		__le16 cw_max;
 		__le16 txop;
-	};
+		__le16 aifs;
+		u8 guardtime;
+		u8 acm;
+	} __packed;
 	struct mt7921_mcu_tx {
-		u8 total;
-		u8 action;
-		u8 valid;
-		u8 mode;
-
 		struct edca edca[IEEE80211_NUM_ACS];
+		u8 bss_idx;
+		u8 qos;
+		u8 wmm_idx;
+		u8 pad;
 	} __packed req = {
-		.valid = true,
-		.mode = TX_CMD_MODE,
-		.total = IEEE80211_NUM_ACS,
+		.bss_idx = mvif->mt76.idx,
+		.qos = vif->bss_conf.qos,
+		.wmm_idx = mvif->mt76.wmm_idx,
 	};
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+
 	struct mu_edca {
 		u8 cw_min;
 		u8 cw_max;
@@ -835,30 +830,29 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 		.qos = vif->bss_conf.qos,
 		.wmm_idx = mvif->mt76.wmm_idx,
 	};
+	int to_aci[] = {1, 0, 2, 3};
 	int ac, ret;
 
 	for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
 		struct ieee80211_tx_queue_params *q = &mvif->queue_params[ac];
-		struct edca *e = &req.edca[ac];
+		struct edca *e = &req.edca[to_aci[ac]];
 
-		e->set = WMM_PARAM_SET;
-		e->queue = ac + mvif->mt76.wmm_idx * MT7921_MAX_WMM_SETS;
 		e->aifs = q->aifs;
 		e->txop = cpu_to_le16(q->txop);
 
 		if (q->cw_min)
-			e->cw_min = fls(q->cw_min);
+			e->cw_min = cpu_to_le16(q->cw_min);
 		else
 			e->cw_min = 5;
 
 		if (q->cw_max)
-			e->cw_max = cpu_to_le16(fls(q->cw_max));
+			e->cw_max = cpu_to_le16(q->cw_max);
 		else
 			e->cw_max = cpu_to_le16(10);
 	}
 
-	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(EDCA_UPDATE),
-				&req, sizeof(req), true);
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_CE_CMD(SET_EDCA_PARMS), &req,
+				sizeof(req), false);
 	if (ret)
 		return ret;
 
@@ -868,7 +862,6 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 	for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
 		struct ieee80211_he_mu_edca_param_ac_rec *q;
 		struct mu_edca *e;
-		int to_aci[] = {1, 0, 2, 3};
 
 		if (!mvif->queue_params[ac].mu_edca)
 			break;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
