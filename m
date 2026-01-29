Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6CDD358DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 08:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sv2sCi1LhoxanCq/pgAsKlL6gjjvT4vp60gwfpl3NMU=; b=DvRzNeYFSsRdWAs+pAINfHkdi1
	YWZ9CkwSM90m0w3ErpxAtLLiI4aYyNat510VRi+C8FIsPUELmq2iPEyoTs1xsfJ0CzAlNas8pYEeC
	waCNPVbREcJkLBP3CtM6i5EMTabJIxRZvbPeK3fA+CpvWo6n15oFQsw1PcoPE7YJ23ZpVH42hKaTx
	9wDWC9+rrJqX4blAQgh1S4Bsnp9OQv3AKc4c3IwIvbF9FkKeQBJ+xhUDqAd4sx07AFGp1ioXFiPsQ
	z6IQ83Yhz03M9pFjU6TWkHOVl1BD3VTpxUK3ETD+4huPghqTyjTrPnclnp078OnF/R2HGCexbxEfd
	DHMFncUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEv-0000000HRrH-0yC0;
	Thu, 29 Jan 2026 08:18:57 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEq-0000000HRoj-2Vhi
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 08:18:53 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-124b117776fso506518c88.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 00:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674732; x=1770279532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sv2sCi1LhoxanCq/pgAsKlL6gjjvT4vp60gwfpl3NMU=;
        b=FVI76NKTXkwI0agZUIl+VkIVmiU/cdAKl2JCXc+/nFSZNfN586ANGnoOqwdf/fjtjp
         xs1zFHf15v4QiJyH/xXB51qaHcULmIxygM5zRjl8O5BUzPnLhxohUvBcC/5OOaLiTKhC
         H4kdRK+F2GjNzkHEhvIp8pdPVx0BQzCNsA9nFcd3J+P03n3V8PaZxghUnjM4vh8eCtZ2
         pFgEgYgF2u7Yf4PlbDxR/Cm1ctxxr7uFqXXv0oi9/eqtiwqswG1ntM3m/IxhHiCErP1G
         VrkBu4hTx6ZNL1cmv6/YqM4/12jWtyf6IH+NsY7cx59s2+jF2fObjb8WvB1oQNlur5KI
         jBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674732; x=1770279532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sv2sCi1LhoxanCq/pgAsKlL6gjjvT4vp60gwfpl3NMU=;
        b=px5r2hkjdZi04EDaCaFmSM++jzNZvYxcH6LLmRLNlR3ZntqQXSldtpIMzUqcU8Aqi0
         U/OTD16q1wvCgyGYhepDMvXtOi29E+q0a7N8FKBRgvAMlp05PJCVStGTTvTCb2cXKplE
         O83myn39XQlmX9g4mmrnMZQGE3eAkag4m5lNPGWEq9g+ekSroym74/2aO+TgMWSeadID
         1UfXAEg9nEr/tqZ3OtfkSwvT5WFIkj4N3HPbTg3qpz3QPom8sqz1ZWvg8m3Ortd9jsss
         kwkBYDzzf4+mdMXTLgQaMgU3SH5RGcl800cKOgF469M5BnyO2Qpiy314PA0x5BNijNKg
         9Jaw==
X-Forwarded-Encrypted: i=1; AJvYcCUyIqXXt2G/KDjE4XgEz2s15ziCWsvAqHyuUgzvkEMgns7Dw4ySywed31Wy64RR/8HNE1RiYYCEq4xWkWoWqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVFklKB7CYCuVyzk2MIcLWfb6WsvO5pLFDxD5tj+jLESpq7p3X
	na10QokFmqLZdlacYyDj8u5C6u58Xm1W3n9xxizYytj4sz9x+gzDe2lH
X-Gm-Gg: AZuq6aL8RK5XjQbyqUXcvei++dO2Hi9/ENEBO+XxnAKkR+TsYDicTLNVEiuQma2o2Hw
	WK3d0wyvl5jsGn4pf7KdJkv1KY8Qgb0L1o+IDxOk+SIfJvPsEXDJ+5131NJ9iqcsF6ScNanKTxo
	q4qQKqZSsUhqlBQiOLyQq4Nh7Nx5JPxDI6NJ0OuoJX76axFzws7BBceDwEy8vx/tyTC0IXAXzCy
	PmicIxuO5nIC+hTCH0d4iOYw+iV9iAI3HhLv7Ncf4EWijFcXpXRg4ON7YM/hLBb9WURZ+5Q1Ul7
	oP4+fK+hoVX27aKDVeK9L3U+ApYG5lneEAn1MY6TmNpnhv1UiDjNyHmzyHvM20vJ9w5rWK7cNHt
	bWAeda6dBRiWGBy4vIAX+gTLT1Lyof90rGm+1qCVOlvcdanPTgaHZzzsA7dG/72FoefIHzdq+t9
	uFeJYF5NbhMAvc53DvIf2mNts2VQZll5SfcNAniaFZ7ALnUfUOeIf8atC/TKphUHgXE/rGSgM=
X-Received: by 2002:a05:7022:6a0:b0:11b:9386:826c with SMTP id a92af1059eb24-124a00d64dbmr5188230c88.41.1769674731965;
        Thu, 29 Jan 2026 00:18:51 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm5483508c88.16.2026.01.29.00.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:18:51 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: nbd@nbd.name
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	sean.wang@kernel.org,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH v7 4/6] wifi: mt76: mt7925: add MCU command error handling in ampdu_action
Date: Thu, 29 Jan 2026 00:18:37 -0800
Message-ID: <20260129081839.179709-5-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129081839.179709-1-zac@zacbowling.com>
References: <c9b81e89-cd29-44f2-b4e8-0179b2049c21@nbd.name>
 <20260129081839.179709-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001852_657586_8748DCF7 
X-CRM114-Status: GOOD (  10.30  )
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

Add proper error handling for MCU command return values that were
previously being ignored. Without proper error handling, failures in
MCU communication can leave the driver in an inconsistent state.

Changes:
- Check mt7925_mcu_uni_tx_ba() return value
- Check mt7925_mcu_uni_rx_ba() return value
- Return error to mac80211 on failure

Special case for IEEE80211_AMPDU_TX_STOP_CONT:
The ieee80211_stop_tx_ba_cb_irqsafe() callback is kept unconditional
because during beacon loss, the MCU command may fail but mac80211
MUST be notified to complete the BA session teardown. Otherwise the
state machine gets stuck and triggers WARN in
__ieee80211_stop_tx_ba_session(). This matches the behavior of mt7921
and mt7996 drivers.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 82de6f30ec27..8236edb1fb48 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1300,22 +1300,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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
@@ -1324,6 +1324,11 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
+		/* MCU command may fail during beacon loss, but callback must
+		 * always be called to complete the BA session teardown in
+		 * mac80211. Otherwise the state machine gets stuck and triggers
+		 * WARN in __ieee80211_stop_tx_ba_session().
+		 */
 		mt7925_mcu_uni_tx_ba(dev, params, false);
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
-- 
2.52.0


