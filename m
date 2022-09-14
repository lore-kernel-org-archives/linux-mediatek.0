Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66754ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30Y1331QqmMzmJUtpxxGVosZJNYS3aXdI1GnnaeCvag=; b=sMqSqFZG7Wdx4BHcP+I1ChO3U9
	BXdhNf/rJzWAFfIoj3L5/Jej6hVAK+FKhhjxYeODvNN1fuQFbZBr5TRDl83Ozpg7OSyXjP5ONZaH+
	691c2CV5Zpepq7qzOdTk46eSZDfjdJMSdeEg+6tLQJNv0nN+PApUiOPAFSkS4C7+BBBu5J2zHCNSF
	+VyXHTuHo9ohknB6N3XQdpZHxr3yMm/Y+Xv5VKybD1SeCKnyzrTwvcXwPn0i5yxxCjwtdS5vMCfIb
	hUindzGowaYnKpE0JNE1/PWdTNhwCbpYGmhUtDfqcd7ryEnSUbWv/a+PciTR25jlTwDeqiOfmOcWR
	QK3HTcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSI6-000fXP-5e; Wed, 14 Sep 2022 13:18:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSHl-000f9b-5L; Wed, 14 Sep 2022 13:18:39 +0000
X-UUID: ae8066b5532f4716817d5dd23225ae95-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=30Y1331QqmMzmJUtpxxGVosZJNYS3aXdI1GnnaeCvag=;
	b=XiffeKhz4QMURjOtiKeiw/QvltSSsRmOog9XaSuy8yhGK7Akr4YLrIn+yCTu/lPBIMBnU3pUncQbFSYzUSBLbqPlY22mbzXlRj/E1Ry9M+/KpsF1MY1WIGVGE6z9Hy2qN3G/gSVdfWHVnf2ZEHRwAosbEpcRnI9gaXrfjl/NVH8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:91734986-915f-46b7-8d27-8bef7beff033,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:3e396cec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ae8066b5532f4716817d5dd23225ae95-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 874544868; Wed, 14 Sep 2022 06:16:29 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 20:45:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Sep 2022 20:45:54 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>
Subject: [PATCH v2 4/4] clk: mediatek: Change PLL register API for MT8186
Date: Wed, 14 Sep 2022 20:45:52 +0800
Message-ID: <20220914124552.16964-5-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220914124552.16964-1-johnson.wang@mediatek.com>
References: <20220914124552.16964-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_061837_292487_6110DD42 
X-CRM114-Status: GOOD (  14.45  )
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

Use mtk_clk_register_pllfhs() to enhance frequency hopping and
spread spectrum clocking control for MT8186.

Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c | 66 +++++++++++++++++++-
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index e692a2a67ce1..1d673c6278a9 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -9,6 +9,7 @@
 
 #include "clk-mtk.h"
 #include "clk-pll.h"
+#include "clk-pllfh.h"
 
 #define MT8186_PLL_FMAX		(3800UL * MHZ)
 #define MT8186_PLL_FMIN		(1500UL * MHZ)
@@ -76,6 +77,59 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 32, 0x034C, 24, 0x0044, 0x000C, 5, 0x0350),
 };
 
+enum fh_pll_id {
+	FH_ARMPLL_LL,
+	FH_ARMPLL_BL,
+	FH_CCIPLL,
+	FH_MAINPLL,
+	FH_MMPLL,
+	FH_TVDPLL,
+	FH_RESERVE6,
+	FH_ADSPPLL,
+	FH_MFGPLL,
+	FH_NNAPLL,
+	FH_NNA2PLL,
+	FH_MSDCPLL,
+	FH_RESERVE12,
+	FH_NR_FH,
+};
+
+#define FH(_pllid, _fhid, _offset) {					\
+		.data = {						\
+			.pll_id = _pllid,				\
+			.fh_id = _fhid,					\
+			.fhx_offset = _offset,				\
+			.dds_mask = GENMASK(21, 0),			\
+			.slope0_value = 0x6003c97,			\
+			.slope1_value = 0x6003c97,			\
+			.sfstrx_en = BIT(2),				\
+			.frddsx_en = BIT(1),				\
+			.fhctlx_en = BIT(0),				\
+			.tgl_org = BIT(31),				\
+			.dvfs_tri = BIT(31),				\
+			.pcwchg = BIT(31),				\
+			.dt_val = 0x0,					\
+			.df_val = 0x9,					\
+			.updnlmt_shft = 16,				\
+			.msk_frddsx_dys = GENMASK(23, 20),		\
+			.msk_frddsx_dts = GENMASK(19, 16),		\
+		},							\
+	}
+
+static struct mtk_pllfh_data pllfhs[] = {
+	FH(CLK_APMIXED_ARMPLL_LL, FH_ARMPLL_LL, 0x003C),
+	FH(CLK_APMIXED_ARMPLL_BL, FH_ARMPLL_BL, 0x0050),
+	FH(CLK_APMIXED_CCIPLL, FH_CCIPLL, 0x0064),
+	FH(CLK_APMIXED_MAINPLL, FH_MAINPLL, 0x0078),
+	FH(CLK_APMIXED_MMPLL, FH_MMPLL, 0x008C),
+	FH(CLK_APMIXED_TVDPLL, FH_TVDPLL, 0x00A0),
+	FH(CLK_APMIXED_ADSPPLL, FH_ADSPPLL, 0x00C8),
+	FH(CLK_APMIXED_MFGPLL, FH_MFGPLL, 0x00DC),
+	FH(CLK_APMIXED_NNAPLL, FH_NNAPLL, 0x00F0),
+	FH(CLK_APMIXED_NNA2PLL, FH_NNA2PLL, 0x0104),
+	FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x0118),
+};
+
 static const struct of_device_id of_match_clk_mt8186_apmixed[] = {
 	{ .compatible = "mediatek,mt8186-apmixedsys", },
 	{}
@@ -85,13 +139,17 @@ static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
+	const u8 *fhctl_node = "mediatek,mt8186-fhctl";
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 	if (!clk_data)
 		return -ENOMEM;
 
-	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
+
+	r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_apmixed_data;
 
@@ -104,7 +162,8 @@ static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
 	return r;
 
 unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 free_apmixed_data:
 	mtk_free_clk_data(clk_data);
 	return r;
@@ -116,7 +175,8 @@ static int clk_mt8186_apmixed_remove(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
 
 	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 	mtk_free_clk_data(clk_data);
 
 	return 0;
-- 
2.18.0


