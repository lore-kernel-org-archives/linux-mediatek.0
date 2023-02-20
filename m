Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6CEC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 17:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhssXeqm+u6yl3pDx1ZAyAVMMEL8ZFFRhcJTQvtxCBI=; b=TWy6oebJfEyaJsziZjnuBTdt/q
	ceMlqnvlJ2nunC9uXHSl4fnpaCjCEHXnFdnkjlm3U0lRsMnA3IEdB42T52qmI8lfDec+DmG6ZGOOO
	zgWnU6ZRKPtsV2L5XAY5SkAVA7GcTaO0WW+fWz2dWcVXtzIFRDzrc2au38BOD++JyLyUjba+OJmE+
	U38G4PXr2MwWESR5WEm6AMOc962UQBqroYxGnLmEyCx6zxcXX7zjUE3KQnmvePePhv4XCvmy56hUX
	zgSqvi5ccmDAVuvLhrYD1hy4yCLj0Jc/DErPWFHUliEvpOL+BTVnQp/tX7I3p2yKJhyp58nHqdr+D
	snZCI49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUAIx-0056wT-H9; Mon, 20 Feb 2023 17:50:23 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUAIM-0056ge-OY; Mon, 20 Feb 2023 17:50:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id h9so1837834ljq.2;
        Mon, 20 Feb 2023 09:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhssXeqm+u6yl3pDx1ZAyAVMMEL8ZFFRhcJTQvtxCBI=;
        b=hSUvjOtME4HgSAQKag2+v/BtCpNfKz8hzOD5kqu+liLI1J5DuDG1cxlX9HU0ru5HyJ
         zH8YRWlNlsUQbzDU19zR0XPL+wan25qyhe5DOVV1Hu4xB5v5m0LgViiEvxHh1OWVlQ0O
         NsflWNicEeMBKj5DDTWTAyM+A/O9Q/Fe6tXslTKRq4++1sRvgUZbfSJPpx0IKiHo6oh/
         nVgUmmDbiSZZ4l2V6BOOt/xkAxUgSNcfl+5kfnkD5VZYV5nj4f3SZ/YxU8X+Vx/I9p91
         dIjoEC3tFzjfnYF/Fxnhj7DwnuHVvxzvBwscxKsi3Lnmwmz8r81KxPn3p3k5R8GlR9xE
         o0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhssXeqm+u6yl3pDx1ZAyAVMMEL8ZFFRhcJTQvtxCBI=;
        b=2qnpgITVdS0RTs5BoTNQK8xd9r3h5H0GmSUWyhMVDEWmh+hba3QuSrTA9BDQ5rCApX
         XrtAVy1dt+VDuOg6/VSUQ9nGXGGHYn2+cDO0ediZkxDXIrECaX3GQoMs95APDRDHAypi
         lSO3o+daxncokeBNHRioZip/orTgHCFCZunebxCl2lTWbV5ei5Ictb/Ro2NQn+t6gAKU
         9ig1HQ70BBVd2pYzUVRB0PjpzJmqxXMxO2flph6Ug0BGKGiGfK//mlSld2tgfKN2siZg
         GRGoy9jHQZATindrF03F7c6+YZlJfEPXO6WG3DIMN0Dmvi0N8tzjbZmgpGuoZu85Yfq4
         Zp5w==
X-Gm-Message-State: AO0yUKVlUbBNMuxwg4oNJrg0IPxZyJaz4tNuh/ySMIS1HUPkY6uXdr7w
	yLNC5Vq/VL/ysWcNBv2litE=
X-Google-Smtp-Source: AK7set9BeWUmq3qyME/gGxXjti3Uxi1/rFzuL0jJolvPeOuhsOqSX9jChGIUxLIWp+xuC4bWBPMK1Q==
X-Received: by 2002:a05:651c:1505:b0:293:341f:a62 with SMTP id e5-20020a05651c150500b00293341f0a62mr962640ljf.21.1676915382724;
        Mon, 20 Feb 2023 09:49:42 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id u22-20020a2e9f16000000b0029353491df6sm294695ljk.48.2023.02.20.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:49:42 -0800 (PST)
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
Subject: [PATCH V3 2/2] nvmem: add generic driver for devices with MMIO access
Date: Mon, 20 Feb 2023 18:49:30 +0100
Message-Id: <20230220174930.7440-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220174930.7440-1-zajec5@gmail.com>
References: <20230220174930.7440-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_094950_035089_09B8EED2 
X-CRM114-Status: GOOD (  25.30  )
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

Some NVMEM devices can be accessed by simply mapping memory and reading
from / writing to it. This driver adds support for a generic
"mmio-nvmem" DT binding used by such devices.

One of such devices is Broadcom's NVRAM. It's already supported (see
NVMEM_BRCM_NVRAM) but existing driver covers both:
1. NVMEM device access
2. NVMEM content parsing

Once we get support for NVMEM layouts then existing NVRAM driver will
get converted into a layout and generic driver will take over
responsibility for data access. That's why it claims "brcm,nvram"
(conditionally for now).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V3: Support "reg-io-width", basic writing & "brcm,nvram" string
---
 drivers/nvmem/Kconfig  |  10 ++++
 drivers/nvmem/Makefile |   2 +
 drivers/nvmem/mmio.c   | 125 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 drivers/nvmem/mmio.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 6dec38805041..189ea85bd67d 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -166,6 +166,16 @@ config NVMEM_MICROCHIP_OTPC
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
index 6a1efffa88f0..767a9db2bfc1 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -35,6 +35,8 @@ obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
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
index 000000000000..e247c943eea2
--- /dev/null
+++ b/drivers/nvmem/mmio.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Rafał Miłecki <rafal@milecki.pl>
+ */
+
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+struct mmio_nvmem {
+	void __iomem *base;
+	u32 io_width;
+};
+
+static int mmio_nvmem_read(void *context, unsigned int offset, void *val, size_t bytes)
+{
+	struct mmio_nvmem *priv = context;
+	u32 *dst32;
+	u16 *dst16;
+	u8 *dst8;
+
+	if (priv->io_width && WARN_ON(bytes % priv->io_width))
+		return -EINVAL;
+
+	switch (priv->io_width) {
+	case 1:
+		for (dst8 = val; bytes; bytes -= 1, offset += 1)
+			*dst8++ = readb(priv->base + offset);
+		break;
+	case 2:
+		for (dst16 = val; bytes; bytes -= 2, offset += 2)
+			*dst16++ = readw(priv->base + offset);
+		break;
+	case 4:
+		for (dst32 = val; bytes; bytes -= 4, offset += 4)
+			*dst32++ = readl(priv->base + offset);
+		break;
+	default:
+		memcpy_fromio(val, priv->base + offset, bytes);
+	}
+
+	return 0;
+}
+
+static int mmio_nvmem_write(void *context, unsigned int offset, void *val, size_t bytes)
+{
+	struct mmio_nvmem *priv = context;
+
+	switch (priv->io_width) {
+	case 1:
+	case 2:
+	case 4:
+		return -EOPNOTSUPP;
+	default:
+		memcpy_toio(priv->base + offset, val, bytes);
+	}
+
+	return 0;
+}
+
+static int mmio_nvmem_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.name = "mmio-nvmem",
+		.id = NVMEM_DEVID_AUTO,
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
+	of_property_read_u32(dev->of_node, "reg-io-width", &priv->io_width);
+
+	config.dev = dev;
+	config.size = resource_size(res);
+	config.word_size = priv->io_width;
+	config.stride = priv->io_width;
+	config.priv = priv;
+	if (!device_property_present(dev, "read-only"))
+		config.reg_write = mmio_nvmem_write;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
+}
+
+static const struct of_device_id mmio_nvmem_of_match_table[] = {
+	{ .compatible = "mmio-nvmem", },
+	/* Custom bindings */
+#if !IS_ENABLED(CONFIG_NVMEM_BRCM_NVRAM)
+	{ .compatible = "brcm,nvram", },
+#endif
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


