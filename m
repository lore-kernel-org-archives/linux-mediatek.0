Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E85DC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2f3kh3jqi9yjSQzKeEhCTNVhq9kV2tSI6rer8mhvNI=; b=navfrINSQpeSm6ry5V6ZMJtorC
	iPDGM3hDma5g53QoNhdw8cTRWp8hcgbsH94nI+ISL661TkTJ0H+yulRzV5Sk7OrHvL+BBVslgzvdv
	FCgKcpq4vtfwzJjjAnlY/GK20UUAAW8hK67uESSZDHyLn4S2ZYM/y8PJI7lJDLNLN3dLMNs2S2GPb
	BSccrb3Av7N3ntKe+J0QdMTcPCcjdhGHR1BBZjt5w8efnM/s4r+f+HQfzvGaFgPiHAJgvzdVSwm4b
	SkOkqsDE6lYqN77vl3AOGkXbA2/S+s6fJ4raLlXJfORJuuanotL/w5BhnAVtozQmiPI7QtwXVGhuK
	6H7FlRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcxm-00BWPo-Jw; Wed, 27 Jul 2022 09:04:18 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcxi-00BWLd-Ug
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 09:04:16 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id d124so11802163ybb.5
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2f3kh3jqi9yjSQzKeEhCTNVhq9kV2tSI6rer8mhvNI=;
        b=WjFzxSO2wJzIbJH4XkUpRb5mtLv5lM7tMqrUu61P+vX0mCZ/dxyDFrjHgg+qBFmghP
         nfGkL9gbS4Vwnuud/OmpQCyB0dChfNXSYl32JihYvnsBaCCarUtHOOga4p4XSzpQttS6
         tzpx1dwoudB1NWkAiJvbO21luJ/qSTi1mF8Ku8IMdXHKV/5OiSzbGwXEVW0QvM71M8EC
         SeUocZhlVq/HD29CtUs1jWRlWUZg0UGiSRK1SMN0nL1eB+v5zdZz/2mSy009D7aOwqFW
         KSeQ/Q7fVmh7VjJga5qADbHbVztwLQMIU30KVKqPo5h4nsiKuHvwDyAZGhzrWlgFzhK3
         N3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2f3kh3jqi9yjSQzKeEhCTNVhq9kV2tSI6rer8mhvNI=;
        b=2up+Xm10sgSGu12wGREuqhuwDX0zpolNVJb9/hafDHJ8Kw7huwuhHDAKG+6ZA4Ji1M
         oln7bQWv0r6D++tkYl+ng9jhDqurcqpDRxsoodv+S1g16T1xMrbrxERdrSohFyyIFNri
         XifdFLiNEdYtAYJDVZg0YElcbGPGWqyj+z4q3GbkvBmH4wu/Ez4+ISNkZgzehwgqxndA
         A8W/p9ydw/YFAZug9UY7wkI5++yq5Rgwnx08WuHHEqz62HgD7gchYNJ/FutqS2aNzfoI
         cPRBTci45r+vJnQXwQGaPiASOLRKl02Xsznn8lrafRl11i+e4SYT/V0cJKgLF5eHOxNG
         JgQw==
X-Gm-Message-State: AJIora+T3KHwqH69JL+dAv4A6WA9MU4LcH4vcHKV7zd9MoKg3BdvG9sB
	c7Ho7ObePgx68kJK1JVFIxE0NYAOrOr5Ec7UCRYJTA==
X-Google-Smtp-Source: AGRyM1tFqXVl1Wq7EQt3qviY8BvioiYzPA9jdIWLjIYucLUw/m0e/HDPSy2RNp34GiUJ0LE93SKzgQ/kW9FUP7L1iYE=
X-Received: by 2002:a25:ba02:0:b0:670:8171:3176 with SMTP id
 t2-20020a25ba02000000b0067081713176mr15910761ybg.61.1658912652855; Wed, 27
 Jul 2022 02:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-2-bchihi@baylibre.com>
 <3cb97e73-d60a-086d-83c2-1711c70057a2@collabora.com>
In-Reply-To: <3cb97e73-d60a-086d-83c2-1711c70057a2@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 27 Jul 2022 11:03:36 +0200
Message-ID: <CAGuA+orsPVDjKcD=nMoHNKkQd3LNP8FP+TDSCWvabmR9f19TWw@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek folder
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_020415_068290_163E37CF 
X-CRM114-Status: GOOD (  22.96  )
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

On Wed, Jul 27, 2022 at 10:24 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/07/22 15:55, Balsam CHIHI ha scritto:
> > Add Mediatek proprietary folder to upstream more thermal zone and cooler
> > drivers. Relocate the original thermal controller driver to it and rename
> > as soc_temp.c to show its purpose more clearly.
> >
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >   drivers/thermal/Kconfig                       | 14 ++++-------
> >   drivers/thermal/Makefile                      |  2 +-
> >   drivers/thermal/mediatek/Kconfig              | 23 +++++++++++++++++++
> >   drivers/thermal/mediatek/Makefile             |  1 +
> >   .../{mtk_thermal.c => mediatek/soc_temp.c}    |  0
> >   5 files changed, 29 insertions(+), 11 deletions(-)
> >   create mode 100644 drivers/thermal/mediatek/Kconfig
> >   create mode 100644 drivers/thermal/mediatek/Makefile
> >   rename drivers/thermal/{mtk_thermal.c => mediatek/soc_temp.c} (100%)
> >
> > diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> > index 0e5cc948373c..ecba8d6e313b 100644
> > --- a/drivers/thermal/Kconfig
> > +++ b/drivers/thermal/Kconfig
> > @@ -412,16 +412,10 @@ config DA9062_THERMAL
> >         zone.
> >         Compatible with the DA9062 and DA9061 PMICs.
> >
> > -config MTK_THERMAL
> > -     tristate "Temperature sensor driver for mediatek SoCs"
> > -     depends on ARCH_MEDIATEK || COMPILE_TEST
> > -     depends on HAS_IOMEM
> > -     depends on NVMEM || NVMEM=n
> > -     depends on RESET_CONTROLLER
> > -     default y
> > -     help
> > -       Enable this option if you want to have support for thermal management
> > -       controller present in Mediatek SoCs
> > +menu "Mediatek thermal drivers"
> > +depends on ARCH_MEDIATEK || COMPILE_TEST
> > +source "drivers/thermal/mediatek/Kconfig"
> > +endmenu
> >
> >   config AMLOGIC_THERMAL
> >       tristate "Amlogic Thermal Support"
> > diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> > index def8e1a0399c..3c00e864ad55 100644
> > --- a/drivers/thermal/Makefile
> > +++ b/drivers/thermal/Makefile
> > @@ -55,7 +55,7 @@ obj-y                               += st/
> >   obj-$(CONFIG_QCOM_TSENS)    += qcom/
> >   obj-y                               += tegra/
> >   obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> > -obj-$(CONFIG_MTK_THERMAL)    += mtk_thermal.o
> > +obj-$(CONFIG_MTK_THERMAL)    += mediatek/
> >   obj-$(CONFIG_GENERIC_ADC_THERMAL)   += thermal-generic-adc.o
> >   obj-$(CONFIG_UNIPHIER_THERMAL)      += uniphier_thermal.o
> >   obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
> > diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
> > new file mode 100644
> > index 000000000000..9c41e9079fc3
> > --- /dev/null
> > +++ b/drivers/thermal/mediatek/Kconfig
> > @@ -0,0 +1,23 @@
> > +config MTK_THERMAL
> > +     tristate "MediaTek thermal drivers"
> > +     depends on THERMAL_OF
> > +     help
> > +             This is the option for MediaTek thermal software
> > +             solutions. Please enable corresponding options to
> > +             get temperature information from thermal sensors or
> > +             turn on throttle mechaisms for thermal mitigation.
>
> Sorry, I just noticed that the indentation must be fixed.
>
>         help
>           This is the option .....
>
> Thanks,
> Angelo
OK, It will be fixed ASAP.

Thanks,
Balsam.

