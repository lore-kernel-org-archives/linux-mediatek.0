Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5237BC433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 03:19:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E156B21D7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 03:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pjN7eIfz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gGqZRKrP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E156B21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YvZxUlV93Tswd9KRGQHL/CwJnE52/P7I/BBMRyyTtbE=; b=pjN7eIfzUQq932eZq/nIHlwdU
	Cz4MyFSXazC8n2HU51B6A4G1Q/vYzGjqt2iRV6lBU669DKNuuKbtsroQE6asR07fYbZzJNYH/RqJo
	Kme7+eFXkDEjVwDz9pgMuyJWy9QMZpyGNh/1m9sAhKJMM8UwoEsIXw3bh9H+SgmJHU8F8bG9cxh8p
	eBMrRfvngm75yRLNmLqMpl+TGPdYA6HzgvOuEjRvTYN9gdAVby0J3G1GoXeIAlEa+fMm2wZg6wM3h
	x1yRbGS4wpWKtqTRdEWPhqCIJL+3B3VEtLCHyxzpfMAIHbhMJMsrbezlYf2hI0jRaL76ZlrPZxHZZ
	2Kf2ehjYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSXJm-0000OM-5L; Wed, 14 Oct 2020 03:19:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSXJb-0000Ih-Sw; Wed, 14 Oct 2020 03:19:00 +0000
X-UUID: b8d1c633f80c4f07ae7f18fa721cd7e4-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8TGwcbxTFH3HJEaSJa1xM5BQ/ArhorBGt3HRCC6d8QM=; 
 b=gGqZRKrPBITdw7wt0Ay/hMtUa261QACqbT7PNO0Ksqn1H9LqysPCMeKxNAZ27+Y8lNSNWwXn9N26RMKQ/ApG06jqB3VoNif2bswPR5cxtGGqMAU0V+qxEXLp8dKjk9EWfLfIgr8izItUAlRaw5ak/I/gol1jthwUxWzUHn/sJWk=;
X-UUID: b8d1c633f80c4f07ae7f18fa721cd7e4-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1064306886; Tue, 13 Oct 2020 19:18:55 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 20:08:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 11:08:50 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 11:08:51 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 4/4] mmc: mediatek: Add subsys clock control for MT8192 msdc
Date: Wed, 14 Oct 2020 11:08:46 +0800
Message-ID: <20201014030846.12428-5-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201014030846.12428-1-wenbin.mei@mediatek.com>
References: <20201014030846.12428-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_231900_084106_D7D5BD10 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8192 msdc is an independent sub system, we need control more bus
clocks for it.
Add support for the additional subsys clocks to allow it to be
configured appropriately.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/mmc/host/mtk-sd.c | 74 +++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a704745e5882..c7df7510f120 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -35,6 +35,7 @@
 #include "cqhci.h"
 
 #define MAX_BD_NUM          1024
+#define MSDC_NR_CLOCKS      3
 
 /*--------------------------------------------------------------------------*/
 /* Common Definition                                                        */
@@ -425,6 +426,8 @@ struct msdc_host {
 	struct clk *h_clk;      /* msdc h_clk */
 	struct clk *bus_clk;	/* bus clock which used to access register */
 	struct clk *src_clk_cg; /* msdc source clock control gate */
+	struct clk *sys_clk_cg;	/* msdc subsys clock control gate */
+	struct clk_bulk_data bulk_clks[MSDC_NR_CLOCKS];
 	u32 mclk;		/* mmc subsystem clock frequency */
 	u32 src_clk_freq;	/* source clock frequency */
 	unsigned char timing;
@@ -784,6 +787,7 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
 
 static void msdc_gate_clock(struct msdc_host *host)
 {
+	clk_bulk_disable_unprepare(MSDC_NR_CLOCKS, host->bulk_clks);
 	clk_disable_unprepare(host->src_clk_cg);
 	clk_disable_unprepare(host->src_clk);
 	clk_disable_unprepare(host->bus_clk);
@@ -792,10 +796,18 @@ static void msdc_gate_clock(struct msdc_host *host)
 
 static void msdc_ungate_clock(struct msdc_host *host)
 {
+	int ret;
+
 	clk_prepare_enable(host->h_clk);
 	clk_prepare_enable(host->bus_clk);
 	clk_prepare_enable(host->src_clk);
 	clk_prepare_enable(host->src_clk_cg);
+	ret = clk_bulk_prepare_enable(MSDC_NR_CLOCKS, host->bulk_clks);
+	if (ret) {
+		dev_err(host->dev, "Cannot enable pclk/axi/ahb clock gates\n");
+		return;
+	}
+
 	while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
 		cpu_relax();
 }
@@ -2366,6 +2378,48 @@ static void msdc_of_property_parse(struct platform_device *pdev,
 		host->cqhci = false;
 }
 
+static int msdc_of_clock_parse(struct platform_device *pdev,
+			       struct msdc_host *host)
+{
+	int ret;
+
+	host->src_clk = devm_clk_get(&pdev->dev, "source");
+	if (IS_ERR(host->src_clk))
+		return PTR_ERR(host->src_clk);
+
+	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
+	if (IS_ERR(host->h_clk))
+		return PTR_ERR(host->h_clk);
+
+	host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
+	if (IS_ERR(host->bus_clk))
+		host->bus_clk = NULL;
+
+	/*source clock control gate is optional clock*/
+	host->src_clk_cg = devm_clk_get_optional(&pdev->dev, "source_cg");
+	if (IS_ERR(host->src_clk_cg))
+		host->src_clk_cg = NULL;
+
+	host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
+	if (IS_ERR(host->sys_clk_cg))
+		host->sys_clk_cg = NULL;
+
+	/* If present, always enable for this clock gate */
+	clk_prepare_enable(host->sys_clk_cg);
+
+	host->bulk_clks[0].id = "pclk_cg";
+	host->bulk_clks[1].id = "axi_cg";
+	host->bulk_clks[2].id = "ahb_cg";
+	ret = devm_clk_bulk_get_optional(&pdev->dev, MSDC_NR_CLOCKS,
+					 host->bulk_clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Cannot get pclk/axi/ahb clock gates\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int msdc_drv_probe(struct platform_device *pdev)
 {
 	struct mmc_host *mmc;
@@ -2405,25 +2459,9 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto host_free;
 
-	host->src_clk = devm_clk_get(&pdev->dev, "source");
-	if (IS_ERR(host->src_clk)) {
-		ret = PTR_ERR(host->src_clk);
-		goto host_free;
-	}
-
-	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
-	if (IS_ERR(host->h_clk)) {
-		ret = PTR_ERR(host->h_clk);
+	ret = msdc_of_clock_parse(pdev, host);
+	if (ret)
 		goto host_free;
-	}
-
-	host->bus_clk = devm_clk_get(&pdev->dev, "bus_clk");
-	if (IS_ERR(host->bus_clk))
-		host->bus_clk = NULL;
-	/*source clock control gate is optional clock*/
-	host->src_clk_cg = devm_clk_get(&pdev->dev, "source_cg");
-	if (IS_ERR(host->src_clk_cg))
-		host->src_clk_cg = NULL;
 
 	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								"hrst");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
