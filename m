Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75837C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 03:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVBqYKY0KejdXpnJ5KiJIiiDaD1+aGfRkZsqhPLGhAM=; b=ytILD8ONUb+GYAjYiNF2pfsJ5X
	/EB21dY6/R5E/PnayXmCAkKZrD6y6FqgrzqjtgxPPJwjOd2N5/PA28zfAv+0pXbZCjT34APTaPKCQ
	qxN4pc7JSnmrrh4vA9Lu4OKliRaEMQr32QS/rY0IBdCjRiRi2SpHLar4queMi0GxWMOL3X5JVmMAy
	w+eFnBZvCaZm6E+QRDiJv6c2d454H1Gr4v6e7lLyRc+ORTxEqAAJRvr05e5IXdbSYgbUAmvX1Z9wy
	GSvBl6iJb+H6GcS3EzvqoLAId4s5DoAPkrXSIYsI4YzGT41Amvw3G71U6AUliyaEtHvQbNPz2VCnw
	6lOevU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Zle-00HYJL-SW; Fri, 24 Jun 2022 03:13:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4ZlG-00HY8k-MH; Fri, 24 Jun 2022 03:13:37 +0000
X-UUID: 28f12a46b18f4ba9a31b653c11091c18-20220623
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:0104ee2a-4e79-40a8-94fa-4f66fe5f1bc2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:a0ed5638-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 28f12a46b18f4ba9a31b653c11091c18-20220623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 850575803; Thu, 23 Jun 2022 20:13:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jun 2022 20:09:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 24 Jun 2022 11:09:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 24 Jun 2022 11:09:50 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v14 12/15] drm/mediatek: dpi: Add YUV422 output support
Date: Fri, 24 Jun 2022 11:09:43 +0800
Message-ID: <20220624030946.14961-13-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_201334_757830_321E58D5 
X-CRM114-Status: GOOD (  16.86  )
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

Dp_intf supports YUV422 as output format. In MT8195 Chrome project,
YUV422 output format is used for 4K resolution.

To support this, it is also needed to support color format transfer.
Color format transfer is a new feature for both dpi and dpintf of MT8195.

The input format could be RGB888 and output format for dp_intf should be
YUV422. Therefore, we add a mtk_dpi_matrix_sel() helper to update the
DPI_MATRIX_SET register depending on the color format.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 34 ++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 9e4250356342..438bf3bc5e4a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -128,6 +128,7 @@ struct mtk_dpi_yc_limit {
  * @num_output_fmts: Quantity of supported output formats.
  * @is_ck_de_pol: Support CK/DE polarity.
  * @swap_input_support: Support input swap function.
+ * @color_fmt_trans_support: Enable color format transfer.
  * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
  *		    (no shift).
  * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
@@ -144,6 +145,7 @@ struct mtk_dpi_conf {
 	u32 num_output_fmts;
 	bool is_ck_de_pol;
 	bool swap_input_support;
+	bool color_fmt_trans_support;
 	u32 dimension_mask;
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
@@ -412,6 +414,31 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
 		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
 }
 
+static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi,
+			       enum mtk_dpi_out_color_format format)
+{
+	u32 matrix_sel = 0;
+
+	if (!dpi->conf->color_fmt_trans_support) {
+		dev_info(dpi->dev, "matrix_sel is not supported.\n");
+		return;
+	}
+
+	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
+	case MTK_DPI_COLOR_FORMAT_XV_YCC:
+		if (dpi->mode.hdisplay <= 720)
+			matrix_sel = 0x2;
+		break;
+	default:
+		break;
+	}
+	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
+}
+
 static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 					enum mtk_dpi_out_color_format format)
 {
@@ -419,6 +446,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
@@ -426,6 +454,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, true);
 		else
@@ -673,7 +702,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
 	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
 	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
+	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
+		dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
+	else
+		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 3a02fabe1662..cca0dccb84a2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -217,4 +217,7 @@
 
 #define EDGE_SEL_EN			BIT(5)
 #define H_FRE_2N			BIT(25)
+
+#define DPI_MATRIX_SET		0xB4
+#define INT_MATRIX_SEL_MASK		GENMASK(4, 0)
 #endif /* __MTK_DPI_REGS_H */
-- 
2.18.0


