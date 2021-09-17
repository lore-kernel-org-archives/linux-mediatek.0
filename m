Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CAEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:58:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E5EB610C7
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E5EB610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwoxPERdKBvB8JgU5S5ihjQ8PuJfjA97yxba3iRcs/M=; b=u/mn2qC5GJ54/s
	mGJ98pKExUhmL0gj4LJXgg1s3YQtpbTBT9j9IXq7cCSt5RahQmAs8zvqB1dbfhRGzXYilHqjF/5uZ
	v2QU71cH64xlaD8DBat968qsc5OPFezZ259mD2L2uy4kAXnpdPxxOm5BqPNDcqDdX4Pw0NBRA968B
	I3m7x/GjpCR6KISZuzxa8T4q9Y5GALWYG9N9329NKAdfsd5imvs4fR89C6BE53CQyKVCoO5j2b4C8
	6ocvCMmZuNRlSWr5aKTBD0YXS3HSBGX3xuBYT2TbgNoZIPsQJQYmcNdkx62nn++Vcq81AziuLY5Cs
	3rLZcytXhfKV4kG7BifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRDRk-00EDHD-4m; Fri, 17 Sep 2021 12:58:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRDRI-00ED4Y-T9
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 12:58:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso9920218wmb.2
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Sep 2021 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5OvK6rAM51FXadQ9HCCAo1nDCyjKMMChivM3w7j7uc=;
 b=eGbAxd0RK5cxQWiBRoDzRjyFcyMn7M/eBSrwbZMorRDrBHyNh4tqr35S8hZL1zQklf
 RBiPTeB08MrRxL0kav7kVnBYC3mvabfvI50ICHvrgiqYvzsX/4onFFutFzvjeFkCVdQ/
 bVgUFe6XzFBkePmRam+R2PSqjEnY479IeT5wuX4i7pF177s7lzDdWvdm5igsQEoKSM1f
 S4f7zns2RaZg65Lmn7EyKCY2aKpI4tD0Mq83PlI9Gf7ke9lJp8JalDULeU/ctPjGweOR
 /H5SXb9HXeusY/cT0l2DURVOcyUTmg6ggcaQ4N8iw5rDeLFJm7NE699FYbhO/1WEHEEI
 bZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5OvK6rAM51FXadQ9HCCAo1nDCyjKMMChivM3w7j7uc=;
 b=gJfNwgyBGUxA/Dx0AxhfRo7v5jOwPLFVVH6gaOdZ4RjL20wqtnwumEbzYZwrm9qTJU
 EuOR4xeMj4BjxEzx5y6ZMMLmRF5D4BtTRw0+jlS1q+eckYtj6v+yGVy1gJjI3AL821bg
 ucQMEIYdIu2IHXgfACFQpVKhzRWyzvH7gJvXIjf0eNmzXK+XTg4kqDJR1cJFLJaTQ940
 5/xZN25W9hWJgbwWaUydn0elSTsStwDa9OM1mCRER4lDCu7xXSNh5XHwT7PDhHsYkn+X
 5DxewdrNMstfkoVZRYvyESMe7963kWWqUHBIQ1A04A4IE6buLO+JVrdUm/379UYhRiIh
 LZrQ==
X-Gm-Message-State: AOAM532O7w2lZ9nMhmaDo+jQchLa44mqBxee1+RdJICfnOSp21tbFHEk
 YgeVaPKK6V87hSoh3uhPEg8E7w==
X-Google-Smtp-Source: ABdhPJwiH/6gX7ZX2P33uYpMlaxknnvLf6Knho3tfcfF2fd3161qyj87sKWlfvIfg6IfLTt4G9AEdg==
X-Received: by 2002:a05:600c:3392:: with SMTP id
 o18mr14906465wmp.92.1631883479342; 
 Fri, 17 Sep 2021 05:57:59 -0700 (PDT)
Received: from localhost.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:57:58 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, gpain@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 3/4] rpmsg: Add support of AI Processor Unit (APU)
Date: Fri, 17 Sep 2021 14:59:44 +0200
Message-Id: <20210917125945.620097-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917125945.620097-1-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_055800_973237_AEBD32C3 
X-CRM114-Status: GOOD (  22.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some Mediatek SoC provides hardware accelerator for AI / ML.
This driver use the DRM driver to manage the shared memory,
and use rpmsg to execute jobs on the APU.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/rpmsg/Kconfig     |  10 +++
 drivers/rpmsg/Makefile    |   1 +
 drivers/rpmsg/apu_rpmsg.c | 184 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/rpmsg/apu_rpmsg.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0b4407abdf138..fc1668f795004 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -73,4 +73,14 @@ config RPMSG_VIRTIO
 	select RPMSG_NS
 	select VIRTIO
 
+config RPMSG_APU
+	tristate "APU RPMSG driver"
+	select REMOTEPROC
+	select RPMSG_VIRTIO
+	select DRM_APU
+	help
+	  This provides a RPMSG driver that provides some facilities to
+	  communicate with an accelerated processing unit (APU).
+	  This Uses the APU DRM driver to manage memory and job scheduling.
+
 endmenu
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee3..8b336b9a817c1 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
 obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
 obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
+obj-$(CONFIG_RPMSG_APU)		+= apu_rpmsg.o
diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
new file mode 100644
index 0000000000000..7e504bd176a4d
--- /dev/null
+++ b/drivers/rpmsg/apu_rpmsg.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2020 BayLibre SAS
+
+#include <asm/cacheflush.h>
+
+#include <linux/cdev.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/iova.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <drm/apu_drm.h>
+
+#include "rpmsg_internal.h"
+
+#define APU_RPMSG_SERVICE_MT8183 "rpmsg-mt8183-apu0"
+
+struct rpmsg_apu {
+	struct apu_core *core;
+	struct rpmsg_device *rpdev;
+};
+
+static int apu_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int count,
+			      void *priv, u32 addr)
+{
+	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
+	struct apu_core *apu_core = apu->core;
+
+	return apu_drm_callback(apu_core, data, count);
+}
+
+static int apu_rpmsg_send(struct apu_core *apu_core, void *data, int len)
+{
+	struct rpmsg_apu *apu = apu_drm_priv(apu_core);
+	struct rpmsg_device *rpdev = apu->rpdev;
+
+	return rpmsg_send(rpdev->ept, data, len);
+}
+
+static struct apu_drm_ops apu_rpmsg_ops = {
+	.send = apu_rpmsg_send,
+};
+
+static int apu_init_iovad(struct rproc *rproc, struct rpmsg_apu *apu)
+{
+	struct resource_table *table;
+	struct fw_rsc_carveout *rsc;
+	int i;
+
+	if (!rproc->table_ptr) {
+		dev_err(&apu->rpdev->dev,
+			"No resource_table: has the firmware been loaded ?\n");
+		return -ENODEV;
+	}
+
+	table = rproc->table_ptr;
+	for (i = 0; i < table->num; i++) {
+		int offset = table->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table + offset;
+
+		if (hdr->type != RSC_CARVEOUT)
+			continue;
+
+		rsc = (void *)hdr + sizeof(*hdr);
+		if (apu_drm_reserve_iova(apu->core, rsc->da, rsc->len)) {
+			dev_err(&apu->rpdev->dev,
+				"failed to reserve iova\n");
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static struct rproc *apu_get_rproc(struct rpmsg_device *rpdev)
+{
+	/*
+	 * To work, the APU RPMsg driver need to get the rproc device.
+	 * Currently, we only use virtio so we could use that to find the
+	 * remoteproc parent.
+	 */
+	if (!rpdev->dev.parent && rpdev->dev.parent->bus) {
+		dev_err(&rpdev->dev, "invalid rpmsg device\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (strcmp(rpdev->dev.parent->bus->name, "virtio")) {
+		dev_err(&rpdev->dev, "unsupported bus\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return vdev_to_rproc(dev_to_virtio(rpdev->dev.parent));
+}
+
+static int apu_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_apu *apu;
+	struct rproc *rproc;
+	int ret;
+
+	apu = devm_kzalloc(&rpdev->dev, sizeof(*apu), GFP_KERNEL);
+	if (!apu)
+		return -ENOMEM;
+	apu->rpdev = rpdev;
+
+	rproc = apu_get_rproc(rpdev);
+	if (IS_ERR_OR_NULL(rproc))
+		return PTR_ERR(rproc);
+
+	/* Make device dma capable by inheriting from parent's capabilities */
+	set_dma_ops(&rpdev->dev, get_dma_ops(rproc->dev.parent));
+
+	ret = dma_coerce_mask_and_coherent(&rpdev->dev,
+					   dma_get_mask(rproc->dev.parent));
+	if (ret)
+		goto err_put_device;
+
+	rpdev->dev.iommu_group = rproc->dev.parent->iommu_group;
+
+	apu->core = apu_drm_register_core(rproc, &apu_rpmsg_ops, apu);
+	if (!apu->core) {
+		ret = -ENODEV;
+		goto err_put_device;
+	}
+
+	ret = apu_init_iovad(rproc, apu);
+
+	dev_set_drvdata(&rpdev->dev, apu);
+
+	return ret;
+
+err_put_device:
+	devm_kfree(&rpdev->dev, apu);
+
+	return ret;
+}
+
+static void apu_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
+
+	apu_drm_unregister_core(apu);
+	devm_kfree(&rpdev->dev, apu);
+}
+
+static const struct rpmsg_device_id apu_rpmsg_match[] = {
+	{ APU_RPMSG_SERVICE_MT8183 },
+	{}
+};
+
+static struct rpmsg_driver apu_rpmsg_driver = {
+	.probe = apu_rpmsg_probe,
+	.remove = apu_rpmsg_remove,
+	.callback = apu_rpmsg_callback,
+	.id_table = apu_rpmsg_match,
+	.drv  = {
+		.name  = "apu_rpmsg",
+	},
+};
+
+static int __init apu_rpmsg_init(void)
+{
+	return register_rpmsg_driver(&apu_rpmsg_driver);
+}
+arch_initcall(apu_rpmsg_init);
+
+static void __exit apu_rpmsg_exit(void)
+{
+	unregister_rpmsg_driver(&apu_rpmsg_driver);
+}
+module_exit(apu_rpmsg_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("APU RPMSG driver");
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
