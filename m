Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE944C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 13:36:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F913611AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 13:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F913611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BTdkPsEXUp+VQ/ZjVv43fVfQY8Hn4qec0tC7W9tc3aI=; b=hX8ZKGlnTpsYcFZQAye3lr1Br
	280fRVKNw4wFnI2FhMrcQ5rwJFmh3gJeEkBv8zRmcZA0/rlDd6WJiJNgvxxvLzbSJmRl9iTX36T/i
	XNnquqIuRdpNA7BMfgJrY/3fyWPc4lmKcY17i4YlyfJwjy437KqCzMzqXG4lKiguVCCEZ46GBjk5v
	Dkx/Ef38YUnv/VHAspL2rTgYBrL6WzmeP8o6GWrsRRG8zPuGsWuyMYnQ8Dsw+Ct2Z3egHZPyOIN6U
	UK2vcWa6PHZSLi7QQf0Dna0MLV7MvbjHPHFww4eYiJ/FqkNDYMNireGTPcolhdNlOF6ofDxyMwLFS
	/LIfXkliw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWfgn-00ClPk-NS; Wed, 14 Apr 2021 13:36:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfg8-00ClJZ-9M; Wed, 14 Apr 2021 13:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=uN6yUsD7+8n8xQYrHK/WaZBOUivkNg96UL8SMy8kerA=; b=BubXFPejr2RHNLwORYWcqcsN77
 Q3y6GKf5aJQ/1Wf0l9aeSyTn/+J1adhk120QU/u7knaSiYoFM7LhZDoX3wGjR+GAV0sazVAk+Pzvu
 N7RexjHBDx+DV2h8Zeu4fTnQ6RDmHdc1NNCApLFeVFPVQgHVIet01e7sciGX2CF+KOUBtZha1TkiM
 PerA9FpKEo2RKOyazzIBIPa1DJwiahs4eYcAJOrdiINMEdNljHThREirMjiNTmOoi0280ptZLp4ou
 1FPIXBFJbERjMJHLMvM+2KSrRnQbw2XfAinQeqH3gH64psuLUPIZiGrEnNBAkcydK27mpnm3Pswho
 EmfPvDsA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfg5-007nZO-IR; Wed, 14 Apr 2021 13:35:35 +0000
X-UUID: ee180b68872f41b6b873965eb3338509-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uN6yUsD7+8n8xQYrHK/WaZBOUivkNg96UL8SMy8kerA=; 
 b=pprHQIMY5DENQoH5ZGVkmzSf0CuM3rOdeNzMhxKvvt6hYidipqKNLcm/2cY8gU51ag3slm9s2c3dUViftRWGo9cptTIEUKQd8LbKT3lACcCVv2fdDMJrAjexjJqWDnNm60i4/UXkW4j37lYEJ4w9fkP7zEgOBAfuEF/HzVQuTmc=;
X-UUID: ee180b68872f41b6b873965eb3338509-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 733838670; Wed, 14 Apr 2021 06:35:24 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 06:35:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 21:35:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Apr 2021 21:35:22 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [v2,PATCH 3/3] drm/mediatek: dpi: add bus format negotiation
Date: Wed, 14 Apr 2021 21:35:16 +0800
Message-ID: <1618407316-10042-4-git-send-email-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
References: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_063533_639762_76FA47F7 
X-CRM114-Status: GOOD (  14.79  )
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

Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negotiate
the possible output and input formats for the current mode and monitor,
and use the negotiated formats in a basic atomic_check callback.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 89 ++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 76431fe849b8..b4e9c6c8d706 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -536,6 +536,87 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
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
+	unsigned int out_bus_format;
+
+	out_bus_format = bridge_state->output_bus_cfg.format;
+
+	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
+		bridge_state->input_bus_cfg.format,
+		bridge_state->output_bus_cfg.format);
+
+	dpi->ddr_edge_sel = (out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_LE) ?
+		 		true : false;
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
@@ -574,6 +655,9 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.mode_set = mtk_dpi_bridge_mode_set,
 	.disable = mtk_dpi_bridge_disable,
 	.enable = mtk_dpi_bridge_enable,
+	.atomic_check = mtk_dpi_bridge_atomic_check,
+	.atomic_get_output_bus_fmts = mtk_dpi_bridge_atomic_get_output_bus_fmts,
+	.atomic_get_input_bus_fmts = mtk_dpi_bridge_atomic_get_input_bus_fmts,
 };
 
 void mtk_dpi_start(struct device *dev)
@@ -620,11 +704,6 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	}
 	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
 
-	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
-	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
-	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
-
 	return 0;
 
 err_cleanup:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
