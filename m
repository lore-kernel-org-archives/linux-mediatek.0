Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC561C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 06:56:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB317206D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 06:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQqdJzc5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="K/85qNAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB317206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJUBSzJbXnCTFoOAXAV9Nn0ijq4MOIDOyoezjjRfHqo=; b=lQqdJzc5j5pO5W
	+KBUU3+M+E0IWHNKRAF3V9VOFizYrIo0XLqmeJJgdLkX59r4bsxGnnLNSaSBSjPwGkTQ8j4CupBvD
	T+vz3P1586JT0iylCdHX9a3xhZXgQpU9w8MiB3V5QbRvZFLObO0zXFPJscmjVbESiTFtoVslVVwP1
	ivRhyoMSxBsUqBiQeLtFtNJRI//H1Di7jpGo77odSdE4bJgBAYkLMhHH4JJhkxp9DY6A0OjJcyY6v
	M3cnriNZ8r9uXnAyBUNdycH7BpArQEo+IN/stamTAo8NE+XGx/wH1mLxCmNQdk5z/T+XVVZ/CJwWA
	ekJhoWKlGOtUc56PnI1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieZRR-0005aU-1T; Tue, 10 Dec 2019 06:56:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieZPR-0002J1-Og; Tue, 10 Dec 2019 06:54:15 +0000
X-UUID: f7303fdaf2eb4901b4b52a69c67ac4ca-20191209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=in7Y5b66xLTUNL/z1DPJEMQwq3nkM02rQJiwoMm9JDM=; 
 b=K/85qNAD/T0PGlPkJEj6vNtcP0wndNazq5G0UaVkFL4xRBVszABJZ+dveNCBKSF1wxaVpeIYb3L4sTkQOsvYuP6fSo7EuwP/ahPKv0iW3FqsefOYjAKXnfRlgkRpu+TFDR3NKqnA39bVVEbzNLkATaS1YQIKV3R90Ae2jZeYt4Y=;
X-UUID: f7303fdaf2eb4901b4b52a69c67ac4ca-20191209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 585080675; Mon, 09 Dec 2019 22:54:05 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 22:48:17 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 14:46:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 14:47:17 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 5/9] soc: mediatek: Add subsys clock control for bus
 protection
Date: Tue, 10 Dec 2019 14:46:49 +0800
Message-ID: <1575960413-6900-6-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
References: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1BBD55928583D5DDB6E38E71781926C209F97AED79BFEBF7DEC76C276F0DEC212000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_225413_865437_E94A29DB 
X-CRM114-Status: GOOD (  14.43  )
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
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add subsys CG control flow before/after the bus protect control
due to bus protection need SMI bus relative CGs enabled to feedback
its ack.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 72 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 466bb749..2bbf907 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -108,6 +108,7 @@ enum clk_id {
 };
 
 #define MAX_CLKS	3
+#define MAX_SUBSYS_CLKS 10
 
 /**
  * struct scp_domain_data - scp domain data for power on/off flow
@@ -120,6 +121,8 @@ enum clk_id {
  * @clk_id: The basic clocks required by this power domain.
  * @basic_clk_id: provide the same purpose with field "clk_id"
  *                by declaring basic clock prefix name rather than clk_id.
+ * @subsys_clk_prefix: The prefix name of the clocks need to be enabled
+ *                     before releasing bus protection.
  * @caps: The flag for active wake-up action.
  * @bp_table: The mask table for multiple step bus protection.
  */
@@ -132,6 +135,7 @@ struct scp_domain_data {
 	u32 bus_prot_mask;
 	enum clk_id clk_id[MAX_CLKS];
 	const char *basic_clk_id[MAX_CLKS];
+	const char *subsys_clk_prefix;
 	u8 caps;
 	struct bus_prot bp_table[MAX_STEPS];
 };
@@ -142,6 +146,7 @@ struct scp_domain {
 	struct generic_pm_domain genpd;
 	struct scp *scp;
 	struct clk *clk[MAX_CLKS];
+	struct clk *subsys_clk[MAX_SUBSYS_CLKS];
 	const struct scp_domain_data *data;
 	struct regulator *supply;
 };
@@ -349,16 +354,22 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	val |= PWR_RST_B_BIT;
 	writel(val, ctl_addr);
 
-	ret = scpsys_sram_enable(scpd, ctl_addr);
+	ret = scpsys_clk_enable(scpd->subsys_clk, MAX_SUBSYS_CLKS);
 	if (ret < 0)
 		goto err_pwr_ack;
 
+	ret = scpsys_sram_enable(scpd, ctl_addr);
+	if (ret < 0)
+		goto err_sram;
+
 	ret = scpsys_bus_protect_disable(scpd);
 	if (ret < 0)
-		goto err_pwr_ack;
+		goto err_sram;
 
 	return 0;
 
+err_sram:
+	scpsys_clk_disable(scpd->subsys_clk, MAX_SUBSYS_CLKS);
 err_pwr_ack:
 	scpsys_clk_disable(scpd->clk, MAX_CLKS);
 err_clk:
@@ -385,6 +396,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto out;
 
+	scpsys_clk_disable(scpd->subsys_clk, MAX_SUBSYS_CLKS);
+
 	/* subsys power off */
 	val = readl(ctl_addr);
 	val |= PWR_ISO_BIT;
@@ -422,6 +435,48 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	return ret;
 }
 
+static int init_subsys_clks(struct platform_device *pdev,
+		const char *prefix, struct clk **clk)
+{
+	struct device_node *node = pdev->dev.of_node;
+	u32 prefix_len, sub_clk_cnt = 0;
+	struct property *prop;
+	const char *clk_name;
+
+	if (!node) {
+		dev_err(&pdev->dev, "Cannot find scpsys node: %ld\n",
+			PTR_ERR(node));
+		return PTR_ERR(node);
+	}
+
+	prefix_len = strlen(prefix);
+
+	of_property_for_each_string(node, "clock-names", prop, clk_name) {
+		if (!strncmp(clk_name, prefix, prefix_len) &&
+				(clk_name[prefix_len] == '-')) {
+			if (sub_clk_cnt >= MAX_SUBSYS_CLKS) {
+				dev_err(&pdev->dev,
+					"subsys clk out of range %d\n",
+					sub_clk_cnt);
+				return -ENOMEM;
+			}
+
+			clk[sub_clk_cnt] = devm_clk_get(&pdev->dev,
+						clk_name);
+
+			if (IS_ERR(clk[sub_clk_cnt])) {
+				dev_err(&pdev->dev,
+					"Subsys clk get fail %ld\n",
+					PTR_ERR(clk[sub_clk_cnt]));
+				return PTR_ERR(clk[sub_clk_cnt]);
+			}
+			sub_clk_cnt++;
+		}
+	}
+
+	return sub_clk_cnt;
+}
+
 static void init_clks(struct platform_device *pdev, struct clk **clk)
 {
 	int i;
@@ -509,6 +564,7 @@ static struct scp *init_scp(struct platform_device *pdev,
 		struct scp_domain *scpd = &scp->domains[i];
 		struct generic_pm_domain *genpd = &scpd->genpd;
 		const struct scp_domain_data *data = &scp_domain_data[i];
+		int clk_cnt;
 
 		pd_data->domains[i] = genpd;
 		scpd->scp = scp;
@@ -537,6 +593,18 @@ static struct scp *init_scp(struct platform_device *pdev,
 						data->basic_clk_id[j]);
 		}
 
+		if (data->subsys_clk_prefix) {
+			clk_cnt = init_subsys_clks(pdev,
+					data->subsys_clk_prefix,
+					scpd->subsys_clk);
+			if (clk_cnt < 0) {
+				dev_err(&pdev->dev,
+					"%s: subsys clk unavailable\n",
+					data->name);
+				return ERR_PTR(clk_cnt);
+			}
+		}
+
 		genpd->name = data->name;
 		genpd->power_off = scpsys_power_off;
 		genpd->power_on = scpsys_power_on;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
