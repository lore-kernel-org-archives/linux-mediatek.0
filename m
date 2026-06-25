Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277ABCDB479
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyPmpTYq94Jn9nTAUSFDOvDYbqnAtTblCK+8XVszBnQ=; b=soCUaZTu8h1f8CreTp0+b7etgJ
	sqV3QeVWkWnQqAkvfp0I/7RNWDhPMPx0c+tSVe0wRik3tptXS6Py5ndfWf2PqiALGuOCAxqE9Nxg8
	MzEJcraeFan74rjhjSoOs+RnOuumu209CHYXkOEeV3J/vzFhLPxiSqIE+ZnaNw+/iOHx6i031kg8j
	hYlHqx3Bb4apN4SD0JmNdeQMyzOczQw1KBmWb20+nT2J6gdS9pL1repkiwFzuGaFg8sgsbgerQmSE
	0tQ/3r00M1nf9+PTxXuPgQuDK4rHpi8EjyXrVFfQrM7UdT29f2Q1x5tX4VSKwA2qja/2qXXL8xEjG
	14gv0epA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXof-00000008SaE-03Az;
	Thu, 25 Jun 2026 00:19:37 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXoc-00000008SZu-42dm
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 00:19:36 +0000
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so1141959a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 17:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346774; x=1782951574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyPmpTYq94Jn9nTAUSFDOvDYbqnAtTblCK+8XVszBnQ=;
        b=nRDaUxewWDA9QkGGbXfFMtj7B1QD/sbK6QVF2uZgiIRs7s/LiGUxGcNsZEhmxfuisI
         mNEUgZtn7C+jL1cZqvVJ5ylZbZ03FA3eNS3vT34kc6ifNDq1L1VECuhEDDnJLY7lAlkE
         HjFQixEkiSwiACuE+BvGlgNLkerbUOIpDa5kQeb5gIMpdFn0u1ITIXTizvolmMqiEjM9
         ea0xk4PVjzIx5BLXg/Fztho3dIe/8iw+tgJ0nJZ9AfWPu1iUeWTS5vgg5EW/2jUghQTy
         NYz59aocyw6YNJuSukKgVd6CagYwmgFhSDYtwHyBSPQx7w+/1MENlH14TDTYpq/Q4cAY
         996A==
X-Forwarded-Encrypted: i=1; AFNElJ+UwBJbUynL3BHvupMIj7D5/nn2xkjwhix+dX4KM93f9ejd4rWsgUBPcUTK/wRInWBkEOhRA9A0UZOrS4kFDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtbh/gOyJbTvJtHkGyQ7ySpybaoF5T61SkreXW0unDF7ivm+/U
	98I7XXfLarrIn9xvrPvlJpXGH1oymja8KgQNszHcmtPeaAeIxtOW1KfsR1ItRazm
X-Gm-Gg: AfdE7cmkmwmQUQQQWkFzeeE5SNOaR3Zp4dlyhs/1pg2lbINftFWg8wqXbn/tbb9+Lg/
	zRUJuudS4skfSS33x0LXN74LZ4tu0DMyiFwa9Bv0XMTMHucEENxb9wkZtZUx4BNbF0n8YHpjCzL
	pc29bXQ/iDyWrxY1T2b+S/HIxB05ML1AIkt2iMPyOv5GbDP7ILWZed7wvyOlkNr5+vQ6iOEmg0E
	vY/sCuup2brdHONcXjrxwgWJCm1qfsR66BUMTKtDw40NU0FPXgy05na426RwrwDSSP/ZooDehZ4
	bqHOjrspDH4euEE7AEXeMUxlbCUfKlcg6QTsmfWLMmHEuz+goTMwUcJUG7MabLcQeTJ6oCay6sh
	RQ5NfuDVUBmtUtifdceEglAx1h9Py5apJ4Ond/LnQI5xO31pecRJg8RwZGKohMJuRz0MUSZXNm0
	5Ck01Lh8xtdcFKfjvM3Iftn6pjKpOxUMaRcLmikkNDy5Pu85taXYeKrVhib1RVnDJfaDAQdBjua
	j8Lub8HEeCReLLXqWuUrh4nuMDGQQ==
X-Received: by 2002:a05:6a20:6a0d:b0:3b4:87c0:d90 with SMTP id adf61e73a8af0-3bd4ae3a935mr289934637.28.1782346774031;
        Wed, 24 Jun 2026 17:19:34 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm586839a12.21.2026.06.24.17.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:19:33 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: chengwei.yu@mediatek.com,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 2/9] wifi: mt76: mt7925: guard BSS capability lookups
Date: Wed, 24 Jun 2026 19:18:27 -0500
Message-ID: <20260625001834.475094-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625001834.475094-1-sean.wang@kernel.org>
References: <20260625001834.475094-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_171935_030723_1FD45572 
X-CRM114-Status: GOOD (  11.67  )
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

mt7925 BSS setup may dereference missing channel data or query HE 6 GHz
capabilities for an iftype without HE support.

Guard both lookups before adding NAN paths that can use partially
configured BSS state.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Co-developed-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e94fa544ff20..cff91b4eeac6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2364,11 +2364,18 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 {
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def :
 						  &link_conf->chanreq.oper;
-	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
-	enum nl80211_band band = chandef->chan->band;
 	struct bss_rlm_tlv *req;
+	enum nl80211_band band;
+	int freq1, freq2;
 	struct tlv *tlv;
 
+	if (WARN_ON_ONCE(!chandef || !chandef->chan))
+		return;
+
+	freq1 = chandef->center_freq1;
+	freq2 = chandef->center_freq2;
+	band = chandef->chan->band;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_RLM, sizeof(*req));
 	req = (struct bss_rlm_tlv *)tlv;
 	req->control_channel = chandef->chan->hw_value;
@@ -2506,8 +2513,8 @@ mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			enum nl80211_band band,
 			struct ieee80211_link_sta *link_sta)
 {
-	struct ieee80211_he_6ghz_capa *he_6ghz_capa;
-	const struct ieee80211_sta_eht_cap *eht_cap;
+	struct ieee80211_he_6ghz_capa *he_6ghz_capa = NULL;
+	const struct ieee80211_sta_eht_cap *eht_cap = NULL;
 	__le16 capa = 0;
 	u8 mode = 0;
 
@@ -2515,11 +2522,18 @@ mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		he_6ghz_capa = &link_sta->he_6ghz_capa;
 		eht_cap = &link_sta->eht_cap;
 	} else {
+		const struct ieee80211_sta_he_cap *he_cap;
 		struct ieee80211_supported_band *sband;
 
 		sband = phy->hw->wiphy->bands[band];
-		capa = ieee80211_get_he_6ghz_capa(sband, vif->type);
-		he_6ghz_capa = (struct ieee80211_he_6ghz_capa *)&capa;
+
+		he_cap = (band == NL80211_BAND_6GHZ) ?
+			 ieee80211_get_he_iftype_cap(sband, vif->type) : NULL;
+
+		if (he_cap) {
+			capa = ieee80211_get_he_6ghz_capa(sband, vif->type);
+			he_6ghz_capa = (struct ieee80211_he_6ghz_capa *)&capa;
+		}
 
 		eht_cap = ieee80211_get_eht_iftype_cap(sband, vif->type);
 	}
-- 
2.43.0


