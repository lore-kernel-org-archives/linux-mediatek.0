Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DE7C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4rId6s/qmy89OdkA2iSIQ271sV1Ry06U/w402v2yWU=; b=IlVLvDcTS+hQiYICD1CeYKueOq
	eOmzbqg3Uez9L4i3pccaP7TxL1uLWIAGKKz0BdloK0LgzR3C7tgMUkb31U99kOrCt30mhmEGQxB2s
	F+lIDOVO7RWTS1Ym0i8oX1Y952pd7UmE0fQ8trdI2ktVnNZNC+iyUiPVgNty0riftwBayDpDsXIlC
	bbjc9P11f3yRF7RZhG1lZD8nNAA3EpXwwg/Fr2+vI7e0ityVv8Uf1V5D7yU3IwQdGcbcmvvaMWz65
	VjTFhzKhK0OqeljFOLGE4AwWbAHcieTRGw3e/VbEj1+6NEGIMkonxTwUC+Mp6tjjnXHYAaTWKZmO8
	IgKguUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakl-0000000Ew5f-2A4a;
	Thu, 13 Jun 2024 03:03:55 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHake-0000000Ew11-3xL4
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:51 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d21c5b48f5so75205b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247828; x=1718852628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4rId6s/qmy89OdkA2iSIQ271sV1Ry06U/w402v2yWU=;
        b=ACdU6b/iN7EvYmcFa53HMffw0fIeiIKaC4+iVyfY4OWsGatX/dvXH+gzFcsc23wTy1
         oRCvDPeAxw8Hy3YPmfN8gxCBwewUudr8ROMVkvRFOKcQQ3C+bwsDJkUBnoH3fR4HGTDy
         GxX2T5GCGFCCsPSPSjqjm+eBf/3KlXJRU4TJ2yVMLy6LCSVrNXkCdZm7dpRnCGWMAzUz
         uqJW+t+gRk38+6h9VdKPYhU9DfIuYEMXcJqARZF0HkzBBUrZPKd6NsXsaj5ZJvD3tJ2R
         iy58rOnqzNieNyAgZTZbliTYJZaDwK1WPypubBCaLVRkh5WeiVMVkq7lgReMoI5/0TRC
         Mh+A==
X-Forwarded-Encrypted: i=1; AJvYcCXTe//WshjsosTq/3VuDwIwavH5QCafurtsyG9OfoNa7cux8vKlqlb5x3g208oDuAepyI/1XUqgWQwmJcc3TKOgSchGKq84dN7WCqpjjDYG5xVz
X-Gm-Message-State: AOJu0YzHVXixUFMeFrXLPHZb/911C5m6XKxwYik2i/0+HHqaOe5K5XTP
	hsEHowKXGPHntS/k3b2nPT80cu2sY4JIlA6b+LuSab+F6Mj0hRGd
X-Google-Smtp-Source: AGHT+IEpyH6w/EK2iWtAObLb4d3oRuoEuMedN2czPvggkOCgAvhOzzTMDXr5KCZ9o4tV5qlS9hho0Q==
X-Received: by 2002:a05:6820:d88:b0:5ba:ead2:c742 with SMTP id 006d021491bc7-5bb3b7a3d2bmr3672524eaf.0.1718247827596;
        Wed, 12 Jun 2024 20:03:47 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:46 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 29/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_he_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:23 -0700
Message-Id: <20240613030241.5771-30-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200349_126692_FE9C4BAB 
X-CRM114-Status: GOOD (  11.16  )
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

Extend mt7925_mcu_sta_he_tlv with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e1dc8452468c..a57620aed63b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1380,12 +1380,12 @@ mt7925_mcu_set_bss_pm(struct mt792x_dev *dev,
 }
 
 static void
-mt7925_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+mt7925_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 {
-	if (!sta->deflink.he_cap.has_he)
+	if (!link_sta->he_cap.has_he)
 		return;
 
-	mt76_connac_mcu_sta_he_tlv_v2(skb, sta);
+	mt76_connac_mcu_sta_he_tlv_v2(skb, link_sta->sta);
 }
 
 static void
@@ -1640,7 +1640,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta->sta);
 		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
 		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta->sta);
-		mt7925_mcu_sta_he_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_he_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
-- 
2.34.1


