Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A9CC4727E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:03:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB9D20872
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hZr91leK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FB9D20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z4xxb1gf5N4cREDCFgNJme0ToTXZW9aIWDx7MxQ3oks=; b=hZr91leKGHfSQFBA8U9GuCJO+
	lXH/Rq07d4lCMTYw80B1EAdqsT00o19NJh93nb3lDpFwt97B/FXGfkcwSYveCnDUbUmfvUnU7rPSO
	bBgJUhRtQyr49L7JS0BbZ+92x4mX2z2mnRgdT/1UzoM4Zw1xgW0CAtvxUNWwU514QP/XMZ3F6eI/+
	a+yWQzg+68CEYR3dNk31Tb3gpGfb/Z7C2Bz+Eejy8oLZZCffoOvM+hCgcKy8ba9XDBpJFbIUyVcET
	7kHF2ZwKU5ACY2ts8v6rKaDzK6bxjwMmq8pS9mHmRKXQPtUYIXUNqYu2vdYavUE6DKKbeUpJfRqCP
	0WTGPvoLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO13D-0000h2-Bw; Thu, 01 Oct 2020 16:03:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO123-0008QY-0u; Thu, 01 Oct 2020 16:02:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 7329729D769
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/12] soc: mediatek: pm-domains: Add subsystem clocks
Date: Thu,  1 Oct 2020 18:01:50 +0200
Message-Id: <20201001160154.3587848-9-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001160154.3587848-1-enric.balletbo@collabora.com>
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_120211_268788_22F9DC77 
X-CRM114-Status: GOOD (  21.87  )
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

Changes in v2:
- Use dev_err_probe if getting clocks fails, so an error is not printed
  if is deferred.

 drivers/soc/mediatek/mtk-pm-domains.c | 89 ++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index e0a52d489fea..2075072f16da 100644
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
@@ -81,6 +82,8 @@ struct scpsys_bus_prot_data {
 	bool bus_prot_reg_update;
 };
 
+#define MAX_SUBSYS_CLKS 10
+
 /**
  * struct scpsys_domain_data - scp domain data for power on/off flow
  * @sta_mask: The mask for power on/off status bit.
@@ -107,6 +110,8 @@ struct scpsys_domain {
 	struct scpsys *scpsys;
 	int num_clks;
 	struct clk_bulk_data *clks;
+	int num_subsys_clks;
+	struct clk_bulk_data *subsys_clks;
 	struct regmap *infracfg;
 	struct regmap *smi;
 };
@@ -318,16 +323,22 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	val |= PWR_RST_B_BIT;
 	regmap_write(scpsys->base, pd->data->ctl_offs, val);
 
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
@@ -348,6 +359,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
+	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
+
 	/* subsys power off */
 	regmap_read(scpsys->base, pd->data->ctl_offs, &val);
 	val |= PWR_ISO_BIT;
@@ -380,8 +393,11 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
 {
 	const struct scpsys_domain_data *domain_data;
 	struct scpsys_domain *pd;
-	int i, ret;
+	int i, ret, num_clks;
 	u32 id;
+	int clk_ind = 0;
+	struct property *prop;
+	const char *clk_name;
 
 	ret = of_property_read_u32(node, "reg", &id);
 	if (ret) {
@@ -416,28 +432,63 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
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
 			return -ENOMEM;
-	} else {
-		pd->num_clks = 0;
+
+		pd->subsys_clks = devm_kcalloc(scpsys->dev, pd->num_subsys_clks,
+					       sizeof(*pd->subsys_clks), GFP_KERNEL);
+		if (!pd->subsys_clks)
+			return -ENOMEM;
 	}
 
 	for (i = 0; i < pd->num_clks; i++) {
-		pd->clks[i].clk = of_clk_get(node, i);
-		if (IS_ERR(pd->clks[i].clk)) {
-			ret = PTR_ERR(pd->clks[i].clk);
-			dev_err_probe(scpsys->dev, ret, "%pOFn: failed to get clk at index %d\n",
-				      node, i);
-			return ret;
+		struct clk *clk = of_clk_get(node, i);
+
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			dev_err_probe(scpsys->dev, PTR_ERR(clk),
+				      "%pOFn: failed to get clk at index %d\n", node, i);
+			goto err_put_clocks;
 		}
+
+		pd->clks[clk_ind++].clk = clk;
 	}
 
+	for (i = 0; i < pd->num_subsys_clks; i++) {
+		struct clk *clk = of_clk_get(node, i + clk_ind);
+
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			dev_err_probe(scpsys->dev, PTR_ERR(clk),
+				      "%pOFn: failed to get clk at index %d: %d\n",
+				      node, i + clk_ind, ret);
+			goto err_put_subsys_clocks;
+		}
+
+		pd->subsys_clks[i].clk = clk;
+	}
+
+	ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
+	if (ret)
+		goto err_put_subsys_clocks;
+
 	ret = clk_bulk_prepare(pd->num_clks, pd->clks);
 	if (ret)
-		goto err_put_clocks;
+		goto err_unprepare_subsys_clocks;
 
 	/*
 	 * Initially turn on all domains to make the domains usable
@@ -462,6 +513,12 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
 
 err_unprepare_clocks:
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
+err_unprepare_subsys_clocks:
+	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
+err_put_subsys_clocks:
+	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
+	devm_kfree(scpsys->dev, pd->subsys_clks);
+	pd->num_subsys_clks = 0;
 err_put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
 	devm_kfree(scpsys->dev, pd->clks);
@@ -541,6 +598,10 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
 	pd->num_clks = 0;
+
+	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
+	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
+	pd->num_subsys_clks = 0;
 }
 
 static void scpsys_domain_cleanup(struct scpsys *scpsys)
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
