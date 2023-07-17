Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3150BEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 07:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUvC4vvxIfMz+5toOkjqLhwq7X8FXptFWezRZuPzIyE=; b=dgYz9CBWPxqZighhQLYferP+P5
	2jDbx/PQMo8GXXcKpr/gV9DlCP/t0P55ZujEc8dJ4mWoKo8YGB8rPT/MzQBxfPJ7S42yFxIeomBof
	RHgUhd3RsE9SK0ukvbulYRPr/G4R2XZC9mQiNQ0GHqHqAUpjHPqzjqLBTFcO6Pvp+7QnspxuTgP+3
	xQJ2FGYd9LPMNWyOyIQg7NfNSppAAoyeP2lV0Kevg5iFN2OTAmV5y/sMW+MGF5pHG9IP+wgPumAOu
	sgNxiZlqZMmt3XQqNA2zux+Uei48CXqx9p1Z3uJX0bVr9w6E2fc41XHPrzi8UxlsQu5u7eu8khTfo
	1Cu60Nsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIrn-003KrU-0M;
	Mon, 17 Jul 2023 07:41:59 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIra-003Knk-28;
	Mon, 17 Jul 2023 07:41:48 +0000
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7836272f36eso185028139f.1;
        Mon, 17 Jul 2023 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579703; x=1692171703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUvC4vvxIfMz+5toOkjqLhwq7X8FXptFWezRZuPzIyE=;
        b=Wf3rgWGpNwpyv5tlyWdTupQqPacWgdyJs7ZAzgEEozZm4Uef/hxR8nkod7YQUT6bgO
         16ilXZv7wumPT7WCfAY0zdf8lC9hpR7BUwYkF0OoIkYPYPzV0d3wtcxAgOsA7fKry5sK
         AH0g8CpJJQODp0AkxrgXT23Qfmm4s7rvC9RcX1Uw4nnnUsAL4kUtgZ4SIhbJiDndZ326
         eUQdmlxzaT6JCUBedtiMUuwvJjt4iiyUIrTB5Cn9YcezZBijj4Z3qeNVJrCWtJNCnHQ3
         nKcIqujm5MYzKj0k6/GM8pywyjqygQfxKX0KXrn3pdInUFcUID9mOKwCBvLF/SETKr8q
         l6yQ==
X-Gm-Message-State: ABy/qLbehlLKnAmnNe+ZWaIn68GhEZ9L9HMYUKx6oTSvNlvpS+YSO5ZR
	/4s+iR/N7215w5XPGppiv4foFd+BsLsp5Q==
X-Google-Smtp-Source: APBJJlEPT9S2yBzgfQbCLSyofRYDx0GrmtbYTT0EGiujwYABTHHZYGBMIXm/g3tPKnD8OPB06bmsGQ==
X-Received: by 2002:a5e:aa0f:0:b0:783:4e11:76d7 with SMTP id s15-20020a5eaa0f000000b007834e1176d7mr11002981ioe.21.1689579703529;
        Mon, 17 Jul 2023 00:41:43 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id b12-20020a5ea70c000000b0076ffebfc9fasm4573508iod.47.2023.07.17.00.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:41:43 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-78666994bc2so186032139f.0;
        Mon, 17 Jul 2023 00:41:42 -0700 (PDT)
X-Received: by 2002:a81:65d6:0:b0:571:11ea:b2dd with SMTP id
 z205-20020a8165d6000000b0057111eab2ddmr11237476ywb.32.1689579681652; Mon, 17
 Jul 2023 00:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174342.4052882-1-robh@kernel.org>
In-Reply-To: <20230714174342.4052882-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUWy3Knk6Jqao12KULam_3XpYc=cGqRXe4reH7FPVZsg@mail.gmail.com>
Message-ID: <CAMuHMdUUWy3Knk6Jqao12KULam_3XpYc=cGqRXe4reH7FPVZsg@mail.gmail.com>
Subject: Re: [PATCH] clk: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-oxnas@groups.io, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_004146_717545_CB3D9F52 
X-CRM114-Status: GOOD (  18.23  )
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

On Fri, Jul 14, 2023 at 7:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
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

>  drivers/clk/renesas/rcar-usb2-clock-sel.c        | 1 -
>  drivers/clk/renesas/renesas-cpg-mssr.c           | 1 -
>  drivers/clk/renesas/rzg2l-cpg.c                  | 3 +--

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

