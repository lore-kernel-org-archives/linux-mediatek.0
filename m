Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DE8C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goXkALOp2QwxSb3F7DJoCuE/hHvbXbI8e1rMayLRwD8=; b=ENLyX/O92FRiSf3a+OFX3HnfxJ
	0Vx7Uz1J/Fo3kZzs2C957WfiFhRtSRUX55CxszfcAE8ZnQvXHaP3jpHkIgidDOIeMmaOST2sAZZPc
	8Bt9uZTNJyb+6J09g04aup8kGelQyIwViT4fb00PBHEgl0gx3PklPx5FLEYQ+LgBfYy8jfr5GLDa7
	jRgdQWJIbxxZlJ8orAAUOmasoIya2Yq9+r7RMSHf8F1XZ5SUQV54A34QgtgqkKLZvuZmq6PTNDVDN
	9tUL5wEl8uBDlZp8FzC35wFp9uvgnWwmKBc3nrtALT9MKtIikx5NmCrAjZjdP53G2muOuLyFUMZbZ
	tfs8Ps9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kk-0000000BX0r-25eq;
	Wed, 03 Jul 2024 21:43:02 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kh-0000000BWzm-2RAx
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:00 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-700caf4cc3bso113613a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042978; x=1720647778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goXkALOp2QwxSb3F7DJoCuE/hHvbXbI8e1rMayLRwD8=;
        b=JR4nwaad9fo5MMdlGk+y+sa9VPikSSCPBwB7ImVIj+sg/m8vfg3Nwf6LnYI1Zsl/LK
         r0wrz8dV7frhPGlEshrRIHw9vsgSoY/x+LsSGOSNB3Ejb7GAJlfLQlQEM5aZgr2KcO0t
         AgY4dnWoLiun0ogsOg5dKA9MsZjfDgvotZhh2y7urqy1J5lL/eQGoFugCeXPavB1frbd
         cfknMmzUpIeuhE5zyemfF0VfKNEK8mngd5qSOJDwSfs1NXjA4Woc6sYXOTG9LX7gV6l7
         n+OsBUV20Qdz2dl53EdbZxJL95Wkl1ct7bEUF7UYkPsNFq7FQxG5Lq6BKPbmPXm2a1WL
         drlg==
X-Forwarded-Encrypted: i=1; AJvYcCWL4HVareQWo3Zd/61qoXbSFFmrbrfggzVQtdfuc42pOKWMFgaF1Avy1rzyKvfhQ5BmwZantbRUxR7SDjtuhu5D+docO/+2WHuCXGIXrqIr7+QK
X-Gm-Message-State: AOJu0YzuqwuH1rP7CPSrZE7pydv0VDyozq6pBQeNEfKGP4L3gB0eemyf
	gO20zb1st2BMlNAe+SBtRFPuXj72N2IN2KV4QPZbYF5LeXkrp2um
X-Google-Smtp-Source: AGHT+IFuEHcrEkFGiG9Dyf8kec2Kt4DL7xC2+P5Vzquxj3GgGa3ypEjfwcD1TpMXK4x8XZb03jfDgw==
X-Received: by 2002:a05:6830:1095:b0:701:f306:ad39 with SMTP id 46e09a7af769-7020768b4a0mr12292209a34.1.1720042977460;
        Wed, 03 Jul 2024 14:42:57 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:42:53 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 04/29] wifi: mt76: mt7925: set mt7925_mcu_sta_key_tlv according to link id
Date: Wed,  3 Jul 2024 14:42:09 -0700
Message-Id: <2a6000f8e280ceacc4e19240ff41863426839776.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144259_648002_4C0523D5 
X-CRM114-Status: GOOD (  14.60  )
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

configure mt7925_mcu_sta_key_tlv according to link id

We created a link id field in the common structure mt76_wcid so that
mt7925_mcu_sta_key_tlv can access per-link STA/BSS. Additionally,
.link_id will be required when reporting the link information of Rx status
to mac80211. We will submit the changes for reporting the Rx status in
a separate patch.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        |  1 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  1 +
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 15 +++++++++++----
 drivers/net/wireless/mediatek/mt76/mt792x.h      | 11 +++++++++++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 11b9f22ca7f3..01646538087a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -349,6 +349,7 @@ struct mt76_wcid {
 	u8 sta:1;
 	u8 amsdu:1;
 	u8 phy_idx:2;
+	u8 link_id:4;
 
 	u8 rx_check_pn;
 	u8 rx_key_pn[IEEE80211_NUM_TIDS + 1][6];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4e5868cd2a97..0b486afe9352 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -746,6 +746,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	mlink->wcid.phy_idx = mvif->bss_conf.mt76.band_idx;
 	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mlink->last_txs = jiffies;
+	mlink->wcid.link_id = link_sta->link_id;
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a67d8dd6075f..ba91c8e37dff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -967,6 +967,7 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 	struct mt792x_sta *msta = container_of(mlink, struct mt792x_sta, deflink);
 	struct sta_rec_sec_uni *sec;
 	struct mt792x_vif *mvif = msta->vif;
+	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, wcid->link_id);
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
 	struct tlv *tlv;
@@ -978,17 +979,23 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_KEY_V3, sizeof(*sec));
 	sec = (struct sta_rec_sec_uni *)tlv;
-	sec->bss_idx = mvif->bss_conf.mt76.idx;
+	sec->bss_idx = mconf->mt76.idx;
 	sec->is_authenticator = 0;
-	sec->mgmt_prot = 0;
+	sec->mgmt_prot = 1; /* only used in MLO mode */
 	sec->wlan_idx = (u8)wcid->idx;
 
 	if (sta) {
+		struct ieee80211_link_sta *link_sta;
+
 		sec->tx_key = 1;
 		sec->key_type = 1;
-		memcpy(sec->peer_addr, sta->addr, ETH_ALEN);
+		link_sta = mt792x_sta_to_link_sta(vif, sta, wcid->link_id);
+		memcpy(sec->peer_addr, link_sta->addr, ETH_ALEN);
 	} else {
-		memcpy(sec->peer_addr, vif->bss_conf.bssid, ETH_ALEN);
+		struct ieee80211_bss_conf *link_conf;
+
+		link_conf = mt792x_vif_to_bss_conf(vif, wcid->link_id);
+		memcpy(sec->peer_addr, link_conf->bssid, ETH_ALEN);
 	}
 
 	if (cmd == SET_KEY) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 69eb8dac0b70..fe5a6c932705 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -273,6 +273,17 @@ mt792x_vif_to_bss_conf(struct ieee80211_vif *vif, unsigned int link_id)
 	return link_conf_dereference_protected(vif, link_id);
 }
 
+static inline struct ieee80211_link_sta *
+mt792x_sta_to_link_sta(struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+		       unsigned int link_id)
+{
+	if (!ieee80211_vif_is_mld(vif) ||
+	    link_id >= IEEE80211_LINK_UNSPECIFIED)
+		return &sta->deflink;
+
+	return link_sta_dereference_protected(sta, link_id);
+}
+
 static inline struct mt792x_dev *
 mt792x_hw_dev(struct ieee80211_hw *hw)
 {
-- 
2.25.1


