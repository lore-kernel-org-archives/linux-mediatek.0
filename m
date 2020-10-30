Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FD0C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 12:10:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC482076E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 12:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L/Hllzn9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ucDTi/88"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DC482076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FHYiJLW5nEbxefkdPtMNPsG3qLmkTkTqWjkbf70uJRw=; b=L/Hllzn95UMtGNsOjseq3WqtTW
	p+3+yPESyXa35rcq7r9TgKqzzp0XR3cbIqC9RKvq7TI3zeB9M0ChGBVqWjNn4HCJBDk9U1PEkqlCk
	IZjaeNpGU4UmWcji62g8V92tZop5mwJhD9dr3nFvCmpUgQzyEeXMQK1OVtpVCztcAM4r5JV6pwfJ8
	EC8skKTEpmNtIb6yriB6Xoh7gC+mTvik0wPwAOpyDMF2Fw1S8dvnZcMgQi2qgfsTtB9KQdiLmZ21N
	8qXD/y8Bxx7aNbgbWBS1rkYzNtqJcalKoKk5u5Xv5WrlOlBVpo/1GRsjM0BYFuwqMYgM6Bw2CzMXm
	dsjI9DNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYTE5-0000v5-SE; Fri, 30 Oct 2020 12:09:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYTE0-0000tQ-Mm; Fri, 30 Oct 2020 12:09:46 +0000
X-UUID: 2352950f4d5a4f4dbfa74619e97c39fa-20201030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ToIiaIPerS3D72ArokmIM6oaTzcfLiLc3SIQSu5S6cI=; 
 b=ucDTi/88lvtdsPWqQALsPDdX8fIAkj6w6GaxWkXpDsH97iAONDYKS/cNEdIEUsf/Mo0sAlf869odvsCc6u6tawE89URCU+1nKHFPVoCk9JTyVQ+rAW4N97DsNUfxN5DbqSMg0ZYREVU0T80vu4fe0SmeNQ5NaVXpyzbeJ1sUnwg=;
X-UUID: 2352950f4d5a4f4dbfa74619e97c39fa-20201030
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1328416473; Fri, 30 Oct 2020 03:58:09 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 04:58:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 19:58:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Oct 2020 19:58:05 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH] i2c: mediatek: move dma reset before i2c reset
Date: Fri, 30 Oct 2020 19:58:01 +0800
Message-ID: <1604059081-28197-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_080944_940083_FB949985 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qii Wang <qii.wang@mediatek.com>

The i2c driver default do dma reset after i2c reset, but sometimes
i2c reset will trigger dma tx2rx, then apdma write data to dram
which has been i2c_put_dma_safe_msg_buf(kfree). Move dma reset
before i2c reset in mtk_i2c_init_hw to fix it.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 0cbdfbe..33de99b 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -475,6 +475,10 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
 
+	writel(I2C_DMA_HARD_RST, i2c->pdmabase + OFFSET_RST);
+	udelay(50);
+	writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+
 	mtk_i2c_writew(i2c, I2C_SOFT_RST, OFFSET_SOFTRESET);
 
 	/* Set ioconfig */
@@ -529,10 +533,6 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 
 	mtk_i2c_writew(i2c, control_reg, OFFSET_CONTROL);
 	mtk_i2c_writew(i2c, I2C_DELAY_LEN, OFFSET_DELAY_LEN);
-
-	writel(I2C_DMA_HARD_RST, i2c->pdmabase + OFFSET_RST);
-	udelay(50);
-	writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
 }
 
 static const struct i2c_spec_values *mtk_i2c_get_spec(unsigned int speed)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
