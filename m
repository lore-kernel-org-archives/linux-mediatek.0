Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98623C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:31:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 660A820709
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/jm8Soo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 660A820709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lCGjVwfUHY/kElmjJ4x2kRJK7kPGLPYs43MsYq1RqBY=; b=K/jm8Soo12p9ikQPQY9ikDALc
	ns/bGXVPZxHkWQ/VUKjk92y8FY7UuKwUxvQmAbyUM2x56kj3tF4Bo4yo74a65SICpkxMPedY4Cdt4
	vOByDaaHwHVezbvU/eGU2QokuSkyW1S6/pAsTPfLcI489y1b7Avd1hSsPOGV8FmPmlomjw4Mz2xKm
	Jc/M3FmHGXd+RXA2MnE6g94xmM73DlWSg8mXH6cwC3Oh7wxNv8cJip2N3Op2lsynZu2EWn51Yza+d
	YgRoe/8BsBho8J1T2XLk4xDuRRdBobaaqB669vUlKsYuYNGy/qu42/gUpqwKzSVo2yqVobdrwYZG3
	6ZygEgQAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXZW-0007hj-SA; Thu, 23 Jul 2020 09:31:26 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXZU-0007h9-Sq; Thu, 23 Jul 2020 09:31:25 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MfqGN-1kQyZN3kvh-00gGaz; Thu, 23 Jul 2020 11:31:21 +0200
Received: by mail-qk1-f170.google.com with SMTP id j187so4668536qke.11;
 Thu, 23 Jul 2020 02:31:19 -0700 (PDT)
X-Gm-Message-State: AOAM531YNdNKGzNgp8w4ZdBYrD72drLjSLaYHFxThFGScbihSXLmWhPJ
 FUOS3Ky5dufP/VZDjQFs1nCoPNKPsSVyRN4d/uA=
X-Google-Smtp-Source: ABdhPJxJKdRsJa6yWByxQwxyQoyASSDoGeaJ3XhjqBQJAJYOQ5ZDK2hqTVqfgEw11DfZTk4S2OABG3feavWNTF9x3Gw=
X-Received: by 2002:a37:b484:: with SMTP id d126mr4153205qkf.394.1595496678583; 
 Thu, 23 Jul 2020 02:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jul 2020 11:31:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
Message-ID: <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/23] memory: Cleanup, improve and compile test
 memory drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:TcN3Ep8LX0t5xaua5guf7sQfo1/yKunFXo5W/CYNVyuAqDIJMc4
 mWPhKi0nhxhNIeiVchuYRa+a3qE1X/OsZnAXJq26qQNYIBtEkpBMkXvNV55395bRioT2/bS
 NW11zj7ubx4Oo5XfEOwN81kUGyM7on1liXmHQcQ5U3mr8ikwydXFsmksptngVMt2yAF0HI9
 NZXevtqK0LnHv59r7GXqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DTom1rExnmc=:Y4kC0gn3Ur/LCKkE/LFrBa
 enedzovCUhG6qbHZYICQQwtt+clcnQQ/i2rDSjuQlIxhsukMMjKxbbDvbTMRUCimMozlylu+C
 V/K55v72KEhuNpBLUHkduxV72uGHRkII/mYMMf/RmQNHPQnaUE0rfTTdcB1nZ6c+LO9p/G/ho
 oyAX1WBGIHPUOJFfGFuqBXFcvlB4aTreHHIIkqT+URAPcRjR9cEgrFnWATWjxvF1Y1LA4Jtkz
 TZlujthEMG4LNyXep4x3IIKaRWNfP58Ri1Kg8aHZurP2j41uEprsPxtyyPGHYia3kGaG+F4Ed
 wusRFlgdK4jRutmpAy4RVk1r7okd6Muk2FDL4cfGrzeMtB9nH17EMOW2CkFN9l9C7N4gUAKAE
 Z5QAl0wXRTNnsG7k4SZ7z7H+JP0MZ1PmNSF4wcnkgxJasKWCVNwVE/XOTqLgO5jst0uDLY5I1
 AJRO6TSmtcLw/lO+2zRBBUtJPjGwU2gamYcZIx54ZQQW/71HTV/5w8f+Hgm0FQDSRS3f4sdk+
 cacs1yzaV6OSqZ+ifkj5JowMsLumS/w7QdTrQQcMDb1esLCAoZPgt6Fo+ONRq9r88ZNvMzY/C
 An5KINcpQHKKvu3RAF6HnB75o5gIxGkIPpVeE8j4OijuZJLuUpjMq1H+uqCW40ZPI+4gdbDyI
 cvBEsWW9U80dybN1LST2JVRjey8R0/rf0iCkVvn6FQs+wVp0MKHbXX7QOPfg51R1RE0hfo/3t
 IzsV+J3qfvskijYlh5txkBMnCJ964h8rvcLsuHGdMAIXG9AnFLr9dIdhqQ4Hz4Lyp5nAIsUC8
 oBPdF/oDoJF9hzRetiASng1tFPfkcoBqCHsjP0MFpO6fT9MXQKw5BKwsrJ7VOlmFvawXwD+nm
 wiveaxK8C2CFuTzxO2DWVGN4z38sn5s7pSDl5xYlqL+gnrs1vnGVL1YEhQ1FYKpyIpIbrsjkQ
 3YJ9L6TNUUpywF288uoChVRtnJKWbLTEGJj1ZVpSlb4Ey/AXCx24O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_053125_155500_B6AE4995 
X-CRM114-Status: GOOD (  20.33  )
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
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 9:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Dear All,
>
> The drivers/memory directory contains generic code (of_memory.c) and a
> bunch of drivers.  Changes to generic code were coming usually through
> different trees with the driver code.
>
> Over last days, memory drivers grew in numbers but not necessarily in
> quality.  They lacked compile testing and code cleanup.  Also lacked
> maintainer.
>
> I would be happy to take care about this part.
>
> If there are no objections, the patches could go either to Linus or to
> arm-soc (most of drivers are ARM specific).
>
> Driver-specific changes in the patchset were only compile-tested. Tests
> are welcome. The generic code was tested on ARMv7 Exynos based boards
> with a exynos5422-dmc memory controller driver.

Overall this looks great, I had a look through the patches and commented
on the few things that seemed slightly odd though harmless.

Thanks for picking up the subsystem. How do you want to proceed
in the long run? I suppose you can send a pull request to soc@kernel.org
to be picked up for the coming merge window as the normal way, since
you are not yet listed as the maintained until the end of the series.

Afterwards you could either send the pull requests to Linus directly,
or send them to the soc team (or to Greg) as well, the way we handle
a couple of other subsystems like drivers/reset and drivers/tee that
usually only have a handful of patches per release.

     Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
