Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B253C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8MsNMAtgJ9u6U5BiH2pMWKJ+kiG/BS7o+mHTXW4has=; b=dm+AbOk1UsT/SPWtbhvvzLXOfA
	a/IKGLW0pes7mLMJb+6DxG2sjqKdCAD+HqUGmLlGe8v52hWHwk+Am78WlNZ6T03g1Xiaa7lbLFvlY
	AFj4ITh5uQfIbNbCuN7JM/dZ0MWUiyPYQ8oGZjEOBowoRrF3gefjL/XeKZaS/J8pi7WyPQBCI5SvE
	VbcyxMb2o2djgSSgy8MR76TWbQD2C+/g5DzWOztrmTQRh37y7oVU8bBaumRMrAlfdFk5eEGdbfhA2
	FX9u8moPZHX350xpXEpFfxSv654jJAHfjNvZXTAsIiApz89OGp2V7y1MWtChai1sVyrq/Sgwaz2Qb
	Nw8c2YLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMIP-00000007ayy-2aHb;
	Wed, 27 Mar 2024 05:57:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMIL-00000007avC-48fe;
	Wed, 27 Mar 2024 05:57:55 +0000
X-UUID: f01e2776ebfe11ee96d5dfc950b7243d-20240326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=C8MsNMAtgJ9u6U5BiH2pMWKJ+kiG/BS7o+mHTXW4has=;
	b=oD7iwkEPzy8W8qr/UtxGDHsb6Ug01XMViS8vsoH2XQoej4gJ144mWq2JLtfSoK4kK4PlGOpDFJrZz8KSZU94g7FDEGnLOKZ04iA/G+eSf00/2L2219LEBxlrLLO/qcTGDjhssIbJGLr1GmzOVw1mHgiW3gdclParzlT+eg2WwiU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:add4da38-016a-43a4-af51-5a5bb3fa57fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:60676000-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f01e2776ebfe11ee96d5dfc950b7243d-20240326
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1548985872; Tue, 26 Mar 2024 22:57:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Mar 2024 13:57:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Mar 2024 13:57:34 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"MandyJH Liu" <mandyjh.liu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <fan.chen@mediatek.com>,
	<xiufeng.li@mediatek.com>, <yu-chang.lee@mediatek.com>
Subject: [PATCH v2 1/3] pmdomain: mediatek: add smi_larb_reset function when power on
Date: Wed, 27 Mar 2024 13:57:30 +0800
Message-ID: <20240327055732.28198-2-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
References: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.880400-8.000000
X-TMASE-MatchedRID: l7g8wxsUa9rSuXLpNqOJSR+WEMjoO9WWTJDl9FKHbrkKogmGusPLb9ro
	EGQiudNyN/7rnrBxoxyzFPg/Y3uT4hHdGMlurS25JmbrB1j4XwoOPDBPSvoRdDuM/8xRTTt71/H
	hkIjNCSaZ2BL2I+8mdgpVS+XW10LYBLIUC3yGa8rhuXUWQoMQt30tCKdnhB589yM15V5aWpj6C0
	ePs7A07b4iOwQQ4jNi7Nj4c9lWXYH8ma3saMV3PsZrmPDoYt2pBWYtVDOiGBA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.880400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BD9B2BA20D29EE6E1FA8A379423556C080388F387963D2F58893C5ED1598649F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_225754_071961_58F8D90F 
X-CRM114-Status: GOOD (  18.01  )
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

This patch avoid mtcmos power glitch from happening by set and clear
smi larb reset.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
---
 drivers/pmdomain/mediatek/mt8188-pm-domains.h | 28 +++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 59 +++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.h    | 12 ++++
 3 files changed, 99 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mt8188-pm-domains.h b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
index 06834ab6597c..7bbba4d56a77 100644
--- a/drivers/pmdomain/mediatek/mt8188-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
@@ -573,6 +573,18 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.pwr_sta2nd_offs = 0x170,
 		.sram_pdn_bits = BIT(8),
 		.sram_pdn_ack_bits = BIT(12),
+		.reset_smi = {
+			SMI_RESET_WR(MT8188_SMI_LARB10_RESET,
+				     MT8188_SMI_LARB10_RESET_ADDR),
+			SMI_RESET_WR(MT8188_SMI_LARB11A_RESET,
+				     MT8188_SMI_LARB11A_RESET_ADDR),
+			SMI_RESET_WR(MT8188_SMI_LARB11C_RESET,
+				     MT8188_SMI_LARB11C_RESET_ADDR),
+			SMI_RESET_WR(MT8188_SMI_LARB11B_RESET,
+				     MT8188_SMI_LARB11B_RESET_ADDR),
+			SMI_RESET_WR(MT8188_SMI_LARB15_RESET,
+				     MT8188_SMI_LARB15_RESET_ADDR),
+		},
 		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8188_POWER_DOMAIN_IPE] = {
@@ -583,6 +595,10 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.pwr_sta2nd_offs = 0x170,
 		.sram_pdn_bits = BIT(8),
 		.sram_pdn_ack_bits = BIT(12),
+		.reset_smi = {
+			SMI_RESET_WR(MT8188_SMI_LARB12_RESET,
+				     MT8188_SMI_LARB12_RESET_ADDR),
+		},
 		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8188_POWER_DOMAIN_CAM_VCORE] = {
@@ -660,6 +676,12 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.pwr_sta2nd_offs = 0x170,
 		.sram_pdn_bits = BIT(8),
 		.sram_pdn_ack_bits = BIT(12),
+		.reset_smi = {
+			SMI_RESET_WR(MT8188_SMI_LARB16A_RESET,
+				     MT8188_SMI_LARB16A_RESET_ADDR),
+			SMI_RESET_WR(MT8188_SMI_LARB17A_RESET,
+				     MT8188_SMI_LARB17A_RESET_ADDR),
+		},
 		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8188_POWER_DOMAIN_CAM_SUBB] = {
@@ -670,6 +692,12 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.pwr_sta2nd_offs = 0x170,
 		.sram_pdn_bits = BIT(8),
 		.sram_pdn_ack_bits = BIT(12),
+		.reset_smi = {
+			SMI_RESET_WR(MT8188_SMI_LARB16B_RESET,
+				     MT8188_SMI_LARB16B_RESET_ADDR),
+			SMI_RESET_WR(MT8188_SMI_LARB17B_RESET,
+				     MT8188_SMI_LARB17B_RESET_ADDR),
+		},
 		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 };
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index e274e3315fe7..9ab6fa105c8c 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -48,6 +48,8 @@ struct scpsys_domain {
 	struct regmap *infracfg_nao;
 	struct regmap *infracfg;
 	struct regmap *smi;
+	struct regmap **larb;
+	int num_larb;
 	struct regulator *supply;
 };
 
@@ -230,6 +232,39 @@ static int scpsys_regulator_disable(struct regulator *supply)
 	return supply ? regulator_disable(supply) : 0;
 }
 
+static int _scpsys_smi_larb_reset(const struct smi_reset_data bpd,
+				  struct regmap *regmap)
+{
+	int ret;
+	u32 mask = bpd.smi_reset_mask;
+
+	if (!mask)
+		return 0;
+
+	ret = regmap_set_bits(regmap, bpd.smi_reset_addr, mask);
+	if (ret)
+		return ret;
+
+	ret = regmap_clear_bits(regmap, bpd.smi_reset_addr, mask);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int scpsys_smi_larb_reset(struct scpsys_domain *pd)
+{
+	int ret, i;
+
+	for (i = 0; i < pd->num_larb; i++) {
+		ret = _scpsys_smi_larb_reset(pd->data->reset_smi[i], pd->larb[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
@@ -279,6 +314,10 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto err_disable_subsys_clks;
 
+	ret = scpsys_smi_larb_reset(pd);
+	if (ret < 0)
+		goto err_disable_subsys_clks;
+
 	ret = scpsys_bus_protect_disable(pd);
 	if (ret < 0)
 		goto err_disable_sram;
@@ -355,6 +394,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	struct scpsys_domain *pd;
 	struct device_node *root_node = scpsys->dev->of_node;
 	struct device_node *smi_node;
+	struct device_node *larb_node;
 	struct property *prop;
 	const char *clk_name;
 	int i, ret, num_clks;
@@ -418,6 +458,25 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 			return ERR_CAST(pd->smi);
 	}
 
+	pd->num_larb = of_count_phandle_with_args(node, "mediatek,larb", NULL);
+	if (pd->num_larb > 0) {
+		pd->larb = devm_kcalloc(scpsys->dev, pd->num_larb, sizeof(*pd->larb), GFP_KERNEL);
+		if (!pd->larb)
+			return ERR_PTR(-ENOMEM);
+
+		for (i = 0; i < pd->num_larb; i++) {
+			larb_node = of_parse_phandle(node, "mediatek,larb", i);
+			if (!larb_node)
+				return ERR_PTR(-EINVAL);
+
+			pd->larb[i] = device_node_to_regmap(larb_node);
+			if (IS_ERR(pd->larb[i]))
+				return ERR_CAST(pd->larb[i]);
+		}
+	} else {
+		pd->num_larb = 0;
+	}
+
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_HAS_INFRA_NAO)) {
 		pd->infracfg_nao = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
 		if (IS_ERR(pd->infracfg_nao))
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index aaba5e6b0536..31c2a1bb500f 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -43,6 +43,7 @@
 #define PWR_STATUS_USB			BIT(25)
 
 #define SPM_MAX_BUS_PROT_DATA		6
+#define SPM_MAX_SMI_RESET_DATA		6
 
 enum scpsys_bus_prot_flags {
 	BUS_PROT_REG_UPDATE = BIT(1),
@@ -79,6 +80,16 @@ enum scpsys_bus_prot_flags {
 				INFRA_TOPAXI_PROTECTEN,		\
 				INFRA_TOPAXI_PROTECTSTA1)
 
+#define SMI_RESET_WR(_mask, _addr) {		\
+		.smi_reset_mask = (_mask),	\
+		.smi_reset_addr = _addr,	\
+	}
+
+struct smi_reset_data {
+	u32 smi_reset_mask;
+	u32 smi_reset_addr;
+};
+
 struct scpsys_bus_prot_data {
 	u32 bus_prot_set_clr_mask;
 	u32 bus_prot_set;
@@ -110,6 +121,7 @@ struct scpsys_domain_data {
 	u32 ext_buck_iso_mask;
 	u16 caps;
 	const struct scpsys_bus_prot_data bp_cfg[SPM_MAX_BUS_PROT_DATA];
+	const struct smi_reset_data reset_smi[SPM_MAX_SMI_RESET_DATA];
 	int pwr_sta_offs;
 	int pwr_sta2nd_offs;
 };
-- 
2.18.0


