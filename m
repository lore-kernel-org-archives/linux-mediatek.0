Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F1EC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=; b=0UUC6D+JLtrcWJWFp5rZWdlp4B
	CJ3KLmXlGUDbM4q4g3Z8OHx0ahYil9tXDO4DfD8qCtd4frcVTzz8nUdzeOjcGNxbNUyNNzxl8POAc
	p+URYTLc+O4dMa89SKxuq0ukTO/CKwp4XnxVE8+MNmyYkupDV0PEh8VOtPpdeInbY2I+UxgoJBwNk
	flzHgTiOXt20qZuisduKIFJvNmT/dFd6YCmHPEvBnaHOk8cIAI1A7Zeas4cw4qOz1r7qpqsBBaqyv
	VxjQIwO4PeEYByciTO/dMxmZ7nMaHK3a2oVGfTnrUTVRW2+TzdvfOfT4Aj6MqM8AO/kvGqgENe1iH
	DxxvHu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSCg-00GOVl-2z;
	Mon, 14 Aug 2023 07:41:30 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSCd-00GOTs-2t
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Aug 2023 07:41:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-317798b359aso3507655f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Aug 2023 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691998886; x=1692603686;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
        b=c2ibWsrtxlpOl2l93H8I7dwO30O1xssdh4p/RrE2q8N2J8sUQOiLfPy4jrHUDNecWQ
         B9Xl7UbuevI0/fpeC3Cqz4JjJBdAc1fM3Sx+NRxxOWZwKyMRK3wSy1FRjBCN1vRcCJ3V
         iNaGpXWAcpuPTu7ilq8+T4iAp1Du1dTft6ZdWvtZ4YteQjS4RMAl8rEkUzkK3U48fPQ3
         Ta+6PDHsz/O7Bxk8FyAYZKsv9wLW0hBYeG+zmWBSRbPB9cFQZwP3sWc7W4O0II/GdFDH
         XLs0zYerpdo1H3GjEXSiYzl+d1vN7CnfVNDwP6MnTibEClBZjnwlup1Vh8wpi7JEvqyE
         zjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691998886; x=1692603686;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
        b=EBk0etPKJSeoWEaC045AHFV7oNPARzIB/oLRz98DsXxar+tOYZQvo58jO4lI+SixM4
         Zzw9ekeCc/su9jeTtIadrUACyrW8Z/u9Y2d22bH310vdFioxG7wVKhwhj1jcH481aNJ6
         j5kk1SJc0sIEBehLp6jkh5WGDdP8VobPkofZQDABqAPCYmae6j05AnjUDnEkVfra6XGZ
         XD0cD97cRm8AUytYehV+bscIAPTqlUPVmojSYRCQJNcwg6bV/pIcvDQYiYy2O4HHRVBR
         OwYy28L8FOZKbG5qofo8pQj4q/gxH7S2RatgFMU94XZOBgZ+FpCaUFR/NEQOacqgHosH
         q5Ig==
X-Gm-Message-State: AOJu0Yzq1sEM6VHMUZHUqhIfxQPbX5up8+o6kinHfWw+WAaoGQyKsgpv
	xu6Y20QSm4XeT0rY6PbnoL0FOw==
X-Google-Smtp-Source: AGHT+IFYfAjXxtZPBAO6xzW1e3FH1h7mkoQ3yNtVsbL8sLdvSW5eTgH/X76mW18QMBp5iOQDIcXGqw==
X-Received: by 2002:adf:ee87:0:b0:317:5e0d:c249 with SMTP id b7-20020adfee87000000b003175e0dc249mr6776837wro.35.1691998885785;
        Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b00317643a93f4sm13507243wru.96.2023.08.14.00.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Message-ID: <81500a13-0fed-e9d4-7f51-552b888a98e1@linaro.org>
Date: Mon, 14 Aug 2023 09:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for
 drivers
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Organization: Linaro Developer Services
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_004127_936249_46C2C384 
X-CRM114-Status: GOOD (  21.12  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 04/08/2023 16:27, Uwe Kleine-König wrote:
> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.
> 
> The upside is that new lowlevel drivers cannot forget the assignment and
> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a
> module.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpio/gpio-mvebu.c             |  1 -
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>   drivers/leds/rgb/leds-qcom-lpg.c      |  1 -
>   drivers/pwm/core.c                    | 24 ++++++++++++++----------
>   drivers/pwm/pwm-ab8500.c              |  1 -
>   drivers/pwm/pwm-apple.c               |  1 -
>   drivers/pwm/pwm-atmel-hlcdc.c         |  1 -
>   drivers/pwm/pwm-atmel-tcb.c           |  1 -
>   drivers/pwm/pwm-atmel.c               |  1 -
>   drivers/pwm/pwm-bcm-iproc.c           |  1 -
>   drivers/pwm/pwm-bcm-kona.c            |  1 -
>   drivers/pwm/pwm-bcm2835.c             |  1 -
>   drivers/pwm/pwm-berlin.c              |  1 -
>   drivers/pwm/pwm-brcmstb.c             |  1 -
>   drivers/pwm/pwm-clk.c                 |  1 -
>   drivers/pwm/pwm-clps711x.c            |  1 -
>   drivers/pwm/pwm-cros-ec.c             |  1 -
>   drivers/pwm/pwm-dwc.c                 |  1 -
>   drivers/pwm/pwm-ep93xx.c              |  1 -
>   drivers/pwm/pwm-fsl-ftm.c             |  1 -
>   drivers/pwm/pwm-hibvt.c               |  1 -
>   drivers/pwm/pwm-img.c                 |  1 -
>   drivers/pwm/pwm-imx-tpm.c             |  1 -
>   drivers/pwm/pwm-imx1.c                |  1 -
>   drivers/pwm/pwm-imx27.c               |  1 -
>   drivers/pwm/pwm-intel-lgm.c           |  1 -
>   drivers/pwm/pwm-iqs620a.c             |  1 -
>   drivers/pwm/pwm-jz4740.c              |  1 -
>   drivers/pwm/pwm-keembay.c             |  1 -
>   drivers/pwm/pwm-lp3943.c              |  1 -
>   drivers/pwm/pwm-lpc18xx-sct.c         |  1 -
>   drivers/pwm/pwm-lpc32xx.c             |  1 -
>   drivers/pwm/pwm-lpss.c                |  1 -
>   drivers/pwm/pwm-mediatek.c            |  1 -
>   drivers/pwm/pwm-meson.c               |  1 -

Acked-by: Neil Armstrong <neil.armstrong@linaro.org> # pwm-meson

>   drivers/pwm/pwm-microchip-core.c      |  1 -
>   drivers/pwm/pwm-mtk-disp.c            |  1 -
>   drivers/pwm/pwm-mxs.c                 |  1 -
>   drivers/pwm/pwm-ntxec.c               |  1 -
>   drivers/pwm/pwm-omap-dmtimer.c        |  1 -
>   drivers/pwm/pwm-pca9685.c             |  1 -
>   drivers/pwm/pwm-pxa.c                 |  1 -
>   drivers/pwm/pwm-raspberrypi-poe.c     |  1 -
>   drivers/pwm/pwm-rcar.c                |  1 -
>   drivers/pwm/pwm-renesas-tpu.c         |  1 -
>   drivers/pwm/pwm-rockchip.c            |  1 -
>   drivers/pwm/pwm-rz-mtu3.c             |  1 -
>   drivers/pwm/pwm-samsung.c             |  1 -
>   drivers/pwm/pwm-sifive.c              |  1 -
>   drivers/pwm/pwm-sl28cpld.c            |  1 -
>   drivers/pwm/pwm-spear.c               |  1 -
>   drivers/pwm/pwm-sprd.c                |  1 -
>   drivers/pwm/pwm-sti.c                 |  1 -
>   drivers/pwm/pwm-stm32-lp.c            |  1 -
>   drivers/pwm/pwm-stm32.c               |  1 -
>   drivers/pwm/pwm-stmpe.c               |  1 -
>   drivers/pwm/pwm-sun4i.c               |  1 -
>   drivers/pwm/pwm-sunplus.c             |  1 -
>   drivers/pwm/pwm-tegra.c               |  1 -
>   drivers/pwm/pwm-tiecap.c              |  1 -
>   drivers/pwm/pwm-tiehrpwm.c            |  1 -
>   drivers/pwm/pwm-twl-led.c             |  2 --
>   drivers/pwm/pwm-twl.c                 |  2 --
>   drivers/pwm/pwm-visconti.c            |  1 -
>   drivers/pwm/pwm-vt8500.c              |  1 -
>   drivers/pwm/pwm-xilinx.c              |  1 -
>   drivers/staging/greybus/pwm.c         |  1 -
>   include/linux/pwm.h                   | 10 ++++++----
>   68 files changed, 20 insertions(+), 82 deletions(-)
> 

<snip>

> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 25519cddc2a9..5bea53243ed2 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -335,7 +335,6 @@ static const struct pwm_ops meson_pwm_ops = {
>   	.free = meson_pwm_free,
>   	.apply = meson_pwm_apply,
>   	.get_state = meson_pwm_get_state,
> -	.owner = THIS_MODULE,
>   };
>   
>   static const char * const pwm_meson8b_parent_names[] = {

<snip>


