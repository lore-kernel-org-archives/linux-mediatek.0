Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39A4EE0211
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVhbTxLURsXagkjV6T5t8snpx3JbKq5qtkesVJ+9OU0=; b=MkN/oy0SIWf/quLZQElkTvrOYJ
	NP1EaHB0KxXkRwWOtQ5Sw+Nk0wtgzmIKQSbueo8jUrPs33Bqj1UidMFB8QPruKg/zAVp/lzgnKuPv
	08ihh6Q2Np1x9tnCwpyURuCn8jvBvtlpfASCEszhD+c9BG2zTdjzS9A/XIjJEdo8dFd3fMf70snAE
	4XArs17yArQaXQwco2sFHs+OFoN7MnH7wPZy4d1dbzaPl0e7dbFDtaAst4PGy2oplHJY65DHOoLxS
	3Okvm5rLPLuoScF7SmgqOTCU+JY8y+83H3a/23wuaYAxUDFdJcf1Nz63EJkrlbiZy/IIMOGberdFy
	wDmCKP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHum-00000008T5T-2wRh;
	Wed, 11 Sep 2024 07:37:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHmO-00000008Qr5-2oYN
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:28:46 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-717849c0dcaso5990934b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039723; x=1726644523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVhbTxLURsXagkjV6T5t8snpx3JbKq5qtkesVJ+9OU0=;
        b=LjznuO7vyOhEcli+8Hwxr6lad89cdWBH4ULELuZOsbiLm8D4ueR9hXPzoEuHL9syoG
         uyf7K7t+nYPbPi9J6evEItfVGAMwzdCTLi17A2/LCy0jqAqyz2SMQR6kdKHlUBHogSJR
         wP8n16usToQQFW35PpKMeAVDcBn2H6VCnxw/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039723; x=1726644523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVhbTxLURsXagkjV6T5t8snpx3JbKq5qtkesVJ+9OU0=;
        b=BEuoE6Cb7e5Y/m2ytB2RCN68tVG2VctZHCyG6pgrYu+HFEmx6HjSksiXCunNBdIcv+
         6qleR1+/iID301RlXq7rFHyd4h50GrYuKCxSETLTN/UCRUgU2Zywe6hQ0S5QdoNwhCIw
         QAion5LL8PnJFAlmtLQ4BKUYXHdM3AaWR3Mv3n0rm3Dp+E3hIZEITTLWZIvLSP/wMZhh
         srEzoKU/KnP/sdsYlWidlViYHatjGa1JRsOpmwAp4SnDqBffJs341YcAtevgXybQWUoq
         NTNS6DKBFwGYWpY8EnjlUlQ3GWk3N4woRSeD9JoI/rranEd3codJJtyukzsk5glmfqNB
         2CFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnodN2yKHtjkk62hTUcAJyUnjEaXXjQCyJ9OPDsUNbPeQSX8pM0MYhDrHZCvMS2R5Olj4omFxITSozmmZkDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4OVRt06C1PinkTzbfTxmB/NcE4unWfqxKpBeszBgzwbRJvaTC
	cP4vBDEbgy7GR+qiwjLGIi+v0N0pqGgnOrvoyWCqEx6H8IbVLp0tQqOS557Yzg==
X-Google-Smtp-Source: AGHT+IHJHP/sS0c8oI4sQVmWMgfIt7DzJlolRs9q3i3C6TrZ9TAHcWiYmt8L4UpiwKLjhWZ/rnLTPA==
X-Received: by 2002:a05:6a20:cf90:b0:1cf:5437:e76f with SMTP id adf61e73a8af0-1cf5e098306mr4519928637.4.1726039723417;
        Wed, 11 Sep 2024 00:28:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:43 -0700 (PDT)
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
Subject: [PATCH v7 07/10] i2c: of-prober: Add simple helpers for regulator support
Date: Wed, 11 Sep 2024 15:27:45 +0800
Message-ID: <20240911072751.365361-8-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_002844_795990_295EAE92 
X-CRM114-Status: GOOD (  29.55  )
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

Add helpers to do regulator management for the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
GPIOs will be handled in the next patch.

The assumption is that the same class of components to be probed are
always connected in the same fashion with the same regulator supply
and GPIO. The names may vary due to binding differences, but the
physical layout does not change.

This set of helpers supports at most one regulator supply. The user
must specify the node from which the supply is retrieved. The supply
name and the amount of time to wait after the supply is enabled are
also given by the user.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- Moved change of of_get_next_child_scoped() to
  of_get_next_child_with_prefix() to previous patch
- Restructured into helpers for the I2C OF component prober
- Reduced to only handle one regulator
- Commit message updated

Changes since v5:
- Split of_regulator_bulk_get_all() return value check and explain
  "ret == 0" case
- Switched to of_get_next_child_with_prefix_scoped() where applicable
- Used krealloc_array() instead of directly calculating size
- copy whole regulator array in one memcpy() call
- Drop "0" from struct zeroing initializer
- Split out regulator helper from i2c_of_probe_enable_res() to keep
  code cleaner when combined with the next patch
- Added options for customizing power sequencing delay
- Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
- Add i2c_of_probe_free_regulator() helper

Changes since v4:
- Split out GPIO handling to separate patch
- Rewrote using of_regulator_bulk_get_all()
- Replaced "regulators" with "regulator supplies" in debug messages

Changes since v3:
- New patch

This change is kept as a separate patch for now since the changes are
quite numerous.
---
 drivers/i2c/i2c-core-of-prober.c | 169 ++++++++++++++++++++++++++++++-
 include/linux/i2c-of-prober.h    |  48 +++++++++
 2 files changed, 216 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 62ff2f4b6177..1371ea565556 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
@@ -13,6 +14,7 @@
 #include <linux/i2c-of-prober.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 /*
@@ -28,7 +30,6 @@
  * address responds.
  *
  * TODO:
- * - Support handling common regulators.
  * - Support handling common GPIOs.
  * - Support I2C muxes
  */
@@ -193,3 +194,169 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_component, I2C_OF_PROBER);
+
+static int i2c_of_probe_simple_get_supply(struct device *dev, struct device_node *node,
+					  struct i2c_of_probe_simple_ctx *ctx)
+{
+	const char *supply_name;
+	struct regulator *supply;
+
+	/*
+	 * It's entirely possible for the component's device node to not have regulator
+	 * supplies. While it does not make sense from a hardware perspective, the
+	 * supplies could be always on or otherwise not modeled in the device tree, but
+	 * the device would still work.
+	 */
+	supply_name = ctx->opts->supply_name;
+	if (!supply_name)
+		return 0;
+
+	supply = of_regulator_get_optional(dev, node, supply_name);
+	if (IS_ERR(supply)) {
+		return dev_err_probe(dev, PTR_ERR(supply),
+				     "Failed to get regulator supply \"%s\" from %pOF\n",
+				     supply_name, node);
+	}
+
+	ctx->supply = supply;
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_put_supply(struct i2c_of_probe_simple_ctx *ctx)
+{
+	regulator_put(ctx->supply);
+	ctx->supply = NULL;
+}
+
+static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	int ret;
+
+	if (!ctx->supply)
+		return 0;
+
+	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
+
+	ret = regulator_enable(ctx->supply);
+	if (ret)
+		return ret;
+
+	msleep(ctx->opts->post_power_on_delay_ms);
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	if (!ctx->supply)
+		return;
+
+	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
+
+	regulator_disable(ctx->supply);
+}
+
+/**
+ * i2c_of_probe_simple_get_res - Simple helper for I2C OF prober to get resources
+ * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
+ * @bus_node: Pointer to the &struct device_node of the I2C adapter.
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * If &i2c_of_probe_simple_opts->supply_name is given, request the named regulator supply.
+ *
+ * Return: %0 on success or no-op, or a negative error number on failure.
+ */
+int i2c_of_probe_simple_get_res(struct device *dev, struct device_node *bus_node, void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+	struct device_node *node;
+	const char *compat;
+	int ret;
+
+	dev_dbg(dev, "Requesting resources for components under I2C bus %pOF\n", bus_node);
+
+	if (!ctx || !ctx->opts)
+		return -EINVAL;
+
+	compat = ctx->opts->res_node_compatible;
+	if (!compat)
+		return -EINVAL;
+
+	node = of_get_compatible_child(bus_node, compat);
+	if (!node)
+		return dev_err_probe(dev, -ENODEV, "No device compatible with \"%s\" found\n",
+				     compat);
+
+	ret = i2c_of_probe_simple_get_supply(dev, node, ctx);
+	if (ret)
+		goto out_put_node;
+
+	return 0;
+
+out_put_node:
+	of_node_put(node);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_get_res, I2C_OF_PROBER);
+
+/**
+ * i2c_of_probe_simple_free_res_late - Simple helper for I2C OF prober to release all resources.
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ */
+void i2c_of_probe_simple_free_res_late(void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+
+	i2c_of_probe_simple_put_supply(ctx);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_free_res_late, I2C_OF_PROBER);
+
+/**
+ * i2c_of_probe_simple_enable - Enable resources for I2C OF prober simple helpers
+ * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * If a regulator supply was found, enable that regulator.
+ *
+ * Return: %0 on success or no-op, or a negative error number on failure.
+ */
+int i2c_of_probe_simple_enable(struct device *dev, void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+	int ret;
+
+	ret = i2c_of_probe_simple_enable_regulator(dev, ctx);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_enable, I2C_OF_PROBER);
+
+/**
+ * i2c_of_probe_simple_cleanup - Clean up resources for I2C OF prober simple helpers
+ * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * If a regulator supply was found, disable that regulator.
+ *
+ * Return: %0 on success or no-op, or a negative error number on failure.
+ */
+int i2c_of_probe_simple_cleanup(struct device *dev, void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+
+	i2c_of_probe_simple_disable_regulator(dev, ctx);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, I2C_OF_PROBER);
+
+struct i2c_of_probe_ops i2c_of_probe_simple_ops = {
+	.get_resources = i2c_of_probe_simple_get_res,
+	.enable = i2c_of_probe_simple_enable,
+	.cleanup = i2c_of_probe_simple_cleanup,
+	.free_resources_late = i2c_of_probe_simple_free_res_late,
+};
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_ops, I2C_OF_PROBER);
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index 0f94e7c94310..541451fbf58d 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -68,6 +68,54 @@ struct i2c_of_probe_cfg {
 
 int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx);
 
+/**
+ * DOC: I2C OF component prober simple helpers
+ *
+ * Components such as trackpads are commonly connected to a devices baseboard
+ * with a 6-pin ribbon cable. That gives at most one voltage supply and one
+ * GPIO besides the I2C bus, interrupt pin, and common ground. Touchscreens,
+ * while integrated into the display panel's connection, typically have the
+ * same set of connections.
+ *
+ * A simple set of helpers are provided here for use with the I2C OF component
+ * prober. This implementation targets such components, allowing for at most
+ * one regulator supply.
+ *
+ * The following helpers are provided:
+ * * i2c_of_probe_simple_get_res()
+ * * i2c_of_probe_simple_free_res_late()
+ * * i2c_of_probe_simple_enable()
+ * * i2c_of_probe_simple_cleanup()
+ */
+
+/**
+ * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
+ * @res_node_compatible: Compatible string of device node to retrieve resources from.
+ * @supply_name: Name of regulator supply.
+ * @post_power_on_delay_ms: Delay in ms after regulators are powered on. Passed to msleep().
+ */
+struct i2c_of_probe_simple_opts {
+	const char *res_node_compatible;
+	const char *supply_name;
+	unsigned int post_power_on_delay_ms;
+};
+
+struct regulator;
+
+struct i2c_of_probe_simple_ctx {
+	/* public: provided by user before helpers are used. */
+	const struct i2c_of_probe_simple_opts *opts;
+	/* private: internal fields for helpers. */
+	struct regulator *supply;
+};
+
+int i2c_of_probe_simple_get_res(struct device *dev, struct device_node *bus_node, void *data);
+void i2c_of_probe_simple_free_res_late(void *data);
+int i2c_of_probe_simple_enable(struct device *dev, void *data);
+int i2c_of_probe_simple_cleanup(struct device *dev, void *data);
+
+extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
+
 #endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
 
 #endif /* _LINUX_I2C_OF_PROBER_H */
-- 
2.46.0.598.g6f2099f65c-goog


