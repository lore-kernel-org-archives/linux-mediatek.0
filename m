Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D787C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 07:30:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9D9208D6
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 07:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n2fY0+Wn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r/AXLo5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E9D9208D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DoAR1vw2y/DAsjQI44AXxL79dRQWm54/bfNR536MY+k=; b=n2fY0+Wn9ZZWk/
	jsU9X8d+dT2qR8qkfVTJ0bM+zIQQltYG8vp6DVoxLWipPpwVT2JBBgjEmM34Wjay0cm+x+GwosGdp
	17/8z0QqLNj/8NmXSJ+huWdpRAdVcsv/ADGLzMeYE8GI0j7yPu19w/m+yZ1dYLAgtjTupNEhRp9yH
	wP3Qale727Be/ovne6x32PKtwio6VJTOc7Yd1PsEApKg6yuaFayKNNjwp3qHaID82XOla69McO/Ie
	iwPrPkmmcPPKmRrapqWeaLNt9RHJHXuUGmBFna+qUMkoG4xVfmHH1Ece6DXMTc+X/9wFm0GlkHjSx
	hNj+M/BYIcSdsX23k1yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWxSz-0004ij-9v; Fri, 08 May 2020 07:30:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWxSr-0004c7-C5; Fri, 08 May 2020 07:30:35 +0000
X-UUID: 7ded1b8c40844115a7eaf89c1ae12b2b-20200507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hMzkDjf4CwNkJ6jDAGDRDS68Rl17O69scTmHX/6AYo8=; 
 b=r/AXLo5sCvJ//SfpE+Gj1fMeE00e6lp9DYA/5WxuE8URNvlYBhnDYVdmKOB78OmSVOX+Sw0xTU08tKI9T19cmGzLPt6hp8PJZw4RB1Gz+SxUdtvTZNvwA8SZ3gB0sIxSunFfbNIpBpoWMQwiGdVCAokSJ6FTZnebnIdU1uh7gq4=;
X-UUID: 7ded1b8c40844115a7eaf89c1ae12b2b-20200507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qiangming.xia@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2077144198; Thu, 07 May 2020 23:30:22 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 00:21:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 15:21:12 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 May 2020 15:21:11 +0800
From: Qiangming Xia <qiangming.xia@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH] i2c: mediatek: Add i2c support for continuous mode
Date: Fri, 8 May 2020 15:18:09 +0800
Message-ID: <20200508071809.10187-1-qiangming.xia@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_003033_422485_AF78D6E8 
X-CRM114-Status: GOOD (  12.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "qiangming.xia" <qiangming.xia@mediatek.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "qiangming.xia" <qiangming.xia@mediatek.com>

    Mediatek i2c controller support for continuous mode, it allow to
transfer multiple write messages once. It combined by
'S + addr(wr) + data + Sr + ... + Sr + S + addr(wr) + data + P'.
    Some slave devices need write many offset ranges, and the offset range
maybe not continuous. For example, need write 'offset_0', 'offset_3' and
'offset_5' 10 bytes, total 30 bytes. Slave device driver usually execute
three times i2c transfer API,i.e,i2c_transfer() to complete it, however,
it can use once transfer to finish it by continuous mode.

Signed-off-by: Qiangming Xia <qiangming.xia@mediatek.com>
Feature: I2C
---
 drivers/i2c/busses/i2c-mt65xx.c | 74 ++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2152ec5f535c..9bab8c44ad58 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -98,6 +98,7 @@ enum mtk_trans_op {
 	I2C_MASTER_WR = 1,
 	I2C_MASTER_RD,
 	I2C_MASTER_WRRD,
+	I2C_MASTER_CONTINUOUS_WR,
 };
 
 enum I2C_REGS_OFFSET {
@@ -619,6 +620,9 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 					    OFFSET_TRANSFER_LEN);
 		}
 		mtk_i2c_writew(i2c, I2C_WRRD_TRANAC_VALUE, OFFSET_TRANSAC_LEN);
+	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
+		mtk_i2c_writew(i2c, msgs->len / num, OFFSET_TRANSFER_LEN);
+		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
 	} else {
 		mtk_i2c_writew(i2c, msgs->len, OFFSET_TRANSFER_LEN);
 		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
@@ -671,7 +675,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 		writel((u32)wpaddr, i2c->pdmabase + OFFSET_TX_MEM_ADDR);
 		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
-	} else {
+	} else if (i2c->op == I2C_MASTER_WRRD) {
 		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_INT_FLAG);
 		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_CON);
 
@@ -722,6 +726,24 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 		writel((u32)rpaddr, i2c->pdmabase + OFFSET_RX_MEM_ADDR);
 		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
 		writel((msgs + 1)->len, i2c->pdmabase + OFFSET_RX_LEN);
+	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
+		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
+		writel(I2C_DMA_CON_TX, i2c->pdmabase + OFFSET_CON);
+
+		wpaddr = dma_map_single(i2c->dev, msgs->buf,
+					msgs->len, DMA_TO_DEVICE);
+		if (dma_mapping_error(i2c->dev, wpaddr)) {
+			kfree(msgs->buf);
+			return -ENOMEM;
+		}
+
+		if (i2c->dev_comp->support_33bits) {
+			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
+			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
+		}
+
+		writel((u32)wpaddr, i2c->pdmabase + OFFSET_TX_MEM_ADDR);
+		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
 	}
 
 	writel(I2C_DMA_START_EN, i2c->pdmabase + OFFSET_EN);
@@ -752,7 +774,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 				 msgs->len, DMA_FROM_DEVICE);
 
 		i2c_put_dma_safe_msg_buf(dma_rd_buf, msgs, true);
-	} else {
+	} else if (i2c->op == I2C_MASTER_WRRD) {
 		dma_unmap_single(i2c->dev, wpaddr, msgs->len,
 				 DMA_TO_DEVICE);
 		dma_unmap_single(i2c->dev, rpaddr, (msgs + 1)->len,
@@ -760,6 +782,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 		i2c_put_dma_safe_msg_buf(dma_wr_buf, msgs, true);
 		i2c_put_dma_safe_msg_buf(dma_rd_buf, (msgs + 1), true);
+	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
+		dma_unmap_single(i2c->dev, wpaddr,
+				 msgs->len, DMA_TO_DEVICE);
+
+		kfree(msgs->buf);
 	}
 
 	if (ret == 0) {
@@ -783,6 +810,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	int ret;
 	int left_num = num;
 	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
+	struct i2c_msg multi_msg[1];
+	u8 *dma_multi_wr_buf;
+	int j;
 
 	ret = mtk_i2c_clock_enable(i2c);
 	if (ret)
@@ -798,6 +828,46 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 		}
 	}
 
+	if (num > 1) {
+		for (int i = 0; i < num - 1; i++) {
+			if (!(msgs[i].flags & I2C_M_RD) &&
+				!(msgs[i+1].flags & I2C_M_RD) &&
+					(msgs[i].addr == msgs[i+1].addr) &&
+						(msgs[i].len ==
+							msgs[i+1].len)) {
+				continue;
+			} else
+				break;
+		}
+		if (i >= num - 1) {
+			i2c->op = I2C_MASTER_CONTINUOUS_WR;
+			j = 0;
+			dma_multi_wr_buf = kzalloc(msgs->len * num, GFP_KERNEL);
+			if (!dma_multi_wr_buf) {
+				ret =  -ENOMEM;
+				goto err_exit;
+			}
+			multi_msg->addr  = msgs->addr;
+			multi_msg->len   = msgs->len * num;
+			multi_msg->buf   = dma_multi_wr_buf;
+			multi_msg->flags  = 0;
+			while (j < num) {
+				memcpy(dma_multi_wr_buf + msgs->len * j,
+							msgs->buf, msgs->len);
+				j++;
+				msgs++;
+			}
+
+			i2c->ignore_restart_irq = false;
+			ret = mtk_i2c_do_transfer(i2c, multi_msg, num, 0);
+			if (ret < 0)
+				goto err_exit;
+			ret = num;
+				goto err_exit;
+
+		}
+	}
+
 	if (i2c->auto_restart && num >= 2 && i2c->speed_hz > MAX_FS_MODE_SPEED)
 		/* ignore the first restart irq after the master code,
 		 * otherwise the first transfer will be discarded.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
