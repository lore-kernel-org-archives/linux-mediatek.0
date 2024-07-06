Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D149CC3DA40
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FI2TnPxCSt+IPX/3LOylsuRUtyZmNywOOwGJZo4oaeY=; b=iPIEFiyTL8JNukiuJFhHgPtFTw
	aOUdzKIGdxzOT1tX0uCjZNnURiBslDbW02TC1eOHyWfkUeAgSxdLP7SMVyIzCmTdiGgX9EWCJT5O4
	jFAP1VaMYFNltYr2GZsoMPPr284G+OCiQd+Gtu2cllE4J3XQVz8wQvYlZeXcExiSx6NsNRGdXqfUE
	uycVMhcQ1bvkAUfntxNPJiVWIkgHHGeP5KZTJJwJ3v4gpmLayh4S2jwWxG+CR8xSWbhF7XhmCJfMg
	mbL7S9xVFovqplytpQNXmas8XDxkXQCujyyiF+lvrHi9zahjiJmnJL1Ytq2dh2LcJSAU1PCJJxqKL
	rJgQL7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0ms-0000000HXxp-1TqZ;
	Sat, 06 Jul 2024 08:28:54 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mo-0000000HXuy-1Jqv
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:52 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25e23e0492dso341277fac.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254529; x=1720859329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FI2TnPxCSt+IPX/3LOylsuRUtyZmNywOOwGJZo4oaeY=;
        b=JGO8aPaJS2E+kiggLFBHhs0mH1XAN/QJN4WoL3LRSoC/BkujvoAR0UVkmf1uZKB1I3
         Hp7TPilXGgKK/am/H1wv8OiT6NGkWbgvpsro9pMM+H+UL7UQ3Rft63QG8hH7iR5iIIII
         m3SuUthIfUpU2Nnz1tz28fM8Wa0UoYK5kLsBxDdAiU52NDp/GmPSrdigliNgFiAubNAl
         NBnRMgnWmxPsuK7D75y71ULwz42OaOu0ZjMU0OcNRYjkSpgHeoI49vT8m32lb1Hy4Md9
         vpFVQ+wFnaDfe4L7vWg/tAlMZGMh6dGCQtpCI5XQMDhfe6qRWy33PIDfQ+qbW1H51/Gt
         cPvg==
X-Forwarded-Encrypted: i=1; AJvYcCWtNqfiWboeVTyNhCunr6LRrRSChdDby5SZweBtfPScwk+cm/hYgmGB9DKo2HoXgZk3Rt2HgRAz/z9T9D7++VWpywpd5Ve7mTovpl0ly1YpJfnv
X-Gm-Message-State: AOJu0YzKjAeBDTeTXJPdHC3nttJFY3RDJv21L1Zzm26IVgw0/2KjMFVc
	8mr3S2AMMCvyE4kzvrAUU1Cexhp48Gmz5lZakxB2qvzvtJXLy1fz
X-Google-Smtp-Source: AGHT+IEXpb8lA49aI/oP6Yv6S25n3obCNnYl2lfER1bVAUm/n7WmA4bCU2b5oIPzgS/Et3O0HlKWbw==
X-Received: by 2002:a05:6871:798e:b0:25e:15e1:35c6 with SMTP id 586e51a60fabf-25e2b5af44dmr6351702fac.0.1720254529375;
        Sat, 06 Jul 2024 01:28:49 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:48 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 16/37] wifi: mt76: mt7925: add link handling in mt7925_txwi_free
Date: Sat,  6 Jul 2024 01:27:56 -0700
Message-Id: <f8084e19d388c6b0807618ac6d1bb8ac633dc8cd.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012850_423735_B2677FFC 
X-CRM114-Status: GOOD (  16.13  )
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
index dbc9e3d426e9..bcf8541fa31d 100644
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


