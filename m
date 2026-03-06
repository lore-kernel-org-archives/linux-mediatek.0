Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C2FF5141C
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9odMuMDX1nM70rzmWxmpu+kqigeVOy1ZywVNBsLqWA=; b=ujFwXdUvXO/f3fehrKxO0pXPBk
	heGh8XFvW70zmzpswsPUtIAtD2/odzNLPmbzObV7aGQ1o+xnOcXQ8XW9KLIFYQTyplGb3x81WOlHB
	4pM4UMFJIgnZ0zDp8RLn+dV+KOWFWOh0h19jmUoSDYIP+MTBSQEnT9A5IBKjtBjXg8EMSGiFnFiP/
	rO7zQ+i/+YnUIfcfDCRM8FbR+xuouYGwMxFcJkbb15nAw9og+3CA9XnKmaTs/6tZl0sUZ0U6aP52P
	/Im8izEc4O5SZxBR8wMQZ43W2KxIJPFk3qS/grwNQa145Q8plUM6WUDQNDZzKRoIEsLuyWMlSKbA7
	dQ2gLO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeW9-00000004daD-056B;
	Fri, 06 Mar 2026 23:23:37 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeW5-00000004dYE-42Dx
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:35 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4152698e745so1843809fac.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839413; x=1773444213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9odMuMDX1nM70rzmWxmpu+kqigeVOy1ZywVNBsLqWA=;
        b=Fs0bn+rg6ql8lQ8mJb286dE/0GS0Apdp/LvVZqZEI7P/HxJ6uqKLalFUWggkBrDLY6
         +zZw1PZKsTp3d3rHNkC6TA3QT1xh/H08jS8jKOFJ0cdjllNVChYYvh1PnTO83WeCGoSe
         aEtwkSPk3sWKJUifXhCl/UU84K1uKuCvU6Ymxn2hai5CY969qLYb17KpQ5XFk0FfZZkd
         YsU2k/fHsZCL7ft8TNk+xnmslZLgjkDVEzB5gAxAbeL354XIzRqVkGEJtHJA5Df1nKYf
         DoWsKX0iOHIuDlMJv8FfQS/xXDbnpIFwsvG4Tan1q8QjmjlamAQJO4yK3Zkp8tAp9VOI
         xP9w==
X-Forwarded-Encrypted: i=1; AJvYcCXWxz6XCheZ5njd+5qiM7b3HWGtTHZY0MvGTh6YnHpatMeV3J+V8ZSAqP7arjqRPBjtpn3gUN+e5SB4RaxoOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0qYhYD2dGdav7A9UcaBbJnFOkYbBA2VFcvDangaZVs0nIdl3i
	Yu4UuUwOg8W6EFBlmCCc6Qh4yL+nkHIcw1rct4ca67kmDMT1kp4TKE3phONBow==
X-Gm-Gg: ATEYQzwe/syDQ9m5G9khamcqp11Aq+/So5oV5pIlbNCNEiZM5qXKGlmnTgm4AQ8DRdA
	9olHN3m6LnhNrec1nb/RN8fZe6CvrhpmZ2HKZDfg88cjLcAYdq1CInOtypRxdwTzaHWhEnWXzJV
	lcv5oLdPMJ04oz8PJ/3+u+nDg8Ko6iVkHo/7RkViVTN4lZfsaJ1q0ZhIVdGnY5okKSIAWmMa04m
	3NOGFs3apqZSuf6hXO2Ozn4mSsXa8JV1jHCGb1kZGx4sH4ber1JsuJW36xEqetlEYHgoqOolIV5
	kb9WyKX2yn++RpKj882BbBhBDvGd4nfofcfRFnWIY2c3eDU2wH/m89rfj5Tr/y+gPrUNXqYLAL9
	g7i1P7IT/uAjuDTi2CNaw9dfebYDm8q9yMzJTos3f87MlF9By2Z+dq0CVJrnbuwiAq5l84AZgT4
	kaWBH7xFNXo2Q4jpGotPCegA70p4r+Jz2xOaC54qloab5J7Lw=
X-Received: by 2002:a05:6870:c232:b0:3e7:eee7:9466 with SMTP id 586e51a60fabf-416e43c76ccmr2373476fac.39.1772839412785;
        Fri, 06 Mar 2026 15:23:32 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:32 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 07/19] wifi: mt76: mt7925: pass mlink to sta_hdr_trans_tlv()
Date: Fri,  6 Mar 2026 17:22:26 -0600
Message-ID: <20260306232238.2039675-8-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152334_025738_B717C50D 
X-CRM114-Status: GOOD (  10.23  )
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

Drop the mt792x_sta_to_link() lookup in mt7925_mcu_sta_hdr_trans_tlv()
and pass the resolved mlink from the caller instead. The link is
already known at the call site, making the lookup redundant.

This keeps the helper lookup-free and makes WCID selection explicit.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fa4915b65fcc..c474dd358650 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1066,9 +1066,9 @@ EXPORT_SYMBOL_GPL(mt7925_run_firmware);
 static void
 mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 			     struct ieee80211_vif *vif,
-			     struct ieee80211_link_sta *link_sta)
+			     struct ieee80211_link_sta *link_sta,
+			     struct mt792x_link_sta *mlink)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct sta_rec_hdr_trans *hdr_trans;
 	struct mt76_wcid *wcid;
 	struct tlv *tlv;
@@ -1082,15 +1082,7 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 	else
 		hdr_trans->from_ds = true;
 
-	if (link_sta) {
-		struct mt792x_sta *msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-		struct mt792x_link_sta *mlink;
-
-		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
-		wcid = &mlink->wcid;
-	} else {
-		wcid = &mvif->sta.deflink.wcid;
-	}
+	wcid = &mlink->wcid;
 
 	if (!wcid)
 		return;
@@ -1127,7 +1119,10 @@ int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 		return PTR_ERR(skb);
 
 	/* starec hdr trans */
-	mt7925_mcu_sta_hdr_trans_tlv(skb, vif, link_sta);
+	if (!link_sta)
+		mlink = &mvif->sta.deflink;
+
+	mt7925_mcu_sta_hdr_trans_tlv(skb, vif, link_sta, mlink);
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
 }
@@ -2028,7 +2023,10 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt76_connac_mcu_add_tlv(skb, STA_REC_MLD_OFF,
 					sizeof(struct tlv));
 	} else {
-		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
+		if (!info->link_sta)
+			mlink = &mvif->sta.deflink;
+
+		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta, mlink);
 	}
 
 	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
-- 
2.43.0


