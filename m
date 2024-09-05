Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A060CD5BB9
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OcLEq6dH8qftZcTYguFuaKmK6b9OpijG3PWo0vk/dHk=; b=IPMn2T3f624P6PkuWTT1bCf6hL
	QXJAM2ujJA3m4Qun9VkobtTbZL7Omq72sFaGe0tup0xYdLk4MkHKbFoXpmQjLN+eVGwNy5oCoOAKy
	OHL15zg4/k0/UPEYeojau8QIBl5+VjEF5733ihopeuGTfbMpdPe52G4RKFeUSG2PGoP2USf8pUgrt
	h/DiIpuFGB2VMs3Y/uZgsjt4Yqz/lnSVLVjF5k6k7i2kFH3hAcmx8IAW3R8o7zysgq1x1hgXU0GAq
	CMchI5lRN78tem94VVlTUIiA+I9HRc+1Uu7wWcSHHtflqxLyws79IiGm334qclPwQh+UKpenXqlW/
	DRcRgdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBoh-00000008Mul-2Lhf;
	Thu, 05 Sep 2024 12:42:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBng-00000008Ma9-3nLM;
	Thu, 05 Sep 2024 12:41:27 +0000
X-UUID: 26dc39106b8411efba0aef63c0775dbf-20240905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OcLEq6dH8qftZcTYguFuaKmK6b9OpijG3PWo0vk/dHk=;
	b=K3LS7pTmHLuPz2HiPRWmXfGRPeXYdKieERm7tysdpHuMl86fnc6k0tVkHMJ25pD/u6S3PY3Cgo0mPgAXoPlFUPvYiGr8uUUJVJhGYe69p7PjV/XkmVbzzhh9P6h/sCQ2+0Rxhj9ZoRyvcorvwOmvfBCmnFvPAwWqtM4HC5aROgI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:205b49dc-9d4c-4df1-993d-95bcc639088d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2b1780bf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 26dc39106b8411efba0aef63c0775dbf-20240905
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 137218862; Thu, 05 Sep 2024 05:41:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 5 Sep 2024 05:40:45 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 5 Sep 2024 20:40:45 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <ck.hu@mediatek.com>,
	<shuijing.li@mediatek.com>, <jitao.shi@mediatek.com>,
	<mac.shen@mediatek.com>, <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
Date: Thu, 5 Sep 2024 20:40:02 +0800
Message-ID: <20240905124041.3658-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_054124_967902_2D3E34DD 
X-CRM114-Status: GOOD (  12.73  )
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

Update efuse data for MT8188 displayport.

The DP monitor can not display when DUT connected to USB-c to DP dongle.
Analysis view is invalid DP efuse data.

Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp function")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Changes in V4:
- Remove excess newlines.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240903121028.20689-1-liankun.yang@mediatek.com/

Changes in V3
- Update change log position in commit message.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240902133736.16461-1-liankun.yang@mediatek.com/

Changes in V2
- Add Fixes tag.
- Update the commit title.
- Update the commit description.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240510061716.31103-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..f2bee617f063 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -145,6 +145,89 @@ struct mtk_dp_data {
 	u16 audio_m_div2_bit;
 };
 
+static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
+	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
+		.idx = 0,
+		.shift = 10,
+		.mask = 0x1f,
+		.min_val = 1,
+		.max_val = 0x1e,
+		.default_val = 0xf,
+	},
+	[MTK_DP_CAL_CLKTX_IMPSE] = {
+		.idx = 0,
+		.shift = 15,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0] = {
+		.idx = 1,
+		.shift = 0,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1] = {
+		.idx = 1,
+		.shift = 8,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2] = {
+		.idx = 1,
+		.shift = 16,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3] = {
+		.idx = 1,
+		.shift = 24,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0] = {
+		.idx = 1,
+		.shift = 4,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1] = {
+		.idx = 1,
+		.shift = 12,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2] = {
+		.idx = 1,
+		.shift = 20,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3] = {
+		.idx = 1,
+		.shift = 28,
+		.mask = 0xf,
+		.min_val = 1,
+		.max_val = 0xe,
+		.default_val = 0x8,
+	},
+};
+
 static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
 	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
 		.idx = 3,
@@ -2771,7 +2854,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 static const struct mtk_dp_data mt8188_dp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
 	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
-	.efuse_fmt = mt8195_dp_efuse_fmt,
+	.efuse_fmt = mt8188_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = true,
 	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
-- 
2.45.2


