Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B58CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 02:53:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF84208C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 02:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zt2o/CvY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BF84208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1Xgb+q379TllvN/gVyY+SnC6473tmB+5BXXkcAGwjE=; b=Zt2o/CvYD/nUxU
	7KAhjBgshzC1AOBpMoPtFRaGrKDE19xmG5v62DzfsVWVvvuTyVwliK04m0cTkWh5DIarfyrfDpZXc
	HcyiqnQt2xE8MA3pVE1yltsAVQZFb1rWyXPoMoPse+h2CjwKDcIDelcrbI+56EQq6M3lyr+bsxvJ5
	T0GdprbIG8ja5fK647/mfjUcPjDeWFG8UT4ruuzMt2HCFY5D5GwXMdE3gm/sJ07bM2NiYUeWK22b9
	4wBFOTx8OgRiHNTD+iGgYY+Y70BHGiilJ1Rc+jhMoIdIxA94yGeBA4YGQC6xFqewDPkKeZNCRz1Mo
	uwTZ9e+mDJvkkEflq14Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOv9m-0005tu-Nk; Mon, 28 Oct 2019 02:53:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOv5Q-0000ys-JC; Mon, 28 Oct 2019 02:48:55 +0000
X-UUID: 6a12eea920124922aabd15b75aca6391-20191027
X-UUID: 6a12eea920124922aabd15b75aca6391-20191027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1773755732; Sun, 27 Oct 2019 18:49:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 27 Oct 2019 19:48:27 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 28 Oct 2019 10:48:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 28 Oct 2019 10:48:27 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 10/14] soc: mediatek: Add subsys clock control for bus
 protection
Date: Mon, 28 Oct 2019 10:48:14 +0800
Message-ID: <1572230898-7860-11-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1572230898-7860-1-git-send-email-weiyi.lu@mediatek.com>
References: <1572230898-7860-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_194852_655758_AEC97A61 
X-CRM114-Status: GOOD (  14.95  )
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
index f25101f..0b5055c 100644
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
@@ -347,16 +352,22 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
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
@@ -383,6 +394,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto out;
 
+	scpsys_clk_disable(scpd->subsys_clk, MAX_SUBSYS_CLKS);
+
 	/* subsys power off */
 	val = readl(ctl_addr) | PWR_ISO_BIT;
 	writel(val, ctl_addr);
@@ -419,6 +432,48 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
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
@@ -506,6 +561,7 @@ static struct scp *init_scp(struct platform_device *pdev,
 		struct scp_domain *scpd = &scp->domains[i];
 		struct generic_pm_domain *genpd = &scpd->genpd;
 		const struct scp_domain_data *data = &scp_domain_data[i];
+		int clk_cnt;
 
 		pd_data->domains[i] = genpd;
 		scpd->scp = scp;
@@ -534,6 +590,18 @@ static struct scp *init_scp(struct platform_device *pdev,
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
