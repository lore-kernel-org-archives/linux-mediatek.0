Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82D4C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dccZ5/3CuQxaIWTMPM2TCEJVGRDx3lSvYRxYcTANQJs=; b=XxrYV1qcyqE6m18oXLEj2eGjDV
	FHGv7zidkNEylRuAa20bSVRY726/NQ+AokwQ7/Sj6sMfzPrhVvLVfDSQWlWNGQ078AOS+ycu7Vhtf
	D3lo/pgVJ1E8GI91sEgQhO1/uuTDnHXocdCxlqOqE67Uli6ZDgL/PpSB2tkVjfCnP4P9jqbOi7lPa
	SG7eTnaT/KDY8+Zb/uzXJj9FoPeQx86i1vVEM17cGIQkQjwmAqSer2zyGOZNiLy+/Dne5YeJA2ob4
	/7+fdWAKnPODEdyfKs5OA2KxFgUlnWTPzZogjiHgYXm9893g+Bny/C/LPPpH0u1OSLPjh5lES+EPq
	UxqnBbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakc-0000000Evzn-0oqP;
	Thu, 13 Jun 2024 03:03:46 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakW-0000000Evw8-4BUR
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:44 +0000
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5bafec9ad2eso25676eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247820; x=1718852620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dccZ5/3CuQxaIWTMPM2TCEJVGRDx3lSvYRxYcTANQJs=;
        b=ZVAjhBpDc0WbzrDpx+wrSdggMEYDTmSl/JxkEIft2AGv7o6qbDKN3Ava9mmfQ1Y0yG
         1szU6DtIOEmMxGUWXsKi479sWvAPCx9RPE8bfWDNAUvfTlDaZMZ50sUWagCnAnV1Ys6W
         PDcecXqw1Ka/XriV0tN0hagbIjroQE3eJCXHn0YTZwheQmzVmhAQcS73i+9HqyMBFA3t
         8daR8zCtrgDju0tOoH46auZVQUPvscpkSTKZX9eOA+ZRPlAIQ+6Dy5VgK0CyarqCKuUl
         OEg8zjMr8e0egGh0Gz5jWbAiOVCdovUJsFS0sZSwz8dI2RJOeyOESx8f11rihPAiUeLv
         DN5g==
X-Forwarded-Encrypted: i=1; AJvYcCUdqihPz0HBV3QjHLHvIhxLZLp/FDV8MBaQXqr4k3reuLH9Hk1+C9vp2ZJRbRmu0HbmBWmSRH66Iz0fcUAjCbMLromSiVdDoyMlhN3HdRiPzAqg
X-Gm-Message-State: AOJu0Ywu5zXCHUixCW0muuF0cKwv0h/1vw+pNdrv4CNBNb/MGj2qoqic
	ZPgCeq5ZfczKvO47ueEytw4sw/xRcK/1+c851Z07NUsg8Rl5ENBp
X-Google-Smtp-Source: AGHT+IEGIjZCwi/Tk7NiS9kdq5f92ZDbUb6ejmQj6BfYAZAXPkv/6SLbnmuPZp8+YJRlocNp/L52eQ==
X-Received: by 2002:a05:6820:f49:b0:5bb:815d:e2ab with SMTP id 006d021491bc7-5bb815de308mr3531890eaf.1.1718247819665;
        Wed, 12 Jun 2024 20:03:39 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:38 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 25/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_state_v2_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:19 -0700
Message-Id: <20240613030241.5771-26-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200341_062891_3C42B706 
X-CRM114-Status: GOOD (  12.61  )
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

Extend mt7925_mcu_sta_state_v2_tlv with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 9b69b4b178de..45437603763e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1540,7 +1540,7 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 
 static void
 mt7925_mcu_sta_state_v2_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
-			    struct ieee80211_sta *sta,
+			    struct ieee80211_link_sta *link_sta,
 			    struct ieee80211_vif *vif,
 			    u8 rcpi, u8 sta_state)
 {
@@ -1560,9 +1560,9 @@ mt7925_mcu_sta_state_v2_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 	state = (struct sta_rec_state_v2 *)tlv;
 	state->state = sta_state;
 
-	if (sta->deflink.vht_cap.vht_supported) {
-		state->vht_opmode = sta->deflink.bandwidth;
-		state->vht_opmode |= sta->deflink.rx_nss <<
+	if (link_sta->vht_cap.vht_supported) {
+		state->vht_opmode = link_sta->bandwidth;
+		state->vht_opmode |= link_sta->rx_nss <<
 			IEEE80211_OPMODE_NOTIF_RX_NSS_SHIFT;
 	}
 }
@@ -1643,7 +1643,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt7925_mcu_sta_eht_tlv(skb, info->link_sta->sta);
 		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
 					     info->link_sta->sta);
-		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta->sta,
+		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta,
 					    info->vif, info->rcpi,
 					    info->state);
 		mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
-- 
2.34.1


