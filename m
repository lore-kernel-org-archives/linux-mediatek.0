Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1130BC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBq3QXD/QVD7c5dWiiPwMUvtu1mioKJKBaDEMsW/U/I=; b=ZLEDG2cFqqRlpZ39ESaccNkDwj
	n2dP2qaQHbasMrogIedGlmDzJ6ZYnYrCAU0gA2RMAYhwsie9MTLE7ZKQpgUjebCCBdc2/4Jx7ACrA
	kEGGQ5ozA0mz92Hy5nw8gkbqPnusytR+VgjRlWTzyavPTbKO0mgrSDQIfDwjCgE/9QuQ7c+omyziY
	CwdldxaiMhTzj+D5winMtaTuZKcwl2WNAHn5vMWppCTqQy0kRkjs6ue5uoCHh/akTQKoRvd0Zze3u
	XrUNWGJjE965E2HzqxfPi2rp+d3sCffSQ73tb8qT71yqcklUT8wga80xlxF8elPZAJugKwTS2Ms2P
	ScwNIPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4OQB-000QHe-1O;
	Wed, 31 May 2023 16:11:35 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4OQ9-000QGt-0k;
	Wed, 31 May 2023 16:11:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1q4OQ8-0001Nc-0H;
	Wed, 31 May 2023 16:11:32 +0000
Date: Wed, 31 May 2023 17:11:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Qii Wang <qii.wang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
Cc: =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: [PATCH 2/2] i2c: mt65xx: add additional clocks
Message-ID: <6632ce37e260f5f5cbdd0c6a5da8fe9679352aee.1685549360.git.daniel@makrotopia.org>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_091133_270103_367BF2F3 
X-CRM114-Status: GOOD (  14.28  )
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

On MT7981 additional clocks are required when accessing I2C registers.
Add MCK and PCK optional clocks to i2c-mt65xx driver so we don't have
to always have them enabled, but really only if I2C is used.

Fixes: f82fd1845d309 ("i2c: mediatek: add support for MT7981 SoC")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a43c4d77739ab..cd28cbec2b96d 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -93,6 +93,8 @@
  * @I2C_MT65XX_CLK_DMA:  DMA clock for i2c via DMA
  * @I2C_MT65XX_CLK_PMIC: PMIC clock for i2c from PMIC
  * @I2C_MT65XX_CLK_ARB:  Arbitrator clock for i2c
+ * @I2C_MT65XX_CLK_MCK:  MCK clock for i2c
+ * @I2C_MT65XX_CLK_PCK:  PCK clock for i2c
  * @I2C_MT65XX_CLK_MAX:  Number of supported clocks
  */
 enum i2c_mt65xx_clks {
@@ -100,11 +102,13 @@ enum i2c_mt65xx_clks {
 	I2C_MT65XX_CLK_DMA,
 	I2C_MT65XX_CLK_PMIC,
 	I2C_MT65XX_CLK_ARB,
+	I2C_MT65XX_CLK_MCK,
+	I2C_MT65XX_CLK_PCK,
 	I2C_MT65XX_CLK_MAX
 };
 
 static const char * const i2c_mt65xx_clk_ids[I2C_MT65XX_CLK_MAX] = {
-	"main", "dma", "pmic", "arb"
+	"main", "dma", "pmic", "arb", "mck", "pck"
 };
 
 enum DMA_REGS_OFFSET {
@@ -1444,6 +1448,14 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
 		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
 
+	i2c->clocks[I2C_MT65XX_CLK_MCK].clk = devm_clk_get_optional(&pdev->dev, "mck");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_MCK].clk))
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_MCK].clk);
+
+	i2c->clocks[I2C_MT65XX_CLK_PCK].clk = devm_clk_get_optional(&pdev->dev, "pck");
+	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PCK].clk))
+		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PCK].clk);
+
 	if (i2c->have_pmic) {
 		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
 		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
-- 
2.40.1


