Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D05C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 21:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cD1oXoh/3Z/KfThXtyauLVjeibOT6BRPQ1K9Q4l7F2I=; b=NkYp6ORqcdcH6VF21WmpuEr9c/
	Ib1/rlqnmZoDfbQhum925CRtAYnS8TKzI2vuTxVhfxpHNqv4jtdq4D7IzN7ZvAdo5j5Iau+io0bnk
	gJIg8awHcBgV6Rzapr8SeAQjo8zd1YPFNbn9CYTJk/kdDB4kKGDkqomp407bn8ZiS8oWioQUBFcF/
	CiX4MhJzrsSOkVrQpssfx9coSlO64U85FQPKUc94G+ea4Ty0GyTr/BfgkyW3G1auJO0MdD088b0hW
	Q72MjIXP+rPyxDxfaXnqmL+A76t1SIXXUhLZDC/AO7+wRYrk+jmHRFx3ESUDA4mLpUS0OnFKVFHlO
	MbFCHdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pzL-00510X-2X;
	Thu, 01 Jun 2023 21:37:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pzI-0050xW-29;
	Thu, 01 Jun 2023 21:37:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30B3264A14;
	Thu,  1 Jun 2023 21:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D65C433D2;
	Thu,  1 Jun 2023 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685655459;
	bh=cRNCWYgITY1Avwy3p/OqeMIYf76GSCIWeVOmp7qHdis=;
	h=From:To:Cc:Subject:Date:From;
	b=ExkIxw7gKOEphmOgoz9uN/SxJtg8mfaCbNEEeV3NwHCHLTipif8dod9mhyq567jrs
	 h42rhezz0SUvFIpt5DbaYVzRRnz1Y7A3JFJwT8tcqfFTSorKTEBopguhPjnK2bV0Fa
	 A2G6qCJ8QycLujMc/c3UPLbd82Qen9VnEjbDzYrZNIcG0NBK6x4hFXEWK/IQoxCJ5K
	 NpHTjUtng2RwD524bRqnSh6zL1mZFcRkfo5dzxHYDdULEIUVqxX1Jv6JehPwTor7Av
	 aHL6pNTAzgFm0YtRrU6WPOzPFIYiDo5kFQF+spcu4q+FMWsjtQ/HelhEOYefHFayJf
	 Xgow79I4vUvWw==
From: Arnd Bergmann <arnd@kernel.org>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	irui wang <irui.wang@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	oushixiong <oushixiong@kylinos.cn>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] [v2] media: mtk_jpeg_core: avoid unused-variable warning
Date: Thu,  1 Jun 2023 23:37:22 +0200
Message-Id: <20230601213732.3625642-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_143740_786328_5F40FD33 
X-CRM114-Status: GOOD (  20.05  )
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

From: Arnd Bergmann <arnd@arndb.de>

The mtk8195_jpegenc_drvdata object was added outside of an #ifdef causing
a harmless build warning.

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1879:32: error: 'mtk8195_jpegenc_drvdata' defined but not used [-Werror=unused-variable]
 1879 | static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~

A follow-up patch moved it inside of an #ifdef, which caused more
warnings, and a third patch ended up adding even more #ifdefs. These
were all bogus, since the actual problem here is the incorrect use
of of_ptr(). Since the driver (like any other modern platform driver)
only works in combination with CONFIG_OF, there is no point in hiding
the reference, so just remove that along with all the pointless #ifdef
checks in the driver.

This improves build coverage and avoids running into the same problem
again when another part of the driver gets changed that relies on
the #ifdef blocks to be completely matched.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 4ae47770d57bf ("media: mtk-jpegenc: Fix a compilation issue")
Fixes: da4ede4b7fd6a ("media: mtk-jpeg: move data/code inside CONFIG_OF blocks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 6 +-----
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 4 +---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 4 +---
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 4768156181c99..40cb3cb87ba17 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -28,7 +28,6 @@
 #include "mtk_jpeg_core.h"
 #include "mtk_jpeg_dec_parse.h"
 
-#if defined(CONFIG_OF)
 static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_JPEG,
@@ -102,7 +101,6 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 		.flags		= MTK_JPEG_FMT_FLAG_CAPTURE,
 	},
 };
-#endif
 
 #define MTK_JPEG_ENC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_enc_formats)
 #define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
@@ -1455,7 +1453,6 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops = {
 	SET_RUNTIME_PM_OPS(mtk_jpeg_pm_suspend, mtk_jpeg_pm_resume, NULL)
 };
 
-#if defined(CONFIG_OF)
 static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *ctx)
 {
 	struct mtk_jpegenc_comp_dev *comp_jpeg;
@@ -1951,14 +1948,13 @@ static const struct of_device_id mtk_jpeg_match[] = {
 };
 
 MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
-#endif
 
 static struct platform_driver mtk_jpeg_driver = {
 	.probe = mtk_jpeg_probe,
 	.remove_new = mtk_jpeg_remove,
 	.driver = {
 		.name           = MTK_JPEG_NAME,
-		.of_match_table = of_match_ptr(mtk_jpeg_match),
+		.of_match_table = mtk_jpeg_match,
 		.pm             = &mtk_jpeg_pm_ops,
 	},
 };
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 869068fac5e2f..baa7be58ce691 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -39,7 +39,6 @@ enum mtk_jpeg_color {
 	MTK_JPEG_COLOR_400		= 0x00110000
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id mtk_jpegdec_hw_ids[] = {
 	{
 		.compatible = "mediatek,mt8195-jpgdec-hw",
@@ -47,7 +46,6 @@ static const struct of_device_id mtk_jpegdec_hw_ids[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
-#endif
 
 static inline int mtk_jpeg_verify_align(u32 val, int align, u32 reg)
 {
@@ -653,7 +651,7 @@ static struct platform_driver mtk_jpegdec_hw_driver = {
 	.probe = mtk_jpegdec_hw_probe,
 	.driver = {
 		.name = "mtk-jpegdec-hw",
-		.of_match_table = of_match_ptr(mtk_jpegdec_hw_ids),
+		.of_match_table = mtk_jpegdec_hw_ids,
 	},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 71e85b4bbf127..244018365b6f1 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -46,7 +46,6 @@ static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
 	{.quality_param = 97, .hardware_value = JPEG_ENC_QUALITY_Q97},
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id mtk_jpegenc_drv_ids[] = {
 	{
 		.compatible = "mediatek,mt8195-jpgenc-hw",
@@ -54,7 +53,6 @@ static const struct of_device_id mtk_jpegenc_drv_ids[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);
-#endif
 
 void mtk_jpeg_enc_reset(void __iomem *base)
 {
@@ -377,7 +375,7 @@ static struct platform_driver mtk_jpegenc_hw_driver = {
 	.probe = mtk_jpegenc_hw_probe,
 	.driver = {
 		.name = "mtk-jpegenc-hw",
-		.of_match_table = of_match_ptr(mtk_jpegenc_drv_ids),
+		.of_match_table = mtk_jpegenc_drv_ids,
 	},
 };
 
-- 
2.39.2


