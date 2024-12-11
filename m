Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABBCE77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFt/APP9Kpg1SvU/nP3fnBmzPrWhuM3L++1qvEulSaE=; b=o7eMzx1wAarXU91M7m7Pcq2jF5
	fc/w7vmhomQuiCkfPka4W4VK1nGUi/o2omNRoBB/1/GMwzlWxGsYu3mhj1aYJUcKNUj0/m7BVFGoG
	R1nmviGj8TbR5nqIcpOLBabkhe/Mdu+rLT5xTkZOebstSqOVGy3nLGFAHD3zBUY17/qTnhd9Pw+XS
	1UDcP35WZAgdzbU2PdcvwuaA8KeG34vyIOfll9gMbExwc7esumbViBY3QUQ8swL9akL0xREflGCII
	N7ZSCbp6CdLekVcy1MQGcZb8rRtKpVMSE/Cv+kpsv1OcmhPUAWeSjdDt+Kziekly+60GYDzaFDgH7
	2PXaoa+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBP6-0000000DP7n-15tk;
	Wed, 11 Dec 2024 01:20:40 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBP4-0000000DP65-0A2Y
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:39 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5f2ac4a9038so1284485eaf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880037; x=1734484837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFt/APP9Kpg1SvU/nP3fnBmzPrWhuM3L++1qvEulSaE=;
        b=gbLj6KFyHRYU5DRXCulEAUb9hypqSC82p/iETEy0qECHw9PQVAHWbFwIJEGDEzMjp1
         Or4aJVx8VvBwhHUkSIxJmB3aHIRpYJ15drC662tJ9nfpysJh1Ku4wVJfGoM37nRkJ6cY
         /hrnl1gYMWi2U0BBneV9c0Shi4fGolk3yGcak1a9asg4KMI1IB2fy94j3V/lsJF5GSBC
         /Sul70AMu2qL9eqJcOQN8rK9M94OkYSsngJFSsPi3aZN8TOfkRgI0Q2tcp11x7JIy2LS
         tPTCUe09x3ZC9LFDFwEEo5dU5Ie1UyusIn+sNdxplh154y0MqBSvczyEezudkO+YrRzX
         iq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU74Xs/PfKXNOrVHEecly1v1KlINFgY2IvXs2KDAqhkxI35pYIuRA4wt4CKcAJzio7vR7bEf3WMd36YpipDkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxC5vlm9FI9SF3YRxyvtY29gB68LOrM3kDXebxaJK4/VdMGYEzs
	QnCDCyvImWiH3MoVSEEk8a+JGIrxK90ylZGL6ZTgldzrc+335FlM
X-Gm-Gg: ASbGnctUOjLZioF1wst4nQjhhf8L1JPrWtc+XJybxKBTkJlJeggG4MBX1Y9zDuS2/la
	0V0ba6RXnvdRV/Zj3rZA5IGbmAcCg7qoLANw/ebnm6iit2fOD45EO6kHkPSZ6czRYxp9oD/cQk4
	s3gWk0hKTnD9kltZJ+iMDH9QAQTOs+QV5+3JPphdhNkAoN0lFi6DyYFL50MpIWe3D/xDeu8fTJ8
	V7RrxSk5cR9ltehSBowGCtuMAIwqSivn1ktkaTrcUeqqLvSOhPFopIULlpkrbjnK229O0E=
X-Google-Smtp-Source: AGHT+IFoBvPxPXAn74OsI+gka8y3QPRiQn0R7SewMW5QIeQR3Ss8iag4UdWTxYEHJxMiuodqUSfPsQ==
X-Received: by 2002:a05:6870:a105:b0:29e:65b3:27f5 with SMTP id 586e51a60fabf-2a012c5a94cmr735905fac.19.1733880037150;
        Tue, 10 Dec 2024 17:20:37 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:36 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 17/17] wifi: mt76: mt7925: Properly handle responses for commands with events
Date: Tue, 10 Dec 2024 17:19:26 -0800
Message-Id: <20241211011926.5002-17-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172038_087050_FB002D19 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Properly retrieve the response for commands with events. Ensure accurate
handling of event-driven commands.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  1 -
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 9c43437ad9d0..13e07cecca41 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1244,7 +1244,6 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
 		mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
 				  &dev_req, sizeof(dev_req), true);
-
 	}
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 6675492ec9a8..0068ec6d92c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1254,7 +1254,7 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 	}
 
 	return mt76_mcu_send_msg(&mvif->phy->dev->mt76, MCU_UNI_CMD(ROC),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
@@ -1303,7 +1303,7 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 	}
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(ROC),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
@@ -1333,7 +1333,7 @@ int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 	};
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(ROC),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 int mt7925_mcu_set_eeprom(struct mt792x_dev *dev)
@@ -1486,12 +1486,12 @@ mt7925_mcu_set_bss_pm(struct mt792x_dev *dev,
 	int err;
 
 	err = mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(BSS_INFO_UPDATE),
-				&req1, sizeof(req1), false);
+				&req1, sizeof(req1), true);
 	if (err < 0 || !enable)
 		return err;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(BSS_INFO_UPDATE),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 static void
-- 
2.25.1


