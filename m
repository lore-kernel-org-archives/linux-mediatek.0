Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D1CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ed6jqfoQQgVNg3s8z2id6R5BmVDPgmpZejNIbOkDt8=; b=ESoLUW7GxGTDy5chcQ1rg/1qMi
	5pHz40JQWAkM6K/nEHxVsPAFXusLQNfu0Rqx5BP7h+htMv8UYjOh2R4iVKTJxaE8ifNtJ8Q8OT+HI
	eGnNW7F3iEq3Kc3SPl3cGcCqF75qKAZwxyS8Ik4Wy5GW78/Dz5J9QsSFJUczG600w9bWtDJ+vF6lw
	mootsL2WadGniz5AghobomR8qAWtJJJC3qjZ7WBxyOromvmHvH0gD7cZgnrCTN37taA4xM6U8EVwl
	EAh7RBLOo9/BQHqMXd8AO76OXzvHi6GN/PhrzL79ExsIArQWR/NO+fqtWDslTd33j/FRPOF2DClbd
	HptXhRJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmVd-00000003jLK-3SYD;
	Wed, 04 Sep 2024 09:41:05 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllsj-00000003Yxk-1ZLF
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 09:00:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7176645e4daso1905436b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440452; x=1726045252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ed6jqfoQQgVNg3s8z2id6R5BmVDPgmpZejNIbOkDt8=;
        b=bn1/WIpIYODIWQ/6kDNY+2kxUYB8/ituCbC7/Puuy6R0hZBxhYOPRJHiRy/Z01kg9v
         0bs5+DH3MdQ9B3OaaQArD7XVb4qFYWNJzxuKMBugoiKFqKB7bvBR9crcsiFOigFmiHCp
         WxGZwQRM/8XUdGYvLrLraq1HnlJAwsRZe+Ry0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440452; x=1726045252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ed6jqfoQQgVNg3s8z2id6R5BmVDPgmpZejNIbOkDt8=;
        b=GzEs5netLmqZ6syJS5SZdIrFEg1iEkr72JKldtRAe7d045MWtoIhvnbxGcbjeItPO9
         QxokEorKT+7X0ZhILtuA5gAI8yp+SY5XXIOLC1SSjvBvLF+1RqxXZKgQ7RESzfHdXbDE
         eL+e8bPVueN4bw4JtlMCHuSiZ1v+lIOBY+e5XA7sGmETyXhM9hQQVdnDiu+fY8MiEZro
         1s9Q8nIqICYhwoFGdRPf8I6c7laqEyMWB0NQeWsdrqL6cegmNtfmGiAEXG0W9lMp6xKp
         kkp2AKynLzUW8jwznUndFuRxNiloK97mgGsebeyjs6KQBtLW4AU4SUNa4/izdNDZrmuO
         ycsg==
X-Forwarded-Encrypted: i=1; AJvYcCWuDt9Z+wh08tqZj5k2Vc/5zb0zIGXmKQKlrbfqTlYna0g2FJWMqZG4tUqx6C3F507n8Jm67JGtp+tNpgNDgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK7bNv2n/ZK3YDyju7kmeJ/2QeWhZEIRrcCPDx90gJUpzYCeke
	7S16D4a5Wff5gzHSKtdX31RigbjNKMQyhkPkg8L9mixIRsrNFmv0gN2wX16sBQ==
X-Google-Smtp-Source: AGHT+IHgy+GLE/Elk7AlgRjkOzPzYZQvWSrVWrXb8ZopFFo9Tqw+tlmxWy6NqFA6LVTclmTWOYnewQ==
X-Received: by 2002:a05:6a00:2da8:b0:70e:8070:f9d0 with SMTP id d2e1a72fcca58-7173fa40bcfmr10345406b3a.9.1725440452151;
        Wed, 04 Sep 2024 02:00:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:51 -0700 (PDT)
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
Subject: [PATCH v6 08/12] i2c: Introduce OF component probe function
Date: Wed,  4 Sep 2024 17:00:10 +0800
Message-ID: <20240904090016.2841572-9-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020053_467421_F56435F9 
X-CRM114-Status: GOOD (  40.94  )
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
Changes since v5:
- Fixed indent in Makefile
- Split regulator and GPIO TODO items
- Reversed final conditional in i2c_of_probe_enable_node()

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
 drivers/i2c/i2c-core-of-prober.c | 158 +++++++++++++++++++++++++++++++
 include/linux/i2c.h              |   4 +
 3 files changed, 163 insertions(+)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c

diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index f12d6b10a85e..c539cdc1e305 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -9,6 +9,7 @@ i2c-core-objs			:= i2c-core-base.o i2c-core-smbus.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
 i2c-core-$(CONFIG_I2C_SLAVE)	+= i2c-core-slave.o
 i2c-core-$(CONFIG_OF)		+= i2c-core-of.o
+i2c-core-$(CONFIG_OF_DYNAMIC)	+= i2c-core-of-prober.o
 
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
new file mode 100644
index 000000000000..64d7631f4885
--- /dev/null
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -0,0 +1,158 @@
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
+ * - Support handling common regulators.
+ * - Support handling common GPIOs.
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
+	if (ret) {
+		/* ocs needs to be explicitly cleaned up before being freed. */
+		of_changeset_destroy(ocs);
+	} else {
+		/*
+		 * ocs is intentionally kept around as it needs to
+		 * exist as long as the change is applied.
+		 */
+		void *ptr __always_unused = no_free_ptr(ocs);
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
index 388ce71a29a9..c6c16731243d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1033,6 +1033,10 @@ const struct of_device_id
 int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 			  struct i2c_board_info *info);
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+int i2c_of_probe_component(struct device *dev, const char *type);
+#endif
+
 #else
 
 static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
-- 
2.46.0.469.g59c65b2a67-goog


