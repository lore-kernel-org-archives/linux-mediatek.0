Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4DDC5DF9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cWhV2VXNAcEM4e3yqDd+mmFtduEPM2FheFVFeRGh6w=; b=4pH6lzevP+T7hUuWj5WqMaTatf
	oNfacJ4uvxsibJlPoVGpadFvAmFc/Tc1SQwQmM5HPJF1ZdRPjJ/uNJr0F/wcrpHGEdKeBsyImHCd+
	t3QF+JamjSeyV0uDv6wmVmBMD/SefUxT3DXFueXCNlELk865PvWp628H8oh6smT0CnWQScINVP+dM
	XkjJ1yH9zcKF5WbivZD2/y1uNLo4Hjf+6hHlIxyrPihmlNOC4VrEI47KwkqCctdSTZkCRWfB86P4b
	egIJJp8bdpN++dtgGrVzaUdY/W4jprDtkYYuHSyyKnU3fDzT28U9nTq5N7YVvoQNBHKBbl51uWAo7
	DedqOw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajF-0000000HKNd-1oNS;
	Mon, 24 Aug 2026 19:53:09 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajC-0000000HKMC-1vyy
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:07 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44cedfaab6bso1928761fac.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601185; x=1788205985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cWhV2VXNAcEM4e3yqDd+mmFtduEPM2FheFVFeRGh6w=;
        b=LRY55rheFpoTNRu8WW51JLs0BoDWhyhJmBwUCZnfLxpfdUdCtH798hMaBx9ESGtdEb
         4xiA1v/K8eEo7XaWFe1Ew/S0IBYWhoz+wfgB25way2ahfqU1ee2ezEdq0HGNHhhWKx9N
         SpFLRCaR/yaWTuo8IyN2HUYJkRbF3AbsdTYDnLCtKdXjxpOIMa8cMZZeifjWwaqjNX08
         uGwcPoBi92hzcYmRhcHcvv2uQXCbiHBbRYid7H3APkGoSxtUBZW/GpwaHLCMT7le6K0h
         x0m8Q+W1smiZXnaihVIXP2S/oOj5mJla5Ik3OkpSB3OOeAzPBPv1jNTuqBIlrDuAWgEa
         48Rw==
X-Forwarded-Encrypted: i=1; AHgh+RqUJ0s9HK7dG+besp2yw3yhqfw+Lzdkw+/iOSeBEvfNhXcomHwfXGgfTgAHCrAdyrrjNmUlFqrA2eo7Zolm5g==@lists.infradead.org
X-Gm-Message-State: AFuF++mVQ7+1SSt9tZ5c3AxlbL1JOMaroycNwt0xqKh9bTU59Q2MjPYu
	dQiYiEudU9NvB3g4HazanyuQ7WcrbfLPp7PcwY2u3OqpZOmKAE1LaUoe
X-Gm-Gg: AR+sD10a4qxz/s+A7kcmFKX4r4YH4nWBd4iQA+LQ+VhFWBZK+CxM1nAd5Ta5x8gnOfb
	nXXCQjczuiq7C1kiFDYv7qSOnGyCGc9Hr4xT9KKthz/IfNjZZ0ZJuW56LwZ5b/yd4fSmjAAGl6w
	v5Mgyhn9v8m7/mDEkh5HDoXNXVLdMfq5nnLiZYgVLPM+TTsq1tLIRUN+kkan2Zi5/K9LcdwClsJ
	jopW2TO6WK9pV6YJcp1he9LcgOK2ubdrwjpHbruni84MJe/7zu/nNfnW5BC1tpqajUSPvFIUbVY
	jvLv2ehPRTM2Aw5/8MiS3abcgorJz7JsI4lwSseuq/fPix2L4VOWO3wueOgLFp2lkYhWN6Wqzg6
	ItjdFciCxNMW6Go26wtRYvMNiCwrdz1Yn4/9HV4rQ/EGLAozYJTYw+bRrs6eT1uaL4Kp0nBWRkh
	EGlaq2tM4Tyu3CBMwsVOploMiTouW8YJarLpJ+KHm717XYKjhpUN5J/shI/xe/oDgKBlO4P06Dw
	1pGtBOom+rNVtSL4gLhFwRTyRM6qp1k5EVUMw5HDWEH
X-Received: by 2002:a05:6870:f290:b0:456:f700:dd75 with SMTP id 586e51a60fabf-4637fa674admr19731643fac.7.1787601185375;
        Mon, 24 Aug 2026 12:53:05 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:04 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 04/15] wifi: mt76: mt7925: report only 2.4 GHz NAN supported band
Date: Mon, 24 Aug 2026 14:52:16 -0500
Message-ID: <20260824195227.12589-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125306_781999_E7609DFD 
X-CRM114-Status: GOOD (  10.78  )
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

The firmware only checks the 2.4 GHz bit of the local device capability
supported_bands field, so set it directly and drop the unused helper.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index e51e91f08b49..c04b12cbf076 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -680,23 +680,6 @@ static int mt7925_nan_peer_rec_tlv(struct sk_buff *skb,
 	return 0;
 }
 
-static u8 mt7925_nan_get_supported_bands(struct mt792x_vif *mvif)
-{
-	struct wiphy *wiphy;
-	u8 bands = 0;
-
-	if (!mvif || !mvif->phy)
-		return BIT(NAN_SUPPORTED_BAND_ID_2P4G);
-
-	wiphy = mvif->phy->mt76->hw->wiphy;
-	if (wiphy->nan_supported_bands & BIT(NL80211_BAND_2GHZ))
-		bands |= BIT(NAN_SUPPORTED_BAND_ID_2P4G);
-	if (wiphy->nan_supported_bands & BIT(NL80211_BAND_5GHZ))
-		bands |= BIT(NAN_SUPPORTED_BAND_ID_5G);
-
-	return bands ?: BIT(NAN_SUPPORTED_BAND_ID_2P4G);
-}
-
 static int mt7925_nan_peer_cap_tlv(struct sk_buff *skb,
 				   struct ieee80211_sta *sta,
 				   struct mt792x_sta *msta)
@@ -723,8 +706,7 @@ static int mt7925_nan_peer_cap_tlv(struct sk_buff *skb,
 
 	peer_cap_tlv = (struct mt7925_nan_sched_update_peer_cap_tlv *)tlv;
 	peer_cap_tlv->sch_idx = cpu_to_le32(msta->nan_sched.sch_idx);
-	peer_cap_tlv->supported_bands =
-		mt7925_nan_get_supported_bands(msta->vif);
+	peer_cap_tlv->supported_bands = BIT(NAN_SUPPORTED_BAND_ID_2P4G);
 	peer_cap_tlv->max_chnl_switch_time = cpu_to_le16(sched->max_chan_switch);
 
 	for (i = 0; i < sched->n_channels; i++) {
-- 
2.43.0


