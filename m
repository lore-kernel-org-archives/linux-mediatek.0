Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D2EC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn+eB38yUNYYlB0kWIB5Ik9AssYvq2xUhGitlBC7pfw=; b=VDLKwGDNLuiE2l53OA1V3agChA
	V1bKUhlmptKLkh/2IKwj3rwxiNNbWtrCPRBJV+lEz6oLizJXzOWnEaUcSL6bQELn2g/+QxpMqqQFE
	nt0Z+6gKnCD5RF5Ae8CUydbdOKqMOo9KNGC8h1mmIOTl+vTE1g2TqZ4DeZPqsgh2viKwDMoLHcST8
	d4Y33q+q5rZ48Jf32ie0v3gTjpNkIEBDLF7XsBbZqimEo5a1wgTysCoztrrIswHkvsJNDHWiUIXQo
	PhvEmsJjp73Y9kosSfkLtV99IVLz55XVmULkknTKljq0JWF8HX55SImH+3V9zKDt/vGq5FkuJrT4v
	M+4WFjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okQzC-00CeDK-Qi; Mon, 17 Oct 2022 14:20:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okQyp-00Ce4L-RS; Mon, 17 Oct 2022 14:20:38 +0000
X-UUID: 65a3245f4e3346f48a5070a9e50028be-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Bn+eB38yUNYYlB0kWIB5Ik9AssYvq2xUhGitlBC7pfw=;
	b=XoXkknxbiCtUXaMlj34sbAYWv34G5PO5XBjHJjl2HNH5C8QqrOhE7mj0JY+R1vxkdHf4ZaU3Hl+LkURVpZ4JrkaH7MSGhXny8c+aNQTk32Sh4+Rrb8Levn6EnQB4d2T8Cyh3lLafJefuINVuBX2xUSyqXuVMn88c/72UJIp+3AE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:201c1a0f-800c-4c3c-a36d-e1794a81678a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:bad80aa4-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 65a3245f4e3346f48a5070a9e50028be-20221017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1125972233; Mon, 17 Oct 2022 07:20:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 17 Oct 2022 22:20:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 17 Oct 2022 22:20:12 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <chaotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mengqi Zhang <mengqi.zhang@mediatek.com>
Subject: [PATCH 1/2] mmc: mtk-sd: add Inline Crypto Engine support
Date: Mon, 17 Oct 2022 22:20:06 +0800
Message-ID: <20221017142007.5408-2-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
References: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_072035_918178_BB248C0F 
X-CRM114-Status: GOOD (  12.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add crypto clock control and ungate it before CQHCI init.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 69d78604d1fc..8b6ef8691e5b 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -452,6 +452,7 @@ struct msdc_host {
 	struct clk *bus_clk;	/* bus clock which used to access register */
 	struct clk *src_clk_cg; /* msdc source clock control gate */
 	struct clk *sys_clk_cg;	/* msdc subsys clock control gate */
+	struct clk *crypto_clk; /* msdc crypto clock control gate */
 	struct clk_bulk_data bulk_clks[MSDC_NR_CLOCKS];
 	u32 mclk;		/* mmc subsystem clock frequency */
 	u32 src_clk_freq;	/* source clock frequency */
@@ -811,6 +812,7 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
 static void msdc_gate_clock(struct msdc_host *host)
 {
 	clk_bulk_disable_unprepare(MSDC_NR_CLOCKS, host->bulk_clks);
+	clk_disable_unprepare(host->crypto_clk);
 	clk_disable_unprepare(host->src_clk_cg);
 	clk_disable_unprepare(host->src_clk);
 	clk_disable_unprepare(host->bus_clk);
@@ -826,6 +828,7 @@ static int msdc_ungate_clock(struct msdc_host *host)
 	clk_prepare_enable(host->bus_clk);
 	clk_prepare_enable(host->src_clk);
 	clk_prepare_enable(host->src_clk_cg);
+	clk_prepare_enable(host->crypto_clk);
 	ret = clk_bulk_prepare_enable(MSDC_NR_CLOCKS, host->bulk_clks);
 	if (ret) {
 		dev_err(host->dev, "Cannot enable pclk/axi/ahb clock gates\n");
@@ -2643,6 +2646,15 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		goto host_free;
 	}
 
+	/* only eMMC has crypto property */
+	if (!(mmc->caps2 & MMC_CAP2_NO_MMC)) {
+		host->crypto_clk = devm_clk_get_optional(&pdev->dev, "crypto");
+		if (IS_ERR(host->crypto_clk))
+			host->crypto_clk = NULL;
+		else
+			mmc->caps2 |= MMC_CAP2_CRYPTO;
+	}
+
 	host->irq = platform_get_irq(pdev, 0);
 	if (host->irq < 0) {
 		ret = -EINVAL;
-- 
2.25.1


