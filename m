Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF04C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 06:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPyU19+VhmMuIMMpSU5GySmAIP6oqfiCTnK5b5e8Lus=; b=uC41/7djBFMbfHDjMMjOj51uDu
	7Nam9Z4ZS9zxCTctT4z7VTOwSAbnSyAdQHhVorbwyKsfj3xX7RrvQz6uWFJAiBka3M7s38j1vVsVy
	jCOpcD4ELI6n+mYQV/IgSNi2bc/qY476l9ijz2ijXVx0lEFm0zy5yNoAkoER2oKqCmMMoSL77JsF6
	4nUDzPP48AxUtguUhm8sAiZV6YOJ6bKyIlY24Jc9Q3aP/lMZjjUnp1Wtkue91U9i8XxfzBB74yBXt
	OCyLni1/rLDHG7sCMgr/Lom67Ot2CjaXjP4u2nxE3TAGBPCHsZ9wVsfzeY7DmSKxx70yYxNqWMBJr
	H1c4I+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6zG-00AVrI-GJ; Wed, 01 Feb 2023 06:52:54 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6yw-00AViO-9Y; Wed, 01 Feb 2023 06:52:35 +0000
Received: by mail-ej1-x634.google.com with SMTP id mc11so25961456ejb.10;
        Tue, 31 Jan 2023 22:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPyU19+VhmMuIMMpSU5GySmAIP6oqfiCTnK5b5e8Lus=;
        b=WrbOhXAP/9dmBsWhH17HvQ/1RmrjVeZyRRbdY5B8ueOrb3gEhdOqTxM7CW4PMPYFL4
         TfCfQoI9GAnc2vHMfMEMPctNOI+K95B9YLclNRWNuuTXcKzKWmoLgIucD5Ri2dRB9+Rm
         QLv/KzB8rnUvez0ZHoG4nZrJ85jQDhii7gbbkQKCmrmEKC4KDkfntN51xX569+x5XVeb
         dFpPQPuZ6oaAADR43HGvkfC2TBXTPPPMjpzuxkmHkQI9fkG2WBMeiFoFY8mWgPOubeq/
         Dz6XsYizMF8UQYUJihKY5arEzzl4iYYd4W6XzB6rUSmkhwPwjD5UKxN8KKLZxC+7L1v9
         Ohug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPyU19+VhmMuIMMpSU5GySmAIP6oqfiCTnK5b5e8Lus=;
        b=QuvwgTgnWmMAfYcP7o+qRJ971SWIh45vB42MiC5Z4XAwzxnWkFd53Ret92gWPC0CNb
         vMWfXqR8qShg8L0euEG2Yam4JU8nK4ncs31Je8Ghg0+QVrfvKIrheA+wVG7ucePZ5qyP
         GkUTnpSYcq0bllDkpSUFeNBO4LCLpRJNV9ekETGkRHLumpyTLdx9O0n7wamNY/QVoKyA
         7b4lo2abxoatLEyGDTTGvuIxTkZ90zlgBLsdZdhq6fMhBE6DFPs/iSxQZtsYmAyu20Mp
         feG3rnGyvH5Lw+5gI9KZNy8g9GV6EbfFc2lTR0IO5Pp6uL9I6QvUbYXfmBqcE1Toq59O
         IOyw==
X-Gm-Message-State: AO0yUKXlB25ZM2dQGuG7xlXPBrOo0cfWTBzMqNyxGqW9IfSuOfTmJnpT
	Aq5/nxutAR0s/wDI7676hcAiKaqSlAw=
X-Google-Smtp-Source: AK7set9i41akd5yXdQqcl/yGbOzAYiYzmbj+ird09ej50uN9MO10IRnAkqTkHdnPFbklxuI5P/WbBQ==
X-Received: by 2002:a17:907:7244:b0:886:323c:dc39 with SMTP id ds4-20020a170907724400b00886323cdc39mr562016ejc.55.1675234351419;
        Tue, 31 Jan 2023 22:52:31 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906218100b008720c458bd4sm9509608eju.3.2023.01.31.22.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 22:52:30 -0800 (PST)
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
Subject: [PATCH 2/4] nvmem: add generic driver for devices with MMIO access
Date: Wed,  1 Feb 2023 07:47:15 +0100
Message-Id: <20230201064717.18410-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201064717.18410-1-zajec5@gmail.com>
References: <20230201064717.18410-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225234_371278_CFC65D75 
X-CRM114-Status: GOOD (  24.22  )
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

With nvmem layouts in place we should now work on plain content access
NVMEM drivers (e.g. MMIO one). Actual NVMEM content handling should go
to layout drivers.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/nvmem/Kconfig  | 10 ++++++
 drivers/nvmem/Makefile |  2 ++
 drivers/nvmem/mmio.c   | 80 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 drivers/nvmem/mmio.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 789729ff7e50..9eb5e93f0455 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -170,6 +170,16 @@ config NVMEM_MICROCHIP_OTPC
 	  This driver enable the OTP controller available on Microchip SAMA7G5
 	  SoCs. It controls the access to the OTP memory connected to it.
 
+config NVMEM_MMIO
+	tristate "MMIO access based NVMEM support"
+	depends on HAS_IOMEM
+	help
+	  This driver provides support for NVMEM devices that can be accessed
+	  using MMIO.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-mmio.
+
 config NVMEM_MTK_EFUSE
 	tristate "Mediatek SoCs EFUSE support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 442f9a4876a5..2f2bed7cdf24 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -36,6 +36,8 @@ obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
 nvmem_meson_mx_efuse-y			:= meson-mx-efuse.o
 obj-$(CONFIG_NVMEM_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
 nvmem-microchip-otpc-y			:= microchip-otpc.o
+obj-$(CONFIG_NVMEM_MMIO)		+= nvmem-mmio.o
+nvmem-mmio-y				:= mmio.o
 obj-$(CONFIG_NVMEM_MTK_EFUSE)		+= nvmem_mtk-efuse.o
 nvmem_mtk-efuse-y			:= mtk-efuse.o
 obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
diff --git a/drivers/nvmem/mmio.c b/drivers/nvmem/mmio.c
new file mode 100644
index 000000000000..19c8880dc675
--- /dev/null
+++ b/drivers/nvmem/mmio.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Rafał Miłecki <rafal@milecki.pl>
+ */
+
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+struct mmio_nvmem {
+	void __iomem *base;
+};
+
+static int mmio_nvmem_read(void *context, unsigned int offset, void *val, size_t bytes)
+{
+	struct mmio_nvmem *priv = context;
+
+	memcpy_fromio(val, priv->base, bytes);
+
+	return 0;
+}
+
+static int mmio_nvmem_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.name = "mmio-nvmem",
+		.read_only = true,
+		.reg_read = mmio_nvmem_read,
+	};
+	struct device *dev = &pdev->dev;
+	struct mmio_nvmem *priv;
+	struct resource *res;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	config.dev = dev;
+	config.size = resource_size(res);
+	config.word_size = sizeof(u8);
+	config.stride = sizeof(u8);
+	config.priv = priv;
+
+	if (!device_property_present(dev, "read-only"))
+		dev_warn(dev, "Writing is not supported yet");
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
+}
+
+static const struct of_device_id mmio_nvmem_of_match_table[] = {
+	{ .compatible = "mmio-nvmem", },
+	{},
+};
+
+static struct platform_driver mmio_nvmem_driver = {
+	.probe = mmio_nvmem_probe,
+	.driver = {
+		.name = "mmio_nvmem",
+		.of_match_table = mmio_nvmem_of_match_table,
+	},
+};
+
+static int __init mmio_nvmem_init(void)
+{
+	return platform_driver_register(&mmio_nvmem_driver);
+}
+
+subsys_initcall_sync(mmio_nvmem_init);
+
+MODULE_AUTHOR("Rafał Miłecki");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, mmio_nvmem_of_match_table);
-- 
2.34.1


