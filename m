Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CAEC38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EEPHIPorQ9nGaiT0HOjyRcsXyquZCZmG1NVm4BqrTE=; b=LV6xaE3ovteIfVUfTa8d5Owixv
	oNF4K6hreeLF7WbYj8M8vPfDZMcgwCYsymMHcmhj9IxuCrjGUkiRrgC8XDqVvQVXGvP6fmHXQup7u
	p0vv2O3beTnoIPWTJHArxNHQ20mrnGXhwhg27NfppSIwPpCbOp8KfL9KsbNoazHX7j6R7lfGih9KI
	zX280YHAdtTn/NJutkZ6Jc5ndhoHTdvStDvQv9LdGtqMT9H9H8NUdW9hYQSVprXPLwsiJXAoUTcn/
	mTi617Bo0TtEA6FbV/LLRF8rRQ4+0k/xX3/7zvhQGF6zEyD7xQSJx+O6MqNF7qHXWJ4KBZLI7YYi3
	Rr41HLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mi-0000000HXqv-0beA;
	Sat, 06 Jul 2024 08:28:44 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mf-0000000HXp2-3nuy
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:43 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d56102f134so192312b6e.1
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254521; x=1720859321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EEPHIPorQ9nGaiT0HOjyRcsXyquZCZmG1NVm4BqrTE=;
        b=psFCUN0JwtrX05/j542IyLpZgfiSMgpHgFvdm3+1+ipnK9Pafcj219W9Ke778QL0b4
         2kA95OngrDr9G6uo0JbXk12il3CA607FvSSnumpFwTMI7Cj8iQyHBzv5E4fm6X2v58PG
         ne+5sQkwjgYgEEUYsKkw3M57kjUgGGcE4y3AOyfdaLNlOGPsj4fTxUKigIdsXCyMOhZc
         p5JqHyo7c6HmzhNgS2kFY//vdiE+CfbQbMkeEYRNvDPIx3ZsEgv+9ojoUtONsLTiq2AE
         fZeZEsrPJv1yvOkjhQ2rni6GYnXud+bOhUvChT7sCIZz/vAcrCmVX7g7WIc3yKrKRxDf
         klJw==
X-Forwarded-Encrypted: i=1; AJvYcCVywI069IWJykjXttPqbYoVoGqRIGtj1pC4zMPVLRbbDIiHE/vTDvGMhEJgMrGkUu+zp4b8Q3zIQYPaYQohs8zpM+oYRdK19A8GG+WI8RIm5mYR
X-Gm-Message-State: AOJu0YwpGzmTgmH9EeXy/QYE85UWS0ifkxpzJFvtugDEm/wuLkejwXqV
	4TInvWtjdKKBXkywAU31o1HG50Z9IawxQewb4/gmGJs/vpXpfisw
X-Google-Smtp-Source: AGHT+IFGruGjSYGcF0rQjezfDS/4IewsUW1utrN/aXSU0wtpByTzFbu7DhEZCK82MXReCqpKT+41hg==
X-Received: by 2002:a05:6871:5229:b0:25e:dce:491b with SMTP id 586e51a60fabf-25e2b8b79abmr6843436fac.1.1720254520934;
        Sat, 06 Jul 2024 01:28:40 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:39 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 11/37] wifi: mt76: mt7925: add link handling to txwi
Date: Sat,  6 Jul 2024 01:27:51 -0700
Message-Id: <c0a7c0b33ea2640bcb4f13a5f79a8976b73fa8f2.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012841_958666_4083DE34 
X-CRM114-Status: GOOD (  12.63  )
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


