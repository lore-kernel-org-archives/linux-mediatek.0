Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8FCC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 08:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B072080C
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 08:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9sPIlpa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZFv7NFOz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B072080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vTX68BZ3sbCNm3UTgAl4QLJnDNFgfLd17YZUEAW7dBk=; b=Y9sPIlpahHgCt7
	CK6wwGrd1e1A05SdgWGm6+VBPJrU2uhp6QrEgB90enb/aYp0mhfvuAYlLKXodmze8CHiwyGTBmCgv
	9YABcijpVWm7DwBreekn0YmdvifsnBve9L0qO87J2D3AYr3tfO3H/Nqslv88ZvGIv8uw1zjy5jhj9
	ZBjk75vvFtC1+7YdadU+5ZgAuTpryS9kjVNudyvtHHcJTpyv7OkEoa3pqJEwXRb64YFh3VbEvIiUV
	ofVZ3WxUPFjlncocmD3FWp+NCQ22f2Po0U7wgyBTdJVeaIA+gqU6KR7/xL0tWYQxwVuKfwWW5y2QM
	FL16Rgs/FWstOQTvcCqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmCET-000865-IZ; Fri, 19 Jun 2020 08:18:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmCEK-0007yD-GR; Fri, 19 Jun 2020 08:18:33 +0000
X-UUID: a686dedb6b2e4248b1ae541270a54c9d-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=orYip2cNeX4jAWulPNxTLp75KkNVytFZUfYQLd232YY=; 
 b=ZFv7NFOzKwkm0EPkaYYn6n4nFwzWMka7xmVFHI25rHIgRJAvLe3mQWi7rFriHLjw9eN9BNEnmQbO18b8fOBNbEPnOBgXc3sg0V75ruDKSLxr43glGaoFQX+dNCAp7ETR4c9/WSg43lx9JmftAB1M7ToqSLRWDS2kNBmSAIwG9+0=;
X-UUID: a686dedb6b2e4248b1ae541270a54c9d-20200619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qiangming.xia@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1040147645; Fri, 19 Jun 2020 00:18:44 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 01:08:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 16:08:25 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 16:08:26 +0800
From: Qiangming Xia <qiangming.xia@mediatek.com>
To: <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: mediatek: Add to support continuous mode
Date: Fri, 19 Jun 2020 16:06:44 +0800
Message-ID: <20200619080643.25269-1-qiangming.xia@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_011832_553078_AE6B4A44 
X-CRM114-Status: GOOD (  11.40  )
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
 Qii Wang <Qii.Wang@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "qiangming.xia" <qiangming.xia@mediatek.com>

    Mediatek i2c controller support for continuous mode,
it allow to transfer once multiple writing messages of equal length.
    For example, a slave need write a serial of non-continuous
offset range in chip,e.g. writing offset 0,offset 2 and offset 4.
Normally, it need three times i2c write operation. However,it can
use once transfer to finish it by using continuous mode.

Change-Id: If06991e3fd32867bdeaacf15bb24864d5c5904d0
Signed-off-by: Qiangming Xia <qiangming.xia@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 67 +++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index deef69e56906..76ec65d869f6 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -97,6 +97,7 @@ enum mtk_trans_op {
 	I2C_MASTER_WR = 1,
 	I2C_MASTER_RD,
 	I2C_MASTER_WRRD,
+	I2C_MASTER_CONTINUOUS_WR,
 };
 
 enum I2C_REGS_OFFSET {
@@ -846,6 +847,9 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 					    OFFSET_TRANSFER_LEN);
 		}
 		mtk_i2c_writew(i2c, I2C_WRRD_TRANAC_VALUE, OFFSET_TRANSAC_LEN);
+	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
+		mtk_i2c_writew(i2c, msgs->len / num, OFFSET_TRANSFER_LEN);
+		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
 	} else {
 		mtk_i2c_writew(i2c, msgs->len, OFFSET_TRANSFER_LEN);
 		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
@@ -896,6 +900,23 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
 		}
 
+		writel((u32)wpaddr, i2c->pdmabase + OFFSET_TX_MEM_ADDR);
+		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
+	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
+		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
+		writel(I2C_DMA_CON_TX, i2c->pdmabase + OFFSET_CON);
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
 		writel((u32)wpaddr, i2c->pdmabase + OFFSET_TX_MEM_ADDR);
 		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
 	} else {
@@ -979,6 +1000,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 				 msgs->len, DMA_FROM_DEVICE);
 
 		i2c_put_dma_safe_msg_buf(dma_rd_buf, msgs, true);
+	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
+		dma_unmap_single(i2c->dev, wpaddr,
+				 msgs->len, DMA_TO_DEVICE);
+
+		kfree(msgs->buf);
 	} else {
 		dma_unmap_single(i2c->dev, wpaddr, msgs->len,
 				 DMA_TO_DEVICE);
@@ -1009,6 +1035,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 {
 	int ret;
 	int left_num = num;
+	int i, j;
+	u8 *dma_multi_wr_buf;
+	struct i2c_msg multi_msg[1];
 	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
 
 	ret = mtk_i2c_clock_enable(i2c);
@@ -1025,6 +1054,44 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 		}
 	}
 
+	if (num > 1) {
+		for (i = 0; i < num - 1; i++) {
+			if (!(msgs[i].flags & I2C_M_RD) && !(msgs[i+1].flags &
+				I2C_M_RD) && (msgs[i].addr == msgs[i+1].addr)
+					&& (msgs[i].len == msgs[i+1].len)) {
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
+				}
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
 	if (i2c->auto_restart && num >= 2 && i2c->speed_hz > I2C_MAX_FAST_MODE_FREQ)
 		/* ignore the first restart irq after the master code,
 		 * otherwise the first transfer will be discarded.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
