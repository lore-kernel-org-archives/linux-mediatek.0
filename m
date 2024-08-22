Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BBFC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxRueDbPxY1fgYOETHJnt8bZkNktfZ7UPvnhXd9unUQ=; b=w8Yf3DZqmaGblYyJWnRRGRSaq8
	+p9/K4lxMFhyppUy3nGddgKzl51xLNyu9Q700t4sZNZjcWccadCteRH8BDQngnSM8hjTWFvgCx3uM
	lb68g0gxraa3Nil/hqpZy8hpWqeAX6SqztrujAUacx31xGdKN7SQZIIT5Lhd6Tec3elJSFO8U+wgK
	0ySB/3SSqfzTQYdyve8O4d4/Uq+RqIt1jezVoyCnzy1/5peOvPM17m2p/6gaqS4FNk39l5nEPLiK8
	8kekGzTuP0VXRXIOnEreAJIVR8Art+k4gDQ9nfaYj4+Q87OcRNaBPf4IeL5ptpTvpqdZAkLAlp+In
	OgWNp/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh43u-0000000CDYl-07dy;
	Thu, 22 Aug 2024 09:24:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3zn-0000000CCFl-1hf3
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:45 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71431524f33so519714b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318443; x=1724923243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxRueDbPxY1fgYOETHJnt8bZkNktfZ7UPvnhXd9unUQ=;
        b=M1KglKmM0+2g764kI6I5eB7EgR1wo57i+zwaNMXxkiOxaXNM/EzivNyr/Ns3yhMqot
         dWdVwnF6xEKqeNxTJY4Y4oZC6C3Whak4cA2q1FtsfWdyDIj3313Ri5bLVFPydVAuqJ65
         W5ag+Tr9vLBbq+eJtRJVWYDbo7Bi+qJK/8IXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318443; x=1724923243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxRueDbPxY1fgYOETHJnt8bZkNktfZ7UPvnhXd9unUQ=;
        b=xMNJiPEEI/NWPqOVrzxRE3jl57JDNY1Xfa/45t/tgDaJm2i2jD2fK45jTlL38qgZJs
         qv9cA9vS50uh/4xBdYZ5SWON5mPuF7l5wx0EEy1YRhOInzORLvExSEQZiL5rpha4gWX/
         tnNHSU7HBngxiNj8xvglrw6lT0AollMf9DqsEhdjClt4Y4JmaEt/FxJFw2BnZPI7TeUj
         MxA0hpKIMlaxue99OBH/2vqzq2g/YadBdnAVA7BLYH1oz6KXUr35pDm9hXgzck/ORrsr
         MFyJqXDv1J7T1Q9irc1NCE1/y3jVdzXQ9zM/DQNgTmu1TMIVBIEcKtou45J8C/RUPk8f
         Jbiw==
X-Forwarded-Encrypted: i=1; AJvYcCX/2JVZ443phv2lpZrwhEf7DrOkFkMIZ5HuGnXhK0wE0AKiFEpO2AFiu7JpttRgN9s2ayCZiP7ERq+iNNRxZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTZaZQxnWev419nzA0oxkspOGcyxgQwxW+sNh0uNP4RUMYd2Ht
	QHfCGqPVS4R9kFx7fd8RRqIKltBvv7LCZpHITP51BvrBrqqVZeKcrpMWVI0I2A==
X-Google-Smtp-Source: AGHT+IFtRkYpkCzlZNxo5hRLezdqYzrhH87tUkIsFl9WPCXve7xcF75QepgPZpqioalAlfO4Fwqhgw==
X-Received: by 2002:a05:6a20:9f4f:b0:1c4:8dc0:84f0 with SMTP id adf61e73a8af0-1cad814457dmr6336351637.43.1724318442623;
        Thu, 22 Aug 2024 02:20:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:42 -0700 (PDT)
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
Subject: [PATCH v5 06/10] i2c: Introduce OF component probe function
Date: Thu, 22 Aug 2024 17:19:59 +0800
Message-ID: <20240822092006.3134096-7-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022043_479922_5496C631 
X-CRM114-Status: GOOD (  40.48  )
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

Some devices are designed and manufactured with some components having
multiple drop-in replacement options. These components are often
connected to the mainboard via ribbon cables, having the same signals
and pin assignments across all options. These may include the display
panel and touchscreen on laptops and tablets, and the trackpad on
laptops. Sometimes which component option is used in a particular device
can be detected by some firmware provided identifier, other times that
information is not available, and the kernel has to try to probe each
device.

This change attempts to make the "probe each device" case cleaner. The
current approach is to have all options added and enabled in the device
tree. The kernel would then bind each device and run each driver's probe
function. This works, but has been broken before due to the introduction
of asynchronous probing, causing multiple instances requesting "shared"
resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
time, with only one instance succeeding. Work arounds for these include
moving the pinmux to the parent I2C controller, using GPIO hogs or
pinmux settings to keep the GPIO pins in some fixed configuration, and
requesting the interrupt line very late. Such configurations can be seen
on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
Lenovo Thinkpad 13S.

Instead of this delicate dance between drivers and device tree quirks,
this change introduces a simple I2C component probe. function For a
given class of devices on the same I2C bus, it will go through all of
them, doing a simple I2C read transfer and see which one of them responds.
It will then enable the device that responds.

This requires some minor modifications in the existing device tree. The
status for all the device nodes for the component options must be set
to "failed-needs-probe". This makes it clear that some mechanism is
needed to enable one of them, and also prevents the prober and device
drivers running at the same time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Split code into helper functions
- Use scoped helpers and __free() to reduce error path

Changes since v3:
- Complete kernel-doc
- Return different error if I2C controller is disabled
- Expand comment to explain assumptions and constraints
- Split for-loop finding target node and operations on target node
- Add missing i2c_put_adapter()
- Move prober code to separate file

Rob also asked why there was a limitation of "exactly one touchscreen
will be enabled across the whole tree".

The use case this prober currently targets is a component on consumer
electronics (tablet or laptop) being swapped out due to cost or supply
reasons. Designs with multiple components of the same type are pretty
rare. The way the next patch is written also assumes this for efficiency
reasons.

Changes since v2:
- New patch split out from "of: Introduce hardware prober driver"
- Addressed Rob's comments
  - Move i2c prober to i2c subsystem
  - Use of_node_is_available() to check if node is enabled.
  - Use OF changeset API to update status property
- Addressed Andy's comments
  - Probe function now accepts "struct device *dev" instead to reduce
    line length and dereferences
  - Move "ret = 0" to just before for_each_child_of_node(i2c_node, node)
---
 drivers/i2c/Makefile             |   1 +
 drivers/i2c/i2c-core-of-prober.c | 157 +++++++++++++++++++++++++++++++
 include/linux/i2c.h              |   4 +
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c

diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 3f71ce4711e3..0c543c742895 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -9,6 +9,7 @@ i2c-core-objs 			:= i2c-core-base.o i2c-core-smbus.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
 i2c-core-$(CONFIG_I2C_SLAVE) 	+= i2c-core-slave.o
 i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
+i2c-core-$(CONFIG_OF_DYNAMIC) 	+= i2c-core-of-prober.o
 
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
new file mode 100644
index 000000000000..bb7b231201b0
--- /dev/null
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux I2C core OF component prober code
+ *
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+/*
+ * Some devices, such as Google Hana Chromebooks, are produced by multiple
+ * vendors each using their preferred components. Such components are all
+ * in the device tree. Instead of having all of them enabled and having each
+ * driver separately try and probe its device while fighting over shared
+ * resources, they can be marked as "fail-needs-probe" and have a prober
+ * figure out which one is actually used beforehand.
+ *
+ * This prober assumes such drop-in parts are on the same I2C bus, have
+ * non-conflicting addresses, and can be directly probed by seeing which
+ * address responds.
+ *
+ * TODO:
+ * - Support handling common regulators and GPIOs.
+ * - Support I2C muxes
+ */
+
+static struct device_node *i2c_of_probe_get_i2c_node(struct device *dev, const char *type)
+{
+	struct device_node *node __free(device_node) = of_find_node_by_name(NULL, type);
+	if (!node)
+		return dev_err_ptr_probe(dev, -ENODEV, "Could not find %s device node\n", type);
+
+	struct device_node *i2c_node __free(device_node) = of_get_parent(node);
+	if (!of_node_name_eq(i2c_node, "i2c"))
+		return dev_err_ptr_probe(dev, -EINVAL, "%s device isn't on I2C bus\n", type);
+
+	if (!of_device_is_available(i2c_node))
+		return dev_err_ptr_probe(dev, -ENODEV, "I2C controller not available\n");
+
+	return no_free_ptr(i2c_node);
+}
+
+static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node)
+{
+	int ret;
+
+	dev_info(dev, "Enabling %pOF\n", node);
+
+	struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
+	if (!ocs)
+		return -ENOMEM;
+
+	of_changeset_init(ocs);
+	ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
+	if (ret)
+		return ret;
+
+	ret = of_changeset_apply(ocs);
+	if (!ret) {
+		/*
+		 * ocs is intentionally kept around as it needs to
+		 * exist as long as the change is applied.
+		 */
+		void *ptr __always_unused = no_free_ptr(ocs);
+	} else {
+		/* ocs needs to be explicitly cleaned up before being freed. */
+		of_changeset_destroy(ocs);
+	}
+
+	return ret;
+}
+
+/**
+ * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
+ * @dev: &struct device of the caller, only used for dev_* printk messages
+ * @type: a string to match the device node name prefix to probe for
+ *
+ * Probe for possible I2C components of the same "type" on the same I2C bus
+ * that have their status marked as "fail".
+ *
+ * Assumes that across the entire device tree the only instances of nodes
+ * prefixed with "type" are the ones that need handling for second source
+ * components. In other words, if type is "touchscreen", then all device
+ * nodes named "touchscreen*" are the ones that need probing. There cannot
+ * be another "touchscreen" node that is already enabled.
+ *
+ * Assumes that for each "type" of component, only one actually exists. In
+ * other words, only one matching and existing device will be enabled.
+ *
+ * Context: Process context only. Does non-atomic I2C transfers.
+ *          Should only be used from a driver probe function, as the function
+ *          can return -EPROBE_DEFER if the I2C adapter is unavailable.
+ * Return: 0 on success or no-op, error code otherwise.
+ *         A no-op can happen when it seems like the device tree already
+ *         has components of the type to be probed already enabled. This
+ *         can happen when the device tree had not been updated to mark
+ *         the status of the to-be-probed components as "fail". Or this
+ *         function was already run with the same parameters and succeeded
+ *         in enabling a component. The latter could happen if the user
+ *         had multiple types of components to probe, and one of them down
+ *         the list caused a deferred probe. This is expected behavior.
+ */
+int i2c_of_probe_component(struct device *dev, const char *type)
+{
+	struct i2c_adapter *i2c;
+	int ret;
+
+	struct device_node *i2c_node __free(device_node) = i2c_of_probe_get_i2c_node(dev, type);
+	if (IS_ERR(i2c_node))
+		return PTR_ERR(i2c_node);
+
+	for_each_child_of_node_scoped(i2c_node, node) {
+		if (!of_node_name_prefix(node, type))
+			continue;
+		if (!of_device_is_available(node))
+			continue;
+
+		/*
+		 * Device tree has component already enabled. Either the
+		 * device tree isn't supported or we already probed once.
+		 */
+		return 0;
+	}
+
+	i2c = of_get_i2c_adapter_by_node(i2c_node);
+	if (!i2c)
+		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
+
+	ret = 0;
+	for_each_child_of_node_scoped(i2c_node, node) {
+		union i2c_smbus_data data;
+		u32 addr;
+
+		if (!of_node_name_prefix(node, type))
+			continue;
+		if (of_property_read_u32(node, "reg", &addr))
+			continue;
+		if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
+			continue;
+
+		/* Found a device that is responding */
+		ret = i2c_of_probe_enable_node(dev, node);
+		break;
+	}
+
+	i2c_put_adapter(i2c);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i2c_of_probe_component);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 377def497298..4c48ea93ec49 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1030,6 +1030,10 @@ const struct of_device_id
 int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 			  struct i2c_board_info *info);
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+int i2c_of_probe_component(struct device *dev, const char *type);
+#endif
+
 #else
 
 static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
-- 
2.46.0.184.g6999bdac58-goog


