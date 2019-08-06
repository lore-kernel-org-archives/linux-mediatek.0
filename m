From: Fabien Parent <fparent@baylibre.com>
Subject: [PATCH] cpufreq: mediatek-cpufreq: Add compatible for MT8516
Date: Tue,  6 Aug 2019 11:50:29 +0200
Message-ID: <20190806095029.4758-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rjw@rjwysocki.net, viresh.kumar@linaro.org, matthias.bgg@gmail.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
List-Id: linux-mediatek@lists.infradead.org

Add the compatible for MT8516 in order to take advantage of the
MediaTek CPUFreq driver for Mediatek's MT8516 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index f14f3a85f2f7..10bc06f5dd45 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -535,6 +535,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt817x", },
 	{ .compatible = "mediatek,mt8173", },
 	{ .compatible = "mediatek,mt8176", },
+	{ .compatible = "mediatek,mt8516", },
 
 	{ }
 };
-- 
2.23.0.rc1
