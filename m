Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3458C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 15:01:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E8920758
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 15:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHj5h9wt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sKbmuert";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8dOr7n3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E8920758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gjqjS+YBzNkoLzezMxjhdnXnkaTdgW9fBspKrV6F4vo=; b=qHj5h9wtoixNsTUz+8qMgCoHX
	JuIKoGEryMs63ghgaVcFrTUrbJ7oRDJ+wDSIMHh0QfA8pnbYsLcmiNP6AGx7VRYW0hHW4Amv1LP1H
	wHKtRiydhDCougz+ZPWgOPSbnbw20wEale+i85KAweVII2IKCIkrr/agZ7jaYkSx3KSAJK/7YgIen
	n86YUSRj/hRreA1h7NlD/G2gUqgi+a4d1sRfPPyUZ1nyTNPpgMWaZa6hbTyvUvexBaC3kH9ym+wOF
	w7akpgCP883h38/OkpOYauYNNEQPgdX1AiOezxk2nCtsWT2kIIUSZFN4fFQiPpaiO+QNQjrsd08ro
	0bEzI/wuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKNK5-0003Zt-Df; Mon, 21 Sep 2020 15:01:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKNJu-0003Xj-Rq; Mon, 21 Sep 2020 15:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YhCzizBF5F/pTdYI4uKReYnPyQNSLygI/49KaK7rNS4=; b=sKbmuertgFRx1SNXv8sfr7B4kr
 EeysSQg6peM/uELvrpO3SRK4De7xkJGHMOS+dBHG/a9APqEmkb2zEXkelMq6a0EFn91klbLhLsPis
 Xs2zouYfj/E4cLsvfiSoqN6vkaIHqHcwm+RosNz8LpHcB0Z0m/mxrUc0ZevFck7DZFBlZVxoS9n9B
 +pQVpt/19o3rlTojdgfWBwFrLpX/agGbQr18la9+TqkUXhS6I16BAzBwB+BNK5RyIs4JLS/ojPrzM
 i4mE8H7/ROCT8ekxoLx8ZRJmHPNLRzvRRHWHjFz94UKUaFG9NR2V/davmmK42tSceT02qpsFpJXRA
 v3JSKtWg==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKMzu-0000Qr-Lb; Mon, 21 Sep 2020 14:41:01 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B7DD2371F;
 Mon, 21 Sep 2020 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600699252;
 bh=epOgRHJDgXsxln8kuvcmrBtLdvOqe96oF8UpA61L8X0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S8dOr7n3XFo3w/dITei4kEhijo8bA7pfeJjTGLdIoTAzNQHX+9LDRzwxg07Rah27X
 T+lOxryJphhl3GV7UN0LaoBe2vBRH6o9TuF/YXhL7HrJFo3CXn32+5NoA9nFyUlNro
 otRQ1V8+p2AiS1RVz5r22jCdDLLWLnGmrsFfeCgU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 19/20] i2c: mediatek: Send i2c master code at more
 than 1MHz
Date: Mon, 21 Sep 2020 10:40:26 -0400
Message-Id: <20200921144027.2135390-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921144027.2135390-1-sashal@kernel.org>
References: <20200921144027.2135390-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_154055_149357_A87B525F 
X-CRM114-Status: GOOD (  13.92  )
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
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qii Wang <qii.wang@mediatek.com>

[ Upstream commit b44658e755b5a733e9df04449facbc738df09170 ]

The master code needs to being sent when the speed is more than
I2C_MAX_FAST_MODE_PLUS_FREQ, not I2C_MAX_FAST_MODE_FREQ in the
latest I2C-bus specification and user manual.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index deef69e569062..440b12eba1e3c 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -736,7 +736,7 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
 		clk_src = parent_clk / clk_div;
 
-		if (target_speed > I2C_MAX_FAST_MODE_FREQ) {
+		if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 			/* Set master code speed register */
 			ret = mtk_i2c_calculate_speed(i2c, clk_src,
 						      I2C_MAX_FAST_MODE_FREQ,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
