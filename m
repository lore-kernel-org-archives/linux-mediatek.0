Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC98C3DA40
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdHDwIbk/nKAta5fWk+n0tgyiwD0vWEsim4rkaQNjjk=; b=yYNh8Px7xYdY37D6L/GcEZuiU2
	h8JebZ7ihy2vyoLjlkQfu/ZH0rOtTixm9HNfi286EYeXeVcZLQ9i9vCn20N2OYv6EE4KZjDt6tEZ7
	1VO71Rqfg4+shhnxmoQnurYPHzy2QZkCVx1sEG/e31xmw9mC/LB0gSsBJ0j+I98dtxPHmvrIU79GS
	iIgGWCUxG6unhaPfY7JTGvw9bA82B96/0PzcTqRSc71hUHcvzJcowRyo+fFnWdOVzIjmz12ecJ+5A
	uHS8NRuoq4AiCOZsRFHYxb+yO30u/191UGe3tglqo/o1doWtm8JWqnrBHafF/rqW1+b/wTCN+ZN7d
	Sz/G0g4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nK-0000000HYIT-1XHY;
	Sat, 06 Jul 2024 08:29:22 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nH-0000000HYGK-2WkY
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:20 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-24c5ec50da1so284901fac.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254558; x=1720859358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdHDwIbk/nKAta5fWk+n0tgyiwD0vWEsim4rkaQNjjk=;
        b=G4WrgOEIZs9QqiAIujROAD3cM1VrNWHSjocnLvdM60/h24J5k6tOniZVRE9LWnOVWP
         MI2gTa6OT9e+0JsUksjO+A4FE+Lm9Bd4aVY5kLafFSm3LKg6B/ZdnwurtFFh/zcKDCgl
         esCHurOshsM0CmkswcL2Z4LUMi3AUdB5krg5+4RIAWY9sAWfnve/e4B4PB94prRZ+SQl
         x/6LXgNkdsy2iqWJPuOZpNS7IHGl7D6nvz1hgWzjYR8Y/lqFx5ES101rQofDIvi6zvxl
         SJg9hZh7xz2ohLdyC8V1HypXYKLyGoelu9T0aLoLnvxu8gIcp6bb3hnE4J8f4qjwvUeB
         Z8xg==
X-Forwarded-Encrypted: i=1; AJvYcCU2LvkLlBIXBEB81p5BPH/RxHrAPnyvzFCWqhu0G0wSeAHSaAMQ/fz/ZzuKCy65H34HEUp9IqeF0aL13mmykZjFnftRzp5if9jESyyjkOxn6o/j
X-Gm-Message-State: AOJu0Yz1uNHUe5bDt0frKjkrk7WLgxLnvaMkx/kzsq/HAKLxg965SwRo
	7Nm8HVTuNaVE8r+H9/arX0qJwY+JUc9VxRGwZhY9nzncH8j7sXoS
X-Google-Smtp-Source: AGHT+IH4oEdW8ND3MNXtHA0L4tW09xYHvChs0d6GbdEk6QyLI/uUTcRxtoJox7Z8cYwfB0tBpGQNXg==
X-Received: by 2002:a05:6870:b250:b0:25e:180:9183 with SMTP id 586e51a60fabf-25e2bf95bc9mr5863911fac.4.1720254558671;
        Sat, 06 Jul 2024 01:29:18 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:17 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 33/37] wifi: mt76: mt7925: update mt7925_mcu_set_timing for MLO
Date: Sat,  6 Jul 2024 01:28:13 -0700
Message-Id: <dde970c748586d03fbecbccb10cb9903284719aa.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012919_666684_E942399C 
X-CRM114-Status: GOOD (  11.52  )
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

Set the BSS index from the per-linked BSS for the firmware to identify
which link the command is operating on.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b005b5b8968c..908aed2eec11 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2606,11 +2606,11 @@ mt7925_mcu_bss_ifs_tlv(struct sk_buff *skb,
 int mt7925_mcu_set_timing(struct mt792x_phy *phy,
 			  struct ieee80211_bss_conf *link_conf)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct mt792x_dev *dev = phy->dev;
 	struct sk_buff *skb;
 
-	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mvif->bss_conf.mt76,
+	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
-- 
2.25.1


