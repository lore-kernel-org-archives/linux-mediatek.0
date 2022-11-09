Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7652C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 02:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSs9bG/LbFf1fIR0eapTeL6P50DjYrAFt1f1UPagmkc=; b=UQNS3fsAzCxkTw9NI+HtZXWT01
	Hy9sVwCtuAwRB6uRgmddYa/ceR8/WFV7QoO7u6VAMT9R+jBMLxRqzpZuc/3RFY9KF6uY/E8dNvMUm
	k9ljknukf+EShwZ1kln6MOBaHrpziIW1ps1st1z5zWjCfH13S+2Qlti4g5ZLUz8J8g0UzhB+5Bt6U
	qyU9+9yUX8mpfJgOEpwS/904LtGszzrDONigUs/zboGEC+dhKC8S48aNjoOoAnxEwZPlne66fLB/y
	fAQ8pXtbQfPCe0inm8ANS/XCl3AM8QTwduMmrzqzIrNaMc68bOBJ94TZOqB+nPTdrPhynUYQmvGim
	vjWu84DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osb4X-00A40E-4v; Wed, 09 Nov 2022 02:44:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osb4T-00A3vt-Qf; Wed, 09 Nov 2022 02:44:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id i21so25268920edj.10;
        Tue, 08 Nov 2022 18:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSs9bG/LbFf1fIR0eapTeL6P50DjYrAFt1f1UPagmkc=;
        b=fm3R7eHwEY7icgp5E36AR1x+G3iJ/B+gTC6qXXcb2VuX8T7PYbpIOMaEAEk+z5gP5C
         C30KcgR4lm806IYQfNeeuFx0cfGof3DpzdH786/cCDzuWrdeUNc7jFOrL5vMwTo9Vbtm
         dVxBVDI57pb7BVYvuH3eLaJ4JjrtQb9xL2MZ41TI7RBi2z65S87p9zWDePR0yCVz6VHw
         JOVSi+JRNqY3PBDz9qa44qLlWzFaPdXGRa4GRcfXuEi5nSYmnCJ6Zyk7dG4zjutSYT5H
         vN2MmXbmOeI+y4HkZpv6Bi0bN99D9Nar9mmN1KGg/88Sfc9R8fV6gzM/jPxbXATFIa/1
         F+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSs9bG/LbFf1fIR0eapTeL6P50DjYrAFt1f1UPagmkc=;
        b=r1DmTliKagkKfAJ2GKz6HOp2HVBkNw2hm/2spTPIDW0oR93iT+CY7T5+4O9Y19aftE
         9kt+J5ucJY3Agi5sIf6O/Eh2V/B3OUkj6kAt/bDjkE8nxlAAyKUtvUY5YZtCnb5uPstG
         ucBNxDOD/RUyQPH+GZ/MfIKEubAJwB9gI52TMo5J9fEDdrswkedOmKREjARXv2mnuaNq
         LMl9u8TfR5mpA7Z8w+l2NH0T9t5RTlYoeYedrokourwSF6c0vx1aFjPKhGK72DPkxpXa
         wz4OM/kOHDDVtDDvmZYr5PE+DwIkuKhwhEYqg6UgKajrtJgGHSu8IK5ePSH02RVAxHY7
         wlqw==
X-Gm-Message-State: ACrzQf3r9Yxo5yyWHGah8yvFX0teH2pnuFJ+lhIOrE5JdkRGSaiITqA6
	Yaz10W2t4/1iv6seMMFoAKUko5Z3m2vzl15eID4=
X-Google-Smtp-Source: AMsMyM4o96Fp/fgGe8bWp9qyaCLc1d6jcauj7urZdaiQjIItG7q8RJuK4x04Dncd47Xu2Mogx93A97DsfgYY/BWPass=
X-Received: by 2002:a05:6402:3806:b0:450:bad8:8cd5 with SMTP id
 es6-20020a056402380600b00450bad88cd5mr59725933edb.305.1667961844484; Tue, 08
 Nov 2022 18:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech> <20221018-clk-range-checks-fixes-v2-58-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-58-f6736dec138e@cerno.tech>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 9 Nov 2022 10:43:26 +0800
Message-ID: <CAAfSe-t96pttpdLjLYntof5JCNcVHg0fMckk6zC7YHRRceDw+A@mail.gmail.com>
Subject: Re: [PATCH v2 58/65] clk: sprd: composite: Switch to determine_rate
To: Maxime Ripard <maxime@cerno.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Michael Turquette <mturquette@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Manivannan Sadhasivam <mani@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
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
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_184409_891147_8BD8DAE8 
X-CRM114-Status: GOOD (  32.92  )
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

On Fri, 4 Nov 2022 at 21:33, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Spreadtrum composite clocks implements a mux with a set_parent
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
> The driver does implement round_rate() though, which means that we can
> change the rate of the clock, but we will never get to change the
> parent.
>
> However, It's hard to tell whether it's been done on purpose or not.
>
> Since we'll start mandating a determine_rate() implementation, let's
> convert the round_rate() implementation to a determine_rate(), which
> will also make the current behavior explicit. And if it was an
> oversight, the clock behaviour can be adjusted later on.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> ---
>  drivers/clk/sprd/composite.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
> index ebb644820b1e..d3a852720c07 100644
> --- a/drivers/clk/sprd/composite.c
> +++ b/drivers/clk/sprd/composite.c
> @@ -9,13 +9,19 @@
>
>  #include "composite.h"
>
> -static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *parent_rate)
> +static int sprd_comp_determine_rate(struct clk_hw *hw,
> +                                   struct clk_rate_request *req)
>  {
>         struct sprd_comp *cc = hw_to_sprd_comp(hw);
> +       unsigned long rate;
>
> -       return sprd_div_helper_round_rate(&cc->common, &cc->div,
> -                                        rate, parent_rate);
> +       rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
> +                                         req->rate, &req->best_parent_rate);
> +       if (rate < 0)
> +               return rate;
> +
> +       req->rate = rate;
> +       return 0;
>  }
>
>  static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
> @@ -53,7 +59,7 @@ const struct clk_ops sprd_comp_ops = {
>         .get_parent     = sprd_comp_get_parent,
>         .set_parent     = sprd_comp_set_parent,
>
> -       .round_rate     = sprd_comp_round_rate,
> +       .determine_rate = sprd_comp_determine_rate,
>         .recalc_rate    = sprd_comp_recalc_rate,
>         .set_rate       = sprd_comp_set_rate,
>  };
>
> --
> b4 0.11.0-dev-99e3a

