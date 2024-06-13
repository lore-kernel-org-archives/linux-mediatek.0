Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BFAC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpNMqJkAA2wzb/wI14GkcWcUpOPlO27N/TMsWpf1FR0=; b=1NmZ/CcJZUepa+KOd+kRbf4jtk
	o/BO8qr8v0DqfDrILslDeEOjpUZeXmCXmcxiiBvyHX8tESY77nYfHm/Qm+jtGiHGzf5lOuxEhvgSr
	kbAyhrBa1GXQz1U2h96I4r7rNr/Pl6uje3UOIay6P2+1SQxMuhz4smH2qQuhmQiyHvpCes6TPuwQZ
	pwIFvQCs8REU8OCRnZANFIQAoVBLrK5Zjb2t/u9oejtYGtZzBpNRLrhnR2cvjFE0qkgOmfrdeSQEx
	aeZlX3GaDwT4O9e+iJFw1tH2znfn4pUfchzr417L9dWlLIlkLZN94cAf1lWNmawwUmB6+8jA7ck7L
	LJqg9NYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal3-0000000EwID-08nv;
	Thu, 13 Jun 2024 03:04:13 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaky-0000000EwEx-2ucI
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:11 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5b3356fd4f3so38475eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247848; x=1718852648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpNMqJkAA2wzb/wI14GkcWcUpOPlO27N/TMsWpf1FR0=;
        b=A/VVHcTyrloHXdrrjNoAASMb1oP2awmQA/U+rjqgmMzHuYiP+2FHWB0KmwbIO+TaDf
         oSSBLpRLRB9Z8vKcjSCKIF+09i/yIgATEYlr6uMUdhGLCJoIElnbxnyg5KdUY5r9pD39
         cvd/pgu8+D8/PzlM4kTVgoPKF1b9Ej2gz6xCH76jgLssgTh2V1ak8Y5039CL98V0rjmJ
         Do6DODNAN90zfuOT7/vQHrDxnR+tCBia5IQYN1gvloyz2tMBOyOZH7PWYxQPVESlXT0M
         DisJOJJ/pcY/5ThHdJ/5j0fHLxzZl5M5/ezb+1YjMHCO10q9JzE+tlJaYljLZDB8KuCd
         SxRw==
X-Forwarded-Encrypted: i=1; AJvYcCXK2MUDXQz/WiW4zeKolB2c1IOruBe/AMFOFu/SKvWCLI8io5B22DdRjUcIiA39+2aLwB5wI0PosDkv+bu3tQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2VOFqIdV6IBdLAhMR4VmboBFuxMLrf/BBeT+/s1m0dqG2I7o3
	Wp9ADJ4zEB1xw7M2parzNQRWREZYipn1Mc8L3Kj6oGYY4jv9c/Td/eDoowPZ7I8=
X-Google-Smtp-Source: AGHT+IHYPct9Rt5bxYHHJDkUc4nkQhYW7M7rTF1uzIU6UJKM5FsSWXS7AnJkTQ26FXuJ+SfmYJE3IQ==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr286829eaf.1.1718247847820;
        Wed, 12 Jun 2024 20:04:07 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:07 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 39/47] wifi: mt76: mt7925: extend mt7925_mcu_add_bss_info for per-link STA
Date: Wed, 12 Jun 2024 20:02:33 -0700
Message-Id: <20240613030241.5771-40-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200408_779056_00C14C82 
X-CRM114-Status: GOOD (  13.88  )
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

Extend mt7925_mcu_add_bss_info with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 ++++----
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h  | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f3a32fe9a754..b91992745462 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -535,7 +535,7 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 		mvif->bss_conf.mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
 		mt7925_mcu_add_bss_info(phy, mvif->bss_conf.mt76.ctx, link_conf,
-					sta, true);
+					&sta->deflink, true);
 	}
 
 	if (cmd == SET_KEY)
@@ -738,7 +738,7 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
 		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
-					link_conf, sta, false);
+					link_conf, &sta->deflink, false);
 
 	ret = mt7925_mcu_sta_update(dev, &sta->deflink, vif, true,
 				    MT76_STA_INFO_STATE_NONE);
@@ -765,7 +765,7 @@ void mt7925_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
 		mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
-					link_conf, sta, true);
+					link_conf, &sta->deflink, true);
 
 	ewma_avg_signal_init(&msta->deflink.avg_ack_signal);
 
@@ -802,7 +802,7 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		ewma_rssi_init(&mvif->bss_conf.rssi);
 		if (!sta->tdls)
 			mt7925_mcu_add_bss_info(&dev->phy, mvif->bss_conf.mt76.ctx,
-						link_conf, sta, false);
+						link_conf, &sta->deflink, false);
 	}
 
 	spin_lock_bh(&mdev->sta_poll_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 667ecd44392d..d5f94ee78623 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2337,7 +2337,7 @@ int mt7925_mcu_set_timing(struct mt792x_phy *phy,
 int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_chanctx_conf *ctx,
 			    struct ieee80211_bss_conf *link_conf,
-			    struct ieee80211_sta *sta,
+			    struct ieee80211_link_sta *link_sta,
 			    int enable)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
@@ -2352,13 +2352,13 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 		return PTR_ERR(skb);
 
 	/* bss_basic must be first */
-	mt7925_mcu_bss_basic_tlv(skb, link_conf, sta, ctx, phy->mt76,
+	mt7925_mcu_bss_basic_tlv(skb, link_conf, link_sta->sta, ctx, phy->mt76,
 				 mvif->sta.deflink.wcid.idx, enable);
 	mt7925_mcu_bss_sec_tlv(skb, link_conf);
 
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
-	mt7925_mcu_bss_mld_tlv(skb, link_conf, sta);
+	mt7925_mcu_bss_mld_tlv(skb, link_conf, link_sta->sta);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	if (link_conf->he_support) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index c5197577cdc8..da4e84f468d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -595,7 +595,7 @@ int mt7925_mcu_sched_scan_enable(struct mt76_phy *phy,
 int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_chanctx_conf *ctx,
 			    struct ieee80211_bss_conf *link_conf,
-			    struct ieee80211_sta *sta,
+			    struct ieee80211_link_sta *link_sta,
 			    int enable);
 int mt7925_mcu_set_timing(struct mt792x_phy *phy,
 			  struct ieee80211_bss_conf *link_conf);
-- 
2.34.1


