Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A867DD2ECF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGov7+UsnnkD8BK1HtQcfIxHNxhYSq3s1xKOOfEdd3U=; b=sXApZftFc1fMD0EqaymhWViHyl
	d+LhLrgliUg49zoh1ysNww9Y+lOtqs2lGmw/tlEAHL8gzpfqgLlVhN3GtsjdN9DVAV7z5rrbnojEH
	glRS5VDiYrAL5FjkcwdhKl7vszlPOsvd4q18p1tfOz+rxKDmrEvhSDibqjObTo/idqYbF26TqtTzf
	6IJu+/CQWNCDSnFuDLeqJ2HCyMbCqucaLExaeEmWPDcrfteqeo1PLqn7Y3SO+rLM3pT4svIRQeQmJ
	WYpnFtRaxkP3Ol8FSrUvmln9CcxA2c4ntvnriqHqnFdRu2FTZT54cJsSgrT4bZAV6mH8nnGoV1eys
	/hHuh/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ep-00000003Ggx-3zBi;
	Tue, 20 Jan 2026 06:29:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5El-00000003Gce-1Dfy
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VGov7+UsnnkD8BK1HtQcfIxHNxhYSq3s1xKOOfEdd3U=; b=Xr+GrpdQlpAh2vLK+6KRlsV4IS
	blk9R5reGUs06X0CtwW72IM1Man23g4S14LP4GjZ+6I6KjZ9yg0HPig43Ld+1c+u9RkTvXpn9GOvQ
	N9V0Q06HvrpWEKoqhl2HQJiy/OdOl8KW/tlmRHoCvxqgddZOwDieffSzY4nkNiKTECRh/CNWbwEcM
	pmVmnkOEbEMCDTmNJeOaxS+Zp1aD86tAP4GrvIWwAsOl0fkKxGPkUnp/mG2lPAOVcy42lVa6EqgrX
	vzkQxExazlvW1JKR8BlfmQKKJzWWfXOubYP2UjQRbBtuQ4cJJd2hi4fwFNF5jtFPvPr6WwPERJqW1
	ULmkePxQ==;
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ei-0000000DP6v-2Jnd
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:10 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b6bf6adc65so4982890eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890547; x=1769495347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGov7+UsnnkD8BK1HtQcfIxHNxhYSq3s1xKOOfEdd3U=;
        b=ZjC8yUiBli2ZWoOXORKeDxqweQOlbn6tNLlDX96frptHY++KEm+lR8bsHpDgp/OT9t
         YitgWXuRmwitXtT8pXW/LfaBAhnm0FXgMqjzqfGqxs7SnOiN7XzNlErU7czEXlppp4Pd
         mEUr4Y+Uz4BNxHo9suaIS1FJr9z9BxpMFN9N94WtC9Im/k74EV4MpGoENqzw0Kj1U/WQ
         KIDgZ8B/cLRDYWsFEThVcp6kUbC1T6BWWM9EfMxV60/nwwM7q/7jYFsQK/gjIdNmdxXm
         8YNCIXbD8CAbOe6aRjJ7w5aWFXpWu2oMGZ5ls5oP7JD8IrIBNT5n3cs++yQmpaXe+S3U
         sjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890547; x=1769495347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGov7+UsnnkD8BK1HtQcfIxHNxhYSq3s1xKOOfEdd3U=;
        b=ETF2TMOoIntHebc48C4VtzsfunydV7mqGSXEWae8SKFEZoz9BFT2JCze8D0P72ujNR
         ZbrOJllmdPBCv2xGpJltrJPKp5eRNimyArUILYAxys6gjMlQv6OvMAamruxu9mVZsaQo
         g3N3Vmo2kgB0IE2pl2bM2lTYCmkRei+Z/Gc4JyuTJVK0El9WVmqgKZeUTM8nK8iO6H4V
         IvY2vTqCFPr8wmqFajhVyJOMMkA0cZLa1zUgC0o41teGZNylTfnSXlP762JYnM/2lIQf
         E8iZJsmPjBCyU6E3x3CchcE4ZizqW9qsIACyUmtd3P+K3TtDUv9Aqob43Wy2MEoiLnsr
         T2lg==
X-Forwarded-Encrypted: i=1; AJvYcCXb139pmxHoxF7acMhzssc2bPZzxEe//9EowAiyfM70/KbyjBlHAHriGguz83Mu/2RiQKBSgu2ct1LlE9VTkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCml1KZY1uJnbIGBkbJv0ZlXPESZrMXn0VvcpQ/YWpnVIqE9GX
	QXi+fPN4o4/L1E8mSlkBcbPeimvQ15hBKJG28i3z1n9CdtG+QDIx0DHH
X-Gm-Gg: AZuq6aKPU1i7e0qKOb6LQO539aLSlNiczq0NwHEwABOsvWYOji6TuOVNiOGIPIYu6PF
	zw2S5qBiPYzus6KQdMuBA7bNby+wLl71MxDpms3ErugSJc8sZOFEk+T2p9atCr0oVnr0Mu1kgDl
	0pZn0eXvCHNyI+vas4d8YsYYsyC/q/fDMnbReEXAlyRJbPSrTKTM1e5CFHQLoO2Q5sVlXo4BQir
	aWonJ/sGDQ3UY0QR/R8w6RZ0QhfdUoNkx5/3/f5kxihQxqrhGyqUFC/iY3ird9khXRb/3oMSizR
	O4jzCgDpyZ2IRoK2iE5KyVGkT7ZTDPKMYcvxe9PW3my0MR4vomiQ7Sp8WBbDUaupM4Vn7Hylj2A
	tLZ0+RPYRXh5wWWK0VndNAdeJ+eAri48x+pSRKJNMEiRuXSbvt8SJ3IQKs0iscVYtPda2s9BCAX
	MmCDedsf+VblHK5dq9+fKN0QCIcpPSL6Nu3/IzDAoBti2BWnTFbDYAyN+p3Sg2lUGZm/duoJA=
X-Received: by 2002:a05:7300:6420:b0:2ac:1c5a:9950 with SMTP id 5a478bee46e88-2b6b4e98df3mr12535539eec.34.1768890546301;
        Mon, 19 Jan 2026 22:29:06 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:05 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	stable@vger.kernel.org,
	linux@frame.work,
	zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH 07/11] wifi: mt76: mt7925: add MCU command error handling
Date: Mon, 19 Jan 2026 22:28:50 -0800
Message-ID: <20260120062854.126501-8-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062908_729420_6C15FC84 
X-CRM114-Status: GOOD (  10.28  )
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
index 80ca5181150b..5f8a28d5ff72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -637,8 +637,10 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
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
@@ -904,11 +906,14 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
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
@@ -1287,22 +1292,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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
@@ -1311,8 +1316,9 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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


