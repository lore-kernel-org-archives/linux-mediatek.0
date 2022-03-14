Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039E7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsco7gMaU9T+bdp9yQOgVOKmsJlag7JkoluS64YyLK0=; b=K6fUMTgfGGVrxQ
	hVrG6Uoo7D8SO2wx5zX9/VlI4gkTy8U4tNmQkggdRzsLShywL8xqbxp+U6DoiUj3EZj/tJwXzdU2c
	0Jgb9+20ONFz4HuGmcBfWA3vPIsxet1MA8jZ0WE5IUx+N+s7GsyjMWU9Uz8pN/R889bZYFyOqVdS0
	Jm57utLL4Nekjgwle9n7tV97y/ot8+HqenBvCSn76qnAFqavTGGvfDWzUfzeHsM1Q8SpaGE1E7G54
	nf6xknxo5s/o4lIgUWTwO5OlQSl4CR/Clv2+sYYsOYQZu3swgbplLwc2V+uWFPXRCFiDluN/8yDKI
	SV3z67jxlKakaziQ/EFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfo2-004MOS-IS; Mon, 14 Mar 2022 08:11:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfa7-004GCY-Cr
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 07:57:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so11423700wmj.0
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nPuSg7n2qJ3zesvTh0PRxzk6EuxtDHMYDQkTqcTuLeI=;
 b=JfSU4VbulvXOIO86mS1JDC+ShVWeElgKCjJqRvU5g/zxMbc/fjjzACbyi/D5kocxJ/
 2Eta/5Npj0XUSl33rXAAvSrjGKUW9f6C8TiUxq7MuSP2VLGY5oLthoKvKp+y2GCCnW9f
 +g2gwpmIPEJ6tihQUe/i32qnFhya16zCsN9WP9d5vThyR0C1fAd6gNpj8YkyzS7DORqR
 R9S1Jb8QapFQtDR29AYrw2rP+SbYhnUZhfqu8N311OAne9sYZH6j4eM01q9LVXE1PI6Z
 cTLatTJI3DF5bvSR2LgTu+ok128ID8IV7beeUmwpX52+q1TfvECzr1hPXGA3YqGvoWw2
 vGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nPuSg7n2qJ3zesvTh0PRxzk6EuxtDHMYDQkTqcTuLeI=;
 b=MPM8ZpGnm76Qvk4e+pWFNQ2kAEUoMYeuNRD2JL/R67bNo5eaaZsb+x7rey0bxgqNw3
 GKoeA3Me3PjNKOxttfeJEjcwB5EopT6DXx3pVtIHIU/lYunQtEiqtb8yHCEHW9wHS/ap
 wt0T5VGTKApg7yEjpFnQwBKS6MiA8NFxZASM4DejmnK70Vel5oyn2CQbMGYDOjz38tOT
 OQt6SkrBVj+8XjtsDE4VUUMVNEduvUL36r0pgZhgRHtR3u3CDLQGLeLKgewKMN1b9DRm
 EpxHmW20421c9FDbJPSuS38R395r59osDWGHqpUQbXWzLQ0fAn/eqOgatb8eZX6Ig+cT
 eFcA==
X-Gm-Message-State: AOAM532Op4PzANA3lbBISdu+Uua9PSENYAqEYcqC4OCRAkPFWmqF92p+
 LFFHt1ACcXqFuN3QeQzIpCAUUA==
X-Google-Smtp-Source: ABdhPJwCQJGx9gxLkRgvhXP10YIplO6UtL/E81eUosfnaiAKMp6XhZ2xXQO+uuFVcAcjhsd2Vya8gg==
X-Received: by 2002:a7b:cb46:0:b0:37b:dd79:e1c4 with SMTP id
 v6-20020a7bcb46000000b0037bdd79e1c4mr16512293wmj.39.1647244648939; 
 Mon, 14 Mar 2022 00:57:28 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:bcd3:63d9:c9dc:840d])
 by smtp.gmail.com with ESMTPSA id
 185-20020a1c19c2000000b0038a1d06e862sm116964wmz.14.2022.03.14.00.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 00:57:28 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Marco Felsch
 <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
In-Reply-To: <300114e2-6794-db3c-a51c-3f900b6476f9@collabora.com>
References: <20220303154302.252041-1-mkorpershoek@baylibre.com>
 <20220303154302.252041-3-mkorpershoek@baylibre.com>
 <300114e2-6794-db3c-a51c-3f900b6476f9@collabora.com>
Date: Mon, 14 Mar 2022 08:57:27 +0100
Message-ID: <87h781rmoo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_005731_588045_BC2B0A92 
X-CRM114-Status: GOOD (  36.57  )
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

On ven., mars 04, 2022 at 11:31, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 03/03/22 16:43, Mattijs Korpershoek ha scritto:
>> From: "fengping.yu" <fengping.yu@mediatek.com>
>> 
>> This patch adds matrix keypad support for Mediatek SoCs.
>> 
>> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>
> Hello Mattijs,
> thanks for the patch!
>
> However, to make it perfect, there's something to improve....
Hi Angelo,

Thank you for your detailed review, It's really appreciated!
>
>> ---
>>   drivers/input/keyboard/Kconfig         |  12 ++
>>   drivers/input/keyboard/Makefile        |   1 +
>>   drivers/input/keyboard/mt6779-keypad.c | 215 +++++++++++++++++++++++++
>>   3 files changed, 228 insertions(+)
>>   create mode 100644 drivers/input/keyboard/mt6779-keypad.c
>> 
>> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
>> index 0c607da9ee10..03a9530f620e 100644
>> --- a/drivers/input/keyboard/Kconfig
>> +++ b/drivers/input/keyboard/Kconfig
>> @@ -779,6 +779,18 @@ config KEYBOARD_BCM
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called bcm-keypad.
>>   
>> +config KEYBOARD_MT6779
>> +	tristate "MediaTek Keypad Support"
>> +	depends on ARCH_MEDIATEK || COMPILE_TEST
>> +	select REGMAP_MMIO
>> +	select INPUT_MATRIXKMAP
>> +	help
>> +	  Say Y here if you want to use the keypad on MediaTek SoCs.
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called mt6779-keypad.
>> +
>>   config KEYBOARD_MTK_PMIC
>>   	tristate "MediaTek PMIC keys support"
>>   	depends on MFD_MT6397
>> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
>> index e3c8648f834e..721936e90290 100644
>> --- a/drivers/input/keyboard/Makefile
>> +++ b/drivers/input/keyboard/Makefile
>> @@ -44,6 +44,7 @@ obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
>>   obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
>>   obj-$(CONFIG_KEYBOARD_MCS)		+= mcs_touchkey.o
>>   obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
>> +obj-$(CONFIG_KEYBOARD_MT6779)		+= mt6779-keypad.o
>>   obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
>>   obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
>>   obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
>> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
>> new file mode 100644
>> index 000000000000..b207acdd1e2a
>> --- /dev/null
>> +++ b/drivers/input/keyboard/mt6779-keypad.c
>> @@ -0,0 +1,215 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2022 MediaTek Inc.
>> + * Author Fengping Yu <fengping.yu@mediatek.com>
>> + */
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/input/matrix_keypad.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/property.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#define MTK_KPD_NAME		"mt6779-keypad"
>> +#define MTK_KPD_MEM		0x0004
>> +#define MTK_KPD_DEBOUNCE	0x0018
>> +#define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
>> +#define MTK_KPD_DEBOUNCE_MAX_MS	256
>> +#define MTK_KPD_NUM_MEMS	5
>> +#define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
>> +
>> +struct mt6779_keypad {
>> +	struct regmap *regmap;
>> +	struct input_dev *input_dev;
>> +	struct clk *clk;
>> +	void __iomem *base;
>> +	u32 n_rows;
>> +	u32 n_cols;
>> +	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
>> +};
>> +
>> +static const struct regmap_config mt6779_keypad_regmap_cfg = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = sizeof(u32),
>> +	.max_register = 36,
>
> Are you sure that you can't use .fast_io = true?
I am not sure at all. I did not think twice about this.
>
> Another version for the same question:
> Are you sure that you need to lock with a mutex here, and not with a spinlock?
>
> Since you're performing reads over a MMIO, I think that there's a very good
> chance that you can use fast_io.
Thank you for this suggestion. I might send a follow-up series with this
improvement included.
Will cc you if I do.

>
>> +};
>> +
>> +static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct mt6779_keypad *keypad = dev_id;
>> +	unsigned short *keycode = keypad->input_dev->keycode;
>> +	DECLARE_BITMAP(new_state, MTK_KPD_NUM_BITS);
>> +	DECLARE_BITMAP(change, MTK_KPD_NUM_BITS);
>> +	int bit_nr;
>> +	int pressed;
>> +	unsigned short code;
>> +	int row, col;
>> +	int row_shift = get_count_order(keypad->n_cols);
>> +
>> +	regmap_bulk_read(keypad->regmap, MTK_KPD_MEM,
>> +			 new_state, MTK_KPD_NUM_MEMS);
>> +
>> +	bitmap_xor(change, new_state, keypad->keymap_state, MTK_KPD_NUM_BITS);
>> +
>> +	for_each_set_bit(bit_nr, change, MTK_KPD_NUM_BITS) {
>> +	/* For 32bits register, only bits [15:0] use to indicate key status */
>> +		if (bit_nr % 32 >= 16)
>> +			continue;
>> +
>> +		/* 1: not pressed, 0: pressed */
>> +		pressed = !test_bit(bit_nr, new_state);
>> +		dev_dbg(&keypad->input_dev->dev, "%s",
>> +			pressed ? "pressed" : "released");
>> +
>> +		row = bit_nr / 32;
>> +		col = bit_nr % 32;
>> +
>> +		code = keycode[MATRIX_SCAN_CODE(row, col, row_shift)];
>> +
>> +		input_report_key(keypad->input_dev, code, pressed);
>> +		input_sync(keypad->input_dev);
>> +
>> +		dev_dbg(&keypad->input_dev->dev,
>> +			"report Linux keycode = %d\n", code);
>> +	}
>> +
>> +	bitmap_copy(keypad->keymap_state, new_state, MTK_KPD_NUM_BITS);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void mt6779_keypad_clk_disable(void *data)
>> +{
>> +	clk_disable_unprepare(data);
>> +}
>> +
>> +static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>> +{
>> +	struct mt6779_keypad *keypad;
>> +	unsigned int irq;
>> +	u32 debounce;
>> +	bool wakeup;
>> +	int error;
>> +
>> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
>> +	if (!keypad)
>> +		return -ENOMEM;
>> +
>> +	keypad->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(keypad->base))
>> +		return PTR_ERR(keypad->base);
>> +
>> +	keypad->regmap = devm_regmap_init_mmio(&pdev->dev,
>> +					       keypad->base,
>> +					       &mt6779_keypad_regmap_cfg);
>
> Please use dev_err_probe() to simplify error handling in probe functions: you've
> done a great job with adding a devm action for the error cases, avoiding gotos to
> get out cleanly.. it would be a pity to not finish this to perfection.
>
> I'll give you two examples for this, so that you'll be all set.
>
> 	if (IS_ERR(keypad->regmap))
> 		return dev_err_probe(&pdev->dev, PTR_ERR(keypad->regmap),
> 				     "regmap init failed\n");
>
> P.S.: No need for %pe here, as dev_err_probe prints the error number for you!
I did not know about dev_err_probe(). As far as I understand, it's not
recommended to be used for input drivers, but I'll definitely use it for
other subsystems.

>
>> +	if (IS_ERR(keypad->regmap)) {
>> +		dev_err(&pdev->dev,
>> +			"regmap init failed:%pe\n", keypad->regmap);
>> +		return PTR_ERR(keypad->regmap);
>> +	}
>> +
>> +	bitmap_fill(keypad->keymap_state, MTK_KPD_NUM_BITS);
>> +
>> +	keypad->input_dev = devm_input_allocate_device(&pdev->dev);
>
> 	if (!keypad->input_dev)
> 		return dev_err_probe(&pdev->dev, -ENOMEM,
> 				     "Cannot allocate input device\n");
>
>> +	if (!keypad->input_dev) {
>> +		dev_err(&pdev->dev, "Failed to allocate input dev\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	keypad->input_dev->name = MTK_KPD_NAME;
>> +	keypad->input_dev->id.bustype = BUS_HOST;
>> +
>> +	error = matrix_keypad_parse_properties(&pdev->dev, &keypad->n_rows,
>> +					       &keypad->n_cols);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "Failed to parse keypad params\n");
>> +		return error;
>> +	}
>> +
>> +	if (device_property_read_u32(&pdev->dev, "debounce-delay-ms",
>> +				     &debounce))
>> +		debounce = 16;
>> +
>> +	if (debounce > MTK_KPD_DEBOUNCE_MAX_MS) {
>> +		dev_err(&pdev->dev, "Debounce time exceeds the maximum allowed time %dms\n",
>> +			MTK_KPD_DEBOUNCE_MAX_MS);
>> +		return -EINVAL;
>> +	}
>> +
>> +	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
>> +
>> +	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
>> +		keypad->n_rows, keypad->n_cols, debounce);
>> +
>> +	error = matrix_keypad_build_keymap(NULL, NULL,
>> +					   keypad->n_rows,
>> +					   keypad->n_cols,
>> +					   NULL,
>> +					   keypad->input_dev);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "Failed to build keymap\n");
>> +		return error;
>> +	}
>> +
>> +	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
>> +		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
>> +
>> +	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
>> +	if (IS_ERR(keypad->clk))
>> +		return PTR_ERR(keypad->clk);
>> +
>> +	error = clk_prepare_enable(keypad->clk);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
>> +		return error;
>> +	}
>> +
>> +	error = devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disable, keypad->clk);
>> +	if (error)
>> +		return error;
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mt6779_keypad_irq_handler,
>> +					  IRQF_ONESHOT, MTK_KPD_NAME, keypad);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n", irq, error);
>> +		return error;
>> +	}
>> +
>> +	error = input_register_device(keypad->input_dev);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "Failed to register device\n");
>> +		return error;
>> +	}
>> +
>> +	error =  device_init_wakeup(&pdev->dev, wakeup);
>
> Whoops! Two spaces here! Please fix this typo.
It looks Dmitry fixed this already in his tree [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=next&id=f28af984e771efd1ded81b865b50fa13b69bcde5

>
> P.S.: Please add my email to the Cc's when you'll send the next version, so that
>        I will be able to timely give you a R-b tag.
>
> Cheers,
> Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
