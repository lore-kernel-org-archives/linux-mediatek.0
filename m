Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED04AFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuwf+IrsTpmukx1qHarGwYw+wkWNu4tsqhqDQWh45rg=; b=oJ3MUD8wOYQ+5xrsTUxKkmi32B
	5HnAFUb3pnHxkU1OLL++qMaA/iJbd5IPG3jb9vrTcN7JzbydlCk7hICgNJ1L5CkyenxnggtjVaV76
	wK2zWK4CTgnNKmfSEO1uUIIiC4WW2ZmTe9yJNzkX4c+v7vKjE3TrGsZZcrsALLS4B0vEds3tJnhHX
	Rj0SOmSvUvFhcgawHjFdGfAKlYuwA2oXS1i+qRM2/B4GfUag+WpTGk02BiUNsPD2Ty3J/3xM99Czx
	5423hKd1ZJl9wljRmXY82Sq88wg58L53y5L1eBiAxcSYPh9bTfp1C9yp/x/P3zcJnW0WKJMY5brhY
	u+D8BIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj29-0000000EmLb-43zU;
	Sat, 25 Apr 2026 19:51:21 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj26-0000000EmKd-44Dq
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:20 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7de46b8e432so3128784a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146678; x=1777751478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tuwf+IrsTpmukx1qHarGwYw+wkWNu4tsqhqDQWh45rg=;
        b=oP5NDy6/WrRw1oJ+zPSd38DR+3YWxGW4sfen2eHcba/abNJp2/5+G3xK5cqfIvowja
         1UlRJndnMFY7M9nk9HtmpZ+q15skClJrFgoTUOQbbFAx7s6dRACKCoT4QMPwWtCyfBUV
         UMA7BMKVKFLsUtjN7qIV6IsK/gjuZhB7MGr/I7NxqX3QLAiiTVkUdPVHmB8/56BWM2pq
         CemTWGYs5W2LWKBgGoa2gLs9M2Vewz6VQCSVmYt6gslT/B95uNiMJ2KYL9/K/O1HaS5j
         xbgTjqpPbJcnjXb/U6tuhvZJz+zL9Z6sDRRttpC+Bn2rlsniuI9tk8dBmgDI9mYrTgC5
         IOxg==
X-Forwarded-Encrypted: i=1; AFNElJ/yCDRdbV/0gqfz/z7KtofnFOQ1weQNg2s06rUv2SZ+lv4X3gtYZhOSBTLRb5XrBL0jsT5S3naVWPBuvHWPEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsIzJwqPDTv/CETFVUQjFogbP1sEAwVBbwPiwnqzKvdLv4uy/6
	aevW+deo/0UsHf8mDybwYInqnrY2EFkLmGJvMA4FMiJiUzCi5jn8/bTD
X-Gm-Gg: AeBDieuG5AraKBcmQxCdT63TZKYhgujBopemZI9D1dNo/khiLaT16F5fwzZnUC7WoCj
	pHe3asDZZlG8yuyVKK3bTgQSjLa3cACumnbB+qf9oT76MklKc5d3VuyJFosCOIjmZSMCqx/7dxH
	Tiw2jeI2F3ud90i2Kihfi9FHhiJLttFtUUYaLdem40UF4kIVulRGlz05WP5Vb9lu360x4CQaKam
	AcJAXZOczYoz2EpYAXd88j5k3mN8KShyBMeJiNoVuoe+TAp0zdoGIpvUFlhCNzEAehnL3OV74kJ
	8DncJ53XwtBIonubBrbs1517NZWc4Cu42JpD1YEd0qAc/3FG9HEe1Tq7muvKZUrTchs4nqnAnns
	tlv7MTiy5c8UNAWtJRKuxjqD26NQfh0agNkt0xkFDseS0DcWsHD2f5HBkPHU8ormkrq2MH/XSif
	DZLRNQpVklakB7tEXGzlwk6nkFATFjRjT4tsPpTUNdNC9zZTUVdCHkCGdZ6jVv+RiSysiutSdko
	g==
X-Received: by 2002:a05:6830:370a:b0:7d9:7201:1ac1 with SMTP id 46e09a7af769-7dc94fca71bmr22040110a34.3.1777146678174;
        Sat, 25 Apr 2026 12:51:18 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:17 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	Cristian-Florin Radoi <radoi.chris@gmail.com>,
	George Salukvadze <giosal90@gmail.com>,
	Evgeny Kapusta <3193631@gmail.com>,
	Samu Toljamo <samu.toljamo@gmail.com>,
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
	Chapuis Dario <chapuisdario4@gmail.com>,
	=?UTF-8?q?Thibaut=20Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 08/21] wifi: mt76: mt7925: use irq_map for chip-specific interrupt handling
Date: Sat, 25 Apr 2026 14:49:58 -0500
Message-ID: <20260425195011.790265-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125119_022256_3232C7C0 
X-CRM114-Status: GOOD (  14.51  )
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

From: Javier Tia <floss@jetm.me>

The mac_reset and resume paths use the hardcoded MT_INT_RX_DONE_ALL
constant (bits 0-2) to re-enable RX interrupts. This is correct for
MT7925 (RX rings 0, 1, 2) but wrong for chips using different ring
indices.

Define a per-chip irq_map with the correct RX interrupt enable bits and
replace hardcoded MT_INT_RX_DONE_ALL with irq_map field reads in the
resume and mac_reset paths. Add the MT7927 irq_map with interrupt bits
matching its RX ring layout (rings 4, 6, 7), selected at probe time
based on PCI device ID.

This ensures the correct interrupt bits are enabled regardless of the
chip variant.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 .../net/wireless/mediatek/mt76/mt7925/pci.c   | 21 +++++++++++++++++--
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  5 ++++-
 .../net/wireless/mediatek/mt76/mt792x_regs.h  |  3 +++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index f820d5aeb723..604c0e9ae7ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -266,6 +266,18 @@ static int mt7925_dma_init(struct mt792x_dev *dev)
 	return mt792x_dma_enable(dev);
 }
 
+static const struct mt792x_irq_map mt7927_irq_map = {
+	.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
+	.tx = {
+		.all_complete_mask = MT_INT_TX_DONE_ALL,
+		.mcu_complete_mask = MT_INT_TX_DONE_MCU,
+	},
+	.rx = {
+		.data_complete_mask = MT7927_RX_DONE_INT_ENA4,
+		.wm_complete_mask = MT7927_RX_DONE_INT_ENA6,
+		.wm2_complete_mask = MT7927_RX_DONE_INT_ENA7,
+	},
+};
 static int mt7925_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -310,6 +322,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	struct mt76_bus_ops *bus_ops;
 	struct mt792x_dev *dev;
 	struct mt76_dev *mdev;
+	bool is_mt7927_hw;
 	u8 features;
 	int ret;
 	u16 cmd;
@@ -358,7 +371,8 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &mt7925_pcie_ops;
-	dev->irq_map = &irq_map;
+	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
+	dev->irq_map = is_mt7927_hw ? &mt7927_irq_map : &irq_map;
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
@@ -549,7 +563,10 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 	mt76_connac_irq_enable(&dev->mt76,
 			       dev->irq_map->tx.all_complete_mask |
-			       MT_INT_RX_DONE_ALL | MT_INT_MCU_CMD);
+			       dev->irq_map->rx.data_complete_mask |
+			       dev->irq_map->rx.wm_complete_mask |
+			       dev->irq_map->rx.wm2_complete_mask |
+			       MT_INT_MCU_CMD);
 	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
 
 	/* put dma enabled */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 3072850c2752..1626a3684082 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -118,7 +118,10 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 
 	mt76_wr(dev, dev->irq_map->host_irq_enable,
 		dev->irq_map->tx.all_complete_mask |
-		MT_INT_RX_DONE_ALL | MT_INT_MCU_CMD);
+		dev->irq_map->rx.data_complete_mask |
+		dev->irq_map->rx.wm_complete_mask |
+		dev->irq_map->rx.wm2_complete_mask |
+		MT_INT_MCU_CMD);
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
 	err = mt792xe_mcu_fw_pmctrl(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index d2a8b2b0df32..20d27ae89aca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -310,6 +310,9 @@
 #define HOST_RX_DONE_INT_ENA1		BIT(1)
 #define HOST_RX_DONE_INT_ENA2		BIT(2)
 #define HOST_RX_DONE_INT_ENA3		BIT(3)
+#define MT7927_RX_DONE_INT_ENA4		BIT(12)
+#define MT7927_RX_DONE_INT_ENA6		BIT(14)
+#define MT7927_RX_DONE_INT_ENA7		BIT(15)
 #define HOST_TX_DONE_INT_ENA0		BIT(4)
 #define HOST_TX_DONE_INT_ENA1		BIT(5)
 #define HOST_TX_DONE_INT_ENA2		BIT(6)
-- 
2.43.0


