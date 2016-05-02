From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 2/2] nvmem: mxs-ocotp: remove nvmem regmap dependency
Date: Mon,  2 May 2016 19:36:14 +0100
Message-ID: <1462214174-469-3-git-send-email-srinivas.kandagatla@linaro.org>
References: <1462214174-469-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1462214174-469-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: stefan.wahren-eS4NqCHxEME@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Regmap raw accessors are bus specific implementations, using regmap raw
apis in nvmem breaks nvmem providers based on regmap mmio.
This patch moves to nvmem support in the driver to use callback
instead of regmap, which is what the nvmem core supports now.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/nvmem/mxs-ocotp.c | 83 +++++++++++++----------------------------------
 1 file changed, 22 insertions(+), 61 deletions(-)

diff --git a/drivers/nvmem/mxs-ocotp.c b/drivers/nvmem/mxs-ocotp.c
index 2bb3c57..d26dd03 100644
--- a/drivers/nvmem/mxs-ocotp.c
+++ b/drivers/nvmem/mxs-ocotp.c
@@ -25,7 +25,6 @@
 #include <linux/nvmem-provider.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/stmp_device.h>
 
@@ -66,11 +65,10 @@ static int mxs_ocotp_wait(struct mxs_ocotp *otp)
 	return 0;
 }
 
-static int mxs_ocotp_read(void *context, const void *reg, size_t reg_size,
-			  void *val, size_t val_size)
+static int mxs_ocotp_read(void *context, unsigned int offset,
+			  void *val, size_t bytes)
 {
 	struct mxs_ocotp *otp = context;
-	unsigned int offset = *(u32 *)reg;
 	u32 *buf = val;
 	int ret;
 
@@ -94,17 +92,16 @@ static int mxs_ocotp_read(void *context, const void *reg, size_t reg_size,
 	if (ret)
 		goto close_banks;
 
-	while (val_size >= reg_size) {
+	while (bytes) {
 		if ((offset < OCOTP_DATA_OFFSET) || (offset % 16)) {
 			/* fill up non-data register */
-			*buf = 0;
+			*buf++ = 0;
 		} else {
-			*buf = readl(otp->base + offset);
+			*buf++ = readl(otp->base + offset);
 		}
 
-		buf++;
-		val_size -= reg_size;
-		offset += reg_size;
+		bytes -= 4;
+		offset += 4;
 	}
 
 close_banks:
@@ -117,57 +114,29 @@ disable_clk:
 	return ret;
 }
 
-static int mxs_ocotp_write(void *context, const void *data, size_t count)
-{
-	/* We don't want to support writing */
-	return 0;
-}
-
-static bool mxs_ocotp_writeable_reg(struct device *dev, unsigned int reg)
-{
-	return false;
-}
-
 static struct nvmem_config ocotp_config = {
 	.name = "mxs-ocotp",
+	.stride = 16,
+	.word_size = 4,
 	.owner = THIS_MODULE,
+	.reg_read = mxs_ocotp_read,
 };
 
-static const struct regmap_range imx23_ranges[] = {
-	regmap_reg_range(OCOTP_DATA_OFFSET, 0x210),
-};
-
-static const struct regmap_access_table imx23_access = {
-	.yes_ranges = imx23_ranges,
-	.n_yes_ranges = ARRAY_SIZE(imx23_ranges),
-};
-
-static const struct regmap_range imx28_ranges[] = {
-	regmap_reg_range(OCOTP_DATA_OFFSET, 0x290),
-};
-
-static const struct regmap_access_table imx28_access = {
-	.yes_ranges = imx28_ranges,
-	.n_yes_ranges = ARRAY_SIZE(imx28_ranges),
+struct mxs_data {
+	int size;
 };
 
-static struct regmap_bus mxs_ocotp_bus = {
-	.read = mxs_ocotp_read,
-	.write = mxs_ocotp_write, /* make regmap_init() happy */
-	.reg_format_endian_default = REGMAP_ENDIAN_NATIVE,
-	.val_format_endian_default = REGMAP_ENDIAN_NATIVE,
+static const struct mxs_data imx23_data = {
+	.size = 0x220,
 };
 
-static struct regmap_config mxs_ocotp_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 16,
-	.writeable_reg = mxs_ocotp_writeable_reg,
+static const struct mxs_data imx28_data = {
+	.size = 0x2a0,
 };
 
 static const struct of_device_id mxs_ocotp_match[] = {
-	{ .compatible = "fsl,imx23-ocotp", .data = &imx23_access },
-	{ .compatible = "fsl,imx28-ocotp", .data = &imx28_access },
+	{ .compatible = "fsl,imx23-ocotp", .data = &imx23_data },
+	{ .compatible = "fsl,imx28-ocotp", .data = &imx28_data },
 	{ /* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, mxs_ocotp_match);
@@ -175,11 +144,10 @@ MODULE_DEVICE_TABLE(of, mxs_ocotp_match);
 static int mxs_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct mxs_data *data;
 	struct mxs_ocotp *otp;
 	struct resource *res;
 	const struct of_device_id *match;
-	struct regmap *regmap;
-	const struct regmap_access_table *access;
 	int ret;
 
 	match = of_match_device(dev->driver->of_match_table, dev);
@@ -205,17 +173,10 @@ static int mxs_ocotp_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	access = match->data;
-	mxs_ocotp_config.rd_table = access;
-	mxs_ocotp_config.max_register = access->yes_ranges[0].range_max;
-
-	regmap = devm_regmap_init(dev, &mxs_ocotp_bus, otp, &mxs_ocotp_config);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		ret = PTR_ERR(regmap);
-		goto err_clk;
-	}
+	data = match->data;
 
+	ocotp_config.size = data->size;
+	ocotp_config.priv = otp;
 	ocotp_config.dev = dev;
 	otp->nvmem = nvmem_register(&ocotp_config);
 	if (IS_ERR(otp->nvmem)) {
-- 
2.5.0
