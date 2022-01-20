Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3C8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 18:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=of5WkXJdf+2HhjPwGN7BSmUxc4tapIH55uj5E3U6BSU=; b=bjl4xWzgUNFOdx
	BHVzI0xbziaMdHPH6qkGRsICreqVFpRG9Ii8XdfYmR3LrKvzGvwlAYz7khTlydcie24Vs8kgZtaR5
	b1tCuMjOL4mpSfO/TUse5IsNUh0Su0IVbqhaHnyStUwAHDFX+2TG7Uvds6Udc0eOaElaXEhvRjS/Q
	UMOoz8B8IYw4IYYVutiSkML4QdFP7GbvMt/Ho/C0zZVJkI9Kv7uUzLPnNAJxgsz6qKb/u+L9mccPx
	u1HDLK0BCbtug7BCoAFfdYTkScPlolU42A4Kh5X1s3/NRGj3NaqYUrayNhWKS/HnRGHB9clc2sivZ
	3weJ5dzLkmCgbGanirzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAcer-00CtP0-53; Thu, 20 Jan 2022 18:59:41 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAceG-00CtD0-Rt; Thu, 20 Jan 2022 18:59:08 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id C85E46C006AE;
 Thu, 20 Jan 2022 20:59:00 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1642705140; bh=YS/yJ57EWPEjZWHReNFdWuAZ6M+DzTo6MREgxyD6rKU=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-ESPOL:
 from:date:to:cc;
 b=PIs4T7wFqbr/TkH1rfoB4IOe/ENUh6SGcZ1ZTqygmsO3/1tw4tfTeo0LNt2R8NJ9V
 cG6d1+Us/RCihN3O3MaawuN8+/FfjODeCUNuU96a8aDGYfJeWj6ENdQ/sqDS1JI0zJ
 91+o7nAzxtp/Hdba8mXhIe9IzmVxt3ewW4J/ewoA=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id B15736C00771;
 Thu, 20 Jan 2022 20:59:00 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
 by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id XGejEganWRFR; Thu, 20 Jan 2022 20:59:00 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 5B1736C006AE;
 Thu, 20 Jan 2022 20:59:00 +0200 (EET)
From: Boris Lysov <arzamas-16@mail.ee>
To: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: qii.wang@mediatek.com
Subject: [PATCH 2/2] i2c: mediatek: remove mt6577 support
Date: Thu, 20 Jan 2022 21:58:53 +0300
Message-Id: <20220120185853.24266-3-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220120185853.24266-1-arzamas-16@mail.ee>
References: <20220120185853.24266-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +d1m7upSeE2pjkLDN3bfAA8xrSJNWOnm557a3R5egnr/NzCGf04TURS/gR8IQDzn/iM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_105905_216099_5C898BFB 
X-CRM114-Status: GOOD (  12.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mt6577 compatibility was introduced back in 2014 in commit 8452c80d5b4b
("I2C: mediatek: Add driver for MediaTek I2C controller") by Xudong Chen.

The i2c-mt65xx driver relies on DMA since it was first introduced. mt6577 does
not support DMA [1] for I2C and doesn't have dedicated DMA engines for I2C.
Moreover, the entire mt65xx Cortex-A9 SoC family (mt6515, mt6517, mt6575,
and mt6577) which share the same I2C IP doesn't support I2C DMA at all which
makes this particular driver incompatible with these SoCs.

The existing code used mt6577 as a "generic" configuration to be used with
other SoCs such as mt6589 (for quirks), and mt2701/mt6797/mt7623 (in general).

This patch makes mt2701 (which is *actually* supported by this driver) a new
placeholder for generic Mediatek I2C bus configuration.

[1] see references in
https://lists.infradead.org/pipermail/linux-mediatek/2021-October/030333.html

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 drivers/i2c/busses/i2c-mt65xx.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 9ea427f53083..24c94e58dc08 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -298,7 +298,7 @@ static const struct i2c_spec_values fast_mode_plus_spec = {
 	.min_su_dat_ns = 50 + I2C_FAST_MODE_PLUS_BUFFER,
 };
 
-static const struct i2c_adapter_quirks mt6577_i2c_quirks = {
+static const struct i2c_adapter_quirks mt2701_i2c_quirks = {
 	.flags = I2C_AQ_COMB_WRITE_THEN_READ,
 	.max_num_msgs = 1,
 	.max_write_len = 255,
@@ -315,35 +315,35 @@ static const struct i2c_adapter_quirks mt8183_i2c_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 };
 
-static const struct mtk_i2c_compatible mt2712_compat = {
+static const struct mtk_i2c_compatible mt2701_compat = {
+	.quirks = &mt2701_i2c_quirks,
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
 	.dcm = 1,
-	.auto_restart = 1,
-	.aux_len_reg = 1,
-	.timing_adjust = 1,
+	.auto_restart = 0,
+	.aux_len_reg = 0,
+	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
-	.max_dma_support = 33,
+	.max_dma_support = 32,
 };
 
-static const struct mtk_i2c_compatible mt6577_compat = {
-	.quirks = &mt6577_i2c_quirks,
+static const struct mtk_i2c_compatible mt2712_compat = {
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
 	.dcm = 1,
-	.auto_restart = 0,
-	.aux_len_reg = 0,
-	.timing_adjust = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
-	.max_dma_support = 32,
+	.max_dma_support = 33,
 };
 
 static const struct mtk_i2c_compatible mt6589_compat = {
-	.quirks = &mt6577_i2c_quirks,
+	.quirks = &mt2701_i2c_quirks,
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 1,
 	.dcm = 0,
@@ -412,8 +412,8 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 };
 
 static const struct of_device_id mtk_i2c_of_match[] = {
+	{ .compatible = "mediatek,mt2701-i2c", .data = &mt2701_compat },
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
-	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
