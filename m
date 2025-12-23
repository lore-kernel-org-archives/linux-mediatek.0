Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CE4E6FE25
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNc5D3tM2Ruu7jgNjJ6LlXwBLama5WaJvtYpRDNLE2s=; b=OskjQgUzgUylC6n27NakrX2O6l
	wIPtyRLNkhvgYLc25Ww1Rc79/LmS9ldvhNHqjX5qzPvbtjj8HFM2DxpyZnpbE4JuPU523ROpUfY4C
	2Hyky/1SQyYBJRjA2Dzv4WloeqKUVXHjSBgRXPfno+AfOIN7cY9YhJXWR/jcui25cSs9X0DxavNGX
	V32jiyL3OINGEIOp2cUyYKet+MQe7mv5e4qy8LpdP0x8dyZXXZ29Pq0gCbYj/ycd/YpDjkzjuHfuw
	O9syKK3X4/P1RG3rwvh+YwxgW4jqBMDHJq4ahOPjHIdjLeCfw1PdtAb7Fwb+C9Js/xNmNapKRIn0t
	MMiwr7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Bh-0000000FkqV-3k5F;
	Tue, 23 Dec 2025 16:24:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Bg-0000000FkqE-0xGv;
	Tue, 23 Dec 2025 16:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBB0660123;
	Tue, 23 Dec 2025 16:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0240C113D0;
	Tue, 23 Dec 2025 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766507078;
	bh=3qVOvSQIWwScePELLmWnd91+x+FO0ghrlMNcQT2LZbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YxocYG+qrFsexKvWp8UnmdmobfpsDyH7P1+YJTEa2MYESPoFxhafpM8gsfi6cIU1R
	 n9Gfg1fwPKTG1mVszIKw6gD/hi1FUHPlichzp8hHC1c+ODcPI9IBtiK3ysngVX/8kW
	 6qtUsjPhga/f+L4DCnVAi/486vh+xUTx4zZGQNwJ3DsWuw1m/H07s9A63d0isPWvAn
	 xfv73Q5cyzS9PAQGwA0vuOAt9j1S+Rh8W8c92InWjFECnByviZpnF8o0xVzvH73G+F
	 Ou0DXgasgqiym6+NqEvExYrZ1OZI3ZKfz52X4AGZYCiiAOFPgWM25YiaBJBeAweuxD
	 6BLkrF9xDKKgg==
Date: Tue, 23 Dec 2025 21:54:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Kevin Tsai <ktsai@capellamicro.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hansg@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Iskren Chernev <me@iskren.info>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] iio: inkern: Use namespaced exports
Message-ID: <aUrCQu-wmQ7gOyD3@vaman>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
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

On 09-12-25, 09:25, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> This will make it easier to manage the IIO export surface. Consumer drivers
> will only be provided access to a specific set of functions, thereby
> restricting usage of internal IIO functions by other parts of the kernel.
> 
> This change cannot be split into several parts without breaking
> bisectability, thus all of the affected drivers are modified at once.
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/extcon/extcon-adc-jack.c                |  1 +
>  drivers/hwmon/iio_hwmon.c                       |  1 +
>  drivers/hwmon/ntc_thermistor.c                  |  1 +
>  drivers/iio/adc/envelope-detector.c             |  1 +
>  drivers/iio/afe/iio-rescale.c                   |  1 +
>  drivers/iio/buffer/industrialio-buffer-cb.c     |  1 +
>  drivers/iio/buffer/industrialio-hw-consumer.c   |  1 +
>  drivers/iio/dac/ad8460.c                        |  1 +
>  drivers/iio/dac/dpot-dac.c                      |  1 +
>  drivers/iio/inkern.c                            | 54 ++++++++++++-------------
>  drivers/iio/light/cm3605.c                      |  1 +
>  drivers/iio/light/gp2ap002.c                    |  1 +
>  drivers/iio/multiplexer/iio-mux.c               |  1 +
>  drivers/iio/potentiostat/lmp91000.c             |  1 +
>  drivers/input/joystick/adc-joystick.c           |  1 +
>  drivers/input/keyboard/adc-keys.c               |  1 +
>  drivers/input/touchscreen/colibri-vf50-ts.c     |  1 +
>  drivers/input/touchscreen/resistive-adc-touch.c |  1 +
>  drivers/phy/motorola/phy-cpcap-usb.c            |  1 +

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

