Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9429EC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUYNFtz0mGQomMgw5XCo7PvlT82ouwpXZ1L41VjIQog=; b=Wqeb3ePLzQ/8kwwDyhhyQnQAfB
	N3Tp7YStgZB8xlUJPt8sHIhTHG7TlfQJGcAJGzAyrXx3dFK6G98aihhI+OdlC+sxFDOc6a9lamb5u
	qwohLdXNlMimRmJvH/58DWKS/u1JRPdESeM+fkyQJ5Xur48b6Z6tRGDwAIXZ8f0V0HGvaH474eUYZ
	rGk8mTJKgSJCI2SLCd3csU++mjPWyRcX43KSoSDz1QmIJWuzgTjNOJ2rEoCKGnGtXwKp+e4mGVMD/
	aT7Ho8cukKWHcgI0IZTCkr6Ry6D9tFdjmS4YP0hmnWCaTIfG8ccW0nHIPu4aYgaWY89HMbWJo5ie+
	Xtv0M7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Ty0-00AeGQ-2y;
	Tue, 23 May 2023 15:30:28 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Txy-00AeFd-0l
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 15:30:27 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-338816ea761so2541805ab.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684855824; x=1687447824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUYNFtz0mGQomMgw5XCo7PvlT82ouwpXZ1L41VjIQog=;
        b=hzZICuOMd6gKa8qyZmx1llAE4T/UKuGamJbHDrzmavsa0Y1Xr8FPOnNmb1a+Po/OzY
         T6M0nX6BB+mJnYCdOkBEUsisnbC8hjhBy6MB3IKeK5NRn/mbaQNPIY7RpZUHLTPmKeO+
         sEF3u1QFbq4GsQ4lPMFcX39UQ7vDIsL2gJpVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684855824; x=1687447824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUYNFtz0mGQomMgw5XCo7PvlT82ouwpXZ1L41VjIQog=;
        b=YofeIoTWYF6Opfyx4Q5BYoWrSqWcVaFpbPPF2e7WzUAH/O9HEFgLMzpvVC9IV8goky
         4XgxiWPdnLLrQhVWlWfnCl7YPDuBp/GACK5qdQhDgdnm4VX4Py27DC3KA5w3SvQObgAe
         VgjRfM8jd7li2s9Cc/SC2xSbBhRi6oKDpCiesieKEwgne28HwcTBIE+afwdnL4yAdWWz
         Svz/8894IDPNzZGmyLPhqzG+9sZe+9D0zbopLwCsX2UJwRW2qs3cK3hPG571Ksw2Gb8u
         c+COE1plU5iMmqlqi9tsvh9CsAmgOt1l8fdU/61z3iGJVGqi7178Hu8INg41oUAmmE7t
         R70w==
X-Gm-Message-State: AC+VfDyu7dD1IO11bqOqShMYGVqdNLzy8OEQ5/JsfBeNZWsbBKHM4jge
	0XOqvk6pFf6TvageFTlyzNQcdpEBjjchD3LpLgg=
X-Google-Smtp-Source: ACHHUZ45V7Bcm1mvXOdP3wGssyvWbPpEUkWgxzK2BH/0E48czE6aQPTizgx7JeA5WBjp8+XrTP3Sjg==
X-Received: by 2002:a92:603:0:b0:331:a22e:c759 with SMTP id x3-20020a920603000000b00331a22ec759mr9249152ilg.7.1684855823737;
        Tue, 23 May 2023 08:30:23 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id cn5-20020a0566383a0500b0040fb0b1b317sm2446332jab.5.2023.05.23.08.30.22
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 08:30:22 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-77487baabbbso12078539f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 08:30:22 -0700 (PDT)
X-Received: by 2002:a5e:dd4c:0:b0:76c:79f9:9b29 with SMTP id
 u12-20020a5edd4c000000b0076c79f99b29mr8611250iop.3.1684855821998; Tue, 23 May
 2023 08:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230427035656.1962698-1-fshao@chromium.org> <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
 <nycvar.YFH.7.76.2305231510270.29760@cbobk.fhfr.pm> <CAD=FV=UyEw5xViGreQb6+cLNLrMcT27ts5P87aR=FEYWNOBM_w@mail.gmail.com>
In-Reply-To: <CAD=FV=UyEw5xViGreQb6+cLNLrMcT27ts5P87aR=FEYWNOBM_w@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 23 May 2023 23:29:45 +0800
X-Gmail-Original-Message-ID: <CAC=S1nisSCtsz5spDG3s6Xj70ianY+vgiYy0PaS_jnN7KOe=4w@mail.gmail.com>
Message-ID: <CAC=S1nisSCtsz5spDG3s6Xj70ianY+vgiYy0PaS_jnN7KOe=4w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
To: Doug Anderson <dianders@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, Jeff LaBundy <jeff@labundy.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Stephen Kitt <steve@sk2.org>, devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_083026_302316_B1CF6C94 
X-CRM114-Status: GOOD (  33.75  )
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

On Tue, May 23, 2023 at 9:32=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, May 23, 2023 at 6:11=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wr=
ote:
> >
> > On Fri, 19 May 2023, Doug Anderson wrote:
> >
> > > > These changes are based on the series in [1], which modified the
> > > > i2c-hid-of-goodix driver and removed the workaround for a power lea=
kage
> > > > issue, so the issue revisits on Mediatek MT8186 boards (Steelix).
> > > >
> > > > The root cause is that the touchscreen can be powered in different =
ways
> > > > depending on the hardware designs, and it's not as easy to come up =
with
> > > > a solution that is both simple and elegant for all the known design=
s.
> > > >
> > > > To address the issue, I ended up adding a new boolean property for =
the
> > > > driver so that we can control the power up/down sequence depending =
on
> > > > that.
> > > >
> > > > Adding a new property might not be the cleanest approach for this, =
but
> > > > at least the intention would be easy enough to understand, and it
> > > > introduces relatively small change to the code and fully preserves =
the
> > > > original control flow.
> > > > I hope this is something acceptable, and I'm open to any better
> > > > approaches.
> > > >
> > > > [1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@ch=
romium.org/
> > > >
> > > > Changes in v4:
> > > > - Minor coding style improvement
> > > >
> > > > Changes in v3:
> > > > - In power-down, only skip the GPIO but not the regulator calls if =
the
> > > >   flag is set
> > > >
> > > > Changes in v2:
> > > > - Use a more accurate property name and with "goodix," prefix.
> > > > - Do not change the regulator_enable logic during power-up.
> > > >
> > > > Fei Shao (2):
> > > >   dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
> > > >     property
> > > >   HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-sus=
pend"
> > > >     property
> > > >
> > > >  .../bindings/input/goodix,gt7375p.yaml           |  9 +++++++++
> > > >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c          | 16 ++++++++++++=
+++-
> > > >  2 files changed, 24 insertions(+), 1 deletion(-)
> > >
> > > Just double-checking if there is any work needed on this series. I
> > > think it's ready to land but I wanted to double-check.
> >
> > I don't think I've been CCed on the dt-binding part (patch 1/2 I guess)=
.
> > Has it been Acked? If so, I will happily take it through hid.git, but
> > please send it my way.
>
> Yeah, Rob Acked it:
>
> https://lore.kernel.org/r/168261692866.3205353.5077242811275926416.robh@k=
ernel.org/
>
> Fei: can you repost the series with collected tags and make sure to CC Ji=
ri?

Sure, I'll do that tomorrow  :)

Regards,
Fei

>
> Thanks!
>
> -Doug

