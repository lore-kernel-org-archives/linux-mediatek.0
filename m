Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D71C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOwQfemle8oAtk5HhkSGbIU5cG/VOJmaf2KabL9UxvM=; b=RvdrgOfglJEOYmopQ5NqLnZ+El
	kdextXSr495pvDrcWow0Y8OHMkO1x3ysumW5O8OYZPa+cypWAazmBQD7sa7F7S8C2haDvCHL2iv0d
	rfkV9D7pzIQTBXqlf10ueHLGQCBaHHJOharEMPlQez0YbDKihcLJm29xbaiXfMld6jrQ3ItDQ+Qcm
	EqxU9pjDysL6vxR0cheyok4qbSsfBjNZaz78SYaku6CQv/uVUaSyhGmwJxkYT0FMN35rW/y96WU2t
	TXljnruP6ybk0JJsEUPiNXyWhrCJcRGFtRp25dk9BZTsZCgMclqD1ePraNZP98AFDwXRcDsZLNixm
	8xPaP0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDkE-002PPd-Nx; Wed, 18 Jan 2023 19:05:10 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDkB-002POP-3Q; Wed, 18 Jan 2023 19:05:08 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4b718cab0e4so482152067b3.9;
        Wed, 18 Jan 2023 11:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOwQfemle8oAtk5HhkSGbIU5cG/VOJmaf2KabL9UxvM=;
        b=RTYCWCdRwEG6RCVJzx+2/qsJ1LW1qQ11UduGEFH4dF0MxHF5zLvazOK0I0AiFunqxw
         rtT7FQtzLHAg/iih/QIavu4roZA0AZFqdESiqZAi4EvXWf9QhMQMnh9JSsDYhkz+tLVC
         IV5ECRazRi+Q/WhcNX+gA/+hxaI97c5qea3M53vY04w0qVT8ZqYIPxNuFHMdQ98OK3ls
         fS6WTNhc/goYDrhoXOr0Uoo66AOV6Ff4u7IcpleNYZCse5pgnw3F2M4dQQ8LMBEKtY+h
         bI+xvge9zsOLkRaAD06H4PuBWuffDV+ti4Qn+dtN1jypxpL5f0/K+hABrKJMwYB3nzL3
         gwIA==
X-Gm-Message-State: AFqh2kpg1qWmrGk+q2OKi+6f7qK+fyg6AaMpke7G/fFo5AzkbOMDPHUo
	otU87vl0QuaJNHDFZCnMDn+jnMlqOhds4O6JSEs=
X-Google-Smtp-Source: AMrXdXtITKV1GEzZUGw8o4hZYrm3xE7rzwglOkCyCS6dvoU42+tNPZuk7n1SqcT0pSWBE0jif78/CA==
X-Received: by 2002:a05:7500:2708:b0:ef:e2bd:52de with SMTP id bp8-20020a057500270800b000efe2bd52demr377632gab.16.1674068705177;
        Wed, 18 Jan 2023 11:05:05 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id u2-20020a05620a0c4200b006f9f3c0c63csm23043568qki.32.2023.01.18.11.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 11:05:05 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id v19so33465945ybv.1;
        Wed, 18 Jan 2023 11:05:04 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr846222ybg.202.1674068694405; Wed, 18
 Jan 2023 11:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org> <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2023 20:04:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZOsrBwJrST=49v6JFqCyq_gT0kfA-QS7TS4oigZtM-w@mail.gmail.com>
Message-ID: <CAMuHMdWZOsrBwJrST=49v6JFqCyq_gT0kfA-QS7TS4oigZtM-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Serge Semin <fancer.lancer@gmail.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Li-hao Kuo <lhjeff911@gmail.com>, Michal Simek <michal.simek@xilinx.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?4oCaZWNraQ==?= <rafal@milecki.pl>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Parshuram Thombare <pthombar@cadence.com>, 
	Leilk Liu <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>, 
	Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>, 
	Birger Koblitz <mail@birger-koblitz.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anson Huang <Anson.Huang@nxp.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Kuldeep Singh <singh.kuldeep87k@gmail.com>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Erwan Leray <erwan.leray@foss.st.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_110507_162664_70D2BA26 
X-CRM114-Status: GOOD (  18.38  )
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

On Wed, Jan 18, 2023 at 6:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
>
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

