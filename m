Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195D2C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOSh1Koddm2iaRVlRwReJq6F4ShEOJmpd3jAFp1dhAY=; b=3lvervYI7X9o5V5t/RaPXH+U8s
	YcZLK9qv0JGs4fIqtcVx5LXPflYXP0JJFFlf/lmRDKsTRzQneUrXW8vx69If/ret3nE5LfJKzNVva
	pKhVQ9iHPPKNM/pA3WtnAev3vQn+sgPx76Oipm6mqFBGTQnotLn0s/wc02PMgbpwN+ninlmN5swg3
	kyNX3PdvKGwEUy9l0uFP9iBLtxFfKZ8Jwm6FRumjWkDbHtIPSZAko55kPpRQPnXtS14g5ifPG65q2
	Elcj2ym+J1PfbhHiWxLo4izw5a03B+iNsleT9r/5I6RZ85w8bjbjwYK+GNyerVWbEEbXBgue+6m4Q
	wW9XMBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHako-0000000Ew7p-2oCa;
	Thu, 13 Jun 2024 03:03:58 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakj-0000000Ew44-09OS
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:56 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-254925e6472so70161fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247832; x=1718852632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOSh1Koddm2iaRVlRwReJq6F4ShEOJmpd3jAFp1dhAY=;
        b=s99PNCHlfajh0KRZ0ZPrIAH+0r8ETLNLElteSICpV1sv4vta4qkD2viEScFE6b1ea4
         Kk8U46CZj31gr9pZ6lRdTJxNKxThAhuG4weGl0OGYt4iIAg00aVE6QcE97MRfkkzf5Nc
         SWuzJ85Uq+ym/Xup7ooCR1sJDvwVqSWkTn9sfftH4inecu+jvu5g1XoJ70JCnI/j3VZ2
         EjPYQf3f1Dn+HLUW84yJ2Nx0ofRu7PsEHBPWaKrEpQYElrjSsLj0GHetRVl8z2YP4TL9
         RIH5FHCjI7TSuey41QdlHhnyhmeg+9J0fUXL1ufiiM8QEsGE4Stwze9HU8dqK+b9ny4R
         Fohg==
X-Forwarded-Encrypted: i=1; AJvYcCULgHSMPbTdp3aWmn95N1EII2R1acgLYpJGpAArn3xevOStRtxeeG/2LKFzgDLD99p+/fFgO8VVIPCciQEsig==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqoqi1Vmxj2CTZxhQnz2h0swPEqEZWRxBaZ+gIDqjr6UJmUuiW
	E4KH5lJ27ymp3HsbeXNAbggJ4dujho237qD4Z5MdnPc8jSC1LmDYcHPkmqyRVA8=
X-Google-Smtp-Source: AGHT+IGYCITyDhyJlZeMrVfawcG1NciHKDp7xm3y+tBp9yG1rxv/rqOikcaa9EXWVR3TN44OA71leQ==
X-Received: by 2002:a05:6820:b0b:b0:5ba:c4ed:ee98 with SMTP id 006d021491bc7-5bb3b7a4c51mr3590579eaf.0.1718247831716;
        Wed, 12 Jun 2024 20:03:51 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:49 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 31/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_vht_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:25 -0700
Message-Id: <20240613030241.5771-32-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200354_183918_D59CCD22 
X-CRM114-Status: GOOD (  12.16  )
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

Extend mt7925_mcu_sta_vht_tlv with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 57b89eca4e21..1b66dd26bd1e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1448,21 +1448,21 @@ mt7925_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 }
 
 static void
-mt7925_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+mt7925_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 {
 	struct sta_rec_vht *vht;
 	struct tlv *tlv;
 
 	/* For 6G band, this tlv is necessary to let hw work normally */
-	if (!sta->deflink.he_6ghz_capa.capa && !sta->deflink.vht_cap.vht_supported)
+	if (!link_sta->he_6ghz_capa.capa && !link_sta->vht_cap.vht_supported)
 		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_VHT, sizeof(*vht));
 
 	vht = (struct sta_rec_vht *)tlv;
-	vht->vht_cap = cpu_to_le32(sta->deflink.vht_cap.cap);
-	vht->vht_rx_mcs_map = sta->deflink.vht_cap.vht_mcs.rx_mcs_map;
-	vht->vht_tx_mcs_map = sta->deflink.vht_cap.vht_mcs.tx_mcs_map;
+	vht->vht_cap = cpu_to_le32(link_sta->vht_cap.cap);
+	vht->vht_rx_mcs_map = link_sta->vht_cap.vht_mcs.rx_mcs_map;
+	vht->vht_tx_mcs_map = link_sta->vht_cap.vht_mcs.tx_mcs_map;
 }
 
 static void
@@ -1641,7 +1641,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	if (info->link_sta && info->enable) {
 		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta->sta);
 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta->sta);
-		mt7925_mcu_sta_vht_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
 		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
 		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta);
 		mt7925_mcu_sta_he_tlv(skb, info->link_sta);
-- 
2.34.1


