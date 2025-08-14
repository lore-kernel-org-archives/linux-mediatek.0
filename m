Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2240CA0EE6
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUx5rdSAym75bidV8LMMjvhD6atsKdb4p+2dl0DoyhU=; b=nsng1r5C5aSBxboJcOtNnfAaUN
	ME6CoBfHtyee6xU8rsHXCW2qWRIELQ2Pkq2r8/2ba/YLrGCNGRjbs23Uy755nBX49KwTHVLfC0/t8
	dZgxTDmZTG8Vj7GjbiIiXPVsW0X05+KArexdtcFJGnjpVYPkxlYihUCl53G82vzmu3g28y3UeaoVS
	aqBhpj4ZZC64vybO0jLCSeEKz3Gq/YJogX2wypVqfnngXI8BHA6KhPB7FAf3fqtRF3VEmKtCv0jXk
	MYrx4Qi1xmFaWTTqez4EknO0j5mZ0wfKLwyi+xnRo6b6S/3fUmM5gJ2HZiGfdGEyUKmXdJetOJr/x
	0YDM1ATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma3A-0000000HVK5-2Q0c;
	Thu, 14 Aug 2025 15:39:32 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZiI-0000000HPNs-3JVu;
	Thu, 14 Aug 2025 15:17:59 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-435de70ed23so549759b6e.1;
        Thu, 14 Aug 2025 08:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184678; x=1755789478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUx5rdSAym75bidV8LMMjvhD6atsKdb4p+2dl0DoyhU=;
        b=seBz0xCErd90cTmzqLAYnyEVw9DcVQgD2KotUBNLsopA4J3jSP+X3Ep0uQWUJta9HP
         jkT8eR06gjzFx469PInZr2CLQ0DaABDAOsTvUpp6ylPgYkhYho4zUDx6aYYbMTbzIRyE
         Bm6V7Itq4btc7zSlB9wvIIAJ/IDmLFFxDN54IHLQxvV+PAi8+6HE5wJpaxc/el/t9oqc
         aY3/nVeJlV8LiiwnpFCNYa/hGz4TXV/m97XlS+4WqN6BI1Xucb8cPvgYoO5Rnffxryf7
         1CsVWLwyLViJEfQsPoYZ89tgu91nb4+f2X3suk3lgRcbcZRwumr9aS8pzpXiDtFET9S5
         nLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBPciICS0ppF/PbfdwJ2sL8LCnJ/rSng4Fx8qmI9yeycZd2fc7lU8D2b42D/UmdVzQxiok5w42APEjoNPu/V8=@lists.infradead.org, AJvYcCUbQdsAPk85PPoVR1zQ0BWruQIs68k2fttfMgkZkbovOGw4OeAoB/1+JE4SLMgvukgfuxkwA6R/J8gTqWlr7KZUJA==@lists.infradead.org, AJvYcCW/b6GTxOXnQQNc0P6QnqLTfSNmnG3DQeU4InQ4QnuL/Zg+55FkXYMSc+QxgYxZudO0R5i5J51s9qoqlmU=@lists.infradead.org, AJvYcCW2RaGzM5dbhO6zNTtLy6DmfYTzPp5aiXsYYQcDFr6wMNY5yqFRTRozJ38V+DXL5FGrshe9rGkJT3NjcrmW@lists.infradead.org, AJvYcCWIZ33v5Y6acNRexT5C14WcSInkWHEBy8WLgTBcYGOxBzAdUNM0sCKoY9Qx4CD0+fbVnDlJgkJLpmYeSw6l17s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFLlKAJ0Q6bH1eAOYeOzn+l8jH0DOqcMhPSMHeDaD4K0IcvQ3J
	SHkwKmMUiuDSDIa8Y97Jwmd+Hwr+afeOq3oUtAV4S7gqTifWa9WMTquqUDzJlZUK
X-Gm-Gg: ASbGnct4GqBADY6mxuJjzWjmL90tpZF7LmHK2jn+N4pN2wgkMTK/HJXXTf2uYK60ohA
	xyNEyng+2oFmp7e092mWba41mT6hhJB0fQIXyn3VMJztO/Xt7v61s7C1oGKo+Kg0Me8c0QDdYcf
	UdeKbhyWxHZfTJoYY4ufiW/TBSUviSJ75nY7vd8IAXanhfCHdhzv+GfxszuHj7p22LuSJQYNX9b
	RUVhdUt0XUR1d+gPOkl7/4xiqesE/s8wXOcW00BS2um6eJ0rJmhDABRsd0qSKNav7uhAHQ4HFbq
	RbU8ihrvKLF4kffYzLFBzx8lqA0mfKn4ffBoh9zQZxfV24noASOhMUHUYaVMr5Se/E1lUn9CaWO
	tGAGyQSV69LXk7ZIkquRuUZwneJyZZjQTEQmNcD9y5f4H6HGswR9uC1ORSs8v
X-Google-Smtp-Source: AGHT+IHZx63/r7cGIfIeJcWt3yNf2GOxthi316acxolX49DYSOub3KD2MOoxfPkqacHkAJHqnk90ew==
X-Received: by 2002:a05:6808:2123:b0:406:6a36:230c with SMTP id 5614622812f47-435df7c007emr2105140b6e.19.1755184677618;
        Thu, 14 Aug 2025 08:17:57 -0700 (PDT)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-435ce85a014sm1115229b6e.19.2025.08.14.08.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:17:57 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-61bd4d84b76so470659eaf.2;
        Thu, 14 Aug 2025 08:17:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7QEBPhc/MhGclosfUG6n0kn/U1Pfj3r0Pk2GUdVpd1BlQtkPUq67k71eUTwRsUV24PDtRx5K49XeOLSyMn04=@lists.infradead.org, AJvYcCVJwoJXaG8qv9iaPI6d7eFZS0Rl0E3ARcxC+XBRkR4AIJCFvwOoHJ664v53S2QHY3FI4r5MIUEpfrSSe0M=@lists.infradead.org, AJvYcCWHCxVblzzdtkpmbbZ6PvM9DI3fTivJ7qvaTt+tqRnVfgPq4JYESqcqKqkPgzkHZlolD3L7mVGZIwLw8rgsZho=@lists.infradead.org, AJvYcCWI9JHKJHgz8UH74S5cVKhbecTEBeVATYRIjoec8Bt3yrtlLn94SsKomKvffZq0fEIhoKTnbj3XEckmz3VbhmpS2w==@lists.infradead.org, AJvYcCXnW9lXVv2hmGmio5dtN1Gj6kQrduHc1koOBZivwuFUzOexLliuQnuwoWtSX2cNsdeSoj8jWjQ4wgqp/jwz@lists.infradead.org
X-Received: by 2002:a05:6102:e09:b0:4fc:b033:cdc5 with SMTP id
 ada2fe7eead31-50fe9974df5mr1305485137.22.1755184225208; Thu, 14 Aug 2025
 08:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:10:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnN+4B1=RhOOHZ9mCN4e4WnfjtY_HO1t+176=dSs26Qw@mail.gmail.com>
X-Gm-Features: Ac12FXz03sJgdAZuxBhvZVUnciJ_u8JIfA74KaWnv048j9en2I4ZzU7p0Ef3ecQ
Message-ID: <CAMuHMdXnN+4B1=RhOOHZ9mCN4e4WnfjtY_HO1t+176=dSs26Qw@mail.gmail.com>
Subject: Re: [PATCH 111/114] clk: divider: remove round_rate() in favor of determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Heiko Stuebner <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
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
X-CRM114-CacheID: sfid-20250814_081758_829731_F3384DD5 
X-CRM114-Status: GOOD (  20.44  )
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

On Mon, 11 Aug 2025 at 17:19, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops. Also all clk drivers that directly calls
> divider's round_rate() have been migrated over to determine_rate(). So
> let's remove the round_rate() clk ops.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

