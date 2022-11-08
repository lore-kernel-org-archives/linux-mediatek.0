Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAE3C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 13:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIunjndO5rqOpIPjGIQJB4TuLtmFYebQ0fOsvPNeO54=; b=e+7yak7RNdipPFjZR8Hpe9E6hd
	iVNc5A8dynkM1s0dZzA0bDBWNaq/2MZd0jYpaL9vTFP1Xo/P+e0MVWfo1e97/EDSFJq2WZe/QGUPG
	514q68Xlae8VusPGqkI6h+n/Gq3f6bLeqDMjVo2N2SinLoNj8i+1c0q1szjk5Md54A3skrNPddNYd
	jgsZt6amPYPPARK5XaxqE8Uw3pA97JRlYx0BepbjO2zwkyqTghFLi8C3p5VrqVyb1Pv2Z+5lBU2t3
	yNeg8VgypSR2lgUlFMusPxUF9C/yn9eQH+JImeEAqCg8uFD3MHJWCCLymU4KaWAzCG7kFFDisiCzJ
	Eqd9ph6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osObQ-005bOp-3J; Tue, 08 Nov 2022 13:25:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osObN-005bMx-9c
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 13:25:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id q9so38694490ejd.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 05:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xIunjndO5rqOpIPjGIQJB4TuLtmFYebQ0fOsvPNeO54=;
        b=dY2KECnuVH7NYv0yOK7RrL62QdqUlhl2JmgS7xh7Aop7k+RcPrpLQgabXuGbHHpGQR
         eHydRYWR08BPIi0DGkFfFL5aziMJHQLfVfnBD+eU2h7KlhHzcO6P+1GLNOD4+iPtpIq9
         f+xJ7woffKNTUf34ylHgwFwugM0mjDy+MNR+/tosLv90DX21VaSDgG9tpTl2KCuCdJUO
         uOa6Dv9G/jILV/FYPlkjsMzVEJLK96Ug7G7tfkWymeifahO0bdSmcFGNxzhRtu8RVMPO
         uhbfFCJ4Ya/DrkwEqdNt0sBFZZ7Pau3qynHAmgL94y0H0QvBHa6kKlb7zVfFQiDHP0ks
         6ZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIunjndO5rqOpIPjGIQJB4TuLtmFYebQ0fOsvPNeO54=;
        b=0RRP9opXxfwhnRb3vVTp4TY477Ej50m0a9N991Wu+N8JtY+k27wk5gPUq0qnJJpKmL
         Exky30eZh2xDFIr2GIEdmP80iM7617qP+CBai7r5/uCefDJQO12riKC+KhWis7DUO1gl
         Aut/POpkzScbvPVGLEqYiiSoyhA9MC9ZL+8B73tL5Pan5NlTSK6TpbObZMlfUydz+Gtc
         Uwp93Ms8jnUqs5xlF7yRxHQ0jFommld/+A/yZqvRpDgkjpNMwHwgkcv9UTtzjSjGhMPI
         NJWptW4EM2UJ4LKMM49u8C2++fIXxZv+eMHqtqvpResqz4MZxI///Pa8NrT3+VewZv1/
         HOEA==
X-Gm-Message-State: ANoB5pnp9LCJ8OFMoIuxIfESnx+0C/G73/v1vgFimLy254FVyurLng+n
	iFRrL8UUsWOw6AegT59RxD8wRZwZWbINNhObHri71Q==
X-Google-Smtp-Source: AA0mqf68wWCeuB7GkTzw5Vcyy6luDq6tRlJuZOq+6MaYhZcTvhkBj9mitsGYltXA5OQs4b2+osg1ro8i402jh/hf0IY=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr11184945ejs.190.1667913915716; Tue, 08
 Nov 2022 05:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech> <20221018-clk-range-checks-fixes-v2-34-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-34-f6736dec138e@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 14:25:04 +0100
Message-ID: <CACRpkdYwM6X8bBABCisUGX=P4F=hcFb7QLT3Cu7XUWUvV4TE1Q@mail.gmail.com>
Subject: Re: [PATCH v2 34/65] clk: ux500: prcmu: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Michael Turquette <mturquette@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Samuel Holland <samuel@sholland.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Vinod Koul <vkoul@kernel.org>, 
	NXP Linux Team <linux-imx@nxp.com>, Sekhar Nori <nsekhar@ti.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Lechner <david@lechnology.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-stm32@st-md-mailman.stormreply.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-clk@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, 
	linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_052517_363429_7387EFE0 
X-CRM114-Status: GOOD (  20.59  )
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

On Fri, Nov 4, 2022 at 2:32 PM Maxime Ripard <maxime@cerno.tech> wrote:

> The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
>
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

It is actually set up from the device tree, typically like this:

/* clkout1 from ACLK divided by 8 */
clocks = <&clkout_clk DB8500_CLKOUT_1 DB8500_CLKOUT_SRC_ACLK 8>;

So the parent (source) and divisor comes in there.

clk->source and clk->divider is already set up when clk_hw_register() is
called.

So set/get_parent() is never used on clkout.

I think I just added the callbacks for completeness, should we delete them
altogether? The patch is probably fine as-is as well so
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

