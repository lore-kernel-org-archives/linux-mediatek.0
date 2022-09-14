Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CAFECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmcKEjTS1hv6gEdnWK2Uvw+XT407+XmrNmwBWhV8Lok=; b=EwPTsgzVQ9UxkN3pXFY5SRKM3l
	Vf8+gNlvPwVh5MK2P+MP4RIr3yt+fZDG9sossfiOhY0SnGXIomuYaobCOMmvvTx3c1pk764RLHD7N
	cOgv31OJILm+kysyVJQjN6ZymIbK5hte9T1ZLBmsNOXCgY121qP3rIKrkrVV5Rq3sCLNX/FjONGHz
	0+OVn6gQP0HXBSCmaB/kOvugIvj7wbPPLSyQg6ELpsad8YeauDTuZNC0Oae1Y7YmOLrB51nfjcUMS
	pLmRuC2Bup1EKvPojgD+RtrkJA8VSr/dfzYXdvR24pvEe5FvTByd4+Y/0pZWceEA1mo3YBbdoezgb
	4j3ivxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRwQ-000Gme-8t; Wed, 14 Sep 2022 12:56:34 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRwM-000GZW-NC
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 12:56:32 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3457bc84d53so179390907b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mmcKEjTS1hv6gEdnWK2Uvw+XT407+XmrNmwBWhV8Lok=;
        b=E3tQcQgTwxMM8Jz3YFNM2CB98b1QbEi2wST6iyzoPV0qeijgEGW7rV3WUcjqTE71Hn
         0NTSsnXkcz2xFaaGiTt/6YT0CTa9XFVvYlm5zhXzJqJmjyrTuKNkfS9pgFhE8jRHISRR
         fXQOUdhLOPVRGiPar1YyTtu06rfJloenQf9Cdd2TlNv4v+A3wcvluYwD6EfVkQq1wS5k
         deBt9FO2MCw9DcT+zBrJHdxEoCe6Ts3KrzMGE/82yrRnwbeGTRJ48fbRS+lcVkmQKm/q
         Qbx2gdL57D/j8QJTpDZh1bYsBSzbm/yiVmlq/KIFb0nugWvzQR8aTztgPXnOkADYq+ja
         46+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mmcKEjTS1hv6gEdnWK2Uvw+XT407+XmrNmwBWhV8Lok=;
        b=zZJ3mDQ4JGFTIBLTm+yCD1WpQXMP861dLic1mbkjb5foZ4Ze6pnp/b8W7tKQrd0H3m
         C6VuN7nLgxL6EsmUbC1ZJsSpegVg/zBV3+MJo1wI4R/GAzFFMYpnXJnO3pjVAz4HocmI
         zYeWaReN2zTBaBt/DUXPdjH7lz2XHwSUTQrBjmkT+CCsTBR/2dQTog13f0sUuViyr9Qg
         UtJFFKFTho4Yoh9URxK8nRfYZDPDJ1myMmV7WvAw3rl+88x7cq1BKlXajLEEEtFQOYYM
         WStKhPlH0PTPCKE+wz4sHt8qlnjq7bHFE3vzaEGCo2vqgcRBebM38HnXl9+01KbDUKxj
         tV6g==
X-Gm-Message-State: ACgBeo2fvdhvg4uIg2cH53ThCt2ds35fITGSm/8UolyNBcS59RxK2z0Z
	W87+g1d/jiVxlOXjHq0ePa9fKjkojK3c1lCmLb/CHw==
X-Google-Smtp-Source: AA6agR4CWQ6/k5R9xvM/2hZ7UEs2ayJ5TYG/Br2SOS3GeCeaVI11cKB8LqqUD5RjhxjT2z6m2HTdQnRqrXAzpUSsxvU=
X-Received: by 2002:a0d:f204:0:b0:333:c23f:d793 with SMTP id
 b4-20020a0df204000000b00333c23fd793mr30919559ywf.71.1663160188392; Wed, 14
 Sep 2022 05:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220817080757.352021-1-bchihi@baylibre.com> <20220817080757.352021-2-bchihi@baylibre.com>
 <48cb4f47-754c-9994-2489-7ffabfc1b3b9@collabora.com>
In-Reply-To: <48cb4f47-754c-9994-2489-7ffabfc1b3b9@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 14 Sep 2022 14:55:52 +0200
Message-ID: <CAGuA+oqnqzABCs1fmeH+bmEGgz_7_rt7co8g8GbyeqHnqaOohQ@mail.gmail.com>
Subject: Re: [PATCH v9,1/7] thermal: mediatek: Relocate driver to mediatek folder
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
X-CRM114-CacheID: sfid-20220914_055630_778068_63DDA635 
X-CRM114-Status: GOOD (  30.27  )
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

Hi Angelo,

Nice to hear from you again.
Understood. The changes you asked for will be implemented in the v10
of this series.
It will be sent very soon, I'm still working on Daniel's review too.

Thank you for the review!

Best regards,
Balsam

On Wed, Sep 14, 2022 at 1:58 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/08/22 10:07, bchihi@baylibre.com ha scritto:
> > From: Michael Kao <michael.kao@mediatek.com>
> >
> > Add MediaTek proprietary folder to upstream more thermal zone and cooler
> > drivers, relocate the original thermal controller driver to it, and rename it
> > as "auxadc_thermal.c" to show its purpose more clearly.
> >
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Co-developed-by: Ben Tseng <ben.tseng@mediatek.com>
> > Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> > Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >   drivers/thermal/Kconfig                       | 14 ++++--------
> >   drivers/thermal/Makefile                      |  2 +-
> >   drivers/thermal/mediatek/Kconfig              | 22 +++++++++++++++++++
> >   drivers/thermal/mediatek/Makefile             |  1 +
> >   .../auxadc_thermal.c}                         |  2 +-
> >   5 files changed, 29 insertions(+), 12 deletions(-)
> >   create mode 100644 drivers/thermal/mediatek/Kconfig
> >   create mode 100644 drivers/thermal/mediatek/Makefile
> >   rename drivers/thermal/{mtk_thermal.c => mediatek/auxadc_thermal.c} (99%)
> >
> > diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> > index e052dae614eb..d35f63daca3b 100644
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
> > index def8e1a0399c..f7daeb8056c4 100644
> > --- a/drivers/thermal/Makefile
> > +++ b/drivers/thermal/Makefile
> > @@ -55,7 +55,7 @@ obj-y                               += st/
> >   obj-$(CONFIG_QCOM_TSENS)    += qcom/
> >   obj-y                               += tegra/
> >   obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> > -obj-$(CONFIG_MTK_THERMAL)    += mtk_thermal.o
> > +obj-y                                += mediatek/
> >   obj-$(CONFIG_GENERIC_ADC_THERMAL)   += thermal-generic-adc.o
> >   obj-$(CONFIG_UNIPHIER_THERMAL)      += uniphier_thermal.o
> >   obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
> > diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
> > new file mode 100644
> > index 000000000000..8ff32370b591
> > --- /dev/null
> > +++ b/drivers/thermal/mediatek/Kconfig
> > @@ -0,0 +1,22 @@
> > +config MTK_THERMAL
> > +     tristate "MediaTek thermal drivers"
> > +     depends on THERMAL_OF
> > +     help
> > +       This is the option for MediaTek thermal software solutions.
> > +       Please enable corresponding options to get temperature
> > +       information from thermal sensors or turn on throttle
> > +       mechaisms for thermal mitigation.
> > +
> > +if MTK_THERMAL
> > +
> > +config MTK_SOC_THERMAL
> > +     tristate "AUXADC temperature sensor driver for MediaTek SoCs"
> > +     depends on HAS_IOMEM
> > +     depends on NVMEM
>
> That's not true. This driver doesn't depend on NVMEM, as in function
> mtk_thermal_get_calibration_data(), the calibration params are initialized
> with default values and if no "calibration-data" cell was found, it will
> return 0 and simply go on with probing... and this is because not all SoCs
> need calibration data from eFuses.
> If you check carefully, the original entry says "NVMEM || NVMEM=n".
>
> Please drop the NVMEM dependency from this config entirely.
>
> > +     depends on RESET_CONTROLLER
>
> While at it, can you please also drop the dependency for RESET_CONTROLLER?
> I know it was present on the original config entry, but that's wrong, as
> the driver doesn't strictly require resets, as it uses device_reset_optional().
>
>
> Regards,
> Angelo
>

