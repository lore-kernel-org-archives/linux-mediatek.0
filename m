Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D64DC54E76
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=frK0u/nmlr4l9kb1/HtiMEtwk4uzssC9lejFqdb/3kc=; b=NRT163qR/gM0zcgj6XMoLVbm7a
	oSb77VodtSjgxPaEf4Rpv/gYMldZwe6eWByLWjX28WrsSaKXR8RDoYOAQLpvgj/8NjI1YIFyx5en9
	nK0BepbxchJfC/vdf4f0dKrtp/pFwuWEJRISDoFHgNMA+YvAqtUpgPAqTkQg91PNw6JM5PjIB1EA5
	o+1xtAZIahUkF05Pv3gzeAZGU+t1Hi4RtXA5DPXgWP6xSPeEfLnwP23WpFJc7yDsyuYiowYc0Ojni
	Q5Vw6BrHBpvoz69shbS8w9NnG0uSR2VXbNxNLNhXvyPH2YUh8f9ENpDpmdxASmp5H0wFd1rDD4Vm4
	S7EKycLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHpjg-00FG0j-JL; Tue, 17 Jan 2023 17:27:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHpjW-00FFy4-Ee; Tue, 17 Jan 2023 17:26:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACE7A614EC;
	Tue, 17 Jan 2023 17:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24485C433D2;
	Tue, 17 Jan 2023 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673976409;
	bh=EXkWvmS2L/OCsuWKSVec76+Ewe99CqDEoweaQMO5UgY=;
	h=From:To:Cc:Subject:Date:From;
	b=XfuwvSBN/Ec/MGZH+bwy8rk40+MfcdkaBuBmCIerqEwcfsMCw/8ceAp8tYUaJ88za
	 uxGDbHfaE94z6a5DtAxN2aUGK0JYa/oUXEerODPJF+ljv8NbcqR4XRQZLROgerpOKN
	 KMei4jmesJ/Vde1NipQU81cUacWsg6q2bPhZf0CBhpBtNHfKmZoO04D0qVnFIvm4HK
	 7JH/rhANh9egfwJ4A1Rw/UoIcEZY1GrdaX2XLXSEQfJgK/kegd61gMR9YQpF8Kwcj9
	 kDbCbzZ1GpL7EcDBMpsTvtTO9VBzXDHizLxUAof5jYRq5amzxNbnpsZQtz7QYYVzYI
	 26ckpwQCVJRfg==
From: Arnd Bergmann <arnd@kernel.org>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	kyrie wu <kyrie.wu@mediatek.com>,
	irui wang <irui.wang@mediatek.com>,
	Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk_jpeg_core: avoid unused-variable warning
Date: Tue, 17 Jan 2023 18:26:33 +0100
Message-Id: <20230117172644.3044265-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_092650_532257_AB822170 
X-CRM114-Status: GOOD (  16.07  )
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

The only reference to mtk8195_jpegenc_drvdata is inside of an #ifdef:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1879:32: error: 'mtk8195_jpegenc_drvdata' defined but not used [-Werror=unused-variable]
 1879 | static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~

Fix this by just removing the #ifdef and the corresponding
of_match_ptr(). They don't actually serve any purpose here since the
driver is only usable when CONFIG_OF is enabled, and build testing
without that is not a problem.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 969516a940ba..bd12e73492e5 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1898,7 +1898,6 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
@@ -1924,14 +1923,13 @@ static const struct of_device_id mtk_jpeg_match[] = {
 };
 
 MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
-#endif
 
 static struct platform_driver mtk_jpeg_driver = {
 	.probe = mtk_jpeg_probe,
 	.remove = mtk_jpeg_remove,
 	.driver = {
 		.name           = MTK_JPEG_NAME,
-		.of_match_table = of_match_ptr(mtk_jpeg_match),
+		.of_match_table = mtk_jpeg_match,
 		.pm             = &mtk_jpeg_pm_ops,
 	},
 };
-- 
2.39.0


