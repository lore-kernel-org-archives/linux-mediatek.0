Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F708C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:40:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2680206BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EaO944/a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kHiITqAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2680206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XdZGEr4hP/ZDj27jSt/3xOrM8LUyeys2n0fE4HLjtEM=; b=EaO944/aSHOHd/tq/mY5fOuRT
	ugwdGhva1QaVgU4/bL68SYNX8cK48gUhh6N0AcG9iHGFv2OX+5AW2Va1nz6v90SWxECa6SnN1eMMa
	pdgx/ACU3SdxEV/MZRqfrvOqbnB4jf/A/lagafjlDPJ4zcDukZ2WmQNztXqw/ZgpNYyvMb0GS9RkW
	IQZ+fG5qCwiHzMfR0EXTi8ZbNP5gEE5pwqcCai6fnTtKCThrFGJarHBr+sYkzMKJS0ufpFvVIMeRk
	7ZoX1oSmVXQ5B4bjpyQ52cW9sBEInzXTb6bSmMT1tm9CR+REEEJQVN/C/mOeeh8soSFf9vTGcIGD7
	c6bXsauIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqHQz-0005G7-QY; Tue, 30 Jun 2020 14:40:29 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqHQw-0005Fa-PH
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 14:40:27 +0000
Received: by mail-ej1-x644.google.com with SMTP id rk21so20923492ejb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dm/rjfkAYeOKvGlUu0DpeagoQTdzbRa2RO8YsK1yDA=;
 b=kHiITqAEixH3gwtr3H907V2DiU+kxfWWD2Qw8bDRxPeYz3lrIuItsoM9Pv99DTsoWC
 UhqasAV1O8djAZGDZ+JytGCbb0A+zV9G/V20uuQDQ4QvgsDLx2aviX735++seHJYVbqa
 DPKky1AG/J1s7hSlUY6Y/XOMx5rtU0odTX47Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dm/rjfkAYeOKvGlUu0DpeagoQTdzbRa2RO8YsK1yDA=;
 b=GE8MURhlx5aYOt4eViaIZrFHSL0gwXeLuxvI2eZzaE1C/REEZZ44p6uu3y2KgrpnN6
 sp2KmeeFtR4JN9ubmdd93YIOLFZaR2IK+N0RNm6AAZTcBwTAR84/5bVODbDen7HRQDqI
 AIrFUuF5CQdb8tZSzlqSUKYWUE9esfuFdAJ3eDlIjGGCyZGRK9OPwwNgI+ltKcTwneqG
 fPEWs11baDV4PCkEqzyuECaEyg8tJwCffhrjbxUg/al+fxu/wG1kysRfL5BtEITONKIV
 PEVZJgtr/LvOboB91HqrQ+Dq5vMoJ3HlspuxC7lDnpT9/IdTIIyHfdPYhbOfZWFoAHqE
 Ofww==
X-Gm-Message-State: AOAM532W6+onvRiMjd5N1ftMSLfdfKMTc8lA7JMKtlX6lukAMEOD7nQL
 lQ1804HxZlByDxYkIuXKKQCJGcebXHEo8Q==
X-Google-Smtp-Source: ABdhPJxRgaIy5NuIcfoEEa22FdszTU4m+gZiEnERhtwjDtlK5CY2+rx+KlcYww6MNU18kYD2BzaJBQ==
X-Received: by 2002:a17:906:6d56:: with SMTP id
 a22mr19266092ejt.440.1593528024893; 
 Tue, 30 Jun 2020 07:40:24 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id t2sm2913232eds.60.2020.06.30.07.40.23
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 07:40:24 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id k6so20477636wrn.3
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 07:40:23 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr21491180wrl.17.1593528023050; 
 Tue, 30 Jun 2020 07:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630095430.GF16711@paasikivi.fi.intel.com>
 <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
 <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
 <20200630143705.GW3703480@smile.fi.intel.com>
In-Reply-To: <20200630143705.GW3703480@smile.fi.intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 30 Jun 2020 16:40:12 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
Message-ID: <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 4:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 30, 2020 at 04:21:31PM +0200, Tomasz Figa wrote:
> > On Tue, Jun 30, 2020 at 4:19 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
>
> ...
>
> > > > > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > >
> > > >
> > > > Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> > > > the sensor off the first time. Alternatively make reset signal high in
> > > > runtime suspend callback.
> > >
> > > We might want to keep the signals low when the regulators are powered
> > > down, to reduce the leakage.
> >
> > Ah, I actually recall that the reset pin was physically active low, so
> > we would indeed better keep it at HIGH. Sorry for the noise.
>
> Here HIGH means "asserted", so in the code above it's LOW, means "deasserted",
> i.o.w. non-reset state. I dunno what is better, it depends to the firmware /
> driver expectations of the device configuration (from the power point of view,
> HIGH makes sense here, and not LOW, i.o.w. asserted reset line).
>
> And nice of the logical state that it doesn't depend to the active low / high
> (the latter just transparent to the user).

Yeah, after reading through the GPIO subsystem documentation and
discussing with a bunch of people on how to interpret it, we concluded
that the driver needs to deal only with the logical state of the
signal.

Actually, I later realized that the problem of leakage should likely
be solved by pinctrl suspend settings, based on given hardware
conditions, rather than the driver explicitly.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
