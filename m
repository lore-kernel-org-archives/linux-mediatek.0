Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409A7C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:21:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C2F22D03
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1pq2B3x2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dpRkaeXr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C2F22D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ab5uEtzXQ8Ni2ia7j/tDGD6MAszcqV2zNOinNhFP5lU=; b=1pq2B3x2cjTcOccCdgZoelYFR
	uErwpuRv7a1Bybk+EAP9fdh3B8+FVY6JPy4qOz2qxVO1VH9hKQZA3Ueu2w84IX6DDPs7EYvlqvi1i
	hW2RJI2e9ldJAUQSbRKvwmR0+8f/giIRRWtGsGN7myMKZ2GAQSYEWYe2BNa4Kw64S2wKdH36xgKJd
	iKouEmrFCfWfU5MnIPJuB0o3oNkm2y9oiSxOOKmIEvTcg97EhnhBKxYwVdHGJ3H4FNu8BcBWW3YcB
	0TJRbLiBE+uhcXsWclv/an5HdNwXaKu2F0dkHkIlIa7Y+dr8e/8uOFZxqoPSIZhkrgVpgqJI+OlTd
	J2/5Chwpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3cFz-0000RE-IY; Thu, 06 Aug 2020 09:32:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3cFu-0000OL-Mw; Thu, 06 Aug 2020 09:32:11 +0000
X-UUID: e702eedd213d48c384781ec42507c988-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WTzfa/t8bk8sxGScWdoKmOhtLiKTTktmTscE+vpAf7A=; 
 b=dpRkaeXrcrTSkaMz/rMCmYpW5ekaIgyemFXa9URDgBvBNaXR44tSL+uRk2jZ+eMk6ZcJua5T3kFWSTkpBvZi+ezwA5slZbozPmT8jpmrrKIZmcWJMnBVpsuOIez/5tTqSezAss0t/ZoQPYnOqhh5QSK0339sBJ7HIrtbKdWKVPk=;
X-UUID: e702eedd213d48c384781ec42507c988-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 929408052; Thu, 06 Aug 2020 01:32:05 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 02:22:03 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 17:21:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 17:21:59 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH v17 06/12] soc: mediatek: Add support for hierarchical scpsys
 device node
Date: Thu, 6 Aug 2020 17:21:49 +0800
Message-ID: <1596705715-15320-7-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_053210_884641_0F58A794 
X-CRM114-Status: GOOD (  20.30  )
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

Try to list all the power domains of under power controller
node to show the dependency between each power domain directly
instead of filling the dependency in scp_soc_data.
And could be more clearly to group subsys clocks into power domain
sub node to introduce subsys clocks of bus protection in next patch.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 103 +++++++++++++++++++++++++++++++++++---
 1 file changed, 95 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 5a2c323..502b66f 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -182,11 +182,13 @@ struct scp {
 	struct regmap *infracfg;
 	struct regmap *smi_common;
 	struct scp_ctrl_reg ctrl_reg;
+	struct list_head dep_links;
 };
 
 struct scp_subdomain {
 	int origin;
 	int subdomain;
+	struct list_head list;
 };
 
 struct scp_soc_data {
@@ -513,6 +515,79 @@ static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
 	return 0;
 }
 
+static int scpsys_get_domain_id(struct device_node *node, u32 *id)
+{
+	int ret;
+
+	ret = of_property_read_u32(node, "reg", id);
+	if (ret)
+		pr_err("%pOFn: failed to retrieve domain id, ret=%d\n", node, ret);
+
+	return ret;
+}
+
+static int scpsys_get_domain(struct platform_device *pdev, struct scp *scp,
+			struct device_node *node, const struct scp_domain_data *data)
+{
+	struct scp_subdomain *dep_node;
+	struct device_node *sub;
+	u32 parent_id, child_id;
+	int ret;
+
+	ret = scpsys_get_domain_id(node, &parent_id);
+	if (ret)
+		return ret;
+
+	for_each_child_of_node(node, sub) {
+		ret = scpsys_get_domain_id(sub, &child_id);
+		if (ret)
+			goto out;
+
+		dep_node = devm_kzalloc(&pdev->dev, sizeof(*dep_node), GFP_KERNEL);
+		if (!dep_node) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		dep_node->origin = parent_id;
+		dep_node->subdomain = child_id;
+		list_add(&dep_node->list, &scp->dep_links);
+
+		scpsys_get_domain(pdev, scp, sub, data);
+	}
+
+	return 0;
+
+out:
+	of_node_put(sub);
+	return ret;
+}
+
+static int traverse_scp(struct platform_device *pdev, struct scp *scp,
+			const struct scp_domain_data *scp_domain_data)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *sub;
+	int ret;
+
+	INIT_LIST_HEAD(&scp->dep_links);
+
+	for_each_available_child_of_node(np, sub) {
+		ret = scpsys_get_domain(pdev, scp, sub, scp_domain_data);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to handle node %pOFn: %d\n", sub, ret);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	of_node_put(sub);
+	return ret;
+}
+
 static struct scp *init_scp(struct platform_device *pdev,
 			const struct scp_domain_data *scp_domain_data, int num,
 			const struct scp_ctrl_reg *scp_ctrl_reg)
@@ -582,6 +657,10 @@ static struct scp *init_scp(struct platform_device *pdev,
 
 	pd_data->num_domains = num;
 
+	ret = traverse_scp(pdev, scp, scp_domain_data);
+	if (ret)
+		return ERR_PTR(ret);
+
 	for (i = 0; i < num; i++) {
 		struct scp_domain *scpd = &scp->domains[i];
 		struct generic_pm_domain *genpd = &scpd->genpd;
@@ -1208,7 +1287,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	const struct scp_soc_data *soc;
 	struct scp *scp;
 	struct genpd_onecell_data *pd_data;
-	int i, ret;
+	int i, ret = 0;
 
 	soc = of_device_get_match_data(&pdev->dev);
 
@@ -1220,15 +1299,23 @@ static int scpsys_probe(struct platform_device *pdev)
 
 	pd_data = &scp->pd_data;
 
-	for (i = 0, sd = soc->subdomains; i < soc->num_subdomains; i++, sd++) {
-		ret = pm_genpd_add_subdomain(pd_data->domains[sd->origin],
-					     pd_data->domains[sd->subdomain]);
-		if (ret && IS_ENABLED(CONFIG_PM))
-			dev_err(&pdev->dev, "Failed to add subdomain: %d\n",
-				ret);
+	if (soc->subdomains && soc->num_subdomains) {
+		for (i = 0, sd = soc->subdomains; i < soc->num_subdomains; i++, sd++) {
+			ret = pm_genpd_add_subdomain(pd_data->domains[sd->origin],
+						     pd_data->domains[sd->subdomain]);
+			if (ret && IS_ENABLED(CONFIG_PM))
+				dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+		}
+	} else {
+		list_for_each_entry(sd, &scp->dep_links, list) {
+			ret = pm_genpd_add_subdomain(pd_data->domains[sd->origin],
+						     pd_data->domains[sd->subdomain]);
+			if (ret && IS_ENABLED(CONFIG_PM))
+				dev_err(&pdev->dev, "Failed to add subdomain: %d\n", ret);
+		}
 	}
 
-	return 0;
+	return ret;
 }
 
 static struct platform_driver scpsys_drv = {
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
