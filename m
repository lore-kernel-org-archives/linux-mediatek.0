Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25877E9A02C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtvQudAvypIJd2M9IVKmuewd0Qtwwk9d0vAXKJKVVfM=; b=E2P1w2WJv6+3vYUMkxn32thoad
	FAVmkthy+RREd90s6QlZ3iihbbnrbXS1clI47BWgaAFlWAZLQJUcirOfLBW/Uj6YK0LPX3LQRNsbk
	lYc1dgsFfAAlwP0Q63vI17pJMDtquETXXzuKKiA0S3TVwzAKkqCQOCzb9JoiaEqJlM/5AO710Yjlq
	7y2/Iwx5pabQEvCuEh86hENKgB43iBoDdnrCmBWqJfqCl0eOV3k5+V0II3BvSOt+yrMdJ03GiVsVi
	9Hnm3BZ7MVoiduWVxCJpgWxUDM5cGVUaS0NZxUjzBTDREYq3tdSCm318hUB2lH+8no+OZIitVLV3u
	CZzJuQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5e-0000000Aeda-0hFE;
	Thu, 19 Feb 2026 00:40:22 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5b-0000000AebW-42TS
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:21 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d4c65d772cso478565a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461619; x=1772066419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtvQudAvypIJd2M9IVKmuewd0Qtwwk9d0vAXKJKVVfM=;
        b=O+NLX4cIW+ApLcwvelclgSVTtqTGfvqA1ja94HxBk+xB9XC47bYRf+fyVNCTkuMyUr
         OQzGrmdy71jOIoOWCT4sjFYi5HaXdqMlhw65UQv9fNFIxfEkXt6dLFon2aU3wU/i91NA
         7y/Ggukttbqd7WU7VSRsoFJ8HqJu4siKC118xb6FpWuy2e3uT92Otz3/eOwfRNjw3Ug8
         +tze86sOuMXSAMQaCNGtweLXyOugeMb0St84r26U1Bjygn8wGQc5Hun3mSEFW6kuJixo
         Fg8tmZb+MamYp1ZWCBkwN29FwM7TXSoEN60Q27OFLfnRhGZhBr9kh5TuH/JYOqaL5Zxi
         3abg==
X-Forwarded-Encrypted: i=1; AJvYcCWHNM/x0WoAj6+XA4MMx2GIE+JyOx4PzVbPPUVpIpsESiMWhvZ31Npi+E5wPud2n5LsPbDzK1b3493qjxRnlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSRyq/toIz9BY99SgBuHT2izivYqhYCJZWgSkLnIeXwLs5/1En
	I8fDj7zpCeocepRHjUo06Ct3zOH+RcGHar9aF09qK5iz8dC6tzLOmFD5
X-Gm-Gg: AZuq6aJ3vjb5FYWf0Av8W365s2BYMBbdv6UfU0DvRj5UWvX4xbadQLkzx01G3IMCVHf
	LoDWRg/XTHLUAn+d98HehutbADiOIvaSuMBVWSMF1rhh2jYsDA2kvdIv1SowsQYAWlHexYNOg3D
	C5XlMPNGijGtJTgqo78Kx16GGFiqfyoc9ds8VeOSPn9z5+s52yEd7P51T0yyBkuoRtdY4V/tmhl
	9RKBQGCKOtRvYdguA0BQK4A9aVYyHp+cbQDcl8psys1istuMRc0nw1LSQK/qtY33dxbnFZebEsX
	fTCLzcADKMMuhkLkAa0hibU9urG+aY6m0iB55a1aQ0RdvFe4xwEPNW4vzj0xDqmHhZI0brYLyvG
	lMyW8CZUppw8a/a0Y1mdcgJno4QpExT4I5GxxLcKFyP7D2wzKO9NrRgktXur8WxNubglqRtpWKe
	Tyi6YOXFlXPBuKPXWtbzDkmZ2fbYC6Xm5jopSH6nEMum8nkzs=
X-Received: by 2002:a05:6820:1b08:b0:679:a654:a9b3 with SMTP id 006d021491bc7-679a71f553amr2084920eaf.37.1771461618750;
        Wed, 18 Feb 2026 16:40:18 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:18 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Xiong Huang <xiong.huang@mediatek.com>
Subject: [PATCH 04/11] wifi: mt76: mt7921: add MT7902e DMA layout support
Date: Wed, 18 Feb 2026 18:40:00 -0600
Message-ID: <20260219004007.19733-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164020_012800_622F5529 
X-CRM114-Status: GOOD (  14.28  )
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

Add MT7902 PCIe specific DMA layout overrides for MCU TXQ index, RX ring
size, and MCU_WA usage. Common layout remains the default for other chips.

This is a prerequisite patch before enabling MT7902 PCIe support.

Co-developed-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7921/mt7921.h    | 14 +++++++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 41 +++++++++++++++----
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index ad92af98e314..64f60c4fc60c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -17,6 +17,9 @@
 #define MT7921_RX_MCU_RING_SIZE		8
 #define MT7921_RX_MCU_WA_RING_SIZE	512
 
+/* MT7902 Rx Ring0 is for both Rx Event and Tx Done Event */
+#define MT7902_RX_MCU_RING_SIZE		512
+
 #define MT7921_EEPROM_SIZE		3584
 #define MT7921_TOKEN_SIZE		8192
 
@@ -119,6 +122,17 @@ enum mt7921_rxq_id {
 	MT7921_RXQ_MCU_WM = 0,
 };
 
+/* MT7902 assigns its MCU-WM TXQ at index 15 */
+enum mt7902_txq_id {
+	MT7902_TXQ_MCU_WM = 15,
+};
+
+struct mt7921_dma_layout {
+	u8 mcu_wm_txq;
+	u16 mcu_rxdone_ring_size;
+	bool has_mcu_wa;
+};
+
 enum {
 	MT7921_CLC_POWER,
 	MT7921_CLC_CHAN,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 5f857a21f362..6bb3c6a1cf6a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -167,8 +167,29 @@ static u32 mt7921_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
 
 static int mt7921_dma_init(struct mt792x_dev *dev)
 {
+	struct mt7921_dma_layout layout = {
+		/* General case: MT7921 / MT7922 /MT7920 */
+		.mcu_wm_txq            = MT7921_TXQ_MCU_WM,
+		.mcu_rxdone_ring_size  = MT7921_RX_MCU_RING_SIZE,
+		.has_mcu_wa            = true,
+	};
+	bool is_mt7902;
 	int ret;
 
+	is_mt7902 = mt7921_l1_rr(dev, MT_HW_CHIPID) == 0x7902;
+
+	/*
+	 * MT7902 special case:
+	 *   - MCU-WM TXQ uses index 15
+	 *   - RX Ring0 is larger and shared for event/TX-done
+	 *   - MT7902 does not use the MCU_WA ring
+	 */
+	if (is_mt7902) {
+		layout.mcu_wm_txq           = MT7902_TXQ_MCU_WM;
+		layout.mcu_rxdone_ring_size = MT7902_RX_MCU_RING_SIZE;
+		layout.has_mcu_wa           = false;
+	}
+
 	mt76_dma_attach(&dev->mt76);
 
 	ret = mt792x_dma_disable(dev, true);
@@ -185,7 +206,7 @@ static int mt7921_dma_init(struct mt792x_dev *dev)
 	mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, 0x4);
 
 	/* command to WM */
-	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_WM, MT7921_TXQ_MCU_WM,
+	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_WM, layout.mcu_wm_txq,
 				  MT7921_TX_MCU_RING_SIZE, MT_TX_RING_BASE);
 	if (ret)
 		return ret;
@@ -199,18 +220,20 @@ static int mt7921_dma_init(struct mt792x_dev *dev)
 	/* event from WM before firmware download */
 	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU],
 			       MT7921_RXQ_MCU_WM,
-			       MT7921_RX_MCU_RING_SIZE,
+			       layout.mcu_rxdone_ring_size,
 			       MT_RX_BUF_SIZE, MT_RX_EVENT_RING_BASE);
 	if (ret)
 		return ret;
 
-	/* Change mcu queue after firmware download */
-	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
-			       MT7921_RXQ_MCU_WM,
-			       MT7921_RX_MCU_WA_RING_SIZE,
-			       MT_RX_BUF_SIZE, MT_WFDMA0(0x540));
-	if (ret)
-		return ret;
+	if (layout.has_mcu_wa) {
+		/* Change mcu queue after firmware download */
+		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
+				       MT7921_RXQ_MCU_WM,
+				       MT7921_RX_MCU_WA_RING_SIZE,
+				       MT_RX_BUF_SIZE, MT_WFDMA0(0x540));
+		if (ret)
+			return ret;
+	}
 
 	/* rx data */
 	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN],
-- 
2.43.0


