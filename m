Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24B9E77182
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1YpHXYbDA4VM1WpYLpyHXFxdUkmq+2IyIhunuoKdpQ=; b=wmJ7O5N0KXSI54ZiREH/o5cAAr
	kadcuzJJsYMJIjs7qXqndvQyOmvHHizdYG3PqEqZwha1GKD/rk0cYJWRWW9HHvjVqorKhAHouOtnh
	XfKkHUsT82GRFrK20hqW7Bsq+oTJUAvWZSEWOOlPudtbZBd6aEB1sgUu9bb4imd5D11ecxg1FLqNz
	tsspM6Tsdt0r6csCO1wWIQOfjzlgJR9cBZ3cC93ylrEFpHLRIw/CHBmraLnSXQcdvAzIrruXHbWTO
	GOQNpnylI0c+Q7zPVVJoT4SqVaYpN/zdi/c90wZBg7caOBRplcJb4bS7FjxfwaI3CPC3LhpcQRNaM
	pydg23/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBP1-0000000DP5E-3zug;
	Wed, 11 Dec 2024 01:20:35 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBP0-0000000DP4H-1Nik
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:35 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29e998c70f9so3584692fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880033; x=1734484833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1YpHXYbDA4VM1WpYLpyHXFxdUkmq+2IyIhunuoKdpQ=;
        b=NODVNXelxO+InN9cDbDv5R6HZZkDx4dmjBzvrUpyUUpblGxtznTP6dT88dE3NB0qWB
         YDnfL6e8AnW2pKCKgDZp3K6ai/Mj6WL3cikPp9DiLBE/4LSkhsKYn0nryPbYhC+BT5yb
         5e+3loh8YPSkouuR43RKAm1lbW9Q+4hQ55MS/wXdJd4hXlV5vJOvy3QNddfHw/GS+PR+
         3xPop27BGo86EOpn2Cx1Lsl9hHlwmd6h/2w7/2VHWFPthKCxDHhIYBlALlepAI3nPqUW
         mA6hi2egxUV0GBxkh1g8DMrgj85uNEveGSfTnOuHpIRP2CvnlGHbCHJ6q4UCwduEtRDl
         qAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8cgzeddYBGF6M5yX8xBzLCZ+XKWL/UZnBzXrv8laiSeDb8025U0zRBbfIBOxIqJF/WrcUKr59R6MBiGvrkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh36GgnsMNrJ/1Ug3f5OCxvzVNVilQGFXvGbrb7jSJWldBZZaK
	mdR2xrI5TAg1zrye1WjUjNmg8k7al3gW4P92iwG1R8+ps74JYk1L
X-Gm-Gg: ASbGnct+whtn/CRKEz54a45v/Ei2JasyhcziNp4Wbx/t6BLyBPez4s5Zw4a4guxpOdY
	bMcL/x0OKwBQr/Z2MCV0TKqeFCtEoYy+i1TadbDzx3lSQXKOdhHwBY+Yk9UR8As7raZQs29MeBh
	PIh1iLRlNsoKv9dFkGlWr87ZxZoCoCT9k24dUq5FxniVkxidPNQxKl3wyYZGvvCw5P9b1aIChBS
	5J9FjHpcQJU7eg31Not/adow4Z+aDLJwzJrLNqJzmZ75JaVltU5NU0ogzoxKEoO7eUxGyA=
X-Google-Smtp-Source: AGHT+IF0gUkHuRCaOh8UGDwrWZiHIizEzdf2Z5358lrfRXUW5B3uSGUMCpL6znNlITwq0TrtI1wC4w==
X-Received: by 2002:a05:6871:430e:b0:27b:55af:ca2b with SMTP id 586e51a60fabf-2a012db1083mr711621fac.11.1733880033574;
        Tue, 10 Dec 2024 17:20:33 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:32 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 16/17] wifi: mt76: mt7925: Cleanup MLO settings post-disconnection
Date: Tue, 10 Dec 2024 17:19:25 -0800
Message-Id: <20241211011926.5002-16-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172034_368571_7A24EB04 
X-CRM114-Status: GOOD (  15.34  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Clean up MLO settings after disconnection.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 37 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  4 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  2 +-
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index da7a2a798545..9c43437ad9d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1149,8 +1149,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
-		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
-					link_sta, false);
+		mt792x_mac_link_bss_remove(dev, mconf, mlink);
 	}
 
 	spin_lock_bh(&mdev->sta_poll_lock);
@@ -1208,12 +1207,46 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct {
+		struct {
+			u8 omac_idx;
+			u8 band_idx;
+			__le16 pad;
+		} __packed hdr;
+		struct req_tlv {
+			__le16 tag;
+			__le16 len;
+			u8 active;
+			u8 link_idx; /* hw link idx */
+			u8 omac_addr[ETH_ALEN];
+		} __packed tlv;
+	} dev_req = {
+		.hdr = {
+			.omac_idx = 0,
+			.band_idx = 0,
+		},
+		.tlv = {
+			.tag = cpu_to_le16(DEV_INFO_ACTIVE),
+			.len = cpu_to_le16(sizeof(struct req_tlv)),
+			.active = true,
+		},
+	};
 	unsigned long rem;
 
 	rem = ieee80211_vif_is_mld(vif) ? msta->valid_links : BIT(0);
 
 	mt7925_mac_sta_remove_links(dev, vif, sta, rem);
 
+	if (ieee80211_vif_is_mld(vif)) {
+		mt7925_mcu_set_dbdc(&dev->mphy, false);
+
+		/* recovery omac address for the legacy interface */
+		memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
+		mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
+				  &dev_req, sizeof(dev_req), true);
+
+	}
+
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 551b1827bb40..6675492ec9a8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2662,7 +2662,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
-int mt7925_mcu_set_dbdc(struct mt76_phy *phy)
+int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable)
 {
 	struct mt76_dev *mdev = phy->dev;
 
@@ -2682,7 +2682,7 @@ int mt7925_mcu_set_dbdc(struct mt76_phy *phy)
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_MBMC_SETTING, sizeof(*conf));
 	conf = (struct mbmc_conf_tlv *)tlv;
 
-	conf->mbmc_en = 1;
+	conf->mbmc_en = enable;
 	conf->band = 0; /* unused */
 
 	err = mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(SET_DBDC_PARMS),
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 31bb8ed2ec51..fe6a613ba008 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -616,7 +616,7 @@ mt7925_mcu_get_cipher(int cipher)
 	}
 }
 
-int mt7925_mcu_set_dbdc(struct mt76_phy *phy);
+int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable);
 int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		       struct ieee80211_scan_request *scan_req);
 int mt7925_mcu_cancel_hw_scan(struct mt76_phy *phy,
-- 
2.25.1


