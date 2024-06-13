Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82870C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tk2KfDSTIKehiWysrLk9gdpwiwyKzUSH27r7ZuD+Tno=; b=te88Q3pdnsapBxNW84WBpwTkFf
	Y5AOQtcjraN4igmX53152d6KwtTI9fiRjT70Zo5FL9deIhVXpGSgI2xd5Kw74WXiGs5JCXTqLVDkl
	K7u3WA/EgGqn8oSd+aiAY/kSDvwBZ4kbWK+KIMlckrZh1EsA00GEeIQwiSdl1DDYdjwmVkow9vkV5
	GLKDSeX/x8/Ywe/Eg/dVjjS/YXMTSGT9QT3HvL28T2RuXSupFVYiQL2jzkfI5NWT1j1J2o0x+96Xg
	gGSVMn0hSyW48Z1SCTX2p9XA+dfzZa6apdz+nvCExOHpUC8CRf/3tMPzV1YYodTewujsfXcXBwZIE
	sjODvooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak5-0000000Evf0-0Wwo;
	Thu, 13 Jun 2024 03:03:13 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHajx-0000000EvZt-2XdM
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:08 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5bb24436f72so14140eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247784; x=1718852584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tk2KfDSTIKehiWysrLk9gdpwiwyKzUSH27r7ZuD+Tno=;
        b=Hr37yayd2GgDaN1CkgdpxAaZmwsEu32nZKYmlFLRX6iSd2XtvLoR72pTGZ+TBk55H4
         NkqjiBnC9uBB3sSSBoLpHU9aJgehzW20VEDMqpOvefltwZeXWJS2SiAap//eeKcVnKx3
         X1zjPHKLMscuPPzyahZDin0Sfmp6NWW2+wat0GauydS26Ymy3Huoy+m6ujY5AM/BlvJs
         W8Efa/zu9dKfkSLZkvKOJ7Sq2UX73MklfVAEVDK8WplQ3xXbyJyIzrhihxTVdMm22FJk
         OzPULA3iY4x9zbJnTYT1wZ9ixKR74pyyjehyRSHDOodL9ymyPVnjF35jmr3ucdiG0ZTq
         suLg==
X-Forwarded-Encrypted: i=1; AJvYcCVvXjxHbNlJw/18ENR37IotHPpL9nXlRmCND2/qd180oC3QDntQnoCWvApUoAnFG2YncxteUfySegoE5ozuqHQ9dlhzQ+iYKRJwK1/3WNXwdTsg
X-Gm-Message-State: AOJu0Yz+R13jvFkIRtxS3jNlOLTJHjbOBjNoxzNOYLYPMkC6yglC0Kon
	UVZrqXsh8ltEIJiXe3oMDC4VvWd1lL68DQ2Jeb4hW6mPBr9SRuKP
X-Google-Smtp-Source: AGHT+IFcPqgYrGZI9GZ47JpULxLN3L/F/sHM2E8m7VjxRNFeYrHwyBz83/Oy9JZvqVrwfoiee4fkzw==
X-Received: by 2002:a05:6820:d88:b0:5ba:ead2:c742 with SMTP id 006d021491bc7-5bb3b7a3d2bmr3670796eaf.0.1718247784338;
        Wed, 12 Jun 2024 20:03:04 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:03 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 08/47] wifi: mt76: mt7925: extend mt7925_mcu_set_timing for per-link BSS
Date: Wed, 12 Jun 2024 20:02:02 -0700
Message-Id: <20240613030241.5771-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200305_741379_1099B2ED 
X-CRM114-Status: GOOD (  13.80  )
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

Extend mt7925_mcu_set_timing with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 7b9deb586b34..6a1afff92399 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1400,7 +1400,7 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 
 		if (slottime != phy->slottime) {
 			phy->slottime = slottime;
-			mt7925_mcu_set_timing(phy, vif);
+			mt7925_mcu_set_timing(phy, info);
 		}
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fb261ee525be..b82cc1bd09b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2296,9 +2296,9 @@ mt7925_mcu_bss_ifs_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
 }
 
 int mt7925_mcu_set_timing(struct mt792x_phy *phy,
-			  struct ieee80211_vif *vif)
+			  struct ieee80211_bss_conf *link_conf)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
 	struct mt792x_dev *dev = phy->dev;
 	struct sk_buff *skb;
 
@@ -2307,7 +2307,7 @@ int mt7925_mcu_set_timing(struct mt792x_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt7925_mcu_bss_ifs_tlv(skb, vif);
+	mt7925_mcu_bss_ifs_tlv(skb, link_conf->vif);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index c692996e057c..d3584743c266 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -582,7 +582,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_sta *sta,
 			    int enable);
 int mt7925_mcu_set_timing(struct mt792x_phy *phy,
-			  struct ieee80211_vif *vif);
+			  struct ieee80211_bss_conf *link_conf);
 int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable);
 int mt7925_mcu_set_channel_domain(struct mt76_phy *phy);
 int mt7925_mcu_set_radio_en(struct mt792x_phy *phy, bool enable);
-- 
2.34.1


