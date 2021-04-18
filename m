Return-Path: <SRS0=IoHK=JP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4998C43460
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:36:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B686052B
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B686052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x/UJphuLuRuwAUam/ssGYCLPM8DoF8O4BKcnqjc8HK8=; b=eDHirOEF7slN5op1fGYI+e0cO
	r6JhMrUy8v2LlYYcityYr/ODvOYWon5tAdcmMtYlU2ssDKWE/4vv398ghn/kaiZg8hYdBM/xxqd7P
	NKAvygMnEZ4gw19a0CHXvKT9nPjgLPTFrcxCZrqe8CnQ44iP8F/FWpB6XG/bLVy/aS91CcoOU6729
	s/5ttqGxid6QZvkfpWa+I8GQS3aAbpsEuilL+RSmkbEhQglGjup3L/IqJzEvKn0agDmTe1iIYmaaP
	P8uOIZMUbZfFwVomQtHTNbaD9ZjgUOKOVbDu2sA62q520X519M88Km6VF7tqPl3qJTewP4CiJh60B
	y53vJ0vBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYAPL-008Jyb-UD; Sun, 18 Apr 2021 16:36:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAPI-008Jxt-HM
 for linux-mediatek@desiato.infradead.org; Sun, 18 Apr 2021 16:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=jJA/0jJ780gNkh+ubHpfHWL8xe0/UdEEnAh6Gbqcpak=; b=WqMzr2UbyDp2el7xjhYky9Te3P
 y8YPkkZUca5k0iKKaq06D/9kDmn0BdoGBSOojUxRLWP7rBgZmJTi+fbk34JOYN+XrFTS+X2yWH7z6
 4i/E39JdT1UU87rPb2EKHyMU8v36jLZ+3DJINdJHi0WMlPLiPKdgqlHwRE0i9i+t1PipDwEndOmh0
 eyTyOKNJ4SVGATfaIIB9Q6jP51yp0RW7DFPFXLN12pPWQaGrRM5ivXaOLask2WAfi0lxAA8Kkzb0U
 zsD06o6hEi1MAgCpSK29SjhAI4fXmi/nDda7ZLmzf7CUmY9A4L4V91ClxGI2GqT2d9H9CCGaN+Aj8
 E3Re7M2w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAPE-00AVny-Dp
 for linux-mediatek@lists.infradead.org; Sun, 18 Apr 2021 16:36:23 +0000
X-UUID: 5607abb3948f4ec2a703f0c71de7607f-20210418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jJA/0jJ780gNkh+ubHpfHWL8xe0/UdEEnAh6Gbqcpak=; 
 b=iV6weYOyelbWrdURARWDfnQRjhS3T+8saD/t78+oZyCaih+fCQkerBLMiPR5oixi8QUj1JAIdTSrwSI/XQFgj8/jt0XMP9V/ILfz4t52wX4wvnY+GaDd3KaeaZAX+9DgB+x3FAYOCwzbMRyfM9QRoyus9wnSBcF6KmR1AsX85uw=;
X-UUID: 5607abb3948f4ec2a703f0c71de7607f-20210418
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2079896050; Sun, 18 Apr 2021 09:36:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 18 Apr 2021 09:36:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 00:36:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 00:36:09 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 3/6] mt76: mt7921: introduce mt7921_dma_{enable,
 disable} utilities
Date: Mon, 19 Apr 2021 00:36:04 +0800
Message-ID: <1618763767-1292-4-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618763767-1292-1-git-send-email-sean.wang@mediatek.com>
References: <1618763767-1292-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_093620_499709_C02C7094 
X-CRM114-Status: GOOD (  14.45  )
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

Introduce mt7921_dma_enable and mt7921_dma_disable utilities routine in
order for code reusing between mt7921_dma_reset and mt7921_dma_init.
This is a preliminary patch to reset dma during device driver_own
request.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 108 ++++++------------
 1 file changed, 35 insertions(+), 73 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index 4aad355f8394..8c556ff3ae93 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -198,18 +198,8 @@ static u32 mt7921_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
 	return dev->bus_ops->rmw(mdev, addr, mask, val);
 }
 
-static int mt7921_dmashdl_disabled(struct mt7921_dev *dev)
+static int mt7921_dma_disable(struct mt7921_dev *dev, bool force)
 {
-	mt76_clear(dev, MT_WFDMA0_GLO_CFG_EXT0, MT_WFDMA0_CSR_TX_DMASHDL_ENABLE);
-	mt76_set(dev, MT_DMASHDL_SW_CONTROL, MT_DMASHDL_DMASHDL_BYPASS);
-
-	return 0;
-}
-
-static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
-{
-	int i;
-
 	if (force) {
 		/* reset */
 		mt76_clear(dev, MT_WFDMA0_RST,
@@ -221,6 +211,11 @@ static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
 			 MT_WFDMA0_RST_LOGIC_RST);
 	}
 
+	/* disable dmashdl */
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG_EXT0,
+		   MT_WFDMA0_CSR_TX_DMASHDL_ENABLE);
+	mt76_set(dev, MT_DMASHDL_SW_CONTROL, MT_DMASHDL_DMASHDL_BYPASS);
+
 	/* disable WFDMA0 */
 	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
 		   MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN |
@@ -234,18 +229,11 @@ static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
 		       MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 1000))
 		return -ETIMEDOUT;
 
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
+	return 0;
+}
 
+static int mt7921_dma_enable(struct mt7921_dev *dev)
+{
 	/* configure perfetch settings */
 	mt7921_dma_prefetch(dev);
 
@@ -272,11 +260,33 @@ static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
 	mt7921_irq_enable(dev,
 			  MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
 			  MT_INT_MCU_CMD);
-	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
 
 	return 0;
 }
 
+static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
+{
+	int i, err;
+
+	err = mt7921_dma_disable(dev, force);
+	if (err)
+		return err;
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
+	return mt7921_dma_enable(dev);
+}
+
 int mt7921_wfsys_reset(struct mt7921_dev *dev)
 {
 	mt76_set(dev, 0x70002600, BIT(0));
@@ -339,32 +349,10 @@ int mt7921_dma_init(struct mt7921_dev *dev)
 
 	mt76_dma_attach(&dev->mt76);
 
-	/* reset */
-	mt76_clear(dev, MT_WFDMA0_RST,
-		   MT_WFDMA0_RST_DMASHDL_ALL_RST |
-		   MT_WFDMA0_RST_LOGIC_RST);
-
-	mt76_set(dev, MT_WFDMA0_RST,
-		 MT_WFDMA0_RST_DMASHDL_ALL_RST |
-		 MT_WFDMA0_RST_LOGIC_RST);
-
-	ret = mt7921_dmashdl_disabled(dev);
+	ret = mt7921_dma_disable(dev, true);
 	if (ret)
 		return ret;
 
-	/* disable WFDMA0 */
-	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
-		   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-		   MT_WFDMA0_GLO_CFG_RX_DMA_EN |
-		   MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
-		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
-		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
-		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
-
-	mt76_poll(dev, MT_WFDMA0_GLO_CFG,
-		  MT_WFDMA0_GLO_CFG_TX_DMA_BUSY |
-		  MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 1000);
-
 	/* init tx queue */
 	ret = mt7921_init_tx_queues(&dev->phy, MT7921_TXQ_BAND0,
 				    MT7921_TX_RING_SIZE);
@@ -416,33 +404,7 @@ int mt7921_dma_init(struct mt7921_dev *dev)
 			  mt7921_poll_tx, NAPI_POLL_WEIGHT);
 	napi_enable(&dev->mt76.tx_napi);
 
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
-	mt7921_irq_enable(dev, MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
-			  MT_INT_MCU_CMD);
-
-	return 0;
+	return mt7921_dma_enable(dev);
 }
 
 void mt7921_dma_cleanup(struct mt7921_dev *dev)
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
