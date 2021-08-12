Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67495C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 21:15:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D06960FED
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 21:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D06960FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OPzD367eApV6p6TEF6P1kgMM8e+rYVjE+PIqFjfnPtY=; b=HGNDq2HWjJlF3H
	tQOo5o3NxHMbOEU/aOedsWtB1oJN9zAdCUcLWnfQH7FMlZTSM9zi5Opf3L/epEfcSt4JfMes+8NON
	XfqRDQ31SeyJMHCJn/jVmsldcp+rbsmtBFfqe0jweAJviFn/jorxfwezciwcd1w7eYKAykFG3BCCC
	W4bxGNvc8P1AJGetG8EDI9kzxOCK3iQZBNAT10TpKGgez0kdyyJ8PQrOICNw7LpjtPez5rlTVMXtE
	Cs/No/KkGTx523Q+c4ocrqoPQyW3BmQBcVDeCirK9VHdhsAEw3e3tLOmE8gQN8tVk8o7NcmZarHLi
	B0zHZuXw/7NEYwjcym8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEI2P-00BNI3-Pw; Thu, 12 Aug 2021 21:14:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEI27-00BN8n-J5
 for linux-mediatek@lists.infradead.org; Thu, 12 Aug 2021 21:14:42 +0000
X-UUID: ffe251f620554b3cb9498e40039247f1-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Q3wSjYfIPVsua17MYPmBTf7hN0v13naMU6o3IkirnHc=; 
 b=AZJ1LlBiaxYTLgP6lGVZhQYIAC/0yVaJdhNLmft8TJQgEw3s6wHowtSpIgiEUJuxz2wZEctdznlj6sDNinYj2HPrVCy51v+ztrN8EUng5YQkdrWK8GDAiE3mFVLHfBrvuA8xHjndI3HxRr0u3xfn39wibMFyoW10N8cP3hYDgf4=;
X-UUID: ffe251f620554b3cb9498e40039247f1-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1529600089; Thu, 12 Aug 2021 14:14:31 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 14:04:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 05:04:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 13 Aug 2021 05:04:27 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] mt76: mt7915: remove mt7915_mcu_add_he()
Date: Fri, 13 Aug 2021 05:04:24 +0800
Message-ID: <1c3fc7ff6d5ab129a58160cd878787d9fbeba9c2.1628799602.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_141437_149439_4D97DA91 
X-CRM114-Status: GOOD (  12.11  )
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

Make mt7915_mcu_sta_he_tlv() as a part of mt7915_mcu_add_rate_ctrl() as
firmware rate control should get HE rate information from sta_rec_he.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  6 +--
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 45 +++++++------------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +-
 3 files changed, 19 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 667ccb2dab78..5349736eac73 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1933,10 +1933,8 @@ void mt7915_mac_sta_rc_work(struct work_struct *work)
 
 		if (changed & (IEEE80211_RC_SUPP_RATES_CHANGED |
 			       IEEE80211_RC_NSS_CHANGED |
-			       IEEE80211_RC_BW_CHANGED)) {
-			mt7915_mcu_add_he(dev, vif, sta);
-			mt7915_mcu_add_rate_ctrl(dev, vif, sta);
-		}
+			       IEEE80211_RC_BW_CHANGED))
+			mt7915_mcu_add_rate_ctrl(dev, vif, sta, true);
 
 		if (changed & IEEE80211_RC_SMPS_CHANGED)
 			mt7915_mcu_add_smps(dev, vif, sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 030d6fba59e9..028ee5bb0532 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2141,41 +2141,27 @@ mt7915_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7915_dev *dev,
 }
 
 int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-			     struct ieee80211_sta *sta)
-{
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct sk_buff *skb;
-	int len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_ra);
-
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
-
-	mt7915_mcu_sta_rate_ctrl_tlv(skb, dev, vif, sta);
-
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				     MCU_EXT_CMD(STA_REC_UPDATE), true);
-}
-
-int mt7915_mcu_add_he(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		      struct ieee80211_sta *sta)
+			     struct ieee80211_sta *sta, bool changed)
 {
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct sk_buff *skb;
 	int len;
 
-	if (!sta->he_cap.has_he)
-		return 0;
-
-	len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_he);
-
+	len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_ra) +
+	      sizeof(struct sta_rec_he);
 	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt7915_mcu_sta_he_tlv(skb, sta);
+	/* firmware rate control algorithm refers to sta_rec_he for HE rate
+	 * control, so when dev->rc_work changes the settings driver should
+	 * update sta_rec_he here as well.
+	 */
+	if (sta->he_cap.has_he && changed)
+		mt7915_mcu_sta_he_tlv(skb, sta);
+
+	mt7915_mcu_sta_rate_ctrl_tlv(skb, dev, vif, sta);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_EXT_CMD(STA_REC_UPDATE), true);
@@ -2214,7 +2200,7 @@ mt7915_mcu_add_mu(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct sk_buff *skb;
-	int ret;
+	int len, ret;
 
 	if (!sta->vht_cap.vht_supported && !sta->he_cap.has_he)
 		return 0;
@@ -2223,8 +2209,9 @@ mt7915_mcu_add_mu(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
-				       MT7915_STA_UPDATE_MAX_SIZE);
+	len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_muru) +
+	      sizeof(struct sta_rec_vht);
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
@@ -2256,7 +2243,7 @@ int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
-	return mt7915_mcu_add_rate_ctrl(dev, vif, sta);
+	return mt7915_mcu_add_rate_ctrl(dev, vif, sta, false);
 }
 
 int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 1f5065ed6a59..f842452af897 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -324,9 +324,7 @@ int mt7915_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 int mt7915_mcu_add_obss_spr(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			    bool enable);
 int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-			     struct ieee80211_sta *sta);
-int mt7915_mcu_add_he(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		      struct ieee80211_sta *sta);
+			     struct ieee80211_sta *sta, bool changed);
 int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta);
 int mt7915_set_channel(struct mt7915_phy *phy);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
