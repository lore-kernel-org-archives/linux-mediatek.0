Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13FECCD188
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faVDqKCdKWIn3NWkm8sNO3VSI1X3h4Cs5MtO9NYvbBo=; b=F/IkSXadTgsK6t7aycQLWPrsxO
	06WpA7QsnqJhuI4HClFyrIQhe0YjH3zFyhJ1kBqqMPwKx/y4+ITPLvTd9oBQDYppoowN0O9vjxEUr
	1A31k7T0A9sx7hL1//pbZ/AUnaX+jWgfVLd0kyiyVsOi4197KKeTeru6lh5QCLWKMqItLjHGDpiER
	O33L+0vHABJIqEWH/yczbhLaXNeQZocf2gsJbfuFquOfM2lieXEtwiKzEPgjAGFozlLIeOgGa+VKv
	ndHvf9+0jLGWL0adc5oi01X55k+nMGtyIQyW3w4E4WRFimGYQkOkCQ9gDQJ/Ndzmxo1NEzCXkZ4s3
	4tvxACaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lrc-00000005Umx-12Hq;
	Thu, 09 Oct 2025 08:19:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lrZ-00000005Uls-4BOD
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Oct 2025 08:19:03 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-27eed7bdfeeso9791045ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Oct 2025 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759997941; x=1760602741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faVDqKCdKWIn3NWkm8sNO3VSI1X3h4Cs5MtO9NYvbBo=;
        b=T6+5cFokQ5i2eJqRgirWDHLVJICiV8kh2zKskkmT6bSriRET2dxVjZppvxxA4tqiev
         fYv0nOwXj92mWJQLs4Ivt2x2eNgB7AC79JyWfTRZI8YFVWoEBuJ9RWLu91rSuRkJYaG+
         n2MfAmDubCOVZTPVwrl0K61R7Ip1NoHDwCxGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997941; x=1760602741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faVDqKCdKWIn3NWkm8sNO3VSI1X3h4Cs5MtO9NYvbBo=;
        b=VLSluw0jUIdQdzG4h5OhhlmJg2AzjJznBdrBPqbdJgxJUYGegchCRwpm1tNj0yciyL
         +xo47TS+QZFPrWLfOEVoBQvE7l3wr8EQ7QjezmjWamkBmqT5+h5EOu83niqQ8/xpfflF
         hnqZ4QLqQ7KRwaefFKSJLmX2ZyHjSKlwffjtCytnVopiQydBJLPfv+qkTPBxH3/Az9vY
         p+tfe3qxtl8mEhOtJ1QpK6CXRs1UgycGIO+yNsNKCTVlUyow0p63FjrHgZvTw+feJIMY
         FQ3FCEcmObNFPF7i7NmmRnkS4kwghVhf801/rbRwDdFGxuvmbTHFUP5rfR9P8AVOCTZ4
         4/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXDZgrg3kjeCArvo2ABBiP8/hKlEgrEc8UfSfxdcFJhGwfZxlvo2v7PAKfj1gJNtd8+awcktHO134FFgQ/xVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwachvMdB/3HfVJmW8+WTBY3nrOy1gXkO3GjmP+JGMYXPHZuS/V
	O+zypk6jzev9Tm+x7PLtF9YSRgcJhjunSudEt+lZaViORTE2mEqX7u2lqmnPLkLNRSgi6hVPEvm
	k2CvUnsl97HXuy8SoqvbTDuVu6RALMT8WgWX/ZaNR
X-Gm-Gg: ASbGncvfjRy7d+wMTyJqBBlp4IBljk3wp1VitAi8mxtoeSrvAGDTKin79Aj06wONsu5
	UXLhZJ8suPGw7YExjv5g9nY9+d0snreU3u63QRaqMvXPqgJPfQGh+T/eZxPhMnxc6Uf8oD5U07K
	pJpfHz3MHfQmrn9GMwg5RuVa82cGzbWriqvCzJCjdsus6XWn+Ss4alGHyV5FTIbdWo1hcnq2VA7
	DVRJL6GZdziSST9NJ9tvtKP4QOh4mHgPTbT5HPL70oZob4PMYKZFOnxhTcaKQ==
X-Google-Smtp-Source: AGHT+IG8hUHTkL+0dXNTRX/4yTjjacHxUhJpfIwq4JvXFm1KYIbTsH15Oh51ajo74tr7nKhGrgMAEZfz3BlrBGqWW9I=
X-Received: by 2002:a17:903:28c:b0:267:8b4f:df36 with SMTP id
 d9443c01a7336-28ec9cd714amr123635935ad.29.1759997941215; Thu, 09 Oct 2025
 01:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
 <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com> <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
In-Reply-To: <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 16:18:42 +0800
X-Gm-Features: AS18NWCTXFo8_XU732GoC_EADGZOvbHUHoSmyBMCpLqt3ZP7mbYJfRNT_Vg0jY8
Message-ID: <CAGXv+5FTg3VXpbav5c2Gx2vRgaC=jYURRp0b5tQGw+ScACRSew@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_011902_090312_FD673CFD 
X-CRM114-Status: GOOD (  22.51  )
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

On Thu, Oct 9, 2025 at 4:09=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/10/25 18:05, Nicolas Frattaroli ha scritto:
> > As it stands, mtk_clk_register_plls takes a struct device_node pointer
> > as its first argument. This is a tragic happenstance, as it's trivial t=
o
> > get the device_node from a struct device, but the opposite not so much.
> > The struct device is a much more useful thing to have passed down.
> >
> > Refactor mtk_clk_register_plls to take a struct device pointer instead
> > of a struct device_node pointer, and fix up all users of this function.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/clk/mediatek/clk-mt2701.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 4 ++--
> >   drivers/clk/mediatek/clk-mt6765.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt6779.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt6797.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt7629.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt7981-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt7986-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt7988-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8196-mcu.c        | 2 +-
> >   drivers/clk/mediatek/clk-mt8196-mfg.c        | 2 +-
> >   drivers/clk/mediatek/clk-mt8196-vlpckgen.c   | 2 +-
> >   drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-pll.c               | 7 ++++---
> >   drivers/clk/mediatek/clk-pll.h               | 6 +++---
> >   24 files changed, 33 insertions(+), 29 deletions(-)
> >
>
> ..snip..
>
> > diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-=
pll.h
> > index d71c150ce83e4bb2fe78290c2d5570a90084246d..0e2b94b9cd4b56adceee3b0=
4e9ab24c2526471da 100644
> > --- a/drivers/clk/mediatek/clk-pll.h
> > +++ b/drivers/clk/mediatek/clk-pll.h
> > @@ -78,9 +78,9 @@ struct mtk_clk_pll {
> >       const struct mtk_pll_data *data;
> >   };
> >
>
> There's a forward declaration of struct device_node in this header: with =
this
> change, that becomes unused.
>
> Please change that to a forward declaration of struct device instead.
>
> While at it, I'd appreciate if you could either:
>   A. Remove the forward declaration for `struct clk_hw_onecell_data` and =
for
>      `struct clk_ops` (as both come from clk-provider.h - which this alre=
ady
>       includes);
>     ...or...
>   B. Remove the inclusion of clk-provider.h and keep the forward declarat=
ions.

Prefer (B) since no APIs from clk-provider.h are referenced in the header.
It is up to the implementation to directly include any and all headers it
needs.

ChenYu

> After which:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> > -int mtk_clk_register_plls(struct device_node *node,
> > -                       const struct mtk_pll_data *plls, int num_plls,
> > -                       struct clk_hw_onecell_data *clk_data);
> > +int mtk_clk_register_plls(struct device *dev, const struct mtk_pll_dat=
a *plls,
> > +                       int num_plls, struct clk_hw_onecell_data *clk_d=
ata);
> > +
> >   void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num=
_plls,
> >                            struct clk_hw_onecell_data *clk_data);
> >
> >
>
>

