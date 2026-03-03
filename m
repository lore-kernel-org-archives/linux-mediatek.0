Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72ABE67A6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 05:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6JwX/l2oAfCwSGPiG2qWW884x0TgC8RmkhIQ8dpRuI=; b=ZC/LRCdWcjDojAsvnfIJQbcGTY
	5oO0AlYUMppjIrthN5YRzk6ZVc601n3mZMYgzPZpyU0D7X2fI/foQ+wRUmW4RtnzJZBmu1WqQ5LLD
	kJuzZAOjK/Llljb6hPtTsvHWxGHSq5GkD10/nTaPYVwgjVOwLoTJXHqI36G4wzwoamBZ1aL2/zdyk
	9QjMtgoqNdFAeZiJFXW0Z5N97Rq9kqu1Ldppwrh99YGRNE7il4MxmNBIk7eycmjvunkRBTfriZLS/
	C1hv7qSCEShTHSr52aUAg26qomtDxYyIMjI9aa717v1WSrq6uJOUG65fvYOfEacLZs+LhyTUIvsMi
	Ob2qN7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRL-0000000EYca-07XE;
	Tue, 03 Mar 2026 05:37:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRI-0000000EYak-2nOw
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 05:37:01 +0000
X-UUID: fd2ccf9e16c211f1a16f0188aa809bee-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=j6JwX/l2oAfCwSGPiG2qWW884x0TgC8RmkhIQ8dpRuI=;
	b=uNke0DPi26FYqaT5b7pa3+mDxgTvXs7SAn5+xfKZM/45qHTx3jcT//4rWj04XYcX3AxqdSfJweri4AqkWJ4BX4wv4LkAQ7QxcPtoZnhK2SWrIjy2Lk5LNfYmkgq3oOUz3F0em4fDtH4ASE/RoCj4V3gZAq30aI0xDa71K5eQlBQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:611cf777-7e93-40bf-ab00-0b29385ce971,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:58bb31f1-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd2ccf9e16c211f1a16f0188aa809bee-20260302
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1506886400; Mon, 02 Mar 2026 22:36:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 13:36:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 13:36:52 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>
Subject: [PATCH v2 4/5] wifi: mt76: mt7921: add auto regdomain switch support
Date: Tue, 3 Mar 2026 13:36:36 +0800
Message-ID: <20260303053637.465465-4-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260303053637.465465-1-jb.tsai@mediatek.com>
References: <20260303053637.465465-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_213700_716862_B6751721 
X-CRM114-Status: GOOD (  18.77  )
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

Implement 802.11d-based automatic regulatory domain switching to
dynamically determine the regulatory domain at runtime.

The scan-done event structure by reusing reserved padding and appending
new fields; the layout and values remains backward-compatible with
existing users.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
v2: enhance git message
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 +-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  3 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 12 ++-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  3 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.c  | 81 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |  2 +
 6 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index fd9cf9c0c32f..e2e028ca95e0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1596,7 +1596,7 @@ struct mt76_connac_hw_scan_done {
 	u8 pno_enabled;
 	u8 pad2[3];
 	u8 sparse_channel_valid_num;
-	u8 pad3[3];
+	u8 alpha2[3];
 	u8 channel_num[MT76_CONNAC_SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
 	/* idle format for channel_idle_time
 	 * 0: first bytes: idle time(ms) 2nd byte: dwell time(ms)
@@ -1609,6 +1609,7 @@ struct mt76_connac_hw_scan_done {
 	u8 mdrdy_count[MT76_CONNAC_SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
 	__le32 beacon_2g_num;
 	__le32 beacon_5g_num;
+	__le16 channel_scan_time[MT76_CONNAC_SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
 } __packed;
 
 struct mt76_connac_sched_scan_req {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 03b4960db73f..bcca4b17e8f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -7,6 +7,7 @@
 #include "mt7921.h"
 #include "../dma.h"
 #include "../mt76_connac2_mac.h"
+#include "regd.h"
 #include "mcu.h"
 
 #define MT_WTBL_TXRX_CAP_RATE_OFFSET	7
@@ -697,6 +698,8 @@ void mt7921_mac_reset_work(struct work_struct *work)
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_vif_connect_iter, NULL);
 	mt76_connac_power_save_sched(&dev->mt76.phy, pm);
+
+	mt7921_regd_change(&dev->phy, "00");
 }
 
 void mt7921_coredump_work(struct work_struct *work)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 24e8fd1f01ed..18f0fc7eb24b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1028,8 +1028,16 @@ void mt7921_scan_work(struct work_struct *work)
 		rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
 		if (rxd->eid == MCU_EVENT_SCHED_SCAN_DONE) {
 			ieee80211_sched_scan_results(phy->mt76->hw);
-		} else if (test_and_clear_bit(MT76_HW_SCANNING,
-					      &phy->mt76->state)) {
+		} else if (rxd->eid == MCU_EVENT_SCAN_DONE) {
+			struct mt76_connac_hw_scan_done *event = NULL;
+
+			skb_pull(skb, sizeof(*rxd));
+			event = (struct mt76_connac_hw_scan_done *)skb->data;
+			mt7921_regd_change(phy, event->alpha2);
+		}
+
+		if (test_and_clear_bit(MT76_HW_SCANNING,
+				       &phy->mt76->state)) {
 			struct cfg80211_scan_info info = {
 				.aborted = false,
 			};
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 9777c899e503..3e605a9ab919 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -484,7 +484,8 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 			goto out;
 		}
 	}
-	ret = mt7921_mcu_set_clc(dev, "00", ENVIRON_INDOOR);
+
+	ret = mt7921_regd_init(phy);
 out:
 	release_firmware(fw);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index fa753e8e041d..229aa59e60f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -110,26 +110,93 @@ int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
 EXPORT_SYMBOL_GPL(mt7921_mcu_regd_update);
 
 void mt7921_regd_notifier(struct wiphy *wiphy,
-			  struct regulatory_request *request)
+			  struct regulatory_request *req)
 {
 	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt76_connac_pm *pm = &dev->pm;
+	struct mt76_dev *mdev = &dev->mt76;
+
+	/* do not need to update the same country twice */
+	if (!memcmp(req->alpha2, mdev->alpha2, 2) &&
+	    dev->country_ie_env == req->country_ie_env)
+		return;
 
-	memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
-	dev->mt76.region = request->dfs_region;
-	dev->country_ie_env = request->country_ie_env;
+	memcpy(mdev->alpha2, req->alpha2, 2);
+	mdev->region = req->dfs_region;
+	dev->country_ie_env = req->country_ie_env;
 
-	if (request->initiator == NL80211_REGDOM_SET_BY_USER) {
+	if (req->initiator == NL80211_REGDOM_SET_BY_USER) {
 		if (dev->mt76.alpha2[0] == '0' && dev->mt76.alpha2[1] == '0')
 			wiphy->regulatory_flags &= ~REGULATORY_COUNTRY_IE_IGNORE;
 		else
 			wiphy->regulatory_flags |= REGULATORY_COUNTRY_IE_IGNORE;
 	}
 
+	dev->regd_change = true;
+
 	if (pm->suspended)
 		return;
 
-	mt7921_mcu_regd_update(dev, request->alpha2,
-			       request->country_ie_env);
+	mt7921_mcu_regd_update(dev, req->alpha2,
+			       req->country_ie_env);
+}
+
+static bool
+mt7921_regd_is_valid_alpha2(const char *alpha2)
+{
+	if (!alpha2)
+		return false;
+
+	if (alpha2[0] == '0' && alpha2[1] == '0')
+		return true;
+
+	if (isalpha(alpha2[0]) && isalpha(alpha2[1]))
+		return true;
+
+	return false;
+}
+
+int mt7921_regd_change(struct mt792x_phy *phy, char *alpha2)
+{
+	struct wiphy *wiphy = phy->mt76->hw->wiphy;
+	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt76_dev *mdev = &dev->mt76;
+
+	if (dev->hw_full_reset)
+		return 0;
+
+	if (!mt7921_regd_is_valid_alpha2(alpha2) ||
+	    !mt7921_regd_clc_supported(dev))
+		return -EINVAL;
+
+	if (mdev->alpha2[0] != '0' && mdev->alpha2[1] != '0')
+		return 0;
+
+	/* do not need to update the same country twice */
+	if (!memcmp(alpha2, mdev->alpha2, 2))
+		return 0;
+
+	if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN)
+		return regulatory_hint(wiphy, alpha2);
+	else
+		return mt7921_mcu_set_clc(dev, alpha2, ENVIRON_INDOOR);
+}
+EXPORT_SYMBOL_GPL(mt7921_regd_change);
+
+int mt7921_regd_init(struct mt792x_phy *phy)
+{
+	struct wiphy *wiphy = phy->mt76->hw->wiphy;
+	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt76_dev *mdev = &dev->mt76;
+
+	if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN)
+		wiphy->regulatory_flags |= REGULATORY_COUNTRY_IE_IGNORE |
+					   REGULATORY_DISABLE_BEACON_HINTS;
+	else
+		memzero_explicit(&mdev->alpha2, sizeof(mdev->alpha2));
+
+	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
index c7dcf747843c..571f31629e9e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -13,5 +13,7 @@ int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
 void mt7921_regd_notifier(struct wiphy *wiphy,
 			  struct regulatory_request *request);
 bool mt7921_regd_clc_supported(struct mt792x_dev *dev);
+int mt7921_regd_change(struct mt792x_phy *phy, char *alpha2);
+int mt7921_regd_init(struct mt792x_phy *phy);
 
 #endif
-- 
2.43.0


