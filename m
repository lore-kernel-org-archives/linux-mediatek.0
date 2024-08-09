Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803D1C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MAEU11aQfMeQr6AmP9PgT4zcUtF4lfhMl6ghnzso28U=; b=s0TOHVRwWkRoJvys4IdN9swzgN
	4n4549AoKN3Ro3U/ehq2j/YJZwpklJpuYvGySHgxOoTvEPiJEj+efQsxKDgV1wndvvf+jsDFHQkLI
	7Z/E6hcq/hHv2nD7Nm5uiaj1K/Xk1X7QToW022nYj96RKlvFD3qT8HfoP97SWjGS+RDLDB2ub9+ui
	eMbbCREvgTfEIxWqek8RX/zlTyHt+kMcy4PyNtBTFXrwKyqXEyFTOx3ZzitXIzv3NSge1qq7nK7XO
	wTX5iTj1hZAtoVp4SEGe/HMw1gXeb5YOUy/60HGBCEoCHlMFRJ9anleHOE0hhM++HNA3YCUvLP9Jt
	h+jgVpGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scTN1-0000000C3ch-1VhM;
	Fri, 09 Aug 2024 17:25:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scTMQ-0000000C3XY-05Ob;
	Fri, 09 Aug 2024 17:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22BB4616FF;
	Fri,  9 Aug 2024 17:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A1EC32782;
	Fri,  9 Aug 2024 17:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723224304;
	bh=DQOfsEX2Un26oH82FuDvvRuhCP7yObI46puLbuELVbM=;
	h=From:To:Cc:Subject:Date:From;
	b=mgNvtuVKUSAfv0qDsgFw5zpF4qa/SHt9d46Cn+Dex9ZbyCZobtBu20hrgCTcXP1Oh
	 5f3TSPq+B9BV0tANf+kVX8GAgnNoh+tyO7uDENg+84hXQe/A4ULz6hsIKA14/CM5nC
	 XeUNoQSs1epcqsKPlMJq1+7YQckrOBKAGq6/lazvfVOIr5YAs5UWfhG+OnF488RkX6
	 2XCicRtbZiACB5iVayJbUT4tHlCSYS9mINdW86lu1COE4PqF12d0DLEyFjL3y/iFXo
	 MKJuRL8hk6aPzShQSJsWy3OkM26QjlzlMCyMYZRvZ1iJcDb/n+8ySx7ZXnRRh8m+j2
	 4meU19r7S0VQA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ilia Lin <ilia.lin@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel test robot <lkp@intel.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] cpufreq: Fix warning on unused of_device_id tables for !CONFIG_OF
Date: Fri,  9 Aug 2024 11:24:38 -0600
Message-ID: <20240809172439.908092-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_102506_170980_C4F5CBE3 
X-CRM114-Status: GOOD (  12.84  )
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

!CONFIG_OF builds cause warnings on unused of_device_id tables. This is
due to of_match_node() being a macro rather than static inline function.
Add a __maybe_unused annotation to the of_device_id tables.

Fixes: c7582ec85342 ("cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408090714.wcrqU6Pk-lkp@intel.com/
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Note that 0-day only reported 1 warning, but x86 W=1 build gave me these
4.
---
 drivers/cpufreq/apple-soc-cpufreq.c  | 2 +-
 drivers/cpufreq/mediatek-cpufreq.c   | 2 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 +-
 drivers/cpufreq/ti-cpufreq.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index af34c22fa273..4dcacab9b4bf 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -85,7 +85,7 @@ static const struct apple_soc_cpufreq_info soc_default_info = {
 	.cur_pstate_mask = 0, /* fallback */
 };
 
-static const struct of_device_id apple_soc_cpufreq_of_match[] = {
+static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
 	{
 		.compatible = "apple,t8103-cluster-cpufreq",
 		.data = &soc_t8103_info,
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 3a1aadaa723c..663f61565cf7 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -738,7 +738,7 @@ static const struct mtk_cpufreq_platform_data mt8516_platform_data = {
 };
 
 /* List of machines supported by this driver */
-static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
+static const struct of_device_id mtk_cpufreq_machines[] __initconst __maybe_unused = {
 	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 939702dfa73f..703308fb891a 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -611,7 +611,7 @@ static struct platform_driver qcom_cpufreq_driver = {
 	},
 };
 
-static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
+static const struct of_device_id qcom_cpufreq_match_list[] __initconst __maybe_unused = {
 	{ .compatible = "qcom,apq8096", .data = &match_data_kryo },
 	{ .compatible = "qcom,msm8909", .data = &match_data_msm8909 },
 	{ .compatible = "qcom,msm8996", .data = &match_data_kryo },
diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 4d3f27958fbd..220fff7a302e 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -419,7 +419,7 @@ static int ti_cpufreq_setup_syscon_register(struct ti_cpufreq_data *opp_data)
 	return 0;
 }
 
-static const struct of_device_id ti_cpufreq_of_match[] = {
+static const struct of_device_id ti_cpufreq_of_match[]  __maybe_unused = {
 	{ .compatible = "ti,am33xx", .data = &am3x_soc_data, },
 	{ .compatible = "ti,am3517", .data = &am3517_soc_data, },
 	{ .compatible = "ti,am43", .data = &am4x_soc_data, },
-- 
2.43.0


