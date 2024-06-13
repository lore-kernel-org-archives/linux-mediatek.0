Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC2DC27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nqt/BEDIeXN+7dTIp0cSPJgFi4w6MtNYqvkOIFy6ERA=; b=QDeW0PNuP4svKbkGcZEoNKTAPb
	B2PZkUIeiZ7DiK0B1FBAkb2jXBnu09RJcboi/uaEW+AgiwtxaVgbiobpZmFmorOHRLH+hIpzQTBtd
	gK/zXE4hWKK4eC+6CtIE0iU28SH9GOI+BWnDJsmAR9B2in2A/A8qDleegnVMd7EKi+wTYcD1VJhQY
	2mwK5NTmutGKdBoUZdBIl4fKX83BCTf9g8CBt/Age0G57ktw7+qEuX1vnk73AIsz3EZmr9t2XWXVq
	BlJ25W+yJHYozkkEgyo8ciAPTB7AZGcqyu/ZIWXAi8d5vUD0AvuaO0mEzW4/EUpDnGHFLRJeyGJUA
	0G3P/A9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHal2-0000000EwHJ-13xm;
	Thu, 13 Jun 2024 03:04:12 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakx-0000000EwE8-3HPF
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:09 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-254f646b625so96470fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247847; x=1718852647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nqt/BEDIeXN+7dTIp0cSPJgFi4w6MtNYqvkOIFy6ERA=;
        b=Sz/UUTwZzwOZGvyGZf18GDLd3WhIw4iBEJV8G+MEaVvzsahfRKkynyMwftv5kgDsx1
         IiL1F+BWhMJ6Jc7WFbKUVdKQRYnZ4K3eaJR+cAE8vL++R0iEqj3emyri6hMhl9n00YS9
         jwXCVtW3EL/CPp6FNaaKCzS00Zoq5Et8+UZdH8WJmHA5fVLdlQ/v0l/Wlbc4l+3f57QQ
         Hu4V8mnyIzNejNIHarZyqvrmN7v6J0lV+F6EDQ8zZalIvCa3ufzmzq3TtJZ+DsIvU2tH
         SG/kTA07hcXAlkA6OZUrx30+KKG0RG616yZqGQWPWnHAtdJNkoQKANtoPxZtXxpcW/7d
         eUQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtbLbegoi56zxe0n0XmEeQFxbIT9UTxZclbVMQtKlambdraWzR/I5kC9Ua/GGRW2qjI7nSur1tcZ7I0RgjQ2BUmeL5ZToacTsfPRxOlX015hgv
X-Gm-Message-State: AOJu0Yz58dHEVOiWIilfIF/K/wxuH54jzfGrU+gkNigGisGz+gDWeqUB
	/ze2Uo+hjrMsQjMht9SX/2A1vGj9P+dEl7vK1ivGjROGvBbkGe0r
X-Google-Smtp-Source: AGHT+IHw7uKmZJqD7BB5NAXIQv9kZD1ke/Du0CzB7V5wqeMHLqU/91SdPlWac7kB2vk8CgeU5PaNCw==
X-Received: by 2002:a4a:3101:0:b0:5ba:ca8a:6598 with SMTP id 006d021491bc7-5bb3b7b972bmr3908405eaf.0.1718247846756;
        Wed, 12 Jun 2024 20:04:06 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:05 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 38/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_hdr_trans_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:32 -0700
Message-Id: <20240613030241.5771-39-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200407_905578_CB51014A 
X-CRM114-Status: GOOD (  11.63  )
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

Extend mt7925_mcu_sta_hdr_trans_tlv with per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5a40979c0bba..667ecd44392d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -847,7 +847,7 @@ EXPORT_SYMBOL_GPL(mt7925_run_firmware);
 static void
 mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 			     struct ieee80211_vif *vif,
-			     struct ieee80211_sta *sta)
+			     struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct sta_rec_hdr_trans *hdr_trans;
@@ -863,8 +863,8 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 	else
 		hdr_trans->from_ds = true;
 
-	if (sta)
-		wcid = (struct mt76_wcid *)sta->drv_priv;
+	if (link_sta)
+		wcid = (struct mt76_wcid *)link_sta->sta->drv_priv;
 	else
 		wcid = &mvif->sta.deflink.wcid;
 
@@ -895,7 +895,7 @@ int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 		return PTR_ERR(skb);
 
 	/* starec hdr trans */
-	mt7925_mcu_sta_hdr_trans_tlv(skb, vif, sta);
+	mt7925_mcu_sta_hdr_trans_tlv(skb, vif, &sta->deflink);
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
 }
@@ -1664,12 +1664,8 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
 	}
 
-	if (info->enable) {
-		struct ieee80211_sta *sta = info->link_sta ?
-			info->link_sta->sta : NULL;
-
-		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, sta);
-	}
+	if (info->enable)
+		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
 
 	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
 }
-- 
2.34.1


