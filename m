Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4EAC04E83
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rs4qbwNofKphTE2zreJeFqCc6xRNAsKGF5LoBHdl0a8=; b=o5MtiBCv61kiPZhsp5pAJODntd
	hn35n4qEgjU5R+hySJUIQZDgWEHTpfrD3oHDPdlF3HDmFSdfWER9josuQkVwfr7gEA6KTHKk1o4aP
	Dj4zoMhAl6Gl/+KzPoHSifoaVYC0PheEhDllWDwv9M2hBXw+lzhhaCrhlr59Gpty6Ss5YaxacdMnc
	eH0yKyziUjSxpY39Sf49x8faooiRFBZzYADJ0fFMPXqYBxcyhUXfP23G0N1hXLb3yjCoTjr9DB1Em
	WI8TZ8FA3T0Pt/pwaxm60I4cMS6LM4d9EVIROvanM66IrIsAcZsU3fKh2JtH7Qjb5YsSzpRs7KtRK
	sf0naCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wL-005rys-1X;
	Thu, 09 Nov 2023 10:07:09 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wH-005rue-2V
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 10:07:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-565334377d0so563745a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524424; x=1700129224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs4qbwNofKphTE2zreJeFqCc6xRNAsKGF5LoBHdl0a8=;
        b=c2QpAPKtE7vc8SsV6a3d1Ki+Fe94lr5ycdP7B7xpVVIpy6Xs0aKd4nOy/12hYLvERS
         E8ijzsyLYtkTgEluZbQeRv9w7dTiCu+d8tYFzvm57Wbg/FGzMP0G9PIG0aDTH+J8zHO4
         1aGeGSs8myTKLMcyGoUEWsKQO98n4IBQE0dEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524424; x=1700129224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs4qbwNofKphTE2zreJeFqCc6xRNAsKGF5LoBHdl0a8=;
        b=YRwODEdxX06YRSqZkDzVyBaHzS23WytKIOLvtbKqHGv6eBMORdL7RSAQmEfvkvBbGg
         cGsDsTAgcOifAxyZvVmzOz14AJBXCvDgFVVw+bJVZe/S1b3S7lfvTH0IHC2+fvVtCaek
         07uv6ECb0E/BOV1mwM0fMWO9HtIKDpxhj1gXbNoMsC/xWXme2T9qvS+udN0iw2V+9AJ8
         ghRsOUIntBm+TZJwbYLcuYiJK+cgthTwyU7nJrljcCmvxlxk3FPtqi018muB1+V8FaGL
         x65+RdHbYHZWWiT0tNfdvB10lFEZe8Q8DEb0hioKomynwjjFdNP61nE12fMcfsh+sK2M
         5Yug==
X-Gm-Message-State: AOJu0YxhOQNI+nbJx+poOTQO4FODENc3gax2DOauoVq4YNmQ2xFrWcs4
	7jpydjt9OqNZjGUgXM0LB8R9Rw==
X-Google-Smtp-Source: AGHT+IHWUtsr4bhvzCEP1VHdQwxeHKMo7QV044imQ44mdSODoeojv4KtXVlrqKklo16HOdu2p0mAvw==
X-Received: by 2002:a17:902:f807:b0:1c9:b2c1:139c with SMTP id ix7-20020a170902f80700b001c9b2c1139cmr4180478plb.62.1699524423943;
        Thu, 09 Nov 2023 02:07:03 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:07:03 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
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
	petr.tesarik.ext@huawei.com,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH v2 5/7] of: hw_prober: Support Chromebook SKU ID based component selection
Date: Thu,  9 Nov 2023 18:06:02 +0800
Message-ID: <20231109100606.1245545-6-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020705_817351_FD114FD5 
X-CRM114-Status: GOOD (  25.75  )
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

In cases where the same Chromebook model is manufactured with different
components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
touchscreens with conflicting addresses), a different SKU ID is
allocated to each specific combination. This SKU ID is exported by the
bootloader into the device tree, and can be used to "discover" which
combination is present on the current machine.

This change adds a hardware prober that will match the SKU ID against
a provided table, and enable the component for the matched entry based
on the given compatible string. In the MIPI DSI panel and MIPI CSI
camera sensor cases which have OF graphs, it will also update the
remote endpoint to point to the enabled component. This assumes a single
endpoint only.

This will provide a path to reducing the number of Chromebook device
trees.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/of/hw_prober.c | 160 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/of/hw_prober.c b/drivers/of/hw_prober.c
index 442da6eff896..4345e5aed6d8 100644
--- a/drivers/of/hw_prober.c
+++ b/drivers/of/hw_prober.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
 #define DRV_NAME	"hw_prober"
@@ -108,9 +109,168 @@ static int i2c_component_prober(struct platform_device *pdev, const void *data)
 	return ret;
 }
 
+static int cros_get_coreboot_sku_id(struct device *dev, u32 *sku_id)
+{
+	struct device_node *node = NULL;
+	int ret;
+
+	node = of_find_node_by_path("/firmware/coreboot");
+	if (!node)
+		return dev_err_probe(dev, -EINVAL, "Cannot find coreboot firmware node\n");
+
+	ret = of_property_read_u32(node, "sku-id", sku_id);
+	if (ret)
+		dev_err_probe(dev, ret, "Cannot get SKU ID\n");
+
+	of_node_put(node);
+	return ret;
+}
+
+struct cros_sku_option {
+	u32	sku_id_val;
+	u32	sku_id_mask;
+	const char *compatible;
+};
+
+struct cros_sku_component_data {
+	const struct cros_sku_option *options;
+	int num_options;
+};
+
+/*
+ * cros_sku_component_selector - Selectively enable a component based on SKU ID
+ *
+ * Based on the list of component options and SKU ID read back from the device
+ * tree, enable the matching component. Also update the OF graph if it exists,
+ * so that the enabled component's remote endpoint correctly points to it. This
+ * assumes a single local endpoint, which should be the case for panels and
+ * camera sensors.
+ */
+static int cros_sku_component_selector(struct platform_device *pdev, const void *data)
+{
+	const struct cros_sku_component_data *pdata = data;
+	const char *compatible;
+	struct device_node *node = NULL, *endpoint = NULL, *remote = NULL;
+	struct property *status_prop = NULL, *endpoint_prop = NULL;
+	struct of_changeset *ocs = NULL;
+	__be32 *val = NULL;
+	int ret, i;
+	u32 sku_id;
+
+	if (!data)
+		return dev_err_probe(&pdev->dev, -EINVAL, "No data given\n");
+
+	ret = cros_get_coreboot_sku_id(&pdev->dev, &sku_id);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < pdata->num_options; i++)
+		if ((sku_id & pdata->options[i].sku_id_mask) == pdata->options[i].sku_id_val) {
+			compatible = pdata->options->compatible;
+			break;
+		}
+
+	if (i == pdata->num_options)
+		return dev_err_probe(&pdev->dev, -EINVAL, "Unknown SKU ID: 0x%x\n", sku_id);
+
+	node = of_find_compatible_node(NULL, NULL, compatible);
+	if (!node)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Cannot find matching device node\n");
+
+	/* device node not marked as fail; don't mess with the device tree */
+	if (!of_device_is_fail(node))
+		goto err_free;
+
+	dev_info(&pdev->dev, "Enabling %pOF for SKU 0x%x\n", node, sku_id);
+
+	ret = -ENOMEM;
+	ocs = kzalloc(sizeof(*ocs), GFP_KERNEL);
+	if (!ocs)
+		goto err_free;
+
+	status_prop = kzalloc(sizeof(*status_prop), GFP_KERNEL);
+	if (!status_prop)
+		goto err_free;
+
+	status_prop->name   = "status";
+	status_prop->length = 5;
+	status_prop->value  = "okay";
+
+	/* Create changeset to apply DT changes atomically */
+	of_changeset_init(ocs);
+
+	if (of_graph_is_present(node)) {
+		ret = -EINVAL;
+
+		/* This currently assumes a single port on the component. */
+		endpoint = of_graph_get_next_endpoint(node, NULL);
+		if (!endpoint) {
+			dev_err(&pdev->dev, "No endpoint found for %pOF\n", node);
+			goto err_destroy_ocs;
+		}
+
+		remote = of_graph_get_remote_endpoint(endpoint);
+		if (!remote) {
+			dev_err(&pdev->dev, "No remote endpoint node found for %pOF\n", endpoint);
+			goto err_destroy_ocs;
+		}
+
+		endpoint_prop = kzalloc(sizeof(*endpoint_prop), GFP_KERNEL);
+		if (!endpoint_prop)
+			goto err_destroy_ocs;
+
+		val = kzalloc(sizeof(*val), GFP_KERNEL);
+		if (!val)
+			goto err_destroy_ocs;
+
+		*val = cpu_to_be32(endpoint->phandle);
+		endpoint_prop->name   = "remote-endpoint";
+		endpoint_prop->length = sizeof(*val);
+		endpoint_prop->value  = val;
+
+		ret = of_changeset_update_property(ocs, node, endpoint_prop);
+		if (ret)
+			goto err_destroy_ocs;
+	}
+
+	ret = of_changeset_update_property(ocs, node, status_prop);
+	if (ret)
+		goto err_destroy_ocs;
+	ret = of_changeset_apply(ocs);
+	if (ret)
+		goto err_destroy_ocs;
+
+	of_node_put(node);
+
+	return 0;
+
+err_destroy_ocs:
+	of_node_put(remote);
+	of_node_put(endpoint);
+	kfree(val);
+	kfree(endpoint_prop);
+	of_changeset_destroy(ocs);
+err_free:
+	kfree(ocs);
+	kfree(status_prop);
+	of_node_put(node);
+	return ret;
+}
+
+static const struct cros_sku_option cros_krane_panel_options[] = {
+	{ .sku_id_val = 0x00, .sku_id_mask = 0xf0, .compatible = "auo,kd101n80-45na" },
+	{ .sku_id_val = 0xb0, .sku_id_mask = 0xf0, .compatible = "boe,tv101wum-nl6" },
+};
+
+static const struct cros_sku_component_data cros_krane_panel_data = {
+	.options     = cros_krane_panel_options,
+	.num_options = ARRAY_SIZE(cros_krane_panel_options),
+};
+
 static const struct hw_prober_entry hw_prober_platforms[] = {
 	{ .compatible = "google,hana", .prober = i2c_component_prober, .data = "touchscreen" },
 	{ .compatible = "google,hana", .prober = i2c_component_prober, .data = "trackpad" },
+	{ .compatible = "google,krane", .prober = cros_sku_component_selector, .data = &cros_krane_panel_data },
 };
 
 static int hw_prober_probe(struct platform_device *pdev)
-- 
2.42.0.869.gea05f2083d-goog


