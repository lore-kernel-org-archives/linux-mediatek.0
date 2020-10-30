Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF42C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:40:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CACA207DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:40:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZeD0f+7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CACA207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uwcYXz0AEMxv5WM7bZtY53Nt2fewl7wrWh+aEVWCdeY=; b=ZeD0f+7meRjsviC72+f4D3cqW
	30/L09P8C7FYKoLQz1HYaAeVg7G3iEnS5Y1hHOvr6qunq2O/ilBWcC4tLOq1n1T2YVqM7Wq6NwY/t
	m1qlcOXYepjo/+KD6HlqupLUufsUzqiR+CFshCAtfyPSzb621Sr1sii//HG6T/Rn+0qZrcqcFGYxY
	Ay0ecoq5TOTtLwoKqbaiNcMjMb6UIiDXl23TAZN58irdrawZ4f3EwI2p0eUmmWn/5C5Gcxzh5lljd
	n/NJGQ+TwHxm2mADWeK6mU574W22NTdoBvb5rO1lqz/Ejt0quvFZ2bx5FuQYwrNN+nmZhVQZrmPE7
	C6ZUW7VKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYSl9-0002HM-Mm; Fri, 30 Oct 2020 11:39:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYShw-0000vp-D2; Fri, 30 Oct 2020 11:36:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id DE2961F45EBD
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/16] soc: mediatek: pm-domains: Add SMI block as bus
 protection block
Date: Fri, 30 Oct 2020 12:36:12 +0100
Message-Id: <20201030113622.201188-7-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030113622.201188-1-enric.balletbo@collabora.com>
References: <20201030113622.201188-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_073636_710410_CCDAF97A 
X-CRM114-Status: GOOD (  18.12  )
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

Changes in v4:
- Use the new syscon_regmap_lookup_by_phandle_optional() wrapper.

Changes in v3:
- Do not reuse bpd for 2 different things.
- Disable pd->smi first and after that pd->infracfg.
- Rename BUT_PROT_UPDATE_MT8173 to BUS_PROT_UPDATE_TOPAXI as in all the
  other SoCs TOPAXI is mapped to the same address.

Changes in v2: None

 drivers/soc/mediatek/mt8173-pm-domains.h | 18 ++++++++---------
 drivers/soc/mediatek/mtk-pm-domains.c    | 23 +++++++++++++++-------
 drivers/soc/mediatek/mtk-pm-domains.h    | 25 ++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
index 72b3acaf74fb..3e8ee5dabb43 100644
--- a/drivers/soc/mediatek/mt8173-pm-domains.h
+++ b/drivers/soc/mediatek/mt8173-pm-domains.h
@@ -34,10 +34,9 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_DIS_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
-		.bp_infracfg[0] = {
-			.bus_prot_reg_update = true,
-			.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MM_M0 |
-				MT8173_TOP_AXI_PROT_EN_MM_M1,
+		.bp_infracfg = {
+			BUS_PROT_UPDATE_TOPAXI(MT8173_TOP_AXI_PROT_EN_MM_M0 |
+					       MT8173_TOP_AXI_PROT_EN_MM_M1),
 		},
 	},
 	[MT8173_POWER_DOMAIN_VENC_LT] = {
@@ -76,12 +75,11 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
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
+			BUS_PROT_UPDATE_TOPAXI(MT8173_TOP_AXI_PROT_EN_MFG_S |
+					       MT8173_TOP_AXI_PROT_EN_MFG_M0 |
+					       MT8173_TOP_AXI_PROT_EN_MFG_M1 |
+					       MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT),
 		},
 	},
 };
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 6122701d018f..8a21847464c2 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -32,6 +32,7 @@ struct scpsys_domain {
 	int num_clks;
 	struct clk_bulk_data *clks;
 	struct regmap *infracfg;
+	struct regmap *smi;
 };
 
 struct scpsys {
@@ -99,9 +100,9 @@ static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, st
 		if (bpd[i].bus_prot_reg_update)
 			regmap_set_bits(regmap, bpd[i].bus_prot_set, mask);
 		else
-			regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_SET, mask);
+			regmap_write(regmap, bpd[i].bus_prot_set, mask);
 
-		ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
+		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
 					       val, (val & mask) == mask,
 					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
@@ -116,8 +117,10 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
 	int ret;
 
 	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg, pd->infracfg);
+	if (ret)
+		return ret;
 
-	return ret;
+	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi);
 }
 
 static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
@@ -134,9 +137,9 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 		if (bpd[i].bus_prot_reg_update)
 			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, mask);
 		else
-			regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_CLR, mask);
+			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
 
-		ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
+		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
 					       val, !(val & mask),
 					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
@@ -150,9 +153,11 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
 {
 	int ret;
 
-	ret = _scpsys_bus_protect_disable(pd->data->bp_infracfg, pd->infracfg);
+	ret = _scpsys_bus_protect_disable(pd->data->bp_smi, pd->smi);
+	if (ret)
+		return ret;
 
-	return ret;
+	return _scpsys_bus_protect_disable(pd->data->bp_infracfg, pd->infracfg);
 }
 
 static int scpsys_power_on(struct generic_pm_domain *genpd)
@@ -267,6 +272,10 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	if (IS_ERR(pd->infracfg))
 		return ERR_CAST(pd->infracfg);
 
+	pd->smi = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,smi");
+	if (IS_ERR(pd->smi))
+		return ERR_CAST(pd->smi);
+
 	pd->num_clks = of_clk_get_parent_count(node);
 	if (pd->num_clks > 0) {
 		pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 125880a58170..c2defbdcdf31 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -34,8 +34,31 @@
 
 #define SPM_MAX_BUS_PROT_DATA		5
 
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
+#define BUS_PROT_UPDATE_TOPAXI(_mask)				\
+		BUS_PROT_UPDATE(_mask,				\
+				INFRA_TOPAXI_PROTECTEN,		\
+				INFRA_TOPAXI_PROTECTEN_CLR,	\
+				INFRA_TOPAXI_PROTECTSTA1)
+
 struct scpsys_bus_prot_data {
 	u32 bus_prot_mask;
+	u32 bus_prot_set;
+	u32 bus_prot_clr;
+	u32 bus_prot_sta;
 	bool bus_prot_reg_update;
 };
 
@@ -47,6 +70,7 @@ struct scpsys_bus_prot_data {
  * @sram_pdn_ack_bits: The mask for sram power control acked bits.
  * @caps: The flag for active wake-up action.
  * @bp_infracfg: bus protection for infracfg subsystem
+ * @bp_smi: bus protection for smi subsystem
  */
 struct scpsys_domain_data {
 	u32 sta_mask;
@@ -55,6 +79,7 @@ struct scpsys_domain_data {
 	u32 sram_pdn_ack_bits;
 	u8 caps;
 	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
+	const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
 };
 
 struct scpsys_soc_data {
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
