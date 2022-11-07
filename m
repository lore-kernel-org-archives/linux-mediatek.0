Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1318AC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLKOOl0yo7YI7pAdrLyTR/NQWG7rhWdAq87I8wp+XOk=; b=Lqlt6ofQ7Pb1cdJJ0q0COsGIrv
	Vpl+dAIC/9cxiY+hpSn+Hh7c72Vo4G8cQ8Cywhhp8KP1+6Pq77hKe9RWDmYxr8ROwtRh82+dsmnDA
	9sMkV48uyNaWIa/CrdilmLbvRkrjH0wyjwESya+xxrsVst8lQH9/AXqqW7/7D1ixrqOLTM+qbmLkr
	FXYDB90lYoblnQQVA6M5BVjQkF7771sEEfg5Mg4+/mj0oHhQ1zTlNvsAOznmD0WbudTqjjWO+4fJF
	9sLyRkVLnN9vsurs5+bUlm3w1b/8ghlMx0jnwAqogJOyztULPOo7bJG5rbpzW5Fw4i6L/JKWnz96k
	A9C3WnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwvh-00Ckx5-Oq; Mon, 07 Nov 2022 07:52:25 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwve-00CkNs-IO; Mon, 07 Nov 2022 07:52:24 +0000
Received: by mail-oi1-f173.google.com with SMTP id l127so11303244oia.8;
        Sun, 06 Nov 2022 23:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLKOOl0yo7YI7pAdrLyTR/NQWG7rhWdAq87I8wp+XOk=;
        b=Mp42spz/zDTazHphj2S1wSQ+DPH4cwh072WkPreMhPebH6gzI4yvg8G3+A+2KWx3Po
         qsCQhOhqIuHYYahSp4Qd9nUX/bFsKNcFmrxERB5hUcSNnzCxueQmKr8vbwg2bhT90B6k
         f5C7EhePToe8hhyCEgbWqfXuLMDsTII4r2LApQV7Iq9DITKLVw7hDrh0Jjv7s0r7wGIc
         m01/jJ6ok2rj+dpJ6LtIHEZuFVHDeulIZVI9jWtwe1EgNgKoCb1wj/WomE2FbE2MK8Ra
         RfBYneuJOzSaqBtQHuRC7G/HAUFFtNv+z1mfwxn18q9fK9ECOK+MH0mOAiyq5yOM+27u
         PZ2Q==
X-Gm-Message-State: ACrzQf2vpIctMHeAa+qCIF3SCJXy4n5qTs2oaDG2ktjJ9dqywHmlNk/b
	nGbl4m/Lt+k9MVZNFj58NWB6fge6+Bdd0Q==
X-Google-Smtp-Source: AMsMyM4Rp38hni7QQEwRBgDxaCi2A3FZ/V/8hlcJ6i9H2wHdcS54YEBFqFL1NPcIstp3HpEyF84/MQ==
X-Received: by 2002:aca:1c03:0:b0:359:c144:7f6 with SMTP id c3-20020aca1c03000000b00359c14407f6mr31351723oic.83.1667807539884;
        Sun, 06 Nov 2022 23:52:19 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id ca1-20020a056830610100b0066ca61230casm2171365otb.8.2022.11.06.23.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 23:52:19 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so6075632otl.3;
        Sun, 06 Nov 2022 23:52:19 -0800 (PST)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id n9-20020a819c49000000b0034a00de97b8mr45959924ywa.384.1667807529144;
 Sun, 06 Nov 2022 23:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech> <20221018-clk-range-checks-fixes-v2-28-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-28-f6736dec138e@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2022 08:51:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXee3Xf8G53anCq-4qfenHhgnMiyC1KhKo8Uv6-UV_jrw@mail.gmail.com>
Message-ID: <CAMuHMdXee3Xf8G53anCq-4qfenHhgnMiyC1KhKo8Uv6-UV_jrw@mail.gmail.com>
Subject: Re: [PATCH v2 28/65] clk: renesas: r9a06g032: Add a determine_rate hook
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
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>, 
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
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Gareth Williams <gareth.williams.jx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_235222_638963_C0F36289 
X-CRM114-Status: GOOD (  31.38  )
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

CC Gareth

On Fri, Nov 4, 2022 at 2:18 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Renesas r9a06g032 bitselect clock implements a mux with a set_parent
> hook, but doesn't provide a determine_rate implementation.
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
>
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
>
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
> index 983faa5707b9..70c37097ca6e 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -773,6 +773,7 @@ static int r9a06g032_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>  }
>
>  static const struct clk_ops clk_bitselect_ops = {
> +       .determine_rate = __clk_mux_determine_rate,
>         .get_parent = r9a06g032_clk_mux_get_parent,
>         .set_parent = r9a06g032_clk_mux_set_parent,
>  };
> @@ -797,7 +798,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *clocks,
>
>         init.name = desc->name;
>         init.ops = &clk_bitselect_ops;
> -       init.flags = CLK_SET_RATE_PARENT;
> +       init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
>         init.parent_names = names;
>         init.num_parents = 2;
>
>
> --
> b4 0.11.0-dev-99e3a

