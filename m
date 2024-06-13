Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE63C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNkelXTxxMMz4LGtUvEnp1jPMerysFzidVDadNvD4GE=; b=fivb1tU3C5GBmsxuSerV3WGAbv
	Bvo3Xmd6Q8AvwPFeMsqYqCQlSWM6WHbfx35kLnptGhmWgjCLGiGZS3lPhpjXa/jlag6syZ0jmOO3x
	2nFWZszTOfrH2YfjQPXLpK5nlyOpmyaWB7u1a0oOQ4/7Qf3RmDUZ3Aqq92oJYDK82H7PamqEnSou9
	gxE6T9GfrJT94zl7ZJsd6+hNXAg5VcTR3JS03CjDH6H2TFVjx4PGheH9mR62QB5TIMIKYat1rHlnf
	RArB2Dj/gHsGQeBOcYmpczdCTR+zqKkCeEyVoPJvu2MxkrjpcG8mXJecWfMyTUFJ5hX+VCHAY9afq
	8NVc5zfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak1-0000000Evcb-37AA;
	Thu, 13 Jun 2024 03:03:09 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajt-0000000EvY6-3jAu
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:05 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5b99ba97d89so25543eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247781; x=1718852581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNkelXTxxMMz4LGtUvEnp1jPMerysFzidVDadNvD4GE=;
        b=kHFOV6AtnsGB0leKIspPlTLYoumj5Gd4IwOIqpJ17659Bk1abgaXpsa1BfOTyhtdzJ
         wYKhZTYY3mcC1e/YfMHPdSoo4ChoCr1MUfC6Xbz1o1r0iLzS4H7RjT7eHwujh8BSdCy3
         BufJIErUeZmnox24noXShE1Xu283wMHxCPw3B8+6sIbu7yzO/509YB5C5Qi8yklebMpV
         t5iGKr7Ef7KthMiufp81qEmoQUFhv1zvu5doEW4Toukp/a7Cw7WcqTiK8HSSEP+I40Zl
         yU8QijiUSrB+lczzWFNJNsXln0Z5UuhCuDsp0BE1iceUz7qXcnUT2+Q9O7UlFwZ++Uet
         v32g==
X-Forwarded-Encrypted: i=1; AJvYcCU+vix5ArvCZjJJg4F2onoUKfpWk70OoHvZkTzagaqNUG4yQN+QxKOseOh9ORVPuQcDtpQjpBMaFD/U3VNXqv01GV+J0UWMM3UQhLnOZ1u6hKmz
X-Gm-Message-State: AOJu0YwpI3nug87lPGqrARBXPjYLaWidoFbWJKHKFqmaMrqYOARRR9Hz
	t8FoIcFrKjqEJ8YZkYdCy/Rr2PL3UhmrYysm3S4HMx1gQj91mTf4
X-Google-Smtp-Source: AGHT+IGop7lIhBPZfEfsSFi5dcAXixU7dZnIGAt4G4oXUA5mCgEPT9L0Hbz4YM8vhZF8LA0Cyhk0zA==
X-Received: by 2002:a05:6820:d88:b0:5ba:ead2:c742 with SMTP id 006d021491bc7-5bb3b7a3d2bmr3670644eaf.0.1718247780534;
        Wed, 12 Jun 2024 20:03:00 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:02:58 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 06/47] wifi: mt76: mt7925: extend mt7925_mcu_set_tx with for per-link BSS
Date: Wed, 12 Jun 2024 20:02:00 -0700
Message-Id: <20240613030241.5771-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200301_972597_1101A1D3 
X-CRM114-Status: GOOD (  15.71  )
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

From: Deren Wu <deren.wu@mediatek.com>

Extend mt7925_mcu_set_tx with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  9 ++++---
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 25 +++++++++++++++++++
 5 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 48425fc4e7fe..2be2ab914411 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1245,7 +1245,7 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 
 	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
 				    &mvif->sta.deflink.wcid, true);
-	mt7925_mcu_set_tx(dev, vif);
+	mt7925_mcu_set_tx(dev, &vif->bss_conf);
 
 	if (vif->type == NL80211_IFTYPE_AP) {
 		mt76_connac_mcu_uni_add_bss(dev->phy.mt76, vif, &mvif->sta.deflink.wcid,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b0c8b090d2ce..d11919688bae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1410,7 +1410,7 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 
 	/* ensure that enable txcmd_mode after bss_info */
 	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
-		mt7925_mcu_set_tx(dev, vif);
+		mt7925_mcu_set_tx(dev, info);
 
 	mt792x_mutex_release(dev);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5e72f7278e8b..1c262a024dc8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -900,7 +900,8 @@ int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
 }
 
-int mt7925_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_vif *vif)
+int mt7925_mcu_set_tx(struct mt792x_dev *dev,
+		      struct ieee80211_bss_conf *bss_conf)
 {
 #define MCU_EDCA_AC_PARAM	0
 #define WMM_AIFS_SET		BIT(0)
@@ -909,12 +910,12 @@ int mt7925_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_vif *vif)
 #define WMM_TXOP_SET		BIT(3)
 #define WMM_PARAM_SET		(WMM_AIFS_SET | WMM_CW_MIN_SET | \
 				 WMM_CW_MAX_SET | WMM_TXOP_SET)
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(bss_conf);
 	struct {
 		u8 bss_idx;
 		u8 __rsv[3];
 	} __packed hdr = {
-		.bss_idx = mvif->bss_conf.mt76.idx,
+		.bss_idx = mconf->mt76.idx,
 	};
 	struct sk_buff *skb;
 	int len = sizeof(hdr) + IEEE80211_NUM_ACS * sizeof(struct edca);
@@ -927,7 +928,7 @@ int mt7925_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_vif *vif)
 	skb_put_data(skb, &hdr, sizeof(hdr));
 
 	for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
-		struct ieee80211_tx_queue_params *q = &mvif->bss_conf.queue_params[ac];
+		struct ieee80211_tx_queue_params *q = &mconf->queue_params[ac];
 		struct edca *e;
 		struct tlv *tlv;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 8a4a71f6bcb6..f689f7a359ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -198,7 +198,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev, struct ieee80211_sta *sta,
 			  struct ieee80211_vif *vif, bool enable,
 			  enum mt76_sta_info_state state);
 int mt7925_mcu_set_chan_info(struct mt792x_phy *phy, u16 tag);
-int mt7925_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_vif *vif);
+int mt7925_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_bss_conf *bss_conf);
 int mt7925_mcu_set_eeprom(struct mt792x_dev *dev);
 int mt7925_mcu_get_rx_rate(struct mt792x_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index b5eb574e8548..4a7526322c30 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -112,6 +112,7 @@ struct mt792x_bss_conf {
 
 struct mt792x_vif {
 	struct mt792x_bss_conf bss_conf; /* must be first */
+	struct mt792x_bss_conf __rcu *link_conf[IEEE80211_MLD_MAX_NUM_LINKS];
 
 	struct mt792x_sta sta;
 	struct mt792x_sta *wep_sta;
@@ -219,6 +220,30 @@ struct mt792x_dev {
 	u32 backup_l2;
 };
 
+static inline struct mt792x_bss_conf *
+mt792x_vif_to_link(struct mt792x_vif *mvif, u8 link_id)
+{
+	struct ieee80211_vif *vif;
+
+	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
+
+	if (!ieee80211_vif_is_mld(vif) ||
+	    link_id >= IEEE80211_LINK_UNSPECIFIED)
+		return &mvif->bss_conf;
+
+	return rcu_dereference_protected(mvif->link_conf[link_id],
+		lockdep_is_held(&mvif->phy->dev->mt76.mutex));
+}
+
+static inline struct mt792x_bss_conf *
+mt792x_link_conf_to_mconf(struct ieee80211_bss_conf *link_conf)
+{
+	struct ieee80211_vif *vif = link_conf->vif;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+
+	return mt792x_vif_to_link(mvif, link_conf->link_id);
+}
+
 static inline struct mt792x_dev *
 mt792x_hw_dev(struct ieee80211_hw *hw)
 {
-- 
2.34.1


