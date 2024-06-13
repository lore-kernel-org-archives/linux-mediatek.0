Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9493FC27C77
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5Ixihb5+/Ac4FqRSaORRJ9EOehUjft02rbomkCQY7Y=; b=o3VhvK4Gij6EaQoOmq7KkqteKx
	TTDsmMzD+RUM558wMvPra2p9PugXdaaU6pOYOWRVIHkk4a5FuBVo0ZWmLNUsAde1wBAq/YXc0axia
	7Y4OB7vTjnxm7lFXb91JEQdZ8NrpUSycZjEZmQhEz4e5CeUMdKNSeGPFjoZKiMFS8OPsne9UcJihE
	qYNwvmnzkD24u+7skgJTRgKOVQLVQAgA4MFOFXlFDlAXZZp/caTDfRAs6RMlGF3tmu/FusX9+RK8V
	p6JIplKeqZgREvTDxME+r5/KrcIClIaHcTR5G+u/dfiKIsWyaAffluVV+oAABzh2wXbMFpXGH5Uec
	hmOJnSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakP-0000000Evrk-3z5H;
	Thu, 13 Jun 2024 03:03:34 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakL-0000000EvoG-0FY5
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:31 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-24c5ec50da1so92030fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247808; x=1718852608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5Ixihb5+/Ac4FqRSaORRJ9EOehUjft02rbomkCQY7Y=;
        b=Ui1GOtNWSTGT2z2veK90Y0bKfDorXM/V+V0qe2l+zdCN7ZxrVRWQo0ZlSw1/7ZDu3v
         iYYMkOurCQe6wetNBHMkpu5zx6prt9H0o7GXDxSoFtfpGhuFuF+icxRxm7R2VQfErVza
         7d9mcczbSQwNKPmQIUaydrr3WdT5rM/ZpA9WH6W2OMwebDqaTdeYdZpoTFKPSLdb2geZ
         hs8bN8yszYgovJy5qLSRWW1rDozQqXm84I3rm38hyyGNniT2b3Cwj1j3s8Jiu1JDmXIZ
         UKDVicJ/i0WSTfMkqqzrSO1ACncs/WYjOM5c3Ou1LedunkrxamvfkcjMmqhwxZusEjNO
         cINQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOnmOKWaMGC7zrauSlKqGzXat1jGAOGW3Eg2Y0WnHXf9ovPet9YoZ7q5KN1kptAfgJN/NTtTU9993KbeJg//ZIMNPSlvo30PN2/0Ci9q8axuzU
X-Gm-Message-State: AOJu0YxSq0qFUjAPTqHP3ErGNc2b7auGVUcQ+ztuKYU+t51FFYIrbKWz
	SIxI/bHcHW5zkt5PZ7dXfc8GCOWwIAuT0dOxcd+d62BZK3F/ufnm
X-Google-Smtp-Source: AGHT+IGDTHOgtVT/95Hk2G2qO7v3gsdpwBALKEJ1QGY3fm1CGLY8vR3hjc+0x0gz/D/7VX5N0Zit7A==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr285708eaf.1.1718247807616;
        Wed, 12 Jun 2024 20:03:27 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:25 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 19/47] wifi: mt76: mt7925: extend mt7925_mcu_[abort, set]_roc for per-link BSS
Date: Wed, 12 Jun 2024 20:02:13 -0700
Message-Id: <20240613030241.5771-20-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200329_447998_FC927EB4 
X-CRM114-Status: GOOD (  14.71  )
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

The channel context has to be bound with the per-link BSS, thus,
we extend mt7925_mcu_[abort, set]_roc to work with the per-link BSS
configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 23 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  8 +++----
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  4 ++--
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index aeed2c777a20..bba17e51a023 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -387,7 +387,7 @@ static void mt7925_roc_iter(void *priv, u8 *mac,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = priv;
 
-	mt7925_mcu_abort_roc(phy, mvif, phy->roc_token_id);
+	mt7925_mcu_abort_roc(phy, &mvif->bss_conf, phy->roc_token_id);
 }
 
 void mt7925_roc_work(struct work_struct *work)
@@ -408,7 +408,8 @@ void mt7925_roc_work(struct work_struct *work)
 	ieee80211_remain_on_channel_expired(phy->mt76->hw);
 }
 
-static int mt7925_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif)
+static int mt7925_abort_roc(struct mt792x_phy *phy,
+			    struct mt792x_bss_conf *mconf)
 {
 	int err = 0;
 
@@ -417,14 +418,14 @@ static int mt7925_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif)
 
 	mt792x_mutex_acquire(phy->dev);
 	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
-		err = mt7925_mcu_abort_roc(phy, vif, phy->roc_token_id);
+		err = mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
 	mt792x_mutex_release(phy->dev);
 
 	return err;
 }
 
 static int mt7925_set_roc(struct mt792x_phy *phy,
-			  struct mt792x_vif *vif,
+			  struct mt792x_bss_conf *mconf,
 			  struct ieee80211_channel *chan,
 			  int duration,
 			  enum mt7925_roc_req type)
@@ -436,7 +437,7 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
 
 	phy->roc_grant = false;
 
-	err = mt7925_mcu_set_roc(phy, vif, chan, duration, type,
+	err = mt7925_mcu_set_roc(phy, mconf, chan, duration, type,
 				 ++phy->roc_token_id);
 	if (err < 0) {
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
@@ -444,7 +445,7 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
 	}
 
 	if (!wait_event_timeout(phy->roc_wait, phy->roc_grant, 4 * HZ)) {
-		mt7925_mcu_abort_roc(phy, vif, phy->roc_token_id);
+		mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
 		err = -ETIMEDOUT;
 	}
@@ -464,7 +465,8 @@ static int mt7925_remain_on_channel(struct ieee80211_hw *hw,
 	int err;
 
 	mt792x_mutex_acquire(phy->dev);
-	err = mt7925_set_roc(phy, mvif, chan, duration, MT7925_ROC_REQ_ROC);
+	err = mt7925_set_roc(phy, &mvif->bss_conf,
+			     chan, duration, MT7925_ROC_REQ_ROC);
 	mt792x_mutex_release(phy->dev);
 
 	return err;
@@ -476,7 +478,7 @@ static int mt7925_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
-	return mt7925_abort_roc(phy, mvif);
+	return mt7925_abort_roc(phy, &mvif->bss_conf);
 }
 
 static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
@@ -1345,7 +1347,8 @@ static void mt7925_mgd_prepare_tx(struct ieee80211_hw *hw,
 		       jiffies_to_msecs(HZ);
 
 	mt792x_mutex_acquire(dev);
-	mt7925_set_roc(mvif->phy, mvif, mvif->bss_conf.mt76.ctx->def.chan, duration,
+	mt7925_set_roc(mvif->phy, &mvif->bss_conf,
+		       mvif->bss_conf.mt76.ctx->def.chan, duration,
 		       MT7925_ROC_REQ_JOIN);
 	mt792x_mutex_release(dev);
 }
@@ -1356,7 +1359,7 @@ static void mt7925_mgd_complete_tx(struct ieee80211_hw *hw,
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 
-	mt7925_abort_roc(mvif->phy, mvif);
+	mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
 }
 
 static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0350f0e34690..a40ad1578212 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1050,7 +1050,7 @@ int mt7925_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 	return mt76_mcu_skb_send_msg(dev, skb, mcu_cmd, true);
 }
 
-int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
+int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 		       struct ieee80211_channel *chan, int duration,
 		       enum mt7925_roc_req type, u8 token_id)
 {
@@ -1086,7 +1086,7 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 			.tokenid = token_id,
 			.reqtype = type,
 			.maxinterval = cpu_to_le32(duration),
-			.bss_idx = vif->bss_conf.mt76.idx,
+			.bss_idx = mconf->mt76.idx,
 			.control_channel = chan->hw_value,
 			.bw = CMD_CBW_20MHZ,
 			.bw_from_ap = CMD_CBW_20MHZ,
@@ -1117,7 +1117,7 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 				 &req, sizeof(req), false);
 }
 
-int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
+int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			 u8 token_id)
 {
 	struct mt792x_dev *dev = phy->dev;
@@ -1138,7 +1138,7 @@ int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 			.tag = cpu_to_le16(UNI_ROC_ABORT),
 			.len = cpu_to_le16(sizeof(struct roc_abort_tlv)),
 			.tokenid = token_id,
-			.bss_idx = vif->bss_conf.mt76.idx,
+			.bss_idx = mconf->mt76.idx,
 			.dbdcband = 0xff, /* auto*/
 		},
 	};
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 07ea03195e4e..8ab2bb01ba73 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -292,10 +292,10 @@ int mt7925_set_tx_sar_pwr(struct ieee80211_hw *hw,
 int mt7925_mcu_regval(struct mt792x_dev *dev, u32 regidx, u32 *val, bool set);
 int mt7925_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		       enum environment_cap env_cap);
-int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
+int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 		       struct ieee80211_channel *chan, int duration,
 		       enum mt7925_roc_req type, u8 token_id);
-int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
+int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			 u8 token_id);
 int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			    int cmd, int *wait_seq);
-- 
2.34.1


