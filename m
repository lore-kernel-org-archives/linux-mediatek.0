Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10752FC9EC0
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DslI7VCh2ZTzU44H04itgeCGzsVbCkcEoyyw7QbL7rY=; b=OoeS9UYT11PvsV0fgatUFiLmFw
	ikL1gu41DG5zYQkTV1++wEXg72zkL1V/hDghuzVSeeCeE7AqUVRRG8HloWEqeENg8hXZjWtFgGU0I
	+reU8KB7es3h/DJBKRDfb0l7v1Ejg1qS3PiBFG8t0RNRDRnP/HYuxC2LbpBGWB4j8rXpUWeyrp+cE
	I8tIJzr6w6un+Gdtc6Qk1wBiq6a8S1Au0fr7+rovHKa7Qh1gTV9AQyPK+NCJDZjpv6fQzR4JiP48h
	sAqEsdYxRwrNDvwcLMxtJCMIIcLP5amI6NH1ABpHNkl0cmIYDxEes3bMuB2dtUcRf6mc7oVD/m5bA
	dQAQkwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWH-00000004df3-0peT;
	Fri, 06 Mar 2026 23:23:45 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWC-00000004dcC-09cl
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:41 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so3099261fac.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839418; x=1773444218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DslI7VCh2ZTzU44H04itgeCGzsVbCkcEoyyw7QbL7rY=;
        b=LDDwoiMx3eGMSpMwjWDTvCSrywKVMHIkPht1DDY86X299BMvzTIYe/6xFwnBw0TBPq
         wTY/83edH+MDGbhFrqjJpqC/n0A5iFANN5soxkKjcTmtlMvj1aJvYfpMeSdiMszonINf
         ur/ltYwHXTxXLbNnRHmd48F5QwuvLF2Iqf3LfWdz6TEiuk7OQRySaWxvHB6ccQYYQ4S0
         OAs5WI3yF2EqS/EUjITsbp/1VFVXT2IqcJE67iW7JqXP9OJDtG8rCpiswy11FtaGaNLe
         JG+nRTFHR/4lapoDK3+Bf4s6PEFnpmbBXlo1Lf5JtEgT1CBBgBm82oTqWM7PRLZZwNwY
         qbpw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1Ke8/7Rzt1lVJM032XaJIVcQDJL+9VUrE3FWwQlIJQKhgQ6S6tKBaQqLEws739Qz5VyMY3u8EiCYxxPgZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyERVrs5A4S6TizkanRiQSg8Jh+6tNzEWndkDorPwRn33+XbXAJ
	0FWwwCyZBU9yxay9Wa8BwWdymyhzPmyK/8FszFfSgSd5fdJ4GftSyABbr8LQcg==
X-Gm-Gg: ATEYQzzJIhA6TB+kmT/R1AjKuZ5S6LNoJEr6T5HI+9ozzp7KaCI63tBjPWev34aj4pZ
	uo9XvYj1790phEw/b/yD30OyowUDqCvft7VfCaqbj6GFRZpUqltMZj3BESqG4nTEqgD8NTOEuFA
	sUFN3sSY47+8Iqhqee0VlbMYX5VN5i33RL/mOPv95SuiXvWaF//Rd57+Z+L1E+z8ACsQuFCi4ai
	TNJa5fsqcVQIox7cMgmdDCguwISP5An4ExM0WBDrdGeVLz3OnLCxHX7faIk7yph720CfFYyowLC
	358F7NaLyZ4mzf5EMqaiXeihaVC06z6C10kEarOn3yJk/f7yJ9nLed2DyNylc/y1zcQ9zylhkve
	mrcTZgQN6/gIGiG4PlqiMsBYgApkEhFCD7Re4qCLEl0Al0QEZfHcboQNSxqu3LjgkF1DNi5ToHY
	jKV95y3Hc1kJc3ijy0y18fuCvsQanqRujWj6PiVA90UjTo+fY=
X-Received: by 2002:a05:6870:8094:b0:3ec:7649:f843 with SMTP id 586e51a60fabf-416e418f90bmr2210355fac.38.1772839417947;
        Fri, 06 Mar 2026 15:23:37 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:37 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 10/19] wifi: mt76: mt7925: pass mlink to set_link_key()
Date: Fri,  6 Mar 2026 17:22:29 -0600
Message-ID: <20260306232238.2039675-11-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152340_529978_AFA85E39 
X-CRM114-Status: GOOD (  11.03  )
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

Drop the mt792x_sta_to_link() lookup in mt7925_set_link_key() and pass
the resolved mlink from the caller instead. The link context is already
known at the call site, making the lookup redundant.

This keeps the helper lookup-free and makes link ownership explicit.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f5dd91dacca5..68f168a093f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -594,7 +594,8 @@ static int mt7925_cancel_remain_on_channel(struct ieee80211_hw *hw,
 
 static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			       struct ieee80211_vif *vif, struct ieee80211_sta *sta,
-			       struct ieee80211_key_conf *key, int link_id)
+			       struct ieee80211_key_conf *key, int link_id,
+			       struct mt792x_link_sta *mlink)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
@@ -603,7 +604,6 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct ieee80211_bss_conf *link_conf;
 	struct ieee80211_link_sta *link_sta;
 	int idx = key->keyidx, err = 0;
-	struct mt792x_link_sta *mlink;
 	struct mt792x_bss_conf *mconf;
 	struct mt76_wcid *wcid;
 	u8 *wcid_keyidx;
@@ -611,7 +611,6 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 	link_sta = sta ? mt792x_sta_to_link_sta(vif, sta, link_id) : NULL;
 	mconf = mt792x_vif_to_link(mvif, link_id);
-	mlink = mt792x_sta_to_link(msta, link_id);
 	wcid = &mlink->wcid;
 	wcid_keyidx = &wcid->hw_key_idx;
 
@@ -679,6 +678,7 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
 				  &mvif->sta;
+	struct mt792x_link_sta *mlink;
 	int err;
 
 	/* The hardware does not support per-STA RX GTK, fallback
@@ -700,12 +700,16 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		add = key->link_id != -1 ? BIT(key->link_id) : msta->valid_links;
 
 		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
-			err = mt7925_set_link_key(hw, cmd, vif, sta, key, link_id);
+			mlink = mt792x_sta_to_link(msta, link_id);
+			err = mt7925_set_link_key(hw, cmd, vif, sta, key, link_id,
+						  mlink);
 			if (err < 0)
 				break;
 		}
 	} else {
-		err = mt7925_set_link_key(hw, cmd, vif, sta, key, vif->bss_conf.link_id);
+		mlink = mt792x_sta_to_link(msta, vif->bss_conf.link_id);
+		err = mt7925_set_link_key(hw, cmd, vif, sta, key,
+					  vif->bss_conf.link_id, mlink);
 	}
 
 	mt792x_mutex_release(dev);
-- 
2.43.0


