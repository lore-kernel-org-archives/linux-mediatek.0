Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BF3EDE998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNFQ0+k6gl1kkh3o3uKf0ZEr04CBiZ9w1gp6dXSYFKk=; b=whQiaFjEvQYwLUCI2jR4uSbmq1
	VGpF64SeZqZj/EKGeiVahvSnNI7kZcfMfbdHehEj2rKstCEaBFJ3D/6BrJZV3ZvaaP5yit0VdaM/U
	atg1s9t3ea96BChTkibp5v4IJhEID1pKPfI+yu5KrYw1KfKOIg59d4y1x6PIG9ji3oopH3VQe3Dot
	miHJkY+0kCAew8k2j6d/cMh//SmLaT8U4d3b1JcRS+Jwspvk/H9fg/8vQ82jIDEnomm3m3qyni9/r
	BXY5kedxDGpfDv1GrmOJSKzcXhK4f7ZFtsmletzBJt8RF4s1nbE/Y2I7gjw30k7IlJs9bUYDt8QVh
	X+ZS4l/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHun-00000008T5j-0Cjk;
	Wed, 11 Sep 2024 07:37:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHmR-00000008QsU-2mmx
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:28:49 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-717914d6c95so4206589b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039727; x=1726644527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNFQ0+k6gl1kkh3o3uKf0ZEr04CBiZ9w1gp6dXSYFKk=;
        b=ONngVfoVhAiiMMnUMKdFmGZ9YLaFygUyXT8wj9CzLto5VKwyNQcLSHNw2TwVdPr6Rk
         SQBOxxmaRAJ8OeJ5dOov4F1W2NATku+I8s5tEPJ3XV3QhuW/Wcs6KTuGBEq8dZFCySuX
         A42wZT+O1xaqBcr0cP+Vw2jKWBo/U4D30kSks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039727; x=1726644527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNFQ0+k6gl1kkh3o3uKf0ZEr04CBiZ9w1gp6dXSYFKk=;
        b=sEUP5lbCSZDIy7ry5hwzuhOisSS3eQANP2CeHk583M/1sH6v2VNqIOeYBqdZIe+wvi
         KeJwIrgADjsoKMVcM3a4U71asl4UIgGPdAFY/ZewMWCVZDbgJH5oknj3YWTqzCUg8/Df
         vZgo/4IQ24z1POWGuwIx6Gx0te+Vy3ygPD1Lb9FlDWXWzkvAaEE9GgSdlA2GN0YCZDkB
         GIVRLMRWoZzMUENDRRs6t4SlUo4lIhzgwzii2qlcmtPp421Iz0LNh7EYPqEu9ZHzAOyV
         m4aET38M+k5qOAVseyyqQT3w17kovIwVfABftSNjbrniZ7MKPd7/oRYnSufj6nXgJdNd
         FPRw==
X-Forwarded-Encrypted: i=1; AJvYcCUkkFHWcad8P9GanY2V0iOPNn/O+9mu5bM/lM1QGUBFp69buZrctnIbbURftQ5iGLbEcgQHxeSElkBSYYvgIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySyhAm1mYNKXlIYOAOdD4CqW5G0yg2cbN4Ea+BFWn/+kRjmVf6
	9ROeB3ouJ/lrstCDd35+YZs/aCSNEFnrx8mjPB28N2ARO4MgfmDuEgDQjsXuWw==
X-Google-Smtp-Source: AGHT+IFFL6/Rj4Gwyc1YxeZ/hABvvBsCQgvzC/UjAY926OKBN27PE9HKTGhU9CwzQureNFH/FVgdIQ==
X-Received: by 2002:a05:6a00:1254:b0:70e:8070:f9d0 with SMTP id d2e1a72fcca58-718d5e16641mr18401634b3a.9.1726039726903;
        Wed, 11 Sep 2024 00:28:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
Date: Wed, 11 Sep 2024 15:27:46 +0800
Message-ID: <20240911072751.365361-9-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_002847_720088_5FA56E82 
X-CRM114-Status: GOOD (  28.53  )
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

Add GPIO support to the simple helpers for the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
Regulator supplies were handled in the previous patch.

The assumption is that the same class of components to be probed are
always connected in the same fashion with the same regulator supply
and GPIO. The names may vary due to binding differences, but the
physical layout does not change.

This supports at most one GPIO pin. The user must specify the GPIO name,
the polarity, and the amount of time to wait after the GPIO is toggled.
Devices with more than one GPIO pin likely require specific power
sequencing beyond what generic code can easily support.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v6:
- Restructured into helpers for the I2C OF component prober
- Reduced to only handle one GPIO
- Set GPIO to input on (failure) cleanup
- Updated commit message

Changes since v5:
- Renamed "con" to "propname" in i2c_of_probe_get_gpiod()
- Copy string first and check return value of strscpy() for overflow in
  i2c_of_probe_get_gpiod()
- Add parenthesis around "enable" and "reset" GPIO names in comments
- Split resource count debug message into two separate lines
- Split out GPIO helper from i2c_of_probe_enable_res() to keep code
  cleaner following the previous patch
- Adopted options for customizing power sequencing delay following
  previous patch

Changes since v4:
- Split out from previous patch
- Moved GPIO property name check to common function in gpiolib.c in new
  patch
- Moved i2c_of_probe_free_gpios() into for_each_child_of_node_scoped()
- Rewrote in gpiod_*_array-esque fashion
---
 drivers/i2c/i2c-core-of-prober.c | 95 +++++++++++++++++++++++++++++++-
 include/linux/i2c-of-prober.h    | 10 ++++
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 1371ea565556..6794ec749882 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/i2c-of-prober.h>
 #include <linux/module.h>
@@ -30,7 +31,6 @@
  * address responds.
  *
  * TODO:
- * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
@@ -257,6 +257,64 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
 	regulator_disable(ctx->supply);
 }
 
+static int i2c_of_probe_simple_get_gpiod(struct device *dev, struct device_node *node,
+					 struct i2c_of_probe_simple_ctx *ctx)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_desc *gpiod;
+	const char *con_id = NULL;
+
+	/* NULL signals no GPIO needed */
+	if (!ctx->opts->gpio_name)
+		return 0;
+
+	/* An empty string signals an unnamed GPIO */
+	if (strlen(ctx->opts->gpio_name))
+		con_id = ctx->opts->gpio_name;
+
+	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	ctx->gpiod = gpiod;
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_put_gpiod(struct i2c_of_probe_simple_ctx *ctx)
+{
+	gpiod_put(ctx->gpiod);
+	ctx->gpiod = NULL;
+}
+
+static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	int ret;
+
+	if (!ctx->gpiod)
+		return 0;
+
+	dev_dbg(dev, "Setting GPIO\n");
+
+	ret = gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_high_to_enable ? 1 : 0);
+	if (ret)
+		return ret;
+
+	msleep(ctx->opts->post_reset_deassert_delay_ms);
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	if (!ctx->gpiod)
+		return;
+
+	dev_dbg(dev, "Setting GPIO to input\n");
+
+	gpiod_direction_input(ctx->gpiod);
+}
+
 /**
  * i2c_of_probe_simple_get_res - Simple helper for I2C OF prober to get resources
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
@@ -264,6 +322,8 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
  *
  * If &i2c_of_probe_simple_opts->supply_name is given, request the named regulator supply.
+ * If &i2c_of_probe_simple_opts->gpio_name is given, request the named GPIO. Or if it is
+ * the empty string, request the unnamed GPIO.
  *
  * Return: %0 on success or no-op, or a negative error number on failure.
  */
@@ -292,14 +352,36 @@ int i2c_of_probe_simple_get_res(struct device *dev, struct device_node *bus_node
 	if (ret)
 		goto out_put_node;
 
+	ret = i2c_of_probe_simple_get_gpiod(dev, node, ctx);
+	if (ret)
+		goto out_put_supply;
+
 	return 0;
 
+out_put_supply:
+	i2c_of_probe_simple_put_supply(ctx);
 out_put_node:
 	of_node_put(node);
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_get_res, I2C_OF_PROBER);
 
+/**
+ * i2c_of_probe_simple_free_res_early - \
+ *	Simple helper for I2C OF prober to release GPIOs before component is enabled
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * GPIO descriptors are exclusive and have to be released before the
+ * actual driver probes so that the latter can acquire them.
+ */
+void i2c_of_probe_simple_free_res_early(void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+
+	i2c_of_probe_simple_put_gpiod(ctx);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_free_res_early, I2C_OF_PROBER);
+
 /**
  * i2c_of_probe_simple_free_res_late - Simple helper for I2C OF prober to release all resources.
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
@@ -308,6 +390,7 @@ void i2c_of_probe_simple_free_res_late(void *data)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
+	i2c_of_probe_simple_put_gpiod(ctx);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_free_res_late, I2C_OF_PROBER);
@@ -330,7 +413,15 @@ int i2c_of_probe_simple_enable(struct device *dev, void *data)
 	if (ret)
 		return ret;
 
+	ret = i2c_of_probe_simple_set_gpio(dev, ctx);
+	if (ret)
+		goto err;
+
 	return 0;
+
+err:
+	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_enable, I2C_OF_PROBER);
 
@@ -347,6 +438,7 @@ int i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
+	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_disable_regulator(dev, ctx);
 
 	return 0;
@@ -355,6 +447,7 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, I2C_OF_PROBER);
 
 struct i2c_of_probe_ops i2c_of_probe_simple_ops = {
 	.get_resources = i2c_of_probe_simple_get_res,
+	.free_resources_early = i2c_of_probe_simple_free_res_early,
 	.enable = i2c_of_probe_simple_enable,
 	.cleanup = i2c_of_probe_simple_cleanup,
 	.free_resources_late = i2c_of_probe_simple_free_res_late,
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index 541451fbf58d..c5e241163c94 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -83,6 +83,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  *
  * The following helpers are provided:
  * * i2c_of_probe_simple_get_res()
+ * * i2c_of_probe_simple_free_res_early()
  * * i2c_of_probe_simple_free_res_late()
  * * i2c_of_probe_simple_enable()
  * * i2c_of_probe_simple_cleanup()
@@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
  * @res_node_compatible: Compatible string of device node to retrieve resources from.
  * @supply_name: Name of regulator supply.
+ * @gpio_name: Name of GPIO.
  * @post_power_on_delay_ms: Delay in ms after regulators are powered on. Passed to msleep().
+ * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passed to msleep().
+ * @gpio_high_to_enable: %true if GPIO should be set to electrical high to enable component.
  */
 struct i2c_of_probe_simple_opts {
 	const char *res_node_compatible;
 	const char *supply_name;
+	const char *gpio_name;
 	unsigned int post_power_on_delay_ms;
+	unsigned int post_reset_deassert_delay_ms;
+	bool gpio_high_to_enable;
 };
 
 struct regulator;
+struct gpio_desc;
 
 struct i2c_of_probe_simple_ctx {
 	/* public: provided by user before helpers are used. */
 	const struct i2c_of_probe_simple_opts *opts;
 	/* private: internal fields for helpers. */
 	struct regulator *supply;
+	struct gpio_desc *gpiod;
 };
 
 int i2c_of_probe_simple_get_res(struct device *dev, struct device_node *bus_node, void *data);
+void i2c_of_probe_simple_free_res_early(void *data);
 void i2c_of_probe_simple_free_res_late(void *data);
 int i2c_of_probe_simple_enable(struct device *dev, void *data);
 int i2c_of_probe_simple_cleanup(struct device *dev, void *data);
-- 
2.46.0.598.g6f2099f65c-goog


