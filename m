Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D85C388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 22:36:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A1B924655
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 22:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uiuy50ww";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9x1Rli/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A1B924655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wAcQmH89OhAlH3CTQZ7669KsBSBokBRopHaxXC2d2fQ=; b=Uiuy50wwf3Sjx6Nip4aCV4rYD
	aA2IUbawJnyJ9exgqNheWa/uMGDMZxrH5cXP5FXHYmsjnuGKzh4Eb/SPaJIP0eC27pSbA73ruPgQZ
	wgOkxWtKK/heab8NAJR5xxRaKXzeGOvPc8Gels3MV/b9A7J0hCJGXA527K5Uw3uWcCIz3LhcWEvj0
	pdGI2u6MUqKJGfRITDH1ClQiLvzBfP/7m/RyymDPOXsXMxSLu+ZWmdAWSHa5H5jFgRh0lg7WOAbu4
	D6Gdg+oaHLhfYHWwxlG+zd3IvhPgnLKjKcYpCS9NwXZCi87VDy2kLwgT6XcpjVcgFjMVJdzY3pdSz
	SkfSZGeCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVjBk-000278-JU; Thu, 22 Oct 2020 22:36:04 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTRdu-0007TS-VE; Fri, 16 Oct 2020 15:27:43 +0000
Received: by mail-pj1-x1041.google.com with SMTP id gm14so1573480pjb.2;
 Fri, 16 Oct 2020 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HjOH7NSlzQ7luzN2AMo9usje/o0UOzhmlVRD7uHXj6M=;
 b=K9x1Rli/OUH/hZT7zUWaeKHbnNXAbCLRgnq0lD6FZZwPEaGKZS/DVU3KPE84bipH/B
 REnPrkeicA7AASNY+yqg1FXbsPnMR3zKPn6JXkOratJxVKyNVuWr4Q/nIYybDMVB0Goy
 hhGA5ji82UU8gx0AI5grKhfo9TXKvDhVfi9rhxSd21jZyg0csK1TnZdTtCIdRaARL9MA
 byqR//9GsK62PBX7Et/5o3UB7+xP8bp4zsFkWtERoMFXCas2mgovU0yHFL5Y2iiCpXg7
 LaYWioxVs2rrcylQQ6LgbaQEOswEc5Ver2g0lpaUfike4R1VFfCKlceSqmwm7EfIbJXl
 yjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HjOH7NSlzQ7luzN2AMo9usje/o0UOzhmlVRD7uHXj6M=;
 b=AqUXO4FgHVrnlnA60Chz6sBosoClbiyRS8KbwlasH5xji8hZZRkiViY8jAqnBlzfe9
 1o62p315hQNTHp5CZ+LW7RKRWWdAAZmHpRiGiw2z1KPmX6ir/xsKFNgbjJiaW3yyTCpZ
 Ge3qGViWbPzUAPUPDJNTcYX++mYZBybYWJky98oclC9VIk000aqzqz61lEE3C0zX8WSE
 Ea5a36KpbrH1Rtaq/jQmhMCXcDxHmPCxASCWIfCfa9w0NDFvAyDaD9m2gBTlL0TKdFkf
 hD6wpQoiPZ7rmwwXeaZ9HBWTxplL16MraXvKpYGFMu5aJkVDsAgthWIuth02Aunw672i
 BVTg==
X-Gm-Message-State: AOAM531hZF7nE2TP7BqV9EfoNi9D5KxbIYSJtUD4oiC38h33KwcPkDNB
 7BhGsJG13mg0EGZHTrdwKbLQiqJ8ElcX3LtSLKg=
X-Google-Smtp-Source: ABdhPJyEcO5/SUrS3pBTLwVxNUw44/tRmS0EyySbmvXAf/Ih98PiyY0i3H9Nfb9IY7DnsI6E/rU3+aLtOuYddVVQDwY=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr4688408plr.0.1602862060726; Fri, 16 Oct
 2020 08:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
 <1601542448-7433-4-git-send-email-gene.chen.richtek@gmail.com>
In-Reply-To: <1601542448-7433-4-git-send-email-gene.chen.richtek@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 16 Oct 2020 18:28:29 +0300
Message-ID: <CAHp75VdPjT-wNw0_fNXBEd9ub2Eg_thM2wY9QqrjhwYcz+=ytQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] iio: adc: mt6360: Add ADC driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_112743_009404_2127E76C 
X-CRM114-Status: GOOD (  20.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio <linux-iio@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Jonathan Cameron <jic23@kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 11:55 AM Gene Chen <gene.chen.richtek@gmail.com> wrote:
>
> From: Gene Chen <gene_chen@richtek.com>
>
> Add MT6360 ADC driver include Charger Current, Voltage, and

including

> Temperature.

...

> +#define MT6360_AICR_MASK       GENMASK(7, 2)

bits.h is missed.

...

> +#define MT6360_ADCEN_MASK      0x8000

BIT() ?

...

> +static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int *val)
> +{

> +       start_t = ktime_get();
> +       predict_end_t = ktime_add_ms(mad->last_off_timestamps[channel], 2 * ADC_WAIT_TIME_MS);
> +
> +       if (ktime_after(start_t, predict_end_t))
> +               pre_wait_time = ADC_WAIT_TIME_MS;
> +       else
> +               pre_wait_time = 3 * ADC_WAIT_TIME_MS;
> +
> +       msleep(pre_wait_time);

This looks like NIH of wait_interruptible() or so.

...

> +       while (true) {

Oh, please avoid infinite loops.

> +               ret = regmap_raw_read(mad->regmap, MT6360_REG_PMUADCRPT1, rpt, sizeof(rpt));
> +               if (ret)
> +                       goto out_adc_conv;
> +
> +               /*
> +                * There are two functions, ZCV and TypeC OTP, running ADC VBAT and TS in
> +                * background, and ADC samples are taken on a fixed frequency no matter read the
> +                * previous one or not.
> +                * To avoid conflict, We set minimum time threshold after enable ADC and
> +                * check report channel is the same.
> +                * The worst case is run the same ADC twice and background function is also running,
> +                * ADC conversion sequence is desire channel before start ADC, background ADC,
> +                * desire channel after start ADC.
> +                * So the minimum correct data is three times of typical conversion time.
> +                */
> +               if ((rpt[0] & MT6360_RPTCH_MASK) == channel)
> +                       break;
> +
> +               msleep(ADC_WAIT_TIME_MS);
> +       }

So, a new NIH of regmap_read_poll_timeout() ?

...

> +       /* rpt[1]: ADC_HI_BYTE, rpt[2]: ADC_LOW_BYTE */
> +       *val = rpt[1] << 8 | rpt[2];

get_unalined_be16() and hence redundant comment.

...

> +static int mt6360_adc_read_offset(struct mt6360_adc_data *mad, int channel, int *val)
> +{
> +       *val = (channel == MT6360_CHAN_TEMP_JC) ? -80 : 0;
> +       return IIO_VAL_INT;

> +

Misplaced blank line.

> +}

> +static const char *mt6360_channel_labels[MT6360_CHAN_MAX] = {
> +       "usbid", "vbusdiv5", "vbusdiv2", "vsys", "vbat", "ibus", "ibat", "chg_vddp", "temp_jc",
> +       "vref_ts", "ts"

Leave comma.
And split  either by power of two or equally between the lines (seems
like 8 + 3 here).

> +};

...

> +       /* Reset all channel off time to the current one */
> +       all_off_time = ktime_get();
> +       for (i = 0; i < MT6360_CHAN_MAX; i++)
> +               info->last_off_timestamps[i] = all_off_time;

memset32() / memset64() / memset_l()
(Not applicable, but JFYI: memset_p() also present)

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
