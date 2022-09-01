Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02854ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 05:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nDV+vR78OpdEySqlDcu971kberj+QzgCFZD7N3rv4g=; b=Tn+R+mwl9pMNUXYWYcxzs+2W01
	ayqysDXDmpDq+0KrjC+1qjI6UKCForMu1l70jp3CLwb08o8Wyie1XkVSInJOiXuNMgJ6Vy3axLq1U
	Iza9yETpzOpEP3JUznwjG5VD3pVmXUFetPNEfSZx/ATWc0qVgVehXfK3LWQxmu/w2mtGZvQnGUhMR
	Wj8bFISMKPlbg2FWS1CKO7mfMVm4ZH3Ji1u+LBhZu3XSFj3IhBXJEb5/q5Xhezw7rwF682PBiR8Ru
	2z7/ilUuhvEL9VkCYQG3F/BelFy7ZDlPUCjeVT83Se2mG+m3a83JQ7O8aQ09eI1qOhq7m6xm3HfTG
	lO3imlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcyP-009qvT-Ry; Thu, 01 Sep 2022 05:42:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcyM-009qtd-R7; Thu, 01 Sep 2022 05:42:40 +0000
X-UUID: fcd20f584d4643879a0007b655f8f7bc-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+nDV+vR78OpdEySqlDcu971kberj+QzgCFZD7N3rv4g=;
	b=NF5R1gJGv2NMM5K1cuzm4lStOWZoHB5j5IJCv9GOo7Td7OgdRYWzIQRG7YZNwkBd956rfcHCu66jL8VMTo3qafTm/spL+gn57t9Ft+Bn40wpolJ2snGlLUCxdWIvm97X2BIeg7v47uDSSEAGsHlh8/nPrSloM1WVb3J3ziiGGwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:f23bc89e-2571-4977-adc6-06a8ac8576f3,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:ccc23d56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fcd20f584d4643879a0007b655f8f7bc-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 85823185; Wed, 31 Aug 2022 22:42:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 12:41:52 +0800
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
Subject: [PATCH v17 04/10] drm/mediatek: dp: Add multiple bridge types support
Date: Thu, 1 Sep 2022 12:41:43 +0800
Message-ID: <20220901044149.16782-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_224238_902642_74B7CD38 
X-CRM114-Status: GOOD (  15.06  )
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

The bridge types of eDP and DP are different. We add device data to
this driver and add bridge_type to the device data to define them.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e2ec9b02b1aa..2696c1ac1a47 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -101,6 +101,7 @@ struct mtk_dp {
 	struct drm_device *drm_dev;
 	struct drm_dp_aux aux;
 
+	const struct mtk_dp_data *data;
 	struct mtk_dp_info info;
 	struct mtk_dp_train_info train_info;
 
@@ -109,6 +110,9 @@ struct mtk_dp {
 	struct regmap *regs;
 };
 
+struct mtk_dp_data {
+	int bridge_type;
+};
 static const struct mtk_dp_efuse_fmt mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
 	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
 		.idx = 3,
@@ -1871,6 +1875,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mtk_dp->dev = dev;
+	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
 
 	irq_num = platform_get_irq(pdev, 0);
 	if (irq_num < 0)
@@ -1925,7 +1930,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.ops =
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
 	drm_bridge_add(&mtk_dp->bridge);
 
@@ -1974,8 +1979,15 @@ static int mtk_dp_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
+static const struct mtk_dp_data mt8195_edp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct of_device_id mtk_dp_of_match[] = {
-	{ .compatible = "mediatek,mt8195-edp-tx" },
+	{
+		.compatible = "mediatek,mt8195-edp-tx",
+		.data = &mt8195_edp_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
-- 
2.18.0


