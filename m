Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D94BC07E9B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27C0C61EDB
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27C0C61EDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXbHyAGJ5USL1gyJ8LBooPUJ0+kY6pJWZLwK7n9bviQ=; b=G3o27HvtaXZZwf
	FbUZqnGdm/31bGG7Z8WgxNUhV9Yv/AnR+Z0FHwzvjsiZhOPLcFnS5tykUrnsl9jwhLksWXvkj5/Um
	12Dt/Pl9NpFlf3bdtEv+PqVM0rmW/mUAu+jNoeS2M8/nXYnJQKQMxgvy8psW15iht4Typs5QE+E+o
	4LFu3J6h0Wk7UYR2Y9ROo6eHeZpKV0LfY9C4mqo+sbUFWN3YRPZOjpkdN7Z5xCrx57+AXwhlsaQqq
	BclpC2+ckKNnEIeBkCR09QJrpQbmKNn7tLGSA7P6fNRXWu/dcfXCGCFYIWNMLP7/7rdeUu6mlAl51
	XH6Ac8bmb/zCn/LgwzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jDe-00BKFm-UB; Tue, 06 Jul 2021 11:26:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j4e-00BEOV-RZ; Tue, 06 Jul 2021 11:17:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 880EB61C50;
 Tue,  6 Jul 2021 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570228;
 bh=K4AOJIFpRTGYyamlo1wY6uqNsUfHfvpWx9teuCvboKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tDrWBi3dkkH8hBdjLQULNh8+TNmAf3nSMA3Lwu/9GqIHd0OzZQnHnqOnMWqsuMIWG
 A4HeIXEnCVaKx/pNwz9zBo0lnSPGa26DHDW9RGTO5f7Bs6eSvURCKDF5tQc2FBw31M
 LQMwRV3DgY1/iOrlWiL9p7UE0UCnQa+Pz28mtS6sFWwfXskdbM/FbhOfIWKM7ik9hM
 BBRkpUfjF4Ks/r4vwlBwb7aAsYo4eNpmub49dW0TGRLft1H50DDPVzFXpW21/CcLje
 XXF7DhgO6wr5UhFCc/zEA7erk6TpXh0dZ0hnLVB8/zxD09PGuhl/3no/l/Rkc+Zi2d
 Zv2ga9gCQf9nw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 "Deren . Wu" <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 133/189] mt76: mt7921: enable hw offloading for
 wep keys
Date: Tue,  6 Jul 2021 07:13:13 -0400
Message-Id: <20210706111409.2058071-133-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_041708_963094_2811B3D5 
X-CRM114-Status: GOOD (  13.46  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit a60951d4faa0ef2e475797dd217c2eaee32ed1c2 ]

Enable wep key hw offloading for sta mode. This patch fixes
WoW support for wep connections.

Tested-by: Deren.Wu <deren.wu@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 22 ++++++++++++++-----
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 97a0ef331ac3..032122317855 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -429,6 +429,10 @@ static int mt7921_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
 		wcid_keyidx = &wcid->hw_key_idx2;
 		break;
+	case WLAN_CIPHER_SUITE_WEP40:
+	case WLAN_CIPHER_SUITE_WEP104:
+		if (!mvif->wep_sta)
+			return -EOPNOTSUPP;
 	case WLAN_CIPHER_SUITE_TKIP:
 	case WLAN_CIPHER_SUITE_CCMP:
 	case WLAN_CIPHER_SUITE_CCMP_256:
@@ -436,8 +440,6 @@ static int mt7921_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	case WLAN_CIPHER_SUITE_GCMP_256:
 	case WLAN_CIPHER_SUITE_SMS4:
 		break;
-	case WLAN_CIPHER_SUITE_WEP40:
-	case WLAN_CIPHER_SUITE_WEP104:
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -455,6 +457,12 @@ static int mt7921_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			    cmd == SET_KEY ? key : NULL);
 
 	err = mt7921_mcu_add_key(dev, vif, msta, key, cmd);
+	if (err)
+		goto out;
+
+	if (key->cipher == WLAN_CIPHER_SUITE_WEP104 ||
+	    key->cipher == WLAN_CIPHER_SUITE_WEP40)
+		err = mt7921_mcu_add_key(dev, vif, mvif->wep_sta, key, cmd);
 out:
 	mt7921_mutex_release(dev);
 
@@ -661,9 +669,12 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
-	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
-		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
-					    true);
+	if (vif->type == NL80211_IFTYPE_STATION) {
+		mvif->wep_sta = msta;
+		if (!sta->tdls)
+			mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
+						    &mvif->sta.wcid, true);
+	}
 
 	mt7921_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
@@ -693,6 +704,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
 
+		mvif->wep_sta = NULL;
 		ewma_rssi_init(&mvif->rssi);
 		if (!sta->tdls)
 			mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 03bcb210c357..434601388a6c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -100,6 +100,8 @@ struct mt7921_vif {
 	struct mt76_vif mt76; /* must be first */
 
 	struct mt7921_sta sta;
+	struct mt7921_sta *wep_sta;
+
 	struct mt7921_phy *phy;
 
 	struct ewma_rssi rssi;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
