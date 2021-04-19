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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BC1C43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B6D6023E
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51B6D6023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3KVCxRw+pBX2wMFXtTxf095X5imiRRqN9GRuMpodqbc=; b=Srk6yFDwysqR0EM8savbN3AwK
	zbwfnFIKb1hOiXDpOE4v1CgdZLIh7Dp6g415j4fMXuUYnhUiFYI6aCraCVIShy1k12QkS4bafMuux
	NSjQKNgB3FW36vM8paIF4AXAZkQh7lUkjYskks0F5xORI5hezwFo6whKe8OM/W8wOaELrVzqf9rux
	aZd+c5C7C+3aCNtlYCUJhPe0IvT/zJ3+MEoYZebiZIanOUvxWcuGMctsvlJQ21AzjV+zwB/AR80kB
	Yc7rBGh4ZczB4w+Ve1LMu0X3p5pDMF8QpK2onEzOEvHMdG3AQHD2X9ZcdACQq3/oMjCnVP4SyVibg
	iDgf0DjCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUmM-00A4u6-Pe; Mon, 19 Apr 2021 14:21:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUmJ-00A4sw-Hj
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 14:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=LSWfKTQTIdGrD/p6RD1eDrs0nzKGQlJGRhFdt9IN1hY=; b=1yYi7m1bY+KI+RDA4WSqoymayc
 lV51pD13YGR5nsN7/BEjImbPaGeS/EMzZgHUoX5VGuJaxnVr1jZokRLEvp81qm+ERQg1OfSotqEX3
 /zVQpTBFZ1/rCm57vOP5R+mZY1n24+LojgdwLViOzQiyiSoiMKCjlNSvETvIh+DTBXhoE8qadUDKh
 Z+vG0e4J1e67ZrCGfzlFiJq5K6k1uG4Pt/3Ussv23c6hvfHiNBBCQlb8Xiep3Wjl7bDVjyiE97vXe
 pa8XL2OO2Z8/KA1cajWaEr9u56wib9BtUhKImt1s55UdU/T0zZ8OMzm1I1cqdaJjZTLUTml1AY/EL
 MEaU3BxA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUmG-00BRk3-Mp
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 14:21:30 +0000
X-UUID: 6fb4336041c542c389f644c74cd42712-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LSWfKTQTIdGrD/p6RD1eDrs0nzKGQlJGRhFdt9IN1hY=; 
 b=GfwjT1+B/oPPH4PiicCG2IsuSwsNxCOfrTAhksRRCmBvdeaGHlDnV9mwxLGkW5dspUdAhY58HC6a6ku7NiKjkpgU+2Go4jKHlgHhTpyeKtf3Xoj8aSNhqt9ng/a6ZAVPmBw447A3x3LfrNrp1OfgS4eSSrjSHNMRoIzXu/PIvvs=;
X-UUID: 6fb4336041c542c389f644c74cd42712-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 20339555; Mon, 19 Apr 2021 07:21:26 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 07:21:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v2 3/6] mt76: mt7921: introduce mt7921_dma_{enable,
 disable} utilities
Date: Mon, 19 Apr 2021 22:20:56 +0800
Message-ID: <1618842059-8192-4-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
References: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D313CF67F8EEFB128D56CE4EEE4ECAE5CBE9FEB55ED205ACA51F34D28659EEE02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_072128_785308_860AC173 
X-CRM114-Status: GOOD (  14.54  )
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
index af4b6cf38929..fb7f98d92377 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -221,18 +221,8 @@ static u32 mt7921_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
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
@@ -244,6 +234,11 @@ static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
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
@@ -257,18 +252,11 @@ static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
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
 
@@ -300,6 +288,29 @@ static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
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
@@ -362,32 +373,10 @@ int mt7921_dma_init(struct mt7921_dev *dev)
 
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
@@ -439,34 +428,7 @@ int mt7921_dma_init(struct mt7921_dev *dev)
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
-	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
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
