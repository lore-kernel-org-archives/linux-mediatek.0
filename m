Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF19ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGsbg7prdxs1vhSp2rmBd1uAZaLwpCXH2jNx8EM9V48=; b=ur0+TgWbDwoS57jHapgrSELco4
	9kWqmIkVnwsCm7OysA5ISygOOPo9oddRIevi9aWveIP+3BkNxla9rGcSjOsKEAlfti5egk4nCM+A2
	ggiOCNbcSb5p+X5+iAUv0h8N0n6gZAVUxAlaXVm6HMhVAQ7xn57vzoO5Gczxyhx/TTznSGva58zN2
	6oL2qEpPk/sd1yHixwPDaUZv/mOwUzis2VdaNzT6dURVU9wgKWe4FinqSDxzJcsC+p5aPmgGMBNIL
	C4NDIhadW1pM4dp5SmhP1xHiGylt+9MfUHxXIMQoDA9O0VvLSiDXFM4kqNkg1x/shMoqM4zviBu+i
	d8FL18YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcVn-009kj8-No; Thu, 01 Sep 2022 05:13:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcVl-009kgW-JT; Thu, 01 Sep 2022 05:13:07 +0000
X-UUID: e0a342bd83e24803ab235707e3f9f94a-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gGsbg7prdxs1vhSp2rmBd1uAZaLwpCXH2jNx8EM9V48=;
	b=f0kGPbvWzw9rc69fh10vd0eNw0q4ZPYINuWgkqI+qbwtxrLPatgtKIbbenh+keTe44Ibw0qDKLsYYYSvGF0Aa6CpSmJ/QLg5lwCZzGrSGeUWQPzIe44P+jqcBqSnI1vBEGwVldpQpUuVxTG0g/8n2Cv/8Uw9/3qgxVfdD0wXLhs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:ace777ee-74d5-487d-94fa-b2daa75e2087,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:ced046d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e0a342bd83e24803ab235707e3f9f94a-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 108362219; Wed, 31 Aug 2022 22:13:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 12:41:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 12:41:52 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v17 08/10] drm/mediatek: dp: Add MT8195 External DisplayPort support
Date: Thu, 1 Sep 2022 12:41:47 +0800
Message-ID: <20220901044149.16782-9-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_221305_659129_C18914A9 
X-CRM114-Status: GOOD (  16.89  )
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

From: Guillaume Ranquet <granquet@baylibre.com>

Add External DisplayPort support to the MT8195 eDP driver.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 139 ++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e37c9185e4ec..11a94927c0d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -35,6 +35,7 @@
 
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
 #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
+#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
 
 #define MTK_DP_THREAD_CABLE_STATE_CHG	BIT(0)
 #define MTK_DP_THREAD_HPD_EVENT		BIT(1)
@@ -199,6 +200,89 @@ static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
 	},
 };
 
+static const struct mtk_dp_efuse_fmt mt8195_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
+	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
+		.idx = 0,
+		.shift = 27,
+		.mask = 0x1f,
+		.min_val = 1,
+		.max_val = 0x1e,
+		.default_val = 0xf,
+	},
+	[MTK_DP_CAL_CLKTX_IMPSE] = {
+		.idx = 0,
+		.shift = 13,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0] = {
+		.idx = 1,
+		.shift = 28,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1] = {
+		.idx = 1,
+		.shift = 20,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2] = {
+		.idx = 1,
+		.shift = 12,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3] = {
+		.idx = 1,
+		.shift = 4,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0] = {
+		.idx = 1,
+		.shift = 24,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1] = {
+		.idx = 1,
+		.shift = 16,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2] = {
+		.idx = 1,
+		.shift = 8,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3] = {
+		.idx = 1,
+		.shift = 0,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+};
+
 static struct regmap_config mtk_dp_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -1479,6 +1563,50 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	return 0;
 }
 
+static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	enum drm_connector_status ret = connector_status_disconnected;
+	bool enabled = mtk_dp->enabled;
+	u8 sink_count = 0;
+
+	if (mtk_dp->train_info.cable_plugged_in) {
+		if (!enabled) {
+			/* power on aux */
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+					   DP_PWR_STATE_MASK);
+
+			/* power on panel */
+			drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+			usleep_range(2000, 5000);
+		}
+		/*
+		 * Some dongles still source HPD when they do not connect to any
+		 * sink device. To avoid this, we need to read the sink count
+		 * to make sure we do connect to sink devices. After this detect
+		 * function, we just need to check the HPD connection to check
+		 * whether we connect to a sink device.
+		 */
+		drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+		if (DP_GET_SINK_COUNT(sink_count))
+			ret = connector_status_connected;
+
+		if (!enabled) {
+			/* power off panel */
+			drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
+			usleep_range(2000, 3000);
+
+			/* power off aux */
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL,
+					   DP_PWR_STATE_MASK);
+		}
+	}
+
+	return ret;
+}
+
 static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 				    struct drm_connector *connector)
 {
@@ -1865,6 +1993,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.atomic_disable = mtk_dp_bridge_atomic_disable,
 	.mode_valid = mtk_dp_bridge_mode_valid,
 	.get_edid = mtk_dp_get_edid,
+	.detect = mtk_dp_bdg_detect,
 };
 
 static int mtk_dp_probe(struct platform_device *pdev)
@@ -1991,11 +2120,21 @@ static const struct mtk_dp_data mt8195_edp_data = {
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 };
 
+static const struct mtk_dp_data mt8195_dp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
+	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
+	.efuse_fmt = mt8195_dp_efuse_fmt,
+};
+
 static const struct of_device_id mtk_dp_of_match[] = {
 	{
 		.compatible = "mediatek,mt8195-edp-tx",
 		.data = &mt8195_edp_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-dp-tx",
+		.data = &mt8195_dp_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
-- 
2.18.0


