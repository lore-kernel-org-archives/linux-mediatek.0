Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4AFC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWN78EB24MX6Q0HZqErBr8t9tcr4nbKt3etlWVHkE68=; b=L1iVNYSO5+FdIyOerSUtOl5l5I
	ex4oU+9JmyCcYuccnlrYVRakcwTbb9+d6Pkh8G43+zoCcQmjsF0BmTUzsx647osctjdDV+3WIylJ6
	tT+nlqPYaY9z+S6/ytDWKM1U88JatjygzyS44K4Yrtop5W1osIr+9C63IzH9Jh9rhOC255d3aqVgh
	zkU2+xVbSpv88Z8ppbriuRf6VOTjt5enxgdu7dmofPU0urrt69JipdlDoqnvZgmvwkYOEWJ1Ju1Z7
	djIO+XU+QBnjIaYrff7QpOOlLywWG0Za0cKAePoPMXTqpsQlF5gQoXdHt4rBKCMKo2P3tS8iZBJwJ
	sSYMf+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbz6-00000006nYM-1ARC;
	Thu, 30 May 2024 09:22:08 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbyt-00000006nU6-0aaj;
	Thu, 30 May 2024 09:21:59 +0000
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ad7a2f8715so6173346d6.1;
        Thu, 30 May 2024 02:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717060910; x=1717665710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWN78EB24MX6Q0HZqErBr8t9tcr4nbKt3etlWVHkE68=;
        b=H6IRWEuZgjr4Mnw0/rf+ILgJamZXuvifH36yXtysGkfdH+oYRJkKZ1Hd18E/TrV4AE
         ll3X5evCCFLe6CljeSLLsSgPIi6YJ3MlUX0xH+Skf4aMHYuw54EvmXpOHF6HnENGkCCT
         /gbkaB6AI/9qNsGzcbm6WCr0YhKZxoA8/+puE/9QLs8cJy1R2CTqh96z1AYq3o/VECuw
         LD/GmH2bO0FHv4QElRZ4GieqHqxKvatL4xdsVRi8tnNZsn1COZ9lRF8VhSoLWPHEKTwI
         9+vM9g0Fsh6HihZiDbCksYBXz2xj/N74NiN9d58mlxWItzOdyvRJap35s0AkYlvxRFAC
         pxvw==
X-Forwarded-Encrypted: i=1; AJvYcCVM1N05ibS0Rdqb31RyvgypN50t1bqvr9AcNEcs+bgVIZxpjVxnr8udNkJBQob/9hYwgk8aQHDFEOBmaw3nCovnXjzPUIyd6xz7txMufioas0Vv4JUgCZZUBQ906ovZaw5lU2Voj5FPqLDvXK9Gb5LUKe5nB2s9FCFWJuo85yM9w09MESx7GJTYXhU9fgyDV5uyrhpWdPBVTW2wUBtzkFdUj1jA8exSrt0B1Kqw90i/MeSejpaDh4dD5/Y/fms=
X-Gm-Message-State: AOJu0YwqkaSj9gxeEAKfcpxZJY6DDZ4pzEr70OHeqStmmygA0czVgkxe
	zQZZyStk2n/sXlaUF6pLqpbnG30r6Dzis7T3947moUBm81qORcNx7j2AgpZ7
X-Google-Smtp-Source: AGHT+IH/USYzmkxRCQHaW2776bKsoNvXA99L8ys9FUU/EztaPiSrBpYjs7WLOMmolLExxgDv3nMMkA==
X-Received: by 2002:a05:6214:3102:b0:6ad:7087:ef8a with SMTP id 6a1803df08f44-6ae0e76ff37mr24081896d6.9.1717060910165;
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae0c519abesm6040806d6.29.2024.05.30.02.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-792bdf626beso58528485a.1;
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAm7vKovo7bMsLPPOY9VqoSn3RwURJOKsCyzH20qt3I5xSsqL+5BH+8z+2regGreq9Q3RTSP2ociXLfSWPdG2g2NgNS00NxS6AWkDDTOkiJVANGrZn7qmw2NZ5ghkcIJmxhAQ42+kO66T8IiklYbHHgYK9WkankgemN8YRH2G7vWhU7bcYNzpyOJtag7Dne7OFocQf+XaIQbN4gNGENCRlE7OBvkIUW+5NmQ0C/ItHlMAzOI/q9l4LyA7xnTo=
X-Received: by 2002:a25:8c84:0:b0:dd1:6cad:8fd3 with SMTP id
 3f1490d57ef6-dfa5dcdc800mr946343276.27.1717060889311; Thu, 30 May 2024
 02:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
In-Reply-To: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 11:21:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_022155_233416_51EFFB8B 
X-CRM114-Status: GOOD (  22.04  )
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

Hi Andy,

On Thu, May 30, 2024 at 11:03=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> Mon, May 13, 2024 at 01:59:03PM +0200, Geert Uytterhoeven kirjoitti:
> > On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> > You missed one trivial conversion, presumably because no error handling
> > and thus no of_node_put() is involved?
>
> Nothing is missed. The below is a redundant change.
>
> ...
>
> > -       for_each_child_of_node(np, child) {
> > +       for_each_child_of_node_scoped(np, child) {
> >                 if (of_property_count_u32_elems(child, RZN1_PINS_PROP) =
> 0)
> >                         count++;
> >         }
> >
> > If you prefer not to include this
>
> I prefer this not to be included as it will give a misleading signals to =
the
> use of the original API(s).

Thank you for reminding me to send this out as a separate patch :-)

https://lore.kernel.org/r/c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.17170607=
08.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

