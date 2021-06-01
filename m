Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A29BC4708F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 23:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6623613AD
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 23:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6623613AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITMylLQZ6dfuXkCQL4fTV3K/DDJdvNfC6+acnH+2za0=; b=OTo64uEbs6hMDd
	AcS/3ngJAmSNSCMBWDi6FcyRna6UfjZiQxYm0gFrCX+soVdKTin2MWiaE6O7OcwdljUTZCaX/Ph6i
	fJ2M33V3d8Nwb45CTJPkYcT4qdMpjgCnAGJo/Z8hYP8O0JcQ6wmZoOxDLJ8YpvuL8hLmRnae+dbsB
	W6JpVleq/oEXKipmtlMo4Xb+4vYWUxjOWYGdhtwusZjhYRUBrrBZZkGBiMsnxV9L8C3C4ratFAT5s
	5s5iHIl0U2nnf0rqkqfsW/mqAD3msqTUuFc7uWjrIufim2xr44Zth6eINn0zJZt48cnfmNJH2U7if
	wCSM85LRSACgGCnzjSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loDpQ-001EcI-Ic; Tue, 01 Jun 2021 23:29:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loDpO-001Eap-77
 for linux-mediatek@lists.infradead.org; Tue, 01 Jun 2021 23:29:43 +0000
X-UUID: 7ca00362566243efb33d892aadfcf857-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3+7iFGrBIyOzIGVgtkh30dcfm1spxCr1xOrppSYS+N0=; 
 b=icBXoZCWi7n78v+M6/cbn6Uq4srLi4+lazwYvMnmmdY1FW+T9q4aXM1w9EC8/uKAkXixaMzO28rmAZc5IpmZiJ2djH4G7WXCQfZDqV8qxlh50KesKQLo24nwu9TT0H4n2dxET0iUXQfduOMTPI4XdXrKVrDDfHWWBSgyA9LGjaM=;
X-UUID: 7ca00362566243efb33d892aadfcf857-20210601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1402929895; Tue, 01 Jun 2021 16:29:35 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 16:29:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 07:29:32 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 07:29:32 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/3] mt76: mt7921: fix sta_state incorrect implementation
Date: Wed, 2 Jun 2021 07:29:11 +0800
Message-ID: <1c5adf766b436ded21fba935e5f45246255f5d7b.1622589640.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <37cd2b61bfeeb4fd6c14bd3eb2ff611d6b127e1a.1622589640.git.objelf@gmail.com>
References: <37cd2b61bfeeb4fd6c14bd3eb2ff611d6b127e1a.1622589640.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_162942_295642_CBBA34C1 
X-CRM114-Status: GOOD (  17.16  )
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
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 53 +++++++++----------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  1 +
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index ece0cecf049d..1b505dbc170f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -570,8 +570,8 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 		mt7921_mcu_uni_bss_ps(dev, vif);
 
 	if (changed & BSS_CHANGED_ASSOC) {
-		mt7921_mcu_sta_add(dev, NULL, vif, true,
-				   MT76_STA_INFO_STATE_3);
+		mt7921_mcu_sta_update(dev, NULL, vif,
+				      MT76_STA_INFO_STATE_3);
 		mt7921_bss_bcnft_apply(dev, vif, info->assoc);
 	}
 
@@ -618,7 +618,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	ret = mt7921_mcu_sta_add(dev, sta, vif, true,
-				 MT76_STA_INFO_STATE_3);
+				 MT76_STA_INFO_STATE_1);
 	if (ret)
 		return ret;
 
@@ -627,6 +627,27 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	return 0;
 }
 
+void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+
+	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
+
+	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
+		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
+					    true);
+
+	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
+			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+
+	mt7921_mcu_sta_update(dev, sta, vif, MT76_STA_INFO_STATE_3);
+
+	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
+}
+
 void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
@@ -781,22 +802,6 @@ mt7921_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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
@@ -811,15 +816,7 @@ static int mt7921_sta_state(struct ieee80211_hw *hw,
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
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 13d0f472b043..e97a74341ccd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -264,6 +264,8 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 		       struct ieee80211_vif *vif, bool enable, u8 state);
 int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 			  struct ieee80211_vif *vif, u8 state);
+void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta);
 int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
 int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif);
 int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
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
