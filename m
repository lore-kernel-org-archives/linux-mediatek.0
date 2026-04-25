Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C090EFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7nWpwAKhQ8b/YmLD8HtlKqkkqVHFMcOQws53Dclzw8=; b=k6lPaWK067fgtskc5Kx9m3LJmg
	u0HGnXC8T8Iw7pURi/iUgl0McJ0YXd+gExdi4ixL+jl9lIt62JZdp+977GdSAGd7Hdfz0hCLxAD5y
	4/vlgDvto6cBg/f9xs/lPk/HP+vuceIqbSu1nMAAm1tJkkA8+IHtfabUls8NgTGafWfR/M5jqcraJ
	Wz17m3LDMWZ4hurIAglV2Gqj6ks/ZhslxnOpXIOiewsFFsH/lqNX2PQbC42+XKrkqsxlikM7aULRL
	QEb8EDgCfx3M4aSjxF6rIgUVHUC3KuiYrAtAMcw5YwtS9QruXRIl9fNcy+pzMiLCzyjOP86Nze5X8
	2xeD5ycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2b-0000000EmXD-45Qe;
	Sat, 25 Apr 2026 19:51:49 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2a-0000000EmWh-14YL
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:49 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dcdaf06498so3473110a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146707; x=1777751507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l7nWpwAKhQ8b/YmLD8HtlKqkkqVHFMcOQws53Dclzw8=;
        b=DP3QyJ+73BryQzcNoiVWMqBN152zFV1Si36SH+5zG5RAD4kQpth9140g7E4RAA+4gP
         e2JPOT9DxlV9nY90quDQws7IEFinVTcNmAvVStvrDBvo4zvSf/PZf3f+WyxWO+dByDDE
         RutaCILoRaCvLd0zE49Qatso981nWDpVXlMaeA6vT5BLGrfV+2Es4ArGpWoJuwsdXvz6
         0YZgAPbYlsm2UkVRuwo7ZZjQEz2isnPjtX2GeWPXUPkWL6vXuvR9dMNdnQ4hEYTVXbsX
         GkdF/HbPjDChlPDGfFznXt7q+6pQET7UTbTrgUr42K9sQWmfWZkiAmHQZzgjo2K+7xVm
         pE3g==
X-Forwarded-Encrypted: i=1; AFNElJ+AvTGaFl+Z9gFeFJfNqhdM3VL5cHSC8l15nsQqm1jmGk2eEz9LV9ns7NGGYRJyUiYuumPGmdQDMyZSxWvpYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy8wDLtVyWzL8+a0ZjLb3arGpN1ZeyE6wqf9ilm6mSKSiWXksa
	dmHbhW9aIFGtxbIHZQLbXbH66DCCSNlAZRpwtmuwLhrd1/qa5TeGFEec
X-Gm-Gg: AeBDievkb+fnuhVgTtv6IIIsIpMZoqxSUiWcFgfNqZ/AIZ/6tFw7/Rdy26rRuedb2EH
	eOe0+DLDKkwJOHokjjwZAgGVO4tqJsV/6b0K8kcnQOsWui6De+H92V6LlNqs6fHqibeeLcI6fEQ
	rXPhLkVkJeaU5Fz5d+ij3+eaniR7bdJKn0N7GwqhR4ehnWGwogAgDpdokySg18+k9kBfhP/3wm/
	tJxJm8L1wdtZCMJU9oi9QqXFdEMbrjnfEcrWWDoF6gPnlqgoVgs1R3or+57gH29PKqmgO89FW/T
	GFOd+nNQTyQMFWXIJ10DQo2EBeTuYJU7NVNcL4l02yjBPxLJytwnzAickvNEuu+99FBZY1tb2oG
	PfwT/iTW00yZCeQBOQkUYHjkdunip6yYWxpeUs1eaLOOVT1SC0Du1h6Zh05pz6g+efrxxS83bas
	B1QO0k8UaGFIIdbCgY/GYWzwyKa28v5TTHo+LSCNP+RAnCPiMTJSMofy29x4ifJy67Ms9POYXqH
	w==
X-Received: by 2002:a05:6830:640a:b0:7dc:d587:af3 with SMTP id 46e09a7af769-7dcd58710abmr16318429a34.23.1777146707482;
        Sat, 25 Apr 2026 12:51:47 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:46 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Javier Tia <floss@jetm.me>
Subject: [PATCH v5 16/21] wifi: mt76: mt792x: add MT7927-specific PCIe DMA support
Date: Sat, 25 Apr 2026 14:50:06 -0500
Message-ID: <20260425195011.790265-17-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125148_307112_028E02B9 
X-CRM114-Status: GOOD (  17.98  )
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

Add the MT7927-specific PCIe DMA queue layout and local DMA setup,
including the extra RX ring and WFDMA/prefetch programming.

MT7927 does not follow the mt7925 DMA configuration, so provide a
separate DMA init path while reusing the existing common queue setup.

This keeps the chip-specific changes local and prepares the driver
for later MT7927 enablement without affecting existing devices.

Co-developed-by: Javier Tia <floss@jetm.me>
Signed-off-by: Javier Tia <floss@jetm.me>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7925/mt7925.h    | 13 +++++
 .../net/wireless/mediatek/mt76/mt7925/pci.c   | 53 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 41 +++++++++++++-
 .../net/wireless/mediatek/mt76/mt792x_regs.h  |  9 ++++
 4 files changed, 113 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 46b480f7d813..984be40ca76d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -126,6 +126,19 @@ enum mt7925_rxq_id {
 	MT7925_RXQ_MCU_WM2, /* for tx done */
 };
 
+enum mt7927_txq_id {
+	MT7927_TXQ_BAND0 = MT7925_TXQ_BAND0,
+	MT7927_TXQ_BAND1 = MT7925_TXQ_BAND1,
+	MT7927_TXQ_MCU_WM = MT7925_TXQ_MCU_WM,
+	MT7927_TXQ_FWDL = MT7925_TXQ_FWDL,
+};
+
+enum mt7927_rxq_id {
+	MT7927_RXQ_BAND0 = 4,
+	MT7927_RXQ_MCU_WM = 6,
+	MT7927_RXQ_DATA2 = 7,
+};
+
 enum {
 	MODE_OPEN = 0,
 	MODE_SHARED = 1,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 39c663687c3c..7455cf7eddc5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -228,6 +228,51 @@ static const struct mt792x_dma_layout mt7925_dma_layout = {
 				   MT_RX_DATA_RING_BASE),
 };
 
+static const struct mt792x_dma_layout mt7927_dma_layout = {
+	.tx_data0 = mt792x_dma_ring(MT7927_TXQ_BAND0,
+				    MT7925_TX_RING_SIZE,
+				    MT_TX_RING_BASE),
+	.tx_mcu = mt792x_dma_ring(MT7927_TXQ_MCU_WM,
+				  MT7925_TX_MCU_RING_SIZE,
+				  MT_TX_RING_BASE),
+	.tx_fwdl = mt792x_dma_ring(MT7927_TXQ_FWDL,
+				   MT7925_TX_FWDL_RING_SIZE,
+				   MT_TX_RING_BASE),
+	.rx_mcu = mt792x_dma_ring(MT7927_RXQ_MCU_WM,
+				  MT7925_RX_MCU_RING_SIZE,
+				  MT_RX_EVENT_RING_BASE),
+	.rx_data = mt792x_dma_ring(MT7927_RXQ_BAND0,
+				   MT7925_RX_RING_SIZE,
+				   MT_RX_DATA_RING_BASE),
+};
+
+static int mt7927_dma_init(struct mt792x_dev *dev)
+{
+	int ret;
+
+	ret = mt792x_dma_alloc_queues(dev, &mt7927_dma_layout);
+	if (ret)
+		return ret;
+
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
+			       MT7927_RXQ_DATA2,
+			       MT7925_RX_MCU_RING_SIZE,
+			       MT_RX_BUF_SIZE,
+			       MT_RX_DATA_RING_BASE);
+	if (ret)
+		return ret;
+
+	ret = mt76_init_queues(dev, mt792x_poll_rx);
+	if (ret < 0)
+		return ret;
+
+	netif_napi_add_tx(dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+			  mt792x_poll_tx);
+	napi_enable(&dev->mt76.tx_napi);
+
+	return mt792x_dma_enable(dev);
+}
+
 static int mt7925_dma_init(struct mt792x_dev *dev)
 {
 	int ret;
@@ -406,7 +451,13 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_dev;
 
-	ret = mt7925_dma_init(dev);
+	if (is_mt7927(&dev->mt76))
+		ret = mt7927_dma_init(dev);
+	else if (is_mt7925(&dev->mt76))
+		ret = mt7925_dma_init(dev);
+	else
+		ret = -EINVAL;
+
 	if (ret)
 		goto err_free_irq;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 7b36f0761dd1..fc326447c792 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -169,9 +169,39 @@ static void mt7925_wfdma_setup(struct mt792x_dev *dev)
 	mt76_set(dev, MT_WFDMA0_INT_TX_PRI, 0x7F00);
 }
 
+static void mt7927_dma_prefetch_setup(struct mt792x_dev *dev)
+{
+	mt76_wr(dev, MT_WFDMA_PREFETCH_CTRL,
+		mt76_rr(dev, MT_WFDMA_PREFETCH_CTRL));
+	mt76_wr(dev, MT_WFDMA_PREFETCH_CFG0, 0x660077);
+	mt76_wr(dev, MT_WFDMA_PREFETCH_CFG1, 0x1100);
+	mt76_wr(dev, MT_WFDMA_PREFETCH_CFG2, 0x30004f);
+	mt76_wr(dev, MT_WFDMA_PREFETCH_CFG3, 0x542200);
+	mt76_wr(dev, MT_WFDMA0_RX_RING4_EXT_CTRL, PREFETCH(0x0000, 0x8));
+	mt76_wr(dev, MT_WFDMA0_RX_RING6_EXT_CTRL, PREFETCH(0x0080, 0x8));
+	mt76_wr(dev, MT_WFDMA0_RX_RING7_EXT_CTRL, PREFETCH(0x0100, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x0140, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING15_EXT_CTRL, PREFETCH(0x0180, 0x10));
+	mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, PREFETCH(0x0280, 0x4));
+}
+
+static void mt7927_wfdma_setup(struct mt792x_dev *dev)
+{
+	mt76_set(dev, MT_WFDMA0_GLO_CFG,
+		 MT_WFDMA0_GLO_CFG_ADDR_EXT_EN |
+		 MT_WFDMA0_GLO_CFG_FW_DWLD_BYPASS_DMASHDL);
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
+		   MT_WFDMA0_GLO_CFG_CSR_LBK_RX_Q_SEL_EN);
+	mt76_rmw(dev, MT_WFDMA0_GLO_CFG_EXT1, BIT(28), BIT(28));
+	mt76_set(dev, MT_WFDMA0_INT_RX_PRI, 0x0F00);
+	mt76_set(dev, MT_WFDMA0_INT_TX_PRI, 0x7F00);
+}
+
 static void mt792x_dma_prefetch(struct mt792x_dev *dev)
 {
-	if (is_mt7925(&dev->mt76)) {
+	if (is_mt7927(&dev->mt76)) {
+		mt7927_dma_prefetch_setup(dev);
+	} else if (is_mt7925(&dev->mt76)) {
 		mt7925_dma_prefetch_setup(dev);
 	} else if (is_mt7902(&dev->mt76)) {
 		/* rx ring */
@@ -236,7 +266,9 @@ int mt792x_dma_enable(struct mt792x_dev *dev)
 	mt76_set(dev, MT_WFDMA0_GLO_CFG,
 		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
 
-	if (is_mt7925(&dev->mt76))
+	if (is_mt7927(&dev->mt76))
+		mt7927_wfdma_setup(dev);
+	else if (is_mt7925(&dev->mt76))
 		mt7925_wfdma_setup(dev);
 
 	mt76_set(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
@@ -349,6 +381,11 @@ int mt792x_dma_disable(struct mt792x_dev *dev, bool force)
 				 MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 100, 1))
 		return -ETIMEDOUT;
 
+	if (is_mt7927(&dev->mt76)) {
+		mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
+		mt76_wr(dev, MT_WFDMA0_RST_DRX_PTR, ~0);
+	}
+
 	/* disable dmashdl */
 	mt76_clear(dev, MT_WFDMA0_GLO_CFG_EXT0,
 		   MT_WFDMA0_CSR_TX_DMASHDL_ENABLE);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index 17504ef8e80d..4cd5b33b640e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -301,7 +301,9 @@
 #define MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN	BIT(12)
 #define MT_WFDMA0_GLO_CFG_RX_WB_DDONE	BIT(13)
 #define MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN BIT(15)
+#define MT_WFDMA0_GLO_CFG_CSR_LBK_RX_Q_SEL_EN	BIT(20)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2	BIT(21)
+#define MT_WFDMA0_GLO_CFG_ADDR_EXT_EN		BIT(26)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO	BIT(27)
 #define MT_WFDMA0_GLO_CFG_OMIT_TX_INFO	BIT(28)
 #define MT_WFDMA0_GLO_CFG_CLK_GAT_DIS	BIT(30)
@@ -368,6 +370,13 @@
 #define MT_WFDMA_EXT_CSR_HIF_MISC	MT_WFDMA_EXT_CSR(0x44)
 #define MT_WFDMA_EXT_CSR_HIF_MISC_BUSY	BIT(0)
 
+#define MT_WFDMA_PREFETCH_CTRL		MT_WFDMA_EXT_CSR(0x30)
+#define MT_WFDMA_PREFETCH_CFG0		MT_WFDMA_EXT_CSR(0xf0)
+#define MT_WFDMA_PREFETCH_CFG1		MT_WFDMA_EXT_CSR(0xf4)
+#define MT_WFDMA_PREFETCH_CFG2		MT_WFDMA_EXT_CSR(0xf8)
+#define MT_WFDMA_PREFETCH_CFG3		MT_WFDMA_EXT_CSR(0xfc)
+#define MT_WFDMA0_GLO_CFG_EXT1		MT_WFDMA0(0x2b4)
+
 #define MT_SWDEF_BASE			0x41f200
 #define MT_SWDEF(ofs)			(MT_SWDEF_BASE + (ofs))
 #define MT_SWDEF_MODE			MT_SWDEF(0x3c)
-- 
2.43.0


