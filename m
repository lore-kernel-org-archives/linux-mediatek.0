Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D8FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPvq4EnHCh9AY+BgbqWKK2kgy3acpU6Z0kk+9kgNKWs=; b=NMczh8iK76KnT3
	aMYt7/DncvY/YXJiNwvZT3CLSrf7YtTtPU1svlXOiM/xKRHitCkqsQVmJn5XqRGVzPj6noTNrp/xh
	Bb7p+yOLK95oswee16D7ocQc4f+skFTWpx7phdrCFUwNton/lIru5Q+MComxV1e82+kdWPtPzrBad
	CtWT68x6vWiKBZkJuDSCBy1KjCOdBIxVB2DycGSHy3ylBpIyxfwllcN7qObQNSlRClXyeHBJzmL38
	D30ysTv2QB8s8ngyWsd1bWeZ8Id+8CHizwHhklao2PG02QdHEysi6r1Ab+vMxn/CVgGWGAGulWtu3
	vB/8/ue+vSj+/20/ggBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlp2c-004s7S-FH; Tue, 03 May 2022 09:41:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlozv-004qGM-L4; Tue, 03 May 2022 09:39:15 +0000
X-UUID: c4314902c1a94c5fad04207724063b6b-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9936ece9-e771-482b-84e9-f071e591f875, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:77f54fc7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c4314902c1a94c5fad04207724063b6b-20220503
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 403440229; Tue, 03 May 2022 02:39:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 02:39:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 17:38:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 3 May 2022 17:38:59 +0800
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
Subject: [PATCH v6 07/16] clk: mediatek: reset: Support nonsequence base
 offsets of reset registers
Date: Tue, 3 May 2022 17:38:47 +0800
Message-ID: <20220503093856.22250-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_023911_781085_A1F0A133 
X-CRM114-Status: GOOD (  16.03  )
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
index 2cc35dfdbca7..0ae4bce3bb37 100644
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
index 0905d5c12691..8d2053517ddc 100644
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
index 24d5bac1bb9b..e40865a6f45e 100644
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
index 70a934faa529..572d62f76e96 100644
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
index cef7c79788ec..9eb8866ec77a 100644
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
index b6da1871a1f9..b58fe61a8443 100644
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
index c2841deb52a5..1ee79d4837a4 100644
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
index 880e752527a9..8ebd66dcb946 100644
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
index e054aa1e1479..56ff7c1f6ec1 100644
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
index ab085092041e..fc12110b04fc 100644
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
index a4cfc094895c..8b7fb5e2c5c2 100644
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
index cba1495b2a67..4228ee56da37 100644
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
index 3517eca5ee83..de4ba5e055ca 100644
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
