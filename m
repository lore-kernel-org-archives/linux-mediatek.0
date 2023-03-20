Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66A7C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW+ePTJzJtil3OrFztV7sns2w07bRN+LWf2HToV3bfY=; b=oDHI2ilA+53sa668aHHDKFye2H
	cCvXb1OHbph7DZWOHIuT3iBNj/sdfaM6O7odTiIijJoJ8qPaRlHE/X1vvjOGzjVDyOIgM0yzpU+lV
	UXj4yrzzZCQ7goAFuWiNHF52Xdg5/h8h87FwO9PBG4AqHK/61wpeYNsXGtHIn4BwI7GlTDQ3GKvb2
	xk4eKYZYsv8jiTbHokMaux+SUA/RR3psXtx8j50hq9TBGO2sBOml0H/tyPl+2KT/5KzsepHrxJzUz
	gBYdNucEJYsi0cLKZS7XcVoYXoW43KofeUdmEWbEOxSM9eskwoZe5jsz9+dsjclSrNKuxeya7Ea+k
	ExVJwCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peK5B-00A7H0-2k;
	Mon, 20 Mar 2023 18:18:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peK58-00A7Fa-0j;
	Mon, 20 Mar 2023 18:18:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4162961786;
	Mon, 20 Mar 2023 18:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EC3C433A1;
	Mon, 20 Mar 2023 18:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679336284;
	bh=vWg765y10j4OS331b9rPl2+YrzmXue9TgKc5uUPg6SE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d0EShuTb90IYTui1Yvb5dTQm0ZdBzbLHwIdXjNMjBe1t4/PYzPQmrgKqZ9bAcsDOT
	 GKvGwIH+xdTtkmTMMyOdiGo67BhnrM2V4uBqV7oONOcdyRoGVLSzOWeKb2Y6Av8sgm
	 2Pve+TPBIQMb5xiNwMGaxCLrKdA9f+b/WGE+aWoeTJY8rDFmBkgqiyj8aY0/xrNc+W
	 7uTb9rrP+PCxabfTATj2ZosK1TWPRLrUv6rkGo+OwIfhgdb177MgnR8ndTccPIfYD1
	 pbEg99edRbwyz7LbDlOYQojGgNYi2hc0LoXGMB755eho1B412HFdkGcXJj9s1brLCw
	 h5MqK9ObmFgXg==
Received: by mail-ua1-f42.google.com with SMTP id x33so8537115uaf.12;
        Mon, 20 Mar 2023 11:18:04 -0700 (PDT)
X-Gm-Message-State: AO0yUKVLhiMqdEznwlJDAcM5VAW9Rk9PIH2bL6zJ/3GBDldBpEWZICx1
	Nlb5s797v8ttDYR+AcmII6lRbYAxeonP1oaUlA==
X-Google-Smtp-Source: AK7set9vhgJMbGJRf/P0PPWHB2mniWwp+5MfPmkCG1+Fia2Jvmr6Jhb32FMBmmkaSyyxxpPtHEVnEx5LGAkbE4I2Yng=
X-Received: by 2002:a1f:2982:0:b0:401:8898:ea44 with SMTP id
 p124-20020a1f2982000000b004018898ea44mr142394vkp.3.1679336283507; Mon, 20 Mar
 2023 11:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org> <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com> <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
In-Reply-To: <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Mar 2023 13:17:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
Message-ID: <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for testing DT
 property presence
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sean Wang <sean.wang@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230320_111806_337629_3303C7FE 
X-CRM114-Status: GOOD (  28.63  )
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

On Sun, Mar 19, 2023 at 3:55=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
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

Can you just drop drivers/pinctrl/renesas/pinctrl.c from this patch?

Rob

