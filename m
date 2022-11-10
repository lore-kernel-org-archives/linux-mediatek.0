Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840E7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 11:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZWp2kHBH7BxTK24vYMYaWuh8ES61v4HZQKkOxWH97c=; b=J/e1BpXtsCWRi3a8IvnT+qr3b2
	KmR/VQ64hyit9hwqlZJUf9a+rdeb/8GJJ9dLMphl4VM5ea+6DcyZJ3V6H8LJhpSfBJIaCAUUqicnG
	hmcEj1yJ4TMkq/mcVQqCo65JAGjLXHrNo+AGco/FnLEnHtcD6zVFASjv6X3+rmvATTWtFkiIGaNzF
	FiGuC1A0eSpPSCUBTQR1P1gkNcNTj/gup6An8RUmcH2XH1xoYmEoSZDproLUFEsVU5Uphjrxo5VuG
	uyOgLrfP/ZQzCDQiycei0V5xp9BtK2Jy0OwOrMcFWjEtx331/Nw5Hd+dlVX9TM7tF/LaKc4nZugHI
	FTB5Sogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot616-005UTy-FP; Thu, 10 Nov 2022 11:46:44 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot5kG-005MYr-LD
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 11:29:24 +0000
Received: by mail-pf1-x433.google.com with SMTP id k22so1767519pfd.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 03:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dZWp2kHBH7BxTK24vYMYaWuh8ES61v4HZQKkOxWH97c=;
        b=nm5AzPUP/c5SxnOWRF0E8OOs8vIUdOgDjB6wYkEQYpfYDRuGKSxS+CBIeuds7UEokj
         CAc3O4M3Lzp0CmH9uvJ+chSuCz2e7UtgkMxDMXFmH0EFBdC81NQcL56cIa/e5fTzyvWS
         kSegvkcOyKB6FEauX3mSzkzzDIAUq5r5SATzN3WmVSBqg1jyg/gg0kYs06KdBSG3zxV/
         fvTxGa1dt18Ruz+5BEtQasGBTHQrEp0wpReAHWWGdK+pWMVHzmdtTwn3mkonTWk309ZV
         x5RN6EKVnoWzvPKijsEeJPqRTGi+5rLHTCBxYP1D5lgzLbOuhL8arV0ezTVKJRNayIhr
         L9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZWp2kHBH7BxTK24vYMYaWuh8ES61v4HZQKkOxWH97c=;
        b=TNyTnAcQDMBxh8h8GfuleV/JY0ybMYACjp1wyrKuHB7+rBx2zM1EnQBxmjbMcr4u+v
         8AAvWr829sEW5GS8itx06P3mmvoziLNYgMV0Gnbkc7PituQljbo+zkKa3iOBMA8yOGNI
         WeeSmfActYmIb6v6jrtdPxvX3xlHkCzjAsieIDhE5uD/86ze6qMIpSHhCSgoleigohWL
         39ePUC+42/hFbBAvJW99S+ZxO34Qxu+kVKvGYCQEfcWCpxU5WkGiTrMMfYbAUzWDHoHk
         ARvM1SPEvNcdI9SepZ/SAZMdUwJXlEqJ3ZJpR34B3NLX2U60342jbPpI3Hb5gxD3NUIZ
         AFzQ==
X-Gm-Message-State: ACrzQf2EiXoFDnd788s26EQ9ZjHI1nBx6vy2HqZ7y7ZsIwsakByPkL61
	6SIG4a6hSLDNS7Z+ynU758pEusmLTdta7vhMAhZ3sA==
X-Google-Smtp-Source: AMsMyM4cuzpOD/TX9hqFyYyupcC8P3vPeFAFlSRm0wZ2MgnRUbZnV+cRg9A/mVHt7wBrkUdmfz48YahbcXukazUMnzc=
X-Received: by 2002:a63:4204:0:b0:442:ee11:4894 with SMTP id
 p4-20020a634204000000b00442ee114894mr2372631pga.595.1668079758533; Thu, 10
 Nov 2022 03:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech> <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Nov 2022 12:28:41 +0100
Message-ID: <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
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
X-CRM114-CacheID: sfid-20221110_032920_827734_5EC71D93 
X-CRM114-Status: GOOD (  34.67  )
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

On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
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

If I recall correctly, that is the use case we did target for these
types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.

Maybe there are some additional pieces missing from the old down
stream kernel, I don't have full picture, sorry.

Anyway, if I am not wrong, this was about supporting a low-power audio
use case, which requires us to switch the parent clock (to avoid
wasting energy).

>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

Yes, this was the reason.

As a matter of fact, I don't even recall that re-parenting was
possible through clk_set_rate() when this clock driver was introduced.
But, I might be wrong, it's quite a while ago.

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

Seems reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/ux500/clk-sysctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
> index 702f2f8b43fa..d36336665b6d 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -110,6 +110,7 @@ static const struct clk_ops clk_sysctrl_gate_fixed_rate_ops = {
>  };
>
>  static const struct clk_ops clk_sysctrl_set_parent_ops = {
> +       .determine_rate = __clk_mux_determine_rate,
>         .set_parent = clk_sysctrl_set_parent,
>         .get_parent = clk_sysctrl_get_parent,
>  };
> @@ -220,6 +221,7 @@ struct clk *clk_reg_sysctrl_set_parent(struct device *dev,
>                                 unsigned long flags)
>  {
>         return clk_reg_sysctrl(dev, name, parent_names, num_parents,
> -                       reg_sel, reg_mask, reg_bits, 0, 0, flags,
> +                       reg_sel, reg_mask, reg_bits, 0, 0,
> +                       flags | CLK_SET_RATE_NO_REPARENT,
>                         &clk_sysctrl_set_parent_ops);
>  }
>
> --
> b4 0.11.0-dev-99e3a

