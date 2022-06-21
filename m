Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A49FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 21:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uHOtcRDuJ6Hr4qJcQ25dxSac4NZlMYdDK3wVM8Cvvc=; b=mTQG51Vk9cRQNc6e8C2Tzojv1a
	N1If5VCI3n4mZ3upH7OrQN6y4Y46NDvhzRB3gk1O0lVrXo7kyMqxgSOe13sEKy6UrtXOGlWSg4JFu
	QvcKDYY39OhuHz6cMmwU20nedaudGV9BqzESMcn0cBvIxn11E3Rkiw6FajISgHsbhCF5wzHiAH+RL
	3YWAwfJUoamxj0fvk+bXUTEbGRrYTrwgToCZNLtcPTAdmOnG/uJ7H+ftg75SWCYLBOq1LY6EMGnoj
	c5So1fJJJGWxM6QJMU602b6YEe7LMG4nxVSXynaOqaFu0YN1seSijXkfAl3o+BwTrO+p2TceRlW+s
	zuNdB00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3lFy-007Ibd-8d; Tue, 21 Jun 2022 21:17:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3lFu-007IZr-Mz
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 21:17:53 +0000
X-UUID: 2b65fa87e1c74a49b26f8a7e355250da-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:7ab2bae8-bd3d-4e14-9a3b-f57ca5364b68,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:c91f1938-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2b65fa87e1c74a49b26f8a7e355250da-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1947959210; Tue, 21 Jun 2022 14:17:45 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 14:17:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 05:17:42 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jun 2022 05:17:42 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <jemele@google.com>, <abhishekpandit@google.com>,
	<shawnku@google.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/2] mt76: mt7921: enable HW beacon filter in the initialization stage
Date: Wed, 22 Jun 2022 05:17:39 +0800
Message-ID: <d8edd12387a766e9a5c3745c5a921d5deba8fe41.1655846049.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b85224ecea092174ee901e14afd5d322744d8fd9.1655846049.git.objelf@gmail.com>
References: <b85224ecea092174ee901e14afd5d322744d8fd9.1655846049.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_141750_804758_5DE122AD 
X-CRM114-Status: GOOD (  17.35  )
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

The current driver has worked with HW beacon filter and connection
monitor all the way, here we move the enablement into the initialization
stage like other HW features being done to get rid of others are
confused why these configurations would be changed at runtime.

We still leave a way to turn off these offload features in debugfs knobs
but that is just for debugging purposes.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
rebase and apply to the latest mt76 tree
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c |  1 +
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 16 +++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  |  5 -----
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 79023992715e..29ccf58ede46 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -97,6 +97,7 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, SUPPORTS_PS);
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
+	ieee80211_hw_set(hw, CONNECTION_MONITOR);
 
 	if (dev->pm.enable)
 		ieee80211_hw_set(hw, CONNECTION_MONITOR);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 4070bedc8eae..29ff88892cae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -352,6 +352,7 @@ static int mt7921_add_interface(struct ieee80211_hw *hw,
 		mtxq->wcid = idx;
 	}
 
+	vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
 out:
 	mt7921_mutex_release(dev);
 
@@ -495,8 +496,21 @@ static void
 mt7921_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct mt7921_dev *dev = priv;
+	struct ieee80211_hw *hw = mt76_hw(dev);
+	bool pm_enable = dev->pm.enable;
+	int err;
 
-	mt7921_mcu_set_beacon_filter(dev, vif, dev->pm.enable);
+	err = mt7921_mcu_set_beacon_filter(dev, vif, pm_enable);
+	if (err < 0)
+		return;
+
+	if (pm_enable) {
+		vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
+		ieee80211_hw_set(hw, CONNECTION_MONITOR);
+	} else {
+		vif->driver_flags &= ~IEEE80211_VIF_BEACON_FILTER;
+		__clear_bit(IEEE80211_HW_CONNECTION_MONITOR, hw->flags);
+	}
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index bc434e60dfc6..69834ecbad89 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -855,7 +855,6 @@ int mt7921_mcu_set_beacon_filter(struct mt7921_dev *dev,
 				 struct ieee80211_vif *vif,
 				 bool enable)
 {
-	struct ieee80211_hw *hw = mt76_hw(dev);
 	int err;
 
 	if (enable) {
@@ -863,8 +862,6 @@ int mt7921_mcu_set_beacon_filter(struct mt7921_dev *dev,
 		if (err)
 			return err;
 
-		vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
-		ieee80211_hw_set(hw, CONNECTION_MONITOR);
 		mt76_set(dev, MT_WF_RFCR(0), MT_WF_RFCR_DROP_OTHER_BEACON);
 
 		return 0;
@@ -874,8 +871,6 @@ int mt7921_mcu_set_beacon_filter(struct mt7921_dev *dev,
 	if (err)
 		return err;
 
-	vif->driver_flags &= ~IEEE80211_VIF_BEACON_FILTER;
-	__clear_bit(IEEE80211_HW_CONNECTION_MONITOR, hw->flags);
 	mt76_clear(dev, MT_WF_RFCR(0), MT_WF_RFCR_DROP_OTHER_BEACON);
 
 	return 0;
-- 
2.25.1


