Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8C2C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZTio5F8p35DlD4asDjPvybCMwGfLPum9VeO2lVI5Tw=; b=S9bDCkPOB1fBd4+JG6jgOd30sS
	ZR+uu6rBOJ41sEA+mT1BSBiUuWSvRvBVV+lcqyMLh0gfFYQnnHwjkn3cffRpxDtExuYBHCz5gozcx
	eUvHAUz8KxAjshVKvJM9RZ1K49FVq1bTpLPVrUgbOsiYugczexYIDHa/tQfACTAHn8+VUiObfd7k7
	JaCJkr1zkGKtYzWp2vtB69p6eyVd5seFX2Mpe1eZeB0h0ot69k5X/nvq/kXtcF2fM6y4bziECxoct
	ed3fXccoZAeTfTkRGO30hLfLK30Egi6+ZdjIUsXOc3FLhD5WWKn3H44PX8sCu3tMgqNkIxgTTdqub
	MgDGEZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ka-0000000BWx7-0BUz;
	Wed, 03 Jul 2024 21:42:52 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kX-0000000BWwJ-0mZT
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:42:50 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-700d58a3159so136359a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042968; x=1720647768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZTio5F8p35DlD4asDjPvybCMwGfLPum9VeO2lVI5Tw=;
        b=vGOuGmJlIYUV4qK0zYMenpR1qLOW5DGNYRcDbsJj0sch84Ho6ppdPC7ZhFPDW5UvcY
         JXd1gBgDNgA3J5E6o1IcOI4zFnwZAez7A1rRqyR8zB2OqmYkT15lPczDV2mPp5FJvH+9
         4CETt2wlTy4HPf9SdC7mgy98m4dA9s1wN46z05rteCgIMLaif8qDL9qDZC2bw0Ba9ryr
         2oi/J/SY1r3OgAs7f4jvamFc+tABhT7cWq3V1nfKpQq4OPMchBcUdOocZSU3y1VXo7s7
         GkxdS4pxCmWS6h/H4TzMLoybjMKF2ZaEpkJ3qZH6oPbFwj7yCkGS9TVi/OiSP2mHqBEM
         mkEw==
X-Forwarded-Encrypted: i=1; AJvYcCXf7LSjqmH42MqGIpZwi4N6QwT0zEklf11iSZVFluueQfs7DTD4DItx7/b6n8T2HhG1itd/fm/jenOdy/MCWRdPPXNfOTjvzFT570pqpXSPQlKc
X-Gm-Message-State: AOJu0Yz/eVvPmzcPPHJ8EoyEnwAtj1Y2hvHuPJW766S/LiW6pODo0aHi
	zZXUF2CyBZN+ImvfUG1IFT2KxRKIR1K3tMdkTFZPsiDXS/UeRF3E
X-Google-Smtp-Source: AGHT+IGRunLO6mFzSc2Jy3s5TzQ57XC4kIYZhicOz2t0jYUM6P5DBFc/NWlT3v1DejDwVVb0J3v/0g==
X-Received: by 2002:a9d:6b15:0:b0:700:d428:1cd1 with SMTP id 46e09a7af769-702077756d3mr12771626a34.3.1720042968011;
        Wed, 03 Jul 2024 14:42:48 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:42:46 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 01/29] wifi: mt76: mt7925: update mt76_connac_mcu_uni_add_dev for MLO
Date: Wed,  3 Jul 2024 14:42:06 -0700
Message-Id: <6b2502d0c3a53093f83ae33329e9d782ba2465b3.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144249_248509_EE308A4D 
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

From: Sean Wang <sean.wang@mediatek.com>

Set OMAC address with the per-link BSS. The change remains compatible with
the non-MLO mode and the older firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 4e3c8af98fe7..4dce03ddbfa4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1214,7 +1214,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
 	basic_req.basic.hw_bss_idx = idx;
 
-	memcpy(dev_req.tlv.omac_addr, bss_conf->vif->addr, ETH_ALEN);
+	memcpy(dev_req.tlv.omac_addr, bss_conf->addr, ETH_ALEN);
 
 	cmd = enable ? MCU_UNI_CMD(DEV_INFO_UPDATE) : MCU_UNI_CMD(BSS_INFO_UPDATE);
 	data = enable ? (void *)&dev_req : (void *)&basic_req;
-- 
2.25.1


