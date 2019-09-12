From: Jiaxin Yu <jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] ASoC: mt8183: fix audio playback slowly after playback
 during bootup
Date: Thu, 12 Sep 2019 17:54:56 +0800
Message-ID: <1568282096-13821-3-git-send-email-jiaxin.yu@mediatek.com>
References: <1568282096-13821-1-git-send-email-jiaxin.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1568282096-13821-1-git-send-email-jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tzungbi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eason.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Before regmap_reinit_cache we must reset audio reg as default value.
So we use reset controller unit(toprgu) to reset audio hw.

Signed-off-by: Jiaxin Yu <jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 sound/soc/mediatek/common/mtk-base-afe.h   |  1 +
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 21 +++++++++++++++++++++
 sound/soc/mediatek/mt8183/mt8183-reg.h     |  6 ++++++
 3 files changed, 28 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index 60cb609a9790..bccc079ee660 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -60,6 +60,7 @@ struct mtk_base_afe {
 	void __iomem *base_addr;
 	struct device *dev;
 	struct regmap *regmap;
+	struct regmap *toprgu_regmap;
 	struct mutex irq_alloc_lock; /* dynamic alloc irq lock */
 
 	unsigned int const *reg_back_up_list;
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 4a31106d3471..0e5634b3a8e3 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1089,6 +1089,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct mtk_base_afe *afe;
 	struct mt8183_afe_private *afe_priv;
 	struct device *dev;
+	unsigned int reg_value;
 	int i, irq_id, ret;
 
 	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
@@ -1126,6 +1127,26 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* toprgu_regmap init */
+	afe->toprgu_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+							     "mediatek,toprgu");
+	if (IS_ERR(afe->toprgu_regmap)) {
+		dev_err(dev, "could not get toprgu_regmap from dev\n");
+		return PTR_ERR(afe->toprgu_regmap);
+	}
+
+	/* read TOPRGUWDT_SWSYSRST, the high 8bits must be zero */
+	regmap_read(afe->toprgu_regmap, TOPRGUWDT_SWSYSRST, &reg_value);
+
+	/* write TOPRGUWDT_SWSYSRST, we need set high 8bits as 0x88 first */
+	reg_value |= 0x88000000;
+
+	/* reset audio domain registers */
+	reg_value |= 1 << AUDIO_RST_SFT;
+	regmap_write(afe->toprgu_regmap, TOPRGUWDT_SWSYSRST, reg_value);
+	reg_value &= ~(1 << AUDIO_RST_SFT);
+	regmap_write(afe->toprgu_regmap, TOPRGUWDT_SWSYSRST, reg_value);
+
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
 	pm_runtime_get_sync(&pdev->dev);
diff --git a/sound/soc/mediatek/mt8183/mt8183-reg.h b/sound/soc/mediatek/mt8183/mt8183-reg.h
index e544a09e1913..8579ac4052ff 100644
--- a/sound/soc/mediatek/mt8183/mt8183-reg.h
+++ b/sound/soc/mediatek/mt8183/mt8183-reg.h
@@ -413,6 +413,12 @@
 #define AFE_MAX_REGISTER AFE_GENERAL2_ASRC_2CH_CON13
 #define AFE_IRQ_STATUS_BITS 0x1fff
 
+/* TOPRGUWDT_SWSYSRST */
+#define TOPRGUWDT_SWSYSRST 0x18
+#define AUDIO_RST_SFT                                17
+#define AUDIO_RST_MASK                               0x1
+#define AUDIO_RST_MASK_SFT                           (0x1 << 17)
+
 /* AUDIO_TOP_CON3 */
 #define BCK_INVERSE_SFT                              3
 #define BCK_INVERSE_MASK                             0x1
-- 
2.18.0
