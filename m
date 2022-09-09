Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5EFECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ex8tDGo/LAaoWcPmTVZ1I6qos48tVSO9colG8zIGD2s=; b=SVem0eK44MpciVIh9tyT6oyzlG
	GhoCy7FffK03p8QBNHXrFzJ3lv5QRzMskaTVkCXPZe02hfzNae5FPaWktm1BAGi/8vRWKHcxZdwnc
	W+eU0LkNmoYiMaUmohCLlPHhKJQbil/AaQ7HKrcim/KGz/f9xmda82rDrIXGwKFAoSLLIKN7x7CWC
	ccY1bo9Tv5LAM5g9zgMB+spXcFix+yNa6Phh8sUi09C4SZUOgjxrMRWLlLONwD6aDkgOPq9rKGlf0
	3hs22GCyGXVa56MCk+6eJVTjMuzIbGXVxzujui4OxrfDOrDMwrhMaq0XSX7MuRVAVk+tywF9/VaBB
	WV9++W0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWaSJ-00F5n9-4G; Fri, 09 Sep 2022 09:37:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWaS7-00F5jb-Kv; Fri, 09 Sep 2022 09:37:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BC1136601657;
	Fri,  9 Sep 2022 10:37:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662716251;
	bh=VUIE2ULcIZ7NEXZB53jupjRin58XQGFQ/42Sux2176I=;
	h=From:To:Cc:Subject:Date:From;
	b=LVuPgSXSB1Q94QcHPkBlwznaWhMhNik57Es0RYRkm5EF2fIW0UG9UhUNf7y3bUWjW
	 19XtHTJyuv5DtMYpHHiWSRFyfu7J/G9DsM1qeU5JZFQhE3tbAhAU4pu4BrIFSIKbH3
	 PAyVB+Nc+p3wXz2Cj6vE6kX++OfbehaS1Esm1mkRF7eODzukX4tRp715gC4C4jrKFz
	 MhN61qfYysiInZ/++gvBhIGMQdYLYKH9JmrQ01J9ntUUPg9QmaPoTby0loyAu+RyWI
	 14GfqhZd6+MsbuxFNp4RzrCGM3Ljy+P+NQZyeGU9Vb0YN/lm/Y6kMSwz44vmPWZ0hL
	 rYYAEmfBAxjHw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: viresh.kumar@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	andrew-sh.cheng@mediatek.com,
	jia-wei.chang@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] cpufreq: mediatek: Fix KP and lockups on proc/sram regulators error
Date: Fri,  9 Sep 2022 11:37:24 +0200
Message-Id: <20220909093724.40078-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_023735_922070_0407B511 
X-CRM114-Status: GOOD (  13.36  )
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

Function regulator_get_optional() returns a negative error number on
any kind of regulator_get() failure: failing to check for that in the
teardown path will lead to a kernel panic due to a call to function
regulator_disable().

Besides that, the "proc" regulator does actually provide power to the
CPU cluster(s): disabling it will produce a lockup on at least some
SoCs, such as MT8173.

That consideration is also valid for the "sram" regulator, providing
power to the CPU caches instead, present on some other SoCs, such as
MT8183, MT8186 (and others).

Resolve both situations and by simply removing the entire faulty
branches responsible for disabling the aforementioned regulators if
enabled, keeping in mind that these are enabled (and left enabled)
by the bootloader before booting the kernel.

Fixes: 4b9ceb757bbb ("cpufreq: mediatek: Enable clocks and regulators")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 7f2680bc9a0f..d68f16f475a6 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -534,11 +534,6 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 
 out_free_resources:
-	if (regulator_is_enabled(info->proc_reg))
-		regulator_disable(info->proc_reg);
-	if (info->sram_reg && regulator_is_enabled(info->sram_reg))
-		regulator_disable(info->sram_reg);
-
 	if (!IS_ERR(info->proc_reg))
 		regulator_put(info->proc_reg);
 	if (!IS_ERR(info->sram_reg))
@@ -553,14 +548,10 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 
 static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 {
-	if (!IS_ERR(info->proc_reg)) {
-		regulator_disable(info->proc_reg);
+	if (!IS_ERR(info->proc_reg))
 		regulator_put(info->proc_reg);
-	}
-	if (!IS_ERR(info->sram_reg)) {
-		regulator_disable(info->sram_reg);
+	if (!IS_ERR(info->sram_reg))
 		regulator_put(info->sram_reg);
-	}
 	if (!IS_ERR(info->cpu_clk)) {
 		clk_disable_unprepare(info->cpu_clk);
 		clk_put(info->cpu_clk);
-- 
2.37.2


