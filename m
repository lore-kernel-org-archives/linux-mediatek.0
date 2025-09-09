Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA60CA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmhZNAhe4xyeSui0ELu2FIl9uxjm0SRk0tsFYpforsk=; b=tikO5bTHJyQ4jWBp2SHCZFYuqE
	chx03gQxnfDj+DzPjIAiliwKTuMEvTrXiZP/DBdRcciSJ2eZ+ioCGBdIAsG9mEfYnA2Aww9DM5tYC
	CwBfcbMF9bjvdbX7RXZ+EXlj9vz/Adfhp5Ee/v2Jq7rc0hk2NCLxFdAtsfE/QGPlMmSrNwOcXFq+h
	4zxL6w5cmy+aiBVcGsqRzdHdN7bWRuW2cbG9cHoAUJdwZE1gsWaIXxJUwwLasNpUByldZSxnaoyfP
	THgwmN+n6VyFyNAVYoAaIwFQiyJD6Tawxt4UflaEp2OOHyp7ERAXLXTshhIp9YK08LWO5FnFu6RFT
	zQOVOEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvupd-000000063AR-0VsH;
	Tue, 09 Sep 2025 09:40:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsxF-00000005G4h-0OEw
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 07:39:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B71D6013A;
	Tue,  9 Sep 2025 07:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2934BC4CEF4;
	Tue,  9 Sep 2025 07:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757403592;
	bh=Ga5Cr0dJ0wmB7/q61wksi9ORqCdh01tkjlQ464HQdvQ=;
	h=From:To:Cc:Subject:Date:From;
	b=AMwbF2j9Mv2qr3wKfOwaADzJdd6ZO/t+yoApsbrDeLGuercUd/Y0aUIdeB+9Mf3nH
	 jZnLsBYD7i95pQB8xbcGfk7xVCGmYDPW81WMjFLQOUNcQiukTdojSbJr34kWl6dKkW
	 xnaz9ZpKtDG56GEdjOCLESx5aW4iEja3Mc5iF8Tww8+9ZF219i1rXEFamyrS01CI/n
	 gfyF8a2ld+Wv1D0pcbkOKl+Tc9pz6R6rLL+BQaR/lhlWpxifo6164NXr8r+E3fjK8S
	 xzma5Xwfs9kO7gUjzHWd1Jj1pMG0cDRO9q2okMg3ocEhJx5rwGZK6hm8N8C8SxV2L3
	 b9dfm7uRmifMw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uvsxA-000000006bN-46IF;
	Tue, 09 Sep 2025 09:39:49 +0200
From: Johan Hovold <johan@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: [PATCH] cpufreq: mediatek: fix device leak on probe failure
Date: Tue,  9 Sep 2025 09:38:19 +0200
Message-ID: <20250909073819.25295-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make sure to drop the reference to the cci device taken by
of_find_device_by_node() on probe failure (e.g. probe deferral).

Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
Cc: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index f3f02c4b6888..21537a05785d 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -404,9 +404,11 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	}
 
 	info->cpu_clk = clk_get(cpu_dev, "cpu");
-	if (IS_ERR(info->cpu_clk))
-		return dev_err_probe(cpu_dev, PTR_ERR(info->cpu_clk),
-				     "cpu%d: failed to get cpu clk\n", cpu);
+	if (IS_ERR(info->cpu_clk)) {
+		ret = PTR_ERR(info->cpu_clk);
+		dev_err_probe(cpu_dev, ret, "cpu%d: failed to get cpu clk\n", cpu);
+		goto out_put_cci_dev;
+	}
 
 	info->inter_clk = clk_get(cpu_dev, "intermediate");
 	if (IS_ERR(info->inter_clk)) {
@@ -552,6 +554,10 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 out_free_mux_clock:
 	clk_put(info->cpu_clk);
 
+out_put_cci_dev:
+	if (info->soc_data->ccifreq_supported)
+		put_device(info->cci_dev);
+
 	return ret;
 }
 
@@ -569,6 +575,8 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 	clk_put(info->inter_clk);
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 	dev_pm_opp_unregister_notifier(info->cpu_dev, &info->opp_nb);
+	if (info->soc_data->ccifreq_supported)
+		put_device(info->cci_dev);
 }
 
 static int mtk_cpufreq_init(struct cpufreq_policy *policy)
-- 
2.49.1


