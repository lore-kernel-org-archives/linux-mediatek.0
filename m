Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45258C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:09:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA3F820809
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pQwsEpim";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EgVUQ50K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA3F820809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/kj6jwATwzDvPynJT1fpxFJZrB2ZpFzi/xR/HlJA+Kc=; b=pQwsEpimhmZGzj+mXbuRMv9FY
	DlOX43m6jExNAEERnWspOgJHwO7ataHgH1T06GJ2lqLpZY3LcDeacJrF/tFMiPrjd/WpXbI9hRZFV
	ptASDFKQGr1WFLsEHuv4fqhk0KleSyhd1jNmcEEfYN8tFySlzs2o3NzSnx4D0bArU4JQgHADWVbQ9
	a9M4+ng7oOrLsn9CznFxC+VVu6UKTv//7xKa9iNJtdnBprsBIGscH/QNS1nVEzF/DPpFDtKMlvMKI
	FrkC2T4IbBudW+RrI+AC0/8gKbZwzvRXgJ8g6kGIHbkieOLJy/dT3mKmv10YTMpFIC1l+oxg3kmVg
	z0GFjCcJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6vK-0005g7-CO; Mon, 26 Oct 2020 18:08:50 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6v2-0005aQ-Qp
 for linux-mediatek@lists.infradead.org; Mon, 26 Oct 2020 18:08:39 +0000
Received: by mail-il1-x144.google.com with SMTP id k1so9208360ilc.10
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2020 11:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FHudRtp7yzYdmsxvUUGKxH7K88Fn6l9DBuMQ5iU2qAI=;
 b=EgVUQ50Kuv45cI5ojv4WXe4qC3H1y/RPR4naCQph6DTzVdU4YcS6zm1VL0nyTRaKSz
 7Xa4pbYYWS5GJ5MRiqBFginYq2aewpye2Sj6DcyQ/5XmHeefO1RRueF0X71qlv8LY8pL
 y6/n5OYAur+1WCRQF1PU3ncXDYj+5m6P6AZsIbb7iF7Xg+v3A+nP8+H6N3ItNqIoFTCr
 fFcM/KVRTY0oYIWL2G0qc9bRNDdFVYwGbBVQva0vconViKNWw2N4dJkRgzXlAHNWy7M5
 Hfaaag7nn9dW9hgSSGR3OMQQMzyLY4D+/mQ6ke8F53hYZUoQ4JdkqX8iImaHPe760Mrh
 saJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FHudRtp7yzYdmsxvUUGKxH7K88Fn6l9DBuMQ5iU2qAI=;
 b=L5iIhCEyXEFiqTnJjPMQyfQaLu3zp512I5oBAFJCA01DGrb4/Nbo/mN8dJd4eLEFlE
 0hFLwg/srf7KlUo0LuPO+YkEcc69/wBWUSJQWVa/ztaqbKIBbuE+hJgN9IGBzorp2bYI
 SWHf2FfgO2P0ifOlmX72TT4dJTJU/YcusFB84bg7ZLTCNiAqyZw4uTW8PVa6pmNUGx3d
 A9Fzl53SWF978x3tSLIRTzjFpihJyCcKXg73a/wmxW31cYedpTjKQCJN1XYts02EzKG1
 v4C30/bxBauasPXJAFSqHzGis4LSGOcOzJDE2Au5ouQE4kvQfeMeDWfTtt1IlaC0gV/D
 EmSQ==
X-Gm-Message-State: AOAM531GaQOANo3w1vmeLbhQv1FElzJJdmAlZpkDBp84/oU2FOV/Tg46
 dmblNlkB2K7dNmAapm3z9vTjJF/768/kM8B+L3sq6A==
X-Google-Smtp-Source: ABdhPJyAnrUXnX8HS6B0CYvBbgrW7BhkwL2lF6G9o1ylXON0aM6cIo/qvmxrBM044uvfh8/xKjMwDMo7m8/xFU1nr98=
X-Received: by 2002:a92:7f10:: with SMTP id a16mr12479315ild.134.1603735710869; 
 Mon, 26 Oct 2020 11:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201017153857.2494845-1-fparent@baylibre.com>
 <20201017153857.2494845-2-fparent@baylibre.com> <20201026133006.GA29275@bogus>
In-Reply-To: <20201026133006.GA29275@bogus>
From: Fabien Parent <fparent@baylibre.com>
Date: Mon, 26 Oct 2020 19:08:20 +0100
Message-ID: <CAOwMV_z9QzAOO09ZUVyn61Fv4+pRUNA0H22tnP-PrXUOLRjXeg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clocksource: mediatek: add clk13m and bus clock
 support
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_140833_066012_2F56379A 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, tglx@linutronix.de,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Mon, Oct 26, 2020 at 2:30 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Oct 17, 2020 at 05:38:57PM +0200, Fabien Parent wrote:
> > Some MediaTek SoC like MT8516 need to enable additional clocks
> > for the GPT timer. Enable them if present.
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >  drivers/clocksource/timer-mediatek.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> > index 9318edcd8963..42e2d2090484 100644
> > --- a/drivers/clocksource/timer-mediatek.c
> > +++ b/drivers/clocksource/timer-mediatek.c
> > @@ -9,6 +9,7 @@
> >
> >  #define pr_fmt(fmt)  KBUILD_MODNAME ": " fmt
> >
> > +#include <linux/clk.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/clocksource.h>
> >  #include <linux/interrupt.h>
> > @@ -278,8 +279,19 @@ static int __init mtk_syst_init(struct device_node *node)
> >
> >  static int __init mtk_gpt_init(struct device_node *node)
> >  {
> > +     struct clk *clk_13m, *clk_bus;
> >       int ret;
> >
> > +     /* Optional clock*/
>
> Then use the optional api variant.

I looked for optional API variant but could only find these:
* struct clk *devm_clk_get_optional(struct device *dev, const char *id);
* struct clk *devm_clk_get_optional(struct device *dev, const char *id);

These two require a "struct device" parameter but in the function
mtk_gpt_init, we only have a "struct device_node" I didn't see any way
to get a "struct device" from a "struct device_node".

>
> > +     clk_13m = of_clk_get_by_name(node, "clk13m");
> > +     if (!IS_ERR(clk_13m))
>
> And then you can drop this check (or handle it for any error other than
> clock is not present).
>
> > +             clk_prepare_enable(clk_13m);
> > +
> > +     /* Optional clock*/
> > +     clk_bus = of_clk_get_by_name(node, "bus");
> > +     if (!IS_ERR(clk_bus))
> > +             clk_prepare_enable(clk_bus);
> > +
> >       to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> >       to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
> >       to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
> > --
> > 2.28.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
