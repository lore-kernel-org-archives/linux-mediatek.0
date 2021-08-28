Return-Path: <SRS0=5qoa=NT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436D8C4320E
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Aug 2021 11:02:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E3160200
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Aug 2021 11:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2E3160200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHsFy2aSb0sM4F9/5yNJ8H5wVYc8tkNxWw4fzH3ux7s=; b=kRHqxkMcIez8o8
	NQT4jWLYjgxvXH0VrWUG+TcVan5/gvgRkGwxys+ik1R75ICSw0EehFruirPpun3jpSR/1v45/UVqh
	wNu/+HU+GllsBAjQgHMoUZozOuSfK4lIx7mDSPiBji3iaV2LK3lFgkqXCS4x9qwi5K8VZ8y9Rwuwp
	JjxeEo1WuB+rvMUM2Qu+xBCMAtwWrXPq4lbyWcnFqgMHl9Vx+CpP8VZhIQNrgBVUCATJZgAJEEwuD
	3+LWs01VjRO04aeAw4f9aqFe+uKIAIIifcVCzIFAYcQAfGpXjvgSrOK0kNoMq8i34Cqu0WnmJ69oW
	tR5qQd49MeyeYnbgAAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJw5r-00E4Bg-MV; Sat, 28 Aug 2021 11:01:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJw5R-00E44U-8x; Sat, 28 Aug 2021 11:01:25 +0000
X-UUID: 684aeb60d9d4453a940d0419e1d52641-20210828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nkzQCE3Tasxw8ULXuwgHL9TubsegQZb3uMW1TBM4Dm4=; 
 b=evd0BVBmePOPzDIhuIzeG3uKMElJ8T9/iqlU6q07OIsbbwDh3AX/EdQtRol+ytZZealN51KQTh4cd+wAnxb7RgJ14zIykw4Ifb6OhUVBnPFIpHEQvF0FYxT+2yI+WvGzbNdEMMSGvoQQ2R5/fFMeHU/moOpbMcPPnjZ8EiUqqiI=;
X-UUID: 684aeb60d9d4453a940d0419e1d52641-20210828
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 187245849; Sat, 28 Aug 2021 04:01:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 28 Aug 2021 03:51:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 28 Aug 2021 18:51:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 28 Aug 2021 18:51:11 +0800
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
Subject: [PATCH v6 3/7] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
Date: Sat, 28 Aug 2021 18:50:55 +0800
Message-ID: <1630147859-17031-4-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_040121_386365_42589588 
X-CRM114-Status: GOOD (  13.35  )
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
 drivers/i2c/busses/i2c-mt65xx.c | 56 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 7a1c538..1aa0ba3 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -129,6 +129,7 @@ enum I2C_REGS_OFFSET {
 	OFFSET_HS,
 	OFFSET_SOFTRESET,
 	OFFSET_DCM_EN,
+	OFFSET_MULTI_DMA,
 	OFFSET_PATH_DIR,
 	OFFSET_DEBUGSTAT,
 	OFFSET_DEBUGCTRL,
@@ -196,6 +197,7 @@ enum I2C_REGS_OFFSET {
 	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
 	[OFFSET_CLOCK_DIV] = 0x48,
 	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_MULTI_DMA] = 0x8c,
 	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
 	[OFFSET_DEBUGSTAT] = 0xe4,
 	[OFFSET_DEBUGCTRL] = 0xe8,
@@ -837,6 +839,57 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	return 0;
 }
 
+static void i2c_dump_register(struct mtk_i2c *i2c)
+{
+	dev_err(i2c->dev, "SLAVE_ADDR: 0x%x, INTR_MASK: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR),
+		mtk_i2c_readw(i2c, OFFSET_INTR_MASK));
+	dev_err(i2c->dev, "INTR_STAT: 0x%x, CONTROL: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_INTR_STAT),
+		mtk_i2c_readw(i2c, OFFSET_CONTROL));
+	dev_err(i2c->dev, "TRANSFER_LEN: 0x%x, TRANSAC_LEN: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN),
+		mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN));
+	dev_err(i2c->dev, "DELAY_LEN: 0x%x, HTIMING: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DELAY_LEN),
+		mtk_i2c_readw(i2c, OFFSET_TIMING));
+	dev_err(i2c->dev, "START: 0x%x, EXT_CONF: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_START),
+		mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
+	dev_err(i2c->dev, "HS: 0x%x, IO_CONFIG: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_HS),
+		mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
+	dev_err(i2c->dev, "DCM_EN: 0x%x, TRANSFER_LEN_AUX: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DCM_EN),
+		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
+	dev_err(i2c->dev, "CLOCK_DIV: 0x%x, FIFO_STAT: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV),
+		mtk_i2c_readw(i2c, OFFSET_FIFO_STAT));
+	dev_err(i2c->dev, "DEBUGCTRL : 0x%x, DEBUGSTAT: 0x%x\n",
+		mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL),
+		mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT));
+	if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
+		dev_err(i2c->dev, "LTIMING: 0x%x, MULTI_DMA: 0x%x\n",
+			mtk_i2c_readw(i2c, OFFSET_LTIMING),
+			mtk_i2c_readw(i2c, OFFSET_MULTI_DMA));
+	}
+	dev_err(i2c->dev, "\nDMA_INT_FLAG: 0x%x, DMA_INT_EN: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_INT_FLAG),
+		readl(i2c->pdmabase + OFFSET_INT_EN));
+	dev_err(i2c->dev, "DMA_EN: 0x%x, DMA_CON: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_EN),
+		readl(i2c->pdmabase + OFFSET_CON));
+	dev_err(i2c->dev, "DMA_TX_MEM_ADDR: 0x%x, DMA_RX_MEM_ADDR: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR),
+		readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
+	dev_err(i2c->dev, "DMA_TX_LEN: 0x%x, DMA_RX_LEN: 0x%x\n",
+		readl(i2c->pdmabase + OFFSET_TX_LEN),
+		readl(i2c->pdmabase + OFFSET_RX_LEN));
+	dev_err(i2c->dev, "DMA_TX_4G_MODE: 0x%x, DMA_RX_4G_MODE: 0x%x",
+		readl(i2c->pdmabase + OFFSET_TX_4G_MODE),
+		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
+}
+
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			       int num, int left_num)
 {
@@ -1065,7 +1118,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
