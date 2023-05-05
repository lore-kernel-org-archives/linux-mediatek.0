Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40645C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 13:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5N66xXPaesJHbEN2e+y1DB+ADmXl9MaI6t+9Chgeapo=; b=RMVHa4WrxehipGTiLRrigzTDlZ
	j8WUZdaFjU2a6X7Zfds52XsbNKXG5mWrEq53yaKTUjOHwgCxodYpo7EOg61uvqmBnT87b3Yb0UHXx
	GENDIRaE73pRzr1juZ9zvnDClxPwu6wmwsk3UHF8AvB1xBzdAzSY3E68jIkHiV2CyqSbCtJgejNLR
	5M55SNJl+VuX5Ayry02quZmibOdfShpbyaWmpx34sPq8RPysx3LiHI/Gnweiy6YFB5nrv6XtVjwLD
	Xx2mWe892c9ANVQu+ZFZ+ERxAUiHxBxTGGoaFNqanMKDEYtq4RL7a2dmLfyGorT11M6A8DPH6Pncq
	mcvkMJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvFW-00AxeX-2P;
	Fri, 05 May 2023 13:13:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvFU-00AxdW-21;
	Fri, 05 May 2023 13:13:25 +0000
X-UUID: 9a49cddceb4611ed912e1518a6540028-20230505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5N66xXPaesJHbEN2e+y1DB+ADmXl9MaI6t+9Chgeapo=;
	b=OQkRgqbdHkkc7frbm6kbSiTyV3VQNxExnAj0CPxedd2DO65Okv7fd15aal45e5EpsFFhHD4sjTtibU1tFliZdISi5vZlRECmIpxd0Y7VrwsDVzxHmK7/dD20vfx9O6eGWN7alsF+S3OfjiBeGY24S53+BZ7FrY0ZKGQ+AaqejhI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:1963c0a9-a66e-48ad-9804-51dd59983abd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:697ab71,CLOUDID:6eb4ebbf-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 9a49cddceb4611ed912e1518a6540028-20230505
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 245683423; Fri, 05 May 2023 06:13:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 5 May 2023 21:13:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 May 2023 21:13:15 +0800
From: Runyang Chen <runyang.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Runyang Chen <runyang.chen@mediatek.com>
Subject: [PATCH v2 2/2] clk: mediatek: reset: add infra_ao reset support for MT8188
Date: Fri, 5 May 2023 21:13:08 +0800
Message-ID: <20230505131308.27190-3-runyang.chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20230505131308.27190-1-runyang.chen@mediatek.com>
References: <20230505131308.27190-1-runyang.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_061324_681779_684DACDE 
X-CRM114-Status: GOOD (  11.68  )
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

The infra_ao reset is needed for MT8188.
- Add mtk_clk_rst_desc for MT8188.
- Add register reset controller function for MT8188 infra_ao.
- Add infra_ao_idx_map for MT8188.

Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8188-infra_ao.c | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8188-infra_ao.c b/drivers/clk/mediatek/clk-mt8188-infra_ao.c
index 91c35db40b4e..1d4b27ba06be 100644
--- a/drivers/clk/mediatek/clk-mt8188-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8188-infra_ao.c
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+#include <dt-bindings/reset/mt8188-resets.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
@@ -176,9 +177,32 @@ static const struct mtk_gate infra_ao_clks[] = {
 		       "infra_ao_aes_msdcfde_0p", "top_aes_msdcfde", 18),
 };
 
+static u16 infra_ao_rst_ofs[] = {
+	INFRA_RST0_SET_OFFSET,
+	INFRA_RST1_SET_OFFSET,
+	INFRA_RST2_SET_OFFSET,
+	INFRA_RST3_SET_OFFSET,
+	INFRA_RST4_SET_OFFSET,
+};
+
+static u16 infra_ao_idx_map[] = {
+	[MT8188_INFRA_RST1_THERMAL_MCU_RST] = 1 * RST_NR_PER_BANK + 2,
+	[MT8188_INFRA_RST1_THERMAL_CTRL_RST] = 1 * RST_NR_PER_BANK + 4,
+	[MT8188_INFRA_RST3_PTP_CTRL_RST] = 3 * RST_NR_PER_BANK + 5,
+};
+
+static struct mtk_clk_rst_desc infra_ao_rst_desc = {
+	.version = MTK_RST_SET_CLR,
+	.rst_bank_ofs = infra_ao_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infra_ao_rst_ofs),
+	.rst_idx_map = infra_ao_idx_map,
+	.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
+};
+
 static const struct mtk_clk_desc infra_ao_desc = {
 	.clks = infra_ao_clks,
 	.num_clks = ARRAY_SIZE(infra_ao_clks),
+	.rst_desc = &infra_ao_rst_desc,
 };
 
 static const struct of_device_id of_match_clk_mt8188_infra_ao[] = {
-- 
2.18.0


