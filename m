Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E284C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4ipyO6QmN5fpxt1fsns5qX+Z2OCd3HAfhcBpiCjpsI=; b=3zjasmsuPcke2jJx+2EdE8KyG3
	eU9/HSOlFz7CrAcLif74I8vXJMOS0O89xf7tRIc8JMoVdn3iI4VENk979qj9PQYUbIFrYLcB/QDOi
	fBap1h4UvVXl1Md1vN/xl/bKWBbEt0xjRJ5rVDOQ//aO5AGj8ZPrNLKZpDOLVyjOXJjIkfaJKR42f
	agGW8m2KwavFVX5RR9EIjyu8oy1KL0xwo967p2Rgmv8nct1aDijdkQUQVJIq2HEanDrvF2wLhkr7g
	R4ZR14PrSeEROlbVZs34yALQ3Bdf163qEOtT2Z5yOdxdN1C147G1QhQosyZk1GIA6hLwd58Vue0TF
	tDQSMPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakL-0000000EvpB-3QDG;
	Thu, 13 Jun 2024 03:03:29 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakF-0000000Evkt-2kVZ
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:27 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b99ba97d89so25550eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247802; x=1718852602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4ipyO6QmN5fpxt1fsns5qX+Z2OCd3HAfhcBpiCjpsI=;
        b=UHoiMdbFw6ekgUVihtL1a+Q2PU5q18sbsIo9cBoAHWZ63mloEGWz5610X4x/NnHLZz
         o9zoEUsqCnYGAvFTTZ6eU4hYUJ4x9HpTuH5mq9zEjpVJcOzjnn8WeayWCveGp3TCNOrl
         Qur5siOeHpcRjuh/MyuEuvEjhk7n8kI6XJKDz1s84r5UR/YlGX5dOZbvNjicKkqvAaT+
         baAWGsOphp4tl6vrVQ5Ty3q7CW3xrrQCLbBTOrtN9Xx2GPbCBC+SsFFVMEzm5DOphtEd
         tMK8AeTk7itLQSFVDkbp9NRnO/StmaRylM6GSsQtLrmV3T0dkHBiDX4PM5jAZSjXRIdP
         kLvA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Xd6kpjZUUqxTfguuVwxHkNYZM3kEB4mbfCiXT8zclHrUbMgC7DRYUCcHeUkSdLaSd3Y1yqwe3Ovdac5bOg/fwvcToQiVTmtuUMs8p8HpyOK4
X-Gm-Message-State: AOJu0Yw2rOWQiKxw+YKaDNnlrSKs7mFRNN/bzvnYMqocqeUkEMOk37TN
	bw0o4ID1QoK5Xb7kA+ZY92QLIX5CxVwrM4+t2BMwuq4435Z1t1YO9wjByVY/Et4=
X-Google-Smtp-Source: AGHT+IFhWFellQ8sEWpUCo0Tcq9fcIuLBFa3mmXqjo9a9JvDP51OBREHjytgdBFwum1XIR64B6bkUg==
X-Received: by 2002:a05:6820:d88:b0:5ba:ead2:c742 with SMTP id 006d021491bc7-5bb3b7a3d2bmr3671460eaf.0.1718247802154;
        Wed, 12 Jun 2024 20:03:22 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:20 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 16/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_sec_tlv for per-link BSS
Date: Wed, 12 Jun 2024 20:02:10 -0700
Message-Id: <20240613030241.5771-17-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200323_757073_BD4535C8 
X-CRM114-Status: GOOD (  11.05  )
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

Extend mt7925_mcu_bss_sec_tlv with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 797d4c936fec..028c94d8c21f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2132,9 +2132,11 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 }
 
 static void
-mt7925_mcu_bss_sec_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
+mt7925_mcu_bss_sec_tlv(struct sk_buff *skb,
+		       struct ieee80211_bss_conf *link_conf)
 {
-	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	struct mt76_vif *mvif = &mconf->mt76;
 	struct bss_sec_tlv {
 		__le16 tag;
 		__le16 len;
@@ -2333,7 +2335,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	/* bss_basic must be first */
 	mt7925_mcu_bss_basic_tlv(skb, link_conf->vif, sta, ctx, phy->mt76,
 				 mvif->sta.deflink.wcid.idx, enable);
-	mt7925_mcu_bss_sec_tlv(skb, link_conf->vif);
+	mt7925_mcu_bss_sec_tlv(skb, link_conf);
 
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
-- 
2.34.1


