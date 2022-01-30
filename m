Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dg11Yo+OQB7Y+6omxM6OgTVEBhcMN3K7Kuu15lXaYbk=; b=uchD8ko3nqXJFM
	92rBhXGMLJETGaZqTTOG8cYg8WOjJZAkzSJ19QDvFkld7FTq/QlzcBjezmXkWbDOPZfuNlMlLjxEU
	OcGiOvMtPAGjS1AfDqpzkp+7TdZIS5JLnhM7Dfp6tWuVvihGbsQCDh0wie9yUUpJ18o+oEVGDQ5Sm
	8qTjXShw7WLspj3JQ61JdAK3J6bnxCIUKyT6EXNit6CGhLupsSLS2uBTg4MIeNFcip6gMtHE0nHCH
	b1hDlH6h07rJja+YX/8u6hDEZMjd1OOAJb4b6ELiaH5J3y2TJ4TuC++kSUG+gXswn2QhfIdvdm7yp
	N7zFdD5UbfLZKbcQ/QMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBfB-006mtq-P3; Sun, 30 Jan 2022 14:58:45 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBb9-006kek-Vw; Sun, 30 Jan 2022 14:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u+tl6xie1Wtuy+7sHYDKqjsiAoTKmtTNbyVrWfTLiqc=; b=j7KKBxMXVcKxo1wfN2/uVl7MyG
 uI/7VvnCY9UQQo5lwJIwTUnZongSaxtBzgzceSfQXQJbzdFuoAwCFdXnyeGKzayNUWoXaPreC51Mt
 +AaX7fWNXPIBOP5ZumoFm/bQM7y7nRfPxUbBMTXlhlFI2qI/HUNcGivhCJu9X9l4nHYE=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de
 ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nEBYD-0002if-G0; Sun, 30 Jan 2022 15:51:33 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: [PATCH v9 12/13] gpio: Add support for Airoha EN7523 GPIO controller
Date: Sun, 30 Jan 2022 15:51:15 +0100
Message-Id: <20220130145116.88406-13-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065436_242299_D3EC3C8A 
X-CRM114-Status: GOOD (  20.70  )
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

From: John Crispin <john@phrozen.org>

Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
GPIOs. Each instance in DT is for a single bank.

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/gpio/Kconfig       |  10 +++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-en7523.c | 137 +++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/gpio/gpio-en7523.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 60d9374c72c0..0e9aacbcb4bd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -247,6 +247,16 @@ config GPIO_EM
 	help
 	  Say yes here to support GPIO on Renesas Emma Mobile SoCs.
 
+config GPIO_EN7523
+	tristate "Airoha GPIO support"
+	depends on ARCH_AIROHA
+	default ARCH_AIROHA
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y or M here to support the GPIO controller block on the
+	  Airoha EN7523 SoC. It supports two banks of 32 GPIOs.
+
 config GPIO_EP93XX
 	def_bool y
 	depends on ARCH_EP93XX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 71ee9fc2ff83..d2269ee0948e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
 obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
 obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
+obj-$(CONFIG_GPIO_EN7523)		+= gpio-en7523.o
 obj-$(CONFIG_GPIO_EP93XX)		+= gpio-ep93xx.o
 obj-$(CONFIG_GPIO_EXAR)			+= gpio-exar.o
 obj-$(CONFIG_GPIO_F7188X)		+= gpio-f7188x.o
diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
new file mode 100644
index 000000000000..f836a8db4c1d
--- /dev/null
+++ b/drivers/gpio/gpio-en7523.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/types.h>
+#include <linux/io.h>
+#include <linux/bits.h>
+#include <linux/gpio/driver.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define AIROHA_GPIO_MAX		32
+
+/**
+ * airoha_gpio_ctrl - Airoha GPIO driver data
+ * @gc: Associated gpio_chip instance.
+ * @data: The data register.
+ * @dir0: The direction register for the lower 16 pins.
+ * @dir1: The direction register for the higher 16 pins.
+ * @output: The output enable register.
+ */
+struct airoha_gpio_ctrl {
+	struct gpio_chip gc;
+	void __iomem *data;
+	void __iomem *dir[2];
+	void __iomem *output;
+};
+
+static struct airoha_gpio_ctrl *gc_to_ctrl(struct gpio_chip *gc)
+{
+	return container_of(gc, struct airoha_gpio_ctrl, gc);
+}
+
+static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
+			  int val, int out)
+{
+	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	u32 dir = ioread32(ctrl->dir[gpio / 16]);
+	u32 output = ioread32(ctrl->output);
+	u32 mask = BIT((gpio % 16) * 2);
+
+	if (out) {
+		dir |= mask;
+		output |= BIT(gpio);
+	} else {
+		dir &= ~mask;
+		output &= ~BIT(gpio);
+	}
+
+	iowrite32(dir, ctrl->dir[gpio / 16]);
+
+	if (out)
+		gc->set(gc, gpio, val);
+
+	iowrite32(output, ctrl->output);
+
+	return 0;
+}
+
+static int airoha_dir_out(struct gpio_chip *gc, unsigned int gpio,
+			  int val)
+{
+	return airoha_dir_set(gc, gpio, val, 1);
+}
+
+static int airoha_dir_in(struct gpio_chip *gc, unsigned int gpio)
+{
+	return airoha_dir_set(gc, gpio, 0, 0);
+}
+
+static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	u32 dir = ioread32(ctrl->dir[gpio / 16]);
+	u32 mask = BIT((gpio % 16) * 2);
+
+	return (dir & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int airoha_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct airoha_gpio_ctrl *ctrl;
+	int err;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->data = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctrl->data))
+		return PTR_ERR(ctrl->data);
+
+	ctrl->dir[0] = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(ctrl->dir[0]))
+		return PTR_ERR(ctrl->dir[0]);
+
+	ctrl->dir[1] = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(ctrl->dir[1]))
+		return PTR_ERR(ctrl->dir[1]);
+
+	ctrl->output = devm_platform_ioremap_resource(pdev, 3);
+	if (IS_ERR(ctrl->output))
+		return PTR_ERR(ctrl->output);
+
+	err = bgpio_init(&ctrl->gc, dev, 4, ctrl->data, NULL,
+			 NULL, NULL, NULL, 0);
+	if (err)
+		return dev_err_probe(dev, err, "unable to init generic GPIO");
+
+	ctrl->gc.ngpio = AIROHA_GPIO_MAX;
+	ctrl->gc.owner = THIS_MODULE;
+	ctrl->gc.direction_output = airoha_dir_out;
+	ctrl->gc.direction_input = airoha_dir_in;
+	ctrl->gc.get_direction = airoha_get_dir;
+
+	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+}
+
+static const struct of_device_id airoha_gpio_of_match[] = {
+	{ .compatible = "airoha,en7523-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, airoha_gpio_of_match);
+
+static struct platform_driver airoha_gpio_driver = {
+	.driver = {
+		.name = "airoha-gpio",
+		.of_match_table	= airoha_gpio_of_match,
+	},
+	.probe = airoha_gpio_probe,
+};
+module_platform_driver(airoha_gpio_driver);
+
+MODULE_DESCRIPTION("Airoha GPIO support");
+MODULE_AUTHOR("John Crispin <john@phrozen.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
