Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF934C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7OsvxRZu1eH3rdvc+37NIE+pK4g9A8AD+jv6tlQz/U=; b=soHDjUn6Rgd5yXlOmBBUi7sjyT
	mPmpp8wGmx7UsXSMy+yPxNMjduHEixqjnv4RuOQZBHB1LP5O2B2kSIh43/aYpAz2GvejTxwM6bZ/q
	iQN4FBmx5KGa41tAW+lrxBhdi6BqJ112korjHHtFudqHG6trzMra8GxpYEvwplGqZU9U8EaRc55dI
	xzItKkOlvOkeRvmyQHfE7zfa9WjxPcwKeIy9WuHvQ8LLY4INdtHK+MVkOXZbXsTDfxkgYJPXCINRW
	vs//eSv9u+eUQtUQeY1Yz81kUGIpgwEpPDHzZmYD+D84kdQ9WQKay6KJp0gUqjnFDvIQzNCmq3Ev/
	R/iMdykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaks-0000000EwA0-1C9Z;
	Thu, 13 Jun 2024 03:04:02 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakl-0000000Ew5F-1O3R
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:58 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-24c5ec50da1so92087fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247834; x=1718852634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7OsvxRZu1eH3rdvc+37NIE+pK4g9A8AD+jv6tlQz/U=;
        b=ume4VPkrKNu9hia8kB3FNDAt3FhIxJM6rEal9Av4K94zH+IVKuTcMLFjKkR+zaF32/
         YSyh+dah76RfZBlgWm6n0iA46fUrkYeiwo6DCH5tibZKa+bfo7Q9pFpEbdq6OAuARgKS
         0T8ZEHj/02sIkaKu3DXjx+UD/zWmABLmCrUASIWafvE8/N0VkiQJLfCCqYDoPvqyP8nP
         W3SHen6zvlpYG70+VkxDZxDXz0Is0GQBwjP/JyU2jgokViYbyOPIIeDzJgGkqfQKdKkI
         eoeBsyTxDMSSnFyzpdnnevrlk69LMgwyfZpgeI1tzd+26gxqjzzBevFwZBK/Yv/6Wya2
         1wGg==
X-Forwarded-Encrypted: i=1; AJvYcCW1CugMAkAjK0IW4TefSSRMdGVLVCAj/O8q0+NbSrmLvaCIpa2fqtJ4TyBrlaYp6N5qsZVAoipRBpYFPrKAHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7EpKh1x0nUyFeasFGtMEkmdxZOVIg2uPViDtDSJF0227GJKGV
	H3wnk2zkUDKkp86jzb4KY1cilyC9mU+pv3Oqi91dX3f//yR3r1P8
X-Google-Smtp-Source: AGHT+IE5cSfFw0Tv8T3gXQeOhSzuuOvBA5v7PhZB9lPUmMjA6fWy7PnkWJW0q3qEHs38JHYZsnq3kw==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr286464eaf.1.1718247833853;
        Wed, 12 Jun 2024 20:03:53 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:52 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 32/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_ht_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:26 -0700
Message-Id: <20240613030241.5771-33-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200355_455380_81519F0C 
X-CRM114-Status: GOOD (  11.61  )
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

Extend mt7925_mcu_sta_ht_tlv with the per-link STA configuration.

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
index 1b66dd26bd1e..66d45d676739 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1433,18 +1433,18 @@ mt7925_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 }
 
 static void
-mt7925_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+mt7925_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 {
 	struct sta_rec_ht *ht;
 	struct tlv *tlv;
 
-	if (!sta->deflink.ht_cap.ht_supported)
+	if (!link_sta->ht_cap.ht_supported)
 		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
 
 	ht = (struct sta_rec_ht *)tlv;
-	ht->ht_cap = cpu_to_le16(sta->deflink.ht_cap.cap);
+	ht->ht_cap = cpu_to_le16(link_sta->ht_cap.cap);
 }
 
 static void
@@ -1640,7 +1640,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 					      info->enable, info->newly);
 	if (info->link_sta && info->enable) {
 		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta->sta);
-		mt7925_mcu_sta_ht_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
 		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
 		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta);
-- 
2.34.1


