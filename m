Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D25EC021A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 04:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dFB2FQZDy728LR2oVXqYPx5IKjU9F4S0qm3mUOW2x/Y=; b=A2B3UM8kNw1Ql6BHAeTH5bWLAG
	0A6o8SL4IcWj9Xt762yIFzTwswlblWG3aVC1hmD0L1o9JrwKRjO85V5JWDML1Cg95NXRdqE7zHzdO
	RtGVRe0/2zLctYOG7FYR1Zlg6qGd1dKljUgjueRJEcbTISrfUOkodGGp2Qidc2F3VCJ9v9apslVQz
	B2biawnmypr3Nn9cJFy0I45YAOqYSmLfZGH4EVB4nDSvEPSKZIeaWWZ2HBPasBn3b34w8/eesp+m9
	/No8SnLc34EzhJfCNKrSYKi32wZrisZ0rnPE0thQhdq7sruMuRFUoQ1isUuMatHdcRvqX/w1m6DY8
	qeTxySkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn8iG-00000002Ku5-3lfc;
	Wed, 26 Feb 2025 04:08:00 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bQ-00000002EKg-46XY
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 02:56:54 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2bcbfad2f8cso2599439fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 18:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740538612; x=1741143412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFB2FQZDy728LR2oVXqYPx5IKjU9F4S0qm3mUOW2x/Y=;
        b=g/IkclpVsIz7TgWssKB65jDBj2ZHYABbADAPb9jCyV5lOGtGKjrG8jTrKKj89LZeGP
         /kiDpedCl8P6hI9OX/NeFr7qxvvpxh+agiyZR8W0aGJO9fPq6itUU2wwB9kbMOKTpSmh
         1TyqPV+d5GeEgFPCbrkrnFJHDqwRGwbZi8mjW7q63KxyzJqW/CK7jp/ynIlYGk9l+G5R
         bHzHQIgNoeGtEHNxWK/walrYk3ITJg/JPeQNK4s+pNmju+T8s92B5s1eJ7bu8/7TzSQK
         6WHo+I7TOz9iyRjxub95E4Ymhzn0yIwG+Li8EMdD8+iis0PxyGL51rfxgu46weLooRMd
         EyNA==
X-Forwarded-Encrypted: i=1; AJvYcCXpfMEKfv14+KK/rXl5QHlxDkUUfsQ2KHO9PgNXHJRQMtcWQZVvNte5uhloLzjpT2G+F91eE1eo4IEtJdkZ/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZxklrO1fGvIQo+FvzSvmVyWnz6hM9tXME5lJSbPeMPFPjuaI6
	nJ1kB+1cX9BvrCcoQNDCDRYZNzBRayqgVIaAtrsXCdoDOQCujsyf
X-Gm-Gg: ASbGncuVYkG8YKUDheMOg0p6xYHOwxAoN/2ShdepaPeieathYaoro/mYrrQeOwmYpoc
	TbUv1vft4abSevBYnpL93r8c2qm98plFc1zccfhdvlu0/JXPDEjNAZ8pZPnvW2/PcArzdfAyq2P
	9xjeAMkoZhJn1Fm7xe8Al9YAmfaGoTUxe0lJedZpAMaiRx5N1BJ3D6EKIIzqPef6dUqo6FHd0bY
	KJPgcRVO3mFsObinGdT4LgA1UXHJ5/ViR+EUClFzxQ7zfdVl/Cx6sTjggUrVOdzIF4JuzB8nWJL
	UDv5suSZ4cFpB5WYdFOT98NIGkZUA1qiGLPdo6LMXts=
X-Google-Smtp-Source: AGHT+IHmwTTDvrBamsH9SHOSAyCie3DX9via90/cp21qptTv4gjlI8FuHuK5o3aDlvrSKUjqZLEcWw==
X-Received: by 2002:a05:6871:eb18:b0:29f:df6d:999b with SMTP id 586e51a60fabf-2c10f533092mr3549074fac.39.1740538611881;
        Tue, 25 Feb 2025 18:56:51 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c1113f0135sm676360fac.27.2025.02.25.18.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:56:50 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Caleb Jorden <cjorden@gmail.com>
Subject: [PATCH v4 1/6] Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO"
Date: Tue, 25 Feb 2025 18:56:42 -0800
Message-Id: <20250226025647.102904-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_185653_053996_08FB214C 
X-CRM114-Status: GOOD (  14.04  )
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

For MLO, mac80211 will send the BA action for each link to
the driver, so the driver does not need to handle it itself.
Therefore, revert this patch.

Fixes: e38a82d25b08 ("wifi: mt76: connac: Extend mt76_connac_mcu_uni_add_dev for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Tested-by: Caleb Jorden <cjorden@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
  1) generate the patch based on the latest mt76 tree
  2) update the commit message
v3:
  1) fixed the merge conflict
v4:
  1) added tested-by tag
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 10 ++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 50 ++++---------------
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  2 -
 3 files changed, 15 insertions(+), 47 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 98daf80ac131..8dba17c8697c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1289,22 +1289,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta->deflink.wcid, tid, ssn,
 				   params->buf_size);
-		mt7925_mcu_uni_rx_ba(dev, vif, params, true);
+		mt7925_mcu_uni_rx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
 		mt76_rx_aggr_stop(&dev->mt76, &msta->deflink.wcid, tid);
-		mt7925_mcu_uni_rx_ba(dev, vif, params, false);
+		mt7925_mcu_uni_rx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
 		mtxq->aggr = true;
 		mtxq->send_bar = false;
-		mt7925_mcu_uni_tx_ba(dev, vif, params, true);
+		mt7925_mcu_uni_tx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, vif, params, false);
+		mt7925_mcu_uni_tx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 		set_bit(tid, &msta->deflink.wcid.ampdu_state);
@@ -1313,7 +1313,7 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, vif, params, false);
+		mt7925_mcu_uni_tx_ba(dev, params, false);
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 15815ad84713..4c133200c70b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -607,60 +607,30 @@ mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif_link *mvif,
 
 /** starec & wtbl **/
 int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
-			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_link_sta *mlink;
-	struct mt792x_bss_conf *mconf;
-	unsigned long usable_links = ieee80211_vif_usable_links(vif);
-	struct mt76_wcid *wcid;
-	u8 link_id, ret;
-
-	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
-		mconf = mt792x_vif_to_link(mvif, link_id);
-		mlink = mt792x_sta_to_link(msta, link_id);
-		wcid = &mlink->wcid;
-
-		if (enable && !params->amsdu)
-			mlink->wcid.amsdu = false;
+	struct mt792x_vif *mvif = msta->vif;
+	struct mt76_wcid *wcid = &mvif->sta.deflink.wcid;
 
-		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
-					enable, true);
-		if (ret < 0)
-			break;
-	}
+	if (enable && !params->amsdu)
+		msta->deflink.wcid.amsdu = false;
 
-	return ret;
+	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, wcid,
+				 params, enable, true);
 }
 
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
-			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_link_sta *mlink;
-	struct mt792x_bss_conf *mconf;
-	unsigned long usable_links = ieee80211_vif_usable_links(vif);
-	struct mt76_wcid *wcid;
-	u8 link_id, ret;
-
-	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
-		mconf = mt792x_vif_to_link(mvif, link_id);
-		mlink = mt792x_sta_to_link(msta, link_id);
-		wcid = &mlink->wcid;
-
-		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
-					enable, false);
-		if (ret < 0)
-			break;
-	}
+	struct mt792x_vif *mvif = msta->vif;
+	struct mt76_wcid *wcid = &mvif->sta.deflink.wcid;
 
-	return ret;
+	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, wcid,
+				 params, enable, false);
 }
 
 static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 8707b5d04743..fd5f9d4ea4a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -263,11 +263,9 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 				 struct ieee80211_vif *vif,
 				 bool enable);
 int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
-			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable);
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
-			 struct ieee80211_vif *vif,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable);
 void mt7925_scan_work(struct work_struct *work);
-- 
2.25.1


