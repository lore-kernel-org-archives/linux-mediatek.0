Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaZDh6j0O4wKnmQH+OJBV3nid8FcIPj9nyhbXtu3IqQ=; b=dZv7jR8LU9j6kK
	aFu6WhtFYcunNpnbncB23LNhdv9TQZmVA77PcfBpcvZGD438Gm7At04rak189lMhaPaGXF6dbX1xQ
	jisWuUHrZVmThJiCuBTjhO6p00dNbkQwePacXnNY2TYeja7j3u6beeFU6OZSRnDnAyx79UIdrFehA
	ieYe27fwKRTP9+KsrqB1IoMtJQnXYwv7sG1r19y44B3eCByVRcBb8b/HLxksLeVKOOgVd02hm+3Pw
	3nI+s169y/f8B1JrIjbgVSMTFC/P8oX5rutAZNqUby90zL+nb8+Oe1JtRUW9Q27wLhB4yj4S0dOtR
	ssQbeJO1SQg0/BUwfTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrZyK-005Mcj-Ku; Thu, 19 May 2022 06:49:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrZyH-005Max-DZ
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 06:49:18 +0000
X-UUID: 55212f15267842ee971a7d1dde89ca00-20220518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:a06be7cc-a13b-48de-be94-13502c9bbb5a, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:964dd379-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 55212f15267842ee971a7d1dde89ca00-20220518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1555430613; Wed, 18 May 2022 23:49:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 23:39:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 14:39:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 May 2022 14:39:09 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, "Ming
 Yen Hsieh" <mingyen.hsieh@mediatek.com>
Subject: [PATCH 3/3] mt76: mt7921: introduce BIOS SAR config in tx power
Date: Thu, 19 May 2022 14:38:24 +0800
Message-ID: <2e6b69a763d60897639101506e39a2b1a81d8eab.1652941276.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1652941276.git.deren.wu@mediatek.com>
References: <cover.1652941276.git.deren.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_234917_506831_981DFC12 
X-CRM114-Status: GOOD (  14.32  )
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

From: Deren Wu <deren.wu@mediatek.com>

Add new function mt7921_set_tx_sar_pwr() to update SAR power from
.set_sar_specs and BIOS setting. Both settings would be merged into
mt76_freq_range_power for final tx power value.

Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  3 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 32 +++++++++++++------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index ae406f1b31a0..4043c81bfbca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -34,14 +34,13 @@ mt7921_regd_notifier(struct wiphy *wiphy,
 {
 	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
-	struct mt7921_phy *phy = mt7921_hw_phy(hw);
 
 	memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
 	dev->mt76.region = request->dfs_region;
 
 	mt7921_mutex_acquire(dev);
 	mt76_connac_mcu_set_channel_domain(hw->priv);
-	mt76_connac_mcu_set_rate_txpower(phy->mt76);
+	mt7921_set_tx_sar_pwr(hw, NULL);
 	mt7921_mutex_release(dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 80279f342109..c86d8805f291 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -257,7 +257,7 @@ int __mt7921_start(struct mt7921_phy *phy)
 	if (err)
 		return err;
 
-	err = mt76_connac_mcu_set_rate_txpower(phy->mt76);
+	err = mt7921_set_tx_sar_pwr(mphy->hw, NULL);
 	if (err)
 		return err;
 
@@ -548,7 +548,7 @@ static int mt7921_config(struct ieee80211_hw *hw, u32 changed)
 	mt7921_mutex_acquire(dev);
 
 	if (changed & IEEE80211_CONF_CHANGE_POWER) {
-		ret = mt76_connac_mcu_set_rate_txpower(phy->mt76);
+		ret = mt7921_set_tx_sar_pwr(hw, NULL);
 		if (ret)
 			goto out;
 	}
@@ -1469,20 +1469,34 @@ static void mt7921_ipv6_addr_change(struct ieee80211_hw *hw,
 }
 #endif
 
+int mt7921_set_tx_sar_pwr(struct ieee80211_hw *hw,
+			  const struct cfg80211_sar_specs *sar)
+{
+	struct mt76_phy *mphy = hw->priv;
+	int err;
+
+	if (sar) {
+		err = mt76_init_sar_power(hw, sar);
+		if (err)
+			return err;
+	}
+
+	mt7921_init_bios_sar_power(mt7921_hw_phy(hw), !sar);
+
+	err = mt76_connac_mcu_set_rate_txpower(mphy);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mt7921_set_tx_sar_pwr);
+
 static int mt7921_set_sar_specs(struct ieee80211_hw *hw,
 				const struct cfg80211_sar_specs *sar)
 {
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
-	struct mt76_phy *mphy = hw->priv;
 	int err;
 
 	mt7921_mutex_acquire(dev);
-	err = mt76_init_sar_power(hw, sar);
-	if (err)
-		goto out;
-
-	err = mt76_connac_mcu_set_rate_txpower(mphy);
-out:
+	err = mt7921_set_tx_sar_pwr(hw, sar);
 	mt7921_mutex_release(dev);
 
 	return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index e5d541291919..a63c4848ced4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -501,4 +501,6 @@ mt7921_init_bios_sar_power(struct mt7921_phy *phy, bool set_default)
 	return 0;
 }
 #endif
+int mt7921_set_tx_sar_pwr(struct ieee80211_hw *hw,
+			  const struct cfg80211_sar_specs *sar);
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
