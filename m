Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15436C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hofKIKZrcWEIKxsuY6is+jJOL7WfUkIDD9e2ocwx6b8=; b=D+Ow0brtqeWXJ5mqYld7brbhXk
	x5Xf8iDuOGNdtw3h8Wau4S61PxSfA3FGb4JNRegsJTVAI4ny89TkDevs+FtihDVJcB/8Ed17umA18
	hicn/+oAExOKuxLVqV6v3uvngf1nzEoSFs0vYg2dJZa78S0RQBgtjacrRwKHmcFjMlAeaOMTZC9jM
	SN0gC5znM9gbnHmXldxxj+K3MgvhvSrwjJGQqqvdeF8blACMchFEHiv2gN/IPDG9WTv1hWJrvE8ql
	UJkdpEAmtiZhPFJyhYsKA6JStSlyIvJ0aDnnX0N+qQFlydoZGCjwZXuV/f6EUcP+j1Ak0OXDQN3n/
	vxpN4sMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIlz-001fVe-0h;
	Thu, 23 Mar 2023 11:06:23 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIlw-001fV6-1d;
	Thu, 23 Mar 2023 11:06:21 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pfIlm-0002bz-3B;
	Thu, 23 Mar 2023 12:06:11 +0100
Date: Thu, 23 Mar 2023 11:04:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sam Shih <sam.shih@mediatek.com>, John Crispin <john@phrozen.org>
Subject: [PATCH] cpufreq: mediatek: guard error paths to avoid kernel panic
Message-ID: <ZBwyN7NwZ2zqHygr@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_040620_558854_F0D4FC66 
X-CRM114-Status: GOOD (  10.46  )
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

Guard pointer access in error path of mtk_cpu_dvfs_info_init() to
make sure info->proc_reg and info->sram_reg are valid pointers before
accessing them, which would result in kernel panic e.g. in case of
them being set to -EPROBE_DEFER.

Fixes: 4b9ceb757bbb ("cpufreq: mediatek: Enable clocks and regulators")
Reported-by: Sam Shih <sam.shih@mediatek.com>
Suggested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 4466d0c91a6a..980a31ddd0f2 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -579,10 +579,12 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 
 out_free_resources:
-	if (regulator_is_enabled(info->proc_reg))
-		regulator_disable(info->proc_reg);
-	if (info->sram_reg && regulator_is_enabled(info->sram_reg))
-		regulator_disable(info->sram_reg);
+	if (!IS_ERR(info->proc_reg))
+		if (regulator_is_enabled(info->proc_reg))
+			regulator_disable(info->proc_reg);
+	if (!IS_ERR(info->sram_reg))
+		if (info->sram_reg && regulator_is_enabled(info->sram_reg))
+			regulator_disable(info->sram_reg);
 
 	if (!IS_ERR(info->proc_reg))
 		regulator_put(info->proc_reg);
-- 
2.40.0


