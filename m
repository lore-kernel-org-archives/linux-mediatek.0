Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD13C2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 02:15:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FBAD2064A
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 02:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bSgNAYI8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ogBXc76W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FBAD2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXII2ygsEV7Y5OmBdRcjAVafDa46mEtSOcoXPSvzzZ4=; b=bSgNAYI8a2VzN9
	DjYRGsmycOSpctUHEy4j17NvnHJBPF5wAmPCJEchXd6PVZOXVg709+ojhN90pSteetOO5q/xWvB+5
	gVSHNRsK4yxk7K9KL7s3HdFR+MjweUyToHHvEuUqJOVuGu2aGQS3UBA9H1y4R3pePXomUQvXf3SWg
	xyw/MmEyhvLKGa9GcvNYe1sHipLpw4D+tsWJX9srp0CXpRMQyw/K8Ked3G5/2Iin9xvUImv9lz5vm
	vvykAENI3U5KaY9NcD/+DBHxFgdczU1Gscktztxzqg91yEzNra4PNjA+znPVzLVCVCJX0YKDwMRN1
	ZcpnEnWHtaL81PCqbWxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKuop-0003on-4B; Sun, 05 Apr 2020 02:15:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKuol-0003oC-Pr
 for linux-mediatek@lists.infradead.org; Sun, 05 Apr 2020 02:15:25 +0000
X-UUID: 9c0ab3e7efb74d31b9461ba6712599d0-20200404
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=llhQA1K6I1tPay0PbSEnayOn0ITylWJT4Yry8b8ARfM=; 
 b=ogBXc76W/nyJWkjdXWGjh+gjR7fIDH9IdY0F+t25qy/r37EldqR2MiDMeAbdvqJC9gAoTNICrbhowiwUSbZ+WHp6wusxGdYD7y7iNRClUa3fmQtN7kWsvjlnD/aqBGDzwyZZwYryG8EMYxH3n+fRKe06PesSkxuMf036LqBzT30=;
X-UUID: 9c0ab3e7efb74d31b9461ba6712599d0-20200404
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1669946434; Sat, 04 Apr 2020 18:15:18 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Apr 2020 19:05:16 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Apr 2020 10:04:58 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 5 Apr 2020 10:04:57 +0800
From: Fengping yu <fengping.yu@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v3 2/2] add MediaTek keypad driver
Date: Sun, 5 Apr 2020 10:01:18 +0800
Message-ID: <20200405020114.14787-3-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200405020114.14787-1-fengping.yu@mediatek.com>
References: <20200405020114.14787-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EA6AA74A798C0D1E571C802D75556B2CBB722044213DE4A86418C06A39CFB6C62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_191523_855800_EE2A6600 
X-CRM114-Status: GOOD (  15.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "fengping.yu" <fengping.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 arch/arm64/configs/defconfig     |   1 +
 drivers/input/keyboard/Kconfig   |   7 +
 drivers/input/keyboard/Makefile  |   1 +
 drivers/input/keyboard/mtk-kpd.c | 258 +++++++++++++++++++++++++++++++
 4 files changed, 267 insertions(+)
 create mode 100644 drivers/input/keyboard/mtk-kpd.c

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0f212889c931..7863352521e5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -316,6 +316,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_MTK_KPD=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_INPUT_MISC=y
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 4706ff09f0e8..0ddb753f7d7e 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -772,6 +772,13 @@ config KEYBOARD_BCM
 	  To compile this driver as a module, choose M here: the
 	  module will be called bcm-keypad.
 
+config KEYBOARD_MTK_KPD
+	tristate "MediaTek Keypad Support"
+	help
+	  Say Y here if you want to use the keypad.
+	  If unuse, say N.
+	  To compile this driver as a module, choose M here: the
+	  module will be called mtk-kpd.
 config KEYBOARD_MTK_PMIC
 	tristate "MediaTek PMIC keys support"
 	depends on MFD_MT6397
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index f5b17524adf2..63324d3e36c5 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
 obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
 obj-$(CONFIG_KEYBOARD_MCS)		+= mcs_touchkey.o
 obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
+obj-$(CONFIG_KEYBOARD_MTK_KPD)		+= mtk-kpd.o
 obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
 obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
 obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
diff --git a/drivers/input/keyboard/mtk-kpd.c b/drivers/input/keyboard/mtk-kpd.c
new file mode 100644
index 000000000000..8c27d07c9e7f
--- /dev/null
+++ b/drivers/input/keyboard/mtk-kpd.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ * Author Terry Chang <terry.chang@mediatek.com>
+ */
+#include <linux/clk.h>
+#include <linux/fs.h>
+#include <linux/gpio.h>
+#include <linux/init.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+
+#define KPD_NAME	"mtk-kpd"
+
+#define KP_STA		0x0000
+#define KP_MEM		0x0004
+#define KP_DEBOUNCE	0x0018
+
+#define KPD_DEBOUNCE_MASK	GENMASK(13, 0)
+#define KPD_DEBOUNCE_MAX	256000
+#define KPD_NUM_MEMS	5
+#define KPD_NUM_BITS	136	/* 4 * 32 + 8 MEM5 only use 8 BITS */
+#define BITS_TO_U32(nr)	DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(u32))
+
+struct mtk_keypad {
+	struct input_dev *input_dev;
+	struct clk *clk;
+	void __iomem *base;
+	unsigned int irqnr;
+	bool wakeup;
+	u32 key_debounce;
+	u32 n_rows;
+	u32 n_cols;
+	DECLARE_BITMAP(keymap_state, KPD_NUM_BITS);
+};
+
+static irqreturn_t kpd_irq_handler(int irq, void *dev_id)
+{
+	/* use _nosync to avoid deadlock */
+	struct mtk_keypad *keypad = dev_id;
+	unsigned short *keycode = keypad->input_dev->keycode;
+	DECLARE_BITMAP(new_state, KPD_NUM_BITS);
+	DECLARE_BITMAP(change, KPD_NUM_BITS);
+	int bit_nr;
+	int pressed;
+	unsigned short code;
+
+	disable_irq_nosync(keypad->irqnr);
+
+	memcpy_fromio(new_state, keypad->base + KP_MEM, KPD_NUM_MEMS);
+
+	bitmap_xor(change, new_state, keypad->keymap_state, KPD_NUM_BITS);
+
+	for_each_set_bit(bit_nr, change, KPD_NUM_BITS) {
+		pressed = test_bit(bit_nr, new_state) == 0U;
+		dev_dbg(&keypad->input_dev->dev, "%s",
+			pressed ? "pressed" : "released");
+
+	/* per 32bit register only use low 16bit as keypad mem register */
+		code = keycode[bit_nr - 16 * (BITS_TO_U32(bit_nr) - 1)];
+
+		input_report_key(keypad->input_dev, code, pressed);
+		input_sync(keypad->input_dev);
+
+		dev_dbg(&keypad->input_dev->dev,
+			"report Linux keycode = %d\n", code);
+	}
+
+	bitmap_copy(keypad->keymap_state, new_state, KPD_NUM_BITS);
+
+	enable_irq(keypad->irqnr);
+
+	return IRQ_HANDLED;
+}
+
+static int kpd_get_dts_info(struct mtk_keypad *keypad)
+{
+	int ret;
+	struct device *dev = keypad->input_dev->dev.parent;
+	struct device_node *node = dev->of_node;
+
+	ret = matrix_keypad_parse_properties(dev, &keypad->n_rows,
+					     &keypad->n_cols);
+
+	if (ret) {
+		dev_err(dev, "failed to parse keypad params.\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(node, "mediatek,debounce-us",
+				   &keypad->key_debounce);
+	if (ret) {
+		dev_err(dev, "read mediatek,debounce-us error.\n");
+		return ret;
+	}
+
+	if (keypad->key_debounce > KPD_DEBOUNCE_MAX) {
+		dev_err(dev, "debounce time exceeds the maximum allowed time 256ms.\n");
+		return -EINVAL;
+	}
+
+	keypad->wakeup = of_property_read_bool(node, "wakeup-source");
+
+	dev_dbg(dev, "n_row=%d n_col=%d debounce=%d.\n",
+		keypad->n_rows, keypad->n_cols,
+		keypad->key_debounce);
+
+	return 0;
+}
+
+static int kpd_gpio_init(struct device *dev)
+{
+	struct pinctrl *keypad_pinctrl;
+	struct pinctrl_state *kpd_default;
+
+	keypad_pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(keypad_pinctrl)) {
+		dev_err(dev, "Cannot find keypad_pinctrl!\n");
+		return PTR_ERR(keypad_pinctrl);
+	}
+
+	kpd_default = pinctrl_lookup_state(keypad_pinctrl, "default");
+	if (IS_ERR(kpd_default)) {
+		dev_err(dev, "Cannot find ecall_state!\n");
+		return PTR_ERR(kpd_default);
+	}
+
+	return pinctrl_select_state(keypad_pinctrl,	kpd_default);
+}
+
+static int kpd_pdrv_probe(struct platform_device *pdev)
+{
+	struct mtk_keypad *keypad;
+	int ret;
+
+	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
+	if (!keypad)
+		return -ENOMEM;
+
+	bitmap_fill(keypad->keymap_state, KPD_NUM_BITS);
+
+	keypad->input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!keypad->input_dev) {
+		dev_err(&pdev->dev, "input allocate device fail.\n");
+		return -ENOMEM;
+	}
+
+	keypad->input_dev->name = KPD_NAME;
+	keypad->input_dev->id.bustype = BUS_HOST;
+	keypad->input_dev->dev.parent = &pdev->dev;
+
+	ret = kpd_get_dts_info(keypad);
+	if (ret) {
+		dev_err(&pdev->dev, "get dts info failed.\n");
+		return ret;
+	}
+
+	ret = matrix_keypad_build_keymap(NULL, NULL,
+					keypad->n_rows,
+					keypad->n_cols,
+					NULL,
+					keypad->input_dev);
+
+	if (ret) {
+		dev_err(&pdev->dev, "build keymap failed.\n");
+		return ret;
+	}
+
+	input_set_drvdata(keypad->input_dev, keypad);
+
+	keypad->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(keypad->base)) {
+		dev_err(&pdev->dev, "KP iomap failed\n");
+		return PTR_ERR(keypad->base);
+	}
+
+	if (keypad->key_debounce > KPD_DEBOUNCE_MAX) {
+		dev_err(&pdev->dev, "invalid debounce time value.\n");
+		return -EINVAL;
+	}
+
+	writew(keypad->key_debounce * 32 / 1000 & KPD_DEBOUNCE_MASK,
+		keypad->base + KP_DEBOUNCE);
+
+	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
+	if (IS_ERR(keypad->clk)) {
+		dev_err(&pdev->dev, "get kpd-clk fail.\n");
+		return PTR_ERR(keypad->clk);
+	}
+
+	ret = clk_prepare_enable(keypad->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "kpd-clk enable failed.\n");
+		return ret;
+	}
+
+	ret = kpd_gpio_init(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "gpio init failed\n");
+		goto disable_kpd_clk;
+	}
+
+	keypad->irqnr = platform_get_irq(pdev, 0);
+	if (keypad->irqnr < 0) {
+		dev_err(&pdev->dev, "KP get irqnr failed\n");
+		ret = -keypad->irqnr;
+		goto disable_kpd_clk;
+	}
+
+	ret = devm_request_irq(&pdev->dev, keypad->irqnr,
+				kpd_irq_handler, 0,
+				KPD_NAME, keypad);
+	if (ret) {
+		dev_err(&pdev->dev, "register IRQ failed.\n");
+		goto disable_kpd_clk;
+	}
+
+	ret = input_register_device(keypad->input_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "register input device failed.\n");
+		goto disable_kpd_clk;
+	}
+
+	device_init_wakeup(&pdev->dev, keypad->wakeup);
+
+	platform_set_drvdata(pdev, keypad);
+
+	return 0;
+
+disable_kpd_clk:
+	clk_disable_unprepare(keypad->clk);
+	return ret;
+}
+
+static const struct of_device_id kpd_of_match[] = {
+	{.compatible = "mediatek,kp"},
+	{}
+};
+
+static struct platform_driver kpd_pdrv = {
+	.probe = kpd_pdrv_probe,
+	.driver = {
+		   .name = KPD_NAME,
+		   .of_match_table = kpd_of_match,
+	},
+};
+
+module_platform_driver(kpd_pdrv);
+
+MODULE_AUTHOR("Mediatek Corporation");
+MODULE_DESCRIPTION("MTK Keypad (KPD) Driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
