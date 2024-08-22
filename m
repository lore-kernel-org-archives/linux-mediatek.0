Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4920C5321E
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIuVa6xe5T9fPXAC3Ljp+tme57B/5X5NOOiRmoSNKDs=; b=tSWQcru603HOfKxSSl8DL852ok
	hk6dYjQjVx31hFBYJb/Rp0kn7auuWZoij8HDeQYaoK3uQBfwswgV13ePnw03yK2x3nY9tZPbXTwwh
	RUYDxfUhFWnRUPECDLLLn849yAGLVaxX01VWZKvTQ++B/wlZYFiM6EwG/UcQ6LPowZaMf1H4mYUQf
	MatAwK1lYw2lprG2SaPJTS9kGNhgGhxhPO1EifTAUFVusAdrMEVlGUlMM0mUu7zV93viLsMqEOJJ5
	8fOeugq94V85uhNIWLhOZuBROpqttOuzVXkbyTMg65juJZ02laNSrATQG4hCGULSaHf1gY79h2RX/
	FZNwNOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh45M-0000000CDvV-0eGt;
	Thu, 22 Aug 2024 09:26:28 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3zu-0000000CCIt-446U
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:52 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-27020fca39aso380609fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318450; x=1724923250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIuVa6xe5T9fPXAC3Ljp+tme57B/5X5NOOiRmoSNKDs=;
        b=SJdQ04XXrU6+gzhAFzEShvXIIhnJRuxNnZo92PCrE6FMbqJgqYTd0+hfAEwc8+l7sy
         qmacaeQz92rXHUGbTdggMDs3HzDZeshs3vynkFjTAS4/KB7sFdIpEPv3rPVzK20bIMPN
         Q6vv8h5NtUtzM1yg6YVaq9iA7v6szGLtQl7v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318450; x=1724923250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIuVa6xe5T9fPXAC3Ljp+tme57B/5X5NOOiRmoSNKDs=;
        b=oxoKPe5SlwyVXwvJ4GSflmmjCD3CqmGm20zqTrvNmwNR5i7uwL3JwNC5YYAFVQHPXc
         rgz5ZtKwId7SYBjloRfwO3sWvFUz2r72m39eh8EnRMoEiJpGK5r29hsTQq/WbbW1LSXB
         /hZ+FwetYV7EQq43ZAbGHH6yaIvVYnuNVvuJl0RVm7sSS0VM3BgDKDJ5rCfc4UfyZQM7
         /S6jETlexw0+kQJr/goZOjAuRI7156a33gLfDsE6uZR4DLPpLtfMTDTOH28TeiKP9CNn
         aJX2tHNPQk8tpeXfYNWN7C+y+IYtBwmWurp40fhQKiPaxGWIBR0LkynLp0rrLZq7Alan
         0fug==
X-Forwarded-Encrypted: i=1; AJvYcCU6b9vUf9sqApB2xB6fetP0MPQ2OXGndGlmStnyrCG0esOkYHuTQ6rFpyi+pLtXeA4fO/ijB1btGuI+wfTYVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHBscTzDnYUMACwCNpIaV9zLsCUFli9g3EFdU6xbeKOMfRQcxu
	Cwe7dOkblKnXAu7BuOkKNobXfjVac4XKiLe+XCB+XgiNivQJSFe0lIi+EWoj3A==
X-Google-Smtp-Source: AGHT+IE7GKAi5GcWfleItjZNggbXuAhjFv7VDxVtEAzSHPTiX6tW2gRy6Kxe6kC20IJZDqjxfuUcSg==
X-Received: by 2002:a05:6870:7a07:b0:260:fc49:3e96 with SMTP id 586e51a60fabf-273cff98fcbmr1222495fac.46.1724318449803;
        Thu, 22 Aug 2024 02:20:49 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:49 -0700 (PDT)
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
Subject: [PATCH v5 08/10] i2c: of-prober: Add GPIO support
Date: Thu, 22 Aug 2024 17:20:01 +0800
Message-ID: <20240822092006.3134096-9-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022051_040394_35F08454 
X-CRM114-Status: GOOD (  30.57  )
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

This adds GPIO management to the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
regulator support was added in the previous patch.

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
Changes since v4:
- Split out from previous patch
- Moved GPIO property name check to common function in gpiolib.c in new
  patch
- Moved i2c_of_probe_free_gpios() into for_each_child_of_node_scoped()
- Rewrote in gpiod_*_array-esque fashion
---
 drivers/i2c/i2c-core-of-prober.c | 126 ++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 32184cfd10f6..046e6605053c 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -29,11 +30,11 @@
  * address responds.
  *
  * TODO:
- * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
 struct i2c_of_probe_data {
+	struct gpio_descs *gpiods;
 	struct regulator_bulk_data *regulators;
 	unsigned int regulators_num;
 };
@@ -71,8 +72,88 @@ static int i2c_of_probe_get_regulator(struct device *dev, struct device_node *no
 	return ret;
 }
 
+/*
+ * Returns 1 if property is GPIO and GPIO successfully requested,
+ * 0 if not a GPIO property, or error if request for GPIO failed.
+ */
+static int i2c_of_probe_get_gpiod(struct device_node *node, struct property *prop,
+				  struct i2c_of_probe_data *data)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_descs *gpiods;
+	struct gpio_desc *gpiod;
+	char con[32]; /* 32 is max size of property name */
+	char *con_id = NULL;
+	size_t new_size;
+	int len;
+
+	len = gpio_property_name_length(prop->name);
+	if (len < 0)
+		return 0;
+
+	if (len >= sizeof(con) - 1) {
+		pr_err("%pOF: length of GPIO name \"%s\" exceeds current limit\n",
+		       node, prop->name);
+		return -EINVAL;
+	}
+
+	if (len > 0) {
+		strscpy(con, prop->name, len + 1);
+		con_id = con;
+	}
+
+	/*
+	 * GPIO descriptors are not reference counted. GPIOD_FLAGS_BIT_NONEXCLUSIVE
+	 * can't differentiate between GPIOs shared between devices to be probed and
+	 * other devices (which is incorrect). If the initial request fails with
+	 * -EBUSY, retry with GPIOD_FLAGS_BIT_NONEXCLUSIVE and see if it matches
+	 * any existing ones.
+	 */
+	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
+	if (IS_ERR(gpiod)) {
+		int i;
+
+		if (PTR_ERR(gpiod) != -EBUSY || !data->gpiods)
+			return PTR_ERR(gpiod);
+
+		gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0,
+					       GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
+					       "i2c-of-prober");
+		for (i = 0; i < data->gpiods->ndescs; i++)
+			if (gpiod == data->gpiods->desc[i])
+				return 1;
+
+		return -EBUSY;
+	}
+
+	new_size = struct_size(gpiods, desc, data->gpiods ? data->gpiods->ndescs + 1 : 1);
+	gpiods = krealloc(data->gpiods, new_size, GFP_KERNEL);
+	if (!gpiods) {
+		gpiod_put(gpiod);
+		return -ENOMEM;
+	}
+
+	data->gpiods = gpiods;
+	data->gpiods->desc[data->gpiods->ndescs++] = gpiod;
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
+	if (data->gpiods)
+		gpiod_put_array(data->gpiods);
+	data->gpiods = NULL;
+}
+
 static void i2c_of_probe_free_res(struct i2c_of_probe_data *data)
 {
+	i2c_of_probe_free_gpios(data);
 	regulator_bulk_free(data->regulators_num, data->regulators);
 }
 
@@ -88,6 +169,18 @@ static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
 		goto err_cleanup;
 	}
 
+	for_each_property_of_node(node, prop) {
+		dev_dbg(dev, "Trying property %pOF/%s\n", node, prop->name);
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
 	return 0;
 
 err_cleanup:
@@ -98,6 +191,7 @@ static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
 static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
 {
 	int ret = 0;
+	int gpio_i;
 
 	dev_dbg(dev, "Enabling regulator supplies\n");
 
@@ -108,7 +202,32 @@ static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data
 	/* largest post-power-on pre-reset-deassert delay seen among drivers */
 	msleep(500);
 
+	if (!data->gpiods)
+		return 0;
+
+	for (gpio_i = 0; gpio_i < data->gpiods->ndescs; gpio_i++) {
+		/*
+		 * reset GPIOs normally have opposite polarity compared to
+		 * enable GPIOs. Instead of parsing the flags again, simply
+		 * set the raw value to high.
+		 */
+		dev_dbg(dev, "Setting GPIO %d\n", gpio_i);
+		ret = gpiod_direction_output_raw(data->gpiods->desc[gpio_i], 1);
+		if (ret)
+			goto disable_gpios;
+	}
+
+	/* largest post-reset-deassert delay seen in tree for Elan I2C HID */
+	msleep(300);
+
 	return 0;
+
+disable_gpios:
+	for (gpio_i--; gpio_i >= 0; gpio_i--)
+		gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], 0);
+	regulator_bulk_disable(data->regulators_num, data->regulators);
+
+	return ret;
 }
 
 static void i2c_of_probe_disable_regulators(struct i2c_of_probe_data *data)
@@ -234,7 +353,9 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 			return ret;
 	}
 
-	dev_dbg(dev, "Resources: # of regulator supplies = %d\n", probe_data.regulators_num);
+	dev_dbg(dev, "Resources: # of GPIOs = %d, # of regulator supplies = %d\n",
+		probe_data.gpiods ? probe_data.gpiods->ndescs : 0,
+		probe_data.regulators_num);
 
 	/* Enable resources */
 	ret = i2c_of_probe_enable_res(dev, &probe_data);
@@ -256,6 +377,7 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 			continue;
 
 		/* Found a device that is responding */
+		i2c_of_probe_free_gpios(&probe_data);
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
-- 
2.46.0.184.g6999bdac58-goog


