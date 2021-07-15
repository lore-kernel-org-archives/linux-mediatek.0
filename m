Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D1BC12002
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 02:31:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A1C161396
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 02:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A1C161396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKeQMdrK+8Yu1v3bUCEl08G9XLiMgBusoguF2J6egW4=; b=N6cm8UiqGB+BW5
	/ESdunxPMl6elDmMIYKV0qV4NuNIJALRq/jKVBcO/I/6/FkU6bRXOyKdmtDgu8B+aQAlQbN0T6wxR
	3DiEgaJ3555O9xOhKOa09H/0eG1RUhDSAuy7nFGIVThdaKDDPnnEEQS4OobfzgOzZ900zaOD+dZeo
	+cklhnGFt6TE+MBfQJuHeZG5M4cOjTvmMLVQ/5R1ifpkzBjY4nqQ3km0ooIAx2OjBdK4b7jfZKkOj
	LgikZrz+uNRqxdBHe6T9oeqff1oRSOU52RiFCfL36wCAoPPjYNjsWCZK/TWSOsLkT91IchA/WArUU
	K312+E1Y01GbZEDhsvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3r9L-00Gr2E-1E; Thu, 15 Jul 2021 02:30:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3r8l-00Gqsm-UH; Thu, 15 Jul 2021 02:30:21 +0000
X-UUID: 6969ea85730d4e6f80c8d486b84088ea-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+Qpvl5HPHbgSQRzAohnu4qgapn/1mkQEuNzYaSVbsS0=; 
 b=BvquZNDD4tM4bVKGX+gEhx1wl8J3fufsZPYaRat5lxdMxLx+Dk5JnEZ3F+LI/WZFgTblgioXo+Doa3tgPHovLxjWkRClxSHBQixLiEI0mSQmtn6EBaegruKWVi71FJorh+iNkhyxQwP8D4k1Rd8jyOUxej4wxnxe3owGj9YPf6w=;
X-UUID: 6969ea85730d4e6f80c8d486b84088ea-20210714
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 554888254; Wed, 14 Jul 2021 19:30:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 19:30:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:30:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 10:30:10 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <qiangming.xia@mediatek.com>, <kewei.xu@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>
Subject: [PATCH 2/8] i2c: mediatek: Dump i2c/dma register when a timeout occurs
Date: Thu, 15 Jul 2021 10:29:11 +0800
Message-ID: <1626316157-24935-3-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_193020_012519_8DD3CEEB 
X-CRM114-Status: GOOD (  13.24  )
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
---
 drivers/i2c/busses/i2c-mt65xx.c | 95 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e..64acd96 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -125,6 +125,7 @@ enum I2C_REGS_OFFSET {
 	OFFSET_HS,
 	OFFSET_SOFTRESET,
 	OFFSET_DCM_EN,
+	OFFSET_MULTI_DMA,
 	OFFSET_PATH_DIR,
 	OFFSET_DEBUGSTAT,
 	OFFSET_DEBUGCTRL,
@@ -192,6 +193,7 @@ enum I2C_REGS_OFFSET {
 	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
 	[OFFSET_CLOCK_DIV] = 0x48,
 	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_MULTI_DMA] = 0x84,
 	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
 	[OFFSET_DEBUGSTAT] = 0xe0,
 	[OFFSET_DEBUGCTRL] = 0xe8,
@@ -828,6 +830,96 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	return 0;
 }
 
+static void i2c_dump_register(struct mtk_i2c *i2c)
+{
+	dev_err(i2c->dev, "SLAVE_ADDR[0x%x]: 0x%x, INTR_MASK[0x%x]: 0x%x\n",
+		OFFSET_SLAVE_ADDR,
+		(mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR)),
+		OFFSET_INTR_MASK,
+		(mtk_i2c_readw(i2c, OFFSET_INTR_MASK)));
+	dev_err(i2c->dev, "INTR_STAT[0x%x]: 0x%x, CONTROL[0x%x]: 0x%x\n",
+		OFFSET_INTR_STAT,
+		(mtk_i2c_readw(i2c, OFFSET_INTR_STAT)),
+		OFFSET_CONTROL,
+		(mtk_i2c_readw(i2c, OFFSET_CONTROL)));
+	dev_err(i2c->dev, "TRANSFER_LEN[0x%x]: 0x%x, TRANSAC_LEN[0x%x]: 0x%x\n",
+		OFFSET_TRANSFER_LEN,
+		(mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN)),
+		OFFSET_TRANSAC_LEN,
+		(mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN)));
+	dev_err(i2c->dev, "DELAY_LEN[0x%x]: 0x%x, HTIMING[0x%x]: 0x%x\n",
+		OFFSET_DELAY_LEN,
+		(mtk_i2c_readw(i2c, OFFSET_DELAY_LEN)),
+		OFFSET_TIMING,
+		(mtk_i2c_readw(i2c, OFFSET_TIMING)));
+	dev_err(i2c->dev, "OFFSET_START[0x%x]: 0x%x\n",
+		OFFSET_START,
+		mtk_i2c_readw(i2c, OFFSET_START));
+	dev_err(i2c->dev, "OFFSET_EXT_CONF[0x%x]: 0x%x\n",
+		OFFSET_EXT_CONF,
+		mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
+	dev_err(i2c->dev, "OFFSET_HS[0x%x]: 0x%x\n",
+		OFFSET_HS,
+		mtk_i2c_readw(i2c, OFFSET_HS));
+	dev_err(i2c->dev, "OFFSET_IO_CONFIG[0x%x]: 0x%x\n",
+		OFFSET_IO_CONFIG,
+		mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
+	dev_err(i2c->dev, "OFFSET_FIFO_ADDR_CLR[0x%x]: 0x%x\n",
+		OFFSET_FIFO_ADDR_CLR,
+		mtk_i2c_readw(i2c, OFFSET_FIFO_ADDR_CLR));
+	dev_err(i2c->dev, "TRANSFER_LEN_AUX[0x%x]: 0x%x\n",
+		OFFSET_TRANSFER_LEN_AUX,
+		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
+	dev_err(i2c->dev, "CLOCK_DIV[0x%x]: 0x%x\n",
+		OFFSET_CLOCK_DIV,
+		mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV));
+	dev_err(i2c->dev, "FIFO_STAT[0x%x]: 0x%x, FIFO_THRESH[0x%x]: 0x%x\n",
+		OFFSET_FIFO_STAT,
+		mtk_i2c_readw(i2c, OFFSET_FIFO_STAT),
+		OFFSET_FIFO_THRESH,
+		mtk_i2c_readw(i2c, OFFSET_FIFO_THRESH));
+	dev_err(i2c->dev, "DCM_EN[0x%x] 0x%x\n",
+		OFFSET_DCM_EN,
+		mtk_i2c_readw(i2c, OFFSET_DCM_EN));
+	dev_err(i2c->dev, "DEBUGSTAT[0x%x]: 0x%x, DEBUGCTRL[0x%x]: 0x%x\n",
+		OFFSET_DEBUGSTAT,
+		(mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT)),
+		OFFSET_DEBUGCTRL,
+		(mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL)));
+
+	if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
+		dev_err(i2c->dev, "OFFSET_LTIMING[0x%x]: 0x%x\n",
+			OFFSET_LTIMING,
+			mtk_i2c_readw(i2c, OFFSET_LTIMING));
+		dev_err(i2c->dev, "MULTI_DMA[0x%x]: 0x%x\n",
+			OFFSET_MULTI_DMA,
+			(mtk_i2c_readw(i2c, OFFSET_MULTI_DMA)));
+	}
+
+	dev_err(i2c->dev, "OFFSET_INT_FLAG = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_INT_FLAG));
+	dev_err(i2c->dev, "OFFSET_INT_EN = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_INT_EN));
+	dev_err(i2c->dev, "OFFSET_EN = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_EN));
+	dev_err(i2c->dev, "OFFSET_RST = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_RST));
+	dev_err(i2c->dev, "OFFSET_CON = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_CON));
+	dev_err(i2c->dev, "OFFSET_TX_MEM_ADDR = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR));
+	dev_err(i2c->dev, "OFFSET_RX_MEM_ADDR = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
+	dev_err(i2c->dev, "OFFSET_TX_LEN = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_LEN));
+	dev_err(i2c->dev, "OFFSET_RX_LEN = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_RX_LEN));
+	dev_err(i2c->dev, "OFFSET_TX_4G_MODE = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_4G_MODE));
+	dev_err(i2c->dev, "OFFSET_RX_4G_MODE = 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
+}
+
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			       int num, int left_num)
 {
@@ -1034,7 +1126,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	}
 
 	if (ret == 0) {
-		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
+		dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
+		i2c_dump_register(i2c);
 		mtk_i2c_init_hw(i2c);
 		return -ETIMEDOUT;
 	}
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
