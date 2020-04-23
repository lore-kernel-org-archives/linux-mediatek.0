Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C448C54FCB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 13:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED4720728
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 13:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+7B0StG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qL+VPjE1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED4720728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B++4hs3mzHmqzLMX2tNxmz6naW+n4h8rvL3hYcMX+nA=; b=P+7B0StGKRbirD
	BE3TH4PGP/bpnFUljSK/cghMj7EuQrY3VNAkksKLnIBp0iXttbvExn+6Th4C9VgrvuXjNMOBg2sus
	18+MhGBludlvjRxjrizXSnKDvfbEbs2jJ41iY/pP2QG4L/+V0QTi9qMyymHCDhansJntzIkuCYSZS
	duZep/FNH+oaxkvD+F1nLb0dw+z2zVFgLhRv9eczc3C9ZIFVucmAMn+qfqd4ZT7R+j7Oerlsi4PSm
	SeEoN4ScG6mBFOK/VR2SSRRLFviwnuSCGAAdp13ibTPMF7NQCYMmfN68zRLzkDS0RPSjmHehMoMAV
	BsWYHio7nNgLTfftSbxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRcDB-0005w9-BX; Thu, 23 Apr 2020 13:48:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRcD8-0005t1-4H
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 13:48:15 +0000
Received: from localhost.localdomain.com (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B34192076C;
 Thu, 23 Apr 2020 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587649693;
 bh=iw8EfmZBWazAatB2Y0n5f947DJsp8BlS3zq6mPbpOQs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qL+VPjE1ecAXt1WLEtIFd6vQZaLz/c+I6YzDY/eP6Nk3rK8XJYWLO1AgpVpxmg+DZ
 qx6k1RI2tjCl/9vPt/KOqZ83saQ0nEyxiPTtlzPgeJyfVRlA2UItAcbceRZN9Cog6l
 IN6ycfN6OcG1aYA3lYDUC5iMyD4yPigOcHuGH0p8=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 2/2] mt76: mt7615: add sta pointer to mt7615_mcu_add_bss_info
 signature
Date: Thu, 23 Apr 2020 15:47:55 +0200
Message-Id: <2212261065eabbfae60d9c50e4ade0f3649d171b.1587649519.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <cover.1587649519.git.lorenzo@kernel.org>
References: <cover.1587649519.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_064814_204074_BE1D66D0 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce sta pointer to mt7615_mcu_add_bss_info signature in order to
avoid sta lookup in mt7615_mcu_bss_basic_tlv routine

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  6 +++---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 21 ++++++-------------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 +-
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index c69d73bb0065..ccc52626da80 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -501,7 +501,7 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
-		mt7615_mcu_add_bss_info(phy, vif, info->enable_beacon);
+		mt7615_mcu_add_bss_info(phy, vif, NULL, info->enable_beacon);
 		mt7615_mcu_sta_add(dev, vif, NULL, info->enable_beacon);
 	}
 
@@ -546,7 +546,7 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		struct mt7615_phy *phy;
 
 		phy = mvif->band_idx ? mt7615_ext_phy(dev) : &dev->phy;
-		mt7615_mcu_add_bss_info(phy, vif, true);
+		mt7615_mcu_add_bss_info(phy, vif, sta, true);
 	}
 	mt7615_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
@@ -570,7 +570,7 @@ void mt7615_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		struct mt7615_phy *phy;
 
 		phy = mvif->band_idx ? mt7615_ext_phy(dev) : &dev->phy;
-		mt7615_mcu_add_bss_info(phy, vif, false);
+		mt7615_mcu_add_bss_info(phy, vif, sta, false);
 	}
 
 	spin_lock_bh(&dev->sta_poll_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 5064f7c45a44..386488f007f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -689,7 +689,7 @@ mt7615_mcu_add_tlv(struct sk_buff *skb, int tag, int len)
 
 static int
 mt7615_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
-			 bool enable)
+			 struct ieee80211_sta *sta, bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct bss_info_basic *bss;
@@ -705,20 +705,11 @@ mt7615_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 		break;
 	case NL80211_IFTYPE_STATION:
 		/* TODO: enable BSS_INFO_UAPSD & BSS_INFO_PM */
-		if (enable) {
-			struct ieee80211_sta *sta;
+		if (enable && sta) {
 			struct mt7615_sta *msta;
 
-			rcu_read_lock();
-			sta = ieee80211_find_sta(vif, vif->bss_conf.bssid);
-			if (!sta) {
-				rcu_read_unlock();
-				return -EINVAL;
-			}
-
 			msta = (struct mt7615_sta *)sta->drv_priv;
 			wlan_idx = msta->wcid.idx;
-			rcu_read_unlock();
 		}
 		break;
 	case NL80211_IFTYPE_ADHOC:
@@ -1038,7 +1029,7 @@ mt7615_mcu_wtbl_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 
 static int
 mt7615_mcu_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
-		   bool enable)
+		   struct ieee80211_sta *sta, bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt7615_dev *dev = phy->dev;
@@ -1051,7 +1042,7 @@ mt7615_mcu_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	if (enable)
 		mt7615_mcu_bss_omac_tlv(skb, vif);
 
-	mt7615_mcu_bss_basic_tlv(skb, vif, enable);
+	mt7615_mcu_bss_basic_tlv(skb, vif, sta, enable);
 
 	if (enable && mvif->omac_idx > EXT_BSSID_START)
 		mt7615_mcu_bss_ext_tlv(skb, mvif);
@@ -1316,8 +1307,8 @@ mt7615_mcu_uni_ctrl_pm_state(struct mt7615_dev *dev, int band, int state)
 }
 
 static int
-mt7615_mcu_uni_add_bss(struct mt7615_phy *phy,
-		       struct ieee80211_vif *vif, bool enable)
+mt7615_mcu_uni_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta, bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index a8393cd3c0b2..0ed80b31e4e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -222,7 +222,7 @@ struct mt7615_mcu_ops {
 	int (*add_dev_info)(struct mt7615_dev *dev,
 			    struct ieee80211_vif *vif, bool enable);
 	int (*add_bss_info)(struct mt7615_phy *phy, struct ieee80211_vif *vif,
-			    bool enable);
+			    struct ieee80211_sta *sta, bool enable);
 	int (*add_beacon_offload)(struct mt7615_dev *dev,
 				  struct ieee80211_hw *hw,
 				  struct ieee80211_vif *vif, bool enable);
-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
