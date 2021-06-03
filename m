Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB00C47083
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 03:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1CCB613F3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 03:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1CCB613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIfcc2xnlt/s2BcR64DSrKFdtRZS7oOi2kyUF0VXJmc=; b=qz32BatDpalZIV
	jg5zIBl1od4CZBOHx46np36vW2cSNUGgNTMTw/2y2Hl5zSZf8NbT/GrVara9T/EBdWF/QteiiBV0V
	1RXWJlnnPJ9G/f1u6B3RCJxKodcj0Gd8FQp7DIU0sX71abzXUQfB0y6eu3Uh0qyVHDmo8638hX9Gu
	V75H0DkbkLAwWFnNv6rOfRN8BGKj0JXghNFaDuF6redrp76PQnS3+FbqJlxgGZdoqAXyK5fkJKR6F
	j+T+ozpGCZGPWcopzbXEsjIYz+5RBvU05fuLZK9JD0QVSgPo+nXQL10bglPdWmHp9WPlD0QF5Tegv
	/A9ky1We2RFyN6F9RWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lodcv-006tmp-7m; Thu, 03 Jun 2021 03:02:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lodcr-006tlx-Tz
 for linux-mediatek@lists.infradead.org; Thu, 03 Jun 2021 03:02:31 +0000
X-UUID: 62ba7d0be790483d954bb6315a6cda41-20210602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1zmqdTfz3uaIj4jw6ShxBsW5CKem4r1n8Yltgfex3y8=; 
 b=bJM5ATbJGo5zuxLE1DIWed0BI3KyKyEoy/V9pakr1PUJwLym6LevEBv48+6QFtEHcwaV1PVtE7H9HHoDk/b3PAfB5T/jSc1qam+65AxYHlDMZuJoui0bbhdYVMKIQ8Vf12FPruCtBsn5AZVvC5O3ALkS8kcVBhK3SI0oETxH8bQ=;
X-UUID: 62ba7d0be790483d954bb6315a6cda41-20210602
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 415078190; Wed, 02 Jun 2021 20:02:25 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 20:02:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 11:02:22 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Jun 2021 11:02:22 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 2/2] mt76: mt7921: fix sta_state incorrect implementation
Date: Thu, 3 Jun 2021 11:02:17 +0800
Message-ID: <e0a33a31da8a69dcf13d30e2d2591329c8d33689.1622688431.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <eefc22e4c64c8605bcaf2aa0feae0ef3d4084ebf.1622688431.git.objelf@gmail.com>
References: <eefc22e4c64c8605bcaf2aa0feae0ef3d4084ebf.1622688431.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_200230_007032_257FFE03 
X-CRM114-Status: GOOD (  19.44  )
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

When .sta_state is implemented, mac80211 assumes that the station entry is
usable after the NOTEXIST->NONE transition.

So we should create the sta entry as early as possible in order that
mac80211 pass assoc/auth frames to mt76 with the newly created sta entry,
and add .sta_assoc to mt76 core to refresh the sta entry again when sta is
being associated.

Fixes: 8aa5a9b7361c ("mt76: mt7921: enable deep sleep at runtime")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v1->v2: Put back the careless change not belonged to the patch to keep
	mt7921_mcu_sta_add for BC entry and mt76_connac_mcu_uni_add_bss
	on the association.
v2->v3: 1. rebase the latest mt76
	2. squashing 2/3 to the one
	3. add the proper lock in mt7921_mac_sta_assoc
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 55 ++++++++-----------
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 20 +++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  4 ++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  1 +
 4 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index c641a92b140c..af98835b5134 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -618,18 +618,14 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
-	if (vif->type == NL80211_IFTYPE_STATION) {
+	if (vif->type == NL80211_IFTYPE_STATION)
 		mvif->wep_sta = msta;
-		if (!sta->tdls)
-			mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
-						    &mvif->sta.wcid, true);
-	}
 
 	mt7921_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	ret = mt7921_mcu_sta_add(dev, sta, vif, true,
-				 MT76_STA_INFO_STATE_ASSOC);
+				 MT76_STA_INFO_STATE_NONE);
 	if (ret)
 		return ret;
 
@@ -638,6 +634,27 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	return 0;
 }
 
+void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+
+	mt7921_mutex_acquire(dev);
+
+	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
+		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
+					    true);
+
+	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
+			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+
+	mt7921_mcu_sta_update(dev, sta, vif, MT76_STA_INFO_STATE_ASSOC);
+
+	mt7921_mutex_release(dev);
+}
+
 void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
@@ -793,22 +810,6 @@ mt7921_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return ret;
 }
 
-static int
-mt7921_sta_add(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-	       struct ieee80211_sta *sta)
-{
-	return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NOTEXIST,
-			      IEEE80211_STA_NONE);
-}
-
-static int
-mt7921_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-		  struct ieee80211_sta *sta)
-{
-	return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NONE,
-			      IEEE80211_STA_NOTEXIST);
-}
-
 static int mt7921_sta_state(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta,
@@ -823,15 +824,7 @@ static int mt7921_sta_state(struct ieee80211_hw *hw,
 		mt7921_mutex_release(dev);
 	}
 
-	if (old_state == IEEE80211_STA_AUTH &&
-	    new_state == IEEE80211_STA_ASSOC) {
-		return mt7921_sta_add(hw, vif, sta);
-	} else if (old_state == IEEE80211_STA_ASSOC &&
-		   new_state == IEEE80211_STA_AUTH) {
-		return mt7921_sta_remove(hw, vif, sta);
-	}
-
-	return 0;
+	return mt76_sta_state(hw, vif, sta, old_state, new_state);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 4f0fd9674950..ab338bdf4f4a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1289,6 +1289,26 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 	return mt76_connac_mcu_add_sta_cmd(&dev->mphy, &info);
 }
 
+int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *sta,
+			  struct ieee80211_vif *vif, u8 state)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	int rssi = -ewma_rssi_read(&mvif->rssi);
+	struct mt76_sta_cmd_info info = {
+		.sta = sta,
+		.vif = vif,
+		.enable = true,
+		.state = state,
+		.cmd = MCU_UNI_CMD_STA_REC_UPDATE,
+		.rcpi = to_rcpi(rssi),
+	};
+	struct mt7921_sta *msta;
+
+	msta = sta ? (struct mt7921_sta *)sta->drv_priv : NULL;
+	info.wcid = msta ? &msta->wcid : &mvif->sta.wcid;
+	return mt76_connac_mcu_update_sta_cmd(&dev->mphy, &info);
+}
+
 int __mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev)
 {
 	struct mt76_phy *mphy = &dev->mt76.phy;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index d4d84b898011..196e47f89fc1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -265,6 +265,8 @@ int mt7921_set_channel(struct mt7921_phy *phy);
 int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 		       struct ieee80211_vif *vif, bool enable,
 		       enum mt76_sta_info_state state);
+int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *sta,
+			  struct ieee80211_vif *vif, u8 state);
 int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
 int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif);
 int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
@@ -336,6 +338,8 @@ void mt7921_mac_fill_rx_vector(struct mt7921_dev *dev, struct sk_buff *skb);
 void mt7921_mac_tx_free(struct mt7921_dev *dev, struct sk_buff *skb);
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta);
+void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta);
 void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta);
 void mt7921_mac_work(struct work_struct *work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 13263f50dc00..27906b2cd912 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -106,6 +106,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 		.rx_poll_complete = mt7921_rx_poll_complete,
 		.sta_ps = mt7921_sta_ps,
 		.sta_add = mt7921_mac_sta_add,
+		.sta_assoc = mt7921_mac_sta_assoc,
 		.sta_remove = mt7921_mac_sta_remove,
 		.update_survey = mt7921_update_channel,
 	};
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
