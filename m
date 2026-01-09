Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24989D232FC
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jan 2026 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QsH4NCArTeh+pgn8C011Ry8KvjvdWLiGEJ42XE3z1Q=; b=SF4l6n+NMh5eZRnchMvhhd0ORI
	O+NPT1DMQ+Z2ElIABhRAf+aERedptcllENYN25qnRpg5T0OohqSxPJA4sv/31R53m4hcTphm0rjQu
	huR5BvZSmuQlY3oI6Y0yjKx7iHtFtS2tbW7kV2bZRk3MI3IjspCRut+iufdmO+kDVGwFUJH5JlxPI
	oDjSR2VCR0uT+1dNTL4+rSH0YontAlIKartoxS36I7W+nbob/S0B0ODzdGS80rJ2qYdUQ3ahql0+f
	OF/46jAAaNwm0k1q4DucikV9IwWu0i6WpjftmBF8SJWQdzOsfBi1PgEHikde5fDVjV/7BovsxGhjz
	ewsjXY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8d3-00000001zaJ-15ej;
	Fri, 09 Jan 2026 09:17:57 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8d0-00000001zZq-3Pij
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Jan 2026 09:17:56 +0000
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4f1b147eaa9so32549771cf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Jan 2026 01:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950273; x=1768555073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QsH4NCArTeh+pgn8C011Ry8KvjvdWLiGEJ42XE3z1Q=;
        b=mxseEnqdBBTFx2/ahpmeRToZbOUmval3yk9dtoY3O/hbzlk63V2vk+8qn2J3T0gYmq
         tzW9IpwTtCs17H9H3NeQCD8LRfP+lhGE9S07wynIrKNf6gKVmHHyPVGkzbvx/ezX0OJn
         pvGUDKSVT9yYMKwMQuQgJ66uYRDvaIQ8S1pNowm0CSEqMKn0Sq5Lszxk84rrQZU5HxHP
         qpt5f9HeR/NZe8YaS95Io32ESLsW7R7u4bGnIUM44Hp8N4fAOPeCQjrUUcaLXop+cfH0
         QWplw5zbmwlCKst6+QI39PbNXcHiCsq1GhANYebwTlnTxAFsrijLdY19YuUZCXgVIf3c
         7IGw==
X-Forwarded-Encrypted: i=1; AJvYcCWIt2DBHasR7eXdI4Z1Ucbg0YKOWBhQs9ILBQ3jL3tF4jMTsqDpUzFxUCpt7+xgfHF8EhV18NCk8Fdh/BMsiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzP8pWA5/nejSuM3LwaIVxiL8psLpY3O6zUyY3m3BEpGBgfr8yq
	WV5afStqUGYg5lk8+fsW3XnpEwP8l0KEsmeP9BCJSw6H3oMiJrtY3KEue7lGdVsl
X-Gm-Gg: AY/fxX6P/ZQjNLWML92X9xydvoZqRjeoUXpGeMl+6D5+9a+P4hEXGbGTBQNssY4ljHU
	LWt0Dawc/MsmO2/lbbjiLEd++Z1JwRjfaEvN8qWSgScRGyYTCJUKw1fYGpiGllDq6PWb0kzVEi4
	W8MvivsCcnXb1tEkKcWLC/EUr95rQOtl0LSfabECXlb25w02c9OPRUa2c/OT/l/xyxVBdtCRVAm
	DAhPb6/LMR47MiUM1qY5Gl1O0eO70enyvxDWy8T5ZfxU4pVARqCXN9mGXrzisLksGgwXyLS9ZAC
	prGaFe3j7HCG9e7uG3ouuKBlQRrGah3ZxTJoDwZF6QR9AIO9nL3iDUf/qTOEhnBTinwescHTaxN
	MEkd3LRppYYY/jSvl+s32B5rZY65gHB+D1ArIeLi+AMARiQBq8G1EvzTFk3Iqc5ktIKRoRcPo3F
	+IgjQLUqANBgfm/E/98pURTUI+Q4/ENMvNuvD1za9UwNWCNMA+PR2H
X-Google-Smtp-Source: AGHT+IHoLRHrQRh/KT6O+QTM0lHVqqjE9/gj4bBxP6IgeLXdMRtPiZdJ7kSxvgeZbgVq3LGXMslFXQ==
X-Received: by 2002:ac8:5e06:0:b0:4ee:45e1:24e3 with SMTP id d75a77b69052e-4ffb4af4d44mr124729221cf.67.1767950273420;
        Fri, 09 Jan 2026 01:17:53 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffb75d7916sm49765051cf.7.2026.01.09.01.17.53
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:17:53 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2d56eaaceso442041785a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Jan 2026 01:17:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpyp/01GtrQXmqPdxGRhHluaHuk7hkutIsbUifMeeMDa76I/OZziQ9DE65jpjbJkjC6z/Mr36zHZ8O4l5bkQ==@lists.infradead.org
X-Received: by 2002:a05:6102:3e1b:b0:5db:d60a:6b24 with SMTP id
 ada2fe7eead31-5ecb68a5bcamr3135494137.22.1767949965924; Fri, 09 Jan 2026
 01:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 10:12:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHpePT_0wRMqFy=UsyQpMsUGWTG30_S95n7yePEr89Ug@mail.gmail.com>
X-Gm-Features: AZwV_Qiu4QT5egiVF0kpOh1nKIX91ZXppU1wZ2LC7e1cFqlECMypgggSHOEO-14
Message-ID: <CAMuHMdXHpePT_0wRMqFy=UsyQpMsUGWTG30_S95n7yePEr89Ug@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] spi: Drop duplicate device_set_node() call
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner <ryan.wanner@microchip.com>, Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_011754_874971_D655C7E2 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, 8 Jan 2026 at 21:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> The SPI core provides the default fwnode for the controller,
> assigned by device_set_node(). No need to repeat it in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/spi/spi-rzv2h-rspi.c        | 2 --
>  drivers/spi/spi-rzv2m-csi.c         | 2 --

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

