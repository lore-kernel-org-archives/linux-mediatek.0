Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E4CECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 05:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hrAFATXkat2loNAgClkHHZ5w/POym9PfQu+eEy39cQ=; b=j4FMjTWF5Zr0bFYKOVChVkZrBv
	BnnBHkhl+/xqNlxhhPkmW3ws2xMDby64/BEf+GL6V/jCvoWIWotwCIbO3fKJQmxMqO04pOPhZVTF5
	0uZ6i3rKmfVwViqlrSN3qW8DFIzNzM8nMRo4n/2FqeabmaAzAPeLNFeiglYlkdHhm5R2wMMEWEreT
	wOMy+pB+yCEBkVWXjZAZoHYCaFjgBImRhg9dPlHtDNgkpxu3CdW8Ywpauza4QDvcrxxWq5Lvdjo/w
	dhj44wSL0yvNl6ozNPsKm3fHX/Xz28GfK157kof0OnfDtiWTPLYAArLe3vGQqbbdRT4UoYvtru3w/
	PgLyRg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTczS-009rAB-Sd; Thu, 01 Sep 2022 05:43:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTczJ-009r5w-Mk; Thu, 01 Sep 2022 05:43:39 +0000
X-UUID: 25cd0775dc2647ab8eaf97d952e5a532-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6hrAFATXkat2loNAgClkHHZ5w/POym9PfQu+eEy39cQ=;
	b=D7dCpelAvb+ZC4sqxeAlatsu38UC2vxBX4AVNwY8oyRIqs0TVv4PwnjLCoLjocpKEYHHMp5tlucZLkwCKsmqkh5R0TC1iN9bv1QgQGTTcWtR0KnqiPa0Y2suEYmxt7mwYPzPl5Ul7z43Ijal5sfgwWy2Cxsr7XQmatBmfrNjWtA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:38a2d44b-876d-4868-9214-11232856f34d,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:36ca3d56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 25cd0775dc2647ab8eaf97d952e5a532-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1935233646; Wed, 31 Aug 2022 22:43:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 1 Sep 2022 12:41:52 +0800
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
Subject: [PATCH v17 06/10] drm/mediatek: dp: Add multiple calibration data formats support
Date: Thu, 1 Sep 2022 12:41:45 +0800
Message-ID: <20220901044149.16782-7-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_224337_757059_2D0F24CB 
X-CRM114-Status: GOOD (  13.32  )
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

The calibration data formats of eDP and DP are different. We add
"const struct mtk_dp_efuse_fmt *efuse_fmt" to the device data to
define them.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 971bd744cdb2..136e13150281 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -113,8 +113,10 @@ struct mtk_dp {
 struct mtk_dp_data {
 	int bridge_type;
 	unsigned int smc_cmd;
+	const struct mtk_dp_efuse_fmt *efuse_fmt;
 };
-static const struct mtk_dp_efuse_fmt mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
+
+static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
 	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
 		.idx = 3,
 		.shift = 27,
@@ -811,7 +813,7 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 	}
 
 	for (i = 0; i < MTK_DP_CAL_MAX; i++) {
-		fmt = &mtk_dp_efuse_data[i];
+		fmt = &mtk_dp->data->efuse_fmt[i];
 		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
 
 		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
@@ -827,7 +829,7 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 use_default_val:
 	dev_warn(mtk_dp->dev, "Use default calibration data\n");
 	for (i = 0; i < MTK_DP_CAL_MAX; i++)
-		cal_data[i] = mtk_dp_efuse_data[i].default_val;
+		cal_data[i] = mtk_dp->data->efuse_fmt[i].default_val;
 }
 
 static void mtk_dp_set_calibration_data(struct mtk_dp *mtk_dp)
@@ -1983,6 +1985,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
 	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
+	.efuse_fmt = mt8195_edp_efuse_fmt,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
-- 
2.18.0


