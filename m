Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CA7C38150
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=afrGhcBsjssYMBQHU7SaQvwQb8xoKysBWLZ//Qcwf+Y=; b=LexUwtCLs2UE9nndjy7mWPClXl
	fGdeCOdxnxHWNDcB8lYsMQpuvshI5p6tBVF8fuOR1XY1Ik2Ma3M+D67W3vXwDlnsVCLUil+gWlhLb
	sgdgVhhxwnfyh5u8sgYC77ka+z8sKkod6uwsHo1BUj7I73rzaS3hTjXli+W/xkzcWpg50vRSOeKFJ
	ASKB/zTDSPBlbpQEv5VDbjUDt9jbqJYIJ2tLD7eITAO/kkqioJ/EX/CDG7m/2aUAEQGZlDXre6N9V
	+9MYxmprEHrPPsOug88UOemkRqkRJdWJ6IAa+mo0dMywP2Ja4zbt14Mv5GqX/Bi4iJRP+2mHOk0ep
	ilMq808A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPlHR-0000000GNPG-2zIU;
	Fri, 05 Jul 2024 15:55:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPlHB-0000000GNJt-0Jix;
	Fri, 05 Jul 2024 15:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720194906;
	bh=kOSHRdFyv4jRD2QGO/b2DiRxc1SpOLMXblZO+rnM9s0=;
	h=From:Date:Subject:To:Cc:From;
	b=Zi66ywZ2qdm2rvaz1PXfD+QusPiU3Jdw5oXGwB9qdUTYV+ohvDijkisXkh4IelSg5
	 9Cnzq6Hg6Sr0W/H1udQ7TUsxAQZVlNaI6JnPOBtwwRRYaO3xzC6Qj/7JGBv4+Ei8pp
	 v+Uk2auNzBBZh1BQqqWknJ6nxv3Fw9ra2hAYFcQu4nWz2LB7KzChGaD/E4bsZRSEZA
	 03EvpDzjLXW0IEIqQzl3lC4MsXEvJOqmaCTOgqEWK8Ad0kbnOYiqlgCb/QvxaihWug
	 XLMwIXxhRHpcfop5KyF1CuXA0c22f6NZ8oCpnAz73vjswCt2tD4i9dY4V7zv11crbG
	 1i26/imbPDktQ==
Received: from [192.168.1.233] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9FD0A37821F8;
	Fri,  5 Jul 2024 15:55:04 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 05 Jul 2024 11:54:43 -0400
Subject: [PATCH v2] cpufreq: mediatek: Use dev_err_probe in every error
 path in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240705-mtk-cpufreq-dvfs-fail-init-err-v2-1-3a7f91b02ab0@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEIXiGYC/4WNQQ6CMBBFr0K6dkw7Cqgr72FYlHYqE5Fii42Gc
 HcriWvzV+8v3ptFpMAUxamYRaDEkf2QATeFMJ0ergRsMwuUuJcV1nCfbmDGpwv0AJtcBKe5Bx5
 4AgoBpK4qNLpGSyiyZAzk+LUGLk3mjuPkw3vtJfV9f+rDP3VSkHc0ZWlb3Emlzsb3vW590Fvj7
 6JZluUDBmdrctAAAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_085509_441197_38F9C8E3 
X-CRM114-Status: GOOD (  17.72  )
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

Use the dev_err_probe() helper to log the errors on every error path in
the probe function and its sub-functions. This includes
* adding error messages where there was none
* converting over dev_err/dev_warn
* removing the top-level error message after mtk_cpu_dvfs_info_init() is
  called, since every error path inside that function already logs the
  error reason. This gets rid of the misleading error message when probe
  is deferred:

    mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Fixed one occurrence of the error code being set after the usage
- For the paths that need to set the `ret` variable to the error code,
  changed them so they set it from dev_err_probe()'s return, in a single
  line.
- Link to v1: https://lore.kernel.org/r/20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com
---
 drivers/cpufreq/mediatek-cpufreq.c | 72 ++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 518606adf14e..b3d85b7f2517 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -390,28 +390,23 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	int ret;
 
 	cpu_dev = get_cpu_device(cpu);
-	if (!cpu_dev) {
-		dev_err(cpu_dev, "failed to get cpu%d device\n", cpu);
-		return -ENODEV;
-	}
+	if (!cpu_dev)
+		return dev_err_probe(cpu_dev, -ENODEV, "failed to get cpu%d device\n", cpu);
 	info->cpu_dev = cpu_dev;
 
 	info->ccifreq_bound = false;
 	if (info->soc_data->ccifreq_supported) {
 		info->cci_dev = of_get_cci(info->cpu_dev);
-		if (IS_ERR(info->cci_dev)) {
-			ret = PTR_ERR(info->cci_dev);
-			dev_err(cpu_dev, "cpu%d: failed to get cci device\n", cpu);
-			return -ENODEV;
-		}
+		if (IS_ERR(info->cci_dev))
+			return dev_err_probe(cpu_dev, PTR_ERR(info->cci_dev),
+					     "cpu%d: failed to get cci device\n",
+					     cpu);
 	}
 
 	info->cpu_clk = clk_get(cpu_dev, "cpu");
-	if (IS_ERR(info->cpu_clk)) {
-		ret = PTR_ERR(info->cpu_clk);
-		return dev_err_probe(cpu_dev, ret,
+	if (IS_ERR(info->cpu_clk))
+		return dev_err_probe(cpu_dev, PTR_ERR(info->cpu_clk),
 				     "cpu%d: failed to get cpu clk\n", cpu);
-	}
 
 	info->inter_clk = clk_get(cpu_dev, "intermediate");
 	if (IS_ERR(info->inter_clk)) {
@@ -431,7 +426,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 
 	ret = regulator_enable(info->proc_reg);
 	if (ret) {
-		dev_warn(cpu_dev, "cpu%d: failed to enable vproc\n", cpu);
+		dev_err_probe(cpu_dev, ret, "cpu%d: failed to enable vproc\n", cpu);
 		goto out_free_proc_reg;
 	}
 
@@ -439,14 +434,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	info->sram_reg = regulator_get_optional(cpu_dev, "sram");
 	if (IS_ERR(info->sram_reg)) {
 		ret = PTR_ERR(info->sram_reg);
-		if (ret == -EPROBE_DEFER)
+		if (ret == -EPROBE_DEFER) {
+			dev_err_probe(cpu_dev, ret,
+				      "cpu%d: Failed to get sram regulator\n", cpu);
 			goto out_disable_proc_reg;
+		}
 
 		info->sram_reg = NULL;
 	} else {
 		ret = regulator_enable(info->sram_reg);
 		if (ret) {
-			dev_warn(cpu_dev, "cpu%d: failed to enable vsram\n", cpu);
+			dev_err_probe(cpu_dev, ret, "cpu%d: failed to enable vsram\n", cpu);
 			goto out_free_sram_reg;
 		}
 	}
@@ -454,31 +452,34 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	/* Get OPP-sharing information from "operating-points-v2" bindings */
 	ret = dev_pm_opp_of_get_sharing_cpus(cpu_dev, &info->cpus);
 	if (ret) {
-		dev_err(cpu_dev,
+		dev_err_probe(cpu_dev, ret,
 			"cpu%d: failed to get OPP-sharing information\n", cpu);
 		goto out_disable_sram_reg;
 	}
 
 	ret = dev_pm_opp_of_cpumask_add_table(&info->cpus);
 	if (ret) {
-		dev_warn(cpu_dev, "cpu%d: no OPP table\n", cpu);
+		dev_err_probe(cpu_dev, ret, "cpu%d: no OPP table\n", cpu);
 		goto out_disable_sram_reg;
 	}
 
 	ret = clk_prepare_enable(info->cpu_clk);
-	if (ret)
+	if (ret) {
+		dev_err_probe(cpu_dev, ret, "cpu%d: failed to enable cpu clk\n", cpu);
 		goto out_free_opp_table;
+	}
 
 	ret = clk_prepare_enable(info->inter_clk);
-	if (ret)
+	if (ret) {
+		dev_err_probe(cpu_dev, ret, "cpu%d: failed to enable inter clk\n", cpu);
 		goto out_disable_mux_clock;
+	}
 
 	if (info->soc_data->ccifreq_supported) {
 		info->vproc_on_boot = regulator_get_voltage(info->proc_reg);
 		if (info->vproc_on_boot < 0) {
-			ret = info->vproc_on_boot;
-			dev_err(info->cpu_dev,
-				"invalid Vproc value: %d\n", info->vproc_on_boot);
+			ret = dev_err_probe(info->cpu_dev, info->vproc_on_boot,
+					    "invalid Vproc value\n");
 			goto out_disable_inter_clock;
 		}
 	}
@@ -487,8 +488,8 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	rate = clk_get_rate(info->inter_clk);
 	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
 	if (IS_ERR(opp)) {
-		dev_err(cpu_dev, "cpu%d: failed to get intermediate opp\n", cpu);
-		ret = PTR_ERR(opp);
+		ret = dev_err_probe(cpu_dev, PTR_ERR(opp),
+				    "cpu%d: failed to get intermediate opp\n", cpu);
 		goto out_disable_inter_clock;
 	}
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
@@ -501,7 +502,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
 	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
 	if (ret) {
-		dev_err(cpu_dev, "cpu%d: failed to register opp notifier\n", cpu);
+		dev_err_probe(cpu_dev, ret, "cpu%d: failed to register opp notifier\n", cpu);
 		goto out_disable_inter_clock;
 	}
 
@@ -629,11 +630,9 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
 	int cpu, ret;
 
 	data = dev_get_platdata(&pdev->dev);
-	if (!data) {
-		dev_err(&pdev->dev,
-			"failed to get mtk cpufreq platform data\n");
-		return -ENODEV;
-	}
+	if (!data)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "failed to get mtk cpufreq platform data\n");
 
 	for_each_possible_cpu(cpu) {
 		info = mtk_cpu_dvfs_info_lookup(cpu);
@@ -642,25 +641,22 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
 
 		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 		if (!info) {
-			ret = -ENOMEM;
+			ret = dev_err_probe(&pdev->dev, -ENOMEM,
+					    "Failed to allocate dvfs_info\n");
 			goto release_dvfs_info_list;
 		}
 
 		info->soc_data = data;
 		ret = mtk_cpu_dvfs_info_init(info, cpu);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"failed to initialize dvfs info for cpu%d\n",
-				cpu);
+		if (ret)
 			goto release_dvfs_info_list;
-		}
 
 		list_add(&info->list_head, &dvfs_info_list);
 	}
 
 	ret = cpufreq_register_driver(&mtk_cpufreq_driver);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register mtk cpufreq driver\n");
+		dev_err_probe(&pdev->dev, ret, "failed to register mtk cpufreq driver\n");
 		goto release_dvfs_info_list;
 	}
 

---
base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
change-id: 20240627-mtk-cpufreq-dvfs-fail-init-err-0a662ca72de2

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


