Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1067BC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtG0qWg5QbR5VYZF/R9pSkSDu8jWaNi65JIbi2fadJs=; b=tyFEnJX8fFlXsKD37jfRAAjItX
	4ulcpmdSpg2v1q5pMfnLyaJyoYGt6UsCYSMHbUWIjRoJ56vVlR1Jb1Fod8pCqnNsOkpcpHvTfyxPf
	x2SIbLjL9haTfr5WxB9CLbcDnScDEFP3VTum19LwbRKlO1CtRDHjRxvU0a9/t393u3KCeT7JhpvEL
	JlBbBPZRkut3G88miJvxC2wVAwKfB3o+CbJC+RAxkKvQQIqrejz+B3lmyjcn9IxKY7eS/Uszu1qtv
	uuI9VPtr6EcViYDM8PEuZykwWXmBBUK6gBkoqh+mvDoht7N3W85xHSoZ4yH5xK9aGwKzq+wJA6ID9
	lGpSRknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l9-0000000BXFx-2z23;
	Wed, 03 Jul 2024 21:43:27 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l6-0000000BXDi-0Yii
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:25 +0000
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d1b8bacf67so3852b6e.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043003; x=1720647803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtG0qWg5QbR5VYZF/R9pSkSDu8jWaNi65JIbi2fadJs=;
        b=uYO6QZDeQax14YUTvNAeu6U+tLDWbfQakSksDg5seoVU58H7kJKNiWJQZcjhJ1ruMV
         WvB1ODN5Kwnc0tkyeBwoUZpbxrElD9vNDEFuJLY47QOjS4zXn3r9xERVD36cc36g9I3v
         tHLMtO3vzTm8tURPPW8t1S3xqBH4xv8mQrWqGBBs98MncNM4UL8htuxD/aw3x8jg+k1O
         SkxrsDrZCQCca4e32i5U+9oLqGriSlXypQ35CwDxaH71Jq4Dy0rgH3uqNV9WZN1zsZey
         1eS1jQnVTSE3uXQBPamidylPChDDauPUerecnrU05Y5afkIOhwb+ZQxX55wkEMR0ESZP
         FcxA==
X-Forwarded-Encrypted: i=1; AJvYcCWMWzh3j7U0UlrDp+UueXO2nqRA6MbQR638AQnQvur85KUKaAUsS2F1L8RdhJlg9atZ8enukFwqy3Xi58/PojxVCi7XNQTCupw0f6CDkhkuJ1YC
X-Gm-Message-State: AOJu0YwjkpubXS+NSqqJfkOtlLTINAuSx/pIxD+GiyGp2pcptcWAw1v8
	rtqbcmnV5x96pJplNVBbGwRmvyJwTKy0OuqA3nf7+qc/GBWhihqE
X-Google-Smtp-Source: AGHT+IHcOT2ePMPmXXvJS0IdwhfyVS1tVzOxF6uH1qeSR+V7tKTr7QafSgJ6K+RsYA6EQXkV3+UWow==
X-Received: by 2002:a05:6870:a511:b0:259:f03c:4e90 with SMTP id 586e51a60fabf-25db36a52edmr13771890fac.4.1720043002793;
        Wed, 03 Jul 2024 14:43:22 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:21 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 16/29] wifi: mt76: mt7925: add link handling in mt7925_txwi_free
Date: Wed,  3 Jul 2024 14:42:21 -0700
Message-Id: <2b70dccb2735f4ca02db102bb6bd02cdbd539c2f.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144324_241665_46886BA0 
X-CRM114-Status: GOOD (  16.68  )
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

add link handling in mt7925_txwi_free.

MT7996 should have the similar the logic, we try to copy from there to
ensure consistency between both.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 54 +++++++++++++------
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  2 +-
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 6f5f2130420e..0cb9031e9fdd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -839,27 +839,53 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_write_txwi);
 
-static void mt7925_tx_check_aggr(struct ieee80211_sta *sta, __le32 *txwi)
+static void mt7925_tx_check_aggr(struct ieee80211_sta *sta, struct sk_buff *skb,
+				 struct mt76_wcid *wcid)
 {
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_link_sta *link_sta;
+	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
+	bool is_8023;
 	u16 fc, tid;
-	u32 val;
 
-	if (!sta || !(sta->deflink.ht_cap.ht_supported || sta->deflink.he_cap.has_he))
+	link_sta = rcu_dereference(sta->link[wcid->link_id]);
+	if (!link_sta)
 		return;
 
-	tid = le32_get_bits(txwi[1], MT_TXD1_TID);
-	if (tid >= 6) /* skip VO queue */
+	if (!sta || !(link_sta->ht_cap.ht_supported || link_sta->he_cap.has_he))
 		return;
 
-	val = le32_to_cpu(txwi[2]);
-	fc = FIELD_GET(MT_TXD2_FRAME_TYPE, val) << 2 |
-	     FIELD_GET(MT_TXD2_SUB_TYPE, val) << 4;
+	tid = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
+	is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
+
+	if (is_8023) {
+		fc = IEEE80211_FTYPE_DATA |
+		     (sta->wme ? IEEE80211_STYPE_QOS_DATA :
+		      IEEE80211_STYPE_DATA);
+	} else {
+		/* No need to get precise TID for Action/Management Frame,
+		 * since it will not meet the following Frame Control
+		 * condition anyway.
+		 */
+
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+
+		fc = le16_to_cpu(hdr->frame_control) &
+		     (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE);
+	}
+
 	if (unlikely(fc != (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_DATA)))
 		return;
 
 	msta = (struct mt792x_sta *)sta->drv_priv;
-	if (!test_and_set_bit(tid, &msta->deflink.wcid.ampdu_state))
+
+	if (sta->mlo && msta->deflink_id != IEEE80211_LINK_UNSPECIFIED)
+		mlink = rcu_dereference(msta->link[msta->deflink_id]);
+	else
+		mlink = &msta->deflink;
+
+	if (!test_and_set_bit(tid, &mlink->wcid.ampdu_state))
 		ieee80211_start_tx_ba_session(sta, tid, 0);
 }
 
@@ -1039,7 +1065,7 @@ void mt7925_mac_add_txs(struct mt792x_dev *dev, void *data)
 }
 
 void mt7925_txwi_free(struct mt792x_dev *dev, struct mt76_txwi_cache *t,
-		      struct ieee80211_sta *sta, bool clear_status,
+		      struct ieee80211_sta *sta, struct mt76_wcid *wcid,
 		      struct list_head *free_list)
 {
 	struct mt76_dev *mdev = &dev->mt76;
@@ -1052,10 +1078,8 @@ void mt7925_txwi_free(struct mt792x_dev *dev, struct mt76_txwi_cache *t,
 
 	txwi = (__le32 *)mt76_get_txwi_ptr(mdev, t);
 	if (sta) {
-		struct mt76_wcid *wcid = (struct mt76_wcid *)sta->drv_priv;
-
 		if (likely(t->skb->protocol != cpu_to_be16(ETH_P_PAE)))
-			mt7925_tx_check_aggr(sta, txwi);
+			mt7925_tx_check_aggr(sta, t->skb, wcid);
 
 		wcid_idx = wcid->idx;
 	} else {
@@ -1140,7 +1164,7 @@ mt7925_mac_tx_free(struct mt792x_dev *dev, void *data, int len)
 			if (!txwi)
 				continue;
 
-			mt7925_txwi_free(dev, txwi, sta, 0, &free_list);
+			mt7925_txwi_free(dev, txwi, sta, wcid, &free_list);
 		}
 	}
 
@@ -1426,7 +1450,7 @@ void mt7925_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
 	sta = wcid_to_sta(wcid);
 
 	if (sta && likely(e->skb->protocol != cpu_to_be16(ETH_P_PAE)))
-		mt7925_tx_check_aggr(sta, txwi);
+		mt76_connac2_tx_check_aggr(sta, txwi);
 
 	skb_pull(e->skb, headroom);
 	mt76_tx_complete_skb(mdev, e->wcid, e->skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 54693624b182..252d9de81d99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -260,7 +260,7 @@ void mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 			   struct ieee80211_key_conf *key, int pid,
 			   enum mt76_txq_id qid, u32 changed);
 void mt7925_txwi_free(struct mt792x_dev *dev, struct mt76_txwi_cache *t,
-		      struct ieee80211_sta *sta, bool clear_status,
+		      struct ieee80211_sta *sta, struct mt76_wcid *wcid,
 		      struct list_head *free_list);
 int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			      struct sk_buff *skb, int seq);
-- 
2.25.1


