Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7901BFF8860
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rlJascMYcEVmDvEn/UdsWocmJsfAuvfdDTt2p2Jdu2g=; b=2lvgLwHac1eVYdjPIOdltOhjze
	PbaP5l9Z4w0RF5EI5uSmfOjt6eZkXj6xiPVUua5r0zU3/WinnnzDfspHAOpfxb/veM7zSF1qKF1Ud
	5/qgpcR6d6wuqXis48YgfwIfHPdlGqENtISjGr8WMrzSp7G4mbj7MKDNdjbJG/obSgxL+A/7USOpU
	9QxjneOPI0JXQ0081o3VQF25KbQrEV1cfip2j88kNEsMczcPJ9w12zoDacHShnTAwIdwAjqs+469w
	ej/AsNVJo17jC01ygotlMvU1MzkPGJR+cWSQeelZvruobTyiEiShG7JrbQYMQ9Bf6Wk9l03w9/Ymp
	7iS3hWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGeHt-0000000EWTj-3Sje;
	Sat, 25 Apr 2026 14:47:17 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGeHr-0000000EWTP-1Mu6
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 14:47:16 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7dbd23bc684so4938683a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 07:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777128433; x=1777733233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlJascMYcEVmDvEn/UdsWocmJsfAuvfdDTt2p2Jdu2g=;
        b=MpY9IcuvY5CMLzHaZ5W1jOcQWnY8DQBtPI1TYk9jlz+7AsArWXP6MwHj7BJo3kn8Zs
         ZbqyrbTMPs1sXwB+ZDLTiJ0q90L4dNeyhkLUjS4QlVJCRHXZZC11Wv91ljM6Xs3qlDcj
         H9rI42m8euTzG6iYc8GLjcw5++Qaw2hydhkQmwm5uHQzdiKQK8m3UoRe77uN/NVS2wII
         ZLgGoVLdthrj4rHhx+JkA4x0bD/NbyysRlORGt35b8vagVeFXYRd56IMa/OIdN2KqEt5
         X74LrBSzs1FYm5g4oWwKeJPjU3IsIj2Mq/y/d8WdcR1GWingTRQGcOm0PYvkkOSIX5nd
         zEUA==
X-Forwarded-Encrypted: i=1; AFNElJ8J57gM0do1h43I9AtFIDt/idTFxnmbfBZTFDTJsWsQqaiC95RIfMmlE6Mwh+0PrmUtjN9Qxw85G2e6BXBydg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw092rFYT1i3LJO3m4bcfL729rdGIQQVOVp+zRmbpJezm/Jppw7
	vRgLKWYv4cY1fWBT3XcTlx7jLl7KveD65qwp/9rUbU5Xu/yLFL0k43td
X-Gm-Gg: AeBDies7Qlyz8EPmveAOMocN5eTFt7MeETTN0ptgMNHMJ8rLW/ruD1W9TQbuyR5WPX6
	EEt6hnwz8n1xHLP6XQbk+lOHV96asxX+rcI/uLXnVxK1TP4AqMVQXGMdmgUpgm7E8nlKbXlY6HW
	0NJVtpxkuLxIMHSv7FHsQkFhYfvPn/sHEeeRgCfve3ii328pBaawb5KOqkUNTDlkB9RcK0vgmFQ
	+h8Ip/0RQx3SEr6UTinDdQA7d2BUYA3EqYfhC13SjBKri1VjFP+6sXGvNOrRqz+WpD+jzbvabR5
	4Uf8nFUlkT1E86nRK61mLlQGRI3uywvrQOZFeUh4EXnKfjVn5DUEjxn9Ba3Iuy4RgvbycA6xsAQ
	y6wzmtrSJJj62ho5/ckMMENTGVkLnXpMu/TPF5qHxM8Lvd7wSo20J0uRJe5DEZAZr/oifXFq5qv
	TeF9yUQJwn+8EhJhsqdgagB/d0Un0ZSy3p9ThGztztY3To1EwPRb79hyv+s+jWKWs0RKYl9bBlN
	FbR1Xphiidg
X-Received: by 2002:a05:6830:388c:b0:7dc:d3fb:5a34 with SMTP id 46e09a7af769-7dcd3fb5b2cmr13907048a34.10.1777128433452;
        Sat, 25 Apr 2026 07:47:13 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:9f96:11d3:5f6c:5582])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd5408b5asm12577480a34.11.2026.04.25.07.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 07:47:13 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt792x: skip MLD header rewrite for 802.3 encap TX
Date: Sat, 25 Apr 2026 09:46:48 -0500
Message-ID: <20260425144648.734030-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_074715_372364_28253F74 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

mt792x_tx() rewrites addr1/addr2/addr3 by treating skb->data as
an 802.11 header for MLD traffic.

That is only valid for native 802.11 frames. Direct 802.3 TX can also
reach this path with IEEE80211_TX_CTL_HW_80211_ENCAP set, where
skb->data is not an 802.11 header.

Skip the MLD header rewrite for HW-encap packets to avoid corrupting
802.3 frame contents.

Fixes: ebb1406813c6 ("wifi: mt76: mt7925: add link handling to txwi")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 152cfcca2f90..157e48e33412 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -105,7 +105,8 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		wcid = &mvif->sta.deflink.wcid;
 	}
 
-	if (vif && control->sta && ieee80211_vif_is_mld(vif)) {
+	if (vif && control->sta && ieee80211_vif_is_mld(vif) &&
+	    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)) {
 		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 		struct ieee80211_link_sta *link_sta;
 		struct ieee80211_bss_conf *conf;

base-commit: e8c819df02436f2c2379766946735e1f06a7c923
-- 
2.43.0


