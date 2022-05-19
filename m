Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1348AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vXI09jb+XRL8CYtlQXg9JPeM5XKMgEt8kEtNB0/fj4=; b=FqkLcNsd7DIOVR
	/wmlr7xHAwWfY5H9gpQIPFUJrbVT3hXswrNII9Gu2bBCyq261RfuaGS5uHExkprdfyO/K2xv2EmQY
	+ICf/1k1/fJaJHaMoxBUg6FMDSDFjE57grQFMUn4ZWW+Ct9393CPqo45fnVNxGLJlm7dALI+Wa8SS
	dkh6oeINdBEm4L876uTjOeMS634FljNNfx91/lKm7s3Rw+0NYp4Ranv2eTJuONrSzby9p87OjKryO
	Y9VkJiofGWTd4u4EiavtRdzfsgQ3OhOVFNCjk/3sLaVum4JBzOMWKPIyDlOU/9sPEoHBgR+5LL+Mw
	BHLxXBH0xSObhJKA+XVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrfjT-006oz9-VG; Thu, 19 May 2022 12:58:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfgu-006nIS-IW; Thu, 19 May 2022 12:55:48 +0000
X-UUID: f6da67c163194914a1bc84c8105a7ec6-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:32e59c45-47d1-4de0-a184-243cfde96c56, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:178ccfe2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: f6da67c163194914a1bc84c8105a7ec6-20220519
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1623668706; Thu, 19 May 2022 05:55:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 05:55:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 20:55:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 May 2022 20:55:29 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v7 07/19] clk: mediatek: reset: Support nonsequence base
 offsets of reset registers
Date: Thu, 19 May 2022 20:55:15 +0800
Message-ID: <20220519125527.18544-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_055544_734390_2C9B2AD6 
X-CRM114-Status: GOOD (  14.72  )
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

The bank offsets are not serial for all reset registers.
For example, there are five infra reset banks for MT8192: 0x120, 0x130,
0x140, 0x150 and 0x730.

To support this,
- Change reg_ofs to rst_bank_ofs which is a pointer to base offsets of
  the reset register.
- Add a new define RST_NR_PER_BANK to define reset number for each
  reset bank.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt2701-eth.c |  6 ++++--
 drivers/clk/mediatek/clk-mt2701-g3d.c |  6 ++++--
 drivers/clk/mediatek/clk-mt2701-hif.c |  6 ++++--
 drivers/clk/mediatek/clk-mt2701.c     | 11 +++++++----
 drivers/clk/mediatek/clk-mt2712.c     | 11 +++++++----
 drivers/clk/mediatek/clk-mt7622-eth.c |  6 ++++--
 drivers/clk/mediatek/clk-mt7622-hif.c |  6 ++++--
 drivers/clk/mediatek/clk-mt7622.c     | 11 +++++++----
 drivers/clk/mediatek/clk-mt7629-eth.c |  6 ++++--
 drivers/clk/mediatek/clk-mt7629-hif.c |  6 ++++--
 drivers/clk/mediatek/clk-mt8135.c     | 11 +++++++----
 drivers/clk/mediatek/clk-mt8173.c     | 11 +++++++----
 drivers/clk/mediatek/clk-mt8183.c     | 14 ++++++++++++--
 drivers/clk/mediatek/reset.c          | 11 ++++++-----
 drivers/clk/mediatek/reset.h          |  6 ++++--
 15 files changed, 85 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek/clk-mt2701-eth.c
index 270d15ce58bf..b4e7f38860d0 100644
--- a/drivers/clk/mediatek/clk-mt2701-eth.c
+++ b/drivers/clk/mediatek/clk-mt2701-eth.c
@@ -36,10 +36,12 @@ static const struct mtk_gate eth_clks[] = {
 	GATE_ETH(CLK_ETHSYS_CRYPTO, "crypto_clk", "ethif_sel", 29),
 };
 
+static u16 rst_ofs[] = { 0x34, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.version = MTK_RST_SIMPLE,
-	.rst_bank_nr = 1,
-	.reg_ofs = 0x34,
+	.rst_bank_ofs = rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
 static const struct of_device_id of_match_clk_mt2701_eth[] = {
diff --git a/drivers/clk/mediatek/clk-mt2701-g3d.c b/drivers/clk/mediatek/clk-mt2701-g3d.c
index 9cfd589939e5..5cbc5c42204d 100644
--- a/drivers/clk/mediatek/clk-mt2701-g3d.c
+++ b/drivers/clk/mediatek/clk-mt2701-g3d.c
@@ -35,10 +35,12 @@ static const struct mtk_gate g3d_clks[] = {
 	GATE_G3D(CLK_G3DSYS_CORE, "g3d_core", "mfg_sel", 0),
 };
 
+static u16 rst_ofs[] = { 0xC, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.version = MTK_RST_SIMPLE,
-	.rst_bank_nr = 1,
-	.reg_ofs = 0xc,
+	.rst_bank_ofs = rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
 static int clk_mt2701_g3dsys_init(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
index a6b812fcc922..60bda56a102c 100644
--- a/drivers/clk/mediatek/clk-mt2701-hif.c
+++ b/drivers/clk/mediatek/clk-mt2701-hif.c
@@ -33,10 +33,12 @@ static const struct mtk_gate hif_clks[] = {
 	GATE_HIF(CLK_HIFSYS_PCIE2, "pcie2_clk", "ethpll_500m_ck", 26),
 };
 
+static u16 rst_ofs[] = { 0x34, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.version = MTK_RST_SIMPLE,
-	.rst_bank_nr = 1,
-	.reg_ofs = 0x34,
+	.rst_bank_ofs = rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
 static const struct of_device_id of_match_clk_mt2701_hif[] = {
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 4c0e25ab033b..413c9d8dd752 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -735,18 +735,21 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
 	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
 };
 
+static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
+static u16 pericfg_rst_ofs[] = { 0x0, 0x4, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc[] = {
 	/* infrasys */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x30,
+		.rst_bank_ofs = infrasys_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 	},
 	/* pericfg */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x0,
+		.rst_bank_ofs = pericfg_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
 	},
 };
 
diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index 036a2baaaf92..fcb4bef974d9 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1258,18 +1258,21 @@ static const struct mtk_pll_data plls[] = {
 		0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
 };
 
+static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
+static u16 pericfg_rst_ofs[] = { 0x0, 0x4, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc[] = {
 	/* infra */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x30,
+		.rst_bank_ofs = infrasys_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 	},
 	/* peri */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x0,
+		.rst_bank_ofs = pericfg_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
 	},
 };
 
diff --git a/drivers/clk/mediatek/clk-mt7622-eth.c b/drivers/clk/mediatek/clk-mt7622-eth.c
index 40eefed3d12b..90d55f882215 100644
--- a/drivers/clk/mediatek/clk-mt7622-eth.c
+++ b/drivers/clk/mediatek/clk-mt7622-eth.c
@@ -65,10 +65,12 @@ static const struct mtk_gate sgmii_clks[] = {
 		   "ssusb_cdr_fb", 5),
 };
 
+static u16 rst_ofs[] = { 0x34, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.version = MTK_RST_SIMPLE,
-	.rst_bank_nr = 1,
-	.reg_ofs = 0x34,
+	.rst_bank_ofs = rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
 static int clk_mt7622_ethsys_init(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt7622-hif.c b/drivers/clk/mediatek/clk-mt7622-hif.c
index ca29d93ce2d0..489b64725b22 100644
--- a/drivers/clk/mediatek/clk-mt7622-hif.c
+++ b/drivers/clk/mediatek/clk-mt7622-hif.c
@@ -76,10 +76,12 @@ static const struct mtk_gate pcie_clks[] = {
 	GATE_PCIE(CLK_SATA_PM_EN, "sata_pm_en", "univpll2_d4", 30),
 };
 
+static u16 rst_ofs[] = { 0x34, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.version = MTK_RST_SIMPLE,
-	.rst_bank_nr = 1,
-	.reg_ofs = 0x34,
+	.rst_bank_ofs = rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
 static int clk_mt7622_ssusbsys_init(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 7e62630b5840..6df709ca2860 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -610,18 +610,21 @@ static struct mtk_composite peri_muxes[] = {
 	MUX(CLK_PERIBUS_SEL, "peribus_ck_sel", peribus_ck_parents, 0x05C, 0, 1),
 };
 
+static u16 infrasys_rst_ofs[] = { 0x30, };
+static u16 pericfg_rst_ofs[] = { 0x0, 0x4, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc[] = {
 	/* infrasys */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 1,
-		.reg_ofs = 0x30,
+		.rst_bank_ofs = infrasys_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 	},
 	/* pericfg */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x0,
+		.rst_bank_ofs = pericfg_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
 	},
 };
 
diff --git a/drivers/clk/mediatek/clk-mt7629-eth.c b/drivers/clk/mediatek/clk-mt7629-eth.c
index c20c7853500d..11b346c9d916 100644
--- a/drivers/clk/mediatek/clk-mt7629-eth.c
+++ b/drivers/clk/mediatek/clk-mt7629-eth.c
@@ -76,10 +76,12 @@ static const struct mtk_gate sgmii_clks[2][4] = {
 	}
 };
 
+static u16 rst_ofs[] = { 0x34, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.version = MTK_RST_SIMPLE,
-	.rst_bank_nr = 1,
-	.reg_ofs = 0x34,
+	.rst_bank_ofs = rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
 static int clk_mt7629_ethsys_init(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt7629-hif.c b/drivers/clk/mediatek/clk-mt7629-hif.c
index 5d7ec861afab..c0583043710f 100644
--- a/drivers/clk/mediatek/clk-mt7629-hif.c
+++ b/drivers/clk/mediatek/clk-mt7629-hif.c
@@ -71,10 +71,12 @@ static const struct mtk_gate pcie_clks[] = {
 	GATE_PCIE(CLK_PCIE_P0_PIPE_EN, "pcie_p0_pipe_en", "pcie0_pipe_en", 23),
 };
 
+static u16 rst_ofs[] = { 0x34, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.version = MTK_RST_SIMPLE,
-	.rst_bank_nr = 1,
-	.reg_ofs = 0x34,
+	.rst_bank_ofs = rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
 static int clk_mt7629_ssusbsys_init(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 0ce26c6a8063..f975922cb99b 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -514,18 +514,21 @@ static const struct mtk_composite peri_clks[] __initconst = {
 	MUX(CLK_PERI_UART3_SEL, "uart3_ck_sel", uart_ck_sel_parents, 0x40c, 3, 1),
 };
 
+static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
+static u16 pericfg_rst_ofs[] = { 0x0, 0x4, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc[] = {
 	/* infrasys */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x30,
+		.rst_bank_ofs = infrasys_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 	},
 	/* pericfg */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x0,
+		.rst_bank_ofs = pericfg_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
 	}
 };
 
diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 10c2d14dd8c9..b76eb3e5623e 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -819,18 +819,21 @@ static const struct mtk_gate venclt_clks[] __initconst = {
 	GATE_VENCLT(CLK_VENCLT_CKE1, "venclt_cke1", "venclt_sel", 4),
 };
 
+static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
+static u16 pericfg_rst_ofs[] = { 0x0, 0x4, };
+
 static const struct mtk_clk_rst_desc clk_rst_desc[] = {
 	/* infrasys */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x30,
+		.rst_bank_ofs = infrasys_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 	},
 	/* pericfg */
 	{
 		.version = MTK_RST_SIMPLE,
-		.rst_bank_nr = 2,
-		.reg_ofs = 0x0,
+		.rst_bank_ofs = pericfg_rst_ofs,
+		.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
 	}
 };
 
diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 000029a0559e..cc51fff7f3d9 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -20,6 +20,9 @@
 
 /* Infra global controller reset set register */
 #define INFRA_RST0_SET_OFFSET		0x120
+#define INFRA_RST1_SET_OFFSET		0x130
+#define INFRA_RST2_SET_OFFSET		0x140
+#define INFRA_RST3_SET_OFFSET		0x150
 
 static DEFINE_SPINLOCK(mt8183_clk_lock);
 
@@ -1153,10 +1156,17 @@ static const struct mtk_pll_data plls[] = {
 		0, 0, 32, 8, 0x02B4, 1, 0x02BC, 0x0014, 1, 0x02B8, 0, 0x02B4),
 };
 
+static u16 infra_rst_ofs[] = {
+	INFRA_RST0_SET_OFFSET,
+	INFRA_RST1_SET_OFFSET,
+	INFRA_RST2_SET_OFFSET,
+	INFRA_RST3_SET_OFFSET,
+};
+
 static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.version = MTK_RST_SET_CLR,
-	.rst_bank_nr = 4,
-	.reg_ofs = INFRA_RST0_SET_OFFSET,
+	.rst_bank_ofs = infra_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infra_rst_ofs),
 };
 
 static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 47bc6b1842fd..11b2f74f121d 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -24,8 +24,8 @@ static int mtk_reset_update(struct reset_controller_dev *rcdev,
 	unsigned int val = deassert ? 0 : ~0;
 
 	return regmap_update_bits(data->regmap,
-				  data->desc->reg_ofs + ((id / 32) << 2),
-				  BIT(id % 32), val);
+				  data->desc->rst_bank_ofs[id / RST_NR_PER_BANK],
+				  BIT(id % RST_NR_PER_BANK), val);
 }
 
 static int mtk_reset_assert(struct reset_controller_dev *rcdev,
@@ -58,8 +58,9 @@ static int mtk_reset_update_set_clr(struct reset_controller_dev *rcdev,
 	unsigned int deassert_ofs = deassert ? 0x4 : 0;
 
 	return regmap_write(data->regmap,
-			    data->desc->reg_ofs + ((id / 32) << 4) + deassert_ofs,
-			    BIT(id % 32));
+			    data->desc->rst_bank_ofs[id / RST_NR_PER_BANK] +
+			    deassert_ofs,
+			    BIT(id % RST_NR_PER_BANK));
 }
 
 static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
@@ -135,7 +136,7 @@ void mtk_register_reset_controller(struct device_node *np,
 	data->desc = desc;
 	data->regmap = regmap;
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = desc->rst_bank_nr * 32;
+	data->rcdev.nr_resets = desc->rst_bank_nr * RST_NR_PER_BANK;
 	data->rcdev.ops = rcops;
 	data->rcdev.of_node = np;
 
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 91358e8cb851..482df8012c5c 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -9,6 +9,8 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 
+#define RST_NR_PER_BANK 32
+
 /**
  * enum mtk_reset_version - Version of MediaTek clock reset controller.
  * @MTK_RST_SIMPLE: Use the same registers for bit set and clear.
@@ -24,12 +26,12 @@ enum mtk_reset_version {
 /**
  * struct mtk_clk_rst_desc - Description of MediaTek clock reset.
  * @version: Reset version which is defined in enum mtk_reset_version.
- * @reg_ofs: Base offset of the reset register.
+ * @rst_bank_ofs: Pointer to an array containing base offsets of the reset register.
  * @rst_bank_nr: Quantity of reset bank.
  */
 struct mtk_clk_rst_desc {
 	u8 version;
-	u16 reg_ofs;
+	u16 *rst_bank_ofs;
 	u32 rst_bank_nr;
 };
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
