Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEBAFF885A
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44qxgi71MvbrDUxdKmi1Cwa1db52LH7bUeo0SZ0+/JA=; b=UQ3v+npaWeH/j/wBo2lnCmiYJY
	tHCCgxrIYl/ElnZyXKPvl6igcz5SbmVVWwaQvZsqsNKaDohrlxbWEm8HVJl1Ej4C/nI+6KbayyTjx
	23gfvoZnm1v5zYX6Q6GxBpXjjTwFSBpwny81kuiV/VSsWHO+9AJkTvGUzUaR+luSoz7L2CG8ZR4TW
	ZhDDYjPTOPVA/r3gZaMa88+Wmd013lzSvbgAsqoNmyxNfFBQatLSo9pRkqvIBiOPD6PBOLUaevN6E
	9p9UiQbj+UqwOsG5PYpOI6YVqVIR7zwrHJ7olGWYafsRHGk45L3nn5FNB52bnm1nxyZgp/klEq1PE
	od3QslPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2U-0000000EmUO-0jOg;
	Sat, 25 Apr 2026 19:51:42 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2S-0000000EmTZ-0Ncy
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:41 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dcdca9dd6cso4892020a34.3
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146699; x=1777751499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44qxgi71MvbrDUxdKmi1Cwa1db52LH7bUeo0SZ0+/JA=;
        b=dD4M/rJqD6iim75LQP75k4R3tIE+FSp64Yj8wNZaNnXQPO5h05Sre02AaaIEtvgsPT
         gV7cnrnkwz+cL2UZz2RpASYTxI1Vg8djL7nKMbEqL3r+0OCiUT7ogCi2c1Mq/umPv2Ui
         92+Q2m2lDNfJrfzWv65D+as4NXnoCtAIkjFwycEpmCJa3VVxJ0VWs3wpsNTuEY3icvhI
         1oPPxRwOkWbzpdeXmCojusx+9GrMNSH3/EDR91dxyr7z/z/yJCgm1N/7LoUTIJgPjXAS
         8BqwHjz8tvL4XHNGgrJk+KqUgI2Q4b29B2pVtmKRKYFZ1ByjzINEPBc25LgUoRk7M5br
         f2lg==
X-Forwarded-Encrypted: i=1; AFNElJ8g3RdyXWyrowfWu8gM/eUangQ+uZIQUfr737XlmYggwkwKEdXgWFS0Y1SHk0uResIDj7q+r/dLWc2ttyfZrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPIKTIkQyLub9/f1tg2k0qL18dujXcQKUzJe9HEeUf7ClPMXNL
	rApGcbMm4lOaT0NRI3WOtqsv0S39pH1MkMI2YIPr+rUdFyv5Oig+duNv
X-Gm-Gg: AeBDies67uyA3+VeupyV7kHZsQVRLRGUZVKQpwcvOBaLtg/OOr6819bNGzJ8TEKUuaa
	+xnR6pq+WYMZHKD2GFkUwR8KHLQ/tgW/SiomrdDT4+vb7/ZBRMIvsNq9ip0AEnFXyvRAZFj8yfK
	1Ijx0r1tLU6leNl7w3VXJi3cs3wzFnrE6GeHehcmBjtdySx5c/PcjXApTrZA2ppwjRba5yO5gZN
	4VTWIcorEmtQTuHQyysUC9D6CTdSwQUqSaylvwsy3W3C+3FK/TxxH5qAHS2kywJeruKcNv3f8uE
	9ws/nJxe72dwwtdEUc+9oJJ4xSoDVlSHUSzrfV3v8Pp6YEd+ZeO5+jVsqk6F1ZNCBYhEyIEHvKw
	Uby9k4p5fRUh+WqaVBznR0z3D/lVQNQY0y8aEUyLAEF2uTN6HYx1BYk46jlq0/avxSl9KgRZuo0
	eqEXniKmKlGavFS3xvXDsXtoy5bjt5uOEmS2PkLYyeGZy4BFjXltr3YBWz7zRafWRLVVQV/ZrDU
	Q==
X-Received: by 2002:a05:6830:314a:b0:7d9:b189:d938 with SMTP id 46e09a7af769-7dc950e3ad5mr24699490a34.10.1777146699338;
        Sat, 25 Apr 2026 12:51:39 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:38 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 15/21] wifi: mt76: mt7925: switch DMA init to common mt792x queue helpers
Date: Sat, 25 Apr 2026 14:50:05 -0500
Message-ID: <20260425195011.790265-16-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125140_158351_B0A2B0CE 
X-CRM114-Status: GOOD (  12.53  )
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

Convert mt7925 DMA init to use the common mt792x queue allocation
helper and isolate the mt7925-specific prefetch/WFDMA setup.

This removes duplicated DMA setup code and prepares the path for
follow-up chip-specific DMA support with smaller deltas.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/pci.c   | 57 +++++++------------
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 46 +++++++++------
 2 files changed, 48 insertions(+), 55 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 1f05c212be02..39c663687c3c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -210,48 +210,29 @@ static u32 mt7925_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
 	return dev->bus_ops->rmw(mdev, addr, mask, val);
 }
 
+static const struct mt792x_dma_layout mt7925_dma_layout = {
+	.tx_data0 = mt792x_dma_ring(MT7925_TXQ_BAND0,
+				    MT7925_TX_RING_SIZE,
+				    MT_TX_RING_BASE),
+	.tx_mcu = mt792x_dma_ring(MT7925_TXQ_MCU_WM,
+				  MT7925_TX_MCU_RING_SIZE,
+				  MT_TX_RING_BASE),
+	.tx_fwdl = mt792x_dma_ring(MT7925_TXQ_FWDL,
+				   MT7925_TX_FWDL_RING_SIZE,
+				   MT_TX_RING_BASE),
+	.rx_mcu = mt792x_dma_ring(MT7925_RXQ_MCU_WM,
+				  MT7925_RX_MCU_RING_SIZE,
+				  MT_RX_EVENT_RING_BASE),
+	.rx_data = mt792x_dma_ring(MT7925_RXQ_BAND0,
+				   MT7925_RX_RING_SIZE,
+				   MT_RX_DATA_RING_BASE),
+};
+
 static int mt7925_dma_init(struct mt792x_dev *dev)
 {
 	int ret;
 
-	mt76_dma_attach(&dev->mt76);
-
-	ret = mt792x_dma_disable(dev, true);
-	if (ret)
-		return ret;
-
-	/* init tx queue */
-	ret = mt76_connac_init_tx_queues(dev->phy.mt76, MT7925_TXQ_BAND0,
-					 MT7925_TX_RING_SIZE,
-					 MT_TX_RING_BASE, NULL, 0);
-	if (ret)
-		return ret;
-
-	mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, 0x4);
-
-	/* command to WM */
-	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_WM, MT7925_TXQ_MCU_WM,
-				  MT7925_TX_MCU_RING_SIZE, MT_TX_RING_BASE);
-	if (ret)
-		return ret;
-
-	/* firmware download */
-	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_FWDL, MT7925_TXQ_FWDL,
-				  MT7925_TX_FWDL_RING_SIZE, MT_TX_RING_BASE);
-	if (ret)
-		return ret;
-
-	/* rx event */
-	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU],
-			       MT7925_RXQ_MCU_WM, MT7925_RX_MCU_RING_SIZE,
-			       MT_RX_BUF_SIZE, MT_RX_EVENT_RING_BASE);
-	if (ret)
-		return ret;
-
-	/* rx data */
-	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN],
-			       MT7925_RXQ_BAND0, MT7925_RX_RING_SIZE,
-			       MT_RX_BUF_SIZE, MT_RX_DATA_RING_BASE);
+	ret = mt792x_dma_alloc_queues(dev, &mt7925_dma_layout);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index c52d0c85913c..7b36f0761dd1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -144,21 +144,35 @@ int mt792x_dma_alloc_queues(struct mt792x_dev *dev,
 EXPORT_SYMBOL_GPL(mt792x_dma_alloc_queues);
 
 #define PREFETCH(base, depth)	((base) << 16 | (depth))
+
+static void mt7925_dma_prefetch_setup(struct mt792x_dev *dev)
+{
+	/* rx ring */
+	mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0000, 0x4));
+	mt76_wr(dev, MT_WFDMA0_RX_RING1_EXT_CTRL, PREFETCH(0x0040, 0x4));
+	mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL, PREFETCH(0x0080, 0x4));
+	mt76_wr(dev, MT_WFDMA0_RX_RING3_EXT_CTRL, PREFETCH(0x00c0, 0x4));
+
+	/* tx ring */
+	mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, PREFETCH(0x0100, 0x10));
+	mt76_wr(dev, MT_WFDMA0_TX_RING1_EXT_CTRL, PREFETCH(0x0200, 0x10));
+	mt76_wr(dev, MT_WFDMA0_TX_RING2_EXT_CTRL, PREFETCH(0x0300, 0x10));
+	mt76_wr(dev, MT_WFDMA0_TX_RING3_EXT_CTRL, PREFETCH(0x0400, 0x10));
+	mt76_wr(dev, MT_WFDMA0_TX_RING15_EXT_CTRL, PREFETCH(0x0500, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x0540, 0x4));
+}
+
+static void mt7925_wfdma_setup(struct mt792x_dev *dev)
+{
+	mt76_rmw(dev, MT_UWFDMA0_GLO_CFG_EXT1, BIT(28), BIT(28));
+	mt76_set(dev, MT_WFDMA0_INT_RX_PRI, 0x0F00);
+	mt76_set(dev, MT_WFDMA0_INT_TX_PRI, 0x7F00);
+}
+
 static void mt792x_dma_prefetch(struct mt792x_dev *dev)
 {
 	if (is_mt7925(&dev->mt76)) {
-		/* rx ring */
-		mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0000, 0x4));
-		mt76_wr(dev, MT_WFDMA0_RX_RING1_EXT_CTRL, PREFETCH(0x0040, 0x4));
-		mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL, PREFETCH(0x0080, 0x4));
-		mt76_wr(dev, MT_WFDMA0_RX_RING3_EXT_CTRL, PREFETCH(0x00c0, 0x4));
-		/* tx ring */
-		mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, PREFETCH(0x0100, 0x10));
-		mt76_wr(dev, MT_WFDMA0_TX_RING1_EXT_CTRL, PREFETCH(0x0200, 0x10));
-		mt76_wr(dev, MT_WFDMA0_TX_RING2_EXT_CTRL, PREFETCH(0x0300, 0x10));
-		mt76_wr(dev, MT_WFDMA0_TX_RING3_EXT_CTRL, PREFETCH(0x0400, 0x10));
-		mt76_wr(dev, MT_WFDMA0_TX_RING15_EXT_CTRL, PREFETCH(0x0500, 0x4));
-		mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x0540, 0x4));
+		mt7925_dma_prefetch_setup(dev);
 	} else if (is_mt7902(&dev->mt76)) {
 		/* rx ring */
 		mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0000, 0x4));
@@ -222,11 +236,9 @@ int mt792x_dma_enable(struct mt792x_dev *dev)
 	mt76_set(dev, MT_WFDMA0_GLO_CFG,
 		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
 
-	if (is_mt7925(&dev->mt76)) {
-		mt76_rmw(dev, MT_UWFDMA0_GLO_CFG_EXT1, BIT(28), BIT(28));
-		mt76_set(dev, MT_WFDMA0_INT_RX_PRI, 0x0F00);
-		mt76_set(dev, MT_WFDMA0_INT_TX_PRI, 0x7F00);
-	}
+	if (is_mt7925(&dev->mt76))
+		mt7925_wfdma_setup(dev);
+
 	mt76_set(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
 
 	/* enable interrupts for TX/RX rings */
-- 
2.43.0


