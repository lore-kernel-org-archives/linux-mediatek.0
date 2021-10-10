Return-Path: <SRS0=Vfzs=O6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D119EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Oct 2021 07:06:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7238061074
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Oct 2021 07:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7238061074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWeZegyuV7D7jRx+Ixq4wa+rHJVpN4sWkzZ3hUV8E5k=; b=YSNLZHDFt6ZxXL
	PqguuD0hhljCLA7uZXFH8GF9O5fk5L6ri/MJ6OBNmiKkG0rZ3g5Gk43KnjCDRca+MGEdSBMK9t2Kl
	/GmuR5Pb2FHSMIpDAkU6nqzpX7mbJk+B7HVk7rkOzDXnFc4mkDH9ROgtbtX2eMoK1591jnGr6Vihk
	/IF3cndHtajpPz/VxCG2bE+nDGyFvyI1Gjq/8f5i7xzsLEkgZhn+jnlyy5N57AhmZUIgm1XWrvd2y
	OI0Sb+XKLFge3Oox1Q2zoh7rFWGpNNfEhGv4hh6lsXPRMLf8oIdy1ay2VknvZeSFVUL6d4azqFoOI
	WyCDdzFkVo5jOXg6yQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZSuO-006Q8F-La; Sun, 10 Oct 2021 07:06:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZSti-006PzL-AO; Sun, 10 Oct 2021 07:05:27 +0000
X-UUID: 34ac8f7b86744bfea84eb98f9c7b80a3-20211010
X-UUID: 34ac8f7b86744bfea84eb98f9c7b80a3-20211010
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 54197688; Sun, 10 Oct 2021 00:05:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Oct 2021 00:05:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 10 Oct 2021 15:05:17 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 10 Oct 2021 15:05:16 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>
Subject: [PATCH v8 2/5] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
Date: Sun, 10 Oct 2021 15:05:13 +0800
Message-ID: <20211010070516.26763-3-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010070516.26763-1-kewei.xu@mediatek.com>
References: <20211010070516.26763-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_000526_404502_84D80448 
X-CRM114-Status: GOOD (  12.60  )
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

When a timeout error occurs in i2c transter, it is usually related
to the i2c/dma IP hardware configuration. Therefore, the purpose of
this patch is to dump the key register values of i2c/dma when a
timeout occurs in i2c for debugging.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Reviewed-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 54 +++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index dad3a85cd499..a1a2af066704 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -130,6 +130,7 @@ enum I2C_REGS_OFFSET {
 	OFFSET_HS,
 	OFFSET_SOFTRESET,
 	OFFSET_DCM_EN,
+	OFFSET_MULTI_DMA,
 	OFFSET_PATH_DIR,
 	OFFSET_DEBUGSTAT,
 	OFFSET_DEBUGCTRL,
@@ -197,6 +198,7 @@ static const u16 mt_i2c_regs_v2[] = {
 	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
 	[OFFSET_CLOCK_DIV] = 0x48,
 	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_MULTI_DMA] = 0x8c,
 	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
 	[OFFSET_DEBUGSTAT] = 0xe4,
 	[OFFSET_DEBUGCTRL] = 0xe8,
@@ -845,6 +847,57 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	return 0;
 }
 
+static void i2c_dump_register(struct mtk_i2c *i2c)
+{
+	dev_dbg(i2c->dev, "SLAVE_ADDR: 0x%x, INTR_MASK: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR),
+		mtk_i2c_readw(i2c, OFFSET_INTR_MASK));
+	dev_dbg(i2c->dev, "INTR_STAT: 0x%x, CONTROL: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_INTR_STAT),
+		mtk_i2c_readw(i2c, OFFSET_CONTROL));
+	dev_dbg(i2c->dev, "TRANSFER_LEN: 0x%x, TRANSAC_LEN: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN),
+		mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN));
+	dev_dbg(i2c->dev, "DELAY_LEN: 0x%x, HTIMING: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DELAY_LEN),
+		mtk_i2c_readw(i2c, OFFSET_TIMING));
+	dev_dbg(i2c->dev, "START: 0x%x, EXT_CONF: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_START),
+		mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
+	dev_dbg(i2c->dev, "HS: 0x%x, IO_CONFIG: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_HS),
+		mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
+	dev_dbg(i2c->dev, "DCM_EN: 0x%x, TRANSFER_LEN_AUX: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DCM_EN),
+		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
+	dev_dbg(i2c->dev, "CLOCK_DIV: 0x%x, FIFO_STAT: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV),
+		mtk_i2c_readw(i2c, OFFSET_FIFO_STAT));
+	dev_dbg(i2c->dev, "DEBUGCTRL : 0x%x, DEBUGSTAT: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL),
+		mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT));
+	if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
+		dev_dbg(i2c->dev, "LTIMING: 0x%x, MULTI_DMA: 0x%x\n",
+			mtk_i2c_readw(i2c, OFFSET_LTIMING),
+			mtk_i2c_readw(i2c, OFFSET_MULTI_DMA));
+	}
+	dev_dbg(i2c->dev, "\nDMA_INT_FLAG: 0x%x, DMA_INT_EN: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_INT_FLAG),
+		readl(i2c->pdmabase + OFFSET_INT_EN));
+	dev_dbg(i2c->dev, "DMA_EN: 0x%x, DMA_CON: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_EN),
+		readl(i2c->pdmabase + OFFSET_CON));
+	dev_dbg(i2c->dev, "DMA_TX_MEM_ADDR: 0x%x, DMA_RX_MEM_ADDR: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR),
+		readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
+	dev_dbg(i2c->dev, "DMA_TX_LEN: 0x%x, DMA_RX_LEN: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_LEN),
+		readl(i2c->pdmabase + OFFSET_RX_LEN));
+	dev_dbg(i2c->dev, "DMA_TX_4G_MODE: 0x%x, DMA_RX_4G_MODE: 0x%x",
+		readl(i2c->pdmabase + OFFSET_TX_4G_MODE),
+		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
+}
+
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			       int num, int left_num)
 {
@@ -1075,6 +1128,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	if (ret == 0) {
 		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
+		i2c_dump_register(i2c);
 		mtk_i2c_init_hw(i2c);
 		return -ETIMEDOUT;
 	}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
