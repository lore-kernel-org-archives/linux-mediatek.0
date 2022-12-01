Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD8CC4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=; b=ArlME5uBMqk+CfP5PriPxycYnj
	Nxi76INt2dPuBLVtvvY01IC2sh7dEAmngCaIoG8+5IdYjRD97bSGEgSNEdcnyi6vY0g9BWzDhh/8x
	BQWL5sKAD1IHXKbz2xfGTYmP3Wz599CeW8wAEypvskqxFoJgMRMqZNtKFtGCcx6Yw9IhesNS41GjM
	kbPpzwAyISHGglrTw27TH/Us27UYTw1QJRsZB+wnkO2eEi3xuf+rbK6Ingk4SeOxhA0BovMhV8FaX
	6FeVR3pyHeB32a01B71025hB3TjgOWf1IzFHVombSDaDe6M1vZirvySn+xBjww5Oo+r3uMFpuZ+xJ
	HnNfzc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ld9-008H6B-EV; Thu, 01 Dec 2022 15:37:43 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ld5-008Gzc-9b
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 15:37:41 +0000
Received: by mail-ej1-x629.google.com with SMTP id td2so5112495ejc.5
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=;
        b=YOSKLNbCT/4q5PjmWEt1oRxSc0fAHVkR9aCRojDmy6dX3JIfmuh09oI2+RqgLe5/jd
         rhksY1dFQr1NIf0y+S4W3Srw2WU7sHKiYYle1iNRxPBiBIzFXL82IukHMHMtY9muYje3
         xmUTZGxkap/l3tbGPVsjXSxV7D/2u9/HaWZ6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=;
        b=cZI+4JbgVJGvHv+1xKgk6TSrLCITG1uNlwpzmvvffntxIv2vHSykCpuGYLzn+lcFke
         e7HEHMptMpMavWbB8yhQhCgCSazGXaAIjNg1ugmUzV6Fx6D+hRXf1lRBQkmB3ebN/K9S
         v72aDMDxt/TnwuIBs4fbyErsxZT/mzTP96tOt2PxDyuX5aOgiGrZD5cBwVH4UtQ9xxoR
         QDn+bvcFyMpTvvUcE8ONgbywgATdl5bD/dn5KblVCqVVDVe/rYE0hsVnXTpbrWCKwAbN
         ihjO1ycUJTxeuOxr1I3xO8d9rWlZpJx91FWLUVtRYyB6ma5o3WR8b9q8/PS28TNhHVUA
         54QQ==
X-Gm-Message-State: ANoB5plt94tzZzCf2CH/1gImF+iC0zQWiRcKGIECLrpkYHxkY0WlwMw1
	cFGlj5X25GoQe35o5AOHKk0DNQjMZFqeZ4qD
X-Google-Smtp-Source: AA0mqf6DEFKnHfUks8iI71oKu3PYpEa3THArzeVb69+Ar/1w9MhnKq7lJ1KLnu8xn6z8+2UhDZFWtQ==
X-Received: by 2002:a17:906:50f:b0:78d:ad5d:75e with SMTP id j15-20020a170906050f00b0078dad5d075emr57302339eja.172.1669909055509;
        Thu, 01 Dec 2022 07:37:35 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id l4-20020aa7c304000000b00458dc7e8ecasm1838147edq.72.2022.12.01.07.37.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 07:37:33 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id x17so3290993wrn.6
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 07:37:32 -0800 (PST)
X-Received: by 2002:a5d:4950:0:b0:242:1f80:6cd9 with SMTP id
 r16-20020a5d4950000000b002421f806cd9mr9556520wrs.405.1669909041754; Thu, 01
 Dec 2022 07:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de> <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Dec 2022 07:37:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJ-YygjS9ukN8+hYxebUneFd-8=UEX3ZvSVQso7CGgng@mail.gmail.com>
Message-ID: <CAD=FV=VJ-YygjS9ukN8+hYxebUneFd-8=UEX3ZvSVQso7CGgng@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error code
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, 
	Michal Simek <michal.simek@xilinx.com>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_073739_350324_69535667 
X-CRM114-Status: GOOD (  20.93  )
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

Hi,

On Wed, Nov 30, 2022 at 7:22 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> .get_state() might fail in some cases. To make it possible that a driver
> signals such a failure change the prototype of .get_state() to return an
> error code.
>
> This patch was created using coccinelle and the following semantic patch:
>
> @p1@
> identifier getstatefunc;
> identifier driver;
> @@
>  struct pwm_ops driver =3D {
>         ...,
>         .get_state =3D getstatefunc
>         ,...
>  };
>
> @p2@
> identifier p1.getstatefunc;
> identifier chip, pwm, state;
> @@
> -void
> +int
>  getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct pwm_s=
tate *state)
>  {
>    ...
> -  return;
> +  return 0;
>    ...
>  }
>
> plus the actual change of the prototype in include/linux/pwm.h (plus some
> manual fixing of indentions and empty lines).
>
> So for now all drivers return success unconditionally. They are adapted
> in the following patches to make the changes easier reviewable.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  9 ++++++---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>  drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
>  drivers/pwm/pwm-atmel.c               |  6 ++++--
>  drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
>  drivers/pwm/pwm-crc.c                 | 10 ++++++----
>  drivers/pwm/pwm-cros-ec.c             |  8 +++++---
>  drivers/pwm/pwm-dwc.c                 |  6 ++++--
>  drivers/pwm/pwm-hibvt.c               |  6 ++++--
>  drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
>  drivers/pwm/pwm-imx27.c               |  8 +++++---
>  drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
>  drivers/pwm/pwm-iqs620a.c             |  6 ++++--
>  drivers/pwm/pwm-keembay.c             |  6 ++++--
>  drivers/pwm/pwm-lpss.c                |  6 ++++--
>  drivers/pwm/pwm-meson.c               |  8 +++++---
>  drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
>  drivers/pwm/pwm-pca9685.c             |  8 +++++---
>  drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
>  drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
>  drivers/pwm/pwm-sifive.c              |  6 ++++--
>  drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
>  drivers/pwm/pwm-sprd.c                |  8 +++++---
>  drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
>  drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
>  drivers/pwm/pwm-sunplus.c             |  6 ++++--
>  drivers/pwm/pwm-visconti.c            |  6 ++++--
>  drivers/pwm/pwm-xilinx.c              |  8 +++++---
>  include/linux/pwm.h                   |  4 ++--
>  29 files changed, 146 insertions(+), 89 deletions(-)

For ti-sn65dsi86.c:

Acked-by: Douglas Anderson <dianders@chromium.org>

