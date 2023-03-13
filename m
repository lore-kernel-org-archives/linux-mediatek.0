Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62500C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JRXZxwFQvV/9ugP2yIyDpmVR7lwS7JaHigMB2zQJQQ=; b=uPSvqlYKNxj4X05DAMNpkxpe4g
	qt7gNzlPR1c297QZCIP1YU79MKDsnsFrS6bGEG840ml/KM80VOptWA25x0XiKtE/249QPkgxRzZwn
	I/8Ca8BXfzA035LHaLQd7wsrxaTfd2+FIYV1z4LDAqvnld0nVFSc5Fb7kBG9XTmqlfM6wwcwX5UmH
	gYNZoC1sRfB7iOt79XafLQoGRM0ZEJsJroq6aZ+oaQr+WG7udJoYRx/P2AzqFIhq5HvoMoqkNw6WE
	j2DJCNlUyqlGSr70VyBPj8ByVqnXC8vu/Y5MYjp3cKg4kSN+erGSmi1Zp3m1s4kLXrlsqiRQbkBgo
	MA88HuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbfuj-005J0h-5R; Mon, 13 Mar 2023 11:00:25 +0000
Received: from mail-qv1-f50.google.com ([209.85.219.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbfuc-005Ixg-Ia; Mon, 13 Mar 2023 11:00:23 +0000
Received: by mail-qv1-f50.google.com with SMTP id jl13so3985585qvb.10;
        Mon, 13 Mar 2023 04:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678705216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JRXZxwFQvV/9ugP2yIyDpmVR7lwS7JaHigMB2zQJQQ=;
        b=tYwuC+1L29yUHZRkIDwhNcS3ZVwJNtHlAaHRRsYYx1aJTlQIMykj6ZTdE5ctV/4AJu
         92bJDkpCUzSat23LnujoJjZBiGwAvJXEc9GhUxZ/isi8qXdBVJgXUO4fVtXSHNoGiggN
         V6cX4uItCAi9JWp3ZbIj+gisN8N3Dnt5DA+d8TD9+Wk9gNveNbJUcpToAzhAgry/a3f+
         cM54jkULqveiM48P0YKu7bF00JbKiJ4+CttIJ7GwaFXX56cnF/idoJkZ/KDQYVpI+5vT
         PZLs6FeOQx9kFemyg3dkRE88P+UW8Nyx8e1Wu+U7QfVBkQaafMqDibDMefoQAXC/Tfm7
         TeLQ==
X-Gm-Message-State: AO0yUKXUACr/+MwMIEl+Ms7bTG26XfeVz9xLcD8RVX36q4NC684AQ+k2
	42XVOMMuaPBCjv53MWq6/9V3BDUR+xKvGA==
X-Google-Smtp-Source: AK7set/NbcqVlQlKxyCT8DZlQuUcXl1NvPKLeqW/Xz1rSwVmHedXPxXKOaxhwf6zs/N8RAoYMYDZJg==
X-Received: by 2002:a05:6214:300e:b0:56e:ff20:57c2 with SMTP id ke14-20020a056214300e00b0056eff2057c2mr10210893qvb.10.1678705215907;
        Mon, 13 Mar 2023 04:00:15 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id dt37-20020a05620a47a500b007343fceee5fsm5175014qkb.8.2023.03.13.04.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 04:00:14 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-540cb2fb5b9so129486467b3.3;
        Mon, 13 Mar 2023 04:00:14 -0700 (PDT)
X-Received: by 2002:a0d:ec14:0:b0:544:4008:baa1 with SMTP id
 q20-20020a0dec14000000b005444008baa1mr452333ywn.4.1678705213702; Mon, 13 Mar
 2023 04:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org> <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Mar 2023 12:00:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
Message-ID: <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230313_040018_636242_2A06FDD6 
X-CRM114-Status: GOOD (  27.35  )
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

On Mon, Mar 13, 2023 at 10:00=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Mar 10, 2023 at 3:56=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > It is preferred to use typed property access functions (i.e.
> > of_property_read_<type> functions) rather than low-level
> > of_get_property/of_find_property functions for reading properties. As
> > part of this, convert of_get_property/of_find_property calls to the
> > recently added of_property_present() helper when we just want to test
> > for presence of a property and nothing more.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl.c
> > +++ b/drivers/pinctrl/renesas/pinctrl.c
> > @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_=
dev *pctldev,
> >          * inside a subnode nor across subnodes.
> >          */
> >         if (!pmx->func_prop_name) {
> > -               if (of_find_property(np, "groups", NULL) ||
> > -                   of_find_property(np, "pins", NULL)) {
> > +               if (of_property_present(np, "groups")||
> > +                   of_property_present(np, "pins")) {
> >                         pmx->func_prop_name =3D "function";
> >                         pmx->groups_prop_name =3D "groups";
> >                         pmx->pins_prop_name =3D "pins";
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This check is used to auto-detect if the standard property names
> should be used, or the "renesas,"-prefixed ones.
> As the last users of the latter were removed from DTS in v4.10,
> perhaps I should just remove these checks instead?

Sent a patch just doing that, so you can drop this chunk.
https://lore.kernel.org/linux-renesas-soc/ff9c14781110bbf19b56b45dd1f01e6da=
90319ad.1678704441.git.geert+renesas@glider.be

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

