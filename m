Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D0DC9EC97
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LRLoreM4o+gGDWAZYVe2aUygCSNCbLkY2YsP8OXzQQ=; b=gEntVjd8kKvkTBoJRFu2djFbbq
	o7obXxgErTQF+hE7ydNuKKJ8e1LuI933rfGpCMEcd7EDzUSng5pfwnGZEb7Rzc97HwnUah/nKx3AP
	EF7aDLS3qCA96VWUnUfpnIl4CXqhQa+ft7gv5R1v33sYkvOAw9N7nHcz46dZti4PD8kiHXgLdyUhq
	4wBJnO+TXVQSdSYpvyYUBrxWCFLCF4qaDNCPBkGAJ1iuui/8Pu6xIgwDPpU7Kl2L8PmmsxDE5+Q8A
	8n7FEvbv2zSswxT+07v3MguPc+F+lHSOlK7Vyadc6bOMe0nlF4oPg/yPbjLC7Azvuxm10FJzaY57l
	3Xad+M6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbPE-00000006suo-0HoM;
	Tue, 13 Jan 2026 10:13:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbPC-00000006stN-2CGj
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Jan 2026 10:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+LRLoreM4o+gGDWAZYVe2aUygCSNCbLkY2YsP8OXzQQ=; b=M8kQzR05Eu9ry8hjGoOIsrxd9F
	l7x5WVAnRE1HOiraUCR2IMbyM76iTSXjbkLIjWSlFSQve2EbN/8SFL6YvtHDwGE+WDGDkfkSoUGsT
	AD8ZBirIRnKYp/8M8xs82ugkvtlV3k7f7FNJvuvcfT1tZgeuP53/AVvKEtzpddRTYRLaO1gpQ510I
	dqDGLLK4tY7PC58JlyDgglo/JDeuQGWe3rqU4BRzooG6fvMPtFgaF1EEz/VWUphfSEKZKitA+Y5qh
	v/UDor6IDpKIV3BVyB+rJ7RaRCxYHcKLSRyBhUeO0EkOGwF5/nueGdOGrz7At0jluxIb8y5LMElEO
	EDro6dYA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbP9-00000002XeD-0et0
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 10:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E77B444C0
	for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 10:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56580C19423
	for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299216;
	bh=RpOnPNW4xfI0Kz9zhPqicYu/rLC2pTmpoM33Trm+SMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dBkyBNzZyikYWHBI84mEzG69MRM616RZBoMsO0F3Q1c1T/St0KrZ9e2JUQUHBxmA2
	 3ghOxlMMpbwvS/wL74la9lRVcw7lVZLTyWJiprsxF5/oDzdFtYs3SmKTcdV3GQohVx
	 6ukv6oI7L/80VLsINJQ3gIGwywWiYE4fp1vBKJEyuSQnejwmmr6sqzttwZsXeXj3ba
	 X+Klx3wBvBhfpoXyoeO/EffiVahCypVxOcHqGQ6XJH0tDrCHhaz16CsG2xGrUPWY6N
	 NsymtWt2Boevzn0e3ExO19xgQ8iQhqLMnifQUiiSr4WPa1qIiWHnrxefRm2bdiPR2v
	 DCFLKopJUBlYA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7927541abfaso25774557b3.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 02:13:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUp0g4Y36T1fXBtCZoNMvzs+kQkikwEn2obXxHFqUePYetpYrvsIpvPe/7ytbghxn6XhT2wRV0VocyNfBmeDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMu1d4xPIIqdd8Jbx+di9ZuOzULIkUIcbkTPkb7/Ux8aOZlHTW
	cgU79ARpa8kWBdbxmLEHjp1ILtoUfMMqYOeMN9juE8kXPR+iOpFq+c/P1H2uxk/AG9tREqZVuMF
	qcSBtd5s0o5+wKCNRv3FMLjJwBcDbHIM=
X-Google-Smtp-Source: AGHT+IEjXK4zNU3B8MFfoIndGOeB/FKQBt1cyG91VMuMhesDC6zUrt9ZhhHY6gJ4lWXzCFjcVvXXmBBHZkq1dqdQ1TU=
X-Received: by 2002:a05:690e:1442:b0:644:51a4:4f1a with SMTP id
 956f58d0204a3-64716c67be2mr17455597d50.46.1768299214202; Tue, 13 Jan 2026
 02:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Jan 2026 11:13:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLkBKcK9eKOCfry2H1DzG=5Z93w2U-SRwHf2dkRBhyxQRw@mail.gmail.com>
X-Gm-Features: AZwV_Qgxd8O6AeWZ_24rr74gIMc3R8RlMUxlB-x9t8krXDZ9OpAu7ZlluLqPS50
Message-ID: <CAD++jLkBKcK9eKOCfry2H1DzG=5Z93w2U-SRwHf2dkRBhyxQRw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] spi: Make SPI core to take care of fwnode assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Haotian Zhang <vulab@iscas.ac.cn>, Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@kernel.org>, Amelie Delaunay <amelie.delaunay@foss.st.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, William Zhang <william.zhang@broadcom.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Manikandan Muralidharan <manikandan.m@microchip.com>, David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, Sergio Perez Gonzalez <sperezglz@gmail.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev <rosenp@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Luis de Arquer <luis.dearquer@inertim.com>, Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, Alessandro Grassi <alessandro.grassi@mailbox.org>, Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner <ryan.wanner@microchip.com>, Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_101339_608649_B4BEFC43 
X-CRM114-Status: GOOD (  16.84  )
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

On Mon, Jan 12, 2026 at 9:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems all of the SPI drivers want to propagate fwnode (or of_node)
> of the physical device to the SPI device. Make sure we don't duplicate
> it over and over in each new driver (+2 in this cycle) by making core
> to take care of that. Note, similar is done already by IIO and
> I=C2=B2C subsystems.
>
> There is one noticeable and quite specific case that is taken care in
> the first patch and now we have a confirmation from Cirrus that everythin=
g
> is okay.  The rest is just a mechanical conversion after checking that
> the parent device is assigned to the same that provides the respective
> fwnode.

This is clearly making the kernel a better place.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

