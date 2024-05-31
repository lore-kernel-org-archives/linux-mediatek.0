Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F92C27C44
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 07:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayp9OTJcx8xBTEOWGr76ffez+fesdX+4XqGBVIDxEaQ=; b=KnfLVXICpWHT94PU39jw8Zq3mb
	Mkgf/YABY05kQOktSRt8miDWub8/F6TmGRUU7rApKy2EQQx+XFHjDN2HBR6U4YYYJruiFnB3IuKyH
	XjBxHoXrpIHOblQVORp37PgcJbUdKdbhxT6dDZdZvs9LgYewYLvMUU+raREpS24L3qvLRuu1PwwyO
	vKmpKS+pWNBJKqjqbjSR0gJuE2uHUQfBOoecxjV7vMMTcEw6Fy77Um45Y7qcCS5J70cqnmyAoOny3
	LBSLisXqRqPRAzLfYT3TsrlT4t+wOfjHrFocYzZUynAVBNBt1YkB9HeNE8qhdL7p0KGMhGGePyFXb
	p91Eu0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwM4-00000009THC-2MNy;
	Fri, 31 May 2024 07:07:13 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwLz-00000009TFJ-0x8T;
	Fri, 31 May 2024 07:07:08 +0000
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5b970a97e8eso993849eaf.1;
        Fri, 31 May 2024 00:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717139224; x=1717744024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayp9OTJcx8xBTEOWGr76ffez+fesdX+4XqGBVIDxEaQ=;
        b=gFSNU3Qixvx7abSpL8M39QguIemtRokJEMiTfRVFVckaeiSBWm/4Dve60D6Mk6/Ukx
         Ij2iidFdu+AZR+lOCLfjvxee9MgqjHOAqqgo9aKblZxoFDVbhfp17umdsjOgaESFF8yq
         thI4wx17Z82FG8FdT/lK1iM5opWOvhBP3Ma8RvjoElQThMpK2xyL8fMxrmFZc3ZLNaak
         8WwXQ+FYwqKbcankjC8ePnKI0C6rjanwzlW9KnPgp5up3TF88/Pv+lgmby2ICSyWH/Cf
         2fQeNWLZz779bny+8pcFIl0eZzUlqcanDXFpCPKQBOPOpx+DBAnMTAdLh+Nf7sr7fz2a
         OMjg==
X-Forwarded-Encrypted: i=1; AJvYcCWoCdIN7nOEO6FIGCnKSn5Eu0bij36ktPv4PXyTOMp+VCZ6eIS1yTX6Odf4TBMknX2TTQux8GuqbBFSXY2b1c6p1I1+WCfdVHfQr5psiFulU6VwozTpLj1mYIdzVM4w9HQDAN5kz0ffVTn/eCj534Qr7i7/8PQL1tcegi6+fm8BrG+m6k4nvz3XcudiWY+BoDRVPw+Yhg+H3vRW5uEgIlwmLkOB8xCDnIs6hr0BeK3OiF6XroPefqUMXYOe9Z4=
X-Gm-Message-State: AOJu0YyeTtjEnbV6ckF7bdL1J70FWTzlF34R+uwILbJmedWxD1g8BkVV
	0QEcZFg9RKakcIPqI0/AZfxf70pvpMYX0gLJ5K1kyTHYjMiD6ER1DLiSxzUL
X-Google-Smtp-Source: AGHT+IEvw8EaNVAIsUueI9lry6ganIkRRYHroy3+qisIhM7iH7/OZBwJi/3uyOMzOOwDcp76t/gcmA==
X-Received: by 2002:a05:6820:1aca:b0:5b2:bc0:f387 with SMTP id 006d021491bc7-5ba05d3212amr1200272eaf.5.1717139223694;
        Fri, 31 May 2024 00:07:03 -0700 (PDT)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ba004f25a0sm268240eaf.42.2024.05.31.00.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 00:07:03 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5b5254f9c32so990361eaf.0;
        Fri, 31 May 2024 00:07:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuwsdsFjOi6htPU2WkKHYpnN62jm/vCtQOe8+ONLKSj/4ZDWEfKIe9HD4sp2/2m+HcVg6C8YM2H9vnry2Mr4J/l9LEaTi/F5DZUuZ+7zPyxkR4CDeJWj/iVYTdV+PsyUDnSL6pRihy8A9FM9Cbt3y0FkX9IXZ3MRjhlXjPc9ZkMFB4X7uHvkXnC/UP2hiMvUyOT20mBfrg6LqVYyD++QooWPSJW5s1hfHVfjY1DDUkL4w8Zhk6wm9d3kXnNO4=
X-Received: by 2002:a25:5f46:0:b0:df4:f149:1fc7 with SMTP id
 3f1490d57ef6-dfa73dc4a2dmr974775276.58.1717139203004; Fri, 31 May 2024
 00:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com> <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 May 2024 09:06:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, 
	"Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_000707_294561_C19E00CD 
X-CRM114-Status: GOOD (  30.35  )
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

Hi Peng,

On Fri, May 31, 2024 at 5:07=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
> > Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
> > On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com>
> > wrote:
> > > Use scope based of_node_put() to simplify code. It reduces the chance
> > > of forgetting of_node_put(), and also simplifies error handling path.
> > > I not able to test the changes on all the hardwares, so driver owners=
,
> > > please help review when you have time.
> > >
> > > This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> > > thanks.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Andy's question about code generation on a related patch made me wonder=
,
> > too.
> >
> > On arm32, a conversion to for_each_child_of_node_scoped() seems to cost=
 ca.
> > 48 bytes of additional code, regardless of whether there were explicit
> > cleanups before or not.
> >
> > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups", a=
nd all
> > but the conversions in *_dt_node_to_map() cost 48 bytes each.
>
> I am not sure this is an issue or else. What would you suggest me to do?
> If you think extra 48bytes consumption is not good here, feel free to dro=
p the
> patch.

I suggest doing nothing about this.  I just wanted people to be aware
of the impact.  I guess it's just part of the slow but steady increase
of kernel size (ca. 20-30 KiB/release)... ;-)

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

