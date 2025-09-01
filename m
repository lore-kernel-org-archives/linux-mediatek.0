Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8276CA0FFD
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Sep 2025 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tFy+S32zcH8SOQI+WY2rqVzMFSU7CQi//EUuweLF5I=; b=eOQdSF++PCYCVi37SvZazu74Ff
	/Eh3elfn9Xfqd3efPhsBkmK+aMSPCy5GvCg2oHyHl88xMjOhBcjTAahnXK6oiJfP0jx3xOD3oHAiv
	Q7zYK4yyn8ZlqgF/7WGzCPRzJbsEw34QiKcUUHOR0DkAHAuFnmE+fdGbYVV7zuGsjKV9hZ8yY5zPz
	UDaItiH/AUZ/jSsOSEN0DtNuCTJcitdWYMQvKtCHofWKk7tnGALCXqHTOONjFgT16Gd25SOZ5q/cM
	v30+X9nQfBj5GyXy5uEAgYN3JWIeWd1D4fSilT0JbdqW1CXjU8NxDVAnkyUYZkMBlUVlGHUSb6VE/
	lwNJZ1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut27x-0000000BxRs-1JVr;
	Mon, 01 Sep 2025 10:51:09 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1HJ-0000000Boyd-2kRE;
	Mon, 01 Sep 2025 09:56:46 +0000
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e86faa158fso433559885a.1;
        Mon, 01 Sep 2025 02:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720604; x=1757325404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tFy+S32zcH8SOQI+WY2rqVzMFSU7CQi//EUuweLF5I=;
        b=QeGSYqQAxb0KpwTx9Mt+sPGlA62aZmVnnL95+3aTSlFtUAhn9dRIbv5cIU5tDDLojo
         hCLEHa2Ywu6M6EP7lLpt50lTlzOxYHge9KS+k0IZ/6G9GuYnjsyqvjRiuRP2VVQdrXl5
         N/fE5sFGbMIUS+IxdRx7siZs7T7ugCdkHXopoZgm2aCT/NS5fUMUL9O55nNMKLrz5855
         SLSAKP9gii2nqtp8iMG3Sgl/2HOZTo0Bk7yFF2J0X+8ie0Ce9rz1XSEcgvG5uRdvjdf1
         t1OV4ovIKSq0MeovUOtEiY4LJ1OZDEvkKYR2WHS75oNpGw6+rnIxShSUIes9O7pK2D9L
         mWjg==
X-Forwarded-Encrypted: i=1; AJvYcCUGN823dmWPVJ1ScMjYrIAsJUiHSEt6WRYDgxIta0ep9w3B3Gx5RU26AK7x4euruhVfiYJp1TOZn661YZNTGsw=@lists.infradead.org, AJvYcCUIDNZrFqOLRCXImzyZySU7E2znyZoMTY+H1ehWmfupaORxRj6ym1M2wy7LrXkn5bd+sFyaFu5glWQlFn8=@lists.infradead.org, AJvYcCUz6jbe7+vN/P60+4vfSPEdgphqOY4t86U0ry8r8pesq9yBpff3PC8RCm1w/GXYBMWGI+NExLbkvqmo8X3ubtY=@lists.infradead.org, AJvYcCWGZfDOZikjI0M2Uijih68BvJSjVJMCq+yo1lf8yimYJA4kWJjhWGM2IcSNCw1u8KospDanKqaz9TUCA1vNT01fXQ==@lists.infradead.org, AJvYcCXLWHPFi1adwm5oVr5EzqXfLioC76p4ByN/217j8Z+2CAFCOMHlcsuZIJq2HXDVAZDkoF+gweovp4epW20x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0PEZ8CB4k++o8cMP7x2oC76sMHajGWnZ/aS2J3o6SEUXDSdpO
	VEVYRpaAS0APB/HTOi7y1nLlC950AU9RDIcf8OTz0WA58B4rZuEgLlH0D1bu0GQV
X-Gm-Gg: ASbGncs8J1r/7n8NH1lcDaUv3V5xNyMTE8fb2yvZ1+FVnvrljnFSWg9XbjURUymdFwo
	E5lMjgRyaWC/AGNhDuF1ehz/GkhL0t2P5UK82Jg052bM3oP+hEcZpfSNPqt/OL9ru/ZL52V1H0+
	cO33N69jAQKFd4PQTIBgEIE+gKGrECEzLaadIDTyCJUbXGr9drqB59qTvA0l9RcRPe3rHxy5anu
	3SjL5TMgqgdPIcQKGGrDvCADEyfXG/OrlrAHAttTZ+lt3I/mq+dPIqClGUe1+SYPnullMd5ie62
	9kPszWv3lKLJVfjo3kbZ9FwaioatmRar/AR1E7Lr7wtyghtEKq3zNjKhUwqbugqu+NTcM0HLMu9
	O/Dj72sDxnjrGs7WOt81l9GIigB8U4oKfi2fVFcUqEa0oYHdcwSAuEofEH1TN2nlnoP5zDRGCZ/
	Q=
X-Google-Smtp-Source: AGHT+IEsmNnDrB6ocUqGiuiQCEhS4q2C+hHIrA0gIuSC1hiJw0xLsZUP11DGSe+mt2G/BQArvfTCpg==
X-Received: by 2002:a05:620a:390e:b0:7fc:f87e:8cd3 with SMTP id af79cd13be357-7ff2b9816famr678153185a.32.1756720604126;
        Mon, 01 Sep 2025 02:56:44 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14660af1sm626381385a.39.2025.09.01.02.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:56:43 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b32c1fdcb4so13798951cf.1;
        Mon, 01 Sep 2025 02:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKRiCYCcjesex82HLtmDcS/yijG8faPrxynj/xJ5HnZaZg7XFcdnJm4nnoYXsepzVfbRRkf8nqTUsYuc4=@lists.infradead.org, AJvYcCVVqhQ03WfuMFhCqJ5+AFv8pvP+vn20JX19bxUwKjWrgJLWQJpF/HTHED5NKyniHgk7Ge6KFVwXagnn6PKAwEsEmw==@lists.infradead.org, AJvYcCVgAdDXxmnaNY/IaDqgirrQuDJSIEAuuW2wZTTjsqM0Mc90PXbSvtqut3AytFUiWa4rF1Isoo65IQawF7Dp@lists.infradead.org, AJvYcCWA1Ij7oAo84uzRn+8EryjwlgeMXqsN6UfOGmiSbdSQjIyz5d3u1Yv4x4Rsl+i1+cE9tODWJRVztpuS7K1qQmI=@lists.infradead.org, AJvYcCWff84Lb6LM27WtjKiUKRIfGf9cE8JG0SAlFoTzuxaDt/l9zLoQnuixl7NxLTgtaralXNfZ88sjsSPFMnNXXaA=@lists.infradead.org
X-Received: by 2002:a05:6102:5e8e:b0:50d:feb0:316e with SMTP id
 ada2fe7eead31-52aeb7798e1mr2104974137.2.1756720196368; Mon, 01 Sep 2025
 02:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <1907e1c7-2b15-4729-8497-a7e6f0526366@kernel.org> <aKhVVJPEPxCoKKjI@x1>
 <4d31df9e-62c9-4988-9301-2911ff7de229@kernel.org> <aKhr8NYhei59At0s@x1> <7c6cc42c-fc76-4300-b0d2-8dabf54cf337@kernel.org>
In-Reply-To: <7c6cc42c-fc76-4300-b0d2-8dabf54cf337@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 11:49:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUB4QGBaMk5r5eNRCPriUWAY+LBE2C7kVEkE9eCNE1TUA@mail.gmail.com>
X-Gm-Features: Ac12FXwQn8nZWuX__OUteos14KQ8Ceq7TOY9AfEwCR3rwgzCn6YxJiejdZ6ywp8
Message-ID: <CAMuHMdUB4QGBaMk5r5eNRCPriUWAY+LBE2C7kVEkE9eCNE1TUA@mail.gmail.com>
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated round_rate()
 to determine_rate()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_025645_701123_562C4D75 
X-CRM114-Status: GOOD (  37.79  )
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

On Sat, 23 Aug 2025 at 18:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 22/08/2025 15:09, Brian Masney wrote:
> > On Fri, Aug 22, 2025 at 02:23:50PM +0200, Krzysztof Kozlowski wrote:
> >> On 22/08/2025 13:32, Brian Masney wrote:
> >>> 7 of the 114 patches in this series needs a v2 with a minor fix. I see
> >>> several paths forward to merging this. It's ultimately up to Stephen how
> >>> he wants to proceed.
> >>>
> >>> - I send Stephen a PULL request with all of these patches with the minor
> >>>   cleanups to the 7 patches. Depending on the timing, Stephen can merge
> >>>   the other work first, and I deal with cleaning up the merge conflicts.
> >>>   Or he can if he prefers to instead.
> >>>
> >>> - Stephen applies everyone else's work first to his tree, and then the
> >>>   good 107 patches in this series. He skips anything that doesn't apply
> >>>   due to other people's work and I follow up with a smaller series.
> >>
> >> Both cause cross tree merge conflicts. Anyway, please document clearly
> >> the dependencies between patches.
> >
> > This series only touches drivers/clk, so it shouldn't cause any issues
> > with other subsystems, unless there's a topic branch somewhere, or I'm
> > missing something?
>
> Individual maintainers handle subdirectories.

FWI(still)W, I have taken the Renesas SoC-specific patches through
the renesas-clk tree...

> > There are some drivers under drivers/clk/ where there is an entry in the
> > MAINTAINERS file that's not Stephen, although it wasn't clear to me if
> > all of those people will send PULL requests to Stephen. I described on
> > the cover how how the series was broken up.
> >
> >   - Patches 4-70 are for drivers where there is no clk submaintainer
> >   - Patches 71-110 are for drivers where this is an entry in MAINTAINERS
> >     (for drivers/clk)
>
> It's hidden between multiple other descriptions of patches, so I really
> would not think that this means that it is okay by individual maintainer
> to take the patch.
>
> This really should be the one most important part of the cover letter
> for something like this.
> ..

It was indeed rather implicit:

   "Once all of my conversion patches across the various trees in the kernel
    have been merged, I will post a small series that removes the
    round_rate() op from the clk core and the documentation. Here's the
    other patch series that are currently in flight that need to be merged
    before we can remove round_rate() from the core. [...]"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

