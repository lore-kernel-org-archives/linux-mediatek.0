Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C94FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCix2hnvWpaQXJraxGvSFEIUDfhFawzmHidJfMG7LfA=; b=E7ediNnSIHgtgGNna/zpjG8pW4
	MS75rWSiTulVo1JNl1g+1NLlSshXuUmb8+emfe2230S993XKZ19tQlbYD3ayNtZAEpZy6ABWLCh9V
	h8awQtX/WZNxHWSDompyxK/b3BO7SVySTIp0GkzRfyRsHOuBCMlkl8mJrp+VPja++ji7EG1SAKI5q
	zd9bNA64kvo2ZKbFWkAVQ1MSrZFsGUSJz3Jy87qUHVPQasbLmmZjELS3Ok9SaT3WfMOf4GI8W/5q9
	UsB8sv2Z+KkXf4AGtZA20Oiq54A5fCV/SeWz2PgGTNEHCkyVFO2UjVw/Q37sFpGoEopub5BCoAL9u
	oPeVBBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1l-0000000EmFf-32jm;
	Sat, 25 Apr 2026 19:50:57 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1k-0000000EmEz-1yJ7
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:50:57 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dbccf6a23dso7092394a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146655; x=1777751455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gCix2hnvWpaQXJraxGvSFEIUDfhFawzmHidJfMG7LfA=;
        b=msVtOFv1JN86u2BP1JIhh+v+MDPDh3d9rmeqXutr+8SC/TU13LZ+RVzT6/XkH//zdv
         aAFXI1TD7UnG91eOJvDQHZ3XyPQF1FY2a+S6VztnhBeIM2iRVdRhVu8AaLbjw3TkubeD
         s46yjZFGsGXgEqG7s69ynn+KNeKXEI2yRgU+Gl3/dC9ti3G7Cz+oT7v4tjgCZbd0Dt1R
         HX4N1WZ80c6apsTwzC+E9Fi0mRmXA0hZ6IQeQ5U7oyOjxp/G+IALMmlnYPckBSCphZi3
         6g+NC9nTM84O/Rfy4OTbvVMrHg9zby2FER3Gxn/aWe9UMOilhAAT00dhlDS87yvkjaTf
         VGPg==
X-Forwarded-Encrypted: i=1; AFNElJ/SwnNrVMOixBybGUExmFrQDfQK/DNtYrXJTypamnjJDPwwX1VRIxR60q34Ofohaq9+vRUbyeszV35SDC4Udg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2jNZbrpkdvljMvVZfzgsb53ugLw5VaUzhI/dxjp2EWU2Ggto2
	lFiPoYh/AXqyjOeLNa30OTOojGTapxkxdfyVyvqPRL7QRSwyoLGowOBv
X-Gm-Gg: AeBDiesl37ZIOstlfMmSlfWLC8Wy/U9UU/PiNLuEbmR8HkQYmfsrXYrFqKN81WiSg2q
	1fOz15fZ2z7H86m+12/VAVdH564SmrLdDcHNK0qiRO5fVMt7eOOlP848S/9MNrbl0gSGf7WU1iv
	X/ZAmWrNtIgBmmoSYZ4SQRo16BGifHn49RiGfjnKGGHpE9mAmzWXLCFu5pTFMYtumkdPLFa/ujz
	T+b1enZ41e6IPEwn3Mf5Aqo7Ov0jhOXM/U/owYnkrwUGVj3DzYKd0Q0yTcdV5IHwsNQ/Erwg8kD
	vP8fOxPlokP7T7jv8RmnPEKBVqr209F8n7dTljd5tzi7a7PqAU/bUWdfbvCmSeg32xzpsuCt5mE
	xHTxHmcPxZj6/GCdNwMIE+2IuB3XUasVZv2BAYMUtcqd4Azb2IDT8yR1SXpwXYvRPJVGL18Gei3
	GN+bVO1qJiIk7uOevOpCegu8rv6v6nTcnCEvxFAws51SDTTlR94pngvJLqtMNicelGAugraRw1k
	w==
X-Received: by 2002:a05:6830:6af5:b0:7de:442b:722 with SMTP id 46e09a7af769-7de442b34bamr8657811a34.0.1777146655537;
        Sat, 25 Apr 2026 12:50:55 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:55 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	Cristian-Florin Radoi <radoi.chris@gmail.com>,
	George Salukvadze <giosal90@gmail.com>,
	Evgeny Kapusta <3193631@gmail.com>,
	Samu Toljamo <samu.toljamo@gmail.com>,
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
	Chapuis Dario <chapuisdario4@gmail.com>,
	=?UTF-8?q?Thibaut=20Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 05/21] wifi: mt76: mt7925: advertise EHT 320MHz capabilities for 6GHz band
Date: Sat, 25 Apr 2026 14:49:55 -0500
Message-ID: <20260425195011.790265-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125056_517375_214AADD8 
X-CRM114-Status: GOOD (  12.08  )
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

From: Javier Tia <floss@jetm.me>

mt7925_init_eht_caps() only populates EHT MCS/NSS maps for BW <= 80
and BW = 160, but never sets BW = 320. This means iw phy shows no
320MHz MCS map entries even though the hardware supports 320MHz
operation in the 6GHz band.

Add the missing 320MHz capability bits for 6GHz:
  - PHY_CAP0: IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ
  - PHY_CAP1: beamformee SS for 320MHz
  - PHY_CAP2: sounding dimensions for 320MHz
  - PHY_CAP6: MCS15 support for 320MHz width
  - MCS/NSS: populate bw._320 maps for 6GHz band

Introduce is_320mhz_supported() to gate 320MHz on MT7927 only, since
MT7925 does not support 320MHz operation.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  5 +++++
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 22 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 51423c7740bd..802cb26ed6e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -177,6 +177,11 @@ static inline bool is_mt7925(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7925;
 }
 
+static inline bool is_320mhz_supported(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7927;
+}
+
 static inline bool is_mt7920(struct mt76_dev *dev)
 {
 	return mt76_chip(dev) == 0x7920;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4d8ca04a128b..bf38d6502970 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -183,6 +183,10 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER |
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE;
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[0] |=
+			IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+
 	eht_cap_elem->phy_cap_info[0] |=
 		u8_encode_bits(u8_get_bits(sts - 1, BIT(0)),
 			       IEEE80211_EHT_PHY_CAP0_BEAMFORMEE_SS_80MHZ_MASK);
@@ -193,10 +197,20 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		u8_encode_bits(sts - 1,
 			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_160MHZ_MASK);
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[1] |=
+			u8_encode_bits(sts - 1,
+				       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK);
+
 	eht_cap_elem->phy_cap_info[2] =
 		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_80MHZ_MASK) |
 		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_160MHZ_MASK);
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[2] |=
+			u8_encode_bits(sts - 1,
+				       IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK);
+
 	eht_cap_elem->phy_cap_info[3] =
 		IEEE80211_EHT_PHY_CAP3_NG_16_SU_FEEDBACK |
 		IEEE80211_EHT_PHY_CAP3_NG_16_MU_FEEDBACK |
@@ -217,7 +231,8 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		u8_encode_bits(u8_get_bits(0x11, GENMASK(1, 0)),
 			       IEEE80211_EHT_PHY_CAP5_MAX_NUM_SUPP_EHT_LTF_MASK);
 
-	val = width == NL80211_CHAN_WIDTH_160 ? 0x7 :
+	val = width == NL80211_CHAN_WIDTH_320 ? 0xf :
+	      width == NL80211_CHAN_WIDTH_160 ? 0x7 :
 	      width == NL80211_CHAN_WIDTH_80 ? 0x3 : 0x1;
 	eht_cap_elem->phy_cap_info[6] =
 		u8_encode_bits(u8_get_bits(0x11, GENMASK(4, 2)),
@@ -239,6 +254,11 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 	eht_nss->bw._160.rx_tx_mcs9_max_nss = val;
 	eht_nss->bw._160.rx_tx_mcs11_max_nss = val;
 	eht_nss->bw._160.rx_tx_mcs13_max_nss = val;
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76)) {
+		eht_nss->bw._320.rx_tx_mcs9_max_nss = val;
+		eht_nss->bw._320.rx_tx_mcs11_max_nss = val;
+		eht_nss->bw._320.rx_tx_mcs13_max_nss = val;
+	}
 }
 
 int mt7925_init_mlo_caps(struct mt792x_phy *phy)
-- 
2.43.0


