Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF14C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zRODFxdmf59Gw6k7LfttFOtYBeiiAkZasq3H4MbfRQ=; b=pUuRMH8r6ItR7Tgc8iQETXMRAP
	lbE93ZkV30Su+quu5P/WB07GAM9ddkrvTmqZX3SV4QpOv8x1Hj+OvGFIVzoWsJ5125PpaXYVFaOK8
	CXEGiXn2Lk7svp4eVRt0qTgsrGFKxAAbweJp1tqOL70zyzAdyF6x+EFzlJUUfO1w2JwslvyeOjsHT
	qlQNUx6MhLiIttMTMX2jCMTPJvZZWr/NX6aFKV2LlWbBeJwuUPylfpUsU+GslzZn1lf8OcAG7jhA6
	/RqPnNNb2wo9zFvQgFcgTgQlgxvkpoyD5sD6WIz4TxA73/T5dknaat3hB8HLcdatoiPpLjDpV6rRC
	gP8IyBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajQ-0000000HKU2-4A3e;
	Mon, 24 Aug 2026 19:53:20 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajO-0000000HKSB-0EEE
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:19 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-45e6d266921so2536397fac.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601197; x=1788205997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3zRODFxdmf59Gw6k7LfttFOtYBeiiAkZasq3H4MbfRQ=;
        b=qxpLsMvy89tSgg1zVdQmN8GmMXp3p6A0seDcHdKdofGpDIl0e+iJimXZshqkrdY7bz
         vEzNqsJuDxAfPIVQ5vY+RRpOb7nl97xHolS+8GVASAIntoM/Je85wk6pw/vxveYnJ4bc
         KU6noy2xBZinfrWlJSMMHqsk4xoyNaWviszbUrKpOp4eG7vUPekstJxXqC6rFI6E23lM
         ojQLyNekUl3OifQKtX0nCwpxM5n3o4scHODGh58UkSvidUIXkbO8ZZ+MtkzhuLJ67Oyy
         FaZA2L1OCfhXkDDE6RIVlS0GvKvDTUW3sHDvb61Wuf47+a1RR4YoGr3o4jcbBb7+q/JV
         svBA==
X-Forwarded-Encrypted: i=1; AHgh+RqbAG8rbpTzUGrLtzi5Zd88lUNQZNUmouUXUDNhC+zO4CiFjuD8vClCnNrzAawtTisHYU5z9wlD7Vki1prNiA==@lists.infradead.org
X-Gm-Message-State: AFuF++nA2Kf/rn2NSrBFm72x+V0vr2PjxCpBtgkzSHwRNu3uIqnkzO1W
	E4fBS9AfevjEWWTAcz2WonqxiTgxywKjQQGNBydpSLPNAXO3eNc7etFd
X-Gm-Gg: AR+sD10Hp9Et7wF0GnddzsUrxHSHxpM24RIrjgQV0InHarVUMpos1PoorSYjJLZWzWj
	W1A6t5yyFRuIyRT6R3xX0s4GFX7M+ixtzBy7cY96DKJ1caZCSXSRslqTvB1XSQIuktllIyLQJde
	AlXvzz6uiusGnN05dm6TlsG05lhYKWasNvz0YZcO9v8ziBMt9Qv9YkrFr6nCuh8OLVccB3xeRQ0
	CfmHxgElM5U0M09mW/7iHTSrvNr+N2Ho/h0EtH4zpsT9hw8xvbsjwGh5nIJn/0XQQGAKR0f6Pgj
	3reJH36NFEGK2VRoUG8JAHgEQbgzEbtrQLNsYpLDTUPzk/p/rXFnwJ9DkkLc+qFnRS6t0tVMtjU
	D/sYoqE6Vfr8rtwMgx9XUVHmklvGwBU3Fcub+GbZUky5JDejePDL9kQAR2eiCbTzQdQkroHDeXa
	zN+y7JNDGATUeI9eHj/kO8j61GfFURStIWaVfIqKOJZDoX011I/MXUZLsoD4HqasjzJEHHwkkuL
	emjqZKIgATtXhTFW5hfzoG6wqWHgzKoOB9Xtg9dDiJc
X-Received: by 2002:a05:6871:2ecc:b0:448:9052:f436 with SMTP id 586e51a60fabf-46350fcdcefmr28945639fac.8.1787601197217;
        Mon, 24 Aug 2026 12:53:17 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:16 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 07/15] wifi: mt76: mt7925: use OFDM-only PHY mode for NAN STA records
Date: Mon, 24 Aug 2026 14:52:19 -0500
Message-ID: <20260824195227.12589-8-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125318_105882_FF0A8394 
X-CRM114-Status: GOOD (  10.81  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

NAN operates with OFDM and does not support CCK, so the phy, rate
control and BSS rate TLVs must not fall back to 2.4 GHz. Borrow the
5 GHz band lookup to keep the STA records OFDM-only.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fa29c486a455..1cfc209f9be5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1914,11 +1914,9 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 	phy = (struct sta_rec_phy *)tlv;
 
 	if (mt7925_vif_is_nan(vif)) {
-		enum nl80211_band band = chandef->chan ? chandef->chan->band
-						       : NL80211_BAND_2GHZ;
 		phy->phy_type = PHY_TYPE_BIT_OFDM | PHY_TYPE_BIT_ERP;
 		phy->phy_type |= mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif,
-							     band,
+							     NL80211_BAND_5GHZ,
 							     link_sta);
 	} else {
 		phy->phy_type = mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif,
@@ -2003,7 +2001,11 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 	ra_info = (struct sta_rec_ra_info *)tlv;
 
 	if (mt7925_vif_is_nan(vif))
-		band = chandef->chan ? chandef->chan->band : NL80211_BAND_2GHZ;
+		/* NAN is OFDM-only per spec; borrow the 5 GHz band lookup to
+		 * avoid PHY_TYPE_BIT_HR_DSSS/CCK bits being added to phy_type.
+		 * NAN interfaces have no chanctx, so chandef->chan is always NULL.
+		 */
+		band = NL80211_BAND_5GHZ;
 	else
 		band = chandef->chan->band;
 
@@ -2847,7 +2849,7 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 	bmc = (struct bss_rate_tlv *)tlv;
 
 	if (mt7925_vif_is_nan(vif))
-		band = chandef->chan ? chandef->chan->band : NL80211_BAND_2GHZ;
+		band = NL80211_BAND_5GHZ;
 	else
 		band = chandef->chan->band;
 
-- 
2.43.0


