Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A455C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjjV9MoW6/GqqLbyBVNCqJec5vStgsiVvPCH52PPCaU=; b=oynclQIgUaHhq1IBmbN9cgwoRV
	6w54CFltXgAXbxxN0CeoYYCyODs5yzy9l/HIxMJmJTLTrdmqKETZYdW8S/GXnzC6ciS6tcOaOrqTm
	E0Rcv4MCzzb+0rfaqvjugdZ5QBP4DfILInq/UsqK3QpAcNae/xVNHUJYk8GCkllOJMbEExyOCDs6d
	sKD6TTZkL16X0iUJgh9Zgl8m4aswznQAPZtWEeU2FF2TJ5Lz9640Fr5gvaVJN+ycMAYmCBGEqVU0R
	yu8OILhWzmWFJRZnObGUrhb02QI20IY1XS07YPzJOgQxdcXq/35qnuxPXpcX383BtIt8MjgjP+UJo
	djHo2WYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ky-0000000BX8o-01y2;
	Wed, 03 Jul 2024 21:43:16 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ku-0000000BX6y-2YrX
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:13 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-70218c133adso134075a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042991; x=1720647791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjjV9MoW6/GqqLbyBVNCqJec5vStgsiVvPCH52PPCaU=;
        b=OnRdazTbPVVxPqe1JOOHlw1G8IisLD3IhxKf5bLk/RnqAnTPpMpz6vE07+YpV6sips
         wd99qtcPd17Zf0KDyTL+/96mfMO4o/yZEAJHtInxLdPyDzfUoehtL8qu/u4Au+phv4Jg
         Ma2+FzfRjNoSqM/QsoIC4mODTuDmj7bPx9aW2m4TEypk2P4cAQoZhVgxTDF0NwNnn34g
         miuphg30NBbDWotx2RDZCV7VRKIm6V1XzuDf0ISdlUbSX+cykvhcGDtGwuBhp8fWzRYY
         EeIW4iOmJ9vrXORw17Ozr9VZfBVKtbgA6GsHFudBe4SZEU3wXAR28VZp+eESpb3f8PpL
         xRpw==
X-Forwarded-Encrypted: i=1; AJvYcCWUu6mq7nKrXHsLCCqFZTdYEzRWKix84zV1FWe+wHueEb15isNjh/eWmiUp+7HpIwLhDFAjVldD8wdWtFI2mb/9/Y/tDyUeXdQ0SQ1JA4D4Jfsp
X-Gm-Message-State: AOJu0Yy+YxDpLGnlOXiHLxgNMNRnPuPAL0Z2PzQeVawI+iA44AcKy+zc
	QJgW/uXBJ3DoB0VwV1T55lYDd3E+ouR3c+iIvUxtP9xE4BrZ3hl5
X-Google-Smtp-Source: AGHT+IHzTUePuwQCPzYY/JacfKT/2WyEXRpG6nm5RKejU7QJGziRTmVQSCSVqAKa2hnz66ETj0H/8A==
X-Received: by 2002:a9d:5c89:0:b0:701:f366:71d7 with SMTP id 46e09a7af769-7020767ab30mr12877677a34.1.1720042991623;
        Wed, 03 Jul 2024 14:43:11 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:10 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 10/29] wifi: mt76: mt7925: add link handling in mt7925_mac_sta_remove
Date: Wed,  3 Jul 2024 14:42:15 -0700
Message-Id: <84e2ec56c995fdf562b1d3146dd1456ec5cd05af.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144312_671742_45365423 
X-CRM114-Status: GOOD (  10.63  )
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

Added link handling to mt7925_mac_sta_remove, supporting the MLO-enabled
firmware. The change remains comptabile with the non-MLO mode.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 82d16208764f..5360f8a71655 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1033,7 +1033,13 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
-	mt7925_mac_link_sta_remove(mdev, vif, &sta->deflink);
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	unsigned long rem;
+
+	rem = ieee80211_vif_is_mld(vif) ? msta->valid_links : BIT(0);
+
+	mt7925_mac_sta_remove_links(dev, vif, sta, rem);
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-- 
2.25.1


