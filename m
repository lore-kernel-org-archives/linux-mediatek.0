Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D84C31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EEPHIPorQ9nGaiT0HOjyRcsXyquZCZmG1NVm4BqrTE=; b=CmFIQgCtb4oZYAqpubt9yTG8LO
	Gv/NjIr+P28QwXDCJA3Es8+bZt7qcHuRqU98Cc9V0UaZvsnKjqL6hCS/ETySe/hyFOf37yBxfszQK
	GcAwac7vI2YV0PB8T27VoIGLwhyxbDAFjbTY61FFUOYWsfY4ciPZHjj2sMnTBLNy+FZdVEna+426W
	cUNFctm8JINnDs4gb2safDRVJPxC8ZC/hyJzo0+Ud/qKG8u1YH6lnqQFLXkDoP3KmWMbS00LLKKaP
	9JmwVKXfewd8t+Q9w07LfBXzcVGp5QIv2iCu/psW2dPecMoxNHvv8PqFDSOGAHTu+EcrnL8MN4blI
	p/K8dUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ky-0000000BX96-1RjC;
	Wed, 03 Jul 2024 21:43:16 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kw-0000000BX7r-1brq
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:15 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-25e19ad0050so9207fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042993; x=1720647793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EEPHIPorQ9nGaiT0HOjyRcsXyquZCZmG1NVm4BqrTE=;
        b=P8Jx1o5CSWdW0BCmNUoSnVgJMVEgzH1SsKJrF9KOOZi7xexNx3iGb5ZQjculdbNtnX
         iLiSOd2y9T+NzCfJbOn6UPAiinZsduxKJ9/XPbM9bSiyyYSkW6GVhbqkWm7EKWx85FAq
         KNXpdSm40kP0QFhb48KOqCpdGgpWITt9Hs1N9ES2jrmn5BZlrvcUCKdJhJAz65YkSrnj
         A2/SYX9BiNA+i5iePjhfamoMdMbe2L25cOD/mJB2aQzetOUZOHdCeyl/xOsuHebfOjU2
         wUrtPFfvUWPS/cChQtA10016qv1nOKgXqgNTAKOd0JiB2zyT5by//vKdY371JJ5kOze0
         KKLA==
X-Forwarded-Encrypted: i=1; AJvYcCV26CzV/h7iXx6xwNtVyZwlbMYXnU6VePIy4aasU7pYixVdEifaHaEhdwFdP/n3JzGJfU1e3LNY+0zZwdkcMNPQZN6zCjhHOXRic7X99nLTfwjj
X-Gm-Message-State: AOJu0YxAOPcXR8P99kqih+tBCW0Gp5vix61yRXRvqR9FCOeK61kB2G/9
	avJ9eD4PEOo9261xXJ68q+eDhSnFGlqsrsmV6RALBmKawyhcrpEs
X-Google-Smtp-Source: AGHT+IHggK4Kg30dd8NLdj3jI1DxXMyqkfqDw4O6ut1WvmHHhY2tP43NFyj/9iepNGjGPUI4kHOJCg==
X-Received: by 2002:a9d:5c89:0:b0:701:f366:71d7 with SMTP id 46e09a7af769-7020767ab30mr12877738a34.1.1720042993253;
        Wed, 03 Jul 2024 14:43:13 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:12 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 11/29] wifi: mt76: mt7925: add link handling to txwi
Date: Wed,  3 Jul 2024 14:42:16 -0700
Message-Id: <c2b4cb1e721425d71282df5b750c580452042d56.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144314_450921_AC429DAB 
X-CRM114-Status: GOOD (  13.09  )
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

add link handling to mt792x_tx and writing txwi.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 12 ++++++---
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 26 +++++++++++++++++--
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 2be2ab914411..6f5f2130420e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -740,8 +740,12 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 				    BSS_CHANGED_BEACON_ENABLED));
 	bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
 					 BSS_CHANGED_FILS_DISCOVERY));
+	struct mt792x_bss_conf *mconf;
+
+	mconf = vif ? mt792x_vif_to_link((struct mt792x_vif *)vif->drv_priv,
+					 wcid->link_id) : NULL;
+	mvif = mconf ? (struct mt76_vif *)&mconf->mt76 : NULL;
 
-	mvif = vif ? (struct mt76_vif *)vif->drv_priv : NULL;
 	if (mvif) {
 		omac_idx = mvif->omac_idx;
 		wmm_idx = mvif->wmm_idx;
@@ -802,8 +806,10 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 
 	txwi[5] = cpu_to_le32(val);
 
-	val = MT_TXD6_DIS_MAT | MT_TXD6_DAS |
-	      FIELD_PREP(MT_TXD6_MSDU_CNT, 1);
+	val = MT_TXD6_DAS | FIELD_PREP(MT_TXD6_MSDU_CNT, 1);
+	if (!ieee80211_vif_is_mld(vif) ||
+	    (q_idx >= MT_LMAC_ALTX0 && q_idx <= MT_LMAC_BCN0))
+		val |= MT_TXD6_DIS_MAT;
 	txwi[6] = cpu_to_le32(val);
 	txwi[7] = 0;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 62f471b5498f..ae2ac146a7f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -59,13 +59,17 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
 	struct mt76_wcid *wcid = &dev->mt76.global_wcid;
+	u8 link_id;
 	int qid;
 
 	if (control->sta) {
+		struct mt792x_link_sta *mlink;
 		struct mt792x_sta *sta;
-
+		link_id = u32_get_bits(info->control.flags,
+				       IEEE80211_TX_CTRL_MLO_LINK);
 		sta = (struct mt792x_sta *)control->sta->drv_priv;
-		wcid = &sta->deflink.wcid;
+		mlink = mt792x_sta_to_link(sta, link_id);
+		wcid = &mlink->wcid;
 	}
 
 	if (vif && !control->sta) {
@@ -75,6 +79,24 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		wcid = &mvif->sta.deflink.wcid;
 	}
 
+	if (vif && control->sta && ieee80211_vif_is_mld(vif)) {
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+		struct ieee80211_link_sta *link_sta;
+		struct ieee80211_bss_conf *conf;
+
+		link_id = wcid->link_id;
+		rcu_read_lock();
+		conf = rcu_dereference(vif->link_conf[link_id]);
+		memcpy(hdr->addr2, conf->addr, ETH_ALEN);
+
+		link_sta = rcu_dereference(control->sta->link[link_id]);
+		memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
+
+		if (vif->type == NL80211_IFTYPE_STATION)
+			memcpy(hdr->addr3, conf->bssid, ETH_ALEN);
+		rcu_read_unlock();
+	}
+
 	if (mt76_connac_pm_ref(mphy, &dev->pm)) {
 		mt76_tx(mphy, control->sta, wcid, skb);
 		mt76_connac_pm_unref(mphy, &dev->pm);
-- 
2.25.1


