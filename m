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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3777EC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:18:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1294522DFA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASAPECsN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VS7+dU32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1294522DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wzjTAjrYNjevG2AvFhIw1b0emTVdwkG1tD7Yp/7UBBQ=; b=ASAPECsNO8nncJjhv3SIuRGlB
	5OAat8OqGQ+19CaqyJTjXMJQEu9MCn+HcmwaXprjaljlDrL3kt1ihoreP+iaA5w6mHz+zdprw8mlE
	9gx1s0BH0+pBeExg5YduW7u12uL9RvFXJBc86UNVZ977qbPzAtPwj+3XL7xpwNxCYweCGdfuFFUaS
	OVq55Bn73ULate43cpIFUutI5fEMl5EWJqGuS/0WW5k8QfvJZn5Sytt3170R9edb4hTLRwSrcGzOH
	1rOGD7TCiS3XQ3XqpOSvG35Ba39O1aZSR7kRltt8CEpBMLW+KsXyjxA7Bqh3sgi+lsqNs/IjyZmry
	Ow2eIGtLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3c6X-0005OV-AM; Thu, 06 Aug 2020 09:22:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3c6J-0005Hb-4a; Thu, 06 Aug 2020 09:22:17 +0000
X-UUID: 6c58b7598edd4e36ab043bdad8c77eef-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nV+1VPDViPYhiu9TwtqZGVPTCpQQXdDn8Cms96SrwTc=; 
 b=VS7+dU328enTGEXFFetr9ubwiEv5DwPum4/5zl6hJ3ePje0PmlRgsem6SMkTE788hpcCi35MLXHBfYPOMVijnRZ85eB30YychJBRUUNrJOewWLibksvQ0P401/MRFsvAEQi3/X0CNSFSJdMpQrXoOJbt6FED3cmznqXUAbqs080=;
X-UUID: 6c58b7598edd4e36ab043bdad8c77eef-20200806
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1500841474; Thu, 06 Aug 2020 01:22:05 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 02:22:03 -0700
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
Subject: [PATCH v17 07/12] soc: mediatek: Add subsys clock control for bus
 protection
Date: Thu, 6 Aug 2020 17:21:50 +0800
Message-ID: <1596705715-15320-8-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_052215_341576_8BEEB343 
X-CRM114-Status: GOOD (  20.77  )
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

For the bus protection operations, some subsys clocks need to be enabled
before releasing the protection, and vice versa.
But those subsys clocks could only be controlled once its corresponding
power domain is turned on first.
In this patch, we add the subsys clock control into its relevant steps.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 502b66f..ec62143 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of_clk.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -97,6 +98,7 @@
 #define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT	BIT(23)
 
 #define MAX_CLKS	3
+#define MAX_SUBSYS_CLKS 10
 
 #define MAX_STEPS	5
 
@@ -165,6 +167,7 @@ struct scp_domain {
 	struct generic_pm_domain genpd;
 	struct scp *scp;
 	struct clk *clk[MAX_CLKS];
+	struct clk *subsys_clk[MAX_SUBSYS_CLKS];
 	const struct scp_domain_data *data;
 	struct regulator *supply;
 };
@@ -427,16 +430,22 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
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
@@ -463,6 +472,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto out;
 
+	scpsys_clk_disable(scpd->subsys_clk, MAX_SUBSYS_CLKS);
+
 	/* subsys power off */
 	val = readl(ctl_addr);
 	val |= PWR_ISO_BIT;
@@ -500,6 +511,24 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	return ret;
 }
 
+static int init_subsys_clks(struct device_node *np,
+		struct clk **clk)
+{
+	int sub_clk_cnt = of_clk_get_parent_count(np);
+	int i;
+
+	BUG_ON(sub_clk_cnt > MAX_SUBSYS_CLKS);
+
+	for (i = 0; i < sub_clk_cnt; i++) {
+		clk[i] = of_clk_get(np, i);
+
+		if (IS_ERR(clk[i]))
+			return PTR_ERR(clk[i]);
+	}
+
+	return 0;
+}
+
 static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
 			const char * const *name)
 {
@@ -533,11 +562,17 @@ static int scpsys_get_domain(struct platform_device *pdev, struct scp *scp,
 	struct device_node *sub;
 	u32 parent_id, child_id;
 	int ret;
+	struct scp_domain *scpd;
 
 	ret = scpsys_get_domain_id(node, &parent_id);
 	if (ret)
 		return ret;
 
+	scpd = &scp->domains[parent_id];
+	ret = init_subsys_clks(node, scpd->subsys_clk);
+	if (ret)
+		return ret;
+
 	for_each_child_of_node(node, sub) {
 		ret = scpsys_get_domain_id(sub, &child_id);
 		if (ret)
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
