Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402F6C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QluQbYsRthrq2TjY99xwQmJ0DyLFnyarxriaOvZB7dE=; b=uiwkX1vEQgYfONTuuhrvKqeHLj
	IffbT+ITIBO/so9Kt44Z5vC1F/qROaBbBKrRXHwR3rbyNYHys86fyapOmi4bF5XXjsT16XBxbvyhj
	/pspshP7B6Tqz7hlBUJnfHQ9/T1Wkp69vR/IsWaoFbOlnbllL5AUXpR5shA4x1UcEA1c6oardmHUh
	XppfOZU+lD17LwhnwZ0+BpdSuMcUwFWtOs+XUBFHJCplNAjVEJgL8MvgnzopIUU43NygxqlCPbrle
	q5e4GyZJTJYt7il0lhOBMZp1xeVYvWvBJRLbSj0AzDNhlCrPAOP7ABv1LvRA+LQxskqUzgNI2Kg4q
	MWkHYjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal6-0000000EwKw-3fmS;
	Thu, 13 Jun 2024 03:04:16 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal0-0000000EwG6-3nZX
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:13 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-254f646b625so96475fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247850; x=1718852650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QluQbYsRthrq2TjY99xwQmJ0DyLFnyarxriaOvZB7dE=;
        b=S+l1F/nq+pQWgGCT3PFtuZbWH9N9V3RhkaSxwV1tTtWdB434ozq7lTHB0CUoK+LSUF
         yaiIlhowg2FnQnhVKLSVmwxXk4JKtSztFKfvewZHCBg+slan99vnKU+6C4VkJy1xFZ/F
         Ce5ie1LUtsMDnZWmo3OOy6VF+tqKGco6nueRY19i3xpz8BPCVWGQvopgy+wYsLCbPS44
         wwEuDbEgTyNu3FSE30zV46df8xQX7J0kPGVf7/ZF/mYKDEp4gJzxt6UQVgjPUu6igVnT
         IDUjhjEmQ0/GcV8YNBKY++u/i7Yh71c0NmRhlxeSqb4SssCLMBA41KPoqWq6W4TdbRL1
         aFhg==
X-Forwarded-Encrypted: i=1; AJvYcCUhDhAS7xQi7mIaqZsIWj4CT6X7y59jZhtolpBwJC6koy4FcezlvhI+VcSDfrb1zONV2m7z0vgYn45nuDDmbiRuT7h5JFD7lVjnx3D3ZcitG4My
X-Gm-Message-State: AOJu0YxGd5m+wDolZCKfAJd8U3zSRjpcH7cN/E5qV7wr4txkjXYs2mob
	cZT57QQmQr/jrVeIXiO1A9wIlwSK5OF0OMuKSLDX3BhRfHB3okmh
X-Google-Smtp-Source: AGHT+IHHJAHArvkNLNdoaLuxrn6Rn+tkoIm65xYZGjX4Jf85vYwD0NOU2/HuFivJiJE18UYq80YE7A==
X-Received: by 2002:a4a:3101:0:b0:5ba:ca8a:6598 with SMTP id 006d021491bc7-5bb3b7b972bmr3908503eaf.0.1718247849788;
        Wed, 12 Jun 2024 20:04:09 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:08 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 40/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_mld_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:34 -0700
Message-Id: <20240613030241.5771-41-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200411_106986_83D4CA9F 
X-CRM114-Status: GOOD (  10.76  )
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

Extend mt7925_mcu_bss_mld_tlv with the per-link STA configuration.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d5f94ee78623..24966e614303 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2227,7 +2227,7 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 static void
 mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 		       struct ieee80211_bss_conf *link_conf,
-		       struct ieee80211_sta *sta)
+		       struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	bool is_mld = ieee80211_vif_is_mld(link_conf->vif);
@@ -2237,13 +2237,13 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_MLD, sizeof(*mld));
 	mld = (struct bss_mld_tlv *)tlv;
 
-	mld->link_id = sta ? (is_mld ? link_conf->link_id : 0) : 0xff;
+	mld->link_id = link_sta ? (is_mld ? link_conf->link_id : 0) : 0xff;
 	mld->group_mld_id = is_mld ? mconf->mt76.idx : 0xff;
 	mld->own_mld_id = mconf->mt76.idx + 32;
 	mld->remap_idx = 0xff;
 
-	if (sta)
-		memcpy(mld->mac_addr, sta->addr, ETH_ALEN);
+	if (link_sta)
+		memcpy(mld->mac_addr, link_sta->addr, ETH_ALEN);
 }
 
 static void
@@ -2358,7 +2358,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
-	mt7925_mcu_bss_mld_tlv(skb, link_conf, link_sta->sta);
+	mt7925_mcu_bss_mld_tlv(skb, link_conf, link_sta);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	if (link_conf->he_support) {
-- 
2.34.1


