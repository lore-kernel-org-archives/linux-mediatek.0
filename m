Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC299C04FFE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 May 2024 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAZGt+1Rc/qtuBUqNnzX2rBGCR5XoalBEqWaRtcOihM=; b=OA5gAM5ao9oEeEGKUMRxEMjkoF
	YH9VcGev8jJMLdHpqsDQ9y1Y+8B8VyTv5qu26gayxANLWEplFEwuusNRFMXEkzBbWuXyAm0af5BpC
	oY0PnxDNuZXyXTRvi+1BkpGy3tEGtqpIB06G9HHq60r9dQWNk+7Xrb6u8GKy3YRtIsQM1jaiY626w
	e8rO80Dh530GfKPhGpenBA4l3TcXLBV/hqEioJIBlm5AsLGb+lISZyAVohINRQH7obiN7lmn3Mm5n
	rs3Ujl5aislgEjFfwR7JPX6yEW9NfHLnwNNvGWrG7yrEFN6gMxpwOhqLDRMVzWs+Et/NsfYqQy+Hw
	GUsPWWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6nC1-0000000FJJH-2Buz;
	Tue, 14 May 2024 08:07:25 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6nBw-0000000FJHC-3RZJ;
	Tue, 14 May 2024 08:07:22 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61d35d266e7so62338997b3.1;
        Tue, 14 May 2024 01:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715674035; x=1716278835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAZGt+1Rc/qtuBUqNnzX2rBGCR5XoalBEqWaRtcOihM=;
        b=FFcLdxYb0tPbtpGZmYOIGW/yg4rhFuOwO2/7dEULyIrBI67sQIUJS6hdcJHsTBFPqw
         fgxPAZSSuds3pMbJiDAetZFcy65Kvy7wuGITm7d+D086elXZy6s4f4cAm5gbheveQk30
         dc13yifvG+rHrYmeYbIA31tLum2MGAayQgBcPoKZBm5xP8UetB5/lycjHvu99xyDgo00
         hOkWTzZUtnj4BYDmnvlDlPp9SCIpE/bdBPHVQAe5obM0eW9poQYoFe30NGNKpgrp7RrT
         Ti/s03l2rpUWIbBvXUvh+b0VyEpZdjLSDwjEbiRM/o14C+Z1BxD1kgw2OPvGe6WhWzE8
         i1qA==
X-Forwarded-Encrypted: i=1; AJvYcCUXB9Lsu7+nw+9Pg3Gt08e9gYUlwTiXlCngKoJP6/kKNSg7S95iSgZwFFuA6HqihkjOjNiSSPQ0iisN9CUmH6Fq2ucartmDIKiGWGBXO+amtD7++72X1ny90rc3IVe1gKHqow9hZKSn1O5hOMn3ZZ1gqI6y3FsHT/bnUhsikuAzQsC6hAAiWTAmegjXP4bWCYni4wWOTbqUWzYOA0GsO5Zms7kDVfF3lqaCDn/7xoM7vKpszFqQx7i1t1tVACA=
X-Gm-Message-State: AOJu0YwNkIA2ob+AiE/nIIcC6p3ZcdJC2RyoD8UZB7+kM5qvgldoa/JZ
	3jus5b8+vTtM+N+OdmPBu2542OOyZdPo1b6oeDnfO4t5+g/uO0tiu7TUwImi
X-Google-Smtp-Source: AGHT+IGFNanLRT/XPZ4PZ+CK9VZ/rBh3R2tSavFWZjiMapxky9clDrgK7yp4IXhgf7j6Jn01dhM3VQ==
X-Received: by 2002:a81:ae55:0:b0:61b:3304:d29d with SMTP id 00721157ae682-622affc4efemr124366907b3.7.1715674034886;
        Tue, 14 May 2024 01:07:14 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e3793f5sm24817287b3.111.2024.05.14.01.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 01:07:14 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61e04fcf813so59817277b3.3;
        Tue, 14 May 2024 01:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2frHw/xhoDz27C+ZCQTTpX4vFNIHYyMh9eVTPekl2C8B+TSAQXBcPlWlGQSXt4J+02MxO756oxvkOw9d2g2qpe7FjksgiSaFE7r2owFWB3siZBeVJc6vfSz32ht5Lwp4OV20viN3RVOhOyzJwrwmpKQMltagMOUZAZ/C2yfqCKyYtPtLYICKmy2mbOYsu/0WzrmlKsiaNgw4NffH4kAYq/ShYe1BiVaakPt+nLE+ChWKCNuGZy/0ew1Cgiag=
X-Received: by 2002:a05:690c:fd0:b0:611:7132:e6ba with SMTP id
 00721157ae682-622b0147778mr138786587b3.40.1715674014345; Tue, 14 May 2024
 01:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
 <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com> <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
In-Reply-To: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 10:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240514_010720_905162_B09412C2 
X-CRM114-Status: GOOD (  22.71  )
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

On Tue, May 14, 2024 at 9:33=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, May 14, 2024 at 8:36=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > > Does this go into the Renesas patch stack?
> > > I think the patch stands fine without the rest of the series.
> >
> > Sure, I can do that.
>
> Please apply it!

OK, will queue in renesas-pinctrl for v6.11.

> > From your positive response to v1, I thought that perhaps you just
> > wanted to take the full series yourself?
>
> Sorry, I always prefer submaintainers to pick their stuff, they
> know what they are doing and they can test the entire patch
> stack properly.

OK, will (try to ;-) remember...

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

