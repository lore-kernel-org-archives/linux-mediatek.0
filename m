Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6793EC001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LWJf53shp0viE9TAbmwOxmgVvdOZl/M9mic33WO7Jo=; b=eIygfy9eeI1ZW7IOsHovYfdjID
	ZRvv/RRcTUKbPIvVbDUjYNQtljG3ilZcS8NyWKDmQyVIILpN8BimePteJvq/Oe5CYDjZXnBg9/JWw
	gYCor2uopHzW0RlQjKzSOuqNqhTbuKoix9vuhvOPWCDPoh9QLzZwoz6qckhKAkK9Lh/O9LtQMWlwk
	xivZwCydGvaR37mkxdKrGIreCY24A7bgvlOceg5FHlM8H6eHPF1iU0rVQGVhjP9s5Z32khFH9SqZ7
	ZA74ZSQUjmKTFekMUeCfurG2ulVwL0ooIcjLuSoVat9qhsp1dBHj5m5RYKTMC/qAMu4FaOEUKkFJM
	LXL1aK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLItc-003LAR-39;
	Mon, 17 Jul 2023 07:43:53 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLItX-003L96-32;
	Mon, 17 Jul 2023 07:43:49 +0000
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-cb19b1b9a36so4319678276.0;
        Mon, 17 Jul 2023 00:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579825; x=1692171825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LWJf53shp0viE9TAbmwOxmgVvdOZl/M9mic33WO7Jo=;
        b=N3TkAlyMO/Nqb5WoDx1PHMr9z3OTKLKTdJyF8zHq9yPSIPhjmefZht2vekYCinYKBI
         UJoxeNN66jYGklYqrEV9MmvdCFH/P9V6tRvxj8CesSltw30gKrjSxb9DFpylAadqDHgW
         ve+3k391NgVl+n7SUjlO6UxI/zfq1rGZT4iOrJWPWIf6doN5DqESDrNa16oFocPkLXdt
         DCuL8PvCX9ucZwYONx0AwR25fkvoYgtFzS5D7VNRsCnKn6Yo55vvnWADAxiXbwm87Q5t
         gLcOjXm5dw1E9cNPiofYu9zPJ6jHcu8QTSLkAdCuQDa5GLymVUGbFuqe8Xa42jqd5Q2U
         aXnQ==
X-Gm-Message-State: ABy/qLb1pQ5Q/3y30Bkf/QRteHp/KtHNp2duyMTy19lQTYzlUuZVwLup
	aW0HrBhGoCZglQVV8CXGXrX6e0o048tzVQ==
X-Google-Smtp-Source: APBJJlHJLv6fFOS0rM/fPCNnXG3KhjyqmP9rwa2hLA/itFlXROtgv8BapfZXS3lhtFRIkY6pJYucww==
X-Received: by 2002:a5b:b46:0:b0:cae:d40f:5934 with SMTP id b6-20020a5b0b46000000b00caed40f5934mr10054405ybr.27.1689579825582;
        Mon, 17 Jul 2023 00:43:45 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id m189-20020a2571c6000000b00c5f4d06fb1asm2923525ybc.59.2023.07.17.00.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:43:45 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-57012b2973eso42132627b3.2;
        Mon, 17 Jul 2023 00:43:45 -0700 (PDT)
X-Received: by 2002:a25:2945:0:b0:c21:caaf:bd47 with SMTP id
 p66-20020a252945000000b00c21caafbd47mr10530962ybp.2.1689579804817; Mon, 17
 Jul 2023 00:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 09:43:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOUAPoBcSqHLTCKh8_PqyAiuGFEXedEPS48X=oc8SqDA@mail.gmail.com>
Message-ID: <CAMuHMdUOUAPoBcSqHLTCKh8_PqyAiuGFEXedEPS48X=oc8SqDA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Chester Lin <clin@suse.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chen-Yu Tsai <wens@csie.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-oxnas@groups.io, 
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_004347_977936_7BB2AECB 
X-CRM114-Status: GOOD (  18.56  )
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

On Fri, Jul 14, 2023 at 7:52=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/renesas/core.c                         | 1 -
>  drivers/pinctrl/renesas/pinctrl-rza1.c                 | 3 +--
>  drivers/pinctrl/renesas/pinctrl-rza2.c                 | 3 ++-
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c                | 3 ++-
>  drivers/pinctrl/renesas/pinctrl-rzv2m.c                | 3 ++-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

