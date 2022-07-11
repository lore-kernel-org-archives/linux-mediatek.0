Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B67FCCA47B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axlXcCK4wzxh1OC0E6EXS/IHkDmYX0iUqKB8KvL3LFw=; b=1q/Rp46YEL8rJsYkI5jYrTahmS
	Xuz7qHo5PVg/ZOjWfYBgEO7LDbtaHcrUEOD2OSJyGatmPsOu/+5Ft2IQYz/AIkkbnLeG0hzxr2D//
	PxfndxVYQSxqblJonyxW2dqG23bFQLTEfxByucgUiF8slOlr/nP6qkGW6giFx3Pe3YjIrMnCgNHQh
	nGC38KMggRF/M9/KkjFWHrnTOO8OB4/W9aixOaWOl4yhU1fqqRxezCMTqC8j+KSNYdLU8MydeVk28
	v2c/Lvhw7+98mL4a2jD3Nqdqh4nTz/y63iT+VmJBzhWCWfyWM8sET46Zg6CplpvoWZ36yfxRNWwhX
	PQENlBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtNg-001sfn-3w; Mon, 11 Jul 2022 13:23:20 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtNe-001seF-3M; Mon, 11 Jul 2022 13:23:19 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3137316bb69so48411067b3.10;
        Mon, 11 Jul 2022 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=axlXcCK4wzxh1OC0E6EXS/IHkDmYX0iUqKB8KvL3LFw=;
        b=azAe6ar9N7tB2G+wHrOJqidSXtmkRQD0XszfgYTB2+nUuftFTGrYAwFKLK6B3VSvxS
         LYH1Ch1YfniUWTW3CljT9wnoyta+kScApyRgNBBwtUCi/8SuQpTd15On5hM+RMT/pKOw
         PMR9DZHIJNVz/bOy9TkXGjKfVd1yG6ELLdYt5M1YzJQnXHR03UvBzEXEZrZakP3yZjhg
         msD6j0yevsiH5FrMqegzrvcVo0vnL0k2Re8yem12ugUbCbH9UeagckJsjPGufgCutt6V
         CGQsws9fhqWC8Mn/goNdZTafu0+ayr/f54YG0TitzQOIrIasgcA2HjL7yimlYdQsrgHv
         atcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=axlXcCK4wzxh1OC0E6EXS/IHkDmYX0iUqKB8KvL3LFw=;
        b=XnA46EQJS6Eb9j1YwIOUK3X6eTlBB8iMkIM6dtphf+j/HjLW2Ucc9NnxWdZZWQobFl
         4K4sJsKZ5b7Y7OFLOof9zZ037pAN4y5lJM6bRpWyXg46inhK/Rt2wAxmEPyMFfyE3ljx
         j2ifIxxG1K7T4p9Ckjpc2NMi5KINOtGnntNYWQScYUqcMStBLoj+6gvJvNe9mOHZw541
         JxrMvttveJRy6C5JHTtBs4A8Pfca6JKWllJJ1/2kRwu/7S9rc+Rvnq2/QTjMRIexiXnX
         7MEQuFelPcDjWf9jSCCL1uTiejtUk42w2butEqsOxhb9su9jxlrvuRmTKqBGyglTD9Pa
         CLWA==
X-Gm-Message-State: AJIora/TkltVNU2r1/xKLlZ/zoscjQFPOg0/yPKhBhHS9tXxd4XQ3yIM
	xY78E32SlGHbxcACkTrGEXy7QSzQ9pPUE1TzbqU=
X-Google-Smtp-Source: AGRyM1uI6d1T0dRGT/n+l18kDyDiKT6LcPWA/8qru61SWwefVBnYcSZqQGKMaS94keyx+UdRlU9g/tUjYLQBPiPZtwE=
X-Received: by 2002:a81:4bd7:0:b0:31c:91da:5a20 with SMTP id
 y206-20020a814bd7000000b0031c91da5a20mr20827843ywa.131.1657545796406; Mon, 11
 Jul 2022 06:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com>
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:22:39 +0200
Message-ID: <CAHp75VeMXP1WyQcFQU_RW-a_CSGVMF_NsgHtLEbL8hi-n8gSVw@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] make iio inkern interface firmware agnostic
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-iio <linux-iio@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Benson Leung <bleung@chromium.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Eugen Hristev <eugen.hristev@microchip.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Benjamin Fair <benjaminfair@google.com>, 
	Nancy Yuen <yuenn@google.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Jishnu Prakash <quic_jprakash@quicinc.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Fabio Estevam <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Shawn Guo <shawnguo@kernel.org>, Haibo Chen <haibo.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Patrick Venture <venture@google.com>, 
	Amit Kucheria <amitk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Gwendal Grignou <gwendal@chromium.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Saravanan Sekar <sravanhome@gmail.com>, 
	Guenter Roeck <groeck@chromium.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_062318_178962_34C65DFD 
X-CRM114-Status: GOOD (  28.80  )
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

On Mon, Jul 11, 2022 at 2:38 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> First version of the series can be found here:
>
> https://lore.kernel.org/linux-iio/20220610084545.547700-1-nuno.sa@analog.=
com/

I'm under the impression that I gave tags for some of these patches
when they were the part of the bigger series. Am I wrong?
In any case for patch 6-14,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> v2 changes:
>
> [1/15]
>   * Fix typo and added more description in the commit message.
>
> [3/15]
>   * Remove superfluous code;
>   * Commit message spell fixes and added more details;
>   * Improved error handling (this is the most significant change in this
> version. More details on the commit message).
>
> [4/15]
>   * Drop the 'ugly' parent_lookup flag. With the new error handling,
>     we can use -ENODEV to infer if we should proceed or not with the
>     lookup.
>
> [5/15]:
>   * Moved some local declarations up so long lines first;
>   * Use 'bus_find_device_by_fwnode()';
>   * Proper ordering in includes.
>   * Adapted error handling in '__fwnode_iio_channel_get_by_name()' taking
> ACPI into account and when 'name' is given but index < 0. It seems that
> ACPI code can actually return -ENOENT with index < 0 for which case we
> should continue the search. Not sure if a check  in ACPI ('if (index < 0)
> return -EINVAL;) like is done in OF would make sense...
>
> [12/15]:
>   * Use 'device_property_count_u64()' to get the number of diff channels.
> So no need for 'magic' divisions by 2 (no idea why I haven't done like
> this in the first place).
>
> [15/15]
>   * Fix wrong conversion of 'if (ptr !=3D NULL)' to 'if (!ptr)'.
>
> Special note for patch 3/15 where -ENODEV is still used despite some talk=
s
> about using -ENOENT and hence, be more in line with firmware code. The
> reason I kept it was to be consistent with the rest of the file. I'd say
> that if we want to move to -ENOENT we should do it in a separate patch
> and for the complete file.
>
> Nuno S=C3=A1 (15):
>   iio: inkern: only release the device node when done with it
>   iio: inkern: fix return value in devm_of_iio_channel_get_by_name()
>   iio: inkern: only return error codes in iio_channel_get_*() APIs
>   iio: inkern: split of_iio_channel_get_by_name()
>   iio: inkern: move to fwnode properties
>   thermal: qcom: qcom-spmi-adc-tm5: convert to IIO fwnode API
>   iio: adc: ingenic-adc: convert to IIO fwnode interface
>   iio: adc: ab8500-gpadc: convert to device properties
>   iio: adc: at91-sama5d2_adc: convert to device properties
>   iio: adc: qcom-pm8xxx-xoadc: convert to device properties
>   iio: adc: qcom-spmi-vadc: convert to device properties
>   iio: adc: qcom-spmi-adc5: convert to device properties
>   iio: adc: stm32-adc: convert to device properties
>   iio: inkern: remove OF dependencies
>   iio: inkern: fix coding style warnings
>
>  drivers/iio/adc/ab8500-gpadc.c           |  27 +--
>  drivers/iio/adc/at91-sama5d2_adc.c       |  30 +--
>  drivers/iio/adc/ingenic-adc.c            |   8 +-
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c      |  58 +++--
>  drivers/iio/adc/qcom-spmi-adc5.c         |  63 +++---
>  drivers/iio/adc/qcom-spmi-vadc.c         |  44 ++--
>  drivers/iio/adc/stm32-adc.c              | 121 +++++-----
>  drivers/iio/inkern.c                     | 271 +++++++++++++----------
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c |   3 +-
>  include/linux/iio/consumer.h             |  28 +--
>  include/linux/iio/iio.h                  |   8 +-
>  11 files changed, 347 insertions(+), 314 deletions(-)
>
> --
> 2.37.0
>


--=20
With Best Regards,
Andy Shevchenko

