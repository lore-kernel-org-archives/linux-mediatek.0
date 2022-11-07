Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B02CC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 20:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:In-reply-to:Subject:Cc:To:From:
	References:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNuIDh9+z0CfhmCPEaKB/O13kWB7hEyf2+U7jlAoSUM=; b=NX8KuoVtApMs+O+VEYuu33rnOY
	Kg4yyN6Y32DI9OQbHdKuXahf1P6Vsjaw+Nnf90m2J5JXXuBBSVvrU/emKb2JUyehMdvmk80vsTli2
	AEnLvP7oFcvQTcNKjBIcMxYowSCh47bdPXvo2VZeKIEiLI0KYVQn7xSwB8+L6ZWL+22J9xPabTpea
	Ip6OuWFofcxUW5qmvEMIHe1ls2+tONt/joVPY877iQB1nBDSAqxU6+ttG00S6DJiKgMoAf4cBQzB0
	zAe4hbD+8KAD4aDfBu21UKbYWViTDSJHzFnzbdJ3c1DSgEI+EVgkEA1G5J6uaFXH3rCZ7AKUyFj4U
	Qe/M2uEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9BQ-000Sfv-UI; Mon, 07 Nov 2022 20:57:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9BO-000SbN-2b; Mon, 07 Nov 2022 20:57:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id bs21so18049638wrb.4;
        Mon, 07 Nov 2022 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:references:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNuIDh9+z0CfhmCPEaKB/O13kWB7hEyf2+U7jlAoSUM=;
        b=PMUoELhE6AnXK+iNbgb6rPTOJPEKsFgBujXqxbWpgwA5fYf4gBdL2QEZ7s38On6Pdv
         tEvNrpWkJH7345NtNVL6P6neZYoOwCet4Y628+aQE5juJnavU3qBi7KlO1rk5DAUAUOq
         438HwMs8JiemVJnEaCYxBD3fJBcnKF+Ec4ElTT2rACGgYIzmW6zjKAQjhVEt1OoUDQVI
         vKeu2GP4yAVneediojKblkMb81j+Ywo5HajTIEQtgDumphUC4m8/Zrw4Q3MU5M1r0ziT
         8aiG4DnxTEwp4bvltkVyz/XtyJfkf0wefxRxSHxi02sFECEhyFppC6IqlBS76u0z4eLR
         9SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:references:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xNuIDh9+z0CfhmCPEaKB/O13kWB7hEyf2+U7jlAoSUM=;
        b=CgXD/8avJjUP/7SA55CCTUc8Yr4BeYlx2GNuMRyyOFzhHuK5+pQyyoa8LqzwQgaq09
         qG+rw05jVb5vCi5pqvkY2cCFl/2ZdXiIdKzA+OCqi9F5hsEdXkxh/tQtskxCNNFET2NK
         8Q/S+cywP8mP6QubCXGJcpWQq4dNHXn46WJC6ZoS3nmHMNu9RTHCkFXOtibFIxPuNHB+
         wk5Pwn0PngoX811keW45+TMQH+iF9cu+kitCC+djvJUDCMrL45jaJPA5//dvSR/SzbKt
         GzQQjFOqCVCnZQXIuzaaavHt/nX8gue/QN11QFZt3fAHFAjbOiDDojw/Ue/DCDaW4YZs
         qO3A==
X-Gm-Message-State: ACrzQf1TsZUAWBWGXUxxe/7bOWwfDFzXLETnqvmIs2hG/ddeSdLcYiQ0
	kadlWgs+24oUJI/B5qe6zgo=
X-Google-Smtp-Source: AMsMyM68KhRfPQSDi8CFA78pakjxRAM3L6JCB7fc1yr/DnXKn9yQG4njsjQsXjAXYrNXUB9CMb72nw==
X-Received: by 2002:a5d:4ec1:0:b0:22e:435c:1e0f with SMTP id s1-20020a5d4ec1000000b0022e435c1e0fmr633954wrv.200.1667854640408;
        Mon, 07 Nov 2022 12:57:20 -0800 (PST)
Received: from localhost (188.28.3.103.threembb.co.uk. [188.28.3.103])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bca41000000b003c6c3fb3cf6sm9173176wml.18.2022.11.07.12.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 12:57:19 -0800 (PST)
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Paul Cercueil <paul@crapouillou.net>, Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Vetter <daniel@ffwll.ch>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette
 <mturquette@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Jonathan Hunter
 <jonathanh@nvidia.com>,
 Abel Vesa <abelvesa@kernel.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, Orson Zhai
 <orsonzhai@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sekhar
 Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>, David
 Airlie <airlied@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>, Max Filippov
 <jcmvbkbc@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-stm32@st-md-mailman.stormreply.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
In-reply-to: <20221107085417.xrsh6xy3ouwdkp4z@houat>
Date: Mon, 07 Nov 2022 20:57:22 +0000
Message-ID: <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_125726_145046_D0FD9AD8 
X-CRM114-Status: GOOD (  48.80  )
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


Maxime Ripard <maxime@cerno.tech> writes:

> Hi,
>
> On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
>>
>> Maxime Ripard <maxime@cerno.tech> writes:
>>
>> > Hi Paul,
>> >
>> > On Fri, Nov 04, 2022 at 02:31:20PM +0000, Paul Cercueil wrote:
>> >> Le ven. 4 nov. 2022 =C3=A0 14:18:13 +0100, Maxime Ripard <maxime@cern=
o.tech> a
>> >> =C3=A9crit :
>> >> > The Ingenic CGU clocks implements a mux with a set_parent hook, but
>> >> > doesn't provide a determine_rate implementation.
>> >> >
>> >> > This is a bit odd, since set_parent() is there to, as its name impl=
ies,
>> >> > change the parent of a clock. However, the most likely candidate to
>> >> > trigger that parent change is a call to clk_set_rate(), with
>> >> > determine_rate() figuring out which parent is the best suited for a
>> >> > given rate.
>> >> >
>> >> > The other trigger would be a call to clk_set_parent(), but it's far=
 less
>> >> > used, and it doesn't look like there's any obvious user for that cl=
ock.
>> >> >
>> >> > So, the set_parent hook is effectively unused, possibly because of =
an
>> >> > oversight. However, it could also be an explicit decision by the
>> >> > original author to avoid any reparenting but through an explicit ca=
ll to
>> >> > clk_set_parent().
>> >> >
>> >> > The driver does implement round_rate() though, which means that we =
can
>> >> > change the rate of the clock, but we will never get to change the
>> >> > parent.
>> >> >
>> >> > However, It's hard to tell whether it's been done on purpose or not.
>> >> >
>> >> > Since we'll start mandating a determine_rate() implementation, let's
>> >> > convert the round_rate() implementation to a determine_rate(), which
>> >> > will also make the current behavior explicit. And if it was an
>> >> > oversight, the clock behaviour can be adjusted later on.
>> >>
>> >> So it's partly on purpose, partly because I didn't know about
>> >> .determine_rate.
>> >>
>> >> There's nothing odd about having a lonely .set_parent callback; in my=
 case
>> >> the clocks are parented from the device tree.
>> >>
>> >> Having the clocks driver trigger a parent change when requesting a ra=
te
>> >> change sounds very dangerous, IMHO. My MMC controller can be parented=
 to the
>> >> external 48 MHz oscillator, and if the card requests 50 MHz, it could=
 switch
>> >> to one of the PLLs. That works as long as the PLLs don't change rate,=
 but if
>> >> one is configured as driving the CPU clock, it becomes messy.
>> >> The thing is, the clocks driver has no way to know whether or not it =
is
>> >> "safe" to use a designated parent.
>> >>
>> >> For that reason, in practice, I never actually want to have a clock
>> >> re-parented - it's almost always a bad idea vs. sticking to the paren=
t clock
>> >> configured in the DTS.
>> >
>> > Yeah, and this is totally fine. But we need to be explicit about it. T=
he
>> > determine_rate implementation I did in all the patches is an exact
>> > equivalent to the round_rate one if there was one. We will never ask to
>> > change the parent.
>> >
>> > Given what you just said, I would suggest to set the
>> > CLK_SET_RATE_NO_REPARENT flag as well.
>>
>> Ideally there should be a way for drivers and the device tree to
>> say, "clock X must be driven by clock Y", but the clock framework
>> would be allowed to re-parent clocks freely as long as it doesn't
>> violate any DT or driver constraints.
>
> I'm not really sure what you mean there, sorry. Isn't it what
> assigned-clock-parents/clk_set_parent() at probe, plus a determine_rate
> implementation that would affect best_parent_hw would already provide?

Assigning the parent clock in the DT works once, at boot, but going off
what you wrote in the commit message, if the clock driver has a
.determine_rate() implementation that *can* reparent clocks then it
probably *will* reparent them, and the DT assignment will be lost.

What I'm suggesting is a runtime constraint that the clock subsystem
would enforce, and actively prevent drivers from changing the parent.
Either explicitly with clk_set_parent() or due to .determine_rate().

That way you could write a .determine_rate() implementation that *can*
select a better parent, but if the DT applies a constraint to fix the
clock to a particular parent, the clock subsystem will force that parent
to be used so you can be sure the clock is never reparented by accident.

>> That way allowing reparenting doesn't need to be an all-or-nothing
>> thing, and it doesn't need to be decided at the clock driver level
>> with special flags.
>
> Like I said, the default implementation is already working to what you
> suggested if I understood properly. However, this has never been tested
> for any of the drivers in that series so I don't want to introduce (and
> debug ;)) regressions in all those drivers that were not setting any
> constraint but never actually tested their reparenting code.
>
> So that series is strictly equivalent to what you had before, it's just
> explicit now.
>
> If you find that some other decision make sense for your driver in
> particular cases, feel free to change it. I barely know most of these
> platforms, so I won't be able to make that decision (and test it)
> unfortunately.
>
> Maxime

That's OK, I didn't review the patch, I'm just making a general
suggestion. :)

