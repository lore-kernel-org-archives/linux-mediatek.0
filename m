Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C34FC44501
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBDMwG9/ky6ssL+TbdSqxt4N2oK3lmPKFilDE6MIEWE=; b=yuhunbOE/0qZBbN3t1XZxsz6ym
	kfm+3fjFUs/brU0x4brLu/16CsSYmfNQMgxWNjwvm4sxMRPHX3yRRn2/vunAFPyVvzY6SeIp/u69D
	H1TPJtQxxN/joejbxAMLd8ivAOTt9vZ5UbwoDBXCrkiGJIX8ldAL8US1as7vtSPlHX563iB5pR/95
	81Wn5D5vsP/oHiVpkUkTM9EaTwA5ksa9mRdr2RUF0HZqP6XJHhqHIVGSZzRrYtdioHtcB4/XIxNcs
	vntVcayw1+2tp77LX/k04n9qlbD4H6kzspOpJ3smarfK0RI6ljcd1IABpnFlUR237cy5x3BNrg5SR
	mERn5IoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLM-0000000BYx7-2AkO;
	Tue, 14 Jul 2026 10:26:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLH-0000000BYsk-0Xjz
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jul 2026 10:26:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so3646091f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2026 03:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784024781; x=1784629581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBDMwG9/ky6ssL+TbdSqxt4N2oK3lmPKFilDE6MIEWE=;
        b=XZdV4G7PX8dfaWWnLaBZJmOgddqP8n8XhV+lNR7sDqXcv1OkIW+Ot9qwSy13YQx8mw
         fZduMgRdFuuRQkMfF7jkEPDm8MPGGzjUf5zYAKALwJNI+ducL2TVtj7BA7vIyOWA26va
         18rFvR074OlkE0aqpy8RaTAHE8u/Uw5j3wiP2WgK2S+VLQ6bp19M6ZUqA6NXpHTqEnYx
         cPNkVwWEUZ1wYCepH6d9xpMy9eQ/xSCv2KpkTkSJxvQWZDEGdRmvKR06J3Cpasn6Kgya
         rcA/X/xsFAlI2mwxRe4qtk7hZI1Qg0/UwERsX04dF5cKKpWS3v7tnmxEyl+WKZs5yuix
         WIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784024781; x=1784629581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBDMwG9/ky6ssL+TbdSqxt4N2oK3lmPKFilDE6MIEWE=;
        b=Q+gTaaiEJNyexi9JeQF0C+8rMqdIhc3sSs4DMKJ+wnckSzq4Lao3IIgL13HY5HMhvi
         42eBBVQxHYtjJDOLM3AXi3d3BhSQopxn6pt2O+LkWWpBz/BJNVhlFvkt6jh24GfVjtUj
         LgrweBonYYD9SYReCk02a3wmUqSn2a6P9Eynq0n6BY4FEHz/sT2Lne9DpCWd8Tc/Fi8u
         z5eMpet90T3rmTlp915SbO/+4H5Jh/ZXecFgVYTnD1titFDXAAaq6aZCSH0FVk2bES2o
         2IIdXFvyBl4P/gO38TRCCdjfZwgYbyRbzkRicprRDfSZWB93Gf1TgQh86BuKfVTkvpCj
         hkLw==
X-Forwarded-Encrypted: i=1; AHgh+RpgpHdMwqFIxXayB3ZmSXr3sOg6vpS5Ne8tQLTsSjmcUQuUs3YokguJzrnZXnqrAY3QI48SF16e6i7rNnacJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlB+Uh61LV6E2f2bOMksXC/NE2ZAfQS+wvyDK56fILioA0pSkE
	L8GsTj6zN6MipvjIHBCfnN0L7xj1dWIiZuDeP6yp6Qzp3Biksftd4Sge
X-Gm-Gg: AfdE7cl0NTB0leDTfHQoaMtqH3M00/h3V60uqw9b606wppypvxPZ7LVAuOB1S4hP2fh
	hxZ2bjsy8CkkdyqpBuM5eT4Dwv6DQBT1MM5s9MWCOLkIhjQ9y9oR00iYKb34UnfhmAPoo4ru0oe
	OHrrarcCbxthmKiAL6sGcSzev0tGgW5eqARbO2yMpoyZdBjbqA0570B5sI78ISTbzxxJKH9bd0/
	L3Ju5cbMmz5w3deWtJWiUMRYZ3k3JsFlBFmiqAtE0S0DCrC9me86ri6UK8XwZtdt4Eiq11DDIZ7
	2EnNbx5wbijePxYKbN2K+WDFm86rkX7aQwOfeYra/xbOkmIUHCBQ1PE3dxq5m107P9SVox26VBB
	2dYL+7Q5aLPFzRp8K6tslE8CYsW+24/lFjuQFk2S+ug1p4bwIesvec7s9Y9J88TyxgT3AaHwotu
	fdMeUi7jl0P3If9juW9z7mKFkjW+rty84KL1TImXW0jhwXXw+uvKONoRbV7T7VIcDyhlCxUGQuX
	PLXM9A=
X-Received: by 2002:a5d:5d0c:0:b0:473:987f:c0ec with SMTP id ffacd0b85a97d-47f2dce7e1amr13941311f8f.36.1784024781255;
        Tue, 14 Jul 2026 03:26:21 -0700 (PDT)
Received: from localhost.localdomain (ip-89-176-136-191.bb.vodafone.cz. [89.176.136.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm7251991f8f.29.2026.07.14.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:26:20 -0700 (PDT)
From: Petr Wozniak <petr.wozniak@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	rex.lu@mediatek.com,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	Petr Wozniak <petr.wozniak@gmail.com>
Subject: [PATCH wireless-next v2 2/2] wifi: mt76: mt7996: register a LED classdev for every band
Date: Tue, 14 Jul 2026 12:26:15 +0200
Message-ID: <20260714102615.2943-3-petr.wozniak@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714102615.2943-1-petr.wozniak@gmail.com>
References: <20260714102615.2943-1-petr.wozniak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_032623_190546_A254C5B9 
X-CRM114-Status: GOOD (  12.38  )
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

The per-band LED callbacks (brightness_set/blink_set) were only assigned
to the primary PHY (dev->mphy) in mt7996_init_wiphy(). The 5/6 GHz bands
are brought up later through mt7996_register_phy() ->
mt7996_init_wiphy_band(), which never set those callbacks, so
mt76_led_init() bailed out early for them and only the 2.4 GHz LED was
ever registered.

The hardware path is already per band: mt7996_led_set_config() indexes
MT_LED_EN()/MT_LED_CTRL()/MT_LED_TX_BLINK() by mphy->band_idx, so per-band
hardware TX-blink works as soon as the classdev exists.

Move the callback assignment into mt7996_init_wiphy_band(), which runs for
every band, so a LED classdev is registered for each band.

Signed-off-by: Petr Wozniak <petr.wozniak@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index d6f9aa1ab..b77b85654 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -472,6 +472,18 @@ mt7996_init_wiphy_band(struct ieee80211_hw *hw, struct mt7996_phy *phy)
 	mt7996_set_stream_vht_txbf_caps(phy);
 	mt7996_set_stream_he_eht_caps(phy);
 	mt7996_init_txpower(phy);
+
+	/* Register a LED classdev for every band, not just the primary one.
+	 * Under single-wiphy MLO the 5/6 GHz bands are brought up through
+	 * mt7996_register_phy(); without these callbacks mt76_led_init() skips
+	 * them and only the 2.4 GHz LED is exposed. The hardware TX-blink path
+	 * is already indexed by band_idx, so per-band blink works once the
+	 * classdev exists.
+	 */
+	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
+		phy->mt76->leds.cdev.brightness_set = mt7996_led_set_brightness;
+		phy->mt76->leds.cdev.blink_set = mt7996_led_set_blink;
+	}
 }
 
 static void
@@ -542,12 +554,6 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
 	hw->max_tx_fragments = 4;
 	wiphy->txq_memory_limit = 32 << 20; /* 32 MiB */
 
-	/* init led callbacks */
-	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
-		dev->mphy.leds.cdev.brightness_set = mt7996_led_set_brightness;
-		dev->mphy.leds.cdev.blink_set = mt7996_led_set_blink;
-	}
-
 	wiphy->max_scan_ssids = 4;
 	wiphy->max_scan_ie_len = IEEE80211_MAX_DATA_LEN;
 
-- 
2.51.0


