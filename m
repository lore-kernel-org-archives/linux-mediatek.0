Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDFACA0ED1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 03:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loZthR9RzPQDn5YAIwnBCElKX3TDSMbtkyZ9fbUSqGg=; b=qL+Qk2sNJWseRit4yDxzwebZWh
	TqPvfrqbiI77WWBtvo/ux5EFAIm+M3BWdW1EDm8yfZ4v+XEd/IWPcQJTpkIu7wTTMCvMGLAeIN2t/
	n6jgtIR+GYTsH1jUz265YRtpALN+Nz6mrmgJCLOU37dg+pdQXszoDDMyJtoovwHHRvOBwrK+fLIUE
	+mYlrbiF2VU50HD0bnjtkJNM4FxgS/kxc7A2U1pWVunVRgt+h4K7R09Q9XZ1IrCc/woAbW2mP3PEF
	YX0ozyumN61h4XTDB6oS9P6I5/kMDICSSLJk/+7uJKV428qwhiMYWE7m4jWw3n+IHfz92JvyalER9
	LMWx7x8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlH0-00000001JLt-49u3;
	Fri, 15 Aug 2025 03:38:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uml2S-00000001Hpx-47Ye
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 03:23:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55ce520c9acso1710670e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 20:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755228211; x=1755833011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loZthR9RzPQDn5YAIwnBCElKX3TDSMbtkyZ9fbUSqGg=;
        b=Eed2+cH/6pZlFtrSkwBa1m1XVRjAvikQjP/HSrtMt3Pto0Zzhc4QAVPGWSCIyt1KXr
         qy/NDYSN0xtkLtlqmxOcw9vfw3DgSQgBNNopHIvqGWbzK79bdLSZ8JjxlNfzl0q6IuAY
         P7JeeR20Sy94JsGrke0R08n50qCILDBbR7m1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755228211; x=1755833011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loZthR9RzPQDn5YAIwnBCElKX3TDSMbtkyZ9fbUSqGg=;
        b=YwTxgigyxDIEjWsAQ5A1Z9SuUdIEZDTUbwow2naGckEA00R/jZC0da7WYMwjhqxKDx
         MIUDgdFyqiYXHVECqtIuABT10+gbbQT/EDrgmtdn2nDJTK1JJA7mQNjgvv8hT7trCwfv
         BB6UJrvsEvJoHnDAJnaMEykY/ULpiuQrftqRAooL5dmG6ZaklLERysIkOfRfCXYNoSra
         qZM21pivWmcg0oZP9gUL3RaXMwNtCIYa4IR4xRN4saih8X8kxE+nw/BPWQAToMdv6aef
         /NtSBIlKXOItPfW0OAee3BF0TuDs88/spGbmIk8ssSD+QOkPOdgCGVtyey8aWrg/ELFF
         CrXg==
X-Forwarded-Encrypted: i=1; AJvYcCXmzbFp9r40cauZKcxlzkXQsxtl0i19QcI5c1eFsTkEsHe+tftcX4XxFR8rR7ic4rT6WFGyD/yRXF3792g2vQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YycQkWnKIwxAHuoJrlNU4k/sLMT30/c/sikGWpyq6zC93D4CjXL
	32Wgok4EDsXNHsUf2asNHKlBhaJUYINyrKB1c3NuHUfrMUwhUKT5L2qMQGWGas/vZilBS0Q/uUr
	ex+CHp4nLu7jn53pFrQQoh8IFgprfejNBhyPeLr7L
X-Gm-Gg: ASbGncuVpQBdvlUzIZ2LS3VlzZuh+oQBs5WoDqfmxnvu05t3CkJyxygebtWHMB0fq9h
	4TLq2JaIh5LtrSiCcQkOodXZPtP2Z7w4uXNvldbY0Eg/VCAve0ly+z1snPrYbZNn9co/azzOZMK
	RriBNxtxO+yWG+HabXiVFUO3DFzHfcRX7J0+k9f5NK/GxDxT1MO0JzN71gJj94R9kezhEeZN00h
	PJ+KadJZVjSinBBTDx9jFSRxQ9cgMkD182OHg==
X-Google-Smtp-Source: AGHT+IHVtC4Alxt8AWwZST4v89xIyMs9zLoVRtml2n78wl63Mvb3mMjCwjWs3lTr5lXzzhW6dAAnYS4ErrmaVz2N51k=
X-Received: by 2002:a05:6512:39d6:b0:553:a740:18aa with SMTP id
 2adb3069b0e04-55ceeb2d2b6mr153164e87.22.1755228211106; Thu, 14 Aug 2025
 20:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-4-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-4-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:23:20 +0900
X-Gm-Features: Ac12FXz6uzhVa5mzNMAxjzWWhn_Ab-739zVQPdyqAO9BXTYqTIf4635L7GMmTws
Message-ID: <CAGXv+5Fhsm=JrBP9y-kScw-zK_XFc4Dqfd3VUXx+rA6oBxptJg@mail.gmail.com>
Subject: Re: [PATCH v4 03/27] clk: mediatek: clk-mux: Add ops for mux gates
 with set/clr/upd and FENC
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_202333_046035_167DF4AD 
X-CRM114-Status: GOOD (  22.89  )
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses set/clr/upd registers for mux gate enable/disable control,
> along with a FENC bit to check the status. Add new set of mux gate
> clock operations with support for set/clr/upd and FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  drivers/clk/mediatek/clk-mux.c | 48 ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mux.h | 45 +++++++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index c17fe1c2d732..136a4bc6dbe6 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -20,6 +20,8 @@
>
>  #define MHZ (1000 * 1000)
>
> +#define MTK_WAIT_FENC_DONE_US  30
> +

Nit: I think it would be nicer if you define this locally in the mux type
clk code, just to keep the two completely separate.

>  struct platform_device;
>
>  /*
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mu=
x.c
> index 60990296450b..b1b8eeb0b501 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -15,6 +15,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>
> +#include "clk-mtk.h"
>  #include "clk-mux.h"
>
>  struct mtk_clk_mux {
> @@ -30,6 +31,33 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struc=
t clk_hw *hw)
>         return container_of(hw, struct mtk_clk_mux, hw);
>  }
>
> +static int mtk_clk_mux_fenc_enable_setclr(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       unsigned long flags;
> +       u32 val;
> +       int ret;
> +
> +       if (mux->lock)
> +               spin_lock_irqsave(mux->lock, flags);
> +       else
> +               __acquire(mux->lock);
> +
> +       regmap_write(mux->regmap, mux->data->clr_ofs,
> +                    BIT(mux->data->gate_shift));
> +
> +       ret =3D regmap_read_poll_timeout_atomic(mux->regmap, mux->data->f=
enc_sta_mon_ofs,
> +                                             val, val & BIT(mux->data->f=
enc_shift), 1,
> +                                             MTK_WAIT_FENC_DONE_US);
> +
> +       if (mux->lock)
> +               spin_unlock_irqrestore(mux->lock, flags);
> +       else
> +               __release(mux->lock);
> +
> +       return ret;
> +}
> +
>  static int mtk_clk_mux_enable_setclr(struct clk_hw *hw)
>  {
>         struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> @@ -70,6 +98,16 @@ static void mtk_clk_mux_disable_setclr(struct clk_hw *=
hw)
>                         BIT(mux->data->gate_shift));
>  }
>
> +static int mtk_clk_mux_fenc_is_enabled(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       u32 val;
> +
> +       regmap_read(mux->regmap, mux->data->fenc_sta_mon_ofs, &val);
> +
> +       return val & BIT(mux->data->fenc_shift);

Nit: Do a double negate.

> +}
> +
>  static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
>  {
>         struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> @@ -168,6 +206,16 @@ const struct clk_ops mtk_mux_gate_clr_set_upd_ops  =
=3D {
>  };
>  EXPORT_SYMBOL_GPL(mtk_mux_gate_clr_set_upd_ops);
>
> +const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops =3D {
> +       .enable =3D mtk_clk_mux_fenc_enable_setclr,
> +       .disable =3D mtk_clk_mux_disable_setclr,
> +       .is_enabled =3D mtk_clk_mux_fenc_is_enabled,
> +       .get_parent =3D mtk_clk_mux_get_parent,
> +       .set_parent =3D mtk_clk_mux_set_parent_setclr_lock,
> +       .determine_rate =3D mtk_clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_GPL(mtk_mux_gate_fenc_clr_set_upd_ops);
> +
>  static struct clk_hw *mtk_clk_register_mux(struct device *dev,
>                                            const struct mtk_mux *mux,
>                                            struct regmap *regmap,
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mu=
x.h
> index 943ad1d7ce4b..c65cfb7f8fc3 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -28,11 +28,13 @@ struct mtk_mux {
>         u32 set_ofs;
>         u32 clr_ofs;
>         u32 upd_ofs;
> +       u32 fenc_sta_mon_ofs;
>
>         u8 mux_shift;
>         u8 mux_width;
>         u8 gate_shift;
>         s8 upd_shift;
> +       u8 fenc_shift;
>
>         const struct clk_ops *ops;
>         signed char num_parents;
> @@ -77,6 +79,7 @@ struct mtk_mux {
>
>  extern const struct clk_ops mtk_mux_clr_set_upd_ops;
>  extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
> +extern const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops;
>
>  #define MUX_GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,     \
>                         _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> @@ -118,6 +121,48 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd=
_ops;
>                         0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,         \
>                         mtk_mux_clr_set_upd_ops)
>
> +#define MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,  =
       \
> +                       _num_parents, _mux_ofs, _mux_set_ofs, _mux_clr_of=
s,     \
> +                       _shift, _width, _gate, _upd_ofs, _upd,           =
       \
> +                       _fenc_sta_mon_ofs, _fenc, _flags) {              =
       \
> +               .id =3D _id,                                             =
         \
> +               .name =3D _name,                                         =
         \
> +               .mux_ofs =3D _mux_ofs,                                   =
         \
> +               .set_ofs =3D _mux_set_ofs,                               =
         \
> +               .clr_ofs =3D _mux_clr_ofs,                               =
         \
> +               .upd_ofs =3D _upd_ofs,                                   =
         \
> +               .fenc_sta_mon_ofs =3D _fenc_sta_mon_ofs,                 =
         \
> +               .mux_shift =3D _shift,                                   =
         \
> +               .mux_width =3D _width,                                   =
         \
> +               .gate_shift =3D _gate,                                   =
         \
> +               .upd_shift =3D _upd,                                     =
         \
> +               .fenc_shift =3D _fenc,                                   =
         \
> +               .parent_names =3D _parents,                              =
         \
> +               .parent_index =3D _paridx,                               =
         \
> +               .num_parents =3D _num_parents,                           =
         \
> +               .flags =3D _flags,                                       =
         \
> +               .ops =3D &mtk_mux_gate_fenc_clr_set_upd_ops,             =
         \
> +       }
> +
> +#define MUX_GATE_FENC_CLR_SET_UPD(_id, _name, _parents,                 =
       \
> +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs,           \
> +                       _shift, _width, _gate, _upd_ofs, _upd,          \
> +                       _fenc_sta_mon_ofs, _fenc)                       \
> +               MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,   \
> +                       NULL, ARRAY_SIZE(_parents), _mux_ofs,           \
> +                       _mux_set_ofs, _mux_clr_ofs, _shift,             \
> +                       _width, _gate, _upd_ofs, _upd,                  \
> +                       _fenc_sta_mon_ofs, _fenc, 0)
> +
> +#define MUX_GATE_FENC_CLR_SET_UPD_INDEXED(_id, _name, _parents,        _=
paridx,        \

                                                                   ^^^^^^
This looks like a tab when it should have been a space?

ChenYu

> +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs,            =
       \
> +                       _shift, _width, _gate, _upd_ofs, _upd,           =
       \
> +                       _fenc_sta_mon_ofs, _fenc)                        =
       \
> +               MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _pa=
ridx,  \
> +                       ARRAY_SIZE(_paridx), _mux_ofs, _mux_set_ofs,     =
       \
> +                       _mux_clr_ofs, _shift, _width, _gate, _upd_ofs, _u=
pd,    \
> +                       _fenc_sta_mon_ofs, _fenc, 0)
> +
>  int mtk_clk_register_muxes(struct device *dev,
>                            const struct mtk_mux *muxes,
>                            int num, struct device_node *node,
> --
> 2.39.5
>

