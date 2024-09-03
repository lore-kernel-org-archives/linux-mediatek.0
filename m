Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2244CD13CF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4umYbcZ0b+sOSGAj+Oq1NFycyEsAC59fT5uNZWwoeU4=; b=WRPUqDWhhMNom8gCg2VrOOZ5ut
	vphgZJijuHhdV65vEKeH6KnBO6nMSgGZ7dujqmcA8lP8NghD/Sv2wCC2IeATRU2w60GY8404AumtY
	1NaIG78DlJxJ8MhL+FrGorFbLpnXEvJzD/t8vY10vJDGm7soGrhqUA4LL5D/AqFakBTGTz4R2M5lB
	J3rQyBj9XQUQno9bOjgKFJ04zAUXaaK0qruwHmAM75dhFfCVEWafVXi1vhQhmA/08m85UCyE2bL4O
	eqKE0F09rIpn2Ahu0hRHCdfay1YQNlpXrhIwOrK+0mBKaK4OIK/4XiWdtzfGv5fNDvKpiIyUcH8MU
	4kfzYlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slR5R-0000000HOkr-1cPF;
	Tue, 03 Sep 2024 10:48:37 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slR3z-0000000HOL4-2ilk
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Sep 2024 10:47:12 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so2681894a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Sep 2024 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725360420; x=1725965220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4umYbcZ0b+sOSGAj+Oq1NFycyEsAC59fT5uNZWwoeU4=;
        b=FZTbyxRdtDFyXxLm8TDVgMpiGgWOkp4XVmmeQvUQiLwE83FaxaVVZhXf/i1tABjbSV
         2PuFK/DOBEwaEjYf/3RJoZXbQaRlIdViaZA5Hn2Ox8KlXre9wm41iXDrWhp5B+o2kkfe
         1zbuk55I1VoTCGSXNDwEmCHWWWVxqRpbAotmq0gjqJ09Q/t0KOT4J1YKBKDR0/P00uxY
         TIFub+kSR2AHeONknBRqh/L8yD9pCdh/ZtAqlUUTFuN0CrK/oPnZXEiEWmsXfvGSPdmZ
         KMsWr7HHC25OTzufS0HSck7dOldS/7bG3FnNggjykrLArhFGNfB0dXfXTB2ZI+RzsAgM
         ytoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725360420; x=1725965220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4umYbcZ0b+sOSGAj+Oq1NFycyEsAC59fT5uNZWwoeU4=;
        b=bI+nDgLrwZIbLQp0Uc9Oau2VWn/9l6Bytgt/cvZW9G+k9hBAIfwe7W1OBucQiIWQo0
         Uo3I6/i8JNWRQMW/Mun9Zs4Fb3FQN93jxMA8cR+ugnkpEcht2WxQ/5cqo/swQMIL52ex
         0ju13y4XmK4dgoQDOpnNNr5jCFcsw7MJZ7pjN1znEEmyrjo5F/ANGpJYrV5vMSfyg704
         jy9911CzX1lXG/nh9U9+qAvvhoarCOpmi2AORrwJZ/CWjf+DWbTy4znn/87BpSa8LGm+
         9E389G/u6mZKtPJXL6dB0PG8nOSmJMGiqWPBirAakbUTqD4CzjWXepthj8t/ifr/sibe
         xIDA==
X-Forwarded-Encrypted: i=1; AJvYcCXzJdN53mrNKAy91XqhCkZdonbbWQiyJoBBFvozLRio3D4snyCt1ClsYECq9vboOK4++rP3p74447W9e2LWfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww2M5XlRctI4Zw8LmCxx8Qr7SpJo4l7Z2vuLXYiUgDa8QvzrLw
	ocU4+D5P7zC5oNfIghl7od6bsIs6aZHmTDBUSe3scFNaV9mqbK32GyZm9lz1BSI=
X-Google-Smtp-Source: AGHT+IGgYRkw1SDOUq0lQnzzs2I5aHryZGs6yz1j3swbXveBrYRLbcENX7PHHVTWqGmRE/+HgnBnIA==
X-Received: by 2002:a05:6402:401a:b0:5c2:61a7:62e4 with SMTP id 4fb4d7f45d1cf-5c2757d6926mr219652a12.10.1725360419472;
        Tue, 03 Sep 2024 03:46:59 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccf2a0sm6260879a12.64.2024.09.03.03.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 03:46:59 -0700 (PDT)
Date: Tue, 3 Sep 2024 12:46:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 5/5] pwm: airoha: Add support for EN7581 SoC
Message-ID: <yfqmlca6cnhrghpo5s6tml36tngmekcfbyjakxs7or7wtap3ka@7qlrxjowo4ou>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xrkzyim6vsn2dpvr"
Content-Disposition: inline
In-Reply-To: <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_034708_189702_64E9CBB2 
X-CRM114-Status: GOOD (  47.29  )
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


--xrkzyim6vsn2dpvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Aug 31, 2024 at 04:27:50PM +0200, Lorenzo Bianconi wrote:
> From: Benjamin Larsson <benjamin.larsson@genexis.eu>
>=20
> Introduce driver for PWM module available on EN7581 SoC.
>=20
> Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pwm/Kconfig      |  10 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-airoha.c | 435 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 446 insertions(+)
>=20
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 3e53838990f5..0a78bda0707d 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -47,6 +47,16 @@ config PWM_AB8500
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-ab8500.
> =20
> +config PWM_AIROHA
> +	tristate "Airoha PWM support"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Generic PWM framework driver for Airoha SoC.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-airoha.
> +
>  config PWM_APPLE
>  	tristate "Apple SoC PWM support"
>  	depends on ARCH_APPLE || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 0be4f3e6dd43..7ee61822d88d 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_PWM)		+=3D core.o
>  obj-$(CONFIG_PWM_AB8500)	+=3D pwm-ab8500.o
> +obj-$(CONFIG_PWM_AIROHA)	+=3D pwm-airoha.o
>  obj-$(CONFIG_PWM_APPLE)		+=3D pwm-apple.o
>  obj-$(CONFIG_PWM_ATMEL)		+=3D pwm-atmel.o
>  obj-$(CONFIG_PWM_ATMEL_HLCDC_PWM)	+=3D pwm-atmel-hlcdc.o
> diff --git a/drivers/pwm/pwm-airoha.c b/drivers/pwm/pwm-airoha.c
> new file mode 100644
> index 000000000000..54dc12d20da4
> --- /dev/null
> +++ b/drivers/pwm/pwm-airoha.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2022 Markus Gothe <markus.gothe@genexis.eu>
> + */

Would you please add a "Limitations" paragraph here covering the
following questions:

 - How does the hardware behave on changes of configuration (does it
   complete the currently running period? Are there any glitches?)
 - How does the hardware behave on disabling?

Please stick to the format used in several other drivers such that=20

	sed -rn '/Limitations:/,/\*\/?$/p' drivers/pwm/*.c

emits the informations.

> +
> +#include <linux/bitfield.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mfd/airoha-en7581-mfd.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/gpio.h>
> +#include <linux/bitops.h>
> +#include <asm/div64.h>
> +
> +#define REG_SGPIO_CFG			0x0024
> +#define REG_FLASH_CFG			0x0038
> +#define REG_CYCLE_CFG			0x0098
> +
> +#define REG_SGPIO_LED_DATE		0x0000
> +#define SGPIO_LED_SHIFT_FLAG		BIT(31)
> +#define SGPIO_LED_DATA			GENMASK(16, 0)

Please make the bit fields's names start with the register name.

> +#define REG_SGPIO_CLK_DIVR		0x0004
> +#define REG_SGPIO_CLK_DLY		0x0008
> +
> +#define REG_SIPO_FLASH_MODE_CFG		0x000c
> +#define SERIAL_GPIO_FLASH_MODE		BIT(1)
> +#define SERIAL_GPIO_MODE		BIT(0)
> +
> +#define REG_GPIO_FLASH_PRD_SET(_n)	(0x0004 + ((_n) << 2))
> +#define GPIO_FLASH_PRD_MASK(_n)		GENMASK(15 + ((_n) << 4), ((_n) << 4))
> +
> +#define REG_GPIO_FLASH_MAP(_n)		(0x0014 + ((_n) << 2))
> +#define GPIO_FLASH_SETID_MASK(_n)	GENMASK(2 + ((_n) << 2), ((_n) << 2))
> +#define GPIO_FLASH_EN(_n)		BIT(3 + ((_n) << 2))
> +
> +#define REG_SIPO_FLASH_MAP(_n)		(0x001c + ((_n) << 2))
> +
> +#define REG_CYCLE_CFG_VALUE(_n)		(0x0000 + ((_n) << 2))
> +#define WAVE_GEN_CYCLE_MASK(_n)		GENMASK(7 + ((_n) << 3), ((_n) << 3))
> +
> +struct airoha_pwm {
> +	void __iomem *sgpio_cfg;
> +	void __iomem *flash_cfg;
> +	void __iomem *cycle_cfg;
> +
> +	struct device_node *np;
> +	u64 initialized;
> +
> +	struct {
> +		/* Bitmask of PWM channels using this bucket */
> +		u64 used;
> +		u64 period_ns;
> +		u64 duty_ns;
> +		enum pwm_polarity polarity;
> +	} bucket[8];
> +};
> +
> +/*
> + * The first 16 GPIO pins, GPIO0-GPIO15, are mapped into 16 PWM channels=
, 0-15.
> + * The SIPO GPIO pins are 16 pins which are mapped into 17 PWM channels,=
 16-32.

How can 16 pins be mapped to 17 PWM channels?

> + * However, we've only got 8 concurrent waveform generators and can ther=
efore
> + * only use up to 8 different combinations of duty cycle and period at a=
 time.

That's an information to add to the Limitations paragraph.

> + */
> +#define PWM_NUM_GPIO	16
> +#define PWM_NUM_SIPO	17
> +
> +/* The PWM hardware supports periods between 4 ms and 1 s */
> +#define PERIOD_MIN_NS	4000000
> +#define PERIOD_MAX_NS	1000000000
> +/* It is represented internally as 1/250 s between 1 and 250 */
> +#define PERIOD_MIN	1
> +#define PERIOD_MAX	250
> +/* Duty cycle is relative with 255 corresponding to 100% */
> +#define DUTY_FULL	255
> +
> +static u32 airoha_pwm_rmw(struct airoha_pwm *pc, void __iomem *addr,
> +			  u32 mask, u32 val)
> +{
> +	val |=3D (readl(addr) & ~mask);
> +	writel(val, addr);
> +
> +	return val;
> +}

pc is unused here, please drop it.

> +#define airoha_pwm_sgpio_rmw(pc, offset, mask, val)				\
> +	airoha_pwm_rmw((pc), (pc)->sgpio_cfg + (offset), (mask), (val))
> +#define airoha_pwm_flash_rmw(pc, offset, mask, val)				\
> +	airoha_pwm_rmw((pc), (pc)->flash_cfg + (offset), (mask), (val))
> +#define airoha_pwm_cycle_rmw(pc, offset, mask, val)				\
> +	airoha_pwm_rmw((pc), (pc)->cycle_cfg + (offset), (mask), (val))
> +
> +#define airoha_pwm_sgpio_set(pc, offset, val)					\
> +	airoha_pwm_sgpio_rmw((pc), (offset), 0, (val))

That does the right thing, but I'd consider

	#define airoha_pwm_sgpio_set(pc, offset, val)					\
		airoha_pwm_sgpio_rmw((pc), (offset), (val), (val))

to be more understandable (or ~0 instead of the last (val)?)

> +#define airoha_pwm_sgpio_clear(pc, offset, mask)				\
> +	airoha_pwm_sgpio_rmw((pc), (offset), (mask), 0)
> +#define airoha_pwm_flash_set(pc, offset, val)					\
> +	airoha_pwm_flash_rmw((pc), (offset), 0, (val))
> +#define airoha_pwm_flash_clear(pc, offset, mask)				\
> +	airoha_pwm_flash_rmw((pc), (offset), (mask), 0)
> +
> +static int airoha_pwm_get_waveform(struct airoha_pwm *pc, u64 duty_ns,
> +				   u64 period_ns)

Given that "waveform" will gain some specific semantic soon, but this
usage is different, I'd like to see this function renamed.

> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pc->bucket); i++) {
> +		if (!pc->bucket[i].used)
> +			continue;
> +
> +		if (duty_ns =3D=3D pc->bucket[i].duty_ns &&
> +		    period_ns =3D=3D pc->bucket[i].period_ns)
> +			return i;
> +
> +		/*
> +		 * Unlike duty cycle zero, which can be handled by
> +		 * disabling PWM, a generator is needed for full duty
> +		 * cycle but it can be reused regardless of period
> +		 */
> +		if (duty_ns =3D=3D DUTY_FULL && pc->bucket[i].duty_ns =3D=3D DUTY_FULL)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static void airoha_pwm_free_waveform(struct airoha_pwm *pc, unsigned int=
 hwpwm)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pc->bucket); i++)
> +		pc->bucket[i].used &=3D ~BIT_ULL(hwpwm);
> +}
> +
> +static int airoha_pwm_consume_waveform(struct airoha_pwm *pc,
> +				       u64 duty_ns, u64 period_ns,
> +				       enum pwm_polarity polarity,
> +				       unsigned int hwpwm)
> +{
> +	int id =3D airoha_pwm_get_waveform(pc, duty_ns, period_ns);
> +
> +	if (id < 0) {
> +		int i;
> +
> +		/* find an unused waveform generator */
> +		for (i =3D 0; i < ARRAY_SIZE(pc->bucket); i++) {
> +			if (!(pc->bucket[i].used & ~BIT_ULL(hwpwm))) {
> +				id =3D i;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (id >=3D 0) {
> +		airoha_pwm_free_waveform(pc, hwpwm);
> +		pc->bucket[id].used |=3D BIT_ULL(hwpwm);
> +		pc->bucket[id].period_ns =3D period_ns;
> +		pc->bucket[id].duty_ns =3D duty_ns;
> +		pc->bucket[id].polarity =3D polarity;
> +	}

One downside of the (nearly) maximal flexibility implemented here is
that if you have 9 (or more) requested pwm devices configuration is
quite limited.  So it might happen that a consumer changes the
configuration for pwm#2 from pwm_state A to pwm_state B but cannot
change back to A later.

If you limit the number of requested pwm devices to 8, the code gets a
tad simpler (because you can map a fixed bucket to each pwm device and
don't need to search during .apply()) and each consumer has maximal
freedom to configure its device.

> +
> +	return id;
> +}
> +
> +static int airoha_pwm_sipo_init(struct airoha_pwm *pc)
> +{
> +	u32 clk_divr_val =3D 3, sipo_clock_delay =3D 1;
> +	u32 val, sipo_clock_divisor =3D 32;
> +
> +	if (!(pc->initialized >> PWM_NUM_GPIO))
> +		return 0;
> +
> +	/* Select the right shift register chip */
> +	if (of_property_read_bool(pc->np, "hc74595"))
> +		airoha_pwm_sgpio_set(pc, REG_SIPO_FLASH_MODE_CFG,
> +				     SERIAL_GPIO_MODE);
> +	else
> +		airoha_pwm_sgpio_clear(pc, REG_SIPO_FLASH_MODE_CFG,
> +				       SERIAL_GPIO_MODE);
> +
> +	if (!of_property_read_u32(pc->np, "sipo-clock-divisor",
> +				  &sipo_clock_divisor)) {
> +		switch (sipo_clock_divisor) {
> +		case 4:
> +			clk_divr_val =3D 0;
> +			break;
> +		case 8:
> +			clk_divr_val =3D 1;
> +			break;
> +		case 16:
> +			clk_divr_val =3D 2;
> +			break;
> +		case 32:
> +			clk_divr_val =3D 3;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +	/* Configure shift register timings */
> +	writel(clk_divr_val, pc->sgpio_cfg + REG_SGPIO_CLK_DIVR);
> +
> +	of_property_read_u32(pc->np, "sipo-clock-delay", &sipo_clock_delay);
> +	if (sipo_clock_delay < 1 || sipo_clock_delay > sipo_clock_divisor / 2)
> +		return -EINVAL;
> +
> +	/*
> +	 * The actual delay is sclkdly + 1 so subtract 1 from
> +	 * sipo-clock-delay to calculate the register value
> +	 */
> +	sipo_clock_delay--;
> +	writel(sipo_clock_delay, pc->sgpio_cfg + REG_SGPIO_CLK_DLY);
> +
> +	/*
> +	 * It it necessary to after muxing explicitly shift out all
> +	 * zeroes to initialize the shift register before enabling PWM
> +	 * mode because in PWM mode SIPO will not start shifting until
> +	 * it needs to output a non-zero value (bit 31 of led_data
> +	 * indicates shifting in progress and it must return to zero
> +	 * before led_data can be written or PWM mode can be set)
> +	 */
> +	if (readl_poll_timeout(pc->sgpio_cfg + REG_SGPIO_LED_DATE, val,
> +			       !(val & SGPIO_LED_SHIFT_FLAG), 10,
> +			       200 * USEC_PER_MSEC))
> +		return -ETIMEDOUT;
> +
> +	airoha_pwm_sgpio_clear(pc, REG_SGPIO_LED_DATE, SGPIO_LED_DATA);
> +	if (readl_poll_timeout(pc->sgpio_cfg + REG_SGPIO_LED_DATE, val,
> +			       !(val & SGPIO_LED_SHIFT_FLAG), 10,
> +			       200 * USEC_PER_MSEC))
> +		return -ETIMEDOUT;
> +
> +	/* Set SIPO in PWM mode */
> +	airoha_pwm_sgpio_set(pc, REG_SIPO_FLASH_MODE_CFG,
> +			     SERIAL_GPIO_FLASH_MODE);
> +
> +	return 0;
> +}
> +
> +static void airoha_pwm_config_waveform(struct airoha_pwm *pc, int index,
> +				       u64 duty_ns, u64 period_ns,
> +				       enum pwm_polarity polarity)
> +{
> +	u32 period, duty, mask, val;
> +
> +	duty =3D clamp_val(div64_u64(DUTY_FULL * duty_ns, period_ns), 0,
> +			 DUTY_FULL);

DUTY_FULL * duty_ns might overflow. Also the calculation is wrong.
For example if the following is requested:

	.period =3D 23999999,
	.duty_cycle =3D 8000000,

you're supposed to configure period =3D 16000000 ns and duty_cycle =3D
8000000 ns.

(I.e.: Pick the biggest possible period not bigger than the requested
period. For that pick the biggest possible duty_cycle not bigger than
the requested duty_cycle.)

If you implement .get_state() in a way to return the actually configured
state, enabling PWM_DEBUG and intensive testing helps to get this right.

> +	if (polarity =3D=3D PWM_POLARITY_INVERSED)
> +		duty =3D DUTY_FULL - duty;

This alone doesn't switch the polarity of the signal. Please only claim
to be able to implement the settings that the hardware actually can do.

> +	period =3D clamp_val(div64_u64(25 * period_ns, 100000000), PERIOD_MIN,
> +			   PERIOD_MAX);
> +
> +	/* Configure frequency divisor */
> +	mask =3D WAVE_GEN_CYCLE_MASK(index % 4);
> +	val =3D (period << __ffs(mask)) & mask;
> +	airoha_pwm_cycle_rmw(pc, REG_CYCLE_CFG_VALUE(index / 4), mask, val);
> +
> +	/* Configure duty cycle */
> +	duty =3D ((DUTY_FULL - duty) << 8) | duty;
> +	mask =3D GPIO_FLASH_PRD_MASK(index % 2);
> +	val =3D (duty << __ffs(mask)) & mask;
> +	airoha_pwm_flash_rmw(pc, REG_GPIO_FLASH_PRD_SET(index / 2), mask, val);
> +}
> +
> +static void airoha_pwm_config_flash_map(struct airoha_pwm *pc,
> +					unsigned int hwpwm, int index)
> +{
> +	u32 addr, mask, val;
> +
> +	if (hwpwm < PWM_NUM_GPIO) {
> +		addr =3D REG_GPIO_FLASH_MAP(hwpwm / 8);
> +	} else {
> +		addr =3D REG_SIPO_FLASH_MAP(hwpwm / 8);
> +		hwpwm -=3D PWM_NUM_GPIO;
> +	}
> +
> +	if (index < 0) {
> +		/*
> +		 * Change of waveform takes effect immediately but
> +		 * disabling has some delay so to prevent glitching
> +		 * only the enable bit is touched when disabling
> +		 */
> +		airoha_pwm_flash_clear(pc, addr, GPIO_FLASH_EN(hwpwm % 8));
> +		return;
> +	}
> +
> +	mask =3D GPIO_FLASH_SETID_MASK(hwpwm % 8);
> +	val =3D ((index & 7) << __ffs(mask)) & mask;
> +	airoha_pwm_flash_rmw(pc, addr, mask, val);
> +	airoha_pwm_flash_set(pc, addr, GPIO_FLASH_EN(hwpwm % 8));
> +}
> +
> +static int airoha_pwm_config(struct airoha_pwm *pc, struct pwm_device *p=
wm,
> +			     u64 duty_ns, u64 period_ns,
> +			     enum pwm_polarity polarity)
> +{
> +	int index =3D -1;
> +
> +	index =3D airoha_pwm_consume_waveform(pc, duty_ns, period_ns, polarity,
> +					    pwm->hwpwm);
> +	if (index < 0)
> +		return -EBUSY;
> +
> +	if (!(pc->initialized & BIT_ULL(pwm->hwpwm)) &&
> +	    pwm->hwpwm >=3D PWM_NUM_GPIO)
> +		airoha_pwm_sipo_init(pc);
> +
> +	if (index >=3D 0) {
> +		airoha_pwm_config_waveform(pc, index, duty_ns, period_ns,
> +					   polarity);
> +		airoha_pwm_config_flash_map(pc, pwm->hwpwm, index);
> +	} else {
> +		airoha_pwm_config_flash_map(pc, pwm->hwpwm, index);
> +		airoha_pwm_free_waveform(pc, pwm->hwpwm);
> +	}
> +
> +	pc->initialized |=3D BIT_ULL(pwm->hwpwm);
> +
> +	return 0;
> +}
> +
> +static void airoha_pwm_free(struct pwm_chip *chip, struct pwm_device *pw=
m)
> +{
> +	struct airoha_pwm *pc =3D pwmchip_get_drvdata(chip);
> +
> +	/* Disable PWM and release the waveform */
> +	airoha_pwm_config_flash_map(pc, pwm->hwpwm, -1);
> +	airoha_pwm_free_waveform(pc, pwm->hwpwm);
> +
> +	pc->initialized &=3D ~BIT_ULL(pwm->hwpwm);
> +	if (!(pc->initialized >> PWM_NUM_GPIO))
> +		airoha_pwm_sgpio_clear(pc, REG_SIPO_FLASH_MODE_CFG,
> +				       SERIAL_GPIO_FLASH_MODE);
> +
> +	/*
> +	 * Clear the state to force re-initialization the next time
> +	 * this PWM channel is used since we cannot retain state in
> +	 * hardware due to limited number of waveform generators
> +	 */
> +	memset(&pwm->state, 0, sizeof(pwm->state));

Please don't reconfigure the hardware in .free(). Instead assume that
the consumer disabled the PWM before releasing it or that they know what
they do.

Also don't write to pwm->state, that is supposed to only happen in the
core.

> +}
> +
> +static int airoha_pwm_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> +			    const struct pwm_state *state)
> +{
> +	struct airoha_pwm *pc =3D pwmchip_get_drvdata(chip);
> +	u64 duty =3D state->enabled ? state->duty_cycle : 0;
> +
> +	if (!state->enabled) {
> +		airoha_pwm_free(chip, pwm);
> +		return 0;
> +	}
> +
> +	if (state->period < PERIOD_MIN_NS || state->period > PERIOD_MAX_NS)
> +		return -EINVAL;

Please handle state->period > PERIOD_MAX_NS by configuring a period of
PERIOD_MAX_NS.

> +	return airoha_pwm_config(pc, pwm, duty, state->period,
> +				 state->polarity);
> +}
> +
> +static int airoha_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> +				struct pwm_state *state)
> +{
> +	struct airoha_pwm *pc =3D pwmchip_get_drvdata(chip);
> +	int i;
> +
> +	/* find hwpwm in waveform generator bucket */
> +	for (i =3D 0; i < ARRAY_SIZE(pc->bucket); i++) {
> +		if (pc->bucket[i].used & BIT_ULL(pwm->hwpwm)) {
> +			state->enabled =3D pc->initialized & BIT_ULL(pwm->hwpwm);
> +			state->polarity =3D pc->bucket[i].polarity;
> +			state->period =3D pc->bucket[i].period_ns;
> +			state->duty_cycle =3D pc->bucket[i].duty_ns;
> +			break;
> +		}
> +	}
> +
> +	if (i =3D=3D ARRAY_SIZE(pc->bucket))
> +		state->enabled =3D false;
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops airoha_pwm_ops =3D {
> +	.get_state =3D airoha_pwm_get_state,
> +	.apply =3D airoha_pwm_apply,
> +	.free =3D airoha_pwm_free,
> +};
> +
> +static int airoha_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct airoha_mfd *mfd;
> +	struct airoha_pwm *pc;
> +	struct pwm_chip *chip;
> +
> +	/* Assign parent MFD of_node to dev */
> +	dev->of_node =3D of_node_get(dev->parent->of_node);

I think you want
device_set_of_node_from_dev(dev->parent, dev)
here.

> +	mfd =3D dev_get_drvdata(dev->parent);
> +
> +	chip =3D devm_pwmchip_alloc(dev, PWM_NUM_GPIO + PWM_NUM_SIPO,
> +				  sizeof(*pc));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +
> +	pc =3D pwmchip_get_drvdata(chip);
> +	pc->np =3D dev->of_node;
> +	pc->sgpio_cfg =3D mfd->base + REG_SGPIO_CFG;
> +	pc->flash_cfg =3D mfd->base + REG_FLASH_CFG;
> +	pc->cycle_cfg =3D mfd->base + REG_CYCLE_CFG;

Is it really worth to store these values in the private data struct? My
intuition would be to only store .base in pc and then define the
register accessors macros like:

	#define airoha_pwm_cycle_rmw(pc, offset, mask, val)				\
		airoha_pwm_rmw((pc), (pc)->base + REG_CYCLE_CFG + (offset), (mask), (val))

> +	chip->ops =3D &airoha_pwm_ops;
> +	chip->of_xlate =3D of_pwm_xlate_with_flags;

Please don't assign .of_xlate, the core does

        if (!chip->of_xlate)
                chip->of_xlate =3D of_pwm_xlate_with_flags;

> +
> +	return devm_pwmchip_add(&pdev->dev, chip);
> +}
> +
> +static struct platform_driver airoha_pwm_driver =3D {
> +	.driver =3D {
> +		.name =3D "airoha-pwm",
> +	},
> +	.probe =3D airoha_pwm_probe,
> +};
> +module_platform_driver(airoha_pwm_driver);
> +
> +MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
> +MODULE_AUTHOR("Markus Gothe <markus.gothe@genexis.eu>");
> +MODULE_AUTHOR("Benjamin Larsson <benjamin.larsson@genexis.eu>");
> +MODULE_DESCRIPTION("Airoha EN7581 PWM driver");
> +MODULE_LICENSE("GPL");

Best regards
Uwe

--xrkzyim6vsn2dpvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbW6R8ACgkQj4D7WH0S
/k4P4gf+N6uWIy5Nqj2hfh4osyIXsAYyH0Rbg++uwe24C9sxSEGWSC+4H2+DeL1G
cI/3mpQTnt0h36ZKPH0gi97dytc6QSYN0mnPao7RfZHIi3QPQMqjvmPcneRefnQB
YN/HPOAJlhJHnYl8VBgP6F39p3ihtYZrlAZbck34Sz3RhESMaREJ4vRYV8UeFMVr
rl2hX/0SwVavz7yEMWSIxkKvx6zh+yzqGg2b/urdUrT+zjtbycjWlhzAdhvd+W+f
ymD54NEAggpK1s7Ptp6pWWwgrBKEM9HMGhL0rRPJ4dGnmBhHFOFFFhqh9avlmPdC
tyibTqX+hAkfuwZu+A56i4iKQDy79Q==
=ti50
-----END PGP SIGNATURE-----

--xrkzyim6vsn2dpvr--

