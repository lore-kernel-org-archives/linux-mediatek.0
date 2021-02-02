Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E67C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 15:07:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 604DA64F9C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 15:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 604DA64F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vO9ambbppoF27SZ0ITB0uQYtgm3Tn8ohqXuA/h1EtCE=; b=VRxhO3rcvdYLrIKFV2rBDGicj
	DdIZwZtaF1edGMbiFrK+G+2BM708tWXc2Jwu0fulMjA4DvDS4c2y4BQ3G94GAke0rM7L8jYEQV21J
	mCUk6lzOinLKhK+zYD+OIzsZ4nQ2qHqt4E8LmIUpXDP/rxr6TSOGW8DKAOuovX8BBSdIVWM5/OZ9l
	PjH5t8ozSpr1Icqcvi2k4eaak1gwPFZxIZPbZjQO/eUksVTFe8uT9wywGVl2mzdTbYW5sp7Dmo5bg
	HsCF6kz+GRhdFe8cejourPTln+r7RFnfBpuYrqIT+3G8VxGyuLnf9i//tadUkDOPXtf9umJ4XA+Tl
	HNPgSDGhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6xGx-00063k-CI; Tue, 02 Feb 2021 15:07:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6xGr-00061w-4f; Tue, 02 Feb 2021 15:07:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E58E64F8C;
 Tue,  2 Feb 2021 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612278432;
 bh=shVqPPqyjvLyXvenPIH3SbmJafIFAqzK3uuCfdW0Yzw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RpK3S+Uv9lP6fenuHGEaEImuCqAs5js9YkurUmdxS/6h1wEcqMld9CZs5kj0y/hu5
 tOyURjX9y93vXXSvL2ywM+ozJ1e1pve+UKbu5JGPjeSI7n6bKLm4ZhYqbOXH4NLRpt
 MQM5l99/mayWKczsxKyOvMvPe2KjzHJ516sC74WcVZoHEq8CF4wYb8rWtjR95SZ7XA
 IZ8sDuAVGrSjahvXRjDHlq8GRQ+EfiWEBtqSgFzm/91FBGo1v2TF4qlJLwMqaAlne7
 N/PJrRausoo+aL1AHNJFa0cup3rgcfSmT3v3lZBBnfIQFs/iD9YGhd4kxtmXuZvcf/
 aBPJXoMZBZRbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 16/17] i2c: mediatek: Move suspend and resume
 handling to NOIRQ phase
Date: Tue,  2 Feb 2021 10:06:50 -0500
Message-Id: <20210202150651.1864426-16-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210202150651.1864426-1-sashal@kernel.org>
References: <20210202150651.1864426-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_100713_262810_A5177C52 
X-CRM114-Status: GOOD (  13.64  )
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

[ Upstream commit de96c3943f591018727b862f51953c1b6c55bcc3 ]

Some i2c device driver indirectly uses I2C driver when it is now
being suspended. The i2c devices driver is suspended during the
NOIRQ phase and this cannot be changed due to other dependencies.
Therefore, we also need to move the suspend handling for the I2C
controller driver to the NOIRQ phase as well.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5a9f0d17f52c8..e1ef0122ef759 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1008,7 +1008,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	mtk_i2c_clock_disable(i2c);
 
 	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
-			       IRQF_TRIGGER_NONE, I2C_DRV_NAME, i2c);
+			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
+			       I2C_DRV_NAME, i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Request I2C IRQ %d fail\n", irq);
@@ -1035,7 +1036,16 @@ static int mtk_i2c_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int mtk_i2c_resume(struct device *dev)
+static int mtk_i2c_suspend_noirq(struct device *dev)
+{
+	struct mtk_i2c *i2c = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_suspended(&i2c->adap);
+
+	return 0;
+}
+
+static int mtk_i2c_resume_noirq(struct device *dev)
 {
 	int ret;
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
@@ -1050,12 +1060,15 @@ static int mtk_i2c_resume(struct device *dev)
 
 	mtk_i2c_clock_disable(i2c);
 
+	i2c_mark_adapter_resumed(&i2c->adap);
+
 	return 0;
 }
 #endif
 
 static const struct dev_pm_ops mtk_i2c_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, mtk_i2c_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
+				      mtk_i2c_resume_noirq)
 };
 
 static struct platform_driver mtk_i2c_driver = {
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
