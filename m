From: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>
Subject: [PATCH 2/3] soc: mediatek: Allow gaps in SCP PDs
Date: Mon, 3 Sep 2018 23:08:16 +0300
Message-ID: <20180903200816.GA6752@xn--njmtys-xxab.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

The power domains array for MT6797 contains gaps, since most MFG-related
power domains are missing. This causes a lookup for a regulator with
a NULL name fail, and this will cause the probe of SCPSYS to fail. This
patch skips gaps in the array by detecting if the power domain name is
NULL. This could all be easily solved by reordering the #defines in
dt-bindings, but that could break existing DTBs.

Signed-off-by: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 4808d71c5..c60a17e56 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -402,6 +402,9 @@ static struct scp *init_scp(struct platform_device *pdev,
 		struct scp_domain *scpd = &scp->domains[i];
 		const struct scp_domain_data *data = &scp_domain_data[i];
 
+		if (!data->name)
+			continue;
+
 		scpd->supply = devm_regulator_get_optional(&pdev->dev, data->name);
 		if (IS_ERR(scpd->supply)) {
 			if (PTR_ERR(scpd->supply) == -ENODEV)
@@ -420,6 +423,9 @@ static struct scp *init_scp(struct platform_device *pdev,
 		struct generic_pm_domain *genpd = &scpd->genpd;
 		const struct scp_domain_data *data = &scp_domain_data[i];
 
+		if (!data->name)
+			continue;
+
 		pd_data->domains[i] = genpd;
 		scpd->scp = scp;
 
@@ -457,6 +463,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		struct scp_domain *scpd = &scp->domains[i];
 		struct generic_pm_domain *genpd = &scpd->genpd;
 
+		if (!genpd->name)
+			continue;
+
 		/*
 		 * Initially turn on all domains to make the domains usable
 		 * with !CONFIG_PM and to get the hardware in sync with the
-- 
2.18.0
