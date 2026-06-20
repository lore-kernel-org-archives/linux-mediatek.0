Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41134CD4F26
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2026 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xzjyojuMRuFwFVplXB0k7oZX5NvBxe6hl8pliXZwUvw=; b=ah95D+oJsdA8n+kGt/wSl2DGk8
	lC1S1tTtJ9d4lD5W0jHJnis3x2pxLF9/0VVyY/q2nS59Ixm2rUbkicKdFYot7fiQLUs0k2ft6og6a
	dgXH4UNUppnOlxoAYumrETg1B28eZ0HrroB4ae8UbGCDy1lBfaCjSxOw9X0zbvZvSO7h76qeh16O8
	zRoGWqa6NWZmkZ+imOn9VHmvKX7Q5p7AbtGEKEZVtT9D55ZfT7oeO3UJetooLDeBl/j5CU4JFAfBf
	R++Q+xbPGTmQSve+GTb7JeYPIElO04ZhE49r7OyoZtJokCUBLXtvnNCHoX067Lfdjr8xYxZF4tPY4
	L9XMDibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1way0s-00000003ROr-37ZJ;
	Sat, 20 Jun 2026 15:53:42 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1way0q-00000003RNj-2vx4
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Jun 2026 15:53:41 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c6dadfbaafso27883555ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Jun 2026 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781970819; x=1782575619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzjyojuMRuFwFVplXB0k7oZX5NvBxe6hl8pliXZwUvw=;
        b=WpDTcqX1AhnxJ1RbzRhN3DAwqg29n/GwtmZjGJJX0MMnIyub/oKD3a5s3yT8b1OROy
         0Lc4kOjHdD9vqjujm3OEMKSxaeXE9QtpQTk/7lZXcnGqb2UQ8vOW65/ulwtoQnpXYwOY
         fJQhllPC4mU9JiMfYoj5Vyk/DY+yF4mVIMr/ARluSm1qc/zUy8gjQby5xynChud2m4Ad
         xGlCF7TDt6IB364LMhFyR+LPIZSYka3UmVXLS24OxBAnEF+XqTd5lknB6RY/zKhrCFBn
         6eYCslYrmdeGLcoBkVp4KZRhnjAhDr7xsbp2CAMUwganZuF7OyYFd1/ZSqbNqT9vdj4j
         0I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781970819; x=1782575619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzjyojuMRuFwFVplXB0k7oZX5NvBxe6hl8pliXZwUvw=;
        b=m4fqK5YXJcwPWADXMJ/S7HOBVB+RQ3x1FAlZWd81LNXXOo6pTruvE3fCjCEqU4OLmt
         +Xyh1PF7sN1e6UZYTqhzUkoGVAPWSleO3/QCxk6/M95V+05B1/XVAdo1D5sm89e+bOsN
         ptkk8yLlqCoy3yKlgcSn5sy4JMABNwJ2VHOZv6vzGOY0W3DhUVhZDRyO3t7SZvqp1AIL
         UwPWICc7pbsjUeR820Clvsj/YEssjwZAH5Zc1akv00oaAMDBVT3a71dQimY7YfAcFnXA
         r1y7uWyiUX9Olt7tp84g1/WU+6bz5oSjMe8qgpErE+E3wNFX2wDNXCpKn62Pqr6VzS2s
         Sn2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8t3Tz6LFclq5m1BDOfmCToA/njRY6rPAA9jvZUQB8OnwGhH4aZk/kjIl7Ex3faDfTmD0VlawlcvCWzx77OAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye+g+1PuGcJHp2cOs/zYske1O3lSO9jGN3oRjlTcHc6KQB4Id7
	LCpoaPyN6UPn1xlVP7CuU6LCGJIGRiojQlNbJ3FBUOjKmPeCdVWSChyQ
X-Gm-Gg: AfdE7cnn/YfodA0FZ9a6GUdEWu1LhKFrBWMZ1ZjjYDuiFkW/nCY9ej0Ms0NVemAczal
	gAnjmmGffniKdLZ3RzPEGutDDLIYWyAgvnAs8D+r91xLzilTtdDdz6d7zsyRRHX4ndjqOHHJB+J
	mxETbnU513q/Vzji3FgGmmASBFO0TB1Dtcu82fj7x0FRg3AwPCnI26+Qfz9S6xuteoCw9mmFgf7
	0pY6Ved8CxwYFXjXKew9pklobRWYQiALTgrr5G/b4bFYRAiLLTfQEZPQ6/1/PiBOX1wXdBm3RFV
	jCeUvRh+CtR21mob1vddhNLLlrLrM6L4kbEVrjeule1w6RT87mz/Ca8dQzKcneyqVzJIxfwdJzW
	N5iOCKiIzyyw817S7rlZtIIxIj5DrYnxQkNtuPpNDqJNpfVdW57yOtfs6zbVnUgJVT+llHNCOP6
	mq9pGGIgYvJ8yRIhOLgOlMiuRZRxXi5Ed+
X-Received: by 2002:a17:902:fc50:b0:2c2:f675:32c5 with SMTP id d9443c01a7336-2c718f3ec26mr90957095ad.29.1781970819245;
        Sat, 20 Jun 2026 08:53:39 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:8e0e:956e:b09c:23cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af558sm31848775ad.14.2026.06.20.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 08:53:38 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] wifi: mt76: mt7915: guard HE capability lookups
Date: Sat, 20 Jun 2026 23:53:32 +0800
Message-ID: <20260620155332.81120-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_085340_738980_7AA20016 
X-CRM114-Status: GOOD (  11.18  )
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

mt7915_mcu_bss_he_tlv() and mt7915_mcu_sta_bfer_tlv() both run after
checking HE support, then dereference the HE PHY capability returned by
mt76_connac_get_he_phy_cap(). That helper can return NULL when no
capability entry matches the vif type.

Fetch the capability before appending the TLV and skip the HE-specific
setup when no matching capability is available.

Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy utilities")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c    | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 318c38149463..391c91675130 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -595,6 +595,8 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct tlv *tlv;
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	if (!cap)
+		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*he));
 
@@ -1177,13 +1179,12 @@ mt7915_mcu_sta_bfer_vht(struct ieee80211_sta *sta, struct mt7915_phy *phy,
 }
 
 static void
-mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
-		       struct mt7915_phy *phy, struct sta_rec_bf *bf)
+mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta,
+		       const struct ieee80211_sta_he_cap *vc,
+		       struct sta_rec_bf *bf)
 {
 	struct ieee80211_sta_he_cap *pc = &sta->deflink.he_cap;
 	struct ieee80211_he_cap_elem *pe = &pc->he_cap_elem;
-	const struct ieee80211_sta_he_cap *vc =
-		mt76_connac_get_he_phy_cap(phy->mt76, vif);
 	const struct ieee80211_he_cap_elem *ve = &vc->he_cap_elem;
 	u16 mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80);
 	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
@@ -1242,6 +1243,7 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 {
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	struct mt7915_phy *phy = mvif->phy;
+	const struct ieee80211_sta_he_cap *vc = NULL;
 	int tx_ant = hweight8(phy->mt76->chainmask) - 1;
 	struct sta_rec_bf *bf;
 	struct tlv *tlv;
@@ -1260,6 +1262,12 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	if (!ebf && !dev->ibf)
 		return;
 
+	if (sta->deflink.he_cap.has_he && ebf) {
+		vc = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+		if (!vc)
+			return;
+	}
+
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_BF, sizeof(*bf));
 	bf = (struct sta_rec_bf *)tlv;
 
@@ -1268,7 +1276,7 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	 * ht: iBF only, since mac80211 lacks of eBF support
 	 */
 	if (sta->deflink.he_cap.has_he && ebf)
-		mt7915_mcu_sta_bfer_he(sta, vif, phy, bf);
+		mt7915_mcu_sta_bfer_he(sta, vc, bf);
 	else if (sta->deflink.vht_cap.vht_supported)
 		mt7915_mcu_sta_bfer_vht(sta, phy, bf, ebf);
 	else if (sta->deflink.ht_cap.ht_supported)

