From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH RFC 2/2] devfreq: mt8183-cci: using cpufreq-map governor in cci dvfs driver
Date: Tue, 18 Jun 2019 12:14:36 +0800
Message-ID: <20190618041433.245629-3-hsinyi@chromium.org>
References: <20190618041433.245629-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618041433.245629-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Saravana Kannan <skannan@codeaurora.org>, "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Hsin-Yi Wang <hsinyi@chromium.org>

This is based on mediatek's devfreq patches[1].

In MT8183 SoC, CCI and little core cluster share same regulator. In original
implementation, CCI frequency depends on regulator voltage, which results in
bad memory access performance if tasks are loaded on other cpus other than
little cluster (cpus 0-3).

Using cpufreq-map mt8183-cci's devfreq governor can improve this situation,
since in most cases, higher cpufreq implies higher loadings on the CCI, and CCI
should consider all cpu loadings instead of only the little cluster.

[1] https://patchwork.kernel.org/patch/10946063/

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/devfreq/mt8183-cci-devfreq.c | 194 +--------------------------
 1 file changed, 4 insertions(+), 190 deletions(-)

diff --git a/drivers/devfreq/mt8183-cci-devfreq.c b/drivers/devfreq/mt8183-cci-devfreq.c
index 250c963789f3..a153adee033e 100644
--- a/drivers/devfreq/mt8183-cci-devfreq.c
+++ b/drivers/devfreq/mt8183-cci-devfreq.c
@@ -17,164 +17,7 @@
 struct cci_devfreq {
 	struct devfreq *devfreq;
 	struct regulator *proc_reg;
-	unsigned long proc_reg_uV;
 	struct clk *cci_clk;
-	unsigned long freq;
-	struct notifier_block nb;
-	struct notifier_block opp_nb;
-	int cci_min_freq;
-};
-
-static int cci_devfreq_regulator_notifier(struct notifier_block *nb,
-					  unsigned long val, void *data)
-{
-	int ret;
-	struct cci_devfreq *cci_df =
-		container_of(nb, struct cci_devfreq, nb);
-
-	/* deal with reduce frequency */
-	if (val & REGULATOR_EVENT_PRE_VOLTAGE_CHANGE) {
-		struct pre_voltage_change_data *pvc_data = data;
-
-		if (pvc_data->min_uV < pvc_data->old_uV) {
-			cci_df->proc_reg_uV =
-				(unsigned long)(pvc_data->min_uV);
-			mutex_lock(&cci_df->devfreq->lock);
-			ret = update_devfreq(cci_df->devfreq);
-			if (ret)
-				pr_err("Fail to reduce cci frequency: %d\n",
-				       ret);
-			mutex_unlock(&cci_df->devfreq->lock);
-		}
-	} else if ((val & REGULATOR_EVENT_ABORT_VOLTAGE_CHANGE) &&
-	    ((unsigned long)data > cci_df->proc_reg_uV)) {
-		cci_df->proc_reg_uV = (unsigned long)data;
-		mutex_lock(&cci_df->devfreq->lock);
-		ret = update_devfreq(cci_df->devfreq);
-		if (ret)
-			pr_err("Fail to raise cci frequency back: %d\n", ret);
-		mutex_unlock(&cci_df->devfreq->lock);
-	} else if ((val & REGULATOR_EVENT_VOLTAGE_CHANGE) &&
-	    (cci_df->proc_reg_uV < (unsigned long)data)) {
-		/* deal with increase frequency */
-		cci_df->proc_reg_uV = (unsigned long)data;
-		mutex_lock(&cci_df->devfreq->lock);
-		ret = update_devfreq(cci_df->devfreq);
-		if (ret)
-			pr_err("Fail to raise cci frequency: %d\n", ret);
-		mutex_unlock(&cci_df->devfreq->lock);
-	}
-
-	return 0;
-}
-
-static int ccidevfreq_opp_notifier(struct notifier_block *nb,
-unsigned long event, void *data)
-{
-	int ret;
-	struct dev_pm_opp *opp = data;
-	struct cci_devfreq *cci_df = container_of(nb, struct cci_devfreq,
-						  opp_nb);
-	unsigned long	freq, volt, cur_volt;
-
-	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
-		freq = dev_pm_opp_get_freq(opp);
-		/* current opp item is changed */
-		if (freq == cci_df->freq) {
-			volt = dev_pm_opp_get_voltage(opp);
-			cur_volt = regulator_get_voltage(cci_df->proc_reg);
-
-			if (volt > cur_volt) {
-				/* need reduce freq */
-				mutex_lock(&cci_df->devfreq->lock);
-				ret = update_devfreq(cci_df->devfreq);
-				if (ret)
-					pr_err("Fail to reduce cci frequency by opp notification: %d\n",
-					       ret);
-				mutex_unlock(&cci_df->devfreq->lock);
-			}
-		}
-
-		if (freq == cci_df->cci_min_freq) {
-			volt = dev_pm_opp_get_voltage(opp);
-			regulator_set_voltage(cci_df->proc_reg, volt, INT_MAX);
-		}
-	} else if (event == OPP_EVENT_DISABLE) {
-	}
-
-	return 0;
-}
-
-
-static int mtk_cci_governor_get_target(struct devfreq *devfreq,
-				       unsigned long *freq)
-{
-	struct cci_devfreq *cci_df;
-	struct dev_pm_opp *opp;
-	int ret;
-
-	cci_df = dev_get_drvdata(devfreq->dev.parent);
-
-	/* find available frequency */
-	opp = dev_pm_opp_find_freq_ceil_by_volt(devfreq->dev.parent,
-						cci_df->proc_reg_uV);
-	ret = PTR_ERR_OR_ZERO(opp);
-	if (ret) {
-		pr_err("%s[%d], cannot find opp with voltage=%d: %d\n",
-		       __func__, __LINE__, cci_df->proc_reg_uV, ret);
-		return ret;
-	}
-	*freq = dev_pm_opp_get_freq(opp);
-
-	return 0;
-}
-
-static int mtk_cci_governor_event_handler(struct devfreq *devfreq,
-					  unsigned int event, void *data)
-{
-	int ret;
-	struct cci_devfreq *cci_df;
-	struct notifier_block *nb;
-	struct notifier_block *opp_nb;
-
-	cci_df = dev_get_drvdata(devfreq->dev.parent);
-	nb = &cci_df->nb;
-	opp_nb = &cci_df->opp_nb;
-
-	switch (event) {
-	case DEVFREQ_GOV_START:
-	case DEVFREQ_GOV_RESUME:
-		nb->notifier_call = cci_devfreq_regulator_notifier;
-		ret = regulator_register_notifier(cci_df->proc_reg,
-						  nb);
-		if (ret)
-			pr_err("%s: failed to add governor: %d\n", __func__,
-			       ret);
-		opp_nb->notifier_call = ccidevfreq_opp_notifier;
-		dev_pm_opp_register_notifier(devfreq->dev.parent, opp_nb);
-		break;
-
-	case DEVFREQ_GOV_STOP:
-	case DEVFREQ_GOV_SUSPEND:
-		ret = regulator_unregister_notifier(cci_df->proc_reg,
-						    nb);
-		if (ret)
-			pr_err("%s: failed to add governor: %d\n", __func__,
-			       ret);
-		break;
-
-	default:
-		break;
-	}
-
-	return 0;
-}
-
-static struct devfreq_governor mtk_cci_devfreq_governor = {
-	.name = "mtk_cci_vmon",
-	.get_target_freq = mtk_cci_governor_get_target,
-	.event_handler = mtk_cci_governor_event_handler,
-	.immutable = true
 };
 
 static int mtk_cci_devfreq_target(struct device *dev, unsigned long *freq,
@@ -193,8 +36,6 @@ static int mtk_cci_devfreq_target(struct device *dev, unsigned long *freq,
 		return ret;
 	}
 
-	cci_df->freq = *freq;
-
 	return 0;
 }
 
@@ -206,8 +47,6 @@ static int mtk_cci_devfreq_probe(struct platform_device *pdev)
 {
 	struct device *cci_dev = &pdev->dev;
 	struct cci_devfreq *cci_df;
-	unsigned long freq, volt;
-	struct dev_pm_opp *opp;
 	int ret;
 
 	cci_df = devm_kzalloc(cci_dev, sizeof(*cci_df), GFP_KERNEL);
@@ -237,19 +76,12 @@ static int mtk_cci_devfreq_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* set voltage lower bound */
-	freq = 1;
-	opp = dev_pm_opp_find_freq_ceil(cci_dev, &freq);
-	cci_df->cci_min_freq = dev_pm_opp_get_freq(opp);
-	volt = dev_pm_opp_get_voltage(opp);
-	dev_pm_opp_put(opp);
-
 	platform_set_drvdata(pdev, cci_df);
 
 	cci_df->devfreq = devm_devfreq_add_device(cci_dev,
-						  &cci_devfreq_profile,
-						  "mtk_cci_vmon",
-						  NULL);
+						&cci_devfreq_profile,
+						"cpufreq-map",
+						NULL);
 	if (IS_ERR(cci_df->devfreq)) {
 		ret = PTR_ERR(cci_df->devfreq);
 		dev_err(cci_dev, "cannot create cci devfreq device:%d\n", ret);
@@ -277,30 +109,12 @@ static struct platform_driver cci_devfreq_driver = {
 
 static int __init mtk_cci_devfreq_init(void)
 {
-	int ret;
-
-	ret = devfreq_add_governor(&mtk_cci_devfreq_governor);
-	if (ret) {
-		pr_err("%s: failed to add governor: %d\n", __func__, ret);
-		return ret;
-	}
-
-	ret = platform_driver_register(&cci_devfreq_driver);
-	if (ret)
-		devfreq_remove_governor(&mtk_cci_devfreq_governor);
-
-	return ret;
+	return platform_driver_register(&cci_devfreq_driver);
 }
 module_init(mtk_cci_devfreq_init)
 
 static void __exit mtk_cci_devfreq_exit(void)
 {
-	int ret;
-
-	ret = devfreq_remove_governor(&mtk_cci_devfreq_governor);
-	if (ret)
-		pr_err("%s: failed to remove governor: %d\n", __func__, ret);
-
 	platform_driver_unregister(&cci_devfreq_driver);
 }
 module_exit(mtk_cci_devfreq_exit)
-- 
2.20.1
