Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C03C3DA40
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eCwn1bKaG54UOwYd5vhXMu34lcPREipp2grTwGDk8E=; b=Dw0nqckS1F9EIhEg2jC7aHivmM
	hG6mRK+h7k4CvX6wtAzO74MVO+/AqfbZ3pjRyryOlAJtFwk/p7D4yGg2ehtPCS5au3LHVvJUcG3oo
	XBHHiKYtHpQHSomnBQAxid93hh/zMdxCGiouQDzLFEz22MvbSw462iMma7/soHwma+kIaPfMqbVlW
	McQIpmDntS/DAbVUdNa86WT76RJGKwGceEKfRcussLRcOp94kPznNSK2LBZhRom1JzeKyG3xLSVB7
	2fMESb12ohpXpMlW9Sig4LGhU66YuLHBX3smOVPSiy4hluCfzWS8fAA+UpEP55CifuOJUd544nPs/
	Wp9JtgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nB-0000000HYCK-1vCK;
	Sat, 06 Jul 2024 08:29:13 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n9-0000000HYAH-12BP
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:12 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d92563bea4so14981b6e.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254550; x=1720859350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eCwn1bKaG54UOwYd5vhXMu34lcPREipp2grTwGDk8E=;
        b=jMDdKUOqTN+Il1QyX5steacRsRQCMnHP/i9OFA8XrI2umLJMsdyPdAMMqiRZLUtV3X
         2CxwXnmsqB7ynYq7pqUeTLYUUT/YOoAUAtLpRveQahDetmcLimN9gZG7Qa1RUP06nWGw
         kjoiA9cgenN6LCnZExXJrS+m6+HDXn1Ah3d0neQmvDC+w1+t3UkeN6sKF57kUYj/gYMI
         nUHN/9zwn5+tXF8ln6b3A7djTKMWJ6mTL5CFuV1px3mzTz46lou2m0ZaPoxPENiVl6ZK
         fp7GnHyl/GLY0OrJplBMCUPojBoYuD2Lmz65UDr6xtYG3Hby0qWmR2DLlu8A5+e2n6PC
         /3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGzhm3C5wO5Y5fQIze7zgGtZpQIugzDEVuXIhd+tRRjDYhq1lwh17aHnYch19t5hn5bWYZZuuI6Zo4ts+hoPDq2O77sdjr0jSjQPHOIeTJOFnY
X-Gm-Message-State: AOJu0YypxPesSwL8Jgg1dZun43mH2dP80cXX0O/9Xgx9QoIGP4YW+jeD
	ozsmB5F5Xr1pgVqzFZzfiBuERU+ClDjzEQ+Oel425Mr6PLRVXvUt
X-Google-Smtp-Source: AGHT+IFjkMIRk44IPW3cpLBvfOzwB/4c0UZ9v+0ZttSy9bIgMJdTO7220vFTAdeo69k/NcKoPjt8vA==
X-Received: by 2002:a05:6871:54a:b0:25d:f237:e108 with SMTP id 586e51a60fabf-25e2b5a1bfcmr6904305fac.0.1720254549966;
        Sat, 06 Jul 2024 01:29:09 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:08 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 28/37] wifi: mt76: mt7925: update mt7925_mcu_add_bss_info for MLO
Date: Sat,  6 Jul 2024 01:28:08 -0700
Message-Id: <a3d03b0a1ca916b2b8b2e7c0afcdcd7e258d97c3.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012911_313588_F4816A03 
X-CRM114-Status: GOOD (  10.31  )
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

Update mt7925_mcu_bss_mld_tlv for the MLO-enabled firmware

The change remains compatible with the non-MLO mode and the
older firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 53228bbed2c6..2ffd46f16921 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2513,17 +2513,21 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    int enable)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct mt792x_dev *dev = phy->dev;
+	struct mt792x_link_sta *mlink_bc;
 	struct sk_buff *skb;
 
-	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mvif->bss_conf.mt76,
+	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
+	mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
+
 	/* bss_basic must be first */
 	mt7925_mcu_bss_basic_tlv(skb, link_conf, link_sta, ctx, phy->mt76,
-				 mvif->sta.deflink.wcid.idx, enable);
+				 mlink_bc->wcid.idx, enable);
 	mt7925_mcu_bss_sec_tlv(skb, link_conf);
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
@@ -2535,7 +2539,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 		mt7925_mcu_bss_color_tlv(skb, link_conf, enable);
 	}
 
-	mt7925_mcu_bss_rlm_tlv(skb, phy->mt76, link_conf, ctx);
+	if (enable)
+		mt7925_mcu_bss_rlm_tlv(skb, phy->mt76, link_conf, ctx);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
-- 
2.25.1


