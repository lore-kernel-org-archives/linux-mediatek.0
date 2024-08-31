Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D82CD13D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPUJsoA5ky0KHq0PhyjMuzKHUyzvLirUz5fsMR9ZVv0=; b=q0NWTUfKhip28A0PkYoLhPoM0e
	u75i8H7hPTIfyvl6KVJlkNPyTxZAz6Pzkw3+iXfO0YN9Y6s6OEBF9+DHBMwkbndYa9ferZ2PF97bC
	nAxFEkA700O5ZAqm/tk+/BRbD5yIjSi129992NBs87DcrMP+lNEO5YFNCeCkLVdKV2PksUTKfxujm
	VjFwzo+A8XU0bSut+AkKy3o0/qynNkT2JRnTpDeh+1FSpkaySNvx7KWTX7LswSmxPXCDyX8JMarht
	6bJWSQ7dSDmwJxKEIjLy4/Wcyu1PbsOc3FVJ6Xx3pghoNvdA9zefRweOCA+t+luSu7j+4CYNOH2lk
	lWfRgUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skP97-00000009Voo-1tYw;
	Sat, 31 Aug 2024 14:32:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skP5p-00000009VNQ-0pqE;
	Sat, 31 Aug 2024 14:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEA665C0FAB;
	Sat, 31 Aug 2024 14:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9CBC4CEC0;
	Sat, 31 Aug 2024 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725114524;
	bh=/6uBpfrB/F12iCmrrtq2Zl6JyMgmBNI04LH3ctsg3dM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PM9ZcI4aJI3nLutDqYC0SQhm490LufbtMsWiSggY+B9y60xCOImghu3hpY0Rf7RYR
	 wxg1Gh9hWkRP+xkWie72KwZvsiZLIuoD1j6fXzrqs+9iNN5wESeTvClMBE2LnEY3Om
	 La4WQi5WiBJUPnN1ddty5YI0wEhl0hnO8s7DDC05j+X6xJtb4rxOySEHY6g3S4Zq5M
	 qL/DgZGUKLkUsFfBteUjpgS7STxgtnfitY2TdjUBIkl2oM+xF5JDOPF+w75s6ojzjD
	 bKj9PIKDkKdjc4v5zY+kZWBtIdlJ4pzN0amnzUiACUbhYkxX9rxKH9whwkEOP3slCo
	 SlChzmfLsFs1Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 31 Aug 2024 16:27:48 +0200
Subject: [PATCH v3 3/5] mfd: airoha: Add support for Airoha EN7581 MFD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-en7581-pinctrl-v3-3-98eebfb4da66@kernel.org>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
In-Reply-To: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
 linux-pwm@vger.kernel.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_072845_386881_0C9E69F2 
X-CRM114-Status: GOOD (  19.40  )
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

From: Christian Marangi <ansuelsmth@gmail.com>

Support for Airoha EN7581 Multi Function Device that
expose PINCTRL functionality and PWM functionality.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mfd/Kconfig                   |  8 ++++
 drivers/mfd/Makefile                  |  2 +
 drivers/mfd/airoha-en7581-gpio-mfd.c  | 72 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/airoha-en7581-mfd.h |  9 +++++
 4 files changed, 91 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index bc8be2e593b6..c690378066ac 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -20,6 +20,14 @@ config MFD_CS5535
 	  This is the core driver for CS5535/CS5536 MFD functions.  This is
 	  necessary for using the board's GPIO and MFGPT functionality.
 
+config MFD_AIROHA_EN7581
+	bool "Airoha EN7581 Multi Function Device"
+	depends on (ARCH_AIROHA || COMPILE_TEST) && OF
+	select MFD_CORE
+	help
+	  Support for Airoha EN7581 Multi Function Device that
+	  expose PINCTRL functionality and PWM functionality.
+
 config MFD_ALTERA_A10SR
 	bool "Altera Arria10 DevKit System Resource chip"
 	depends on ARCH_INTEL_SOCFPGA && SPI_MASTER=y && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 02b651cd7535..075dbff618e0 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -256,6 +256,8 @@ obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
 obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
 obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)	+= intel_soc_pmic_mrfld.o
 
+obj-$(CONFIG_MFD_AIROHA_EN7581)	+= airoha-en7581-gpio-mfd.o
+
 obj-$(CONFIG_MFD_ALTERA_A10SR)	+= altera-a10sr.o
 obj-$(CONFIG_MFD_ALTERA_SYSMGR) += altera-sysmgr.o
 obj-$(CONFIG_MFD_STPMIC1)	+= stpmic1.o
diff --git a/drivers/mfd/airoha-en7581-gpio-mfd.c b/drivers/mfd/airoha-en7581-gpio-mfd.c
new file mode 100644
index 000000000000..7888c175f6c5
--- /dev/null
+++ b/drivers/mfd/airoha-en7581-gpio-mfd.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * MFD driver for Airoha EN7581
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/mfd/airoha-en7581-mfd.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+
+static struct resource airoha_mfd_pinctrl_intr[] = {
+	{
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+static const struct mfd_cell airoha_mfd_devs[] = {
+	{
+		.name = "pinctrl-airoha",
+		.resources = airoha_mfd_pinctrl_intr,
+		.num_resources = ARRAY_SIZE(airoha_mfd_pinctrl_intr),
+	}, {
+		.name = "airoha-pwm",
+	},
+};
+
+static int airoha_mfd_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct airoha_mfd *mfd;
+	int irq;
+
+	mfd = devm_kzalloc(dev, sizeof(*mfd), GFP_KERNEL);
+	if (!mfd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, mfd);
+
+	mfd->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mfd->base))
+		return PTR_ERR(mfd->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	airoha_mfd_pinctrl_intr[0].start = irq;
+	airoha_mfd_pinctrl_intr[0].end = irq;
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, airoha_mfd_devs,
+				    ARRAY_SIZE(airoha_mfd_devs), NULL, 0,
+				    NULL);
+}
+
+static const struct of_device_id airoha_mfd_of_match[] = {
+	{ .compatible = "airoha,en7581-gpio-sysctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, airoha_mfd_of_match);
+
+static struct platform_driver airoha_mfd_driver = {
+	.probe = airoha_mfd_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = airoha_mfd_of_match,
+	},
+};
+module_platform_driver(airoha_mfd_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for Airoha EN7581 MFD");
diff --git a/include/linux/mfd/airoha-en7581-mfd.h b/include/linux/mfd/airoha-en7581-mfd.h
new file mode 100644
index 000000000000..25e73952a777
--- /dev/null
+++ b/include/linux/mfd/airoha-en7581-mfd.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_INCLUDE_MFD_AIROHA_EN7581_MFD_H_
+#define _LINUX_INCLUDE_MFD_AIROHA_EN7581_MFD_H_
+
+struct airoha_mfd {
+	void __iomem *base;
+};
+
+#endif  /* _LINUX_INCLUDE_MFD_AIROHA_EN7581_MFD_H_ */

-- 
2.46.0


