From: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Subject: [PATCH 1/4] cpufreq: mt8173: add CPUFREQ_HAVE_GOVERNOR_PER_POLICY flag
Date: Sun, 29 Nov 2015 16:31:35 +0800
Message-ID: <1448785898-17838-1-git-send-email-pi-cheng.chen@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, linux-mediatek@lists.infradead.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Add CPUFREQ_HAVE_GOVERNOR_PER_POLICY to have individual set of tunables
for each cluster of MT8173.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
---
 drivers/cpufreq/mt8173-cpufreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mt8173-cpufreq.c b/drivers/cpufreq/mt8173-cpufreq.c
index 83001dc..c438109 100644
--- a/drivers/cpufreq/mt8173-cpufreq.c
+++ b/drivers/cpufreq/mt8173-cpufreq.c
@@ -469,7 +469,8 @@ static int mtk_cpufreq_exit(struct cpufreq_policy *policy)
 }
 
 static struct cpufreq_driver mt8173_cpufreq_driver = {
-	.flags = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK,
+	.flags = CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
+		 CPUFREQ_HAVE_GOVERNOR_PER_POLICY,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = mtk_cpufreq_set_target,
 	.get = cpufreq_generic_get,
-- 
1.9.1

