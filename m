Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B8EC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:11:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CB56101E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99CB56101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tSc41Tk/uz0Vndr0hVkGFUq7V18s4zyoG6Nqgbw1Y0s=; b=QUhnpC9yAg6dTRbKRo4qj1NqP
	waZpyBz6mWpc6rn0KTJEl4Ni6F6jfFM9zq3X8DcaOCV005W6GiXhpBOX6CF8XlOVuJz0CdkXNdOUW
	P+D34IOk/wp2WRR+IxLBdEwgpuhzBVFFIL2kMvXdNjoA7a5/qjVs4G44tVYsryNZpbvPiopjukIWV
	qzlmBwM3ORF6unybbe2R58MgNIrnCDncbwWiRsE2XNSb0CtFWpbMpOezF8ooUXUhE2f9pP3zxr/+2
	K6Qvux8gnwpTAKzaMJKXXsEkVqAk5WNOu6sKdh3EBpCZ/rPWJPwIjiqSiUxvczMXuv1ZA2CQWj1lg
	WDhCq7Pfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYmPm-00BgDb-6C; Tue, 20 Apr 2021 09:11:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmPY-00Bg9O-Ux; Tue, 20 Apr 2021 09:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=c2AVdai4BL/owZZ4etPrGHyWpLyjk0ZB86A88EL3k+c=; b=WAOSuEyu+/fWFqx8YboM0hbRFc
 8PgK2xXIV2rgIJu1ot7BqrWZYOWFRsboQhUQSCfuBcJQOOBO8aryFjwl4wiq/EmzCRYTDuboYvzje
 ltDAWew8P95LdrEKl2UtLHyBHvK0wqVoYqqUpLhAsir4RjLw7Mjrj4gTa1CCwvMIdZCmMaXdH0StX
 7H9ZAriwtdxyCUWrGLCeBkLWfj2M2/7w34OxAc85wKNrZ0CcU6EbrgJgitVfmmNAmWRBTmKOhrycb
 lYE6uJr/JuDioUkQP/ufItef44GDNJp44K99vxd8aB/6z9UiGAR6TPQNTvngvP69FZRdKj5am1urs
 j7LY8cxQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmPW-00BxY3-BK; Tue, 20 Apr 2021 09:11:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E32E613B4;
 Tue, 20 Apr 2021 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618909869;
 bh=DeGQ9vUDRCVhA8t5Ph+0N53DtPOXi7alQM8lRrwQwKo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p0qaMXJByFvnmnNzygjG+wVqrEysTLgHvDiIGpK52K9aQUKK6M3BGjSLyePqEb3Qf
 oR3oMBtOgJOCh7RcSvkCcBVicfY9CiiXQqSuj3vuq6dpjOGhCmYNVuVfPR+/WjSa8y
 OjKCkD+Jeiy0rF7z8u1J4LpfnlrCGE/G9N0ySag4aO+wDqsFogGqXT9eHwLSIlfmwd
 swm8rATrWZ8IwfA14qwCGkgWO/i7lHh6bqTFbABgi05Ale1G4PAajc6jL8bk5XXXNG
 JygWwRlWhDmLm13ceBOy+pmk9GoTtnNMy2CUIErVU0FqckDVw6S1F+GjMgloAzJarS
 aElCDGbhH7RTw==
Received: by mail-ej1-f44.google.com with SMTP id r20so7387506ejo.11;
 Tue, 20 Apr 2021 02:11:09 -0700 (PDT)
X-Gm-Message-State: AOAM531yMrBQ8qcA1MLIGkYl6fTm9cnPDfAQWMTgxcrhpcxTQS9aCq1W
 1QPSY6Me0dY19xmW/vEsQJyu70xlCI9qmrzrgcU=
X-Google-Smtp-Source: ABdhPJyHjUN6C0/sUkUlP+4nedtBBPWCDMG4VnGKqPhVa1uJB5nLQGViYOHp7TNdMb76BpIs8GkQPbFl+yNnVewK4NU=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr20219548wrz.105.1618909856639; 
 Tue, 20 Apr 2021 02:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com>
 <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
 <YH4VdPNO9cdzc5MD@atmark-techno.com>
In-Reply-To: <YH4VdPNO9cdzc5MD@atmark-techno.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 20 Apr 2021 11:10:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1tPQm1Qj2KZu2jOM=TUP0dJgP4G9eKkWfv-PZEAWEhyA@mail.gmail.com>
Message-ID: <CAK8P3a1tPQm1Qj2KZu2jOM=TUP0dJgP4G9eKkWfv-PZEAWEhyA@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, 
 gregkh <gregkh@linuxfoundation.org>, Rafael Wysocki <rafael@kernel.org>, 
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, aymen.sghaier@nxp.com, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, 
 Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, peter.ujfalusi@gmail.com, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 tomba@kernel.org, jyri.sarha@iki.fi, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Kishon <kishon@ti.com>, 
 Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Roy Pledge <Roy.Pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Felipe Balbi <balbi@kernel.org>, 
 Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Networking <netdev@vger.kernel.org>, linux-phy@lists.infradead.org, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-staging@lists.linux.dev, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_021110_467821_949D268B 
X-CRM114-Status: GOOD (  27.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 20, 2021 at 1:44 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Arnd Bergmann wrote on Mon, Apr 19, 2021 at 02:16:36PM +0200:
> > For built-in drivers, load order depends on the initcall level and
> > link order (how things are lined listed in the Makefile hierarchy).
> >
> > For loadable modules, this is up to user space in the end.
> >
> > Which of the drivers in this scenario are loadable modules?
>
> All the drivers involved in my case are built-in (nvmem, soc and final
> soc_device_match consumer e.g. caam_jr that crashes the kernel if soc is
> not identified properly).

Ok, in that case you may have a chance to just adapt the initcall
levels. This is somewhat fragile if someone else already relies
on a particular order, but it's an easy one-line change to change
a driver e.g. from module_init() or device_initcall() to arch_initcall().

> I frankly don't like the idea of moving nvmem/ above soc/ in
> drivers/Makefile as a "solution" to this (especially as there is one
> that seems to care about what soc they run on...), so I'll have a look
> at links first, hopefully that will work out.

Right, that would be way more fragile.

I think the main problem in this case is the caam driver that really
should not look into the particular SoC type or even machine
compatible string. This is something we can do as a last resort
for compatibility with busted devicetree files, but it appears that
this driver does it as the primary method for identifying different
hardware revisions. I would suggest fixing the binding so that
each SoC that includes one of these devices has a soc specific
compatible string associated with the device that the driver can
use as the primary way of identifying the device.

We probably need to keep the old logic around for old dtb files,
but there can at least be a comment next to that table that
discourages people from adding more entries there.

      Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
