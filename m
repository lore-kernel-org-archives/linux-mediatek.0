Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FC9D26D9D
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jan 2026 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+kn0nlzGkQ0BViOYfFFGO8lkUm/rT4hSAopw8yn9RE=; b=I5VwMLcdSYM/RhtXZoayT+Shu8
	UmKyONkh4lqnTjDnPzmCU/eTGDxxC4NylBunEhfTd0sOHj3kT3vrzDOtaiMw0o8dTK+U0yFVRQn/P
	19RaazktPkU+FyESzysla/FL5kRv7THTKZruI6fzA8QFdsKM473v5NJp7zo9RXyExziri+syaixcj
	eUMl/PNNfljXwqd8dLfsXCHqW675vMu43PE9qu5XiGf13Ly6WNA+lQn+bonkwwL+j9m6114Ypq++F
	ITGOaZ4e2AleZtazBPLuDnA4T+oyYUar2m4DIBjLJDBmBgFaS6YVISChBKBvog9VOaSSj/XQQz34V
	xCbHdAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJgG-000000031qh-2n0g;
	Fri, 09 Jan 2026 21:06:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJgE-000000031p0-1Yfx
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Jan 2026 21:05:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a12ebe4b74so45373875ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Jan 2026 13:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767992757; x=1768597557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+kn0nlzGkQ0BViOYfFFGO8lkUm/rT4hSAopw8yn9RE=;
        b=WNPyTDpoOI2UrSREGyjOmX4zSDUaUHOtoqDyVDjcj0veI7dX0cCSpwYHB1Yo0t/UdX
         cYlkXad8u2Rd6Ia0bZGecVLvQyS9zspaGE2/9SH+hRpRIr//l8ADgQxP2m1mI7mzonlh
         xt36gKNU73WAqOamiB0FQs43bYO+hRfy+F/y5VWCmnrLe/puf7eZdFY1fmrmesMJY6w+
         Wtbzx6x5fLUEf/8SL412aAbPOzxJwWkrSH9x6qKAE/Ge0OWqc6c/ELc+dU1j9FnLbZAA
         tXJFjYSTUqvXkFrrnrVKC7OGl7zUFKegGdUmenbxc6parPRGMbsV3Ki8P1Ee0K/tRtst
         AksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767992757; x=1768597557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+kn0nlzGkQ0BViOYfFFGO8lkUm/rT4hSAopw8yn9RE=;
        b=QFKLMAjVuXn9y0q6Lb6ox+uB6nwcXWuAEIFXiUpW2iWXwVSReFI5p4urU+V6cT199h
         N7C/wfk3O3uTCfP2IU2yA+zsqUTqZLL5eEgHerwGL2NREQHqh7Q2jIinrLT2uzdBv+DX
         IypUN6iQwn6lodkbbyTTZgYsGSlPPrIp5SXMnT2uqR96xayPYQuzooU0OvYwv1QM7RvZ
         TGdjPddAYlmjL+Cterm/OPwbflSy/yNPNw6Tbmd6c4CrOcSQzY0QZMYYoh+YdUWiB0xQ
         th69yvgoxYr/vyiJJLaIrQr6ym5cTOxiZYK+IfaJ4Af60HJNREC/th1/DhF7WNcyxyiM
         SmKA==
X-Forwarded-Encrypted: i=1; AJvYcCXnSNPdpcrv4sOZWvEZZ5+ko5Q+NSUHwW41+7TyDv34CXbE6Dt1PpuYdJ7+samSQyI/Y6d91MWAuPSC8F+lqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxDy/cygKEtbFQwH3AovKBVmOSqEoq61i9agNCDMydOJtFNr0x
	82ayLOC+IyZROtUoniQFus4Vik2WYlavFcTEb4xzF62YWHGxL4je6W4UELH74PE/QojdkW10Lm8
	Bb1dGfq7Ut8OAcZ0J4+GjsPV3dbVf4A4=
X-Gm-Gg: AY/fxX6V+L+Gxnnm224In8OHDRuP8CxOImqBmko72ei9Btqu542x55K3T3XfeTkdVj7
	KGQetLE/Rs99TwzUQmJs03kLAbN58PEWJfJtBpyxsK6MQezGZOnZwxqFpHp0pwBJRYxdgoiCwv2
	Ikt8T3KVXm0DgjOUBIdtYz5tzb0anHDp9YwdBtkSoXAmytKnSopBmQC8J8f5lgcGjQJwOdFAs1D
	glCqk9ODHuh93y/ju767cg35AsrXpYWB5I5YtbQRODFRRh1AL4v9s4QRh2vG99rvmGC87MmiYEZ
	NgUR+2rWefhG9XKVpCEmGcf1Albj0XYdSLQc7/k=
X-Google-Smtp-Source: AGHT+IGzEqZSKhDh+mfZnkqq/TwV9IRDJvdndDZXOgFLWIDXGIN31XCilSikaluLQUb1REl5xfFtQyCdyy3ZvPXVWkE=
X-Received: by 2002:a17:903:1acc:b0:295:592f:94a3 with SMTP id
 d9443c01a7336-2a3ee49b5camr115632895ad.48.1767992757127; Fri, 09 Jan 2026
 13:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 Jan 2026 22:05:46 +0100
X-Gm-Features: AZwV_QgnJP_ucVFfV4UzfxU71gNnGoxRPDRc5QYDA0rdtBqGfiMffeomtdZlKmw
Message-ID: <CAFBinCDzAOC9Sc_LZEbLhtajvPC4zjRiaoq6k9at2iJQnJxwjw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner <ryan.wanner@microchip.com>, Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_130558_429896_7FD3AF05 
X-CRM114-Status: GOOD (  12.60  )
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

On Thu, Jan 8, 2026 at 9:30=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
[...]
>  drivers/spi/spi-amlogic-spifc-a1.c   | 1 -
>  drivers/spi/spi-amlogic-spisg.c      | 1 -
[...]
>  drivers/spi/spi-meson-spicc.c        | 1 -
>  drivers/spi/spi-meson-spifc.c        | 1 -
For the Amlogic and Amlogic Meson drivers:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

