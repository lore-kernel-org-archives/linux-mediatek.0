Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6449C43462
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C8266023E
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C8266023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OGLIF8qW2OQbyni4N3x/YYJXnAWqsngwxwmM2Owls3w=; b=pXFohx6yKCduF1+c39ta1lIOu
	PNNDh2EnJWc9zN9/mM8e9Bwl33A+5XxbFfeizwyZcEYnoVU9ZgM1nExVk6ZIbsN+eP/1Ooy+kkJoX
	yY0bCYVZk0rZshcVd2bLQK68IyFg1uBbVf5LyQfNEWosb/lGGx8uuTBy/lVIBaCLphXGrp44e3sQP
	iTnL5lIR+Q1F2ZSRaRZzFV9qap5bKmMSEZPEFkStQlNEWqCK3LHeFbPn12GKqxIjqvkr2DMb17/Qk
	rlNo7Ph1pBmcc6I2Gj0593DmMYCRHvjy2xvgs30SguXTDkDbaXvVjYnuzXVhYEvpUQIAwCxJQV7Vi
	S55BW20Pg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUmO-00A4uT-0P; Mon, 19 Apr 2021 14:21:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUmK-00A4tF-Qg
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 14:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=bDmRySH2W3fg2GA1gp0FSGSrMpFqMosuf0nfDZAhy7w=; b=Nr+G3kiqe5hAqyLgIt6rO4nLyM
 k1rJ7hKwCXWuF8oiGYfb8aEeBKT5kb0GlfoVtfbvmx9ANB3aLfbD3Lq4LFuduRDOL3x4SngTWq5E/
 RzB30LxrTzjov3kOuH2npvIf/wPAmxI02lnYojM6pJqTG/FTULb3IEDjRm/xKsIXfl/M6hPUJ2q5B
 65z0U/5Qy0FJYhhbmrcGchOZGrFoLggiJebCkqgoJ4VwmYzBUa0IfGSeLaCd4NzBfPnmptreylPDM
 rQJZCwJamarawaX5fBDmQi/CWGP/Vp/L2LtC3mTG8tzcQcafV7nWz7ReTM+xBBsG+0SkzD6U4kAGh
 BxeO5zKg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUmI-00BRkV-19
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 14:21:31 +0000
X-UUID: a55f759668944d669e6efa5d8aeec8f6-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bDmRySH2W3fg2GA1gp0FSGSrMpFqMosuf0nfDZAhy7w=; 
 b=VZqjDecLw3YgWE+9EV6YzKYvtFpaRAYkxFOxKV+KfF+aIHPh3ovLARERw8YJqoF/F7KXMwEGK1SXngL4iDggL8+7b3yUOxa9e5EjBSLzPi6Un4azX2MC18gVjMDXqt/yzlxMPauYTA3BjXWQRVC6w9QMpPNFpPhg1yB+j6VCHZM=;
X-UUID: a55f759668944d669e6efa5d8aeec8f6-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 544430145; Mon, 19 Apr 2021 07:21:26 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 07:21:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 22:21:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 22:21:00 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 1/6] mt76: mt7921: move mt7921_dma_reset in dma.c
Date: Mon, 19 Apr 2021 22:20:54 +0800
Message-ID: <1618842059-8192-2-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
References: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_072130_109319_716B3C06 
X-CRM114-Status: GOOD (  15.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

Move mt7921_dma_reset routine in dma.c and make mt7921_dma_prefetch
static. Moreover add force parameter to mt7921_dma_reset signature.
This is a preliminary patch to reset dma mt7921_mcu_drv_pmctrl.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 73 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 67 +----------------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
 3 files changed, 74 insertions(+), 68 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index 7ada8339b74f..0c577a5bac13 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -97,7 +97,7 @@ static int mt7921_poll_rx(struct napi_struct *napi, int budget)
 	return done;
 }
 
-void mt7921_dma_prefetch(struct mt7921_dev *dev)
+static void mt7921_dma_prefetch(struct mt7921_dev *dev)
 {
 #define PREFETCH(base, depth)	((base) << 16 | (depth))
 
@@ -229,6 +229,77 @@ static int mt7921_dmashdl_disabled(struct mt7921_dev *dev)
 	return 0;
 }
 
+int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
+{
+	int i;
+
+	if (force) {
+		/* reset */
+		mt76_clear(dev, MT_WFDMA0_RST,
+			   MT_WFDMA0_RST_DMASHDL_ALL_RST |
+			   MT_WFDMA0_RST_LOGIC_RST);
+
+		mt76_set(dev, MT_WFDMA0_RST,
+			 MT_WFDMA0_RST_DMASHDL_ALL_RST |
+			 MT_WFDMA0_RST_LOGIC_RST);
+	}
+
+	/* disable WFDMA0 */
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
+		   MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
+		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	if (!mt76_poll(dev, MT_WFDMA0_GLO_CFG,
+		       MT_WFDMA0_GLO_CFG_TX_DMA_BUSY |
+		       MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 1000))
+		return -ETIMEDOUT;
+
+	/* reset hw queues */
+	for (i = 0; i < __MT_TXQ_MAX; i++)
+		mt76_queue_reset(dev, dev->mphy.q_tx[i]);
+
+	for (i = 0; i < __MT_MCUQ_MAX; i++)
+		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
+
+	mt76_for_each_q_rx(&dev->mt76, i)
+		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
+
+	mt76_tx_status_check(&dev->mt76, NULL, true);
+
+	/* configure perfetch settings */
+	mt7921_dma_prefetch(dev);
+
+	/* reset dma idx */
+	mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
+
+	/* configure delay interrupt */
+	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0, 0);
+
+	mt76_set(dev, MT_WFDMA0_GLO_CFG,
+		 MT_WFDMA0_GLO_CFG_TX_WB_DDONE |
+		 MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN |
+		 MT_WFDMA0_GLO_CFG_CLK_GAT_DIS |
+		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		 MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
+		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	mt76_set(dev, MT_WFDMA0_GLO_CFG,
+		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
+
+	mt76_set(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
+
+	/* enable interrupts for TX/RX rings */
+	mt7921_irq_enable(dev,
+			  MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
+			  MT_INT_MCU_CMD);
+	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
+
+	return 0;
+}
+
 int mt7921_dma_init(struct mt7921_dev *dev)
 {
 	/* Increase buffer size to receive large VHT/HE MPDUs */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index a73a5626321f..9aadb598019d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1214,71 +1214,6 @@ int mt7921_wfsys_reset(struct mt7921_dev *dev)
 				WFSYS_SW_INIT_DONE, WFSYS_SW_INIT_DONE, 500);
 }
 
-static void
-mt7921_dma_reset(struct mt7921_dev *dev)
-{
-	int i;
-
-	/* reset */
-	mt76_clear(dev, MT_WFDMA0_RST,
-		   MT_WFDMA0_RST_DMASHDL_ALL_RST | MT_WFDMA0_RST_LOGIC_RST);
-
-	mt76_set(dev, MT_WFDMA0_RST,
-		 MT_WFDMA0_RST_DMASHDL_ALL_RST | MT_WFDMA0_RST_LOGIC_RST);
-
-	/* disable WFDMA0 */
-	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
-		   MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN |
-		   MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
-		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
-		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
-		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
-
-	mt76_poll(dev, MT_WFDMA0_GLO_CFG,
-		  MT_WFDMA0_GLO_CFG_TX_DMA_BUSY |
-		  MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 1000);
-
-	/* reset hw queues */
-	for (i = 0; i < __MT_TXQ_MAX; i++)
-		mt76_queue_reset(dev, dev->mphy.q_tx[i]);
-
-	for (i = 0; i < __MT_MCUQ_MAX; i++)
-		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
-
-	mt76_for_each_q_rx(&dev->mt76, i)
-		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
-
-	mt76_tx_status_check(&dev->mt76, NULL, true);
-
-	/* configure perfetch settings */
-	mt7921_dma_prefetch(dev);
-
-	/* reset dma idx */
-	mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
-
-	/* configure delay interrupt */
-	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0, 0);
-
-	mt76_set(dev, MT_WFDMA0_GLO_CFG,
-		 MT_WFDMA0_GLO_CFG_TX_WB_DDONE |
-		 MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN |
-		 MT_WFDMA0_GLO_CFG_CLK_GAT_DIS |
-		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
-		 MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
-		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
-
-	mt76_set(dev, MT_WFDMA0_GLO_CFG,
-		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
-
-	mt76_set(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
-
-	/* enable interrupts for TX/RX rings */
-	mt7921_irq_enable(dev,
-			  MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
-			  MT_INT_MCU_CMD);
-	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
-}
-
 void mt7921_tx_token_put(struct mt7921_dev *dev)
 {
 	struct mt76_txwi_cache *txwi;
@@ -1349,7 +1284,7 @@ mt7921_mac_reset(struct mt7921_dev *dev)
 		mt76_queue_rx_cleanup(dev, &dev->mt76.q_rx[i]);
 
 	mt7921_wfsys_reset(dev);
-	mt7921_dma_reset(dev);
+	mt7921_dma_reset(dev, true);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
 		mt76_queue_rx_reset(dev, i);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index e461fe9b2c20..58cfa2bbeba5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -253,7 +253,7 @@ int mt7921_eeprom_get_target_power(struct mt7921_dev *dev,
 				   u8 chain_idx);
 void mt7921_eeprom_init_sku(struct mt7921_dev *dev);
 int mt7921_dma_init(struct mt7921_dev *dev);
-void mt7921_dma_prefetch(struct mt7921_dev *dev);
+int mt7921_dma_reset(struct mt7921_dev *dev, bool force);
 void mt7921_dma_cleanup(struct mt7921_dev *dev);
 int mt7921_run_firmware(struct mt7921_dev *dev);
 int mt7921_mcu_init(struct mt7921_dev *dev);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
