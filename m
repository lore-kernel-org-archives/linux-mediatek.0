Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76164C3271E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7PGupETUQJAUNPNhJLXB9UGMjXfuQAyAWBEVi1wM2c=; b=XYkjMPah6D/PtjA+FWDWyF1tnQ
	Zlb7AKIqTXASxba+DeNBBAaofQ1C8qQRz93eoM45uDRUlRBeySKBb+6rQnWl5JxUlMEFpyqEq6MEn
	j1Op14JC7zb0b8t7MKH6QqmofNGMEOon5E7F7ALgB9RQXW5l9UvpiSuaLKNPxm/tmXSSt0oKSwU48
	eaaTWhHWjwxY7Np6qncZmTbIsy/GgW8f2+dRBGpuMmK95sNpUlT45j+F3Jej1+BNLt4eEXeNG+S8b
	+zCacV++qfo9J7iG0/ZEmDa0gwjCuJ9qIvqjgzcznX04/8EAw0itkOP8DAYeczCXTcwKyHXXEo4n5
	V0L85iHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7km-0000000BX1s-0jAL;
	Wed, 03 Jul 2024 21:43:04 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kj-0000000BX0T-2fEc
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:03 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-700cd6afa3eso204786a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042981; x=1720647781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7PGupETUQJAUNPNhJLXB9UGMjXfuQAyAWBEVi1wM2c=;
        b=q2M/8G16W1TbZ8uuKON9qMofTjvvA0dAUGCgTOS2sWsMUq2w/CwjcCF6eVlLMktGz8
         ZsLp3ErTarkiK0QOfBZ3th9z823y83eUtZSrPp7HV3/9ZwYOpW+Eu9ce1ZDbAh7C3yaT
         ISOgMRZ+og3yWlUAyqfNZMmCrArF1uV6pE/BoXyxQJn63ykJuOKnU2EP+GZfbiAa6Lhl
         VJZ0OBQ9a20a47Y2j41pOa8xVOHNYOjw7x3itIHFFpcJaBB7+g/y90OpeMBM/D6p7WEi
         2Eu9OWW2TbPOQDWyCyqeXVwvffR0yzZNhaC+5uCPSWkq2xZ+Qi+TJB7Pmv6f2fURJHRT
         rgNg==
X-Forwarded-Encrypted: i=1; AJvYcCXtbduswJ7x4zQiXwnqhO9PEvRdZFP0yi0Hv6HeeT2TKBCa5WwAdz2XtGfyNX8EcbHKCHh0ICt2p16fPQ3ptBRGUZQPOdsI97LgEbD6nr97Z2W7
X-Gm-Message-State: AOJu0YxcCrG1debdkmUKbgwdSJx+gyGyqz4KxePR8z1iM9reF8iKzN/j
	2qNYfopvb/anI14lEfpxmBT5xlxBYtnXEKgpw2uEqqMJsi98ze41
X-Google-Smtp-Source: AGHT+IFs8z5tFdp9iaiINsY/W0pW70iwOppFb6clHGmnsTdd61oxtC5rmZXGAMjMJWq4P01yGijDAg==
X-Received: by 2002:a9d:5c89:0:b0:701:f366:71d7 with SMTP id 46e09a7af769-7020767ab30mr12877316a34.1.1720042980638;
        Wed, 03 Jul 2024 14:43:00 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:42:59 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 05/29] wifi: mt76: mt7925: add mt7925_set_link_key
Date: Wed,  3 Jul 2024 14:42:10 -0700
Message-Id: <6526aeab0d71104fff8453e086f8afe0d5eec70c.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144301_709926_346C3B83 
X-CRM114-Status: GOOD (  13.84  )
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

add mt7925_set_link_key to set up the key according to the link id

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 66 ++++++++++++-------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0b486afe9352..264517fd3bf7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -499,31 +499,28 @@ static int mt7925_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	return mt7925_abort_roc(phy, &mvif->bss_conf);
 }
 
-static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
-			  struct ieee80211_vif *vif, struct ieee80211_sta *sta,
-			  struct ieee80211_key_conf *key)
+static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+			       struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+			       struct ieee80211_key_conf *key, int link_id)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
 				  &mvif->sta;
-	struct ieee80211_link_sta *link_sta = sta ? &sta->deflink : NULL;
-	struct mt76_wcid *wcid = &msta->deflink.wcid;
 	struct ieee80211_bss_conf *link_conf;
-	u8 *wcid_keyidx = &wcid->hw_key_idx;
+	struct ieee80211_link_sta *link_sta;
 	int idx = key->keyidx, err = 0;
+	struct mt792x_link_sta *mlink;
+	struct mt792x_bss_conf *mconf;
+	struct mt76_wcid *wcid;
+	u8 *wcid_keyidx;
 
-	link_conf = mt792x_vif_to_bss_conf(vif, vif->bss_conf.link_id);
-
-	/* The hardware does not support per-STA RX GTK, fallback
-	 * to software mode for these.
-	 */
-	if ((vif->type == NL80211_IFTYPE_ADHOC ||
-	     vif->type == NL80211_IFTYPE_MESH_POINT) &&
-	    (key->cipher == WLAN_CIPHER_SUITE_TKIP ||
-	     key->cipher == WLAN_CIPHER_SUITE_CCMP) &&
-	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
-		return -EOPNOTSUPP;
+	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+	link_sta = sta ? mt792x_sta_to_link_sta(vif, sta, link_id) : NULL;
+	mconf = mt792x_vif_to_link(mvif, link_id);
+	mlink = mt792x_sta_to_link(msta, link_id);
+	wcid = &mlink->wcid;
+	wcid_keyidx = &wcid->hw_key_idx;
 
 	/* fall back to sw encryption for unsupported ciphers */
 	switch (key->cipher) {
@@ -547,12 +544,10 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		return -EOPNOTSUPP;
 	}
 
-	mt792x_mutex_acquire(dev);
-
-	if (cmd == SET_KEY && !mvif->bss_conf.mt76.cipher) {
+	if (cmd == SET_KEY && !mconf->mt76.cipher) {
 		struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
-		mvif->bss_conf.mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
+		mconf->mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
 		mt7925_mcu_add_bss_info(phy, mvif->bss_conf.mt76.ctx, link_conf,
 					link_sta, true);
 	}
@@ -567,9 +562,9 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	mt76_wcid_key_setup(&dev->mt76, wcid,
 			    cmd == SET_KEY ? key : NULL);
 
-	err = mt7925_mcu_add_key(&dev->mt76, vif, &msta->deflink.bip,
+	err = mt7925_mcu_add_key(&dev->mt76, vif, &mlink->bip,
 				 key, MCU_UNI_CMD(STA_REC_UPDATE),
-				 &msta->deflink.wcid, cmd);
+				 &mlink->wcid, cmd);
 
 	if (err)
 		goto out;
@@ -579,8 +574,31 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		err = mt7925_mcu_add_key(&dev->mt76, vif, &mvif->wep_sta->deflink.bip,
 					 key, MCU_WMWA_UNI_CMD(STA_REC_UPDATE),
 					 &mvif->wep_sta->deflink.wcid, cmd);
-
 out:
+	return err;
+}
+
+static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+			  struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+			  struct ieee80211_key_conf *key)
+{
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	int err;
+
+	/* The hardware does not support per-STA RX GTK, fallback
+	 * to software mode for these.
+	 */
+	if ((vif->type == NL80211_IFTYPE_ADHOC ||
+	     vif->type == NL80211_IFTYPE_MESH_POINT) &&
+	    (key->cipher == WLAN_CIPHER_SUITE_TKIP ||
+	     key->cipher == WLAN_CIPHER_SUITE_CCMP) &&
+	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+		return -EOPNOTSUPP;
+
+	mt792x_mutex_acquire(dev);
+
+	err = mt7925_set_link_key(hw, cmd, vif, sta, key, vif->bss_conf.link_id);
+
 	mt792x_mutex_release(dev);
 
 	return err;
-- 
2.25.1


