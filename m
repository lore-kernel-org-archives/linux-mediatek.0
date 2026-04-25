Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F244FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMZ4OKxAOpjq1wTGWUMmzIk1+fYlw284KMgTkrD2fbY=; b=yNwwW1r2UpmuY2DeCDPiSEf5K9
	cIE4ESLzG3y7j2UFY/shqwwJ33mO3TdgX1P3WKEQOYzae0QKUnG33Y3GFqRucwGn1Qg1rZQbSgZwh
	7TaibCtUTQkMwtHydcJM6UTrYCk02RGaI/rq1EYNXdLt+oQhQ+upF0BHr6y5LxHD9YDZfam73VD1u
	liro2kL9NdL2JcUKuS5tuivQexx3Cdnpj3fAapXwg9GhcW14Ay1xPVQSFFafAV+Uwta6gAEMXaBZZ
	uCX89YUcT1Lj4O9DP/J9GlVfjiJ2pHhR327s/h353+cIl+s923eJlkN2cPnLmFv76jqPkI5VSjeQI
	5Zhglrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfF0-0000000EYbl-1mnr;
	Sat, 25 Apr 2026 15:48:22 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfEy-0000000EYbQ-0tkR
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 15:48:21 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-415e568a7ecso3660458fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 08:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777132099; x=1777736899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IMZ4OKxAOpjq1wTGWUMmzIk1+fYlw284KMgTkrD2fbY=;
        b=VbunkHLivmI0DEzH/tWD/eU9V72SOEuoMkxjgfvjfA2LTzpXnTxcqKW3HGFQbX6BF9
         3R9gU/1DkdxXIHXliIs6wu/oGUhgaY+q779xrd4CEhsJFL7MH4GG/XSE3ONmFP9IZ7Q5
         4O1VYqa4ITOhcsvIeqZhN74IROpZq7BTC3buObEGVgeMxaR8vZ4XOCeP4+g8neMsz8nM
         /LTQFQ3uTRcCYT6C/3H8bXVzBaCixCmh8Qzfvnm8GzVkc8ZnsvZUZPSppddpig+hb2Bf
         LnbP7MBTXMtSXvyUT1FM/wjFWj98MdYqPWyxnAk3HdGboHM/TknEmM1yOYHCrJkhrsHp
         LlgQ==
X-Forwarded-Encrypted: i=1; AFNElJ97Pzly7nvfRsMBmYOw3J9BMdOnDd1BBAf6pXSYvUXCq3rFzshS67o1YekeaM+Q4QLA3q9SdHaox5Ge4sYPjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfsHc9Gu7gtonnulrNUTTM7xqCR2E+bBB/laEgENJ8mhbbGKMT
	ViXL47gpUfHc+eXgjZCWP8qBEdWXDplXoYtjO3CisLjzQcYWKqn2ws4GrWMKSw==
X-Gm-Gg: AeBDietnyVkKDagOih+UcIRm8PEsDkqsu7jqTazLFjP55byPU1tOZgQ7rXGr3lJQaPI
	lyleNnzVRrw4pX+trldxYlY4aqTA0G/NuHr+OvJ9fNtxiCCPCBL2YINBrayMopGyC/bP55S7Bnr
	+Mpjb07kBoXI6WCWFaVo8JuXrvdc0310earbLirSDuBviBOuB4ykt7ZdGjZkFFGLXNhpgvFRK5r
	+tjCH9yE9KshqXDt5qkhoIWQ/EeCAUu2GftwGXmi9PGFQd+xI9uZ8rnQDT7f9Jxf3bd1/ddaWro
	k8I82Epu78UibkkQ6fq8c5sKjJPKatWP3WSej2TWXs6idh5J0/BoYMBUUtji4T1DCWEVLBSyqZw
	dIyK+wUmKLwCMAx8MFXCXy/0zwZM5gVAMOYS62fUDwCcu1hu/HxUoZxpJer9IK8/iU/My1JKEWD
	5u7DMtLrOHgI3bU+lKVPh4NzNeLX5K6AXZYM2up45QrdVzNjvOZvG4EEOEQrNCANi4wlyfBctXW
	PG/opDuhewn
X-Received: by 2002:a05:6820:1693:b0:694:9861:ec59 with SMTP id 006d021491bc7-6949861f23cmr12572803eaf.28.1777132098843;
        Sat, 25 Apr 2026 08:48:18 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:9f96:11d3:5f6c:5582])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69493183021sm10094808eaf.13.2026.04.25.08.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 08:48:17 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Yao Ting Hsieh <yao-ting.hsieh@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt7925: program BA state on active links
Date: Sat, 25 Apr 2026 10:47:21 -0500
Message-ID: <20260425154721.738101-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425154721.738101-1-sean.wang@kernel.org>
References: <20260425154721.738101-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_084820_268149_D91B8D02 
X-CRM114-Status: GOOD (  11.93  )
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

With MLO, traffic for one TID can be sent on any active link. Programming
BA state only on the default link leaves the other active links out of
sync.

Program BA state on all active links instead.

Fixes: 766ea2cf5a39 ("Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO"")
Tested-by: Yao Ting Hsieh <yao-ting.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 10 +--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 67 ++++++++++++++-----
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  4 +-
 3 files changed, 59 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 73d3722739d0..7c20fd9522cf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1372,22 +1372,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta->deflink.wcid, tid, ssn,
 				   params->buf_size);
-		mt7925_mcu_uni_rx_ba(dev, params, true);
+		mt7925_mcu_uni_rx_ba(dev, params, vif, true);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
 		mt76_rx_aggr_stop(&dev->mt76, &msta->deflink.wcid, tid);
-		mt7925_mcu_uni_rx_ba(dev, params, false);
+		mt7925_mcu_uni_rx_ba(dev, params, vif, false);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
 		mtxq->aggr = true;
 		mtxq->send_bar = false;
-		mt7925_mcu_uni_tx_ba(dev, params, true);
+		mt7925_mcu_uni_tx_ba(dev, params, vif, true);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, params, false);
+		mt7925_mcu_uni_tx_ba(dev, params, vif, false);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 		set_bit(tid, &msta->deflink.wcid.ampdu_state);
@@ -1396,7 +1396,7 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, params, false);
+		mt7925_mcu_uni_tx_ba(dev, params, vif, false);
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index c720d21c1727..b6f7e4a94f57 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -651,32 +651,69 @@ mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif_link *mvif,
 				     MCU_UNI_CMD(STA_REC_UPDATE), true);
 }
 
-/** starec & wtbl **/
 int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 bool enable)
+			 struct ieee80211_vif *vif, bool enable)
 {
-	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
-	struct mt792x_vif *mvif = msta->vif;
+	struct ieee80211_sta *sta = params->sta;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct ieee80211_link_sta *link_sta;
+	unsigned int link_id;
+
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
+		struct mt792x_link_sta *mlink;
+		struct mt792x_bss_conf *mconf;
+		int ret;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		if (!mlink)
+			return -EINVAL;
 
-	if (enable && !params->amsdu)
-		msta->deflink.wcid.amsdu = false;
+		mconf = mt792x_vif_to_link(msta->vif, link_id);
+		if (!mconf)
+			return -EINVAL;
+
+		if (enable && !params->amsdu)
+			mlink->wcid.amsdu = false;
 
-	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
-				 &msta->deflink.wcid,
-				 enable, true);
+		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, params,
+					&mlink->wcid, enable, true);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 bool enable)
+			 struct ieee80211_vif *vif, bool enable)
 {
-	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
-	struct mt792x_vif *mvif = msta->vif;
+	struct ieee80211_sta *sta = params->sta;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct ieee80211_link_sta *link_sta;
+	unsigned int link_id;
+
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
+		struct mt792x_link_sta *mlink;
+		struct mt792x_bss_conf *mconf;
+		int ret;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		if (!mlink)
+			return -EINVAL;
 
-	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
-				 &msta->deflink.wcid,
-				 enable, false);
+		mconf = mt792x_vif_to_link(msta->vif, link_id);
+		if (!mconf)
+			return -EINVAL;
+
+		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, params,
+					&mlink->wcid, enable, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int mt7925_mcu_read_eeprom(struct mt792x_dev *dev, u32 offset, u8 *val)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 46b480f7d813..01d033fb1433 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -293,10 +293,10 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 				 bool enable);
 int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 bool enable);
+			 struct ieee80211_vif *vif, bool enable);
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 			 struct ieee80211_ampdu_params *params,
-			 bool enable);
+			 struct ieee80211_vif *vif, bool enable);
 void mt7925_mlo_pm_work(struct work_struct *work);
 void mt7925_scan_work(struct work_struct *work);
 void mt7925_roc_work(struct work_struct *work);
-- 
2.43.0


