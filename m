Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A365C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 10:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMQzDBFwtvtL+uRpCqzQYWzmcXr00tCiZCE6wRprzyk=; b=YyaxG63T0HzdfRFMVi7CqoS/kp
	/sLWaKnnPgiOFqgSan71D2cafmpvsG+ZTg6/LFnwZvpNRAN0g8tzTjAY/MrfrzKoNaI+sQYcZiwzc
	Vy1K5jcr2cNENJQIAoT2p+3aOYt25FfDMwM1c/+fnXXfMCI1SeGcjw1VsDtjLss1pVRtLQQGjQmSN
	7NgE2L6osds1G/fzqwz3YJG1uvVX2l3Zzhq3jfBjn2NjXmo80F0uFe8for9zA+rUxaz7zL9NRhvIo
	0szWhS6KK6P156w4znYafqsklSJpA4rbrd1PdqQ1jjSzG/uLuF9lYTH9TA6ciCGe/UOnqPHpms0bg
	pezZdBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzy8-00000007ogz-0Uqv;
	Thu, 08 Aug 2024 10:02:04 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzw7-00000007o4B-1Ibq
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Aug 2024 10:00:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fd78c165eeso6641335ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Aug 2024 02:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111198; x=1723715998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMQzDBFwtvtL+uRpCqzQYWzmcXr00tCiZCE6wRprzyk=;
        b=P5N6tCpvZCJ5JIeslwQYwwqc3Z4omD1un6IoJBnzjPOfWo0CbKvtJW6N8JaGNLaCbb
         ORM8N7H2pT4zCU54DAPxnLnNATltBV7q78SuoxSDDKNUpyFag4mRo2qsheV46k4b+brl
         OeY+J59wsuC1yc+KKsGo/vFW8prAyv1HDmaTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111198; x=1723715998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMQzDBFwtvtL+uRpCqzQYWzmcXr00tCiZCE6wRprzyk=;
        b=WMyjWdJqr/2u3jL4hzCORzN0xcIBvur6866h/rTRGPLeCMIjTzlrVF8zuDVYr98Uwk
         P5fDizRhE7M56hkmcCsPLdwXktlN79GqPQuzYMLUFnPnuDR3Rp7DZ3vKhxgaN62zf9Zc
         p9TQ+rIArNekzgHTi1SbAh2yLjhyOUFzLOOJu7lv2UJJ+dsr46Vn7V6r1vg8GGkXWiZQ
         sfoHZURNwiSVSh9w9t3Ewe5f5IABLjY+V73eAc2/1efavbpnavgIBB4iW7i2mUbCE4WN
         z0kA25qlpI7Ctf12aNI6ReQPgOapg5brOz9EeYAVzOz/lKk33gx6GLuN9lHK39m8A8uj
         dEEA==
X-Forwarded-Encrypted: i=1; AJvYcCX/Fo6+HdCL0bi4BXBZUs7H5Dn+FAj0ZoofUtaR1vVo5NyHn85V9rHZPYfepSnK8J8aLQ/b/SUD0OwKPjZElOCnRFzgbMFwlSXZBAeyVwJX0owo
X-Gm-Message-State: AOJu0YxvqpDnRj3iCucKzrH7lmN9W4ZveERoTiyxR8PNb+uOB8C7ThRg
	G+KmARbjASo/nqb1ojOSYBTiON/sLCYYlr+SwWmzTsNF/mau8G8A1bvDMlgdaQ==
X-Google-Smtp-Source: AGHT+IFpIGcwhRChfmS6FgNQKtKkh03/uSPOBA07xstWnAMz5Rv8gBIXh5/7TokHUzCHGoOUlZXHWw==
X-Received: by 2002:a17:903:2288:b0:1fa:2b89:f549 with SMTP id d9443c01a7336-20095224c09mr17452045ad.10.1723111198191;
        Thu, 08 Aug 2024 02:59:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.02.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:59:57 -0700 (PDT)
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
Subject: [PATCH v4 4/6] i2c: of-prober: Add GPIO and regulator support
Date: Thu,  8 Aug 2024 17:59:27 +0800
Message-ID: <20240808095931.2649657-5-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240808095931.2649657-1-wenst@chromium.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_025959_385336_73BD404A 
X-CRM114-Status: GOOD (  31.41  )
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

This adds GPIO and regulator management to the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.

Without specific knowledge of each component's resource names or
power sequencing requirements, the prober can only enable the
regulator supplies all at once, and toggle the GPIOs all at once.
Luckily, reset pins tend to be active low, while enable pins tend to
be active high, so setting the raw status of all GPIO pins to high
should work. The wait time before and after resources are enabled
are collected from existing drivers and device trees.

The prober collects resources from all possible components and enables
them together, instead of enabling resources and probing each component
one by one. The latter approach does not provide any boot time benefits
over simply enabling each component and letting each driver probe
sequentially.

The prober will also deduplicate the resources, since on a component
swap out or co-layout design, the resources are always the same.
While duplicate regulator supplies won't cause much issue, shared
GPIOs don't work reliably, especially with other drivers. For the
same reason, the prober will release the GPIOs before the successfully
probed component is actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- New patch

This change is kept as a separate patch for now since the changes are
quite numerous.
---
 drivers/i2c/i2c-core-of-prober.c | 272 ++++++++++++++++++++++++++++++-
 1 file changed, 271 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 08aa736cc7a9..76d26768e12c 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -5,11 +5,14 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 /*
@@ -25,10 +28,242 @@
  * address responds.
  *
  * TODO:
- * - Support handling common regulators and GPIOs.
  * - Support I2C muxes
  */
 
+/*
+ * While 8 seems like a small number, especially when probing many component
+ * options, in practice all the options will have the same resources. The
+ * code getting the resources below does deduplication to avoid conflicts.
+ */
+#define RESOURCE_MAX 8
+
+struct i2c_of_probe_data {
+	struct of_phandle_args gpio_phandles[RESOURCE_MAX];
+	unsigned int gpio_phandles_num;
+	struct gpio_desc *gpiods[RESOURCE_MAX];
+	unsigned int gpiods_num;
+	struct regulator *regulators[RESOURCE_MAX];
+	unsigned int regulators_num;
+};
+
+#define REGULATOR_SUFFIX "-supply"
+
+/* Returns 1 if regulator found for property, 0 if not, or error. */
+static int i2c_of_probe_get_regulator(struct device_node *node, struct property *prop,
+				      struct i2c_of_probe_data *data)
+{
+	struct regulator *regulator = NULL;
+	char con[32]; /* 32 is max size of property name */
+	char *p;
+
+	p = strstr(prop->name, REGULATOR_SUFFIX);
+	if (!p)
+		return 0;
+
+	if (strcmp(p, REGULATOR_SUFFIX))
+		return 0;
+
+	strscpy(con, prop->name, p - prop->name + 1);
+	regulator = regulator_of_get_optional(node, con);
+	/* DT lookup should never return -ENODEV */
+	if (IS_ERR(regulator))
+		return PTR_ERR(regulator);
+
+	for (int i = 0; i < data->regulators_num; i++)
+		if (regulator_is_equal(regulator, data->regulators[i])) {
+			regulator_put(regulator);
+			regulator = NULL;
+			break;
+		}
+
+	if (!regulator)
+		return 1;
+
+	if (data->regulators_num == ARRAY_SIZE(data->regulators)) {
+		regulator_put(regulator);
+		return -ENOMEM;
+	}
+
+	data->regulators[data->regulators_num++] = regulator;
+
+	return 1;
+}
+
+#define GPIO_SUFFIX "-gpio"
+
+/* Returns 1 if GPIO found for property, 0 if not, or error. */
+static int i2c_of_probe_get_gpiod(struct device_node *node, struct property *prop,
+				  struct i2c_of_probe_data *data)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_desc *gpiod = NULL;
+	char con[32]; /* 32 is max size of property name */
+	char *con_id = NULL;
+	char *p;
+	struct of_phandle_args phargs;
+	int ret;
+	bool duplicate_found;
+
+	p = strstr(prop->name, GPIO_SUFFIX);
+	if (p) {
+		strscpy(con, prop->name, p - prop->name + 1);
+		con_id = con;
+	} else if (strcmp(prop->name, "gpio") && strcmp(prop->name, "gpios")) {
+		return 0;
+	}
+
+	ret = of_parse_phandle_with_args_map(node, prop->name, "gpio", 0, &phargs);
+	if (ret)
+		return ret;
+
+	/*
+	 * GPIO descriptors are not reference counted. GPIOD_FLAGS_BIT_NONEXCLUSIVE
+	 * can't differentiate between GPIOs shared between devices to be probed and
+	 * other devices (which is incorrect). Instead we check the parsed phandle
+	 * for duplicates. Ignore the flags (the last arg) in this case.
+	 */
+	phargs.args[phargs.args_count - 1] = 0;
+	duplicate_found = false;
+	for (int i = 0; i < data->gpio_phandles_num; i++)
+		if (of_phandle_args_equal(&phargs, &data->gpio_phandles[i])) {
+			duplicate_found = true;
+			break;
+		}
+
+	if (duplicate_found) {
+		of_node_put(phargs.np);
+		return 1;
+	}
+
+	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
+	if (IS_ERR(gpiod)) {
+		of_node_put(phargs.np);
+		return PTR_ERR(gpiod);
+	}
+
+	if (data->gpiods_num == ARRAY_SIZE(data->gpiods)) {
+		of_node_put(phargs.np);
+		gpiod_put(gpiod);
+		return -ENOMEM;
+	}
+
+	memcpy(&data->gpio_phandles[data->gpio_phandles_num++], &phargs, sizeof(phargs));
+	data->gpiods[data->gpiods_num++] = gpiod;
+
+	return 1;
+}
+
+/*
+ * This is split into two functions because in the normal flow the GPIOs
+ * have to be released before the actual driver probes so that the latter
+ * can acquire them.
+ */
+static void i2c_of_probe_free_gpios(struct i2c_of_probe_data *data)
+{
+	for (int i = data->gpio_phandles_num - 1; i >= 0; i--)
+		of_node_put(data->gpio_phandles[i].np);
+	data->gpio_phandles_num = 0;
+
+	for (int i = data->gpiods_num - 1; i >= 0; i--)
+		gpiod_put(data->gpiods[i]);
+	data->gpiods_num = 0;
+}
+
+static void i2c_of_probe_free_res(struct i2c_of_probe_data *data)
+{
+	i2c_of_probe_free_gpios(data);
+
+	for (int i = data->regulators_num; i >= 0; i--)
+		regulator_put(data->regulators[i]);
+	data->regulators_num = 0;
+}
+
+static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
+				struct i2c_of_probe_data *data)
+{
+	struct property *prop;
+	int ret;
+
+	for_each_property_of_node(node, prop) {
+		dev_dbg(dev, "Trying property %pOF/%s\n", node, prop->name);
+
+		/* regulator supplies */
+		ret = i2c_of_probe_get_regulator(node, prop, data);
+		if (ret > 0)
+			continue;
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "Failed to get regulator supply from %pOF/%s\n",
+				      node, prop->name);
+			goto err_cleanup;
+		}
+
+		/* GPIOs */
+		ret = i2c_of_probe_get_gpiod(node, prop, data);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "Failed to get GPIO from %pOF/%s\n",
+				      node, prop->name);
+			goto err_cleanup;
+		}
+	}
+
+	return 0;
+
+err_cleanup:
+	i2c_of_probe_free_res(data);
+	return ret;
+}
+
+static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
+{
+	int ret = 0;
+	int reg_i, gpio_i;
+
+	dev_dbg(dev, "Enabling resources\n");
+
+	for (reg_i = 0; reg_i < data->regulators_num; reg_i++) {
+		dev_dbg(dev, "Enabling regulator %d\n", reg_i);
+		ret = regulator_enable(data->regulators[reg_i]);
+		if (ret)
+			goto disable_regulators;
+	}
+
+	/* largest post-power-on pre-reset-deassert delay seen among drivers */
+	msleep(500);
+
+	for (gpio_i = 0; gpio_i < data->gpiods_num; gpio_i++) {
+		/*
+		 * reset GPIOs normally have opposite polarity compared to
+		 * enable GPIOs. Instead of parsing the flags again, simply
+		 * set the raw value to high.
+		 */
+		dev_dbg(dev, "Setting GPIO %d\n", gpio_i);
+		ret = gpiod_direction_output_raw(data->gpiods[gpio_i], 1);
+		if (ret)
+			goto disable_gpios;
+	}
+
+	/* largest post-reset-deassert delay seen in tree for Elan I2C HID */
+	msleep(300);
+
+	return 0;
+
+disable_gpios:
+	for (gpio_i--; gpio_i >= 0; gpio_i--)
+		gpiod_set_raw_value_cansleep(data->gpiods[gpio_i], 0);
+disable_regulators:
+	for (reg_i--; reg_i >= 0; reg_i--)
+		regulator_disable(data->regulators[reg_i]);
+
+	return ret;
+}
+
+static void i2c_of_probe_disable_regulators(struct i2c_of_probe_data *data)
+{
+	for (int i = data->regulators_num - 1; i >= 0; i--)
+		regulator_disable(data->regulators[i]);
+}
+
 /**
  * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
  * @dev: &struct device of the caller, only used for dev_* printk messages
@@ -64,6 +299,7 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 	struct device_node *node, *i2c_node;
 	struct i2c_adapter *i2c;
 	struct of_changeset *ocs = NULL;
+	struct i2c_of_probe_data data = {0};
 	int ret;
 
 	node = of_find_node_by_name(NULL, type);
@@ -101,6 +337,34 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
 	}
 
+	/* Grab resources */
+	for_each_child_of_node_scoped(i2c_node, node) {
+		u32 addr;
+
+		if (!of_node_name_prefix(node, type))
+			continue;
+		if (of_property_read_u32(node, "reg", &addr))
+			continue;
+
+		dev_dbg(dev, "Requesting resources for %pOF\n", node);
+		ret = i2c_of_probe_get_res(dev, node, &data);
+		if (ret) {
+			of_node_put(i2c_node);
+			return ret;
+		}
+	}
+
+	dev_dbg(dev, "Resources: # of GPIOs = %d, # of regulator supplies = %d\n",
+		data.gpiods_num, data.regulators_num);
+
+	/* Enable resources */
+	ret = i2c_of_probe_enable_res(dev, &data);
+	if (ret) {
+		i2c_of_probe_free_res(&data);
+		of_node_put(i2c_node);
+		return dev_err_probe(dev, ret, "Failed to enable resources\n");
+	}
+
 	ret = 0;
 	for_each_child_of_node(i2c_node, node) {
 		union i2c_smbus_data data;
@@ -116,6 +380,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		break;
 	}
 
+	i2c_of_probe_free_gpios(&data);
+
 	/* Found a device that is responding */
 	if (node) {
 		dev_info(dev, "Enabling %pOF\n", node);
@@ -137,6 +403,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		of_node_put(node);
 	}
 
+	i2c_of_probe_disable_regulators(&data);
+	i2c_of_probe_free_res(&data);
 	i2c_put_adapter(i2c);
 	of_node_put(i2c_node);
 
@@ -148,6 +416,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 	kfree(ocs);
 err_put_node:
 	of_node_put(node);
+	i2c_of_probe_disable_regulators(&data);
+	i2c_of_probe_free_res(&data);
 	i2c_put_adapter(i2c);
 	of_node_put(i2c_node);
 	return ret;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


