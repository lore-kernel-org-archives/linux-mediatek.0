Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC59C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:01:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A86222D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9awnnhw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A86222D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+IcrzP3rtK6EzHpQsetlfe+6XMD94KtKY+o2klD0QuA=; b=l9awnnhw4nuV+rzs/PVFJeTNf
	Km74pWvOhjPn2xDNmqU9w5ptO2+J8Gk5t6HU/1ppwqVC06C3H7oIg3m/aafTVlVGZskvroy8VJmkb
	RBCFfhZC3ptq1nRP5Kqy27sqjf0wPEGEF/+Fi7T1e/Ck3CuSDkFOHPqbFr7p3d9x/7hT24CTxN21g
	X8Qy+y4DheQ9jWEA2B7F1B194VQl7+aP+rybFSrO/lg1EAAh9lem7jKGd8PJsWpz79puYrRMecnqw
	XePI+RcfDqCIzXGNV3O1cDYmBgz0wJBU7OFYg64Zib44lhJdofPSZB7bvZB9xlJXAUInUeiFa8h7p
	1Dw2Qa5xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6nv-00029j-Su; Mon, 26 Oct 2020 18:01:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6ib-0007w5-JK; Mon, 26 Oct 2020 17:55:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 26FAB1F44FCE
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/16] soc: mediatek: pm-domains: Add subsystem clocks
Date: Mon, 26 Oct 2020 18:55:17 +0100
Message-Id: <20201026175526.2915399-9-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026175526.2915399-1-enric.balletbo@collabora.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_135541_912512_5BDFD0F8 
X-CRM114-Status: GOOD (  21.91  )
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

For the bus protection operations, some subsystem clocks need to be enabled
before releasing the protection. This patch identifies the subsystem clocks
by it's name.

Suggested-by: Weiyi Lu <weiyi.lu@mediatek.com>
[Adapted the patch to the mtk-pm-domains driver]
Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3:
- Prepare the basic clocks before we prepare the subsystem clocks.

Changes in v2:
- Use dev_err_probe if getting clocks fails, so an error is not printed
  if is deferred.

 drivers/soc/mediatek/mtk-pm-domains.c | 83 +++++++++++++++++++++++----
 drivers/soc/mediatek/mtk-pm-domains.h |  2 +
 2 files changed, 73 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 82f6d937ed93..4b610929f858 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2020 Collabora Ltd.
  */
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -33,6 +34,8 @@ struct scpsys_domain {
 	struct scpsys *scpsys;
 	int num_clks;
 	struct clk_bulk_data *clks;
+	int num_subsys_clks;
+	struct clk_bulk_data *subsys_clks;
 	struct regmap *infracfg;
 	struct regmap *smi;
 };
@@ -207,16 +210,22 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT, 0);
 	regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT, PWR_RST_B_BIT);
 
+	ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
+	if (ret)
+		goto err_pwr_ack;
+
 	ret = scpsys_sram_enable(pd);
 	if (ret < 0)
-		goto err_pwr_ack;
+		goto err_sram;
 
 	ret = scpsys_bus_protect_disable(pd);
 	if (ret < 0)
-		goto err_pwr_ack;
+		goto err_sram;
 
 	return 0;
 
+err_sram:
+	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
 err_pwr_ack:
 	clk_bulk_disable(pd->num_clks, pd->clks);
 	return ret;
@@ -237,6 +246,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
+	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
+
 	/* subsys power off */
 	regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT, 0);
 	regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT, PWR_ISO_BIT);
@@ -260,7 +271,11 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 {
 	const struct scpsys_domain_data *domain_data;
 	struct scpsys_domain *pd;
-	int i, ret;
+	struct property *prop;
+	const char *clk_name;
+	int i, ret, num_clks;
+	struct clk *clk;
+	int clk_ind = 0;
 	u32 id;
 
 	ret = of_property_read_u32(node, "reg", &id);
@@ -296,25 +311,62 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	if (IS_ERR(pd->smi))
 		pd->smi = NULL;
 
-	pd->num_clks = of_clk_get_parent_count(node);
-	if (pd->num_clks > 0) {
+	num_clks = of_clk_get_parent_count(node);
+	if (num_clks > 0) {
+		/* Calculate number of subsys_clks */
+		of_property_for_each_string(node, "clock-names", prop, clk_name) {
+			char *subsys;
+
+			subsys = strchr(clk_name, '-');
+			if (subsys)
+				pd->num_subsys_clks++;
+			else
+				pd->num_clks++;
+		}
+
 		pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
 		if (!pd->clks)
 			return ERR_PTR(-ENOMEM);
+
+		pd->subsys_clks = devm_kcalloc(scpsys->dev, pd->num_subsys_clks,
+					       sizeof(*pd->subsys_clks), GFP_KERNEL);
+		if (!pd->subsys_clks)
+			return ERR_PTR(-ENOMEM);
+
 	}
 
 	for (i = 0; i < pd->num_clks; i++) {
-		pd->clks[i].clk = of_clk_get(node, i);
-		if (IS_ERR(pd->clks[i].clk)) {
-			dev_err(scpsys->dev, "%pOF: failed to get clk at index %d\n",
-				node, i);
-			return ERR_PTR(-EINVAL);
+		clk = of_clk_get(node, i);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			dev_err_probe(scpsys->dev, ret,
+				      "%pOF: failed to get clk at index %d: %d\n", node, i, ret);
+			goto err_put_clocks;
+		}
+
+		pd->clks[clk_ind++].clk = clk;
+	}
+
+	for (i = 0; i < pd->num_subsys_clks; i++) {
+		clk = of_clk_get(node, i + clk_ind);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			dev_err_probe(scpsys->dev, ret,
+				      "%pOF: failed to get clk at index %d: %d\n", node,
+				      i + clk_ind, ret);
+			goto err_put_subsys_clocks;
 		}
+
+		pd->subsys_clks[i].clk = clk;
 	}
 
 	ret = clk_bulk_prepare(pd->num_clks, pd->clks);
 	if (ret)
-		goto err_put_clocks;
+		goto err_put_subsys_clocks;
+
+	ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
+	if (ret)
+		goto err_unprepare_clocks;
 
 	/*
 	 * Initially turn on all domains to make the domains usable
@@ -332,7 +384,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		ret = -EINVAL;
 		dev_err(scpsys->dev,
 			"power domain with id %d already exists, check your device-tree\n", id);
-		goto err_unprepare_clocks;
+		goto err_unprepare_subsys_clocks;
 	}
 
 	pd->genpd.name = node->name;
@@ -344,8 +396,12 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 
 	return scpsys->pd_data.domains[id];
 
+err_unprepare_subsys_clocks:
+	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 err_unprepare_clocks:
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
+err_put_subsys_clocks:
+	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 err_put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
 	return ERR_PTR(ret);
@@ -422,6 +478,9 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
+
+	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
+	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 }
 
 static void scpsys_domain_cleanup(struct scpsys *scpsys)
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 4152b96c1b29..00af9f37c201 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -63,6 +63,8 @@ struct scpsys_bus_prot_data {
 	bool bus_prot_reg_update;
 };
 
+#define MAX_SUBSYS_CLKS 10
+
 /**
  * struct scpsys_domain_data - scp domain data for power on/off flow
  * @sta_mask: The mask for power on/off status bit.
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
