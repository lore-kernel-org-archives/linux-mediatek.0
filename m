Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4629C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG3fgCl2D4Jjl4QFc60+5McCHCqmpfeas57O552t8+g=; b=j/3ldOe238jcETtCRllxDO92L3
	LAnbKVyHl2yVvG9rb+WA8xh1Q21hcHcSVVN40Hzd1APYjN8BUJIJNbXzgttwZ4MVlxgKOmBrE90rt
	zJjiVWXigDIdTPL3Ywb/pD18LHgOYpkk3C0iK+WhxW15C8x9bmTscNA3m2Zne9tiNw0fBw3y7nUua
	NX53DQ3+EvFOQ2yID+lbUqDLqQEOnrzGmqfy5U8LmrpwAOS08rucOxE00wf4hlCgcvGsVVRoU7G4Z
	+QlFT9NMKfnlsbOt9j8MM7gf22S7FNsMcrUQIgKEU5Fm2ZFvqpnF3FqRv0I8/W5iVNpx0ntTtCvhM
	JMEmxiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omudq-000hbd-JI; Mon, 24 Oct 2022 10:25:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omucG-000gqf-HQ; Mon, 24 Oct 2022 10:23:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F06D16602824;
	Mon, 24 Oct 2022 11:23:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666607010;
	bh=Dh97L7JvjfiBu8V6B+2CA5mLksRChUmKRFgxrGoQYBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TvbvH7xeK4iqIydRWHhJqnRO+zIQjaQhBMCL/scRSAUk66+J5M/mEl28MBNqbEEfc
	 xyLH9KMiCfacPshXsncBxdE5JSuoZ2Y/ZRL35LyGEdpms8htxvbf1YfXG+E6Q73HRa
	 hhPmB4Whi0JaBBwapXiq6Ykav3ahCOvkMZwpXH0PafoYAx6pPVPAFudrevDCJr0ovB
	 V4GNN+q8G8SnCULI3PFoFRAsat5ccJQhSsq0P6oQAI2HJS4NJI4taSaKyr8Pd8SpJN
	 Nik0B44QPlnQpRlTppu+py3djaWi0LfbLXKKPt8OuHb8eubNkMOmTjEIbCGTre63BD
	 bKEUgKQLNppeA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	msp@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] clk: mediatek: mt8173: Drop flags for main/sys/univpll fixed factors
Date: Mon, 24 Oct 2022 12:23:02 +0200
Message-Id: <20221024102307.33722-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_032332_864319_668B7B98 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

The main/sys/univpll clocks are used as clock sources for multiple
peripherals of different kind, some of which are critical (like AXIs);
a rate change on any of these two will produce a rate change on many
devices and that's likely to produce system instability if not done
correctly: this is the reason why we have (a lot of) "fixed factor"
main/sys/univpll divider clocks, used by MUX clocks to provide
different rates based on PLL output dividers.

Following what was done on clk-mt8186-topckgen and also preventing the
same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
clocks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8173.c | 76 +++++++++++++++----------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index b8529ee7199d..b57e33cda7a5 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -37,19 +37,19 @@ static const struct mtk_fixed_factor top_divs[] __initconst = {
 	FACTOR(CLK_TOP_ARMCA7PLL_754M, "armca7pll_754m", "armca7pll", 1, 2),
 	FACTOR(CLK_TOP_ARMCA7PLL_502M, "armca7pll_502m", "armca7pll", 1, 3),
 
-	FACTOR(CLK_TOP_MAIN_H546M, "main_h546m", "mainpll", 1, 2),
-	FACTOR(CLK_TOP_MAIN_H364M, "main_h364m", "mainpll", 1, 3),
-	FACTOR(CLK_TOP_MAIN_H218P4M, "main_h218p4m", "mainpll", 1, 5),
-	FACTOR(CLK_TOP_MAIN_H156M, "main_h156m", "mainpll", 1, 7),
+	FACTOR_FLAGS(CLK_TOP_MAIN_H546M, "main_h546m", "mainpll", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAIN_H364M, "main_h364m", "mainpll", 1, 3, 0),
+	FACTOR_FLAGS(CLK_TOP_MAIN_H218P4M, "main_h218p4m", "mainpll", 1, 5, 0),
+	FACTOR_FLAGS(CLK_TOP_MAIN_H156M, "main_h156m", "mainpll", 1, 7, 0),
 
 	FACTOR(CLK_TOP_TVDPLL_445P5M, "tvdpll_445p5m", "tvdpll", 1, 4),
 	FACTOR(CLK_TOP_TVDPLL_594M, "tvdpll_594m", "tvdpll", 1, 3),
 
-	FACTOR(CLK_TOP_UNIV_624M, "univ_624m", "univpll", 1, 2),
-	FACTOR(CLK_TOP_UNIV_416M, "univ_416m", "univpll", 1, 3),
-	FACTOR(CLK_TOP_UNIV_249P6M, "univ_249p6m", "univpll", 1, 5),
-	FACTOR(CLK_TOP_UNIV_178P3M, "univ_178p3m", "univpll", 1, 7),
-	FACTOR(CLK_TOP_UNIV_48M, "univ_48m", "univpll", 1, 26),
+	FACTOR_FLAGS(CLK_TOP_UNIV_624M, "univ_624m", "univpll", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIV_416M, "univ_416m", "univpll", 1, 3, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIV_249P6M, "univ_249p6m", "univpll", 1, 5, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIV_178P3M, "univ_178p3m", "univpll", 1, 7, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIV_48M, "univ_48m", "univpll", 1, 26, 0),
 
 	FACTOR(CLK_TOP_CLKRTC_EXT, "clkrtc_ext", "clk32k", 1, 1),
 	FACTOR(CLK_TOP_CLKRTC_INT, "clkrtc_int", "clk26m", 1, 793),
@@ -84,20 +84,20 @@ static const struct mtk_fixed_factor top_divs[] __initconst = {
 	FACTOR(CLK_TOP_MSDCPLL2_D2, "msdcpll2_d2", "msdcpll2", 1, 2),
 	FACTOR(CLK_TOP_MSDCPLL2_D4, "msdcpll2_d4", "msdcpll2", 1, 4),
 
-	FACTOR(CLK_TOP_SYSPLL_D2, "syspll_d2", "main_h546m", 1, 1),
-	FACTOR(CLK_TOP_SYSPLL1_D2, "syspll1_d2", "main_h546m", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL1_D4, "syspll1_d4", "main_h546m", 1, 4),
-	FACTOR(CLK_TOP_SYSPLL1_D8, "syspll1_d8", "main_h546m", 1, 8),
-	FACTOR(CLK_TOP_SYSPLL1_D16, "syspll1_d16", "main_h546m", 1, 16),
-	FACTOR(CLK_TOP_SYSPLL_D3, "syspll_d3", "main_h364m", 1, 1),
-	FACTOR(CLK_TOP_SYSPLL2_D2, "syspll2_d2", "main_h364m", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL2_D4, "syspll2_d4", "main_h364m", 1, 4),
-	FACTOR(CLK_TOP_SYSPLL_D5, "syspll_d5", "main_h218p4m", 1, 1),
-	FACTOR(CLK_TOP_SYSPLL3_D2, "syspll3_d2", "main_h218p4m", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL3_D4, "syspll3_d4", "main_h218p4m", 1, 4),
-	FACTOR(CLK_TOP_SYSPLL_D7, "syspll_d7", "main_h156m", 1, 1),
-	FACTOR(CLK_TOP_SYSPLL4_D2, "syspll4_d2", "main_h156m", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL4_D4, "syspll4_d4", "main_h156m", 1, 4),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D2, "syspll_d2", "main_h546m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL1_D2, "syspll1_d2", "main_h546m", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL1_D4, "syspll1_d4", "main_h546m", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL1_D8, "syspll1_d8", "main_h546m", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL1_D16, "syspll1_d16", "main_h546m", 1, 16, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D3, "syspll_d3", "main_h364m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL2_D2, "syspll2_d2", "main_h364m", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL2_D4, "syspll2_d4", "main_h364m", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D5, "syspll_d5", "main_h218p4m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL3_D2, "syspll3_d2", "main_h218p4m", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL3_D4, "syspll3_d4", "main_h218p4m", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D7, "syspll_d7", "main_h156m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL4_D2, "syspll4_d2", "main_h156m", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL4_D4, "syspll4_d4", "main_h156m", 1, 4, 0),
 
 	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll_594m", 1, 1),
 	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll_594m", 1, 2),
@@ -105,21 +105,21 @@ static const struct mtk_fixed_factor top_divs[] __initconst = {
 	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll_594m", 1, 8),
 	FACTOR(CLK_TOP_TVDPLL_D16, "tvdpll_d16", "tvdpll_594m", 1, 16),
 
-	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univ_624m", 1, 1),
-	FACTOR(CLK_TOP_UNIVPLL1_D2, "univpll1_d2", "univ_624m", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL1_D4, "univpll1_d4", "univ_624m", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL1_D8, "univpll1_d8", "univ_624m", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univ_416m", 1, 1),
-	FACTOR(CLK_TOP_UNIVPLL2_D2, "univpll2_d2", "univ_416m", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL2_D4, "univpll2_d4", "univ_416m", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL2_D8, "univpll2_d8", "univ_416m", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univ_249p6m", 1, 1),
-	FACTOR(CLK_TOP_UNIVPLL3_D2, "univpll3_d2", "univ_249p6m", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL3_D4, "univpll3_d4", "univ_249p6m", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL3_D8, "univpll3_d8", "univ_249p6m", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univ_178p3m", 1, 1),
-	FACTOR(CLK_TOP_UNIVPLL_D26, "univpll_d26", "univ_48m", 1, 1),
-	FACTOR(CLK_TOP_UNIVPLL_D52, "univpll_d52", "univ_48m", 1, 2),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univ_624m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL1_D2, "univpll1_d2", "univ_624m", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL1_D4, "univpll1_d4", "univ_624m", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL1_D8, "univpll1_d8", "univ_624m", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univ_416m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL2_D2, "univpll2_d2", "univ_416m", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL2_D4, "univpll2_d4", "univ_416m", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL2_D8, "univpll2_d8", "univ_416m", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univ_249p6m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL3_D2, "univpll3_d2", "univ_249p6m", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL3_D4, "univpll3_d4", "univ_249p6m", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL3_D8, "univpll3_d8", "univ_249p6m", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univ_178p3m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D26, "univpll_d26", "univ_48m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D52, "univpll_d52", "univ_48m", 1, 2, 0),
 
 	FACTOR(CLK_TOP_VCODECPLL, "vcodecpll_ck", "vcodecpll", 1, 3),
 	FACTOR(CLK_TOP_VCODECPLL_370P5, "vcodecpll_370p5", "vcodecpll", 1, 4),
-- 
2.37.2


