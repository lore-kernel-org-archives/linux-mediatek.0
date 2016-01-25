From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH 2/2] regulator: mt6397: Add OF match table
Date: Mon, 25 Jan 2016 11:37:16 -0300
Message-ID: <1453732637-20415-3-git-send-email-javier@osg.samsung.com>
References: <1453732637-20415-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1453732637-20415-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

The Documentation/devicetree/bindings/regulator/mt6397-regulator.txt doc
mentions that a compatible "mediatek,mt6397-regulator" is required for
the MT6397 device node but the driver doesn't provide a OF match table so
the platform bus .match fallbacks to match using the driver name instead.

This also means that module auto-loading is broken for this driver since
the MFD driver that register the device, has a .of_compatible set so the
platform .uevent callback reports a OF modalias that's not in the module.

Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

---

 drivers/regulator/mt6397-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index 585f0399a36b..17a5b6c2d6a9 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -323,9 +323,16 @@ static const struct platform_device_id mt6397_platform_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6397_platform_ids);
 
+static const struct of_device_id mt6397_of_match[] = {
+	{ .compatible = "mediatek,mt6397-regulator", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6397_of_match);
+
 static struct platform_driver mt6397_regulator_driver = {
 	.driver = {
 		.name = "mt6397-regulator",
+		.of_match_table = of_match_ptr(mt6397_of_match),
 	},
 	.probe = mt6397_regulator_probe,
 	.id_table = mt6397_platform_ids,
-- 
2.5.0
