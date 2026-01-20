Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26030D26296
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiWhrqDfLoUsbF9Zs7wDHxbtT3qNnG6/I07ERDX6sCI=; b=tumhweq4ndnH32kgaK+5ggclTT
	UQtd9lT12ML4VhQE/QYYAbxeYyFaRSe2AvmmYXQE3aEd3bTyW8O7FeMMxhH3GGYyqpJXPtk5cV8h2
	J7ygO7q/x8kJ9xVEjYlWO+8DGm89Twlg0qecMxP+wKFojB4qpsfHil0NEMwc8z1PvXDGXk8f20lR0
	q1IHUoifqF37X7e7D+Yw5fIhgIDAaoU+MtVFQYsOJQZFRJLZu/b9fe2sG89qFEEfoDJXVagAOTVYs
	ecI2QtImDzq+WghrFX1TLMacEBFT+6F+GkLmasiS65UBkxJIO3iPiLM8aNzMuALrTOfdnHb4en3BX
	F6siw+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4E-00000004QC3-3udf;
	Tue, 20 Jan 2026 20:11:10 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4A-00000004QAV-3o2Y
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:11:09 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-12332910300so9238794c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939866; x=1769544666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiWhrqDfLoUsbF9Zs7wDHxbtT3qNnG6/I07ERDX6sCI=;
        b=hgazb5oeyL6mJaAT0SUN4qWOM/LoYE5lZ+KuzCuf+A6wlBRc0VQMPArd1ZN8JE2Nro
         HGV3CsQ47HeDXB0G57bnFIAiRHJ3Opz2nVNygnyPc/Pr27ZZr66aviFDEBrlgRElC4nF
         702M28ZdjnjB17C7KsZ3YIX8b50s7pdwXkSd+0r7gDqolM7HsNxWhp9nhCvkX/PJAXpI
         OnqyD3ViT0jG+TaC0CIGQEB2ljworUApSwuQXQxcpMBGMTAIBKbGvca067/cvDnLm48U
         VBq6ZiIFanjA8Xdyl19bobV8iLFG7jJ6Y80jrNlCyVZJ7+6tRhsRy0eDqvSFkR1xTIm1
         rs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939866; x=1769544666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiWhrqDfLoUsbF9Zs7wDHxbtT3qNnG6/I07ERDX6sCI=;
        b=LCvcvzklOkhJcONvBcfcsNWi56O9dNUJgBh9v/j2zs2p0n8LQADYVHaTG4VTFTrajT
         YPbwRxUrcALWz0UpB+cr/YyuyWUio7uyeiFpVVq5iFgcn2dgQmeOJthCAeqDCNF/YS/m
         aKIRBermGUNEKgH4z3jgkwHV6kA3SpRh0b094Z646CAwg5eHzBKjrhXL/uOKjJNkmTDX
         rDTfqZwbaP3N2i6kpW0E8n6V4lxpEWNr6AvivxjNfDHte2eHIwmCrVbuFq8bYOIq9S12
         EdZ/HTclVL+Si5TnUU3Xv5x3jLkCJUIg0rh0xHC9hH3xYjFjqi+jIbaqN5gtiUl+kWCD
         MMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAi3j6iiBO807zx1D/spATRastPpkX/REMqj+0jMoapCVa6LXriwinoEo9XzEPxRcj9p+ElAblXb8XrXHD1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiorwxLynxbxBRbPTXfS5wjt8ngNb1dtWpBjREX/vRQDhxqWfK
	Jn5R7yW5CA+7ATaQ+dg4souJFPDlptqL5EYSjNoLYrplUqBfdpw1J6C/
X-Gm-Gg: AY/fxX5owtBL7/4l+cuzScX4EdcxXKda/WEKb7xEGdRGdT7hrB4J9ycw+iVcm+8sU8T
	6aODK/UyvaljJJ2lTr7bHYzBH4sAlyRShx/uphj9QIxUm9KJnT2pokdqTxkt83EPkxvtnLRTk7v
	lozwNVBKeWoNllgCAjuEQfl5IQ4hiyPMxxZWWNS+dvBNS7tIHs88nY0sh84Z8L/5NRvc2ZufHU/
	rIall5I3mhrWYoVwhBVgBt+8mmWRr8hV58kf9z43cmJtntleSOIeKduBSszdT7FRmBKI5gS5OJ/
	Jf2kCG3vvBzUVJ37bPSqlievoeCBrmqYMER+JKu7yMu8jdahB3FZdDTaK2A9zUjZ5UfIJtIRNGV
	Y3tUqisK6vlEHHkBYwVIYMHo5G4likg8Jx5x2dx7Lo6WvV40nN50kpazuPEIuuD/anPudNJJdmY
	KqKU8eFjc+mMaKDpXXMh/NMuCRJ0ThYEpbAjGcqAAQTmfjHsHBYGI2/MKJOjvNb4wXhm2PUUZM
X-Received: by 2002:a05:7022:2514:b0:122:2f4:b247 with SMTP id a92af1059eb24-1244a75ea33mr10938645c88.28.1768939866099;
        Tue, 20 Jan 2026 12:11:06 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:11:04 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH 08/13] wifi: mt76: mt7925: add MCU command error handling
Date: Tue, 20 Jan 2026 12:10:38 -0800
Message-ID: <20260120201043.38225-9-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121106_953236_EC74BD0D 
X-CRM114-Status: GOOD (  10.33  )
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

From: Zac Bowling <zac@zacbowling.com>

Add proper error handling for MCU command return values that were
previously being ignored. Without proper error handling, failures in
MCU communication can leave the driver in an inconsistent state.

Functions updated:

1. main.c: mt7925_ampdu_action() - BA session setup
   - Check mt7925_mcu_uni_tx_ba() return value
   - Check mt7925_mcu_uni_rx_ba() return value
   - Return error to mac80211 on failure

2. main.c: mt7925_mac_link_sta_add() - Station addition
   - Check mt7925_mcu_add_bss_info() return value
   - Propagate errors during station setup

3. main.c: mt7925_set_key() - Key installation
   - Check mt7925_mcu_add_bss_info() return value when setting
     BSS info before key installation
   - Prevent key setup on communication failure

These changes ensure that MCU communication failures are properly
detected and reported to mac80211, allowing proper error recovery
instead of leaving the driver in an undefined state.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f1884944f77d..59a5b22a6ed6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -641,8 +641,10 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
 		mconf->mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
-		mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
-					link_sta, true);
+		err = mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
+					      link_sta, true);
+		if (err)
+			goto out;
 	}
 
 	if (cmd == SET_KEY)
@@ -908,11 +910,14 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		if (ieee80211_vif_is_mld(vif))
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, link_sta != mlink->pri_link);
+			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						      link_conf, link_sta,
+						      link_sta != mlink->pri_link);
 		else
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, false);
+			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						      link_conf, link_sta, false);
+		if (ret)
+			return ret;
 	}
 
 	if (ieee80211_vif_is_mld(vif) &&
@@ -1291,22 +1296,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta->deflink.wcid, tid, ssn,
 				   params->buf_size);
-		mt7925_mcu_uni_rx_ba(dev, params, true);
+		ret = mt7925_mcu_uni_rx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
 		mt76_rx_aggr_stop(&dev->mt76, &msta->deflink.wcid, tid);
-		mt7925_mcu_uni_rx_ba(dev, params, false);
+		ret = mt7925_mcu_uni_rx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
 		mtxq->aggr = true;
 		mtxq->send_bar = false;
-		mt7925_mcu_uni_tx_ba(dev, params, true);
+		ret = mt7925_mcu_uni_tx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, params, false);
+		ret = mt7925_mcu_uni_tx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 		set_bit(tid, &msta->deflink.wcid.ampdu_state);
@@ -1315,8 +1320,9 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
-		mt7925_mcu_uni_tx_ba(dev, params, false);
-		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
+		ret = mt7925_mcu_uni_tx_ba(dev, params, false);
+		if (!ret)
+			ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
 	mt792x_mutex_release(dev);
-- 
2.52.0


