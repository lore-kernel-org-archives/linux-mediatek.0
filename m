Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB50DC25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVeVBR/WKW3WxUgfwdBq8PIYVFtJGAC7Nmp/vwGM0rE=; b=L0TRIcmaqYSEfN
	S4HgEFmjx+5HYi9BC3BRU15G9XOW+vwGLC8CIsVNDEp/KwwJ+oW59XYOMxeUofsjJ+JRQdC7ZCZ1r
	8wbKK4g1P2hMZdS1j9Qaa+OcteTNabLtw3MjfoFvnzHvRAIeADdb2UePJv+EDTZxM57xDM74jUR/6
	2KWlvAaVuKS267n1kya7ZulGVzsZE/ab5gz37WSMcu+mmBkjx23RsThLyg7P6wcDV3dNezeMk0jxS
	VknRhQGw+ksh7lqXdipneFgmiZlaXJZ45mXmkVH0N94XscDY9n6W/OTMrVHpTysV6V7M9C4qyjLAQ
	bPhlO3eViAe9IDSD4iwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quopc-006aXw-2d;
	Mon, 23 Oct 2023 06:54:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quopZ-006aXL-0K;
	Mon, 23 Oct 2023 06:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 279AA60AF0;
	Mon, 23 Oct 2023 06:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD00C433C8;
	Mon, 23 Oct 2023 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698044067;
	bh=hKqNPbt9VyLqXwL5xC7nnVFXOCyGNFj44hnObGCmvU0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Vzsw93LPybRE9HpsXtrDIv0ezxrNpqPpKlGA5E9sqYEuvMjr0dS3XmzR2b406/44Q
	 +aR/dG0FcMmA/VKUE3pBQKUUNCBXPel8otqz4OCFc9S6oYaR7WFdSrmLljQDUV0nc2
	 gUZ4kIodF9VvHyVdhaObW/gTTbQEDJmFApQYrakFyiLmADuxre1Qb/lCgSXj39ozOD
	 FczEi7FUWsBS4NSRynJTXYB5BHTPJCBG1dFq7p2S0GSEo6QoUdf/WGKrD74HF8d4Ll
	 yL0k33d6lPQeEGRERI8ZlbYm1xIkMTJm4QysLKnnNCUZHSGmiuhh8oY/MZp0XlvMKn
	 KhV7iqnDa6Zwg==
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ab53b230f1so1643250a12.3;
        Sun, 22 Oct 2023 23:54:27 -0700 (PDT)
X-Gm-Message-State: AOJu0YzMban4yg1cHngUPo6z2DtdcawZuVCIMl27IhqCf5DWq4I7Tnqk
	zxHVlzkgDO/Z002WBiCfRVnUziYOAJx+/YpD/FE=
X-Google-Smtp-Source: AGHT+IHXm18YVjc5inGGNPq306L1KKS+mcT4SO7cP3FLYMvo4f3Hwk05cwnIhsY6Wkc2+aMTYcwbAkHZYjAtRELyPaE=
X-Received: by 2002:a17:90a:c303:b0:27e:31a:2ab2 with SMTP id
 g3-20020a17090ac30300b0027e031a2ab2mr5295653pjt.34.1698044067366; Sun, 22 Oct
 2023 23:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com>
 <20231018103546.48174-2-angelogioacchino.delregno@collabora.com> <20231023064339.xglriq6ycedjlyd4@blmsp>
In-Reply-To: <20231023064339.xglriq6ycedjlyd4@blmsp>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Oct 2023 14:54:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v66fppkqe8qiC7XG=gVK9qzO_qqRBYrLn2iDHnSBr9JyLA@mail.gmail.com>
Message-ID: <CAGb2v66fppkqe8qiC7XG=gVK9qzO_qqRBYrLn2iDHnSBr9JyLA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: mediatek: clk-mux: Support custom parent
 indices for muxes
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, sboyd@kernel.org, 
	mturquette@baylibre.com, matthias.bgg@gmail.com, wenst@chromium.org, 
	amergnat@baylibre.com, yangyingliang@huawei.com, 
	u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_235429_249018_98486ED3 
X-CRM114-Status: GOOD (  37.32  )
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
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 23, 2023 at 2:44=E2=80=AFPM Markus Schneider-Pargmann
<msp@baylibre.com> wrote:
>
> Hi Angelo,
>
> On Wed, Oct 18, 2023 at 12:35:45PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Add support for customized parent indices for MediaTek muxes: this is
> > necessary for the case in which we want to exclude some clocks from
> > a mux's parent clocks list, where the exclusions are not from the
> > very bottom of the list but either in the middle or the beginning.
> >
> > Example:
> > - MUX1 (all parents)
> >   - parent1; idx=3D0
> >   - parent2; idx=3D1
> >   - parent3; idx=3D2
> >
> > - MUX1 (wanted parents)
> >   - parent1; idx=3D0
> >   - parent3; idx=3D2
> >
> > To achieve that add a `parent_index` array pointer to struct mtk_mux,
> > then in .set_parent(), .get_parent() callbacks check if this array
> > was populated and eventually get the index from that.
> >
> > Also, to avoid updating all clock drivers for all SoCs, rename the
> > "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> > add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> > been reintroduced as being fully compatible with the older version.
> >
> > The new parent_index can be specified with the new `_INDEXED`
> > variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.
> >
> > Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  drivers/clk/mediatek/clk-mux.c | 14 +++++++++++
> >  drivers/clk/mediatek/clk-mux.h | 43 ++++++++++++++++++++++++++++++----
> >  2 files changed, 53 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-=
mux.c
> > index c93bc7f926e5..60990296450b 100644
> > --- a/drivers/clk/mediatek/clk-mux.c
> > +++ b/drivers/clk/mediatek/clk-mux.c
> > @@ -89,6 +89,17 @@ static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
> >       regmap_read(mux->regmap, mux->data->mux_ofs, &val);
> >       val =3D (val >> mux->data->mux_shift) & mask;
> >
> > +     if (mux->data->parent_index) {
> > +             int i;
> > +
> > +             for (i =3D 0; i < mux->data->num_parents; i++)
> > +                     if (mux->data->parent_index[i] =3D=3D val)
> > +                             return i;
> > +
> > +             /* Not found: return an impossible index to generate erro=
r */
> > +             return mux->data->num_parents + 1;
> > +     }
> > +
> >       return val;
> >  }
> >
> > @@ -104,6 +115,9 @@ static int mtk_clk_mux_set_parent_setclr_lock(struc=
t clk_hw *hw, u8 index)
> >       else
> >               __acquire(mux->lock);
> >
> > +     if (mux->data->parent_index)
> > +             index =3D mux->data->parent_index[index];
> > +
> >       regmap_read(mux->regmap, mux->data->mux_ofs, &orig);
> >       val =3D (orig & ~(mask << mux->data->mux_shift))
> >                       | (index << mux->data->mux_shift);
> > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-=
mux.h
> > index 7ecb963b0ec6..943ad1d7ce4b 100644
> > --- a/drivers/clk/mediatek/clk-mux.h
> > +++ b/drivers/clk/mediatek/clk-mux.h
> > @@ -21,6 +21,7 @@ struct mtk_mux {
> >       int id;
> >       const char *name;
> >       const char * const *parent_names;
> > +     const u8 *parent_index;
> >       unsigned int flags;
>
> I think at some point it would be nice to have a documentation of these
> fields.
>
> >
> >       u32 mux_ofs;
> > @@ -37,9 +38,10 @@ struct mtk_mux {
> >       signed char num_parents;
> >  };
> >
> > -#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,        =
       \
> > -                     _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > -                     _gate, _upd_ofs, _upd, _flags, _ops) {          \
> > +#define __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,       =
       \
> > +                      _num_parents, _mux_ofs, _mux_set_ofs,          \
> > +                      _mux_clr_ofs, _shift, _width, _gate, _upd_ofs, \
> > +                      _upd, _flags, _ops) {                          \
> >               .id =3D _id,                                             =
 \
> >               .name =3D _name,                                         =
 \
> >               .mux_ofs =3D _mux_ofs,                                   =
 \
> > @@ -51,11 +53,28 @@ struct mtk_mux {
> >               .gate_shift =3D _gate,                                   =
 \
> >               .upd_shift =3D _upd,                                     =
 \
> >               .parent_names =3D _parents,                              =
 \
> > -             .num_parents =3D ARRAY_SIZE(_parents),                   =
 \
> > +             .parent_index =3D _paridx,                               =
 \
> > +             .num_parents =3D _num_parents,                           =
 \
>
> I was wondering why you moved the ARRAY_SIZE() to the outer macros and
> add another argument to the already huge list of arguments? I couldn't
> find a use-case for this in the patches you sent.

This is the base macro that all the other ones are based on, so it has
the complete list of arguments. The other ones use this and provide
default values for the arguments they don't need.

ChenYu

> Best,
> Markus
>
> >               .flags =3D _flags,                                       =
 \
> >               .ops =3D &_ops,                                          =
 \
> >       }
> >
> > +#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,        =
       \
> > +                     _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > +                     _gate, _upd_ofs, _upd, _flags, _ops)            \
> > +             __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,          \
> > +                     NULL, ARRAY_SIZE(_parents), _mux_ofs,           \
> > +                     _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > +                     _gate, _upd_ofs, _upd, _flags, _ops)            \
> > +
> > +#define GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents, _paridx, =
       \
> > +                      _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,  \
> > +                      _width, _gate, _upd_ofs, _upd, _flags, _ops)   \
> > +             __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,          \
> > +                     _paridx, ARRAY_SIZE(_paridx), _mux_ofs,         \
> > +                     _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > +                     _gate, _upd_ofs, _upd, _flags, _ops)            \
> > +
> >  extern const struct clk_ops mtk_mux_clr_set_upd_ops;
> >  extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
> >
> > @@ -67,6 +86,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd=
_ops;
> >                       _gate, _upd_ofs, _upd, _flags,                  \
> >                       mtk_mux_gate_clr_set_upd_ops)
> >
> > +#define MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,     \
> > +                     _paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,  \
> > +                     _shift, _width, _gate, _upd_ofs, _upd, _flags)  \
> > +             GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,    \
> > +                     _paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,  \
> > +                     _shift, _width, _gate, _upd_ofs, _upd, _flags,  \
> > +                     mtk_mux_gate_clr_set_upd_ops)
> > +
> >  #define MUX_GATE_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,         \
> >                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> >                       _gate, _upd_ofs, _upd)                          \
> > @@ -75,6 +102,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_up=
d_ops;
> >                       _width, _gate, _upd_ofs, _upd,                  \
> >                       CLK_SET_RATE_PARENT)
> >
> > +#define MUX_GATE_CLR_SET_UPD_INDEXED(_id, _name, _parents, _paridx,  \
> > +                     _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,   \
> > +                     _width, _gate, _upd_ofs, _upd)                  \
> > +             MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name,          \
> > +                     _parents, _paridx, _mux_ofs, _mux_set_ofs,      \
> > +                     _mux_clr_ofs, _shift, _width, _gate, _upd_ofs,  \
> > +                     _upd, CLK_SET_RATE_PARENT)
> > +
> >  #define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,               =
       \
> >                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> >                       _upd_ofs, _upd)                                 \
> > --
> > 2.42.0
> >
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

