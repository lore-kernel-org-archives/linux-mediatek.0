Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 09:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3Mv3AGx4HkYUWn1OLFGsI12pWB4a+pLqCtQ/yPLQBM=; b=kuGajt1QgZPQJK
	f3rxHQm4Ie2mYmXAdSNpC25IVEfi+y6QQcIxF2VfcUvpY8r1ZjSrDJu8DdUfZhenzmFuB3tXWA1GB
	H+AaosICYc7IqiS1t9k8H+PxasWus56cvTWmDUMbIPAfY2Kg47dljJV9Qx+HJiBPx1Ox+XfTyukv3
	IkBCg8H4HkquDwk/aNAqqZrNzE17103l1GbqEzUhP3Zw+OTci0ZDrHIbIQ/jqFu1u2vcme44VveCo
	d9YxxmrPkwBR7QsZmFQ7A275J5dKHXW2GKl1i1T0U8fW/1djY9omTWKGqhbE/T1yTPCD7hIMIhnTg
	12dxUypBAv08L71ZDF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nryYi-00BRh1-LW; Fri, 20 May 2022 09:04:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nryYL-00BRXG-03
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:04:10 +0000
X-UUID: 62aec1cace124fe287a553e835ddda28-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:218ca995-0c56-42da-ae9b-6f953ddc8d85, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:ac16ff79-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 62aec1cace124fe287a553e835ddda28-20220520
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 679077620; Fri, 20 May 2022 02:04:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 02:04:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 17:04:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 20 May 2022 17:04:03 +0800
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
Subject: [PATCH v2 3/3] mt76: mt7921: introduce ACPI SAR config in tx power
Date: Fri, 20 May 2022 17:03:39 +0800
Message-ID: <777ef51ddf8d871b16a634c8e220787b2e8a7e01.1653032296.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1653032296.git.deren.wu@mediatek.com>
References: <cover.1653032296.git.deren.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_020409_098222_B5BCF498 
X-CRM114-Status: GOOD (  14.58  )
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
.set_sar_specs and ACPI setting. Both settings would be merged into
mt76_freq_range_power for final tx power value.

Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  3 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 31 +++++++++++++------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 0c4e973d002e..48a10aaecc62 100644
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
index 80279f342109..acf6567368b7 100644
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
@@ -1469,20 +1469,33 @@ static void mt7921_ipv6_addr_change(struct ieee80211_hw *hw,
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
+	mt7921_init_acpi_sar_power(mt7921_hw_phy(hw), !sar);
+
+	err = mt76_connac_mcu_set_rate_txpower(mphy);
+
+	return err;
+}
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
index 8b26bece28ae..d9fc457e420d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -501,4 +501,6 @@ mt7921_init_acpi_sar_power(struct mt7921_phy *phy, bool set_default)
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
