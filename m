Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E8C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fPObB622ZHAsw7bG4ZtmD1WDgZDX6KJYI3QC9H/s34=; b=yIE/ECOFBclJbcoKHrjxTdv3jA
	lnwP/qPXNe4MVlJ7TPArkZE0nspFPnPaayNUt1ZHJRzb91ycWI468tWCEPFieZsOD8eMQEB3WZTsb
	ATl68WZmQpM5RZV2xxVsvZ+J+qEASt7ghhwVaFYuDqVjOGFxH313SroO05VW0mije1vVgUHsS6M1E
	x8SEzE/+qTYEHrRf49Jtpv8EkxK0bexmvhLOAlOCVq00Fu+lk8zwBlyk8yJBiwnAb2PT93dTePD2+
	Eh6OTx033pu6SQGqtv3Eb6k4E0Ecfi2p4ESBTFR3JxkfWf3JZ8/rCliPxmrDHafnHjUisoSNrf092
	SbSww7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6zq-00AW6X-O4; Wed, 01 Feb 2023 06:53:30 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6z0-00AVkP-Da; Wed, 01 Feb 2023 06:52:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id ud5so48485125ejc.4;
        Tue, 31 Jan 2023 22:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fPObB622ZHAsw7bG4ZtmD1WDgZDX6KJYI3QC9H/s34=;
        b=ljP+fzclIJjlHMmWQaVJkSQr2M+/sTDBmC+RbHmj5xcO8zNyuRjC8NiPadP5CH96UW
         hwstXaExliDwmXvG1q/3NxIPr7E+9PQRx9y/kd0XAoZiMRNDf63pdddE1YvA+jj0pEaR
         qsTyR8XSWJELU4ZcN2936SYxGUbKHcq8gl+mj0yvFtNQD0PW6Jti18z/hGicmmlcdNdM
         77B9IlMXefaRaJSkGlyMHK4J41FUZX+ggKo+nU9VziXYgfXWlkxN2h0llCnQndKl36vV
         sT47hAfA9Q+cNGgDxchrI1Pz1bK2pG6isyveGc04kdPYWNfuGjsGRrvz+RKF7s2g4iQ0
         NzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fPObB622ZHAsw7bG4ZtmD1WDgZDX6KJYI3QC9H/s34=;
        b=5rFzM5+mCLrKUIro5K/5prPJM2DKeLdPif2D4ajtl6CiF29QlVawUywbtziXZK4vzk
         CojWN5zkihkjvb5i3MXvMOxgJYA3hU2nA88AgE/kZ6bfirpmTceEdqLvPkrlh+KY6K0H
         jY0eOAoeYNiD1bvCEDE6hh6Z94F88J9LVoYZoSMjWiAX9ygl8n4K34Ht67U15gQOSoBS
         LK6tQHHWYOPyDkgp+hjEhkUJ30jaeWYqZXJop6yUAcYd50sreT8GxcmtrQkqkvfNVtEr
         J0o6j4X+9Sut1g2cwXXu+SENWAqPN5/WV5XVTAwNwD7OAwDFzDoUM+Q5qsigqRKnNS9+
         QmwQ==
X-Gm-Message-State: AO0yUKVBm1ps2MSkcWzJN21N/dSP5iY+428rvAFbJlDS2B5nb1iZ3gfE
	7UyqwLkavVfhqrYSr67moVxitT2NGp8=
X-Google-Smtp-Source: AK7set9xqKbGnzuL5L4PM1F4eU43RdssaMCIk3qlYJ+LGtln8nEmEMKDbshH9HM1j4tonfQ/w2p3Ow==
X-Received: by 2002:a17:907:9909:b0:887:9a7f:4326 with SMTP id ka9-20020a170907990900b008879a7f4326mr1108784ejc.8.1675234356056;
        Tue, 31 Jan 2023 22:52:36 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906218100b008720c458bd4sm9509608eju.3.2023.01.31.22.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 22:52:35 -0800 (PST)
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
Subject: [PATCH 4/4] nvmem: uniphier-efuse: replace driver with a generic MMIO one
Date: Wed,  1 Feb 2023 07:47:17 +0100
Message-Id: <20230201064717.18410-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201064717.18410-1-zajec5@gmail.com>
References: <20230201064717.18410-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225238_527810_9189D8D9 
X-CRM114-Status: GOOD (  23.29  )
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

UniPhier eFuse uses a simple MMIO that can be handled with a generic
driver. Replace this driver to avoid code duplication.

Keep Kconfig symbol for a release or two to help with "make oldconfig".

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/nvmem/Kconfig          |  7 ++-
 drivers/nvmem/Makefile         |  2 -
 drivers/nvmem/mmio.c           |  1 +
 drivers/nvmem/uniphier-efuse.c | 78 ----------------------------------
 4 files changed, 4 insertions(+), 84 deletions(-)
 delete mode 100644 drivers/nvmem/uniphier-efuse.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 4d652c7382a6..d65950da39b0 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -359,12 +359,11 @@ config NVMEM_UNIPHIER_EFUSE
 	tristate "UniPhier SoCs eFuse support"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
 	depends on HAS_IOMEM
+	select NVMEM_MMIO
 	help
-	  This is a simple driver to dump specified values of UniPhier SoC
-	  from eFuse.
+	  This driver has been replaced by a generic MMIO implementation.
 
-	  This driver can also be built as a module. If so, the module
-	  will be called nvmem-uniphier-efuse.
+	  Update your config as this symbol will be dropped in the next release.
 
 config NVMEM_VF610_OCOTP
 	tristate "VF610 SoC OCOTP support"
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 7a8e29ea408e..70dd1154c832 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -67,8 +67,6 @@ obj-$(CONFIG_NVMEM_SUNPLUS_OCOTP)	+= nvmem_sunplus_ocotp.o
 nvmem_sunplus_ocotp-y			:= sunplus-ocotp.o
 obj-$(CONFIG_NVMEM_SUNXI_SID)		+= nvmem_sunxi_sid.o
 nvmem_sunxi_sid-y			:= sunxi_sid.o
-obj-$(CONFIG_NVMEM_UNIPHIER_EFUSE)	+= nvmem-uniphier-efuse.o
-nvmem-uniphier-efuse-y			:= uniphier-efuse.o
 obj-$(CONFIG_NVMEM_VF610_OCOTP)		+= nvmem-vf610-ocotp.o
 nvmem-vf610-ocotp-y			:= vf610-ocotp.o
 obj-$(CONFIG_NVMEM_ZYNQMP)		+= nvmem_zynqmp_nvmem.o
diff --git a/drivers/nvmem/mmio.c b/drivers/nvmem/mmio.c
index 253ade72e0c3..f44ff2a56c56 100644
--- a/drivers/nvmem/mmio.c
+++ b/drivers/nvmem/mmio.c
@@ -60,6 +60,7 @@ static const struct of_device_id mmio_nvmem_of_match_table[] = {
 	/* Custom bindings that were introduced before the mmio one */
 	{ .compatible = "mediatek,mt8173-efuse", },
 	{ .compatible = "mediatek,efuse", },
+	{ .compatible = "socionext,uniphier-efuse", },
 	{},
 };
 
diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efuse.c
deleted file mode 100644
index aca910b3b6f8..000000000000
--- a/drivers/nvmem/uniphier-efuse.c
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * UniPhier eFuse driver
- *
- * Copyright (C) 2017 Socionext Inc.
- */
-
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/nvmem-provider.h>
-#include <linux/platform_device.h>
-
-struct uniphier_efuse_priv {
-	void __iomem *base;
-};
-
-static int uniphier_reg_read(void *context,
-			     unsigned int reg, void *_val, size_t bytes)
-{
-	struct uniphier_efuse_priv *priv = context;
-	u8 *val = _val;
-	int offs;
-
-	for (offs = 0; offs < bytes; offs += sizeof(u8))
-		*val++ = readb(priv->base + reg + offs);
-
-	return 0;
-}
-
-static int uniphier_efuse_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	struct nvmem_device *nvmem;
-	struct nvmem_config econfig = {};
-	struct uniphier_efuse_priv *priv;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
-
-	econfig.stride = 1;
-	econfig.word_size = 1;
-	econfig.read_only = true;
-	econfig.reg_read = uniphier_reg_read;
-	econfig.size = resource_size(res);
-	econfig.priv = priv;
-	econfig.dev = dev;
-	nvmem = devm_nvmem_register(dev, &econfig);
-
-	return PTR_ERR_OR_ZERO(nvmem);
-}
-
-static const struct of_device_id uniphier_efuse_of_match[] = {
-	{ .compatible = "socionext,uniphier-efuse",},
-	{/* sentinel */},
-};
-MODULE_DEVICE_TABLE(of, uniphier_efuse_of_match);
-
-static struct platform_driver uniphier_efuse_driver = {
-	.probe = uniphier_efuse_probe,
-	.driver = {
-		.name = "uniphier-efuse",
-		.of_match_table = uniphier_efuse_of_match,
-	},
-};
-module_platform_driver(uniphier_efuse_driver);
-
-MODULE_AUTHOR("Keiji Hayashibara <hayashibara.keiji@socionext.com>");
-MODULE_DESCRIPTION("UniPhier eFuse driver");
-MODULE_LICENSE("GPL v2");
-- 
2.34.1


