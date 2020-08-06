Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D91C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:21:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D9B2204FD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ozXXEg4o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bGnTpvqZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D9B2204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8zqTN3ZipwtDo9+L5hRN5Ao79xyZRzFKP7Xn/wPukbc=; b=ozXXEg4ov+I8Z0j9In87klwaF
	k95mC8jxA7X+Q9P7OuY7oZn7AwSqvRsGSDaZ0k6UZM9Ptjswu0I8mdmRTfJ7NZgbAcrFO2jvYXfML
	t58qLItS6c8fh7bdNuB6Mx+VC4N8xr3zk59ljt0QVOe+AKJjGwsb2KuxgB3hw8P2IpE0zsEoHaGmJ
	xa6+sx2yMUWFSszP5PnG6/IpUK64gdGTwsJvr68N0S2MWL2KnSb4262EP5TF9bT/Ai57xWtQjiTIO
	IJ0bzaN6Y/Nq3D0FqpIvH7hnEVzpZ95sbcG3fJIw0G9ZYbSd8qn5v8PYF8FK73owyi80fBPHiKNf6
	GsbuapS8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3c6h-0005SZ-IR; Thu, 06 Aug 2020 09:22:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3c6K-0005HS-Ad; Thu, 06 Aug 2020 09:22:21 +0000
X-UUID: ac1514a9cb054c48a60fd8e9a823c831-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ba75fM0VjTKHAE9XPGljKPGkzlTAuuWqH7iwRK5LbtA=; 
 b=bGnTpvqZQW/uQ3vdn/KqACKDPCqo7a0TNQ8p4I5wzc8tdLGkvfYD47W6fG8da+rHCl928/aUU0nCHIwY9cLKFnE2htc4++AgPCwXpbM6meYKLRF8cPPp/ex4KXvFKiYQn3zwk/3/MEa+eP7NombprLmWoV+m8z2zWijUC47qsYQ=;
X-UUID: ac1514a9cb054c48a60fd8e9a823c831-20200806
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1162218172; Thu, 06 Aug 2020 01:22:05 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 02:22:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 17:21:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 17:21:59 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH v17 04/12] soc: mediatek: Add multiple step bus protection
 control
Date: Thu, 6 Aug 2020 17:21:47 +0800
Message-ID: <1596705715-15320-5-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_052216_673130_7764BACF 
X-CRM114-Status: GOOD (  22.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8192, MT8183 and MT6765 have more control steps of bus protection
than previous project. And there add more bus protection registers
reside at infracfg & smi-common.
Extend function to support multiple step bus protection control
with more customized arguments.
And then use bp_table for bus protection of all compatibles,
instead of mixing bus_prot_mask and bus_prot_reg_update.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 235 +++++++++++++++++++++++++++-----------
 1 file changed, 168 insertions(+), 67 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index b603af7..5a2c323 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -78,11 +78,6 @@
 #define PWR_STATUS_HIF1			BIT(26)	/* MT7622 */
 #define PWR_STATUS_WB			BIT(27)	/* MT7622 */
 
-#define INFRA_TOPAXI_PROTECTEN		0x0220
-#define INFRA_TOPAXI_PROTECTSTA1	0x0228
-#define INFRA_TOPAXI_PROTECTEN_SET	0x0260
-#define INFRA_TOPAXI_PROTECTEN_CLR	0x0264
-
 #define MT2701_TOP_AXI_PROT_EN_MM_M0		BIT(1)
 #define MT2701_TOP_AXI_PROT_EN_CONN_M		BIT(2)
 #define MT2701_TOP_AXI_PROT_EN_CONN_S		BIT(8)
@@ -103,6 +98,45 @@
 
 #define MAX_CLKS	3
 
+#define MAX_STEPS	5
+
+#define _BUS_PROT(_type, _set_ofs, _clr_ofs,			\
+		_en_ofs, _sta_ofs, _mask, _ignore_clr_ack) {	\
+		.type = _type,					\
+		.set_ofs = _set_ofs,				\
+		.clr_ofs = _clr_ofs,				\
+		.en_ofs = _en_ofs,				\
+		.sta_ofs = _sta_ofs,				\
+		.mask = _mask,					\
+		.ignore_clr_ack = _ignore_clr_ack,		\
+	}
+
+#define BUS_PROT(_type, _set_ofs, _clr_ofs,		\
+		_en_ofs, _sta_ofs, _mask)		\
+		_BUS_PROT(_type, _set_ofs, _clr_ofs,	\
+		_en_ofs, _sta_ofs, _mask, false)
+
+#define BUS_PROT_IGN(_type, _set_ofs, _clr_ofs,	\
+		_en_ofs, _sta_ofs, _mask)		\
+		_BUS_PROT(_type, _set_ofs, _clr_ofs,	\
+		_en_ofs, _sta_ofs, _mask, true)
+
+enum regmap_type {
+	INVALID_TYPE = 0,
+	IFR_TYPE,
+	SMI_TYPE,
+};
+
+struct bus_prot {
+	enum regmap_type type;
+	u32 set_ofs;
+	u32 clr_ofs;
+	u32 en_ofs;
+	u32 sta_ofs;
+	u32 mask;
+	bool ignore_clr_ack;
+};
+
 /**
  * struct scp_domain_data - scp domain data for power on/off flow
  * @name: The domain name.
@@ -110,9 +144,9 @@
  * @ctl_offs: The offset for main power control register.
  * @sram_pdn_bits: The mask for sram power control bits.
  * @sram_pdn_ack_bits: The mask for sram power control acked bits.
- * @bus_prot_mask: The mask for single step bus protection.
  * @basic_clk_name: The basic clocks required by this power domain.
  * @caps: The flag for active wake-up action.
+ * @bp_table: The mask table for multiple step bus protection.
  */
 struct scp_domain_data {
 	const char *name;
@@ -120,9 +154,9 @@ struct scp_domain_data {
 	int ctl_offs;
 	u32 sram_pdn_bits;
 	u32 sram_pdn_ack_bits;
-	u32 bus_prot_mask;
 	const char *basic_clk_name[MAX_CLKS];
 	u8 caps;
+	struct bus_prot bp_table[MAX_STEPS];
 };
 
 struct scp;
@@ -146,8 +180,8 @@ struct scp {
 	struct device *dev;
 	void __iomem *base;
 	struct regmap *infracfg;
+	struct regmap *smi_common;
 	struct scp_ctrl_reg ctrl_reg;
-	bool bus_prot_reg_update;
 };
 
 struct scp_subdomain {
@@ -161,7 +195,6 @@ struct scp_soc_data {
 	const struct scp_subdomain *subdomains;
 	int num_subdomains;
 	const struct scp_ctrl_reg regs;
-	bool bus_prot_reg_update;
 };
 
 static int scpsys_domain_is_on(struct scp_domain *scpd)
@@ -271,53 +304,87 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 }
 
+static int set_bus_protection(struct regmap *map, const struct bus_prot *bp)
+{
+	u32 val;
+
+	if (bp->set_ofs)
+		regmap_write(map, bp->set_ofs, bp->mask);
+	else
+		regmap_update_bits(map, bp->en_ofs, bp->mask, bp->mask);
+
+	return regmap_read_poll_timeout(map, bp->sta_ofs,
+			val, (val & bp->mask) == bp->mask,
+			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
+static int clear_bus_protection(struct regmap *map, const struct bus_prot *bp)
+{
+	u32 val;
+
+	if (bp->clr_ofs)
+		regmap_write(map, bp->clr_ofs, bp->mask);
+	else
+		regmap_update_bits(map, bp->en_ofs, bp->mask, 0);
+
+	if (bp->ignore_clr_ack)
+		return 0;
+
+	return regmap_read_poll_timeout(map, bp->sta_ofs,
+			val, !(val & bp->mask),
+			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
 static int scpsys_bus_protect_enable(struct scp_domain *scpd)
 {
 	struct scp *scp = scpd->scp;
+	const struct bus_prot *bp_table = scpd->data->bp_table;
 	struct regmap *infracfg = scp->infracfg;
-	u32 mask = scpd->data->bus_prot_mask;
-	bool reg_update = scp->bus_prot_reg_update;
-	u32 val;
-	int ret;
+	struct regmap *smi_common = scp->smi_common;
+	struct regmap *map;
+	int i, ret;
 
-	if (!mask)
-		return 0;
+	for (i = 0; i < MAX_STEPS; i++) {
+		if (bp_table[i].type == IFR_TYPE)
+			map = infracfg;
+		else if (bp_table[i].type == SMI_TYPE)
+			map = smi_common;
+		else
+			break;
 
-	if (reg_update)
-		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask,
-				mask);
-	else
-		regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_SET, mask);
+		ret = set_bus_protection(map, &bp_table[i]);
 
-	ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
-				       val, (val & mask) == mask,
-				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		if (ret)
+			return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int scpsys_bus_protect_disable(struct scp_domain *scpd)
 {
 	struct scp *scp = scpd->scp;
+	const struct bus_prot *bp_table = scpd->data->bp_table;
 	struct regmap *infracfg = scp->infracfg;
-	u32 mask = scpd->data->bus_prot_mask;
-	bool reg_update = scp->bus_prot_reg_update;
-	u32 val;
-	int ret;
+	struct regmap *smi_common = scp->smi_common;
+	struct regmap *map;
+	int i, ret;
 
-	if (!mask)
-		return 0;
+	for (i = MAX_STEPS - 1; i >= 0; i--) {
+		if (bp_table[i].type == IFR_TYPE)
+			map = infracfg;
+		else if (bp_table[i].type == SMI_TYPE)
+			map = smi_common;
+		else
+			continue;
 
-	if (reg_update)
-		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask, 0);
-	else
-		regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_CLR, mask);
+		ret = clear_bus_protection(map, &bp_table[i]);
 
-	ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
-				       val, !(val & mask),
-				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		if (ret)
+			return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int scpsys_power_on(struct generic_pm_domain *genpd)
@@ -448,8 +515,7 @@ static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
 
 static struct scp *init_scp(struct platform_device *pdev,
 			const struct scp_domain_data *scp_domain_data, int num,
-			const struct scp_ctrl_reg *scp_ctrl_reg,
-			bool bus_prot_reg_update)
+			const struct scp_ctrl_reg *scp_ctrl_reg)
 {
 	struct genpd_onecell_data *pd_data;
 	struct resource *res;
@@ -463,8 +529,6 @@ static struct scp *init_scp(struct platform_device *pdev,
 	scp->ctrl_reg.pwr_sta_offs = scp_ctrl_reg->pwr_sta_offs;
 	scp->ctrl_reg.pwr_sta2nd_offs = scp_ctrl_reg->pwr_sta2nd_offs;
 
-	scp->bus_prot_reg_update = bus_prot_reg_update;
-
 	scp->dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -492,6 +556,17 @@ static struct scp *init_scp(struct platform_device *pdev,
 		return ERR_CAST(scp->infracfg);
 	}
 
+	scp->smi_common = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+			"mediatek,smi");
+
+	if (scp->smi_common == ERR_PTR(-ENODEV)) {
+		scp->smi_common = NULL;
+	} else if (IS_ERR(scp->smi_common)) {
+		dev_err(&pdev->dev, "Cannot find smi_common controller: %ld\n",
+				PTR_ERR(scp->smi_common));
+		return ERR_CAST(scp->smi_common);
+	}
+
 	for (i = 0; i < num; i++) {
 		struct scp_domain *scpd = &scp->domains[i];
 		const struct scp_domain_data *data = &scp_domain_data[i];
@@ -574,8 +649,11 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.name = "conn",
 		.sta_mask = PWR_STATUS_CONN,
 		.ctl_offs = SPM_CONN_PWR_CON,
-		.bus_prot_mask = MT2701_TOP_AXI_PROT_EN_CONN_M |
-				 MT2701_TOP_AXI_PROT_EN_CONN_S,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT2701_TOP_AXI_PROT_EN_CONN_M |
+				MT2701_TOP_AXI_PROT_EN_CONN_S),
+		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT2701_POWER_DOMAIN_DISP] = {
@@ -584,7 +662,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.ctl_offs = SPM_DIS_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.basic_clk_name = {"mm"},
-		.bus_prot_mask = MT2701_TOP_AXI_PROT_EN_MM_M0,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT2701_TOP_AXI_PROT_EN_MM_M0),
+		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT2701_POWER_DOMAIN_MFG] = {
@@ -719,7 +800,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(16, 16),
 		.basic_clk_name = {"mfg"},
-		.bus_prot_mask = BIT(14) | BIT(21) | BIT(23),
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x260, 0x264, 0x220, 0x228,
+				BIT(14) | BIT(21) | BIT(23)),
+		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT2712_POWER_DOMAIN_MFG_SC1] = {
@@ -791,7 +875,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.basic_clk_name = {"mm"},
-		.bus_prot_mask = (BIT(1) | BIT(2)),
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				BIT(1) | BIT(2)),
+		},
 	},
 	[MT6797_POWER_DOMAIN_AUDIO] = {
 		.name = "audio",
@@ -838,7 +925,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.ctl_offs = SPM_ETHSYS_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
-		.bus_prot_mask = MT7622_TOP_AXI_PROT_EN_ETHSYS,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT7622_TOP_AXI_PROT_EN_ETHSYS),
+		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT7622_POWER_DOMAIN_HIF0] = {
@@ -848,7 +938,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 		.basic_clk_name = {"hif_sel"},
-		.bus_prot_mask = MT7622_TOP_AXI_PROT_EN_HIF0,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT7622_TOP_AXI_PROT_EN_HIF0),
+		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT7622_POWER_DOMAIN_HIF1] = {
@@ -858,7 +951,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 		.basic_clk_name = {"hif_sel"},
-		.bus_prot_mask = MT7622_TOP_AXI_PROT_EN_HIF1,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT7622_TOP_AXI_PROT_EN_HIF1),
+		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT7622_POWER_DOMAIN_WB] = {
@@ -867,7 +963,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.ctl_offs = SPM_WB_PWR_CON,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
-		.bus_prot_mask = MT7622_TOP_AXI_PROT_EN_WB,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT7622_TOP_AXI_PROT_EN_WB),
+		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP | MTK_SCPD_FWAIT_SRAM,
 	},
 };
@@ -881,8 +980,11 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.name = "conn",
 		.sta_mask = PWR_STATUS_CONN,
 		.ctl_offs = SPM_CONN_PWR_CON,
-		.bus_prot_mask = MT2701_TOP_AXI_PROT_EN_CONN_M |
-				 MT2701_TOP_AXI_PROT_EN_CONN_S,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT2701_TOP_AXI_PROT_EN_CONN_M |
+				MT2701_TOP_AXI_PROT_EN_CONN_S),
+		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT7623A_POWER_DOMAIN_ETH] = {
@@ -947,8 +1049,11 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.basic_clk_name = {"mm"},
-		.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MM_M0 |
-			MT8173_TOP_AXI_PROT_EN_MM_M1,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT8173_TOP_AXI_PROT_EN_MM_M0 |
+				MT8173_TOP_AXI_PROT_EN_MM_M1),
+		},
 	},
 	[MT8173_POWER_DOMAIN_VENC_LT] = {
 		.name = "venc_lt",
@@ -994,10 +1099,13 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.ctl_offs = SPM_MFG_PWR_CON,
 		.sram_pdn_bits = GENMASK(13, 8),
 		.sram_pdn_ack_bits = GENMASK(21, 16),
-		.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MFG_S |
-			MT8173_TOP_AXI_PROT_EN_MFG_M0 |
-			MT8173_TOP_AXI_PROT_EN_MFG_M1 |
-			MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
+				MT8173_TOP_AXI_PROT_EN_MFG_S |
+				MT8173_TOP_AXI_PROT_EN_MFG_M0 |
+				MT8173_TOP_AXI_PROT_EN_MFG_M1 |
+				MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT),
+		},
 	},
 };
 
@@ -1013,7 +1121,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = true,
 };
 
 static const struct scp_soc_data mt2712_data = {
@@ -1025,7 +1132,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = false,
 };
 
 static const struct scp_soc_data mt6797_data = {
@@ -1037,7 +1143,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS_MT6797,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797
 	},
-	.bus_prot_reg_update = true,
 };
 
 static const struct scp_soc_data mt7622_data = {
@@ -1047,7 +1152,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = true,
 };
 
 static const struct scp_soc_data mt7623a_data = {
@@ -1057,7 +1161,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = true,
 };
 
 static const struct scp_soc_data mt8173_data = {
@@ -1069,7 +1172,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = true,
 };
 
 /*
@@ -1110,8 +1212,7 @@ static int scpsys_probe(struct platform_device *pdev)
 
 	soc = of_device_get_match_data(&pdev->dev);
 
-	scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs,
-			soc->bus_prot_reg_update);
+	scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
