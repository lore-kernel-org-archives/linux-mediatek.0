Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F70C35FFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Mar 2025 11:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7P8+o/qjzFpbFgyGZ1TpEIbuCtW1Fy+CN2p9NSGoHII=; b=Voy8WX5yhPgocTqCKoNDu4nVw2
	AxzJp/qivbso842A9etb0+Et+Mxi2cFeXPCcXCgOdyw6Lu/wsxbLieNYTWUvb/8780jic82PpjXER
	tqtCyLZ/idozICyesOcUENgi8sUAavDFSnkHJJ6bmbSCNoHMlCOqdXT/tTUUwdxRmhCE83m2nBUwN
	a2S6AfhTZwSxd256ZvvKT0l1rHF4EzK+s2NUmWyqB8sGO6HT69do/1GeRebx6BkiKXoQTV8Z5Aj8z
	tE5AlDK/Xh5pXq1TLMqT1Rst0dSeub0JTZc6oT8RfYPDhgXlJaU1KwMnRDjH3WkJ4Fm/sAIzoSpAA
	myyFqheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2IZ-00000005cYB-2Z8u;
	Tue, 25 Mar 2025 11:18:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx27l-00000005aXW-36bs;
	Tue, 25 Mar 2025 11:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742900832;
	bh=6gfZwf9ykxKwOa5PaJOpeqSIrrjjR+YFkwmIKu4UMTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i8+hY6E892an2brH4W+uQ5V7R/JmO8lW8mZpQPragEGDMJuPM3Bxbbxhw0d//6wrF
	 gRqHRnYwMGEeVWWu+ACn/hxRBblbn+BgHLptbgrvhygYgepZHIXF1THWiqE8iqg5bA
	 ayzkTuTK+TDKdgGHZpuC1qfAurEv/4opxVXHtXXgq8LTlEJ2m/UV9+rG85+NwYt9xg
	 6a98Hbp+J2IxW4Lt/O+ZyGNz2gh/iZzvRqQkiwUFJ3nJLYeQ02fHDw/InSuoa6hWTw
	 Ypjx164S0Ve096ZVhmnSD+bA0XW6pH1HNl8jqiLATzAoQl4Uie2npsyeAt3hs6vpJE
	 +I82wcNruk8Mw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D1FA917E0FCE;
	Tue, 25 Mar 2025 12:07:11 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	axe.yang@mediatek.com
Subject: [PATCH 3/4] mmc: mtk-sd: Do single write in function msdc_new_tx_setting
Date: Tue, 25 Mar 2025 12:07:00 +0100
Message-ID: <20250325110701.52623-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
References: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_040713_953663_9B39EADF 
X-CRM114-Status: GOOD (  10.19  )
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

Instead of reading and writing the LOOP_TEST_CONTROL register for
each set or cleared bit, read it once, modify the contents in a
local variable, and then write once.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index dd3f7468d32c..e9e84b9a65f0 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -942,15 +942,15 @@ static int msdc_ungate_clock(struct msdc_host *host)
 
 static void msdc_new_tx_setting(struct msdc_host *host)
 {
+	u32 val;
+
 	if (!host->top_base)
 		return;
 
-	sdr_set_bits(host->top_base + LOOP_TEST_CONTROL,
-		     TEST_LOOP_DSCLK_MUX_SEL);
-	sdr_set_bits(host->top_base + LOOP_TEST_CONTROL,
-		     TEST_LOOP_LATCH_MUX_SEL);
-	sdr_clr_bits(host->top_base + LOOP_TEST_CONTROL,
-		     TEST_HS400_CMD_LOOP_MUX_SEL);
+	val = readl(host->top_base + LOOP_TEST_CONTROL);
+	val |= TEST_LOOP_DSCLK_MUX_SEL;
+	val |= TEST_LOOP_LATCH_MUX_SEL;
+	val &= ~TEST_HS400_CMD_LOOP_MUX_SEL;
 
 	switch (host->timing) {
 	case MMC_TIMING_LEGACY:
@@ -960,19 +960,18 @@ static void msdc_new_tx_setting(struct msdc_host *host)
 	case MMC_TIMING_UHS_SDR25:
 	case MMC_TIMING_UHS_DDR50:
 	case MMC_TIMING_MMC_DDR52:
-		sdr_clr_bits(host->top_base + LOOP_TEST_CONTROL,
-			     LOOP_EN_SEL_CLK);
+		val &= ~LOOP_EN_SEL_CLK;
 		break;
 	case MMC_TIMING_UHS_SDR50:
 	case MMC_TIMING_UHS_SDR104:
 	case MMC_TIMING_MMC_HS200:
 	case MMC_TIMING_MMC_HS400:
-		sdr_set_bits(host->top_base + LOOP_TEST_CONTROL,
-			     LOOP_EN_SEL_CLK);
+		val |= LOOP_EN_SEL_CLK;
 		break;
 	default:
 		break;
 	}
+	writel(val, host->top_base + LOOP_TEST_CONTROL);
 }
 
 static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
-- 
2.48.1


