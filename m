Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE647C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 06:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivmgC6/sjsLjgnwubV4IXo9QoAIf+yIcsu15miGgEqc=; b=KT7TRZ+IqXdrYP4K/QMRt96Kbs
	+B/nxBbgBO74qeRKTAdGtVR925CdHpymxtZ/zcqkTUV7DDPaGDZdxzV5cam51Je8G/rENpyaJZCCv
	VtPWIRDSsLLH52vc6F/E+1khOb/8YatuWlhBarxBOasc65H3t13UUCZI/SLz/10aCdBH+7Uuu6k4u
	k9PZtchZSYOKVL6Tc90D9DhEpM1Qnu1hrtIP6QCHe21Xj1wVfEOza7e+6vuCzuEGfqGU/0zA02rZN
	Gjn8eu3BLvGSl3v5y6KBh3WR6Y7xc7cgCtfm6jKcCJPfavjRXTnN65esoNeT6xNGpuLX86coCa4DV
	HDB/MHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6zV-00AVxd-TN; Wed, 01 Feb 2023 06:53:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6yy-00AVjF-AY; Wed, 01 Feb 2023 06:52:38 +0000
Received: by mail-ej1-x62c.google.com with SMTP id hx15so28914608ejc.11;
        Tue, 31 Jan 2023 22:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivmgC6/sjsLjgnwubV4IXo9QoAIf+yIcsu15miGgEqc=;
        b=mBvY7kC/f82hBqQON7oWzx9mBX2znC0pmZY4xaPua/eYyTm/W03yT8pcEJ7O5FDAv6
         FTCg2jzUmS7NRAPjqyoF4bCfjAvcM0khTtDT8EJiBMD2s3A2WpLOI9TLpHkqnYJqQWOL
         g9NptaqyvHLrOy+uXxII81OLBPCsUS38obEox4KOCZ7J0u2MM4d9Zwrm4soLUpgLeQfx
         L8pveJ8fhOADpiNNB7SIZw0M3IGO4g39okWTdPipmzt8zYU2r5bblVziQl4rpcvPEk+o
         WSqZEgIfjRKyaZBhCX7ZWGngBriuHUnCG0ITlwR7jsbBpf2EN2tERQ0DwImVc8CJ/6X4
         jiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivmgC6/sjsLjgnwubV4IXo9QoAIf+yIcsu15miGgEqc=;
        b=pEvUiU93/wRKgD2jvIgDxktsaC+wfmMbMRbRlJbNlNfl/nSSA0V+kRFFnFsXBH5EW4
         7DDLWY5cjrCnAun1Y26Cm2Lvc1Bp4UFY94FkxoLFB+cgDzzsnJtGud3PrgI7eHNSmU9h
         RVEZ+C7OHowloOZr06uBN0eN2EudsnnjnMkBumajGkF6ynx+yaWDfQeC9TVrrTpgfKp5
         X2ChffgTaHvd+EBbY3iAO3piAhr0a/jXhY2e7Q6Hdt0Jt4LaYYSvMLW1WtbcWvqpQlde
         wC4CKcCX9765e/aslPHELXvuVqB8X6DiaOoJBdaywqRsMTHLFqwq02fCA2Ie3afXc+IY
         XApA==
X-Gm-Message-State: AO0yUKXB73FbxAmdPb2GnY/cQWt9bYP525QYqGtWSRC/TS9IWI87d73g
	+XSj9c7KUfgc5RXem9YQnPU=
X-Google-Smtp-Source: AK7set/Dpqj2fRLsbPD0jrzfSP/6e4yi5fhGZfwqrwUUb7TADJ5CfGq3g2ytVtma0MO7D/s+ex2PgA==
X-Received: by 2002:a17:906:8395:b0:878:6f1d:e5d4 with SMTP id p21-20020a170906839500b008786f1de5d4mr1263932ejx.70.1675234353793;
        Tue, 31 Jan 2023 22:52:33 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906218100b008720c458bd4sm9509608eju.3.2023.01.31.22.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 22:52:33 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/4] nvmem: mtk-efuse: replace driver with a generic MMIO one
Date: Wed,  1 Feb 2023 07:47:16 +0100
Message-Id: <20230201064717.18410-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201064717.18410-1-zajec5@gmail.com>
References: <20230201064717.18410-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225236_448644_7FA92580 
X-CRM114-Status: GOOD (  23.72  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Mediatek EFUSE uses a simple MMIO that can be handled with a generic
driver. Replace this driver to avoid code duplication.

Keep Kconfig symbol for a release or two to help with "make oldconfig".

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/nvmem/Kconfig     |  7 ++-
 drivers/nvmem/Makefile    |  2 -
 drivers/nvmem/mmio.c      |  3 ++
 drivers/nvmem/mtk-efuse.c | 97 ---------------------------------------
 4 files changed, 6 insertions(+), 103 deletions(-)
 delete mode 100644 drivers/nvmem/mtk-efuse.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 9eb5e93f0455..4d652c7382a6 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -184,12 +184,11 @@ config NVMEM_MTK_EFUSE
 	tristate "Mediatek SoCs EFUSE support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on HAS_IOMEM
+	select NVMEM_MMIO
 	help
-	  This is a driver to access hardware related data like sensor
-	  calibration, HDMI impedance etc.
+	  This driver has been replaced by a generic MMIO implementation.
 
-	  This driver can also be built as a module. If so, the module
-	  will be called efuse-mtk.
+	  Update your config as this symbol will be dropped in the next release.
 
 config NVMEM_MXS_OCOTP
 	tristate "Freescale MXS On-Chip OTP Memory Support"
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 2f2bed7cdf24..7a8e29ea408e 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -38,8 +38,6 @@ obj-$(CONFIG_NVMEM_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
 nvmem-microchip-otpc-y			:= microchip-otpc.o
 obj-$(CONFIG_NVMEM_MMIO)		+= nvmem-mmio.o
 nvmem-mmio-y				:= mmio.o
-obj-$(CONFIG_NVMEM_MTK_EFUSE)		+= nvmem_mtk-efuse.o
-nvmem_mtk-efuse-y			:= mtk-efuse.o
 obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
 nvmem-mxs-ocotp-y			:= mxs-ocotp.o
 obj-$(CONFIG_NVMEM_NINTENDO_OTP)	+= nvmem-nintendo-otp.o
diff --git a/drivers/nvmem/mmio.c b/drivers/nvmem/mmio.c
index 19c8880dc675..253ade72e0c3 100644
--- a/drivers/nvmem/mmio.c
+++ b/drivers/nvmem/mmio.c
@@ -57,6 +57,9 @@ static int mmio_nvmem_probe(struct platform_device *pdev)
 
 static const struct of_device_id mmio_nvmem_of_match_table[] = {
 	{ .compatible = "mmio-nvmem", },
+	/* Custom bindings that were introduced before the mmio one */
+	{ .compatible = "mediatek,mt8173-efuse", },
+	{ .compatible = "mediatek,efuse", },
 	{},
 };
 
diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
deleted file mode 100644
index a08e0aedd21c..000000000000
--- a/drivers/nvmem/mtk-efuse.c
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2015 MediaTek Inc.
- * Author: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
- */
-
-#include <linux/device.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/io.h>
-#include <linux/nvmem-provider.h>
-#include <linux/platform_device.h>
-
-struct mtk_efuse_priv {
-	void __iomem *base;
-};
-
-static int mtk_reg_read(void *context,
-			unsigned int reg, void *_val, size_t bytes)
-{
-	struct mtk_efuse_priv *priv = context;
-	void __iomem *addr = priv->base + reg;
-	u8 *val = _val;
-	int i;
-
-	for (i = 0; i < bytes; i++, val++)
-		*val = readb(addr + i);
-
-	return 0;
-}
-
-static int mtk_efuse_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	struct nvmem_device *nvmem;
-	struct nvmem_config econfig = {};
-	struct mtk_efuse_priv *priv;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
-
-	econfig.stride = 1;
-	econfig.word_size = 1;
-	econfig.reg_read = mtk_reg_read;
-	econfig.size = resource_size(res);
-	econfig.priv = priv;
-	econfig.dev = dev;
-	nvmem = devm_nvmem_register(dev, &econfig);
-
-	return PTR_ERR_OR_ZERO(nvmem);
-}
-
-static const struct of_device_id mtk_efuse_of_match[] = {
-	{ .compatible = "mediatek,mt8173-efuse",},
-	{ .compatible = "mediatek,efuse",},
-	{/* sentinel */},
-};
-MODULE_DEVICE_TABLE(of, mtk_efuse_of_match);
-
-static struct platform_driver mtk_efuse_driver = {
-	.probe = mtk_efuse_probe,
-	.driver = {
-		.name = "mediatek,efuse",
-		.of_match_table = mtk_efuse_of_match,
-	},
-};
-
-static int __init mtk_efuse_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&mtk_efuse_driver);
-	if (ret) {
-		pr_err("Failed to register efuse driver\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static void __exit mtk_efuse_exit(void)
-{
-	return platform_driver_unregister(&mtk_efuse_driver);
-}
-
-subsys_initcall(mtk_efuse_init);
-module_exit(mtk_efuse_exit);
-
-MODULE_AUTHOR("Andrew-CT Chen <andrew-ct.chen@mediatek.com>");
-MODULE_DESCRIPTION("Mediatek EFUSE driver");
-MODULE_LICENSE("GPL v2");
-- 
2.34.1


