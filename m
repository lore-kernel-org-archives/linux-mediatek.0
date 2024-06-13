Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1D0C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdsOWdunEX8Yk5T3pweRV+cWYeKKmyqWhAt3rUAD9qE=; b=hF5mXFWYM3FVJLBuaHHQXq6mxl
	eKFLAfIGbP7476frjAomYUVMjcs1JVc+9oUtbpOEzCRF69cCo6wFJ7RpkvZdJOz0Jrc0M/ImDoEeW
	NW1CjzCpKNAprv2lSvNW6fDYLzpSWzyeaH5fjB09bPSLf2gkEEr95NYZlaog1+f8+7XIAD3vRqopB
	mnTkfDdFWxT3WacGjQyEih6NR0+3kQePqME/4zs23/yCp3WsCWTENrF7DFptQ5rCQD3nPGkYh14Rm
	2WhrMMhAL0rsMqk82Xrs8wln815rXoJgEfZnyxBtCj6rMdbLBNPE2rXqNkIDYxq9FdHhogG6NYk2o
	JzlsvK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal2-0000000EwHc-2a61;
	Thu, 13 Jun 2024 03:04:12 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakv-0000000EwBq-28bP
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:10 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5bad97708efso31452eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247844; x=1718852644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdsOWdunEX8Yk5T3pweRV+cWYeKKmyqWhAt3rUAD9qE=;
        b=hwcL3IiyWvCIlWkb/vx+btS9Cu0xx810l3y6e2XGL4yS8aKuSPy7kNIouZ1+uGPeQO
         SI6PxhcN99y16eC1Zk6Jh7R9Njj7eEzhTRS2IZh4np3SBtJy8j6WrOodlcrpNs2WgQYa
         xxgHewoIE0jNODkAEw0VT9XsOFgzQ0Iq7S/ojNeV9Mqbbbvpy21ULcMayTYjaPBsiCD0
         6J9u/uF6UC4DDe8+0js9K4gcKcrTkPrV1kvTkOts+E8iXVP/8w7C5uEfnoA9V9mv1EDC
         GY0gI/Xui19bTlnlFyuoUujz+JgCO3vKliYhmB/e6FeV+rxkmiuCvvtCmKNmznZkQ429
         TNgw==
X-Forwarded-Encrypted: i=1; AJvYcCWnWUPsZ/Bbr3VT+1CrNF5W7gl8DMlnl0ar6UBE+ifLNxht05tQPab9yhSUF79qxf1I5YzTJMce4W4HtR5o9h15sVkEUnaPY3kHRYY7HO/MOSuG
X-Gm-Message-State: AOJu0YztlCb71536g0AwhfgAtB4CHbOcKA6hPkwiLW24ZmpmQHxYokNa
	2ctDJsAdkEv2VTP3WNpLm11izJlg31DeZG2KCzuJS2rvHAFtstm27wrCC6TOs2E=
X-Google-Smtp-Source: AGHT+IF+ml4MUeGV/i5XQwGw5xQ+DdY5QC2s4B4v6GTVWptW20U5JH/pw2wtkJ+TOE2Qar4pevwQ5A==
X-Received: by 2002:a4a:3101:0:b0:5ba:ca8a:6598 with SMTP id 006d021491bc7-5bb3b7b972bmr3908348eaf.0.1718247844497;
        Wed, 12 Jun 2024 20:04:04 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:02 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 37/47] wifi: mt76: mt762x:  extend mt76_connac_mcu_sta_basic_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:31 -0700
Message-Id: <20240613030241.5771-38-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200406_017396_E3A28DD1 
X-CRM114-Status: GOOD (  14.36  )
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

Extend mt76_connac_mcu_sta_basic_tlv with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c |  4 ++--
 .../wireless/mediatek/mt76/mt76_connac_mcu.c    | 17 +++++++++--------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h    |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c |  2 +-
 6 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 792ae41f7c69..25670eeaecb4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -861,8 +861,8 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 		else
 			mvif->sta_added = true;
 	}
-	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, sskb, vif, sta, enable,
-				      new_entry);
+	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, sskb, vif, &sta->deflink,
+				      enable, new_entry);
 	if (enable && sta)
 		mt76_connac_mcu_sta_tlv(phy->mt76, sskb, sta, vif, 0,
 					MT76_STA_INFO_STATE_ASSOC);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 294f79ab7ca6..b8ad080ad2c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -370,7 +370,7 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_bss_omac_tlv);
 
 void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				   struct ieee80211_vif *vif,
-				   struct ieee80211_sta *sta,
+				   struct ieee80211_link_sta *link_sta,
 				   bool enable, bool newly)
 {
 	struct sta_rec_basic *basic;
@@ -390,7 +390,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		basic->conn_state = CONN_STATE_DISCONNECT;
 	}
 
-	if (!sta) {
+	if (!link_sta) {
 		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_BC);
 		eth_broadcast_addr(basic->peer_addr);
 		return;
@@ -404,7 +404,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		else
 			conn_type = CONNECTION_INFRA_STA;
 		basic->conn_type = cpu_to_le32(conn_type);
-		basic->aid = cpu_to_le16(sta->aid);
+		basic->aid = cpu_to_le16(link_sta->sta->aid);
 		break;
 	case NL80211_IFTYPE_STATION:
 		if (vif->p2p && !is_mt7921(dev))
@@ -416,15 +416,15 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		break;
 	case NL80211_IFTYPE_ADHOC:
 		basic->conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
-		basic->aid = cpu_to_le16(sta->aid);
+		basic->aid = cpu_to_le16(link_sta->sta->aid);
 		break;
 	default:
 		WARN_ON(1);
 		break;
 	}
 
-	memcpy(basic->peer_addr, sta->addr, ETH_ALEN);
-	basic->qos = sta->wme;
+	memcpy(basic->peer_addr, link_sta->addr, ETH_ALEN);
+	basic->qos = link_sta->sta->wme;
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_sta_basic_tlv);
 
@@ -1049,8 +1049,9 @@ int mt76_connac_mcu_sta_cmd(struct mt76_phy *phy,
 		return PTR_ERR(skb);
 
 	if (info->sta || !info->offload_fw)
-		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif, info->sta,
-					      info->enable, info->newly);
+		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
+					      &info->sta->deflink, info->enable,
+					      info->newly);
 	if (info->sta && info->enable)
 		mt76_connac_mcu_sta_tlv(phy, skb, info->sta,
 					info->vif, info->rcpi,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 2c939468d141..4857c31cfb23 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1879,8 +1879,8 @@ int mt76_connac_mcu_set_channel_domain(struct mt76_phy *phy);
 int mt76_connac_mcu_set_vif_ps(struct mt76_dev *dev, struct ieee80211_vif *vif);
 void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				   struct ieee80211_vif *vif,
-				   struct ieee80211_sta *sta, bool enable,
-				   bool newly);
+				   struct ieee80211_link_sta *link_sta,
+				   bool enable, bool newly);
 void mt76_connac_mcu_wtbl_generic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_sta *sta, void *sta_wtbl,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 0f50c6659802..7204866437ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1668,7 +1668,7 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		return PTR_ERR(skb);
 
 	/* starec basic */
-	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, skb, vif, sta, enable,
+	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, skb, vif, &sta->deflink, enable,
 				      !rcu_access_pointer(dev->mt76.wcid[msta->wcid.idx]));
 	if (!enable)
 		goto out;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 321a164a6e14..5a40979c0bba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1645,7 +1645,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 
 	if (info->link_sta || !info->offload_fw)
 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
-					      info->link_sta->sta,
+					      info->link_sta,
 					      info->enable, info->newly);
 	if (info->link_sta && info->enable) {
 		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index f4c59eafb537..038c4a140ec8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2152,7 +2152,7 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		return PTR_ERR(skb);
 
 	/* starec basic */
-	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, skb, vif, sta, enable,
+	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, skb, vif, &sta->deflink, enable,
 				      !rcu_access_pointer(dev->mt76.wcid[msta->wcid.idx]));
 	if (!enable)
 		goto out;
-- 
2.34.1


