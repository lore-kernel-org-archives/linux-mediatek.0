Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D8BC7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YDU8IzF0EsSpDkzRDjzs/d7Q1NfYw1Ou2xNB8kfdm8=; b=zp/PAAY3/NdZ6tCvafZXzqECDc
	+lctAjmEkFwPQScyCaAblUpboj1Oz45vNI4Gcjk/5wrS0udMGDjkYgvI1z4wowMpRI/hB8nAWuj78
	3OC8r5s2Hv09RLwCOdQ7cgg2+LFLHkf6DX0En8mCvD22xtq3+we24leQOFxnR1ayfe6JagpRS35ag
	2iVwRkkX7bh/5xaTgIYxSiLh/MI81CqkhD5gKpRHaObC96vh0lsd6+FoXB+tt0QA5O7CTmo9mcLm6
	Zz40sHt4StXsC73ou5pWZETYK3FO8W4Fd+YGbX9cgoUFTXx/zgq/bqMqwKD3tWNuhzy7anBHf5Zgq
	5YweQFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peASK-008L41-1V;
	Mon, 20 Mar 2023 08:01:24 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peASH-008L3J-1r;
	Mon, 20 Mar 2023 08:01:23 +0000
Received: by mail-qt1-f171.google.com with SMTP id c10so894914qtj.10;
        Mon, 20 Mar 2023 01:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679299276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YDU8IzF0EsSpDkzRDjzs/d7Q1NfYw1Ou2xNB8kfdm8=;
        b=yzW5HqODszzZ5DqS3i4oUNHY9MsszLeDUxDT+sCs8TWZwZH6+KYKAjJ8xa/Ij2/WQv
         34Hlzu39yEg3nBn6VxCkbH03T8LnJ+YHoFdXbEtPi8ZxRGw6+yzZhD4p9PjaE3iwVdA7
         1nXk8cM+ogYNDgfa6V4JyUyWuFyIZb24xa0bXnV+piaelX7ktzJBEPRiAt5F6LCviNqA
         jveZdiRuuQDLhnl+t1J5XhxrAiziR+VghvyBSsdHtspBW0XspS95lPW2TCI5u8H2Hd1c
         V6RiscWrFi13/Saizrnhn6RSYsg+lTcIxdx6qxGKgIYcvWs/0sXvwoABNhE/H3UpBMop
         1Cdw==
X-Gm-Message-State: AO0yUKUEZTU+1OBflZwMqZsFGTpvGv1xdaoSsj6kaIf+FStzSnoqtkrV
	gPW0ofHvCvAWQPyQOylMyLW/L5Hh0ovBRw==
X-Google-Smtp-Source: AK7set9jihBmEMOCg2Npts+vugkN9dvU9cgaSOU7tOIyLer53+gKQH+T3aJGg0Au1xhcy5gu77QUuw==
X-Received: by 2002:ac8:5792:0:b0:3e0:d161:29ad with SMTP id v18-20020ac85792000000b003e0d16129admr4775187qta.28.1679299276653;
        Mon, 20 Mar 2023 01:01:16 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id b13-20020ac844cd000000b003b8484fdfccsm5990418qto.42.2023.03.20.01.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 01:01:15 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5416b0ab0ecso209454247b3.6;
        Mon, 20 Mar 2023 01:01:14 -0700 (PDT)
X-Received: by 2002:a81:e508:0:b0:544:5fc7:f01f with SMTP id
 s8-20020a81e508000000b005445fc7f01fmr9057012ywl.4.1679299274592; Mon, 20 Mar
 2023 01:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org> <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com> <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
In-Reply-To: <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Mar 2023 09:01:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgWne0goeJ3A1=v8FZCz3hmHC2j_UEYPn51gD1jz-9uA@mail.gmail.com>
Message-ID: <CAMuHMdVgWne0goeJ3A1=v8FZCz3hmHC2j_UEYPn51gD1jz-9uA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for testing DT
 property presence
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230320_010121_640444_856F7F94 
X-CRM114-Status: GOOD (  34.27  )
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

Hi Linus,

On Sun, Mar 19, 2023 at 9:55=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Mon, Mar 13, 2023 at 12:00=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Mar 13, 2023 at 10:00=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Fri, Mar 10, 2023 at 3:56=E2=80=AFPM Rob Herring <robh@kernel.org>=
 wrote:
> > > > It is preferred to use typed property access functions (i.e.
> > > > of_property_read_<type> functions) rather than low-level
> > > > of_get_property/of_find_property functions for reading properties. =
As
> > > > part of this, convert of_get_property/of_find_property calls to the
> > > > recently added of_property_present() helper when we just want to te=
st
> > > > for presence of a property and nothing more.
> > > >
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/pinctrl/renesas/pinctrl.c
> > > > +++ b/drivers/pinctrl/renesas/pinctrl.c
> > > > @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinc=
trl_dev *pctldev,
> > > >          * inside a subnode nor across subnodes.
> > > >          */
> > > >         if (!pmx->func_prop_name) {
> > > > -               if (of_find_property(np, "groups", NULL) ||
> > > > -                   of_find_property(np, "pins", NULL)) {
> > > > +               if (of_property_present(np, "groups")||
> > > > +                   of_property_present(np, "pins")) {
> > > >                         pmx->func_prop_name =3D "function";
> > > >                         pmx->groups_prop_name =3D "groups";
> > > >                         pmx->pins_prop_name =3D "pins";
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > This check is used to auto-detect if the standard property names
> > > should be used, or the "renesas,"-prefixed ones.
> > > As the last users of the latter were removed from DTS in v4.10,
> > > perhaps I should just remove these checks instead?
> >
> > Sent a patch just doing that, so you can drop this chunk.
> > https://lore.kernel.org/linux-renesas-soc/ff9c14781110bbf19b56b45dd1f01=
e6da90319ad.1678704441.git.geert+renesas@glider.be
>
> So I need a new version of this patch before I can apply it
> I guess, or there will be conflict with Reseas stuff?

It would be a minor conflict, though, and you would have to resolve
that yourself, when merging my renesas-pinctrl PR.  So when you
will send a PR to The Other Linus, there won't be a conflict anymore,
and no angriness ;-)

Thanks!

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

