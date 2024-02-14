Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D1C48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+AANKgZkBNWfzNkyMqhuU0Mc4BCOgMJBnZU2qAfu24=; b=TXNby2Y/F9jmvdHMbdldHluR1r
	cv37bOwDm6h0TMRZV4cikko4L/2ap/Hk8Muh4jueppd1aSXMYz3wZsDzOfSVrr09+IeyH235rUTOt
	n2Jco8E0lQShSnJ3nXjY0Py/KVinN+kjSvc52g87rjJGCoaMW7K1ghIWYaBwllks75/KG+hhQL1xB
	mqhbip31QLnkvQD+KFNJ9TusP8aBxTxBEpgCgzZINPVw0MG4UdOcAWej+HEB4PCGYG7SyCE0GeX6l
	19nd+5dayV2sor/ePuuJvG+7P+xRer+2jtb/292BnGAkOnx2Hz+cOyT4WAOAbZq52iyD3C3LcoE/f
	iYFjLbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEi5-0000000Css7-2EIp;
	Wed, 14 Feb 2024 12:49:57 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEi1-0000000CsrJ-0MJ2;
	Wed, 14 Feb 2024 12:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707914993; x=1739450993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VfFo/DkZzmeQyKntjmarBqvTj2pcgH+G7HGM6HxEwSk=;
  b=C+SZyq4J6dxhznCmpkjvmy+MGaS5U2l5nRx41CS0BLupO3iyoLrQFtwq
   BJ09p4KhLgY1jnrwB1UvVd/cr+/uFKMg8mPOLVrZXfn2kkoMCnjOyMVys
   06ITgTPSgxPSmfeWTFBJG7eCjyYBFeuxTUCEBvOfb64cu+vpEueacGcrj
   3XhvfcA4wDySrKdmAEZ4QNUixarqaXNbxHtaEZqhWjddpMqbbk2gJ/tC/
   +sqKqTgMDSRE2B4d0lgr1zoaUokl0Qpr+J0uNWNGJ7DDFtKyEtFriPBju
   2HJ5FxWp2mk06ybPvs0bdG4n64d367N2BjZP3ySQAQgmGzuJAU2p+mlJk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1809713"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1809713"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 04:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="912083870"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="912083870"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 04:49:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1raEhb-00000004UXT-0JCa;
	Wed, 14 Feb 2024 14:49:27 +0200
Date: Wed, 14 Feb 2024 14:49:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	James Clark <james.clark@arm.com>, Mark Brown <broonie@kernel.org>,
	linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <mwalle@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Sean Anderson <sean.anderson@seco.com>,
	Michal Simek <michal.simek@amd.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>,
	linux-doc@vger.kernel.org, kernel@pengutronix.de,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 003/164] pwm: Provide pwmchip_alloc() function and a
 devm variant of it
Message-ID: <Zcy21tsntcK80hef@smile.fi.intel.com>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <9577d6053a5a52536057dc8654ff567181c2da82.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9577d6053a5a52536057dc8654ff567181c2da82.1707900770.git.u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_044953_195727_85675CF7 
X-CRM114-Status: GOOD (  22.82  )
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

On Wed, Feb 14, 2024 at 10:30:50AM +0100, Uwe Kleine-König wrote:
> This function allocates a struct pwm_chip and driver data. Compared to
> the status quo the split into pwm_chip and driver data is new, otherwise
> it doesn't change anything relevant (yet).
> 
> The intention is that after all drivers are switched to use this
> allocation function, its possible to add a struct device to struct
> pwm_chip to properly track the latter's lifetime without touching all
> drivers again. Proper lifetime tracking is a necessary precondition to
> introduce character device support for PWMs (that implements atomic
> setting and doesn't suffer from the sysfs overhead of the /sys/class/pwm
> userspace support).
> 
> The new function pwmchip_priv() (obviously?) only works for chips
> allocated with pwmchip_alloc().

...

> +#define PWMCHIP_ALIGN ARCH_DMA_MINALIGN
> +
> +static void *pwmchip_priv(struct pwm_chip *chip)
> +{
> +	return (void *)chip + ALIGN(sizeof(*chip), PWMCHIP_ALIGN);
> +}

Why not use dma_get_cache_alignment() ?

...

> +/* This is the counterpart to pwmchip_alloc */

pwmchip_alloc()

...

> +EXPORT_SYMBOL_GPL(pwmchip_put);

> +EXPORT_SYMBOL_GPL(pwmchip_alloc);

> +EXPORT_SYMBOL_GPL(devm_pwmchip_alloc);

Are these exported via namespace? If no, can they be from day 1?

...

> +static inline void pwmchip_put(struct pwm_chip *chip)
> +{
> +}

Can be one line, but it's up to the present style in this header.

-- 
With Best Regards,
Andy Shevchenko



