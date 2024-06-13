Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A1FC27C77
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rafBksQtkYVoC/BWTavX7eiqg0TRwXU04Jibtu1TkE=; b=hgnp8nhegi7j0htxplJU5SV+eI
	VgA/OfP2NXM3hZ+Ll8NzvqIz30YK2Q8lbe4szPP6WBSxhUBR1OQNoN891XjhaQTqrK4i6jAZx2AMw
	9Kyj4zFYIJ7hRl3spPzg9PAghHOnKW9U5dLX+jGhD7y48p2nvSiUsX8SHzUqIQ5nt1fWUwF3WCN36
	PX5//2bBqjxXkjYPYmuh+RtmWaI5L4KhFAbkQ35PkbmICmm+BNugPMwYO7mqQTqB4BizQe73GcsPS
	Qo89w2VvAnW2OZoxI9w6atFeyWPOlH2OsAIbNMzkftWVi/c7wgEJIUB2zRQyf+j1fqt6s/GVQ18mv
	9Kt+mgyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak6-0000000Evfv-2XDe;
	Thu, 13 Jun 2024 03:03:14 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajz-0000000EvbN-2IdP
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:12 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b3356fd4f3so38456eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247786; x=1718852586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rafBksQtkYVoC/BWTavX7eiqg0TRwXU04Jibtu1TkE=;
        b=ElzeoRIcdW3oK6ScDLDLbsD+WuCd3Vg2A8kVVs4fHglVRXXrBUOWf0ttPwO8UiC3Ye
         JXuwnuB7B2P6RMNKOq5bQ2tgZuOzJEF34Is+IXjfTvGHaplpR/Pi9X/yT1hPVES/0icx
         lUbGrzBBlHiP59SHYWCjWxvfnF1rgeBEAHsDxafaKctKQdSGlEkXfFnP5F4mAVx+2oeX
         DMsvSLx0QEgUv/Wt1WCXYUoQp2NXQ/Johjg0Nu/oLD5hOJEdHUTmycfCirJBZASd21Ax
         mj9myNJkvzLbSkzSsa6ptgRhB8bTQnWrtmQr4oD2RmG7e4EI0ccF3L2CjtqXX/loSvOe
         zhRg==
X-Forwarded-Encrypted: i=1; AJvYcCUO0GGSlBJwIFjt4fHRr9liRjfVsB+9CD1JgwKzwpfTTr0FA2hYhIUZMf25zOtuWv1mUVc/U/KgWtY++GP38w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDmPIkSgF+hWZy+PqCtqYA4rcNaMZFPTnfrVNqURBlO1jzvD1G
	dO/nHshxyvy4f73avuw421gr4sc+jvbC/bYhtyB34qvaqRIM6F69
X-Google-Smtp-Source: AGHT+IGwwyNIftQ14L3NdNPlplOU/t7cE5px2Mk4ncDXYt5dNmPrtoCQqI/UUXuRnSHlTazF+mKdpg==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr285145eaf.1.1718247786634;
        Wed, 12 Jun 2024 20:03:06 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:04 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 09/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_ifs_tlv for per-link BSS
Date: Wed, 12 Jun 2024 20:02:03 -0700
Message-Id: <20240613030241.5771-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200308_036065_2F251841 
X-CRM114-Status: GOOD (  11.08  )
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

Extend mt7925_mcu_bss_ifs_tlv with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b82cc1bd09b6..7cde18e273d8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2282,9 +2282,10 @@ mt7925_mcu_bss_color_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 }
 
 static void
-mt7925_mcu_bss_ifs_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
+mt7925_mcu_bss_ifs_tlv(struct sk_buff *skb,
+		       struct ieee80211_bss_conf *link_conf)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
 	struct mt792x_phy *phy = mvif->phy;
 	struct bss_ifs_time_tlv *ifs_time;
 	struct tlv *tlv;
@@ -2307,7 +2308,7 @@ int mt7925_mcu_set_timing(struct mt792x_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt7925_mcu_bss_ifs_tlv(skb, link_conf->vif);
+	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
@@ -2337,7 +2338,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf->vif, sta);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf->vif);
 	mt7925_mcu_bss_mld_tlv(skb, link_conf->vif, sta);
-	mt7925_mcu_bss_ifs_tlv(skb, link_conf->vif);
+	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	if (link_conf->he_support) {
 		mt7925_mcu_bss_he_tlv(skb, link_conf->vif, phy);
-- 
2.34.1


