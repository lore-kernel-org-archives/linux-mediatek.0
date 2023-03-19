Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE42C7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 20:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ac/NF/X3Ce1vR1hDDyKBTJ707og2BXuZP/lMQW+OCrs=; b=dHaOACiL7BfCFxBSM8Ep65UjNq
	Xvn+8hNPFCMGqWN+YOG93ZfZBjdChdSEmyQ7nB0PzT3pDTSLFSXmWuM9kao9bte4ELPP+mNOmKwml
	+LY2qbD+slongbpahzq6pIx/ncpFDkjpcyjPN7akW5S5TWwsvg7KDDEdmgud+oW2WuxglNg2StJRw
	PXpehMk/5XmvdHAgsfXMa1O4GD2U5d7lBIesvdMbAT7XOXI9D4QGkGXjTiHI2IFGE5sSIh+kTl2cd
	7X+q/dZpcF3wFulpx6QF2tHNH6+vAhgYhqwU+L5J2KTHe66NHpZbM1dXzJ5AZ3fuBpH3N5ADoZ6BK
	cWm3NSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe049-007Q5e-1Q;
	Sun, 19 Mar 2023 20:55:45 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe046-007Q4k-2i
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Mar 2023 20:55:44 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id k17so76790ybm.11
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Mar 2023 13:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac/NF/X3Ce1vR1hDDyKBTJ707og2BXuZP/lMQW+OCrs=;
        b=H/USSk17Fu5IdWFmU2HYEVwZ92SC2T/aL/5nOvlVpJeD0L0do87jcAsTliaBEz0MCA
         mMqeZBU9urZirZ7zxW11auSX7+tkHYp0K9XThAE/wLNlnvSVJ8GdNjd8zqxEnyfC6R+S
         bF0GNyNi0+l9Pp7ASmve9a2w4hwTf3i3d+4y1vux+85gQW4f0GI7kaHZLVj6jXu3zltE
         7jVl7Q6CBsq+1I5qhe0Ga3XfgMounIvMwgwAAF156gYYGaIPQ8+xRHnk/kIV9uZT6MuK
         aofXXYTTc5isXyhzb02mMH9GFNLJv1AQNxp4DslX98DqL+NC2qt8ieSTjsvVDSUikCvp
         WBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ac/NF/X3Ce1vR1hDDyKBTJ707og2BXuZP/lMQW+OCrs=;
        b=1eT924Unk0PS4P0O2yel7Buw6coeChW83B/aNIOJDMdI8nQJTEGCInB+8NtYT4i/kC
         9Ehzocuj2ZyyUPF15ZNt7JfORruTxoR3o2aHb9S9spSE25KBUXu45Jc264TRTo6WG8fi
         YcdIni6TUKud9uLBA3Tjkq9pYjGFwBAREFHCs94vdb2UCJYgSOfNYhRnvjUYBWJoTjR+
         rqIWCHPhbD4xoCVk4WtJGDmnRo2Y/sv3pCTyNvCl//Mqfrv0b+DPd1a5/qL8xVhKOV7c
         nJN6ZkOg3TKaAaKf9JL2txoAhtIP5nh0tGS1SWec8q7nbNcjpsUh+ZEh9lI3wyPN4xKT
         VJ/Q==
X-Gm-Message-State: AO0yUKWWJJt0vbhK7u+nEStYSyieNWAmd2qghgT25M2XK6XkjQZXyB/r
	Jrb5pGR2Yq6laulY7nyCNVPZ+YAb8uWlW5d2/yHbJt0U4mw91Uoz
X-Google-Smtp-Source: AK7set96jMMXsU1lpAmC3W40A6khl6vhFPSlLdYAPpPspd35ltaJhYbiXGg5BwG99gy+Dk9b8AqTCwMdTjF2Un45KI0=
X-Received: by 2002:a05:6902:110e:b0:b26:47f3:6cb with SMTP id
 o14-20020a056902110e00b00b2647f306cbmr3222772ybu.4.1679259340445; Sun, 19 Mar
 2023 13:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org> <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
In-Reply-To: <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 21:55:29 +0100
Message-ID: <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for testing DT
 property presence
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20230319_135542_877832_869C3AA0 
X-CRM114-Status: GOOD (  23.89  )
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

On Mon, Mar 13, 2023 at 12:00=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Mar 13, 2023 at 10:00=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Fri, Mar 10, 2023 at 3:56=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > > It is preferred to use typed property access functions (i.e.
> > > of_property_read_<type> functions) rather than low-level
> > > of_get_property/of_find_property functions for reading properties. As
> > > part of this, convert of_get_property/of_find_property calls to the
> > > recently added of_property_present() helper when we just want to test
> > > for presence of a property and nothing more.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/pinctrl/renesas/pinctrl.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl.c
> > > @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinctr=
l_dev *pctldev,
> > >          * inside a subnode nor across subnodes.
> > >          */
> > >         if (!pmx->func_prop_name) {
> > > -               if (of_find_property(np, "groups", NULL) ||
> > > -                   of_find_property(np, "pins", NULL)) {
> > > +               if (of_property_present(np, "groups")||
> > > +                   of_property_present(np, "pins")) {
> > >                         pmx->func_prop_name =3D "function";
> > >                         pmx->groups_prop_name =3D "groups";
> > >                         pmx->pins_prop_name =3D "pins";
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > This check is used to auto-detect if the standard property names
> > should be used, or the "renesas,"-prefixed ones.
> > As the last users of the latter were removed from DTS in v4.10,
> > perhaps I should just remove these checks instead?
>
> Sent a patch just doing that, so you can drop this chunk.
> https://lore.kernel.org/linux-renesas-soc/ff9c14781110bbf19b56b45dd1f01e6=
da90319ad.1678704441.git.geert+renesas@glider.be

So I need a new version of this patch before I can apply it
I guess, or there will be conflict with Reseas stuff?

Yours,
Linus Walleij

