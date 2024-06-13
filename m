Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B9C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8wZ9LqPMT7Xzyb/TNy4z9TySRR4HAhftUt/beLfrpU=; b=p5cEsbo0zNBgqttvXJoU2vnw5G
	CELNNRMPfulRn/jIR/6g/4Vzq15SKQLO0MmqBv7/w5DZpiFpdHJPWLAUj/q3eeSjjtFgmPRsxoPig
	eCYh5O/ujzLK0zrtQy3y81Onkgka5hMJp5ji9M9aMMimGQ5MjUFTG5IbrZ/jBhgK8ytIg4sS9j6gU
	9wU0uhigDO4nmw6oZkWMedANMMrs2kTxKzE6AcBJNnFe7N/uF4c4wDSiy7IitvFaYZtY9bFY4Uzsf
	7YN2F7tNM/FcWpXx3p7xi3yakqYjDChjo4gGMcTGaMzo4jVgTPok7CnYix/ZOPc7kHaCtU3A2K6lG
	lKmDnc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak6-0000000EvgE-459g;
	Thu, 13 Jun 2024 03:03:14 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak2-0000000EvcZ-105H
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:13 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b3356fd4f3so38459eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247789; x=1718852589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8wZ9LqPMT7Xzyb/TNy4z9TySRR4HAhftUt/beLfrpU=;
        b=qJ/DFSQX1/jGVkve6RDu3NJKdrrsoYjxW4ykjpbiYcaoPExMiQjTLbv+epYkDkWLIt
         +Ce2EFYL0DNW4VxPwlNJ632IhtP6jDtKphFEujqQapDv2jeop8j8s2daM0s8pal/oHgp
         +r2/QNak+qyc94UmzqqmsK45jDvZdGDCLhnkJkyBQmdQo2yWcW+hkAiZ0RVLU0+blHfT
         BL9sMFuhJmT6Du8hV61qZduiSAEkTbDVLIbJuWhB75p490BH7DxrmDMIPvSfGLZjRHvh
         Co+xJVlYy7/U+HWtA99WawiKfvWO5Qz2yqw6Csfm4ZSNcuvn9oQrlE6dipWqLkLPP33c
         1H7A==
X-Forwarded-Encrypted: i=1; AJvYcCWZpbdPFZJEEqJLP6hoo13sD1d3AvJiwuKLJ7UOWRVaONtC/QTEQSt5bn+maHi2YuajdXlr2wc36FIpHeFFSHPfQbP9UP9srDJYWDtzjYZd2A35
X-Gm-Message-State: AOJu0YzyAhF2POgvBpsRd4uPyJbwEsG8CdoAqsLMLPt8MWBybOCen49P
	++MC0Qc9umxVuPM4WNS8870cFSNTi5f0mo+ZhhOqKXUvsYB89g6A
X-Google-Smtp-Source: AGHT+IHqadgzrZGoLgoJFK/NJvS0x3ikV8MhU9hCl6gI/OhLxrrMkqmc1SPmCVhc+zJdhP2h5XcNqw==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr285198eaf.1.1718247788980;
        Wed, 12 Jun 2024 20:03:08 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:07 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 10/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_color_tlv for per-link BSS
Date: Wed, 12 Jun 2024 20:02:04 -0700
Message-Id: <20240613030241.5771-11-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200310_334058_3395118A 
X-CRM114-Status: GOOD (  10.93  )
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

Extend mt7925_mcu_bss_color_tlv with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 7cde18e273d8..10e38637eb83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2266,7 +2266,7 @@ mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 }
 
 static void
-mt7925_mcu_bss_color_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+mt7925_mcu_bss_color_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
 			 bool enable)
 {
 	struct bss_info_uni_bss_color *color;
@@ -2276,9 +2276,9 @@ mt7925_mcu_bss_color_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	color = (struct bss_info_uni_bss_color *)tlv;
 
 	color->enable = enable ?
-		vif->bss_conf.he_bss_color.enabled : 0;
+		link_conf->he_bss_color.enabled : 0;
 	color->bss_color = enable ?
-		vif->bss_conf.he_bss_color.color : 0;
+		link_conf->he_bss_color.color : 0;
 }
 
 static void
@@ -2342,7 +2342,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 
 	if (link_conf->he_support) {
 		mt7925_mcu_bss_he_tlv(skb, link_conf->vif, phy);
-		mt7925_mcu_bss_color_tlv(skb, link_conf->vif, enable);
+		mt7925_mcu_bss_color_tlv(skb, link_conf, enable);
 	}
 
 	err = mt76_mcu_skb_send_msg(&dev->mt76, skb,
-- 
2.34.1


