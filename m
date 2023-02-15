Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AD0C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBsjj8yAoR05wSmP0AQYji7nDGth0V9UXrMPpO8JlTw=; b=CMLqMYphtp09UdkR1rUsEikxvS
	v7mXOlvzoRKIuTDD/6Wy0pZtlGGSMv6mfvVHtwTn3uHHb2gpkXRXDpxg4YP0FNryDxRNDemB8DE1g
	vKPSOqj1bI8S2hZuXWnaOJoeYzDwkwfF9hofz6stk3HssJTJQdlI3v+kwekHSwws35k8fv4NaeprI
	MAU3T9Sbiw+wINvJxxp/t8ZmuhTN8/MHG7Hk62ETsXoF5fRGvOkR/Wsr/4qAI+G6HGR3APGErGnEr
	BnH93hwx8OYRY9KVXiF4KYY+nv16tOi0jTy8O9lAZhc78UV25XgEc8hNpZPOjn1j9oXcaxlUnqRmT
	wSW20sAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHqi-005zvQ-Ub; Wed, 15 Feb 2023 13:29:28 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHqf-005ztt-PD; Wed, 15 Feb 2023 13:29:27 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pSHq4-0005qU-1f;
	Wed, 15 Feb 2023 14:28:48 +0100
Date: Wed, 15 Feb 2023 13:27:11 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Sean Wang <sean.wang@mediatek.com>, Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mingming Su <Mingming.Su@mediatek.com>,
	linux-crypto@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwrng: add driver for MediaTek TRNG SMC
Message-ID: <89865515728cb937b6591160ad9c30b4bcc8dd41.1676467500.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_052925_836967_C41C7130 
X-CRM114-Status: GOOD (  21.84  )
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

Add driver providing kernel-side support for the Random Number
Generator hardware found on Mediatek SoCs which have a driver in ARM
TrustedFirmware-A allowing Linux to read random numbers using a
non-standard vendor-defined Secure Monitor Call.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 MAINTAINERS                         |  1 +
 drivers/char/hw_random/Kconfig      | 16 +++++++
 drivers/char/hw_random/Makefile     |  1 +
 drivers/char/hw_random/mtk-rng-v2.c | 74 +++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 drivers/char/hw_random/mtk-rng-v2.c

diff --git a/MAINTAINERS b/MAINTAINERS
index be167c695c64..90d82aba6d73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13148,6 +13148,7 @@ F:	drivers/leds/leds-mt6323.c
 MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
 M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
+F:	drivers/char/hw_random/mtk-rng-v2.c
 F:	drivers/char/hw_random/mtk-rng.c
 
 MEDIATEK SMI DRIVER
diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 4fdf07ae3c54..7c900185486d 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -439,6 +439,22 @@ config HW_RANDOM_MTK
 
 	  If unsure, say Y.
 
+config HW_RANDOM_MTK_V2
+	tristate "Mediatek Random Number Generator support (v2/SMC)"
+	depends on HW_RANDOM
+	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
+	default y
+	help
+	  This driver provides kernel-side support for the Random Number
+	  Generator hardware found on Mediatek SoCs which have a driver
+	  in ARM TrustedFirmware-A allowing Linux to read using a non-
+	  standard vendor-defined Secure Monitor Call.
+
+	  To compile this driver as a module, choose M here. the
+	  module will be called mtk-rng-v2.
+
+	  If unsure, say Y.
+
 config HW_RANDOM_S390
 	tristate "S390 True Random Number Generator support"
 	depends on S390
diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index 09bde4a0f971..ba319c509e86 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_HW_RANDOM_PIC32) += pic32-rng.o
 obj-$(CONFIG_HW_RANDOM_MESON) += meson-rng.o
 obj-$(CONFIG_HW_RANDOM_CAVIUM) += cavium-rng.o cavium-rng-vf.o
 obj-$(CONFIG_HW_RANDOM_MTK)	+= mtk-rng.o
+obj-$(CONFIG_HW_RANDOM_MTK_V2)	+= mtk-rng-v2.o
 obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
 obj-$(CONFIG_HW_RANDOM_KEYSTONE) += ks-sa-rng.o
 obj-$(CONFIG_HW_RANDOM_OPTEE) += optee-rng.o
diff --git a/drivers/char/hw_random/mtk-rng-v2.c b/drivers/char/hw_random/mtk-rng-v2.c
new file mode 100644
index 000000000000..6e61f4361d9e
--- /dev/null
+++ b/drivers/char/hw_random/mtk-rng-v2.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Mediatek Hardware Random Number Generator (v2/SMCC)
+ *
+ * Copyright (C) 2023 Daniel Golle <daniel@makrotopia.org>
+ * based on patch from Mingming Su <Mingming.Su@mediatek.com>
+ */
+#define MTK_RNG_DEV KBUILD_MODNAME
+
+#include <linux/arm-smccc.h>
+#include <linux/err.h>
+#include <linux/hw_random.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+
+#define MTK_SIP_KERNEL_GET_RND		MTK_SIP_SMC_CMD(0x550)
+
+static int mtk_rng_v2_read(struct hwrng *rng, void *buf, size_t max, bool wait)
+{
+	struct arm_smccc_res res;
+	int retval = 0;
+
+	while (max >= sizeof(u32)) {
+		arm_smccc_smc(MTK_SIP_KERNEL_GET_RND, 0, 0, 0, 0, 0, 0, 0,
+			      &res);
+		if (res.a0)
+			break;
+
+		*(u32 *)buf = res.a1;
+		retval += sizeof(u32);
+		buf += sizeof(u32);
+		max -= sizeof(u32);
+	}
+
+	return retval || !wait ? retval : -EIO;
+}
+
+static int mtk_rng_v2_probe(struct platform_device *pdev)
+{
+	struct hwrng *trng;
+
+	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
+	if (!trng)
+		return -ENOMEM;
+
+	trng->name = pdev->name;
+	trng->read = mtk_rng_v2_read;
+	trng->quality = 900;
+
+	return devm_hwrng_register(&pdev->dev, trng);
+}
+
+static const struct of_device_id mtk_rng_v2_match[] = {
+	{ .compatible = "mediatek,mt7981-rng" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_rng_v2_match);
+
+static struct platform_driver mtk_rng_v2_driver = {
+	.probe          = mtk_rng_v2_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = mtk_rng_v2_match,
+	},
+};
+module_platform_driver(mtk_rng_v2_driver);
+
+MODULE_DESCRIPTION("Mediatek Random Number Generator Driver (v2/SMC)");
+MODULE_AUTHOR("Daniel Golle <daniel@makrotopia.org>");
+MODULE_LICENSE("GPL");

base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
-- 
2.39.1


