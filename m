Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589A4C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 06:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F3C4206F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 06:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mIz+5n1V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BILbatnV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F3C4206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snDv/SnnwH6e4oyjofnsbaT5yxSJ5Ha8OJ0kxRQ/kmM=; b=mIz+5n1VKqex4/
	+eziFxBWUO3N5I/jKHzwWcfT2EE7RJWp+UYC8cHpuD1+B7jkmhmHE7Rg7SAKfHFeV9sox7vsTcb+i
	ltIzeRYJ7eUooZFvM19+VI8le5LHKbO2nNeS7m1zzScAJP/sEovIsqXSvhOjtdWxQz6VeXOl9aysR
	WGwdy4YjOtMw8mv8YFmLc2acSTBwn6/dNcMqYE4Brhqrq6zbVsgnxm90Lvwd7BshlOsGA1S2ItE0r
	16eeFnRk2GgVJ6owxHAjTcO2r3lLzTRmPU1VPfbuXJBy8cFFk4MY9ju0N7afnKtTPXyJ15sgeTGCu
	PU4hiqOtwJmtfVg+7HvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ7H6-00075v-NE; Thu, 14 May 2020 06:23:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ7Gf-0006dW-5V; Thu, 14 May 2020 06:22:54 +0000
X-UUID: 10005d8c7d904468806067474113e2f7-20200513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=g9sC2jBxkhC2QOUQLHZsKV5C8cEHAPu+zF8x7yzfdJM=; 
 b=BILbatnVkdiIbuQLOpCqcPeNez9L528Wqt8lQ9GD+LZhsOD7v6/EKFGvqOHXShQr/0zXIBmTRUpcqGuYultnwKG/Cv9cZ9mv6C8lD5EHiBc39zw+RW/MNTm1I9km3MmZcJ6aD9U16BIqQDRmDh56Wwz01GdYRmefQ/1KBgzJh9E=;
X-UUID: 10005d8c7d904468806067474113e2f7-20200513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1443143425; Wed, 13 May 2020 22:22:47 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 May 2020 23:21:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 14:21:34 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 14:21:33 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v7 2/3] drivers: input: keyboard: Add mtk keypad driver
Date: Thu, 14 May 2020 14:17:48 +0800
Message-ID: <20200514061747.25466-3-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514061747.25466-1-fengping.yu@mediatek.com>
References: <20200514061747.25466-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 56F992E7500F722AFCD75B8C62F31F147CFFD378102CA1068D068A4125932E722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_232253_214500_9E48A56E 
X-CRM114-Status: GOOD (  16.50  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

This adds matrix keypad support for Mediatek SoCs.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 drivers/input/keyboard/Kconfig   |   8 ++
 drivers/input/keyboard/Makefile  |   1 +
 drivers/input/keyboard/mtk-kpd.c | 223 +++++++++++++++++++++++++++++++
 3 files changed, 232 insertions(+)
 create mode 100644 drivers/input/keyboard/mtk-kpd.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 28de965a08d5..6bae95a5f90b 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -782,6 +782,14 @@ config KEYBOARD_BCM
 	  To compile this driver as a module, choose M here: the
 	  module will be called bcm-keypad.
 
+config KEYBOARD_MTK_KPD
+	tristate "MediaTek Keypad Support"
+	depends on OF && HAVE_CLK
+	help
+	  Say Y here if you want to use the keypad on MediaTek SoCs.
+	  If unsure, say N.
+	  To compile this driver as a module, choose M here: the
+	  module will be called mtk-kpd.
 config KEYBOARD_MTK_PMIC
 	tristate "MediaTek PMIC keys support"
 	depends on MFD_MT6397
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 1d689fdd5c00..6c9d852c377e 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
 obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
 obj-$(CONFIG_KEYBOARD_MCS)		+= mcs_touchkey.o
 obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
+obj-$(CONFIG_KEYBOARD_MTK_KPD)		+= mtk-kpd.o
 obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
 obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
 obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
diff --git a/drivers/input/keyboard/mtk-kpd.c b/drivers/input/keyboard/mtk-kpd.c
new file mode 100644
index 000000000000..a538f89d6696
--- /dev/null
+++ b/drivers/input/keyboard/mtk-kpd.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ * Author Terry Chang <terry.chang@mediatek.com>
+ */
+#include <linux/clk.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/bitops.h>
+
+#define KPD_NAME	"mtk-kpd"
+
+#define KP_MEM		0x0004
+#define KP_DEBOUNCE	0x0018
+
+#define KPD_DEBOUNCE_MASK	GENMASK(13, 0)
+#define KPD_DEBOUNCE_MAX_US	256000 /*256ms */
+#define KPD_NUM_MEMS	5
+#define KPD_NUM_BITS	136	/* 4 * 32 + 8 MEM5 only use 8 BITS */
+
+struct mtk_keypad {
+	struct regmap *regmap;
+	struct input_dev *input_dev;
+	struct clk *clk;
+	void __iomem *base;
+	bool wakeup;
+	u32 n_rows;
+	u32 n_cols;
+	DECLARE_BITMAP(keymap_state, KPD_NUM_BITS);
+};
+
+static const struct regmap_config keypad_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = sizeof(u32),
+	.max_register = 0x0024,
+};
+
+static irqreturn_t kpd_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_keypad *keypad = dev_id;
+	unsigned short *keycode = keypad->input_dev->keycode;
+	DECLARE_BITMAP(new_state, KPD_NUM_BITS);
+	DECLARE_BITMAP(change, KPD_NUM_BITS);
+	int bit_nr;
+	int pressed;
+	unsigned short code;
+
+	regmap_raw_read(keypad->regmap, KP_MEM, new_state, KPD_NUM_MEMS);
+
+	bitmap_xor(change, new_state, keypad->keymap_state, KPD_NUM_BITS);
+
+	for_each_set_bit(bit_nr, change, KPD_NUM_BITS) {
+		/* 1: not pressed, 0: pressed */
+		pressed = !test_bit(bit_nr, new_state);
+		dev_dbg(&keypad->input_dev->dev, "%s",
+			pressed ? "pressed" : "released");
+
+		/* 32bit register only use low 16bit as keypad mem register */
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
+	return IRQ_HANDLED;
+}
+
+static int kpd_pdrv_probe(struct platform_device *pdev)
+{
+	struct mtk_keypad *keypad;
+	struct pinctrl *keypad_pinctrl;
+	struct pinctrl_state *kpd_default;
+	unsigned int irqnr;
+	u32 debounce;
+	int ret;
+
+	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
+	if (!keypad)
+		return -ENOMEM;
+	keypad->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(keypad->base))
+		return PTR_ERR(keypad->base);
+
+	keypad->regmap = devm_regmap_init_mmio_clk(&pdev->dev, NULL,
+				keypad->base, &keypad_regmap_cfg);
+	if (IS_ERR(keypad->regmap)) {
+		dev_err(&pdev->dev,
+			"regmap init failed:%ld\n", PTR_ERR(keypad->regmap));
+		return PTR_ERR(keypad->regmap);
+	}
+
+	bitmap_fill(keypad->keymap_state, KPD_NUM_BITS);
+
+	keypad->input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!keypad->input_dev) {
+		dev_err(&pdev->dev, "Failed to allocate input dev\n");
+		return -ENOMEM;
+	}
+
+	keypad->input_dev->name = KPD_NAME;
+	keypad->input_dev->id.bustype = BUS_HOST;
+
+	ret = matrix_keypad_parse_properties(&pdev->dev, &keypad->n_rows,
+					     &keypad->n_cols);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to parse keypad params\n");
+		return ret;
+	}
+
+	ret = device_property_read_u32(&pdev->dev, "mediatek,debounce-us",
+					&debounce);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to read mediatek debounce time\n");
+		return ret;
+	}
+
+	if (debounce > KPD_DEBOUNCE_MAX_US) {
+		dev_err(&pdev->dev, "Debounce time exceeds the maximum allowed time 256ms\n");
+		return -EINVAL;
+	}
+
+	keypad->wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
+
+	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
+		keypad->n_rows, keypad->n_cols, debounce);
+
+	ret = matrix_keypad_build_keymap(NULL, NULL,
+					keypad->n_rows,
+					keypad->n_cols,
+					NULL,
+					keypad->input_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to build keymap\n");
+		return ret;
+	}
+
+	input_set_drvdata(keypad->input_dev, keypad);
+
+	regmap_write(keypad->regmap, KP_DEBOUNCE,
+			debounce * 32 / 1000 & KPD_DEBOUNCE_MASK);
+
+	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
+	if (IS_ERR(keypad->clk)) {
+		return PTR_ERR(keypad->clk);
+	}
+
+	ret = clk_prepare_enable(keypad->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
+		return ret;
+	}
+
+	devm_add_action_or_reset(&pdev->dev,
+				(void (*)(void *))clk_disable_unprepare,
+				keypad->clk);
+
+	keypad_pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(keypad_pinctrl)) {
+		return PTR_ERR(keypad_pinctrl);
+	}
+
+	kpd_default = pinctrl_lookup_state(keypad_pinctrl, "default");
+	if (IS_ERR(kpd_default)) {
+		dev_err(&pdev->dev, "No default pinctrl state\n");
+		return PTR_ERR(kpd_default);
+	}
+
+	pinctrl_select_state(keypad_pinctrl, kpd_default);
+
+	irqnr = platform_get_irq(pdev, 0);
+	if (irqnr < 0) {
+		dev_err(&pdev->dev, "Failed to get irq\n");
+		return -irqnr;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, irqnr,
+				NULL, kpd_irq_handler, 0,
+				KPD_NAME, keypad);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
+						irqnr, ret);
+		return ret;
+	}
+
+	ret = input_register_device(keypad->input_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register device\n");
+		return ret;
+	}
+
+	device_init_wakeup(&pdev->dev, keypad->wakeup);
+
+	return 0;
+}
+
+static const struct of_device_id kpd_of_match[] = {
+	{.compatible = "mediatek,kp"},
+	{/*sentinel*/}
+};
+
+static struct platform_driver kpd_pdrv = {
+	.probe = kpd_pdrv_probe,
+	.driver = {
+		   .name = KPD_NAME,
+		   .of_match_table = kpd_of_match,
+	},
+};
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
