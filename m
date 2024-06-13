Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C354DC27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQHpQNEsytBYs2FLiCmUpTPqTQTP3NJD/MKbmAcXuJk=; b=uw+/BbxQ0pWdQa+0IphvTY0cZR
	qg0lopwuQ3FrcP0lKk5AmxV+TEHtEtVCgCDszLFFVpADebb4S/txvUXtx0gt46PJR4p2TANJFtGTw
	6Tr+hA9fpAzklmpfa2bigXNUb4WW1hO8+OHUna0BFq9Nl+Rtd9dHiC4u842bhD746E+L8BdBGqCSw
	OQgzt0/mXwmy6X7178XZHm0FvoO+VlioXwyUwoIT2xnViwzyVh6ZB7hMzDsnxZeDxCVNMQvgcUSHq
	cA/mvreB7V+U71+yBsBql0s3z0BKbOwCJvSvHxA74KSgn5n23U/EZPlQ6rUipsZ59G6XFiz2cWsHI
	ylWmj8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak7-0000000Evgj-1STE;
	Thu, 13 Jun 2024 03:03:15 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak3-0000000Evdz-3UwI
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:13 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5bb33237b60so22131eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247791; x=1718852591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQHpQNEsytBYs2FLiCmUpTPqTQTP3NJD/MKbmAcXuJk=;
        b=qjU3GhzESsb9ww7/3ZT3mXCo+sMXYq/cH4YtgDz7reWT9iO+9YU2oSzRjKKPsv/sQh
         hWMWJgpqkMOiRZ0YNlB8o+dGdbEQDT9soy66fo6VPmiofivmwyCHdNfPtA6bWw1eoIUp
         RfPrJxkS4bvxiGFNKZKQ6K+szC6lQjVEx0IPm2ZNMklUjzq2QCC5291iA5FVW0fWZ+nQ
         Nn9F01d0KoXrO4wCdSSMZxON5iF4bmNLZPpMtzMkM/rYiohGVBG5H7OpLYP0hY0kvjG1
         CCqy4mdbYdxnL5n3iDy2WhFWKnAu/jNSAqhFX6anSVGbOi55eW05i2WN/Cr0ysjuYQWa
         yaQA==
X-Forwarded-Encrypted: i=1; AJvYcCUB0dKPzY21xSR/kwPBzMlyB5EfANRztdqCeeU1cdmdSlicSrQS/7sxQ0ccNPWi73aAgxKIYhddbPvHD61gzpbdgebX0jZ/yXu3XSahjqHspsax
X-Gm-Message-State: AOJu0Yy0LgYTxbZJztU5a59RP9YZ4USL+/e40xHGI5W0ktXVF2iBfBGa
	Z30OOh/Y0c4m4/D9/KdaoshSXFfjroMg3Pbia6VH5xRO1U7tgEnc
X-Google-Smtp-Source: AGHT+IHRYjNKPC2FOi2+KaQtr+N2oUkVlnnJ0LtIy99g1YcK7m+ehh3yibeBWAa97dm0X9RUmo3A4w==
X-Received: by 2002:a4a:a5ca:0:b0:5ba:e11d:a2ae with SMTP id 006d021491bc7-5bb3b9f4ef7mr3671269eaf.1.1718247790954;
        Wed, 12 Jun 2024 20:03:10 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:09 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 11/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_he_tlv for per-link BSS
Date: Wed, 12 Jun 2024 20:02:05 -0700
Message-Id: <20240613030241.5771-12-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200311_905330_8873D664 
X-CRM114-Status: GOOD (  12.36  )
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

Extend mt7925_mcu_bss_he_tlv with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 10e38637eb83..533214403008 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2238,7 +2238,7 @@ mt7925_mcu_bss_qos_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
 }
 
 static void
-mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
 		      struct mt792x_phy *phy)
 {
 #define DEFAULT_HE_PE_DURATION		4
@@ -2247,16 +2247,16 @@ mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct bss_info_uni_he *he;
 	struct tlv *tlv;
 
-	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	cap = mt76_connac_get_he_phy_cap(phy->mt76, link_conf->vif);
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeof(*he));
 
 	he = (struct bss_info_uni_he *)tlv;
-	he->he_pe_duration = vif->bss_conf.htc_trig_based_pkt_ext;
+	he->he_pe_duration = link_conf->htc_trig_based_pkt_ext;
 	if (!he->he_pe_duration)
 		he->he_pe_duration = DEFAULT_HE_PE_DURATION;
 
-	he->he_rts_thres = cpu_to_le16(vif->bss_conf.frame_time_rts_th);
+	he->he_rts_thres = cpu_to_le16(link_conf->frame_time_rts_th);
 	if (!he->he_rts_thres)
 		he->he_rts_thres = cpu_to_le16(DEFAULT_HE_DURATION_RTS_THRES);
 
@@ -2341,7 +2341,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	if (link_conf->he_support) {
-		mt7925_mcu_bss_he_tlv(skb, link_conf->vif, phy);
+		mt7925_mcu_bss_he_tlv(skb, link_conf, phy);
 		mt7925_mcu_bss_color_tlv(skb, link_conf, enable);
 	}
 
-- 
2.34.1


