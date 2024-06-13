Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2D3C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdCy5+kMixwBbPegp0qJ0hHaXxWnfbk8yzhAroU2gIE=; b=TgFDQFRhKmRZBoz3GNlrV/BftF
	gpcefdaNBo5h5MK0+dAnBnni6aX+zwkRjR40BHmzSTqqIo6/Og2Bx6RCk7qAXVqoOLb6O9miLm2Bc
	pBV0L28fLIjPssuJSxWbKkHQh6lzZ/LQfxP+BeCFE5TsqVkSUdEP2aZqXOj6wgCITe4OIxE0HzKWJ
	S2m7Da9746hnz4s7/SQdsmddst2AGM2vhW9+Rw8VqJWKNgTlke5nE1gSmrbdHpgdpJnEFh45K39fD
	hBePgV9YoFoougxm0WOLwc6eMscj5+sAYBtjbGa9CGjWvn9ml5ovNkHDkB3TkUEa0T+ONmLH/vArO
	cIF9jqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakB-0000000Eviu-2ShO;
	Thu, 13 Jun 2024 03:03:19 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak6-0000000Evf2-00pM
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:16 +0000
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5bad4e45863so24359eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247793; x=1718852593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdCy5+kMixwBbPegp0qJ0hHaXxWnfbk8yzhAroU2gIE=;
        b=VPqJLpSJ89xEY1uf1EdBRq6tTshhmqBTqGgSyW0Q4I/eMKrKGqqs4pD4uPfbYQEzz4
         Ve717do50H983BNKJHBS5AldaoBc0Qu0JCpDZnmhD0t/AQd+A7uA+QDmbdxrrx4yiXB5
         ogDhr0J4j3b/CVq4XZDrsHUbPaeP3csW39rGqP8Z+ywfkNyNYv+eKEZUV8qFRjFLMaf0
         xfQ1V6QmasOyjkVWKRwK7np9Lftpkg3pGtvEuUeAjYNgFbYj11KUEdKx7jkycGsqDZY9
         tJCnqBjX04ntBgdOWSu1Ip1GkXVo1Jdk2lUzccIhL6Y5fvTzI+8wlwxGkwUPNp+wPhXb
         1GwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYqNpmBGbghaP6FT0V4mFDQwepDCLjXKnYLiH+gqTsNQ+M8rcbRO7Sf62VqCUYqLWn7SYBjrSyhHPyxXNDhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTi4BioOAg76QqRgmQsIZ6SzpM1VdTHj394Dh5HwFv+Y8s/6me
	kzX9H/KFtkDxcu0wKYNglPzjx4q4Iql+ZfFoJrlgwtsXJiQzWmwA82d+Q2+nq6E=
X-Google-Smtp-Source: AGHT+IGU09NrhHqyYkv/BhQS695UYCYhdc72/gkJHzuGqM75JEta2qBWPeccLaUVq7xGy2O10RRDWA==
X-Received: by 2002:a05:6820:2c86:b0:5aa:3e4f:f01e with SMTP id 006d021491bc7-5bb3b9c614cmr3867976eaf.1.1718247792708;
        Wed, 12 Jun 2024 20:03:12 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:11 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 12/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_qos_tlv for per-link BSS
Date: Wed, 12 Jun 2024 20:02:06 -0700
Message-Id: <20240613030241.5771-13-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200314_153232_6EA703BD 
X-CRM114-Status: GOOD (  11.73  )
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

Extend mt7925_mcu_bss_qos_tlv with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 533214403008..d6a590061e36 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2227,14 +2227,14 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 }
 
 static void
-mt7925_mcu_bss_qos_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
+mt7925_mcu_bss_qos_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf)
 {
 	struct mt76_connac_bss_qos_tlv *qos;
 	struct tlv *tlv;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_QBSS, sizeof(*qos));
 	qos = (struct mt76_connac_bss_qos_tlv *)tlv;
-	qos->qos = vif->bss_conf.qos;
+	qos->qos = link_conf->qos;
 }
 
 static void
@@ -2336,7 +2336,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	mt7925_mcu_bss_sec_tlv(skb, link_conf->vif);
 
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf->vif, sta);
-	mt7925_mcu_bss_qos_tlv(skb, link_conf->vif);
+	mt7925_mcu_bss_qos_tlv(skb, link_conf);
 	mt7925_mcu_bss_mld_tlv(skb, link_conf->vif, sta);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
-- 
2.34.1


