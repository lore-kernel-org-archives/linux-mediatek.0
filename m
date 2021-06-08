Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C61C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 03:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 983D2610E5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 03:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 983D2610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/BwzVSE6zHpksJvy2se/qAXn5T8CzvqzUPrL3bvKu0=; b=yI0b99415pRnEZ
	Czy9+qRMYiPBmjxRr/c3IldkB6x0BRBeJJdxHG4HzUmpStlaY8NDauXWA8RbovBn0Au0so5xLIt9z
	xJ8eT5QfQxp4Epfou2EcHzV39LNaBvvpmX0vBBl+NmkGLapazpfVhpn/7gzNxUYagZMrXPA/IPX2Y
	6fqtkhGK9EG0Wi4t4dmugSF1BYPU7VGA1AWspygwRoucsX2a1jPvqlfdbPPZqQ28ya4mQ7xA3JhHD
	cBUGXUpNGccaPoF7A2sX+07zEZ8UEEmyWhAnkCBDgW4MNWbk2yHM4+z8JuptD8HO5AbOBqurrTDS0
	BTz25BkyQ6lox3n5baRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqSHi-006F2X-Ps; Tue, 08 Jun 2021 03:20:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqSHS-006Eza-Bg; Tue, 08 Jun 2021 03:19:58 +0000
X-UUID: 572c6e5b7bad4394998bcef346610009-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FY7Ce0xJvq4LJ731PRwTtnud7YE8r70EXPGDlBMrlRw=; 
 b=QXH7SGXSXDo2rnClGx+4xtjlKMDdCGUJHTgXsSoLYSrEavnyC/el4OnU5t/7NydNKV1b0rXR6svr8xaNyeeAUoiCUxLvnxfOpMh4WeKwRXHow1r+Z6VPOcueigc6NkkjUz5qfIglq/oLhyTIdlwF+fBZ39iw5srh+AwBLdWgtvo=;
X-UUID: 572c6e5b7bad4394998bcef346610009-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1926612906; Mon, 07 Jun 2021 20:19:51 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 20:17:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 11:17:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 11:17:40 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <qiangming.xia@mediatek.com>, <kewei.xu@mediatek.com>
Subject: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout occurs
Date: Tue, 8 Jun 2021 11:16:39 +0800
Message-ID: <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_201954_436037_57FA61A2 
X-CRM114-Status: GOOD (  13.77  )
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

From: "Kewei.Xu" <kewei.xu@mediatek.com>

When a timeout error occurs in i2c transter, it is usually related
to the i2c/dma IP hardware configuration. Therefore, the purpose of
this patch is to dump the key register values of i2c/dma when a
timeout occurs in i2c for debugging.

Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 97 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e..e65a41e 100644
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
@@ -192,8 +193,9 @@ enum I2C_REGS_OFFSET {
 	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
 	[OFFSET_CLOCK_DIV] = 0x48,
 	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_MULTI_DMA] = 0x84,
 	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
-	[OFFSET_DEBUGSTAT] = 0xe0,
+	[OFFSET_DEBUGSTAT] = 0xe4,
 	[OFFSET_DEBUGCTRL] = 0xe8,
 	[OFFSET_FIFO_STAT] = 0xf4,
 	[OFFSET_FIFO_THRESH] = 0xf8,
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
