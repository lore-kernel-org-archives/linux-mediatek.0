Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4879EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 21:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdHoXj7LTtKTlBRs+Qe41S8bC2nxi1BGxlIB7qFYX9w=; b=zFJfAWorL8t3Cg05ohGB7L/lo2
	rZ1Cqc5/G+bP9rUuRyNFob2kdiU4hv8qyElXBFUktOJ44Dv8x3MbdeiCQs7EFsYXuinYJKl1HG5rQ
	5GXqiuPYAJa8xtmDwGasQAQnpq81KFGSjWE0ifV0rxszkSr7DzHwGUTqPd+H35UVVMZ5vWifRxy1w
	H76DY452m0zoFaPPSPjEamW9c6kILdQmQGB4zmj0x1VjcDsi4ym1rfamUU8hG7r4GhMQcFjfsgnfj
	EVm5aYP/4Y6rYSftX+FyjuG3GYXaYmIrS8n83e7eKtitVLlgOllOPgu24yrGV4gM8PRnOrHU4DWGx
	UdNbAYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHAJs-00HAPK-0Y;
	Wed, 05 Jul 2023 21:45:52 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9MJ-00H3An-12;
	Wed, 05 Jul 2023 20:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1688589826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdHoXj7LTtKTlBRs+Qe41S8bC2nxi1BGxlIB7qFYX9w=;
	b=vP1jjktMDkBjUHWSYGsrjpRWCKmsEHpS2aMTIIcNJNGe6JTO196qZRBWDzdmYBcjVol7Uu
	yFmupHehMchlsLFmOfZff0MdvmZFdukemhU6NaiO2De/YgQZTiGIFqVfTRpensvBeWollP
	K/OTRACOMOfN/C1Tui1ZPppF5jmY16k=
From: Paul Cercueil <paul@crapouillou.net>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 13/23] i2c: mt65xx: Remove #ifdef guards for PM related functions
Date: Wed,  5 Jul 2023 22:43:04 +0200
Message-Id: <20230705204314.89800-14-paul@crapouillou.net>
In-Reply-To: <20230705204314.89800-1-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_134419_519756_DCC225D5 
X-CRM114-Status: GOOD (  13.72  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
Cc: Qii Wang <qii.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/i2c/busses/i2c-mt65xx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 7ca3f2221ba6..21cc39e35cf6 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1514,7 +1514,6 @@ static void mtk_i2c_remove(struct platform_device *pdev)
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_i2c_suspend_noirq(struct device *dev)
 {
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
@@ -1544,11 +1543,10 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops mtk_i2c_pm = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
-				      mtk_i2c_resume_noirq)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
+				  mtk_i2c_resume_noirq)
 };
 
 static struct platform_driver mtk_i2c_driver = {
@@ -1556,7 +1554,7 @@ static struct platform_driver mtk_i2c_driver = {
 	.remove_new = mtk_i2c_remove,
 	.driver = {
 		.name = I2C_DRV_NAME,
-		.pm = &mtk_i2c_pm,
+		.pm = pm_sleep_ptr(&mtk_i2c_pm),
 		.of_match_table = mtk_i2c_of_match,
 	},
 };
-- 
2.40.1


