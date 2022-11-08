Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294E9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/2yj1vtV3WtEYwU3cNvgg/PVgtVCmwn3eJn8jo49wk=; b=fBsYTVzg1tUKwag7jYl4DAyEfL
	8HsUKS+ujxKfXSn7De7Q+UH+inxWOecesLClKzGuzIRv7DYyuRGgLHYati23oO67OPIMIovAj4GxA
	9ILAc2mtSFlQpc8UAmQOBJFa+U+lW+Phpy9vsinowiXa9aQZ9JoiQz9Shxg8rZNAmvLLCLAf2+2dK
	UcRMD385XnqHeijLCcEoGSGvx5inYBSwppJQAdeVFVscnO9WMyaSf6eFYRd9gJmaiOR3s2OxWrgC3
	mGc0ho1agWgo0CaxwYUcfbDG/0tZOU15e9o+NPqbjh9+fQ16LQb5YWrTCkm53a6C4vrvZF3jnn0ZV
	7SomEy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOdP-005cEH-MX; Tue, 08 Nov 2022 13:27:23 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOdM-005cBG-CX
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 13:27:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ud5so38616044ejc.4
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 05:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N/2yj1vtV3WtEYwU3cNvgg/PVgtVCmwn3eJn8jo49wk=;
        b=VMnat+U1KSonabFKRPuR13L5JqFFcM/AvvqPUwa+9VtqcDpyz6Op4uI9k8fhWWUfgj
         OQMGyd7nBSVagfiyDveayuziCLNEcnxn2ErDoMUoLlpt3yo8/JHVhiTmfW1xUoXEQ8ch
         5jJZRKNOXfrIQxouT0FZtywu8oBKzwLv6/7PIprEyWb5tHAmIqyiFvsPphy4dzO+D1O/
         ByJEsT3p8EBbAPP+gKvFSCFRhufjqGSeVaHTdjl/xTUCo6crbpyBuirSVOUQflk15qBf
         1q39gU7+oVdTRiJwpV9lCujVgxFVrOBGfRo6fbxcreewXR1hDWvKWjF1rSAwPNJVX2jh
         IlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/2yj1vtV3WtEYwU3cNvgg/PVgtVCmwn3eJn8jo49wk=;
        b=Hr+A/AYggF+wxpDvj0yatlUoWwfR9Ax5Vlnv/TU4gYypxQeUA37a2Rw7o4BxUHXTFx
         IWZR47c7iSBOmNy7ISKbtD3qzsppgoC8dU0/6jFqFUEP+N6jz+L5lCrgosfakalPgt1u
         WcCXXX8FG8Yjc5mt8vUNOMrlDLdH7ouWiyz+EPleqjSONsdrzFyJO5zU5MQrrFGMVieK
         3kGNWP+WHYXfW25qMQfYFaVDLDqcUpI1kH8TzMWP6of5uk+W5CmcVjJJIkLMQxAJO2U0
         cIRv6Rbmlthx9UwfO2DO0D0np0a2eKF/WCEw9fy/BikySh1CnSEDMgFbHjeYDzpDkbyD
         tSOA==
X-Gm-Message-State: ACrzQf0QIePkRrC+ADszIMgel8JEyokwUsq8Xb1nOCM6Hm7AEVAH+9/M
	snVEVKcu+tnZ9uX1Y8EL+QfCxAuOsaMU3HNHs3IJQA==
X-Google-Smtp-Source: AMsMyM4SQlliAGfUpQoe5HVHzBogl+LIrkzKv8wyDOakcTA7xnKfY84HO6wUWBApVXLz+WmeEpt0AVEmstNop5fvJLQ=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr54058070ejw.203.1667914037645; Tue, 08
 Nov 2022 05:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech> <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 14:27:06 +0100
Message-ID: <CACRpkdaOM=T1pRJNK6hdc76m5tQfrjvF9nVBp7ZDf3wOMNSwyg@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
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
X-CRM114-CacheID: sfid-20221108_052720_446967_F5AA5162 
X-CRM114-Status: GOOD (  22.13  )
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

