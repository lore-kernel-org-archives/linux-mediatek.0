Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D25EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 09:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 418062075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 09:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="js7K//lm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 418062075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAo5xETV0rDmv7d8lttAcppqkyVOEHXUky3Rlv+g4NE=; b=js7K//lmTSiCQh
	MeW56ytC5SIa73Y2rWh6BM6PDU0VEXmcj4NfpqioaQReOqqcVM/5yPBlCCskDJSj8lsO+hU6oTPoo
	xGM7HEmAXN6n+aj1o+7oACF5cvTrE/2SEp9NS9EPt3SjWA8rm7qquLt+AowGphUQkOnm7VNFiOcFE
	B51HiVKuk5gF3LFKXKNqCW4goA55tNUB6kmeo0ck60YAHcxWCzvo++ilVAZFuHA2gnZpomgadAJYh
	qNfxmD6oELh11Y/m4TEYN3EtAARDoMhaXY8gi0QeL+JIPXUreFjjxIdqiA7r2F6iI6qnTVHoib+aA
	ZrWrfG8bApcia+CEEhUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeEoO-0005VC-4K; Thu, 28 May 2020 09:26:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeEo6-0005Ew-CE
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 09:26:36 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jeEnz-0004AA-37; Thu, 28 May 2020 11:26:27 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jeEny-0003M9-K9; Thu, 28 May 2020 11:26:26 +0200
Date: Thu, 28 May 2020 11:26:26 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v10 2/3] drivers: input: keyboard: Add mtk keypad driver
Message-ID: <20200528092626.mo6fqdruvqfvm7qf@pengutronix.de>
References: <20200528084143.36482-1-fengping.yu@mediatek.com>
 <20200528084143.36482-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528084143.36482-3-fengping.yu@mediatek.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:26:14 up 195 days, 44 min, 196 users, load average: 0.11, 0.11, 
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_022634_584286_2B0F1C0D 
X-CRM114-Status: GOOD (  21.99  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20-05-28 16:41, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This adds matrix keypad support for Mediatek SoCs.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>


Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

> ---
>  drivers/input/keyboard/Kconfig   |  11 ++
>  drivers/input/keyboard/Makefile  |   1 +
>  drivers/input/keyboard/mtk-kpd.c | 206 +++++++++++++++++++++++++++++++
>  3 files changed, 218 insertions(+)
>  create mode 100644 drivers/input/keyboard/mtk-kpd.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 28de965a08d5..c55230c4c344 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -782,6 +782,17 @@ config KEYBOARD_BCM
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called bcm-keypad.
>  
> +config KEYBOARD_MTK_KPD
> +	tristate "MediaTek Keypad Support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	select CONFIG_REGMAP_MMIO
> +	select INPUT_MATRIXKMAP
> +	help
> +	  Say Y here if you want to use the keypad on MediaTek SoCs.
> +	  If unsure, say N.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called mtk-kpd.
> +
>  config KEYBOARD_MTK_PMIC
>  	tristate "MediaTek PMIC keys support"
>  	depends on MFD_MT6397
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 1d689fdd5c00..6c9d852c377e 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -43,6 +43,7 @@ obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
>  obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
>  obj-$(CONFIG_KEYBOARD_MCS)		+= mcs_touchkey.o
>  obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
> +obj-$(CONFIG_KEYBOARD_MTK_KPD)		+= mtk-kpd.o
>  obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
>  obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
>  obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
> diff --git a/drivers/input/keyboard/mtk-kpd.c b/drivers/input/keyboard/mtk-kpd.c
> new file mode 100644
> index 000000000000..2900487c8f60
> --- /dev/null
> +++ b/drivers/input/keyboard/mtk-kpd.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + * Author Terry Chang <terry.chang@mediatek.com>
> + */
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/input/matrix_keypad.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define MTK_KPD_NAME		"mtk-kpd"
> +#define MTK_KPD_MEM		0x0004
> +#define MTK_KPD_DEBOUNCE	0x0018
> +#define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
> +#define MTK_KPD_DEBOUNCE_MAX_US	256000
> +#define MTK_KPD_NUM_MEMS	5
> +#define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
> +
> +struct mtk_keypad {
> +	struct regmap *regmap;
> +	struct input_dev *input_dev;
> +	struct clk *clk;
> +	void __iomem *base;
> +	u32 n_rows;
> +	u32 n_cols;
> +	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
> +};
> +
> +static const struct regmap_config keypad_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = sizeof(u32),
> +	.max_register = 36,
> +};
> +
> +static irqreturn_t kpd_irq_handler(int irq, void *dev_id)
> +{
> +	struct mtk_keypad *keypad = dev_id;
> +	unsigned short *keycode = keypad->input_dev->keycode;
> +	DECLARE_BITMAP(new_state, MTK_KPD_NUM_BITS);
> +	DECLARE_BITMAP(change, MTK_KPD_NUM_BITS);
> +	int bit_nr;
> +	int pressed;
> +	unsigned short code;
> +
> +	regmap_raw_read(keypad->regmap, MTK_KPD_MEM,
> +			new_state, MTK_KPD_NUM_MEMS);
> +
> +	bitmap_xor(change, new_state, keypad->keymap_state, MTK_KPD_NUM_BITS);
> +
> +	for_each_set_bit(bit_nr, change, MTK_KPD_NUM_BITS) {
> +		/* 1: not pressed, 0: pressed */
> +		pressed = !test_bit(bit_nr, new_state);
> +		dev_dbg(&keypad->input_dev->dev, "%s",
> +			pressed ? "pressed" : "released");
> +
> +		/* 32bit register only use low 16bit as keypad mem register */
> +		code = keycode[bit_nr - 16 * (BITS_TO_U32(bit_nr) - 1)];
> +
> +		input_report_key(keypad->input_dev, code, pressed);
> +		input_sync(keypad->input_dev);
> +
> +		dev_dbg(&keypad->input_dev->dev,
> +			"report Linux keycode = %d\n", code);
> +	}
> +
> +	bitmap_copy(keypad->keymap_state, new_state, MTK_KPD_NUM_BITS);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void kpd_clk_disable(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}
> +
> +static int kpd_pdrv_probe(struct platform_device *pdev)
> +{
> +	struct mtk_keypad *keypad;
> +	unsigned int irq;
> +	u32 debounce;
> +	bool wakeup;
> +	int ret;
> +
> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> +	if (!keypad)
> +		return -ENOMEM;
> +
> +	keypad->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(keypad->base))
> +		return PTR_ERR(keypad->base);
> +
> +	keypad->regmap = devm_regmap_init_mmio(&pdev->dev,
> +					       keypad->base,
> +					       &keypad_regmap_cfg);
> +	if (IS_ERR(keypad->regmap)) {
> +		dev_err(&pdev->dev,
> +			"regmap init failed:%ld\n", PTR_ERR(keypad->regmap));
> +		return PTR_ERR(keypad->regmap);
> +	}
> +
> +	bitmap_fill(keypad->keymap_state, MTK_KPD_NUM_BITS);
> +
> +	keypad->input_dev = devm_input_allocate_device(&pdev->dev);
> +	if (!keypad->input_dev) {
> +		dev_err(&pdev->dev, "Failed to allocate input dev\n");
> +		return -ENOMEM;
> +	}
> +
> +	keypad->input_dev->name = MTK_KPD_NAME;
> +	keypad->input_dev->id.bustype = BUS_HOST;
> +
> +	ret = matrix_keypad_parse_properties(&pdev->dev, &keypad->n_rows,
> +					     &keypad->n_cols);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to parse keypad params\n");
> +		return ret;
> +	}
> +
> +	if (device_property_read_u32(&pdev->dev, "mediatek,debounce-us",
> +				     &debounce))
> +		debounce = 16000;
> +
> +	if (debounce > MTK_KPD_DEBOUNCE_MAX_US) {
> +		dev_err(&pdev->dev, "Debounce time exceeds the maximum allowed time %dus\n",
> +			MTK_KPD_DEBOUNCE_MAX_US);
> +		return -EINVAL;
> +	}
> +
> +	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
> +
> +	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
> +		keypad->n_rows, keypad->n_cols, debounce);
> +
> +	ret = matrix_keypad_build_keymap(NULL, NULL,
> +					 keypad->n_rows,
> +					 keypad->n_cols,
> +					 NULL,
> +					 keypad->input_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to build keymap\n");
> +		return ret;
> +	}
> +
> +	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
> +		     debounce * 32 / 1000 & MTK_KPD_DEBOUNCE_MASK);
> +
> +	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
> +	if (IS_ERR(keypad->clk))
> +		return keypad->clk;
> +
> +	ret = clk_prepare_enable(keypad->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, kpd_clk_disable,
> +				       keypad->clk);
> +	if (ret)
> +		return ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
> +					NULL, kpd_irq_handler, 0,
> +					MTK_KPD_NAME, keypad);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
> +			irq, ret);
> +		return ret;
> +	}
> +
> +	ret = input_register_device(keypad->input_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register device\n");
> +		return ret;
> +	}
> +
> +	return device_init_wakeup(&pdev->dev, wakeup);
> +}
> +
> +static const struct of_device_id kpd_of_match[] = {
> +	{ .compatible = "mediatek,mt6779-keypad" },
> +	{ .compatible = "mediatek,mt6873-keypad" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver kpd_pdrv = {
> +	.probe = kpd_pdrv_probe,
> +	.driver = {
> +		   .name = MTK_KPD_NAME,
> +		   .of_match_table = kpd_of_match,
> +	},
> +};
> +module_platform_driver(kpd_pdrv);
> +
> +MODULE_AUTHOR("Mediatek Corporation");
> +MODULE_DESCRIPTION("MTK Keypad (KPD) Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.18.0

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
