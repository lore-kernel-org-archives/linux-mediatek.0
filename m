Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601EFC4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:32:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6251206B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oUzhHZOZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GAv4Pkn1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6251206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EgRVsNUIQFdi/fLRBTVc+5LiNNU5HhzOaMgACwQ3HxA=; b=oUzhHZOZmO1e7TVoNxLHnGucX
	oalLTNY59pCqhRU5LR5Z+wzZu1uKb725wi35OhH0l5WGG2aBc716JvYOHxMoPFV9yBKIcZxf69cDT
	Dxov1nN3GQzzhdHokF2G2vrYcLh64nR+/4Zmazrq+UP9FznsIkz8SpUgCp1wA5Wg7+1RSEJ2KWDWb
	y1qZapIdwXaKUiv2Z9jgYDtRb2jUpoxj0X3m6EFSnEkga3c2TfISHI5jl3B3jDD1MDCSC86bXNbMz
	WFNuQsP5yTo+Pnq4gEspScu5GI24KdEJtM+zR1vPQkUr4tQYzdcZGi05BsA166NgYWqDhaew+MXnH
	U38IOO3lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXXA-0003O9-OS; Wed, 30 Sep 2020 08:32:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXWz-0003G4-N0; Wed, 30 Sep 2020 08:32:11 +0000
X-UUID: 2a7faa90b53a4674a61a16a53a803526-20200930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ua3qzbbELhDUqHL6B2hkJ3+GoeysnJWSTXOlUV9J9SY=; 
 b=GAv4Pkn1OjfEhZhmFo5wAMC8dApzk1CG25bO5cibaqYFmtCBdZOlsI5wZJqmiA2Xuy0uCCV1RL7RPWQhAL2+yfBox56nTHRCeTnwiMTwYmnJUxW+ZauMlWjn/8nc66PLgCZcjuhkLGPEj0q26cQm0lNwlISDMdGroCMQlaBawfc=;
X-UUID: 2a7faa90b53a4674a61a16a53a803526-20200930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 877128171; Wed, 30 Sep 2020 00:32:01 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 01:31:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 16:31:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 16:31:23 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 4/4] mmc: mediatek: Add subsys clock control for MT8192 msdc
Date: Wed, 30 Sep 2020 16:31:20 +0800
Message-ID: <20200930083120.11971-5-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930083120.11971-1-wenbin.mei@mediatek.com>
References: <20200930083120.11971-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_043209_876385_FFF3B305 
X-CRM114-Status: GOOD (  16.22  )
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
---
 drivers/mmc/host/mtk-sd.c | 77 ++++++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a704745e5882..9a1422955593 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -425,6 +425,8 @@ struct msdc_host {
 	struct clk *h_clk;      /* msdc h_clk */
 	struct clk *bus_clk;	/* bus clock which used to access register */
 	struct clk *src_clk_cg; /* msdc source clock control gate */
+	struct clk *sys_clk_cg;	/* msdc subsys clock control gate */
+	struct clk_bulk_data bulk_clks[3];	/* pclk, axi, ahb clock control gate */
 	u32 mclk;		/* mmc subsystem clock frequency */
 	u32 src_clk_freq;	/* source clock frequency */
 	unsigned char timing;
@@ -784,6 +786,8 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
 
 static void msdc_gate_clock(struct msdc_host *host)
 {
+	clk_bulk_disable_unprepare(ARRAY_SIZE(host->bulk_clks),
+				   host->bulk_clks);
 	clk_disable_unprepare(host->src_clk_cg);
 	clk_disable_unprepare(host->src_clk);
 	clk_disable_unprepare(host->bus_clk);
@@ -792,10 +796,17 @@ static void msdc_gate_clock(struct msdc_host *host)
 
 static void msdc_ungate_clock(struct msdc_host *host)
 {
+	int ret;
+
 	clk_prepare_enable(host->h_clk);
 	clk_prepare_enable(host->bus_clk);
 	clk_prepare_enable(host->src_clk);
 	clk_prepare_enable(host->src_clk_cg);
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(host->bulk_clks),
+				      host->bulk_clks);
+	if (ret)
+		dev_dbg(host->dev, "enable clks failed!\n");
+
 	while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
 		cpu_relax();
 }
@@ -2366,6 +2377,52 @@ static void msdc_of_property_parse(struct platform_device *pdev,
 		host->cqhci = false;
 }
 
+static int msdc_of_clock_parse(struct platform_device *pdev,
+			       struct msdc_host *host)
+{
+	struct clk *clk;
+
+	host->src_clk = devm_clk_get(&pdev->dev, "source");
+	if (IS_ERR(host->src_clk))
+		return PTR_ERR(host->src_clk);
+
+	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
+	if (IS_ERR(host->h_clk))
+		return PTR_ERR(host->h_clk);
+
+	host->bus_clk = devm_clk_get(&pdev->dev, "bus_clk");
+	if (IS_ERR(host->bus_clk))
+		host->bus_clk = NULL;
+
+	/*source clock control gate is optional clock*/
+	host->src_clk_cg = devm_clk_get(&pdev->dev, "source_cg");
+	if (IS_ERR(host->src_clk_cg))
+		host->src_clk_cg = NULL;
+
+	host->sys_clk_cg = devm_clk_get(&pdev->dev, "sys_cg");
+	if (IS_ERR(host->sys_clk_cg))
+		host->sys_clk_cg = NULL;
+	else
+		clk_prepare_enable(host->sys_clk_cg);
+
+	clk = devm_clk_get(&pdev->dev, "pclk_cg");
+	if (IS_ERR(clk))
+		clk = NULL;
+	host->bulk_clks[0].clk = clk;
+
+	clk = devm_clk_get(&pdev->dev, "axi_cg");
+	if (IS_ERR(clk))
+		clk = NULL;
+	host->bulk_clks[1].clk = clk;
+
+	clk = devm_clk_get(&pdev->dev, "ahb_cg");
+	if (IS_ERR(clk))
+		clk = NULL;
+	host->bulk_clks[2].clk = clk;
+
+	return 0;
+}
+
 static int msdc_drv_probe(struct platform_device *pdev)
 {
 	struct mmc_host *mmc;
@@ -2405,25 +2462,9 @@ static int msdc_drv_probe(struct platform_device *pdev)
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
