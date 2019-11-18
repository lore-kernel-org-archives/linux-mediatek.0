Return-Path: <SRS0=+oxs=ZK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C8BC43215
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 17:49:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63F2A21934
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 17:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HAvLfl7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63F2A21934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=ZNIJrWbhflwRBCuXV6moaG5Lb3YcvgfhiA1oMim+kJk=; b=HAv
	Lfl7SQ0EydX/2ciWyhushrzATKCIJgVHfo6kwVBrj/JlwodwlxkGIiFTo7uiL7k381oOQkKrCuebX
	y1lyN8CUQ10JPTsNXa0TPuEwdcWaaFBgp4DxmEvGHabJXz0uWM+OFVH6dJjCeKU+6N9FsJ/XxLLyu
	zykjXNRmlsS4KGnt20WgqFMH2kFDKYTno12KpMdDPeMoSIVBmQNcqWMkrKwE+nuXidq9LGC1m91hc
	/pGakcCMnHSixcMYG+Gmu0OZWBvsEiVT96mLnmqlawm60SbqIrXjThCvTLG/N0roTfI+1rXFtM2uF
	4Y+cf3hxuxqnAGGat4eNzd03PItZxnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWl9I-0002uM-DY; Mon, 18 Nov 2019 17:49:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWl97-0002kY-7r; Mon, 18 Nov 2019 17:49:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EE9EDA7;
 Mon, 18 Nov 2019 09:49:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72FE23F703;
 Mon, 18 Nov 2019 09:49:02 -0800 (PST)
Date: Mon, 18 Nov 2019 17:49:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Luhua Xu <luhua.xu@mediatek.com>
Subject: Applied "spi: mediatek: add SPI_CS_HIGH support" to the spi tree
In-Reply-To: <1574053037-26721-2-git-send-email-luhua.xu@mediatek.com>
Message-Id: <applied-1574053037-26721-2-git-send-email-luhua.xu@mediatek.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_094905_370761_80B70C7D 
X-CRM114-Status: GOOD (  18.19  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Leilk Liu <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Allison Randal <allison@lohutok.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Enrico Weigelt <info@metux.net>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The patch

   spi: mediatek: add SPI_CS_HIGH support

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From ae7c2d342a10dbef1e054482f46498b6282a1df0 Mon Sep 17 00:00:00 2001
From: Luhua Xu <luhua.xu@mediatek.com>
Date: Mon, 18 Nov 2019 12:57:16 +0800
Subject: [PATCH] spi: mediatek: add SPI_CS_HIGH support

Change to use SPI_CS_HIGH to support spi CS polarity setting
for chips support enhance_timing.

Signed-off-by: Luhua Xu <luhua.xu@mediatek.com>
Link: https://lore.kernel.org/r/1574053037-26721-2-git-send-email-luhua.xu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mt65xx.c                 | 12 ++++++++++--
 include/linux/platform_data/spi-mt65xx.h |  1 -
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 25fe149a8d9a..6783e12c40c2 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -139,7 +139,6 @@ static const struct mtk_spi_compatible mt8183_compat = {
  * supplies it.
  */
 static const struct mtk_chip_config mtk_default_chip_info = {
-	.cs_pol = 0,
 	.sample_sel = 0,
 };
 
@@ -230,10 +229,12 @@ static int mtk_spi_prepare_message(struct spi_master *master,
 #endif
 
 	if (mdata->dev_comp->enhance_timing) {
-		if (chip_config->cs_pol)
+		/* set CS polarity */
+		if (spi->mode & SPI_CS_HIGH)
 			reg_val |= SPI_CMD_CS_POL;
 		else
 			reg_val &= ~SPI_CMD_CS_POL;
+
 		if (chip_config->sample_sel)
 			reg_val |= SPI_CMD_SAMPLE_SEL;
 		else
@@ -264,6 +265,9 @@ static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 	u32 reg_val;
 	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
 
+	if (spi->mode & SPI_CS_HIGH)
+		enable = !enable;
+
 	reg_val = readl(mdata->base + SPI_CMD_REG);
 	if (!enable) {
 		reg_val |= SPI_CMD_PAUSE_EN;
@@ -646,6 +650,10 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	mdata = spi_master_get_devdata(master);
 	mdata->dev_comp = of_id->data;
+
+	if (mdata->dev_comp->enhance_timing)
+		master->mode_bits |= SPI_CS_HIGH;
+
 	if (mdata->dev_comp->must_tx)
 		master->flags = SPI_MASTER_MUST_TX;
 
diff --git a/include/linux/platform_data/spi-mt65xx.h b/include/linux/platform_data/spi-mt65xx.h
index f0e6d6483e62..65fd5ffd257c 100644
--- a/include/linux/platform_data/spi-mt65xx.h
+++ b/include/linux/platform_data/spi-mt65xx.h
@@ -11,7 +11,6 @@
 
 /* Board specific platform_data */
 struct mtk_chip_config {
-	u32 cs_pol;
 	u32 sample_sel;
 };
 #endif
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
