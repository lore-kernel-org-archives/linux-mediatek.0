Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B42C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ne7iKWynewhvepyffpsn66sALgHa3UPLE7ColAOjqLU=; b=RmTn/D9Snye8XwXhHd3q9Hg27b
	mmblhEZ6LFNOS/4xMU/GuY6hiGrU/a6zQOKgeTtGeCaPQM9eeKv2XO5cuWXrvvMIGQ7yFBXZ807OJ
	8pVoI+Q6BTulNsNawV2bUsrgRmUF8NlLMypacfUY/TZ6WckcxSCkYEYyOpXhrCrszZkghPiOVqpb3
	nBCmfbJ5IJbcI+5Ox0FCdWOoC2pkyiPIQMQ6Ivbs+Lq1nRrBvlBl/g6YkcRRiQxZGD641i7ou5hGL
	8XN1GGHuI70aYwl5acImiNK4ZE4weM0C905UOvxto7ZVrllWxKhkuOK+cPN2nna2WllytKd9Xil+y
	OKhfrWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6B2Z-00FlRN-1V;
	Mon, 05 Jun 2023 14:18:35 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6B2W-00FlPP-00;
	Mon, 05 Jun 2023 14:18:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1q6B2N-00073n-07;
	Mon, 05 Jun 2023 14:18:23 +0000
Date: Mon, 5 Jun 2023 15:18:12 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH] cpufreq: mediatek: correct voltages for MT7622 and MT7623
Message-ID: <ZH3umLU883eGbYBx@makrotopia.org>
References: <9d7e62049e3442582bd64dbc9e4d2a64f1ad0c1a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d7e62049e3442582bd64dbc9e4d2a64f1ad0c1a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_071832_037509_9C6ACB36 
X-CRM114-Status: GOOD (  13.62  )
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

The MT6380 regulator typically used together with MT7622 does not
support the current maximum processor and SRAM voltage in the cpufreq
driver (1360000uV).
For MT7622 limit processor and SRAM supply voltages to 1350000uV to
avoid having the tracking algorithm request unsupported voltages from
the regulator.

On MT7623 there is no separate SRAM supply and the maximum voltage used
is 1300000uV. Create dedicated platform data for MT7623 to cover that
case as well.

Fixes: 0883426fd07e3 ("cpufreq: mediatek: Raise proc and sram max voltage for MT7622/7623")
Suggested-by: Jia-wei Chang <Jia-wei.Chang@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 9a39a7ccfae96..fef68cb2b38f7 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -696,9 +696,16 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
 static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
 	.min_volt_shift = 100000,
 	.max_volt_shift = 200000,
-	.proc_max_volt = 1360000,
+	.proc_max_volt = 1350000,
 	.sram_min_volt = 0,
-	.sram_max_volt = 1360000,
+	.sram_max_volt = 1350000,
+	.ccifreq_supported = false,
+};
+
+static const struct mtk_cpufreq_platform_data mt7623_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 1300000,
 	.ccifreq_supported = false,
 };
 
@@ -734,7 +741,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
-	{ .compatible = "mediatek,mt7623", .data = &mt7622_platform_data },
+	{ .compatible = "mediatek,mt7623", .data = &mt7623_platform_data },
 	{ .compatible = "mediatek,mt8167", .data = &mt8516_platform_data },
 	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
-- 
2.41.0


