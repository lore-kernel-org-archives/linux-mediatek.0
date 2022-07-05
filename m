Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33747C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH7bj2sO0ejbVlRxCPnKMyFE33uS4Uls0uDUIVazivU=; b=EFE08S63pTszMAnrai4Penanm9
	H5h6gs/fnV1l5/peeEPt+X9IW8S5w0TQybP4UIOWxMPunyYxJcg9kpa9QT1ppAouz2mu+rWPnnC4W
	DhQ/Ht0Rzjrhf3K/1m9TGMw/OUbA6GdGdA25z6vqf08GRJA4vIUIjuV5y96c8M9rrbkxZU/Ve22nd
	nrunxkFGskACyFB2dmvCPr9ftQCBs9uQU9LVC/h6qMTw0ba/k6oQLGLDUOx/jUVie6CqxfRbX5fE6
	nkGt0N3EGD2HiCE6uKVASikV2cvfQaKnPJL47KbaVJZ84AW70V1ubWf8hTwNcResrCTWDdKgRDjwZ
	mzWV44kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fmO-00H9eG-Tz; Tue, 05 Jul 2022 10:27:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8flz-00H9VN-TH; Tue, 05 Jul 2022 10:27:17 +0000
X-UUID: c047bccae84041e68ca431a8ef76050d-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:db68fa26-d597-4b98-9209-16b94a391b8f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:50ac7563-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c047bccae84041e68ca431a8ef76050d-20220705
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 510351308; Tue, 05 Jul 2022 03:27:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 5 Jul 2022 18:25:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 5 Jul 2022 18:25:33 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <xinlei.lee@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v16 4/5] drm/mediatek: dpi: Add pixels_per_iter config support
Date: Tue, 5 Jul 2022 18:25:29 +0800
Message-ID: <20220705102530.1344-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220705102530.1344-1-rex-bc.chen@mediatek.com>
References: <20220705102530.1344-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_032716_007083_823FE6EB 
X-CRM114-Status: GOOD (  14.51  )
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

The quantity of output for one iteration could be different for dpi and
dp_intf. For dp_intf, it's 4 pixels for one iteration it's 1 pixel for one
iteration for dpi. Therefore, we add a new config "pixels_per_iter" to
control quantity of transferred pixels per iteration.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a1dcb3089c3a..5f71a68c6a0b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -132,6 +132,7 @@ struct mtk_dpi_yc_limit {
  * @channel_swap_shift: Shift value of channel swap.
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
+ * @pixels_per_iter: Quantity of transferred pixels per iteration.
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -149,6 +150,7 @@ struct mtk_dpi_conf {
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
+	u32 pixels_per_iter;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -522,7 +524,14 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	clk_set_rate(dpi->tvd_clk, pll_rate);
 	pll_rate = clk_get_rate(dpi->tvd_clk);
 
+	/*
+	 * Depending on the IP version, we may output a different amount of
+	 * pixels for each iteration: divide the clock by this number and
+	 * adjust the display porches accordingly.
+	 */
 	vm.pixelclock = pll_rate / factor;
+	vm.pixelclock /= dpi->conf->pixels_per_iter;
+
 	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
 	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
 		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
@@ -541,9 +550,16 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
 	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
-	hsync.sync_width = vm.hsync_len;
-	hsync.back_porch = vm.hback_porch;
-	hsync.front_porch = vm.hfront_porch;
+
+	/*
+	 * Depending on the IP version, we may output a different amount of
+	 * pixels for each iteration: divide the clock by this number and
+	 * adjust the display porches accordingly.
+	 */
+	hsync.sync_width = vm.hsync_len / dpi->conf->pixels_per_iter;
+	hsync.back_porch = vm.hback_porch / dpi->conf->pixels_per_iter;
+	hsync.front_porch = vm.hfront_porch / dpi->conf->pixels_per_iter;
+
 	hsync.shift_half_line = false;
 	vsync_lodd.sync_width = vm.vsync_len;
 	vsync_lodd.back_porch = vm.vback_porch;
@@ -852,6 +868,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.support_direct_pin = true,
@@ -869,6 +886,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.support_direct_pin = true,
@@ -885,6 +903,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.support_direct_pin = true,
@@ -901,6 +920,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.support_direct_pin = true,
-- 
2.18.0


