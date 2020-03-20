Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BCAC4332D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:33:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F362051A
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YFKTuAnj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D2Zkc4qT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3F362051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYrBg8N5P29YFJ3NALhrvxQUutX3qpgvl8KiLz743XI=; b=YFKTuAnjaKvjGG
	OKsYbk8u4yqdgWHFc6QPfn8uj25/nQbeip080DRJ6+UAaVuJwMgphpiFIDz7UzYPS2FI0iEnWovae
	eqq81dBiOXs/JTzEayQMOMcgJ2rLKHv2HPVyYHpDsy2Y7fCuKGDRwEPHovb+pe1BKpmCAHiwDS3vz
	wXKLUYbH28ahLey5JOQ0xVjykjkyvT+mO0HqVwqp24oqL9HCBhqjqdwQ/Wuw0DgF+jPf8O2/iFWGm
	SY4ZPSN0sIr1Peu03jpkfXE7qrSAd1SaGTBT37QGctLf69+O4TbwcveqH5FAw6AGA+68KMKJGitZo
	AsN9DX68hIC6KucrLquw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFC9v-0003sw-UA; Fri, 20 Mar 2020 07:33:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFC8x-0002xY-TC; Fri, 20 Mar 2020 07:32:38 +0000
X-UUID: 7b31718822774d89a2508db15a60d8ad-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UoBRWYbFNfabvInxJHk1WWSuIldaY4FrX1tZzVWLp/I=; 
 b=D2Zkc4qT6clv/mV3q+UPuAOPGXb1yd8ngQ21BpINcVgy0lB1QMv5e5gW2Dzs/qpS1f7gGe9oC1Dq5EQSkAjBtMf7JLcqWc4EDJcgWIq2mmsngZq102JneHj3SyWDL39YewQDKwio2CypEF5UvirXRsBVXEb6HwghyptF0fNv10A=;
X-UUID: 7b31718822774d89a2508db15a60d8ad-20200319
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 106053096; Thu, 19 Mar 2020 23:32:28 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 00:33:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 15:31:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Mar 2020 15:29:19 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <kernel@pengutronix.de>
Subject: [PATCH v13 05/11] soc: mediatek: Add multiple step bus protection
 control
Date: Fri, 20 Mar 2020 15:32:14 +0800
Message-ID: <1584689540-5227-6-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1584689540-5227-1-git-send-email-weiyi.lu@mediatek.com>
References: <1584689540-5227-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_003235_978397_7618AF90 
X-CRM114-Status: GOOD (  15.25  )
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
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Both MT8183 & MT6765 have more control steps of bus protection
than previous project. And there add more bus protection registers
reside at infracfg & smi-common.
Extend function to support multiple step bus protection control
with more customized arguments.
And then use bp_table for bus protection of all compatibles,
instead of mixing bus_prot_mask and bus_prot_reg_update.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 206 ++++++++++++++++++++++++++------------
 drivers/soc/mediatek/scpsys.h     |  42 +++++++-
 2 files changed, 182 insertions(+), 66 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index e50a568..a4fb0b23 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -88,9 +88,9 @@
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
@@ -98,9 +98,9 @@ struct scp_domain_data {
 	int ctl_offs;
 	u32 sram_pdn_bits;
 	u32 sram_pdn_ack_bits;
-	u32 bus_prot_mask;
 	const char *basic_clk_name[MAX_CLKS];
 	u8 caps;
+	struct bus_prot bp_table[MAX_STEPS];
 };
 
 struct scp;
@@ -124,8 +124,8 @@ struct scp {
 	struct device *dev;
 	void __iomem *base;
 	struct regmap *infracfg;
+	struct regmap *smi_common;
 	struct scp_ctrl_reg ctrl_reg;
-	bool bus_prot_reg_update;
 };
 
 struct scp_subdomain {
@@ -139,7 +139,6 @@ struct scp_soc_data {
 	const struct scp_subdomain *subdomains;
 	int num_subdomains;
 	const struct scp_ctrl_reg regs;
-	bool bus_prot_reg_update;
 };
 
 static int scpsys_domain_is_on(struct scp_domain *scpd)
@@ -249,53 +248,102 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 }
 
+static int set_bus_protection(struct regmap *map, struct bus_prot *bp)
+{
+	u32 val;
+	u32 set_ofs = bp->set_ofs;
+	u32 en_ofs = bp->en_ofs;
+	u32 sta_ofs = bp->sta_ofs;
+	u32 mask = bp->mask;
+
+	if (set_ofs)
+		regmap_write(map, set_ofs, mask);
+	else
+		regmap_update_bits(map, en_ofs, mask, mask);
+
+	return regmap_read_poll_timeout(map, sta_ofs,
+			val, (val & mask) == mask,
+			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
+static int clear_bus_protection(struct regmap *map, struct bus_prot *bp)
+{
+	u32 val;
+	u32 clr_ofs = bp->clr_ofs;
+	u32 en_ofs = bp->en_ofs;
+	u32 sta_ofs = bp->sta_ofs;
+	u32 mask = bp->mask;
+	bool ignore_ack = bp->ignore_clr_ack;
+
+	if (clr_ofs)
+		regmap_write(map, clr_ofs, mask);
+	else
+		regmap_update_bits(map, en_ofs, mask, 0);
+
+	if (ignore_ack)
+		return 0;
+
+	return regmap_read_poll_timeout(map, sta_ofs,
+			val, !(val & mask),
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
+	int i;
 
-	if (!mask)
-		return 0;
+	for (i = 0; i < MAX_STEPS; i++) {
+		struct regmap *map = NULL;
+		int ret;
+		struct bus_prot bp = bp_table[i];
 
-	if (reg_update)
-		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask,
-				mask);
-	else
-		regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_SET, mask);
+		if (bp.type == IFR_TYPE)
+			map = infracfg;
+		else if (bp.type == SMI_TYPE)
+			map = smi_common;
+		else
+			break;
 
-	ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
-				       val, (val & mask) == mask,
-				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		ret = set_bus_protection(map, &bp);
 
-	return ret;
+		if (ret)
+			return ret;
+	}
+
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
+	int i;
 
-	if (!mask)
-		return 0;
+	for (i = MAX_STEPS - 1; i >= 0; i--) {
+		struct regmap *map = NULL;
+		int ret;
+		struct bus_prot bp = bp_table[i];
 
-	if (reg_update)
-		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask, 0);
-	else
-		regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_CLR, mask);
+		if (bp.type == IFR_TYPE)
+			map = infracfg;
+		else if (bp.type == SMI_TYPE)
+			map = smi_common;
+		else
+			continue;
 
-	ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
-				       val, !(val & mask),
-				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		ret = clear_bus_protection(map, &bp);
 
-	return ret;
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int scpsys_power_on(struct generic_pm_domain *genpd)
@@ -430,8 +478,7 @@ static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
 
 static struct scp *init_scp(struct platform_device *pdev,
 			const struct scp_domain_data *scp_domain_data, int num,
-			const struct scp_ctrl_reg *scp_ctrl_reg,
-			bool bus_prot_reg_update)
+			const struct scp_ctrl_reg *scp_ctrl_reg)
 {
 	struct genpd_onecell_data *pd_data;
 	struct resource *res;
@@ -445,8 +492,6 @@ static struct scp *init_scp(struct platform_device *pdev,
 	scp->ctrl_reg.pwr_sta_offs = scp_ctrl_reg->pwr_sta_offs;
 	scp->ctrl_reg.pwr_sta2nd_offs = scp_ctrl_reg->pwr_sta2nd_offs;
 
-	scp->bus_prot_reg_update = bus_prot_reg_update;
-
 	scp->dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -474,6 +519,17 @@ static struct scp *init_scp(struct platform_device *pdev,
 		return ERR_CAST(scp->infracfg);
 	}
 
+	scp->smi_common = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+			"smi_comm");
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
@@ -556,8 +612,11 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -566,7 +625,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -701,7 +763,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -773,7 +838,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -820,7 +888,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -830,7 +901,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -840,7 +914,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -849,7 +926,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -863,8 +943,11 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -929,8 +1012,11 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
@@ -976,10 +1062,13 @@ static void mtk_register_power_domains(struct platform_device *pdev,
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
 
@@ -995,7 +1084,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = true,
 };
 
 static const struct scp_soc_data mt2712_data = {
@@ -1007,7 +1095,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = false,
 };
 
 static const struct scp_soc_data mt6797_data = {
@@ -1019,7 +1106,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS_MT6797,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797
 	},
-	.bus_prot_reg_update = true,
 };
 
 static const struct scp_soc_data mt7622_data = {
@@ -1029,7 +1115,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = true,
 };
 
 static const struct scp_soc_data mt7623a_data = {
@@ -1039,7 +1124,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = true,
 };
 
 static const struct scp_soc_data mt8173_data = {
@@ -1051,7 +1135,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.pwr_sta_offs = SPM_PWR_STATUS,
 		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
 	},
-	.bus_prot_reg_update = true,
 };
 
 /*
@@ -1092,8 +1175,7 @@ static int scpsys_probe(struct platform_device *pdev)
 
 	soc = of_device_get_match_data(&pdev->dev);
 
-	scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs,
-			soc->bus_prot_reg_update);
+	scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
diff --git a/drivers/soc/mediatek/scpsys.h b/drivers/soc/mediatek/scpsys.h
index ad2559b..45bc644 100644
--- a/drivers/soc/mediatek/scpsys.h
+++ b/drivers/soc/mediatek/scpsys.h
@@ -2,10 +2,28 @@
 #ifndef __SOC_MEDIATEK_SCPSYS_H
 #define __SOC_MEDIATEK_SCPSYS_H
 
-#define INFRA_TOPAXI_PROTECTEN		0x0220
-#define INFRA_TOPAXI_PROTECTSTA1	0x0228
-#define INFRA_TOPAXI_PROTECTEN_SET	0x0260
-#define INFRA_TOPAXI_PROTECTEN_CLR	0x0264
+#define MAX_STEPS	4
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
 
 #define MT2701_TOP_AXI_PROT_EN_MM_M0		BIT(1)
 #define MT2701_TOP_AXI_PROT_EN_CONN_M		BIT(2)
@@ -25,4 +43,20 @@
 #define MT8173_TOP_AXI_PROT_EN_MFG_M1		BIT(22)
 #define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT	BIT(23)
 
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
 #endif /* __SOC_MEDIATEK_SCPSYS_H */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
