Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AADC4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:02:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EA1920872
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wcmg7FQj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EA1920872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7MlzF2dBFwU/4CjCqe5WW8jBx7blERLqyq5cimJglhQ=; b=Wcmg7FQjBmITPrn80FROMaJ3v
	8CQn9IKYPScFHT6IiAYBAGVc2zpsYvU1h/IBFbMi5hisG0TX1KvDLjj11QZ9v5tFGxfQddyEjRC2G
	x1Aep0Iy4Z0FhwAXEcv0VOZdZ7byUIDw58EAjDTspF+iSBzP5eMNTuTulvrroKtXBJ/KFrInaKO2D
	nsXTAHpWwZlHVHT6gbP+5rIHChtE3HJE/X61o6m0SOZ6V5zPFyhllyfNtbYfSpmAE5F0Qbq0ulOhn
	HQ+iHNhLB86CRES+tDhhg0qKAGRp70FqnVIGCx5mAgQisa5YGnfk9c5tqzPMBnEeQzo13yjpf6vM5
	XQ/2qXLhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO12d-0000It-R9; Thu, 01 Oct 2020 16:02:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO120-0008PI-5u; Thu, 01 Oct 2020 16:02:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id CB7B329D764
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/12] soc: mediatek: pm-domains: Add SMI block as bus
 protection block
Date: Thu,  1 Oct 2020 18:01:48 +0200
Message-Id: <20201001160154.3587848-7-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001160154.3587848-1-enric.balletbo@collabora.com>
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_120208_433134_432A13AC 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Apart from the infracfg block, the SMI block is used to enable the bus
protection for some power domains. Add support for this block.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2: None

 drivers/soc/mediatek/mtk-pm-domains.c | 64 ++++++++++++++++++++-------
 include/linux/soc/mediatek/infracfg.h |  6 +++
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index b5e7c9846c34..38f2630bdd0a 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -56,8 +56,25 @@
 
 #define SPM_MAX_BUS_PROT_DATA		3
 
+#define _BUS_PROT(_mask, _set, _clr, _sta, _update) {	\
+		.bus_prot_mask = (_mask),		\
+		.bus_prot_set = _set,			\
+		.bus_prot_clr = _clr,			\
+		.bus_prot_sta = _sta,			\
+		.bus_prot_reg_update = _update,		\
+	}
+
+#define BUS_PROT_WR(_mask, _set, _clr, _sta)		\
+		_BUS_PROT(_mask, _set, _clr, _sta, false)
+
+#define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)		\
+		_BUS_PROT(_mask, _set, _clr, _sta, true)
+
 struct scpsys_bus_prot_data {
 	u32 bus_prot_mask;
+	u32 bus_prot_set;
+	u32 bus_prot_clr;
+	u32 bus_prot_sta;
 	bool bus_prot_reg_update;
 };
 
@@ -69,6 +86,7 @@ struct scpsys_bus_prot_data {
  * @sram_pdn_ack_bits: The mask for sram power control acked bits.
  * @caps: The flag for active wake-up action.
  * @bp_infracfg: bus protection for infracfg subsystem
+ * @bp_smi: bus protection for smi subsystem
  */
 struct scpsys_domain_data {
 	u32 sta_mask;
@@ -77,6 +95,7 @@ struct scpsys_domain_data {
 	u32 sram_pdn_ack_bits;
 	u8 caps;
 	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
+	const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
 };
 
 struct scpsys_domain {
@@ -86,6 +105,7 @@ struct scpsys_domain {
 	int num_clks;
 	struct clk_bulk_data *clks;
 	struct regmap *infracfg;
+	struct regmap *smi;
 };
 
 struct scpsys_soc_data {
@@ -175,9 +195,9 @@ static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, st
 		if (bpd[i].bus_prot_reg_update)
 			regmap_update_bits(regmap, INFRA_TOPAXI_PROTECTEN, mask, mask);
 		else
-			regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_SET, mask);
+			regmap_write(regmap, bpd[i].bus_prot_set, mask);
 
-		ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
+		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
 					       val, (val & mask) == mask,
 					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
@@ -193,7 +213,11 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
 	int ret;
 
 	ret = _scpsys_bus_protect_enable(bpd, pd->infracfg);
-	return ret;
+	if (ret)
+		return ret;
+
+	bpd = pd->data->bp_smi;
+	return _scpsys_bus_protect_enable(bpd, pd->smi);
 }
 
 static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
@@ -208,11 +232,11 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 			return 0;
 
 		if (bpd[i].bus_prot_reg_update)
-			regmap_update_bits(regmap, INFRA_TOPAXI_PROTECTEN, mask, 0);
+			regmap_update_bits(regmap, bpd[i].bus_prot_set, mask, 0);
 		else
-			regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_CLR, mask);
+			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
 
-		ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
+		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
 					       val, !(val & mask),
 					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
@@ -228,7 +252,11 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
 	int ret;
 
 	ret = _scpsys_bus_protect_disable(bpd, pd->infracfg);
-	return ret;
+	if (ret)
+		return ret;
+
+	bpd = pd->data->bp_smi;
+	return _scpsys_bus_protect_disable(bpd, pd->smi);
 }
 
 static int scpsys_power_on(struct generic_pm_domain *genpd)
@@ -358,6 +386,10 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
 	if (IS_ERR(pd->infracfg))
 		pd->infracfg = NULL;
 
+	pd->smi = syscon_regmap_lookup_by_phandle(node, "mediatek,smi");
+	if (IS_ERR(pd->smi))
+		pd->smi = NULL;
+
 	pd->num_clks = of_clk_get_parent_count(node);
 	if (pd->num_clks > 0) {
 		pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
@@ -528,10 +560,9 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_DIS_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
-		.bp_infracfg[0] = {
-			.bus_prot_reg_update = true,
-			.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MM_M0 |
-				MT8173_TOP_AXI_PROT_EN_MM_M1,
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_MT8173(MT8173_TOP_AXI_PROT_EN_MM_M0 |
+					       MT8173_TOP_AXI_PROT_EN_MM_M1),
 		},
 	},
 	[MT8173_POWER_DOMAIN_VENC_LT] = {
@@ -570,12 +601,11 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_MFG_PWR_CON,
 		.sram_pdn_bits = GENMASK(13, 8),
 		.sram_pdn_ack_bits = GENMASK(21, 16),
-		.bp_infracfg[0] = {
-			.bus_prot_reg_update = true,
-			.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MFG_S |
-				MT8173_TOP_AXI_PROT_EN_MFG_M0 |
-				MT8173_TOP_AXI_PROT_EN_MFG_M1 |
-				MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT,
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_MT8173(MT8173_TOP_AXI_PROT_EN_MFG_S |
+					       MT8173_TOP_AXI_PROT_EN_MFG_M0 |
+					       MT8173_TOP_AXI_PROT_EN_MFG_M1 |
+					       MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT),
 		},
 	},
 };
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index f967d02cc2ff..3f18cddffb44 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -37,6 +37,12 @@
 #define INFRA_TOPAXI_PROTECTEN_SET	0x0260
 #define INFRA_TOPAXI_PROTECTEN_CLR	0x0264
 
+#define BUS_PROT_UPDATE_MT8173(_mask)			\
+	BUS_PROT_UPDATE(_mask,				\
+			INFRA_TOPAXI_PROTECTEN,		\
+			INFRA_TOPAXI_PROTECTEN_CLR,	\
+			INFRA_TOPAXI_PROTECTSTA1)
+
 int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
 		bool reg_update);
 int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
