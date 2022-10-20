Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2ECC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NV7/biiNpmvDMy3keqojWAK7SpRHqd9pBuTEI3/Uu4k=; b=xWj4AS8S0Ma4mcMfK6C9ZeSYZE
	yNafnOMPkeTYOEn/c5PcGg+DSnyldvO3DeEfPKpsOMmR4D+zOYI7ee67Gbm+oQhPhL0n6fg1dDYnK
	SRyrlxqLUiIKjR35YZoReNdnipVKmlUoV5/zvV9prIrM1RFNr/DoyJyKKunjwHVOeQYgtfGw4zv6S
	lv4Hg2LtWHb1j1ZKtSMId1RQCFm49tZ86+69rAeWm4tlcSvJ7wLQap1FlYQCEVGmVvpFVeVO4Vsdx
	dzj/SU0XvJUvoh4sBex7T+eubyXv0NJrN7ijZwsO/3Owg+L2EOdu9hUX0Hn3ISQnoNLw8s2j40u1l
	B2iznqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olV4I-00F5xG-KW; Thu, 20 Oct 2022 12:54:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUmv-00ErW3-Hl; Thu, 20 Oct 2022 12:36:43 +0000
X-UUID: 31b871cbe91f496faa3a6b70fbf96bca-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NV7/biiNpmvDMy3keqojWAK7SpRHqd9pBuTEI3/Uu4k=;
	b=Wrt9GgrpgRDCXODU1A4ygnxXaOVWQzpLUo+DkKkUBMoMz+b7NDgQYLE5fBJP/bq+l6IvwY/806MyOIyzXUMHpcTXFFIyJRtzfT6Kze4v2Y1QbDEalxL9cahjQ8PfbUxqEdLY8IwMc43oobpOGVMfVJQ5CGeloxL47Tit/A3+eL8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:cd504acf-6339-4474-815f-20e8c1c69d5e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:15e77333-7d3c-46b3-a6e9-0ba03eeda632,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 31b871cbe91f496faa3a6b70fbf96bca-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 687858232; Thu, 20 Oct 2022 05:36:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 19:46:00 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 19:46:00 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v2,2/2] drm: mediatek: Add mt8188 dpi compatibles and platform data
Date: Thu, 20 Oct 2022 19:45:53 +0800
Message-ID: <1666266353-16670-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1666266353-16670-1-git-send-email-xinlei.lee@mediatek.com>
References: <1666266353-16670-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_053642_214143_F1C6A5BA 
X-CRM114-Status: GOOD (  11.14  )
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

From: xinlei lee <xinlei.lee@mediatek.com>

For MT8188, the vdosys0 only supports 1T1P mode, so we need to add the compatible for mt8188 edp-intf.

Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c     | 17 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 508a6d9..02c2a00 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -929,6 +929,20 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8188_dpintf_conf = {
+	.cal_factor = mt8195_dpintf_calculate_factor,
+	.max_clock_khz = 600000,
+	.output_fmts = mt8195_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
+	.pixels_per_iter = 4,
+	.input_2pixel = false,
+	.dimension_mask = DPINTF_HPW_MASK,
+	.hvsize_mask = DPINTF_HSIZE_MASK,
+	.channel_swap_shift = DPINTF_CH_SWAP,
+	.yuv422_en_bit = DPINTF_YUV422_EN,
+	.csc_enable_bit = DPINTF_CSC_ENABLE,
+};
+
 static const struct mtk_dpi_conf mt8192_conf = {
 	.cal_factor = mt8183_calculate_factor,
 	.reg_h_fre_con = 0xe0,
@@ -1079,6 +1093,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-dpi",
 	  .data = &mt8183_conf,
 	},
+	{ .compatible = "mediatek,mt8188-dp-intf",
+	  .data = &mt8188_dpintf_conf,
+	},
 	{ .compatible = "mediatek,mt8192-dpi",
 	  .data = &mt8192_conf,
 	},
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 91f58db..950bd04 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -631,6 +631,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
 	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8188-dp-intf",
+	  .data = (void *)MTK_DP_INTF },
 	{ .compatible = "mediatek,mt8192-dpi",
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8195-dp-intf",
-- 
2.6.4


