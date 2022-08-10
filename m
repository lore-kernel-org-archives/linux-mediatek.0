Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C50C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YYJjRLucIChyK6APevUjSlHLzhvc7kx5V1ce89D+Ci0=; b=lGB2j1aNi7o01+cAVbf8/n3Bdl
	U9odNpYFCpiCGRMmrzH+ZN/B9JbK+d25CaJn1ZWX1DS4xSsNJ5dm/ADeuyMimY30b1P8NDTVfZV4U
	AbszhEY2xfp7bZaaBrpWGkyOaXUe8Vu7+WWunu4BpxuG9wygR66iuRTdhlCwG9v3wbcUs2ubMQUvv
	E6Q9Jv4RZ3YT62A4clZW7iIM8E4xJoh7htU7dLMcDSGf1/gQcHcM7x7skVUTJ2YLK7nrBp9mfvtKf
	GW1MuWRCtY5npo4TGiWVVMvANqLwpefVkkXE0VPvDuII3rZVvJDnTzJoMDy+6CBfBcmPPDXgEyG7p
	jnEyvExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtp7-00FcXJ-Ej; Wed, 10 Aug 2022 22:05:09 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtou-00FcIT-Dy; Wed, 10 Aug 2022 22:04:57 +0000
Received: by mail-pg1-x52c.google.com with SMTP id q16so15524851pgq.6;
        Wed, 10 Aug 2022 15:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=YYJjRLucIChyK6APevUjSlHLzhvc7kx5V1ce89D+Ci0=;
        b=Ina7MvM0fw6Rnu6mFHPASwMT5BfxaVoY0EkYmfHFiRlq+aIBRfdaT68FfyXhysiSa8
         jXa5mn3ydiUXb72u7LujBk2s48+ssLJaze4g3fA3VI6amiDU5R7P0g+1thVgSJ6I+7NS
         zEnpr0U557hWqpMmL4d5cB4J6SQKc+OXApWJv/iiWp3PAcTUlIk+QZS0XhfZYAOa2tYL
         mpyoZAIvG/mOyz2tgA9tUge7Hee5POFzm/aPXFGgBYYys816n9+7cQbGXsCY81dL2zJl
         bj99Us/lnrMUHnzqwDCAwm9Q28BI/0QXabncSdDe7SEAAjo+Toy75RSnz1ZaWzodTvrG
         4Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=YYJjRLucIChyK6APevUjSlHLzhvc7kx5V1ce89D+Ci0=;
        b=EMbC9JE+x98AQpDwzaAnog2sPPZ8E1PxGWBormIYcIen2Nadc0I8lemK+79r/8HzWz
         gy/lTgmXw0q07HRo2tbLrVGkiVdguxsb+LBwbroED87vbdWVo4+R6Kaz3E1RHHE/KVrP
         MxUqAZVdojFlUb+sooMADBZgDtg09Mbf9jmV9mg+MnfixgFqz55/EKbvfnHTtzufeO4u
         6Bkf3mYR87Bsk/OAAxZEeCAB2bSjs9yM/iYldz+HWMnOjsg+/wd8RNETMXFG4BFCk2vD
         nDVAYrD0nT836RhhZzlNgzf0dtdLb9wwgbK+txcIGZ9nZtPHI3YrT0HGV0qCdkltsA/I
         FbEw==
X-Gm-Message-State: ACgBeo13IFLuqX+jaJhaxgoatAxuYkszwAVDHE/b6eHqaP+Mfhbg7eya
	2gMnDoSm3JLLN0MTbp4uk3Q=
X-Google-Smtp-Source: AA6agR7MOkZdKiZUvC077NS2slfn3nrTZbPgsNCrIP7XpHTfuH83HFEwqnMTKb/cwOt9pR8K4MbsLQ==
X-Received: by 2002:a63:c108:0:b0:41d:6bf3:6807 with SMTP id w8-20020a63c108000000b0041d6bf36807mr13939912pgf.157.1660169093850;
        Wed, 10 Aug 2022 15:04:53 -0700 (PDT)
Received: from rfl-device.localdomain ([39.124.24.102])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902a38d00b0016be6a554b5sm13366035pla.233.2022.08.10.15.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:04:53 -0700 (PDT)
From: Ruffalo Lavoisier <ruffalolavoisier@gmail.com>
X-Google-Original-From: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mt76: connac: fix in comment
Date: Thu, 11 Aug 2022 07:04:44 +0900
Message-Id: <20220810220445.8957-1-RuffaloLavoisier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150456_487354_6B4D5BE8 
X-CRM114-Status: UNSURE (   9.92  )
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

Correct spelling on 'transmitted' in comment

Signed-off-by: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 9b17bd97ec09..972190f7b81f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2648,7 +2648,7 @@ int mt76_connac_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_add_key);
 
-/* SIFS 20us + 512 byte beacon tranmitted by 1Mbps (3906us) */
+/* SIFS 20us + 512 byte beacon transmitted by 1Mbps (3906us) */
 #define BCN_TX_ESTIMATE_TIME (4096 + 20)
 void mt76_connac_mcu_bss_ext_tlv(struct sk_buff *skb, struct mt76_vif *mvif)
 {
-- 
2.25.1


