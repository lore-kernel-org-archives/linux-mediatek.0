Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF7FE7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MR5d/wysEF0Kf7ZmoLEbw9RGTdi/T9opkbjQB4jDM80=; b=FRCfQ720N1Hm00LBasi5DJfHAt
	1knSB/c2/AOIquF+nIuPldR5aSZe9ssDsDn6gMC6sUcCLs6WTgg3llyo2zo1cb232KXzPboZ4GNLW
	IgobU0aOovtxDNtPdyaLcjyztuIF9Z/gjHuAdQMFfjpml5aofrbDI8M8uOY8nU4nFy27jxPmPs+2L
	vWwoJCPLY7xWm811zI4w4H58zPKQaO32mEyeN1mYydBzghAcgjoRb/D94Z7WZnA+vIWapoQPN7K0d
	ycLPLqeVg7yZf7xRsCIar361o1vjHQpI1mDGgUz4hO2c71QQQbMiUW8FgmC+QSm/BNWreiBZGvklT
	Oqzyn17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOz-0000000DP3r-2n0F;
	Wed, 11 Dec 2024 01:20:33 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOw-0000000DP0k-3AN9
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:31 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3eb8accbde3so5447b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880030; x=1734484830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MR5d/wysEF0Kf7ZmoLEbw9RGTdi/T9opkbjQB4jDM80=;
        b=WWWBHA3mHcb3JULl5QslmNHeeMfKn2gT5PYDni0vUFce0vz7B+vuJ36Y0z2sLbuPfi
         NeQBsjHGBsoLYNCHnY5OnQN6/N33Jrxeb+/1M+fq/UBErVtAFXp1PBqN8Os143tjs/0b
         fOMt0jX9OoJzVkJKp6cYil0hzhn8WkaWmR7CIf66FSzSPWmtfBvTYOCnQDdhpiHwTH7p
         5wSVa5G86peY/1pP8MHQoLKERldlXCxS+3Wrm0NN4jwWqWP4/VjPyJE7FZkc9XRGdQzU
         quPR27wqU7WFaC0SlW1IEPTfT2YXUl3XYNxEom8KW2dRD0DqoP0J3c5ALEwusE9YFxZK
         mRIg==
X-Forwarded-Encrypted: i=1; AJvYcCVsgvyBT4iS1jXmvHaPGjkqglN1mXeDxKXv5atiivOiCEpS/CoC0ijhe8WlseLEWa2vtgQNLYy4MqKGLJ7W0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHMYA9BLhajAkGaqKTBSD6Ml6UN6aq34ODQfHyjAAhtepDuRs6
	f2xG/Vce6NI2SNbrjBoM3vwJ7UWxxpl6NtPVP5TgpJbb4Z83+R+i
X-Gm-Gg: ASbGnctnakILlaWnTTsJuYwo55zSJFl4qADZwRir11i80dwedy5dFn1+DGFyrciU/je
	BMaXr425NfuNE94mQc61XWjY1DeLmEPBRSUAMFf4j4AF3K27G0LqX46vyH5TbZr2eixsRR4zXM8
	nOI74a0vURmSdX857pobDTZPvXBMHpI3j2fwO618+SHuTHrLU4WLfdUoE8TdMlTQhh0eQZaiFNV
	ZTeWr5S/8GkXPBYEku9MFucoDFSWrJ19APqdoUPQdSa3HuBZ4/W4DD+QjRUqd6ALrjy0vs=
X-Google-Smtp-Source: AGHT+IEOqF5pb1wUGU1VDty28sTsMA6yF3gA7xTiIBtgG0SjYjInlv2zCwobaX0GRnv9XZ04592Gfg==
X-Received: by 2002:a05:6871:58b:b0:29e:2a06:8405 with SMTP id 586e51a60fabf-2a0155a6f54mr463201fac.19.1733880029797;
        Tue, 10 Dec 2024 17:20:29 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:28 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 15/17] wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO
Date: Tue, 10 Dec 2024 17:19:24 -0800
Message-Id: <20241211011926.5002-15-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172030_793148_F9812972 
X-CRM114-Status: GOOD (  12.50  )
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

Update mt7925_mcu_uni_[tx,rx]_ba for MLO support in firmware.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 10 ++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 50 +++++++++++++++----
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  2 +
 3 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 6b2b91a0475e..da7a2a798545 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1258,22 +1258,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta->deflink.wcid, tid, ssn,
 				   params->buf_size);
-		mt7925_mcu_uni_rx_ba(dev, params, true);
+		mt7925_mcu_uni_rx_ba(dev, vif, params, true);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
 		mt76_rx_aggr_stop(&dev->mt76, &msta->deflink.wcid, tid);
-		mt7925_mcu_uni_rx_ba(dev, params, false);
+		mt7925_mcu_uni_rx_ba(dev, vif, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
 		mtxq->aggr = true;
 		mtxq->send_bar = false;
-		mt7925_mcu_uni_tx_ba(dev, params, true);
+		mt7925_mcu_uni_tx_ba(dev, vif, params, true);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, params, false);
+		mt7925_mcu_uni_tx_ba(dev, vif, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 		set_bit(tid, &msta->deflink.wcid.ampdu_state);
@@ -1282,7 +1282,7 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, params, false);
+		mt7925_mcu_uni_tx_ba(dev, vif, params, false);
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 9fafb7cce356..551b1827bb40 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -531,10 +531,10 @@ void mt7925_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb)
 
 static int
 mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif *mvif,
+		  struct mt76_wcid *wcid,
 		  struct ieee80211_ampdu_params *params,
 		  bool enable, bool tx)
 {
-	struct mt76_wcid *wcid = (struct mt76_wcid *)params->sta->drv_priv;
 	struct sta_rec_ba_uni *ba;
 	struct sk_buff *skb;
 	struct tlv *tlv;
@@ -562,28 +562,60 @@ mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif *mvif,
 
 /** starec & wtbl **/
 int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
+			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
-	struct mt792x_vif *mvif = msta->vif;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_link_sta *mlink;
+	struct mt792x_bss_conf *mconf;
+	unsigned long usable_links = ieee80211_vif_usable_links(vif);
+	struct mt76_wcid *wcid;
+	u8 link_id, ret;
 
-	if (enable && !params->amsdu)
-		msta->deflink.wcid.amsdu = false;
+	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		mconf = mt792x_vif_to_link(mvif, link_id);
+		mlink = mt792x_sta_to_link(msta, link_id);
+		wcid = &mlink->wcid;
 
-	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
-				 enable, true);
+		if (enable && !params->amsdu)
+			mlink->wcid.amsdu = false;
+
+		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
+					enable, true);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
 }
 
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
+			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
-	struct mt792x_vif *mvif = msta->vif;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_link_sta *mlink;
+	struct mt792x_bss_conf *mconf;
+	unsigned long usable_links = ieee80211_vif_usable_links(vif);
+	struct mt76_wcid *wcid;
+	u8 link_id, ret;
 
-	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
-				 enable, false);
+	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		mconf = mt792x_vif_to_link(mvif, link_id);
+		mlink = mt792x_sta_to_link(msta, link_id);
+		wcid = &mlink->wcid;
+
+		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
+					enable, false);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
 }
 
 static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index f5c02e5f5066..df3c705d1cb3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -242,9 +242,11 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 				 struct ieee80211_vif *vif,
 				 bool enable);
 int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
+			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable);
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
+			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable);
 void mt7925_scan_work(struct work_struct *work);
-- 
2.25.1


