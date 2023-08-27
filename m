Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749A9C71153
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Aug 2023 02:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=23R9/SnCVkK3fwgyNcd20lLwdLOWAMKeg3/I51aC7Fc=; b=XcbPUnnc7moDP3ebv0K8sSqeB5
	PINbMwx/cHrmnjabuElQcIyElind46mlzrUzTEe3PQOGoytFjq9mz35T+IrnrD9Vt31VECdO22QC9
	iNepIhssf243CjAlXvCG2XRTMP79foAmEoD1QKM8FR9VCQIb/p80SDjA8GwJQQ58sKdM4MQrp8mNB
	voXSgYG6wZLcLEcunIvs+L5KjE8bnxKzOAdFRArVDlDoqP+wZXdECFoegrumf1qgO06YtWYTzAxop
	JP7OJyuAqYPL3zglfVLoebMfrShhVzTcQzDxG3hWYxZ+OdtOAqY7sqgzwZoYSE6MdV7SRLmHWvwBe
	g3tHg+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa5IR-007OrN-2j;
	Sun, 27 Aug 2023 02:14:35 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa5IN-007Oqp-0z;
	Sun, 27 Aug 2023 02:14:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qa5I6-0004yC-0s;
	Sun, 27 Aug 2023 02:14:14 +0000
Date: Sun, 27 Aug 2023 03:13:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: [PATCH] i2c: mt65xx: allow optional pmic clock
Message-ID: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_191431_355601_B90B690B 
X-CRM114-Status: GOOD (  15.77  )
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

Using the I2C host controller on the MT7981 SoC requires 4 clocks to
be enabled. One of them, the pmic clk, is only enabled in case
'mediatek,have-pmic' is also set which has other consequences which
are not desired in this case.

Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
is not present and the bus is not used to connect to a pmic, but may
still require to enable the pmic clock.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 1a9b5a068ef1b..a8b5719c33729 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1442,15 +1442,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
 		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
 
+	i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get_optional(&pdev->dev, "pmic");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
+		dev_err(&pdev->dev, "cannot get pmic clock\n");
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
+	}
+
 	if (i2c->have_pmic) {
-		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
-		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
+		if (!i2c->clocks[I2C_MT65XX_CLK_PMIC].clk) {
 			dev_err(&pdev->dev, "cannot get pmic clock\n");
-			return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
+			return -ENODEV;
 		}
 		speed_clk = I2C_MT65XX_CLK_PMIC;
 	} else {
-		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = NULL;
 		speed_clk = I2C_MT65XX_CLK_MAIN;
 	}
 
-- 
2.41.0

