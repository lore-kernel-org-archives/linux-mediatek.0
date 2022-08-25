Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7006EC28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 04:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3fp/5xwv376cjHNs+j3S4zFWc9y6yzeeTVroRO5+4fc=; b=22reTRfBo86WsxXCryE8bsVBzB
	s4tXBhYAb7NRmOeitSc7zr1IcFSvKEi/fv68FQqmMkaDJW9kayDmImaSdaonXPRuAZ+MIlOoCQ7mq
	j1xhIXitz/nIVip4m8v9hDUhpYtMk78B/4vQLBjA7BfOjaJpD/MM0jnTRmglfFzJoOfBQXceAeXh5
	cBBuppTfYV0xVlSrgzghWRpfgH+YODbhQkWvnaF/0fY0/8EwpTxdNw/dR+GLOQipVSgZSMo+LnvX4
	9+wl+v2/YU8IQC/cGkq/gk+yVNj2zGoGArNHOV+DjztGpUqHKmDn1UBvKi+MuRNdS7joy+cxoPC/f
	fia9jRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR4MG-006XQv-QG; Thu, 25 Aug 2022 04:20:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR4ME-006XOZ-1T
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 04:20:43 +0000
X-UUID: bc6188a8db7d41fd85ca7324c3ba6eb6-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3fp/5xwv376cjHNs+j3S4zFWc9y6yzeeTVroRO5+4fc=;
	b=bb80r28fuP73JdE9ubLTJ6J+4z5sgUvipkDsL3LBTubsDgKsPRIFSEvzECVPWQcm5dq7Bj3gYW0W5Itu+uy0ILlUMgYNQS28caSdn/tzWdjkd3KPtkabYvzkaA/oovN59aP/eYovNFnsiox+EW2+RO3JSjtSR6aYgVwx5OktDN0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:e19d7d9f-a712-4dc4-908e-b8e001fed7a7,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:cbf30a20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bc6188a8db7d41fd85ca7324c3ba6eb6-20220824
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 499375532; Wed, 24 Aug 2022 21:20:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 25 Aug 2022 12:09:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Aug 2022 12:09:58 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: reset msta->airtime_ac while clearing up hw value
Date: Thu, 25 Aug 2022 12:09:57 +0800
Message-ID: <fd716a393e20d5db89f4f9d705d6dbbfde7260a6.1661400412.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_212042_118941_3FF3F40E 
X-CRM114-Status: GOOD (  12.62  )
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

From: Sean Wang <sean.wang@mediatek.com>

We should reset mstat->airtime_ac along with clear up the entries in the
hardware WLAN table for the Rx and Rx accumulative airtime. Otherwsie, the
value msta->airtime_ac - [tx, rx]_last may be a negative and that is not
the actual airtime the device took in the last run.

Reported-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c   | 15 ++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7921/main.c  |  9 +++------
 .../net/wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 47f0aa81ab02..87dd0babff7a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -46,6 +46,14 @@ bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int idx, u32 mask)
 			 0, 5000);
 }
 
+void mt7921_mac_sta_airtime_clear(struct mt7921_dev *dev,
+				  struct mt7921_sta *msta)
+{
+	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
+			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
+}
+
 void mt7921_mac_sta_poll(struct mt7921_dev *dev)
 {
 	static const u8 ac_to_tid[] = {
@@ -100,11 +108,8 @@ void mt7921_mac_sta_poll(struct mt7921_dev *dev)
 			addr += 8;
 		}
 
-		if (clear) {
-			mt7921_mac_wtbl_update(dev, idx,
-					       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-			memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
-		}
+		if (clear)
+			mt7921_mac_sta_airtime_clear(dev, msta);
 
 		if (!msta->wcid.sta)
 			continue;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 1438a9f8d1fd..9d70884e24af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -723,8 +723,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (vif->type == NL80211_IFTYPE_STATION)
 		mvif->wep_sta = msta;
 
-	mt7921_mac_wtbl_update(dev, idx,
-			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	mt7921_mac_sta_airtime_clear(dev, msta);
 
 	ret = mt7921_mcu_sta_update(dev, sta, vif, true,
 				    MT76_STA_INFO_STATE_NONE);
@@ -750,8 +749,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
 					    true);
 
-	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
-			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	mt7921_mac_sta_airtime_clear(dev, msta);
 
 	mt7921_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
 
@@ -769,8 +767,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
 	mt7921_mcu_sta_update(dev, sta, vif, false, MT76_STA_INFO_STATE_NONE);
-	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
-			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	mt7921_mac_sta_airtime_clear(dev, msta);
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index c161031ac62a..8b704d08509d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -362,6 +362,8 @@ void mt7921_stop(struct ieee80211_hw *hw);
 int mt7921_mac_init(struct mt7921_dev *dev);
 bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int idx, u32 mask);
 void mt7921_mac_reset_counters(struct mt7921_phy *phy);
+void mt7921_mac_sta_airtime_clear(struct mt7921_dev *dev,
+				  struct mt7921_sta *msta);
 void mt7921_mac_set_timing(struct mt7921_phy *phy);
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta);
-- 
2.25.1


