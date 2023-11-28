Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0AAC07E98
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrIzkF3BPgnSgOC4+jRg+GY/s6tE7F98s9pAwcg2bLw=; b=xPfqkQyhfRvJtYBQg2EzoKz0ow
	hz5TXQ9BXFDsw/npB6b07kKIYYMEoO1VBlUO74IbriZpg97I5f4kcPWkJsDMZdUeGZaIm2Am/GKVL
	quRePLvvQBDMlKUUr1R7j/nnMx6LUsucX2k5wyu35ZfqaMvW0IbEuYsj6ti+25bMGu4SKyG5yHwfH
	nqGmow6KtJPJchmB2VDDAyZriQIew96HVOMc22gj6tiRGSQohQQglIm0VxMFsNHqdR0iuvjVJ54PP
	O12SvkwUovCFjYZPRxElPwD38/m3uKjDcTH/6VdOM9huk9R6pVK+jPXpF4u60SumcQt9VhDeNShq9
	hADJ8SsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tiW-004Za2-2h;
	Tue, 28 Nov 2023 08:45:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tiR-004ZXC-25
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Nov 2023 08:45:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cfbda041f3so21645175ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Nov 2023 00:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161111; x=1701765911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrIzkF3BPgnSgOC4+jRg+GY/s6tE7F98s9pAwcg2bLw=;
        b=Fv0xVCXdXMuCQsIF5aTfa14Dc/ELI3XsZY0R8JPSV5152DGnt2jhUwvCw67evIUC4s
         CLtOdPix1Cj8f0xh0/3OIPL6aLEX1kENv9DUy48DCUSfSxJYgkOoJMMBLpIgR3V2cuwH
         J/D6HfNEV46WIvpHSxhDl6++f1swk5DzK1H+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161111; x=1701765911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrIzkF3BPgnSgOC4+jRg+GY/s6tE7F98s9pAwcg2bLw=;
        b=eo670qUu1wg5APyQlxgtgvHRVNCGcUClV12zLD8Lj2vtIwC11P4uy4JikpZVs2PqwL
         0gVaW+A1lPK4XBW9ZBSiTgTZZ2LGeZE6Zc39J9dLTn6m8AlPR5klDIEnSVmsXV2/4/W6
         RGWChZ+y10FpuP2SC3gy/QtabOQPQrjH/Hc/nKeu4JxtDBK7pUAAq7QrojuKd+ZYMoyh
         s6h5dCFutShOhUanYq5P4P3ZU1HxDEHfoltt0C2h6AZcPug49Tsva/gIobRUMRgJ7276
         oypZO8g+73oa7tEmr937jIzqYjYQ9PY5RscX4hVFH7QtE2RXoGXxH0SG2dqdihKQ4Gqs
         Z6xw==
X-Gm-Message-State: AOJu0YzW21mxGC0H0ds+j/K9VpUj6NGIEmcQPvR5vaJuS7eIavkwTsdH
	scni8xtPCfKef0IihsNWjjo8/A==
X-Google-Smtp-Source: AGHT+IEJ8bYtjQkgtD3EytEtczIspfAvOpqGUCTKBUGdEVYLqzk3kuxJ5+ccBoS4ivRCvYA3p8TkZg==
X-Received: by 2002:a17:903:1ce:b0:1cf:c518:fa39 with SMTP id e14-20020a17090301ce00b001cfc518fa39mr7406158plh.19.1701161111196;
        Tue, 28 Nov 2023 00:45:11 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:10 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
Date: Tue, 28 Nov 2023 16:42:31 +0800
Message-ID: <20231128084236.157152-3-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128084236.157152-1-wenst@chromium.org>
References: <20231128084236.157152-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_004511_685110_D27A38AA 
X-CRM114-Status: GOOD (  30.61  )
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
 drivers/i2c/i2c-core-of.c | 110 ++++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h       |   4 ++
 2 files changed, 114 insertions(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..3a0b4986c585 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -217,4 +217,114 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 struct notifier_block i2c_of_notifier = {
 	.notifier_call = of_i2c_notify,
 };
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
+/**
+ * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
+ * @dev: &struct device of the caller, only used for dev_* printk messages
+ * @type: a string to match the device node name prefix to probe for
+ *
+ * Probe for possible I2C components of the same "type" on the same I2C bus
+ * that have their status marked as "fail".
+ */
+int i2c_of_probe_component(struct device *dev, const char *type)
+{
+	struct device_node *node, *i2c_node;
+	struct i2c_adapter *i2c;
+	struct of_changeset *ocs = NULL;
+	int ret;
+
+	node = of_find_node_by_name(NULL, type);
+	if (!node)
+		return dev_err_probe(dev, -ENODEV, "Could not find %s device node\n", type);
+
+	i2c_node = of_get_next_parent(node);
+	if (!of_node_name_eq(i2c_node, "i2c")) {
+		of_node_put(i2c_node);
+		return dev_err_probe(dev, -EINVAL, "%s device isn't on I2C bus\n", type);
+	}
+
+	for_each_child_of_node(i2c_node, node) {
+		if (!of_node_name_prefix(node, type))
+			continue;
+		if (of_device_is_available(node)) {
+			/*
+			 * Device tree has component already enabled. Either the
+			 * device tree isn't supported or we already probed once.
+			 */
+			of_node_put(node);
+			of_node_put(i2c_node);
+			return 0;
+		}
+	}
+
+	i2c = of_get_i2c_adapter_by_node(i2c_node);
+	if (!i2c) {
+		of_node_put(i2c_node);
+		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
+	}
+
+	ret = 0;
+	for_each_child_of_node(i2c_node, node) {
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
+		dev_info(dev, "Enabling %pOF\n", node);
+
+		ocs = kzalloc(sizeof(*ocs), GFP_KERNEL);
+		if (!ocs) {
+			ret = -ENOMEM;
+			goto err_put_node;
+		}
+
+		/* Found a device that is responding */
+		of_changeset_init(ocs);
+		ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
+		if (ret)
+			goto err_free_ocs;
+		ret = of_changeset_apply(ocs);
+		if (ret)
+			goto err_destroy_ocs;
+
+		of_node_put(node);
+		break;
+	}
+
+	i2c_put_adapter(i2c);
+	of_node_put(i2c_node);
+
+	return 0;
+
+err_destroy_ocs:
+	of_changeset_destroy(ocs);
+err_free_ocs:
+	kfree(ocs);
+err_put_node:
+	of_node_put(node);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i2c_of_probe_component);
 #endif /* CONFIG_OF_DYNAMIC */
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 0dae9db27538..75fbbd5a4b15 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -997,6 +997,10 @@ const struct of_device_id
 int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 			  struct i2c_board_info *info);
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+int i2c_of_probe_component(struct device *dev, const char *type);
+#endif
+
 #else
 
 static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
-- 
2.43.0.rc1.413.gea7ed67945-goog


