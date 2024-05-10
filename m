Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3823EC25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 06:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=puTXK9xgqDgUnsxXNMU30peMYkT6Y/1bWHM3NEeCpa8=; b=wLo+S9cxt2jX7bSHbhBWVjdOf8
	OSzIaJpF6uWMPXuRWKpL3wHclwPmYG7bEwJpDxKFqLxF5a6YJ/1XfXH7mhEM+oveQ/HQWntIujQpW
	e+sLU7yV1BGapwUER3R+Em0CCOJBHjlr1sWfPUMyINM2ejOB0p0hv3v+npmoLKL5RfvEAKwL1iMjF
	l8G4/xRzPrmqP/nCziKSEIcmw1/klD1OezCvUutFL80VtXPb4mIPi13pKEwEYKfL9es15Q4CZWbsb
	zIBFnVdqwlRLUsvkw01wlJ7E4zwQguRkFXHaxGVgSBZFZeb0l+btnyOYE9J8ns29xbcyCNr/4zRx8
	fP2nYAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JZZ-00000004BYd-40BR;
	Fri, 10 May 2024 06:17:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JZW-00000004BXr-0qw8;
	Fri, 10 May 2024 06:17:35 +0000
X-UUID: f7febbb40e9411ef9a78ddf43a9225dc-20240509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=puTXK9xgqDgUnsxXNMU30peMYkT6Y/1bWHM3NEeCpa8=;
	b=pS73xYb6hWbILobQQNhJ5Oidfng9mKHqYvKZy62QXbwbQD8XfjWJD6uSckuyAPdaCZS0ONCIWg/INO1QKy7Z35Cn7lcD4/CgpRblLQfDlgLSVsquBm6cZZPSFXup0KMOvxMnHODe7zfwqDwy6Umrq0Qj3sIlok7jgyPMTAGpo3g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:c26b2f1c-3dc9-4a3e-844a-7de8873012e6,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:82c5f88,CLOUDID:47c3ebfb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f7febbb40e9411ef9a78ddf43a9225dc-20240509
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2087642679; Thu, 09 May 2024 23:17:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 May 2024 14:17:19 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 May 2024 14:17:18 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<mac.shen@mediatek.com>, <liankun.yang@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] Fix get efuse issue for MT8188 DPTX
Date: Fri, 10 May 2024 14:16:57 +0800
Message-ID: <20240510061716.31103-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.274600-8.000000
X-TMASE-MatchedRID: HyBr+9HIEazPvAv72Y9dJYzb2GR6Ttd3nhD9A3Sa7pZcU0dNErOD+vlY
	oV6p/cSxhVmF9kz2wxKE+/1bNiTZfFqxshHHoiYzbT3mGmWPpNdaNaxZBRbNWmlUUOdVs6yao8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgKIzdZS3ou0WbFewbmqprKsJKuC5FVjYYlFxPBKXM9hY3vL
	qlRqyqyx2YKru/07rb6P6EiJbjbgHVW6hawn5RRbnypOu9sm/kLl13mrjijIwc/j4aI5S1Lnr9G
	D0zfOvEAaqvv/mhgrFLtG3H3wC1xA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.274600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6A4A9F5F72FA535015BBD4F07CE0894FCBC069D93143B8DE1EEA6D1714DD3D332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_231734_276627_B1ED0D29 
X-CRM114-Status: GOOD (  10.47  )
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

Fix get efuse issue for MT8188 DPTX.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2136a596efa1..32b36b63a4e1 100644
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
@@ -2758,7 +2841,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 static const struct mtk_dp_data mt8188_dp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
 	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
-	.efuse_fmt = mt8195_dp_efuse_fmt,
+	.efuse_fmt = mt8188_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = true,
 	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
-- 
2.18.0


