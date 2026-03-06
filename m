Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C63CFC9EC2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uJCt4RmhP+UGOxRLo81UpdyClyYP5NEI25cnmpITUY=; b=0GdH2fGIQLYtOkJ3XhTQ9yJQot
	3A4VOdk95bRApKsn3xod946dDbAogfG5ttnIrjJLdIkTT5XBWW3jh4PPf9NyITvZ0qck701Lz/FPL
	eq0GvWS3liUfapRfmRfrhAJTBExnCUDscD5+gLGYJv2gogWUyeXFTIAl+LnQ3Rrb7PMQlbdMfpMvM
	Uvhd48Q30x7Avj5nKm3wvJ/j0GSqXLe5a9MhgR46mIUP9lkytqHHdXpWUitAiJVAaTou1aiJQyNk/
	hzmly2KJjQmbQHD9KI8wrsfRhYcO5KK7uR10u+7SvZ8gRQbkzjhpY/x6GhbED3XJWpsgypVSw32DT
	sMdRrONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWI-00000004dgL-33SN;
	Fri, 06 Mar 2026 23:23:46 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWF-00000004ddn-2BVh
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:45 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-466ec4c6846so24545b6e.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839422; x=1773444222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uJCt4RmhP+UGOxRLo81UpdyClyYP5NEI25cnmpITUY=;
        b=GUy0NU90DfoVvmj2b9ViUykLgzXCLlOXXOqgijxFBHmBnb/Mknh3N1kDOaKZvQ2S5U
         e05OKGFd1Ldq8pVV5TTvrqEhqOGMsDjVjRju9MAdOWLeMsvwWOIjxNcHTwz/gIso5z53
         mzCLkkOMdooSXENfxDEkQ8lFUnL1JfKXGAOANfQgH3WOUR1kqPqOdnYSmv9xEY2Hkh3C
         aFHwPnnFG1Gf9ru9gL1QKEBrng1H2OFuvpj1tfHhPLrfLtC9i1FHrhcE8QBulwFukFQA
         sPF52uif7w/z3hc/IsDKsU/OsyDLtOdcZ2gTFslvserv9pwL/YNSFGA6QvFMu3A5eOSr
         Dhrw==
X-Forwarded-Encrypted: i=1; AJvYcCXp0D+4NN50buN+skW/DIBDVkvQdKvlOOcU0aDYrvWDfFfe25R3Zf9pV1HUUtbIsqjQ7rm33a+vlJyge7Da/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTbQL+O8+w9QjOD1+C74ljf58UNJjneDXZ20tM9bxepEuzNd3u
	tUNC/WgbY0Rb/aFlIhHBOUNAHnkxI/1OLm0Go15ebEoYXoNlQU1poQQy
X-Gm-Gg: ATEYQzxJPepvj4LgatiG/oMtyQ063MdvfxI7PgGiddnaH96NTMs9Py69Hhe5wFlqOIp
	Pm6BthBYVReyHAcyL2W5JUhoIPgWkiL2Ic4xCYFHyH17qMKZsezed5qIEZ1r1S+vSwLxlpLTZfX
	ZOs5tY9OC+LFgBjxnZmWM4hOm4hg9WABsmRGMOHqnkocSpYnaVwTgk48BAA1B0x/LX2J0hKLA9p
	SEAsWLKI/A6bTjI+dpPtjNIeZIFYPE4RFqPeQd4891TdRVU8jdTkM4Edqi2mjxFO1mEWH4UoR+7
	C5Adip6RwQj/79VZvSGIbZh+znzQsa4igG1uIHjLPK8jkgBex+xS/25u184cxiDHiqCb2xKN172
	vEa4IzkbWjmmFmV7gEDIUffGX40nUAPNGOon1pcOZJm6IokFyQfPvzjoBMULn1uXO0nA64QdhBr
	W1WISf1SiOl0xHY12BFEfzyUvLeHSgi/1inxfnrTyaZbLhtbc=
X-Received: by 2002:a05:6808:1b0b:b0:45a:5584:9bf6 with SMTP id 5614622812f47-466dcb27f98mr1968964b6e.39.1772839422517;
        Fri, 06 Mar 2026 15:23:42 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:42 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 12/19] wifi: mt76: mt7925: pass mconf and mlink to wtbl_update_hdr_trans()
Date: Fri,  6 Mar 2026 17:22:31 -0600
Message-ID: <20260306232238.2039675-13-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152344_757670_7A283D1B 
X-CRM114-Status: GOOD (  10.90  )
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

Drop the mt792x_vif_to_link() lookup in mt7925_mcu_wtbl_update_hdr_trans()
and pass the resolved mconf and mlink from the caller instead. The link
context is already known at the call site, making the lookup redundant.

This keeps the helper lookup-free and makes link ownership explicit.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  4 +++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 20 ++++---------------
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  5 ++---
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 135a803b4382..151dc79f7c12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1590,8 +1590,10 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 	valid = ieee80211_vif_is_mld(vif) ? mvif->valid_links : BIT(0);
 
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt792x_bss_conf *mconf;
 		struct mt792x_link_sta *mlink;
 
+		mconf = mt792x_vif_to_link(mvif, i);
 		mlink = mt792x_sta_to_link(msta, i);
 
 		if (enabled)
@@ -1602,7 +1604,7 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 		if (!mlink->wcid.sta)
 			continue;
 
-		mt7925_mcu_wtbl_update_hdr_trans(dev, vif, sta, mlink, i);
+		mt7925_mcu_wtbl_update_hdr_trans(dev, vif, mconf, mlink);
 	}
 
 	mt792x_mutex_release(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0b096838bca6..2be6160873a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1066,7 +1066,6 @@ EXPORT_SYMBOL_GPL(mt7925_run_firmware);
 static void
 mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 			     struct ieee80211_vif *vif,
-			     struct ieee80211_link_sta *link_sta,
 			     struct mt792x_link_sta *mlink)
 {
 	struct sta_rec_hdr_trans *hdr_trans;
@@ -1096,29 +1095,18 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 
 int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     struct ieee80211_vif *vif,
-				     struct ieee80211_sta *sta,
-				     struct mt792x_link_sta *mlink,
-				     int link_id)
+				     struct mt792x_bss_conf *mconf,
+				     struct mt792x_link_sta *mlink)
 {
-	struct ieee80211_link_sta *link_sta = sta ? &sta->deflink : NULL;
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_bss_conf *mconf;
 	struct sk_buff *skb;
 
-	link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
-	mconf = mt792x_vif_to_link(mvif, link_id);
-
 	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mconf->mt76,
 					      &mlink->wcid,
 					      MT7925_STA_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	/* starec hdr trans */
-	if (!link_sta)
-		mlink = &mvif->sta.deflink;
-
-	mt7925_mcu_sta_hdr_trans_tlv(skb, vif, link_sta, mlink);
+	mt7925_mcu_sta_hdr_trans_tlv(skb, vif, mlink);
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
 }
@@ -2022,7 +2010,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		if (!info->link_sta)
 			mlink = &mvif->sta.deflink;
 
-		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta, mlink);
+		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, mlink);
 	}
 
 	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index e28972f0615b..46b480f7d813 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -370,9 +370,8 @@ int mt7925_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 int mt7925_mcu_set_rts_thresh(struct mt792x_phy *phy, u32 val);
 int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     struct ieee80211_vif *vif,
-				     struct ieee80211_sta *sta,
-				     struct mt792x_link_sta *mlink,
-				     int link_id);
+				     struct mt792x_bss_conf *mconf,
+				     struct mt792x_link_sta *mlink);
 int mt7925_mcu_wf_rf_pin_ctrl(struct mt792x_phy *phy);
 
 int mt7925_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-- 
2.43.0


