Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3C7C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23kL4IhHhwyKulf43RqOzzWBpGFLiXyCT3hgeWCoKIY=; b=qcnGVT/hMTg2IN
	rRw9E4FeNPySBDsWKze46xF/hpvfxGeQjpuQIXiO0hTXjUSvFYNZZzXV2KKhttogjCWgi+SGoLhbJ
	xAYBIswpYkG4OMfsgShwBP9QYfm0rsPoFcbyFSNNqQZVIwXMXpEiIITcQ9113K3K2PDD2/Mw9lhTI
	ppdocUXyXGDc7ITeEGtvrq2n7RzWPpmO4LpoTCkAfvaWZ1j3mTpOEeR5dp36swFzTOei9RjV1Ww7s
	iDZR4Pnu5zbGZCrfLd9dgdnjc/AeGHTN+iZ1PxeKMFBa1wc7DXTdname2SXs3kuNYSzcOIJewLfGM
	qyzMNFHl8Gg8U4NenBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quot4-006aqV-0T;
	Mon, 23 Oct 2023 06:58:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quosz-006aob-2l;
	Mon, 23 Oct 2023 06:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2EF4CCE1CF0;
	Mon, 23 Oct 2023 06:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0893C433CC;
	Mon, 23 Oct 2023 06:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698044277;
	bh=4tzMntYsGBiVzoYMNoeG39kcRVxR6I42P8bpjezKMds=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=TuezilNOP4E9+IjEup5ln99rjlQ+59cwLAnE1vInQ3KCuDeGh9X4RItujzBcjCk3U
	 OqkVfim4SvYuxbhbEpB759VaUbLN0u+8wnCveyQcLqnSCYE4bT1w8/kUex19iUitjK
	 CkoH6lt3BsN0QnxIjsMMQaurHmDM0i0epk0n9jgzVvGYQfACvNAAst3LofzbaQYBYV
	 oaLGEpyiTqMI3o5vhMjjnfRVi4Hs7miP0dyEPrheTQz9uM1X9pt5EFnYc1qu3hXrHK
	 3d7+wH84jVokzdJPoD2lnJKACDCvNJRyVPQE5sf0I6dBFTBQm1nQb1ZdzJd4tfoJO5
	 RJL31LC1oFe3Q==
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5aa481d53e5so1459151a12.1;
        Sun, 22 Oct 2023 23:57:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YwxUJSCAY+EcA99Z9LVesxdqu03goibz2OwxDJQ+dO1uZtrZyL3
	S+p2MDi3Ekg1S2X8J0du6MfnYGxpvpCH5hYDo7w=
X-Google-Smtp-Source: AGHT+IFtcogBno2m+h8tioF0APLYjrStxtdqopozDFhLYaOSubHkXKh+J6YdpUOZvAdiO/mnNVXJ7kCITOcvTrCQnQk=
X-Received: by 2002:a17:90a:19cb:b0:27d:4b71:ed17 with SMTP id
 11-20020a17090a19cb00b0027d4b71ed17mr6135066pjj.29.1698044277339; Sun, 22 Oct
 2023 23:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com> <20231018103546.48174-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231018103546.48174-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Oct 2023 14:57:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v674=OTe9oDktH_BdrV7bdWQfk_2KkC-xdSckBu4ZoLrcQ@mail.gmail.com>
Message-ID: <CAGb2v674=OTe9oDktH_BdrV7bdWQfk_2KkC-xdSckBu4ZoLrcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: mediatek: clk-mux: Support custom parent
 indices for muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, msp@baylibre.com, amergnat@baylibre.com, 
	yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_235802_245474_90A21442 
X-CRM114-Status: GOOD (  28.46  )
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

On Wed, Oct 18, 2023 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for customized parent indices for MediaTek muxes: this is
> necessary for the case in which we want to exclude some clocks from
> a mux's parent clocks list, where the exclusions are not from the
> very bottom of the list but either in the middle or the beginning.
>
> Example:
> - MUX1 (all parents)
>   - parent1; idx=3D0
>   - parent2; idx=3D1
>   - parent3; idx=3D2
>
> - MUX1 (wanted parents)
>   - parent1; idx=3D0
>   - parent3; idx=3D2
>
> To achieve that add a `parent_index` array pointer to struct mtk_mux,
> then in .set_parent(), .get_parent() callbacks check if this array
> was populated and eventually get the index from that.
>
> Also, to avoid updating all clock drivers for all SoCs, rename the
> "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> been reintroduced as being fully compatible with the older version.
>
> The new parent_index can be specified with the new `_INDEXED`
> variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 14 +++++++++++
>  drivers/clk/mediatek/clk-mux.h | 43 ++++++++++++++++++++++++++++++----
>  2 files changed, 53 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mu=
x.c
> index c93bc7f926e5..60990296450b 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -89,6 +89,17 @@ static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
>         regmap_read(mux->regmap, mux->data->mux_ofs, &val);
>         val =3D (val >> mux->data->mux_shift) & mask;
>
> +       if (mux->data->parent_index) {
> +               int i;
> +
> +               for (i =3D 0; i < mux->data->num_parents; i++)
> +                       if (mux->data->parent_index[i] =3D=3D val)
> +                               return i;
> +
> +               /* Not found: return an impossible index to generate erro=
r */
> +               return mux->data->num_parents + 1;
> +       }
> +
>         return val;
>  }
>
> @@ -104,6 +115,9 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct =
clk_hw *hw, u8 index)
>         else
>                 __acquire(mux->lock);
>
> +       if (mux->data->parent_index)
> +               index =3D mux->data->parent_index[index];
> +
>         regmap_read(mux->regmap, mux->data->mux_ofs, &orig);
>         val =3D (orig & ~(mask << mux->data->mux_shift))
>                         | (index << mux->data->mux_shift);
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mu=
x.h
> index 7ecb963b0ec6..943ad1d7ce4b 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -21,6 +21,7 @@ struct mtk_mux {
>         int id;
>         const char *name;
>         const char * const *parent_names;
> +       const u8 *parent_index;
>         unsigned int flags;
>
>         u32 mux_ofs;
> @@ -37,9 +38,10 @@ struct mtk_mux {
>         signed char num_parents;
>  };
>
> -#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,         \
> -                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> -                       _gate, _upd_ofs, _upd, _flags, _ops) {          \
> +#define __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,         =
       \
> +                        _num_parents, _mux_ofs, _mux_set_ofs,          \
> +                        _mux_clr_ofs, _shift, _width, _gate, _upd_ofs, \
> +                        _upd, _flags, _ops) {                          \

Nit: I would take this opportunity to fix up the alignment of the lines
here, as well as for the new macros. Also you needn't wrap the lines at
80 characters. Instead I would wrap where it makes more sense, like group
arguments for the same type (parents / mux / gate / update ...) on the
same line if possible.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>                 .id =3D _id,                                             =
 \
>                 .name =3D _name,                                         =
 \
>                 .mux_ofs =3D _mux_ofs,                                   =
 \
> @@ -51,11 +53,28 @@ struct mtk_mux {
>                 .gate_shift =3D _gate,                                   =
 \
>                 .upd_shift =3D _upd,                                     =
 \
>                 .parent_names =3D _parents,                              =
 \
> -               .num_parents =3D ARRAY_SIZE(_parents),                   =
 \
> +               .parent_index =3D _paridx,                               =
 \
> +               .num_parents =3D _num_parents,                           =
 \
>                 .flags =3D _flags,                                       =
 \
>                 .ops =3D &_ops,                                          =
 \
>         }
>
> +#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,         \
> +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> +                       _gate, _upd_ofs, _upd, _flags, _ops)            \
> +               __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,          \
> +                       NULL, ARRAY_SIZE(_parents), _mux_ofs,           \
> +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> +                       _gate, _upd_ofs, _upd, _flags, _ops)            \
> +
> +#define GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents, _paridx,  \
> +                        _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,  \
> +                        _width, _gate, _upd_ofs, _upd, _flags, _ops)   \
> +               __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,          \
> +                       _paridx, ARRAY_SIZE(_paridx), _mux_ofs,         \
> +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> +                       _gate, _upd_ofs, _upd, _flags, _ops)            \
> +
>  extern const struct clk_ops mtk_mux_clr_set_upd_ops;
>  extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
>
> @@ -67,6 +86,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_o=
ps;
>                         _gate, _upd_ofs, _upd, _flags,                  \
>                         mtk_mux_gate_clr_set_upd_ops)
>
> +#define MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,       \
> +                       _paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,  \
> +                       _shift, _width, _gate, _upd_ofs, _upd, _flags)  \
> +               GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,    \
> +                       _paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,  \
> +                       _shift, _width, _gate, _upd_ofs, _upd, _flags,  \
> +                       mtk_mux_gate_clr_set_upd_ops)
> +
>  #define MUX_GATE_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,           \
>                         _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
>                         _gate, _upd_ofs, _upd)                          \
> @@ -75,6 +102,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_=
ops;
>                         _width, _gate, _upd_ofs, _upd,                  \
>                         CLK_SET_RATE_PARENT)
>
> +#define MUX_GATE_CLR_SET_UPD_INDEXED(_id, _name, _parents, _paridx,    \
> +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,   \
> +                       _width, _gate, _upd_ofs, _upd)                  \
> +               MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name,          \
> +                       _parents, _paridx, _mux_ofs, _mux_set_ofs,      \
> +                       _mux_clr_ofs, _shift, _width, _gate, _upd_ofs,  \
> +                       _upd, CLK_SET_RATE_PARENT)
> +
>  #define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,                 =
       \
>                         _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
>                         _upd_ofs, _upd)                                 \
> --
> 2.42.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

