Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE08C47088
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 01:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOmyd+EX2IG4CJWblkSLwFKg/Qnn42r08dTvYRGJIiA=; b=0oOWkaqI5qPnuEzxRHHhmpdy6k
	/L99XiKCDMIvqX6Q2imdxqUDi0w7qDDoRdAYCZBHJv0VvsRCeWx/BE0ucomIFokMisQXJt5/xKnN6
	OD/ndezvs8ItEXZUUGwxjzeAFEct2d6ApT0siKnwBmejlmGJsCxZplllZG6sd/nDOuzAw8I+nzP+v
	Td7rJnOdRNKtG7sXjx0Rng78WE0u6Ndox0KcZ7tGTXcnrVRVBDWxUrA2N2ZojmuuxiyoMPDCzja3J
	sluU9qa4K4rf5G9DQZftdfLpblCoXvg6l+b3V5fTIKZb1TYHLQF1w8OUZlA6P0nyJx1UpIKEi8NIu
	kBKBqQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0YCu-003lM0-Ok; Thu, 01 Dec 2022 01:17:44 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0YCp-003lJf-R1; Thu, 01 Dec 2022 01:17:42 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=57;SR=0;TI=SMTPD_---0VW5-8b9_1669857445;
Received: from 30.97.48.64(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VW5-8b9_1669857445)
          by smtp.aliyun-inc.com;
          Thu, 01 Dec 2022 09:17:29 +0800
Message-ID: <a7e61ce5-b5e6-384a-3c89-ebde63340678@linux.alibaba.com>
Date: Thu, 1 Dec 2022 09:17:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error
 code
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Douglas Anderson <dianders@chromium.org>,
 Pavel Machek <pavel@ucw.cz>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hammer Hsieh <hammerh0314@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, Satya Priya
 <quic_c_skakit@quicinc.com>, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_171740_087966_543CE07A 
X-CRM114-Status: GOOD (  11.76  )
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



On 11/30/2022 11:21 PM, Uwe Kleine-König wrote:
> diff --git a/drivers/pwm/pwm-sprd.c b/drivers/pwm/pwm-sprd.c
> index 7004f55bbf11..bda8bc5af976 100644
> --- a/drivers/pwm/pwm-sprd.c
> +++ b/drivers/pwm/pwm-sprd.c
> @@ -65,8 +65,8 @@ static void sprd_pwm_write(struct sprd_pwm_chip *spc, u32 hwid,
>   	writel_relaxed(val, spc->base + offset);
>   }
>   
> -static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> -			       struct pwm_state *state)
> +static int sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +			      struct pwm_state *state)
>   {
>   	struct sprd_pwm_chip *spc =
>   		container_of(chip, struct sprd_pwm_chip, chip);
> @@ -83,7 +83,7 @@ static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>   	if (ret) {
>   		dev_err(spc->dev, "failed to enable pwm%u clocks\n",
>   			pwm->hwpwm);
> -		return;
> +		return 0;
>   	}
>   
>   	val = sprd_pwm_read(spc, pwm->hwpwm, SPRD_PWM_ENABLE);
> @@ -113,6 +113,8 @@ static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>   	/* Disable PWM clocks if the PWM channel is not in enable state. */
>   	if (!state->enabled)
>   		clk_bulk_disable_unprepare(SPRD_PWM_CHN_CLKS_NUM, chn->clks);
> +
> +	return 0;
>   }
>   
>   static int sprd_pwm_config(struct sprd_pwm_chip *spc, struct pwm_device *pwm,

For sprd pwm parts:
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

