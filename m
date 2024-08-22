Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0EAC5321D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nK7RVXbUa73K0O9XTM3cCy4ZRtIeA4akoAuNuVfnhl4=; b=fWg7dXUBAl9FudxDxi6xwcvg3n
	ando35Pnd1YvB81tvgC0uraim1f2iodDU4L1G7MnJ1yTVWPA9CdMCQLUeSuZhLa01EpAMqe1GZduV
	59SWi8kminE4L6KxxacyglqLLPPMmhFHvNZ4mExGX2f03aBpj39nUt+UKzw5zVpSMIT65/xs+ZgAf
	TbctBVb6MUqwYurgAwj0qV/8tdRUIUjNyYegwQdUurW/Ab+cUJ07BF3Y35+tVWaOC+tL4wjU3nZKs
	nP6vKab6BzP9ninytz2BHLcI4LB8htWsmurX4CvEkdaP4RGEr2eGd0F58ZqbHy94A57ADbEqGzR5H
	aWBWEGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh45L-0000000CDv2-3RK9;
	Thu, 22 Aug 2024 09:26:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3zr-0000000CCHC-1W9i
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:49 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7142448aaf9so403473b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318446; x=1724923246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK7RVXbUa73K0O9XTM3cCy4ZRtIeA4akoAuNuVfnhl4=;
        b=bmyoAbdxWATVF/+GBe3wwoj8/0zKxrEXDQI8AhHYXJU/FXeVZc/ttEaxu1Fpw45Ebq
         UpZr3PuxGaz2rwU8vSEG82AhFZLGeE96ewp43idqcHzupBGjEZWdNQfEHE3KiOrX2gdS
         XrLTq/SEfOes3MdkAe38QWV6/ZEXkousHjfCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318446; x=1724923246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nK7RVXbUa73K0O9XTM3cCy4ZRtIeA4akoAuNuVfnhl4=;
        b=HqkLUA2Tjrx5VH6yirujN/4KRjrrdGMRZgQnr8g6CvNxr0uUaCMaoRndTAWNGYAzAH
         6f9NEjIMq8m1/67DHI8ZJI3NGS4T7wx/a8xZl8RDQuuDRQkBVyYtZwfyySDdEKsElF1s
         O6ogAf+hH3m/qYeFM8dYe8Q49PX9rUCEBhmbKsNmSsfUXXh0M7k05/r3FrQr4uL6vt2X
         57N2zar+V5BM9VcEk5LcPEE76fvnzT2I5ybK1ZAVw529t5naSBqQcdoKHAugypWGrW66
         VP8rgeaMpXJm7zLSktTGVhshyxefipOdfy80HW1tGrbApSzrc87IMKMnXqi4uj5Fn1P2
         qc/w==
X-Forwarded-Encrypted: i=1; AJvYcCUpZ+zVWuOVK22/+F35UPbMw5mEJMKs+6fJfXk5fOqM9Y6Pl9Vg0RYIq0LpOW6T9jDuJ5gzLM4aaRsGrYVH1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxklqSlPE4S88Eqbiph/vjPkD+/NdKrxrSveeTFI74cy/TUgg4Y
	Fd9xKTk4Gq0he2b2sLaZOBVsD2TsdD0m7Lyyrc6//Icss+HyFWW+cAWK2O1Giw==
X-Google-Smtp-Source: AGHT+IFZrknrh60AP+xUNW7G6X8rXlnZ0nYSqqA2Jq4MMQC2PUO1ifpAUkr7X0okzBKnbPbPM0MW6w==
X-Received: by 2002:a05:6a00:2d81:b0:70e:cee8:264a with SMTP id d2e1a72fcca58-7143170e827mr4568474b3a.1.1724318446207;
        Thu, 22 Aug 2024 02:20:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:45 -0700 (PDT)
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
Subject: [PATCH v5 07/10] i2c: of-prober: Add regulator support
Date: Thu, 22 Aug 2024 17:20:00 +0800
Message-ID: <20240822092006.3134096-8-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022047_462378_516678F0 
X-CRM114-Status: GOOD (  24.00  )
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

This adds regulator management to the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
GPIOs will be handled in the next patch.

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
- Split out GPIO handling to separate patch
- Rewrote using of_regulator_bulk_get_all()
- Replaced "regulators" with "regulator supplies" in debug messages

Changes since v3:
- New patch

This change is kept as a separate patch for now since the changes are
quite numerous.
---
 drivers/i2c/i2c-core-of-prober.c | 114 ++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index bb7b231201b0..32184cfd10f6 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -6,12 +6,14 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 /*
@@ -27,10 +29,93 @@
  * address responds.
  *
  * TODO:
- * - Support handling common regulators and GPIOs.
+ * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
+struct i2c_of_probe_data {
+	struct regulator_bulk_data *regulators;
+	unsigned int regulators_num;
+};
+
+/* Returns number of regulator supplies found for node, or error. */
+static int i2c_of_probe_get_regulator(struct device *dev, struct device_node *node,
+				      struct i2c_of_probe_data *data)
+{
+	struct regulator_bulk_data *tmp, *new_regulators;
+	int ret;
+
+	ret = of_regulator_bulk_get_all(dev, node, &tmp);
+	if (ret <= 0)
+		return ret;
+
+	if (!data->regulators) {
+		data->regulators = tmp;
+		data->regulators_num = ret;
+		return ret;
+	};
+
+	new_regulators = krealloc(data->regulators,
+				  sizeof(*tmp) * (data->regulators_num + ret),
+				  GFP_KERNEL);
+	if (!new_regulators) {
+		regulator_bulk_free(ret, tmp);
+		return -ENOMEM;
+	}
+
+	data->regulators = new_regulators;
+
+	for (unsigned int i = 0; i < ret; i++)
+		memcpy(&data->regulators[data->regulators_num++], &tmp[i], sizeof(*tmp));
+
+	return ret;
+}
+
+static void i2c_of_probe_free_res(struct i2c_of_probe_data *data)
+{
+	regulator_bulk_free(data->regulators_num, data->regulators);
+}
+
+static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
+				struct i2c_of_probe_data *data)
+{
+	struct property *prop;
+	int ret;
+
+	ret = i2c_of_probe_get_regulator(dev, node, data);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to get regulator supplies from %pOF\n", node);
+		goto err_cleanup;
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
+
+	dev_dbg(dev, "Enabling regulator supplies\n");
+
+	ret = regulator_bulk_enable(data->regulators_num, data->regulators);
+	if (ret)
+		return ret;
+
+	/* largest post-power-on pre-reset-deassert delay seen among drivers */
+	msleep(500);
+
+	return 0;
+}
+
+static void i2c_of_probe_disable_regulators(struct i2c_of_probe_data *data)
+{
+	regulator_bulk_disable(data->regulators_num, data->regulators);
+}
+
 static struct device_node *i2c_of_probe_get_i2c_node(struct device *dev, const char *type)
 {
 	struct device_node *node __free(device_node) = of_find_node_by_name(NULL, type);
@@ -110,6 +195,7 @@ static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node
 int i2c_of_probe_component(struct device *dev, const char *type)
 {
 	struct i2c_adapter *i2c;
+	struct i2c_of_probe_data probe_data = {0};
 	int ret;
 
 	struct device_node *i2c_node __free(device_node) = i2c_of_probe_get_i2c_node(dev, type);
@@ -133,6 +219,30 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 	if (!i2c)
 		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
 
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
+		ret = i2c_of_probe_get_res(dev, node, &probe_data);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(dev, "Resources: # of regulator supplies = %d\n", probe_data.regulators_num);
+
+	/* Enable resources */
+	ret = i2c_of_probe_enable_res(dev, &probe_data);
+	if (ret) {
+		i2c_of_probe_free_res(&probe_data);
+		return dev_err_probe(dev, ret, "Failed to enable resources\n");
+	}
+
 	ret = 0;
 	for_each_child_of_node_scoped(i2c_node, node) {
 		union i2c_smbus_data data;
@@ -150,6 +260,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		break;
 	}
 
+	i2c_of_probe_disable_regulators(&probe_data);
+	i2c_of_probe_free_res(&probe_data);
 	i2c_put_adapter(i2c);
 
 	return ret;
-- 
2.46.0.184.g6999bdac58-goog


