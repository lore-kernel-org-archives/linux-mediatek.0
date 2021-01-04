Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FBFC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 10:54:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8229207BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 10:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8229207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kJr+klRKkdYGfr9Pj/SSwkC7vTlFpEV5DTPYDHEF/XE=; b=ddRBmreDXG4TDpR2vQ/oAJK7p
	Z3QNDyR66kUPKcwD9xVqpfnCEApVR1Y11JCz3r+4F/zVzVKeQF1cvTChPqPXNfL3S9AqD9MZPgV6S
	iTpV6Isk0ulTg716goUHOgg/EfrmFUWkFVo7h5u2K/2JKBK4ZFeJciiz0UnXbTmEnBTD51zSXyXiu
	Jywx0AWil8HCvtFNXckzH5ykJtFqaBb4kToguyYr/l0yrUsLTBg7uTWcMydA+N3kumkyZoPJWlhar
	vg3yKfETR3/NZaA1o4LelAQs03e2hX8v2T9jO9VHh17ZNSq2ysk5ZfXlzE6uHn/puLCpdmcE6aFNS
	udihLEiWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwNUk-0003b1-Ip; Mon, 04 Jan 2021 10:53:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwNUe-0003YR-M2; Mon, 04 Jan 2021 10:53:48 +0000
X-UUID: 5d072c06aef440abbed8b24333fc7ce5-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JvYUF7ZzLbQPYhGDlYmTLQu8VDxRcjudg9C8RnwEN8E=; 
 b=hpvofumnqINTf+F1R4d2P2XqhLs2ITx0pgIdA2IsTXFrRCBgYkSu44RD1YwgobkKiNVoYsBGYIgXPjt9J4SREZoA0pdqoTrIxpCj6RZ9JGavPXDhkHKs6BDyWT9ReWnWKpkNJ5QtuKj9SxLo2rlYNgNH/njEWdhdms/jniv+x94=;
X-UUID: 5d072c06aef440abbed8b24333fc7ce5-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1907826376; Mon, 04 Jan 2021 02:53:41 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 02:44:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 18:44:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Jan 2021 18:44:58 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 1/2] soc: mediatek: Add regulator control for MT8192 MFG power
 domain
Date: Mon, 4 Jan 2021 18:44:52 +0800
Message-ID: <1609757093-30618-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609757093-30618-1-git-send-email-weiyi.lu@mediatek.com>
References: <1609757093-30618-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_055344_975848_42EAE7A4 
X-CRM114-Status: GOOD (  22.14  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add regulator control support and specific power domain name of
MT8192 MFG power domain for regulator lookup.
Also power domain name can fix the debugfs warning.
(e.g. debugfs: Directory 'power-domain' with parent 'pm_genpd'
already present!)
However, not every domain with name need to get the regulator,
if we just want to fix the debugfs warning log by adding names to
power domains. Considering this case, lookup regulator by
regulator_get_optional() instead of getting a dummy regulator from
regulator_get() to operate.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mt8192-pm-domains.h |  1 +
 drivers/soc/mediatek/mtk-pm-domains.c    | 42 ++++++++++++++++++++++++++++++--
 drivers/soc/mediatek/mtk-pm-domains.h    |  2 ++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
index 0fdf6dc..7db0ad3 100644
--- a/drivers/soc/mediatek/mt8192-pm-domains.h
+++ b/drivers/soc/mediatek/mt8192-pm-domains.h
@@ -49,6 +49,7 @@
 		.ctl_offs = 0x0308,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.name = "mfg",
 	},
 	[MT8192_POWER_DOMAIN_MFG1] = {
 		.sta_mask = BIT(3),
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index fb70cb3..a160800 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/soc/mediatek/infracfg.h>
 
 #include "mt8173-pm-domains.h"
@@ -40,6 +41,7 @@ struct scpsys_domain {
 	struct clk_bulk_data *subsys_clks;
 	struct regmap *infracfg;
 	struct regmap *smi;
+	struct regulator *supply;
 };
 
 struct scpsys {
@@ -187,6 +189,22 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
 	return _scpsys_bus_protect_disable(pd->data->bp_infracfg, pd->infracfg);
 }
 
+static int scpsys_regulator_enable(struct scpsys_domain *pd)
+{
+	if (!pd->supply)
+		return 0;
+
+	return regulator_enable(pd->supply);
+}
+
+static int scpsys_regulator_disable(struct scpsys_domain *pd)
+{
+	if (!pd->supply)
+		return 0;
+
+	return regulator_disable(pd->supply);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
@@ -194,9 +212,13 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	bool tmp;
 	int ret;
 
+	ret = scpsys_regulator_enable(pd);
+	if (ret < 0)
+		return ret;
+
 	ret = clk_bulk_enable(pd->num_clks, pd->clks);
 	if (ret)
-		return ret;
+		goto err_disable_regulator;
 
 	/* subsys power on */
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
@@ -232,6 +254,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
 err_pwr_ack:
 	clk_bulk_disable(pd->num_clks, pd->clks);
+err_disable_regulator:
+	scpsys_regulator_disable(pd);
 	return ret;
 }
 
@@ -267,6 +291,10 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 
 	clk_bulk_disable(pd->num_clks, pd->clks);
 
+	ret = scpsys_regulator_disable(pd);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -315,6 +343,16 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	if (IS_ERR(pd->smi))
 		return ERR_CAST(pd->smi);
 
+	if (pd->data->name) {
+		pd->supply = devm_regulator_get_optional(scpsys->dev, pd->data->name);
+		if (IS_ERR(pd->supply)) {
+			if (PTR_ERR(pd->supply) == -ENODEV)
+				pd->supply = NULL;
+			else
+				return ERR_CAST(pd->supply);
+		}
+	}
+
 	num_clks = of_clk_get_parent_count(node);
 	if (num_clks > 0) {
 		/* Calculate number of subsys_clks */
@@ -397,7 +435,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		goto err_unprepare_subsys_clocks;
 	}
 
-	pd->genpd.name = node->name;
+	pd->genpd.name = pd->data->name ?: node->name;
 	pd->genpd.power_off = scpsys_power_off;
 	pd->genpd.power_on = scpsys_power_on;
 
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index a2f4d8f..58d72fb 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -81,6 +81,7 @@ struct scpsys_bus_prot_data {
  * @caps: The flag for active wake-up action.
  * @bp_infracfg: bus protection for infracfg subsystem
  * @bp_smi: bus protection for smi subsystem
+ * @name: specific power domain name for regulator lookup and debugfs
  */
 struct scpsys_domain_data {
 	u32 sta_mask;
@@ -90,6 +91,7 @@ struct scpsys_domain_data {
 	u8 caps;
 	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
 	const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
+	char *name;
 };
 
 struct scpsys_soc_data {
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
