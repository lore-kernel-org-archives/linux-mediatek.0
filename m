Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D73C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMjv67oqH0XcHnu1slnz7obBOYeNA0kXm4szuRMQips=; b=Jqv775X3sS0yDXLOBkFwMkQCHP
	6h2UuTlPQfe51ezXHs3BQX6EVgcnYt6Dswke0hO9e9cwbxVIaOWW9PHjJGzDyNDnhTg33+CehhtvN
	X9TFlmSpH5nt5Z0NSsgPdIWki5x9PxxYIclmm5mXO0n1KOOcNbwIuycMT4icNPSNWjwfxUJdwmcjb
	m2eYFmmezQgoxDg/q8UwoCUry7fkvnhrE8tRcRcL0siFxnv+UX/EdNMboDOMdxxJWFd7l8Q5WwcOh
	2mm2zO0SGyFe2wf3CZpFyWvrLGDxemeAsK1oUqDYXV5NoKbtRvdFw1LLh0ofdFI7+d6thZiSGl7id
	Ef4RKcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbe3J-004tTT-Ch; Mon, 13 Mar 2023 09:01:09 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbe3E-004tRu-NG; Mon, 13 Mar 2023 09:01:07 +0000
Received: by mail-qt1-f173.google.com with SMTP id c3so12367961qtc.8;
        Mon, 13 Mar 2023 02:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMjv67oqH0XcHnu1slnz7obBOYeNA0kXm4szuRMQips=;
        b=Q83OYJ6Qb2QoI2ICcva9tvbR9kDd4mVXSNc+jGefzyBy79S5lElVbRmWNnT4fbm0vh
         ezAYmD5Zr1lx/xAlXy1sbCS4ZvxQ5IdTcjdGokvbYmBSVAFJu+lOMEF77wi3SavKTvA2
         06JNgP8ILs45hT8ryx478XGGBsikCgPQcEOnJ1hmzekG7u0by/xijlUy/YLvwFlnWyDM
         V+6VRTPTl7Z2mhv0CALnCl7lx23j+xVG8N2AU8D3zgGH5kACtYiC+8bQBpF63FV7lRp+
         URJVzlknAvEGRPPl+CIdAEXHFRJWbxWs5WXZa56gb082z9lveOcR96GT3oqzQsWUURmJ
         yeVg==
X-Gm-Message-State: AO0yUKUqN2rjhC2yipu+II4MOfxjK3F744ieUvVQVG7CKYvVEInPCjM0
	ieKa28UxVlFy8HMIUIimXHqSCU1Zovr17g==
X-Google-Smtp-Source: AK7set80AJXh9UICb674q8PYU6iapHxSjdKGZUi2MACsAkB9/Jz336l6iJfQMzvepPnGvQDZvjkEZQ==
X-Received: by 2002:ac8:5d8b:0:b0:3bf:ba7c:29ca with SMTP id d11-20020ac85d8b000000b003bfba7c29camr18176758qtx.32.1678698061939;
        Mon, 13 Mar 2023 02:01:01 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id f3-20020ac80683000000b003a527d29a41sm5139069qth.75.2023.03.13.02.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 02:01:01 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id j7so150103ybg.4;
        Mon, 13 Mar 2023 02:01:00 -0700 (PDT)
X-Received: by 2002:a25:8b08:0:b0:b14:91e:4d19 with SMTP id
 i8-20020a258b08000000b00b14091e4d19mr14474451ybl.7.1678698060305; Mon, 13 Mar
 2023 02:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org>
In-Reply-To: <20230310144721.1544669-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Mar 2023 10:00:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
Message-ID: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for testing DT
 property presence
To: Rob Herring <robh@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_020104_871691_89F24FC1 
X-CRM114-Status: GOOD (  22.27  )
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

Hi Rob,

On Fri, Mar 10, 2023 at 3:56=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_de=
v *pctldev,
>          * inside a subnode nor across subnodes.
>          */
>         if (!pmx->func_prop_name) {
> -               if (of_find_property(np, "groups", NULL) ||
> -                   of_find_property(np, "pins", NULL)) {
> +               if (of_property_present(np, "groups")||
> +                   of_property_present(np, "pins")) {
>                         pmx->func_prop_name =3D "function";
>                         pmx->groups_prop_name =3D "groups";
>                         pmx->pins_prop_name =3D "pins";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This check is used to auto-detect if the standard property names
should be used, or the "renesas,"-prefixed ones.
As the last users of the latter were removed from DTS in v4.10,
perhaps I should just remove these checks instead?

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

