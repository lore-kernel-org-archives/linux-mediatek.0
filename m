Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10393C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dz2mheJDfObycJwcc1Bk8TmgsLqq6x+ImrkrFILsGBU=; b=Kn64bA6Qro7raifc3s/tnOxC9s
	ZdYUcuVnYNAQ4KVu03U/78pnRUNFOA8VZ1P53RSO7LgRRp2j58wh3gTVXx7Gg/epTk00cfq+SAwgq
	VOHBxn0ANMuJKVME29NQ5QultGUDSLbG/WQy3M5pq03reuRywiQVofZHwVk0oe4yz09o0h0dYB/BG
	W1oQ0wWvtjxOnyvY7pL5jV47mRpXghPgZVyNR4UsTnSPr2TaepoUNJrgtRoPuoeiPwtU/h8QjKQgN
	/bCNFPt7g8edg2VVY+uw5HTGO5kVh+TJcWk89G7LjaQPuzz5s9UFraZlXKmcc7rgwXEEdM3Yo4sVM
	hoA/w7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqtN6-00392j-BW; Fri, 04 Nov 2022 09:52:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqtN0-00390L-RA; Fri, 04 Nov 2022 09:52:17 +0000
X-UUID: c2801d2ca9434299b04e9cb8093ee327-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dz2mheJDfObycJwcc1Bk8TmgsLqq6x+ImrkrFILsGBU=;
	b=AHytPh7qCdRrYOyxIW+NiPo+YLlIXAW+is7DYFWgkuq8D//f3TNFYf4pqpntIkOQF4RCzLOBrFn7pTfjWzv8aRGxO+U0WAY0wmMzcp5TUCMZQHxsJOZj0TYBProAMWm3euvLK61yogvkom7qeUUkus1zuvGh4ZZ+5MngvgrKmSc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:291df03e-669f-4a24-96ab-cf690f0d7ef2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:36d472eb-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c2801d2ca9434299b04e9cb8093ee327-20221104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 924456825; Fri, 04 Nov 2022 02:52:10 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 17:52:01 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 4 Nov 2022 17:52:00 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <chaotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <angelogioacchino.delregno@collabora.com>,
	Mengqi Zhang <mengqi.zhang@mediatek.com>
Subject: [PATCH v2 1/2] mmc: mtk-sd: add Inline Crypto Engine clock control
Date: Fri, 4 Nov 2022 17:51:13 +0800
Message-ID: <20221104095112.27348-2-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104095112.27348-1-mengqi.zhang@mediatek.com>
References: <20221104095112.27348-1-mengqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_025214_939753_0D000423 
X-CRM114-Status: GOOD (  12.81  )
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

Add crypto clock control and ungate it before CQHCI init.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 3f7f3a1e0df8..652a67f9b054 100644
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
@@ -840,6 +841,7 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
 static void msdc_gate_clock(struct msdc_host *host)
 {
 	clk_bulk_disable_unprepare(MSDC_NR_CLOCKS, host->bulk_clks);
+	clk_disable_unprepare(host->crypto_clk);
 	clk_disable_unprepare(host->src_clk_cg);
 	clk_disable_unprepare(host->src_clk);
 	clk_disable_unprepare(host->bus_clk);
@@ -855,6 +857,7 @@ static int msdc_ungate_clock(struct msdc_host *host)
 	clk_prepare_enable(host->bus_clk);
 	clk_prepare_enable(host->src_clk);
 	clk_prepare_enable(host->src_clk_cg);
+	clk_prepare_enable(host->crypto_clk);
 	ret = clk_bulk_prepare_enable(MSDC_NR_CLOCKS, host->bulk_clks);
 	if (ret) {
 		dev_err(host->dev, "Cannot enable pclk/axi/ahb clock gates\n");
@@ -2672,6 +2675,15 @@ static int msdc_drv_probe(struct platform_device *pdev)
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


