Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578E0C55ABD
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 03:54:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6786207BC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 03:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s1UoFl1B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxxTwDZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6786207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AF85K1pPGiKzMGCJlKqyVwiM7lmP6KXZrN1zo3JsOo8=; b=s1UoFl1BIM3MVUzGcNMKBV/Sh
	OZnGNqplsfe4Os1Mb1EkMBX2ooOMJWXeX8tKqV40E86sWBezg+/satI3vkC50doYJjkldI3rdNYSN
	xUF4NxminUniiM4Hn4w2GD+ByZAFftAz4xd9mpJ6oHSI6gLBHVfdimeDE4V/Ip+O4jXJkg2KqIkRe
	DT07vbq6OtZyH8lH7g010lcHNMNzzFsioIDNbzP3UCAEAW0UeNyWQP8GclcrhdFAyy75tmQPQZV7T
	q3C6m+i/Rc9oeW40+Ms+ifaSBabiQp6zNop6n1YoHfb/9MBW8JZJPx3YJzvmJTi1b93GyyQRQbbHf
	3ZDk0Pi/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcKjt-0001rr-2X; Tue, 10 Nov 2020 03:54:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcKja-0001jV-3o; Tue, 10 Nov 2020 03:54:19 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4742120731;
 Tue, 10 Nov 2020 03:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980457;
 bh=JhdKaFlJpO4qT7Ve/Q6EhS4GgEaPVaOrcbkOBP1wpXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NxxTwDZRc92/4Yead9RK3zL0vzFeBDm2ISHVr/fq0v3g9C8Zliy7KTUEUTayIY0gj
 B5oUEpo180Bm/S4BQYVz6lgdPCht1peyPNV5o7KuWZlRCmIjdurCgR1Zm01YSaByb7
 9NKtjgWggBpxfGtKoIyjEb/kO76aXieZRHM5WFzo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 41/55] i2c: mediatek: move dma reset before i2c
 reset
Date: Mon,  9 Nov 2020 22:53:04 -0500
Message-Id: <20201110035318.423757-41-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110035318.423757-1-sashal@kernel.org>
References: <20201110035318.423757-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_225418_275150_824E9573 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Sasha Levin <sashal@kernel.org>, Wolfram Sang <wsa@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qii Wang <qii.wang@mediatek.com>

[ Upstream commit aafced673c06b7c77040c1df42e2e965be5d0376 ]

The i2c driver default do dma reset after i2c reset, but sometimes
i2c reset will trigger dma tx2rx, then apdma write data to dram
which has been i2c_put_dma_safe_msg_buf(kfree). Move dma reset
before i2c reset in mtk_i2c_init_hw to fix it.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 0cbdfbe605b55..33de99b7bc20c 100644
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
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
