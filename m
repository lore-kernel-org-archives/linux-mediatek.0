Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A80C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 15:54:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B9EE619C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 15:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B9EE619C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fHostlu8Ypc3iaVU5j0AwH9337qvJnGVYV2aZ0JfDNQ=; b=cTBpI0HrfXn39GaEm0RzFRxSQ
	yoldAW/Zy7kn9KHpwuDmZ3ZYE2aKrPcVRCi+ui+/UKxgDsjzzQpNS4uGwnP5oDtdc3EokyU9xzrAH
	p8+74V2nMPb4Ae3hHRXgSiNGBCwG3p/k6SJsx4HozddvqtRLoxszSJ9fXsup9emjmE2S67ZtRS8/f
	ygd6jDSbIPrUqCthD8n2nFCoMb2jAXvTSDbUrYFfajscke/HK9sAV4fs8AC7B4FP6wFdeDkAD8gAg
	S4ujweZuy0O4xMVqOR0QsKzKfWrX0RAisQFof1xNfpt7Njd5Tb4NZl4cXfW+vAgVhu4veft/7fkPk
	XSrIC9JRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGh4-004Gcv-NJ; Tue, 30 Mar 2021 15:54:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGgg-004GYg-CY; Tue, 30 Mar 2021 15:53:56 +0000
X-UUID: 3a940bb1d6144bb29f7d518eb5bbed6d-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ra2tQWislgrrvR/NNOOoxRe0xoVjwCWjHOtfv1mHfLs=; 
 b=D6hOLsg/MHGNArJKE1W6jM63Zkti4CNPCCwZfHQRFqf65/AvqS737uKFbf17+kj7QOnjwhiV8rG18O4akuQFqMILdMZUrEwMcTDiFHCtZ7+/9s/k4nUXoPMFFhTMVwuQrZtXmficshBrC7Tpx0NoE+96ptVSQgZfYJ4aEN0ygvM=;
X-UUID: 3a940bb1d6144bb29f7d518eb5bbed6d-20210330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 327794126; Tue, 30 Mar 2021 07:53:40 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 08:53:38 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Mar 2021 23:53:37 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 30 Mar 2021 23:53:36 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH 3/3] drm/mediatek: dpi: add bus format negociation
Date: Tue, 30 Mar 2021 23:53:30 +0800
Message-ID: <20210330155330.28759-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20210330155330.28759-1-jitao.shi@mediatek.com>
References: <20210330155330.28759-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C82F1249AC34DA01D8B6F8A0C1B09D132640BF19AE22DA65BDDE8C39F907EC832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_165350_988242_C08C1C5A 
X-CRM114-Status: GOOD (  17.24  )
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

Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negociate
the possible output and input formats for the current mode and monitor,
and use the negotiated formats in a basic atomic_check callback.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 96 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 87bb27649c4c..4e45d1b01b0c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -81,6 +81,8 @@ struct mtk_dpi {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_gpio;
 	struct pinctrl_state *pins_dpi;
+	unsigned int in_bus_format;
+	unsigned int out_bus_format;
 	bool ddr_edge_sel;
 	int refcount;
 };
@@ -534,6 +536,92 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	return 0;
 }
 
+#define MAX_OUTPUT_SEL_FORMATS	2
+
+static u32 *mtk_dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	struct drm_display_mode *mode = &crtc_state->mode;
+	u32 *output_fmts;
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
+
+	*num_output_fmts = 0;
+
+	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
+			      GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	/* Default 8bit RGB fallback */
+	if (dpi->conf->dual_edge) {
+		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_2X12_LE;
+		output_fmts[1] =  MEDIA_BUS_FMT_RGB888_2X12_BE;
+		*num_output_fmts = 2;
+	} else {
+		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_1X24;
+		*num_output_fmts = 1;
+	}
+
+	return output_fmts;
+}
+
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	*num_input_fmts = 1;
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+
+	return input_fmts;
+}
+
+static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	struct mtk_dpi *dpi = bridge->driver_private;
+
+	dpi->out_bus_format = bridge_state->output_bus_cfg.format;
+
+	dpi->in_bus_format = bridge_state->input_bus_cfg.format;
+
+	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
+		bridge_state->input_bus_cfg.format,
+		bridge_state->output_bus_cfg.format);
+
+	if (dpi->out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_LE ||
+	    dpi->out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_BE) {
+		dpi->ddr_edge_sel =
+			(dpi->out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_LE) ?
+			 true : false;
+	}
+
+	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
+	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
+	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
+	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
+
+	return 0;
+}
+
 static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
@@ -572,6 +660,9 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.mode_set = mtk_dpi_bridge_mode_set,
 	.disable = mtk_dpi_bridge_disable,
 	.enable = mtk_dpi_bridge_enable,
+	.atomic_check = mtk_dpi_bridge_atomic_check,
+	.atomic_get_output_bus_fmts = mtk_dpi_bridge_atomic_get_output_bus_fmts,
+	.atomic_get_input_bus_fmts = mtk_dpi_bridge_atomic_get_input_bus_fmts,
 };
 
 static void mtk_dpi_start(struct mtk_ddp_comp *comp)
@@ -621,11 +712,6 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		goto err_cleanup;
 	}
 
-	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
-	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
-	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
-
 	return 0;
 
 err_cleanup:
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
