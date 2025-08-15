Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8992CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/gqheUAiJBZVnBDKCO9AHvkTlNKIjI8xnUPe2UrTYE=; b=DEcfe9sdTVScxq2LRtEn+2AM1o
	5XuPnyMapqiIaVwnn4Z1vn+LlYU2AXaA7IvI5kUDMZTtpcyNFXEZtTOsiYlFe9XSuPSjJOwXqlue4
	Anua2CjKIKMJTzs+MOg58Gu79F3kxgol9qp1C7ObzdGUhQDvZO2B6ADCw+vZ3BeVt/8cIUNACROdz
	Nw87RXrgjIsLfYSMbfXCa9eSZe2zzyHkUCE+xRrxIMRHo0c62hQ0GqaPYwfj6IiSMh3vhho3iwoN1
	ID4D4AjNFKQ9isvFJFt11vp82ZJUdoTGp567OM4YaxOiXA8gkDa46Fe8p0Hg8n92EvKSJqUVLpsEb
	2GhD7puQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlBo-00000001IxU-1gM1;
	Fri, 15 Aug 2025 03:33:12 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkxX-00000001HS0-0mQh
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 03:18:28 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-333f8d24c6fso14086491fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 20:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755227905; x=1755832705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/gqheUAiJBZVnBDKCO9AHvkTlNKIjI8xnUPe2UrTYE=;
        b=B1sqJqHKtulF1ax54lJkb44VblCuEfWfhCA5QZky7JJsSqePSabQ5Ov7eVsbp2xC1/
         h1foCedbZp0JO05GWrbfPwwYMiQAIdVKKzrK398PpK0eguZyx7oH9d0O32SEYejoCDz7
         9aex6dgxV7GwjuQDy6LL95P2FB2RYfgOO3UUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755227905; x=1755832705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/gqheUAiJBZVnBDKCO9AHvkTlNKIjI8xnUPe2UrTYE=;
        b=VYtAp2saUSYLAi9A1OCeYZqHLwHWaeSzpomDkk3674RXwWjqjjbbvHd1PHdWZCrvYp
         ZH383Wja4p0kz4rz0cuD0g1oCsNgXJ6Bz+3baK9hRw5qiDTiA86dlxGzfW/LsJPagYXM
         xx/m2NOq6ybM7H9NKS8du8S0vfmsHlGJr8UusF/Iag5WJqigQ+BwXUgpqPw45BQZjkZx
         rV0AubByAi9zkPH0FQEKia5yPsZJT7ztd9eYYiiX68zzQVv7DfmntOmS24Ig0ikx6/rG
         C+sUnpJis4TlacIElPpdxmotLf5FtYIHTQ0qKWe73pDeznRvhLrHp3LXmzHEIet40CwW
         gOMg==
X-Forwarded-Encrypted: i=1; AJvYcCWWPJjOBPQM3JPt7chgtUukVdf5frIQsd35/evJCbmcAR75+geDZdBxhZgVtOLuo2luVf+S+43HafkPOAZ5fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/iyPhwQo2WOtImeVa5Gjd86g9i9fxRkaKZ9SZXRxDcA6bZW6l
	g6Et1zUxCXiQeDqI776K43yl1vVps/16JD0dii+OvmetQsAMfVN/s8HFpWwdgBlXIwdbOp5jmvq
	9T5LkD1pYWEf11MLJcsbNypVbz678pup6Gxfyjnd4
X-Gm-Gg: ASbGncutHQtKBQRA+sM4qXslcT8rLcnftn2fvvok4sSFFcNB5KYlki63gNfjrMZyW7p
	SM9biGf0mmzGT8LpcJYJw3uBg7GVhm96iO3wvJvp+DITqIhYpbP0S5m5Trs3Rmd6fdT4RTgkLI3
	FiZEWN55XtK56OQhG3M0OU3+Ij14w6iMAO7Lf+nsyjn+nhU12XsplPC9gxnQ2+SnrhnL2ZJl0r/
	FSLXoSuwWbZSa2/zLI9Hk+/TFBgIzYqk3inWQ==
X-Google-Smtp-Source: AGHT+IH45CMxbyHBWhXJ/RabdXbIvSLoKeM5EMqrf7xlLady27fRhPu6U8KzyNXc6RGLGWgakK4Y6MekAcD2c3hLvVo=
X-Received: by 2002:a2e:b8c5:0:b0:332:6304:3076 with SMTP id
 38308e7fff4ca-33409809835mr1950611fa.1.1755227905389; Thu, 14 Aug 2025
 20:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-3-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-3-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:18:14 +0900
X-Gm-Features: Ac12FXwqbJqR6dXDCHoREy9cuJVuDHi_sxjr2uRku7Hw7ujClZ2WhTJ_l5duokI
Message-ID: <CAGXv+5Fnaict=9Agixn1vCrP3GkugaR3qEKmEYyYiXCGx8ZZ6w@mail.gmail.com>
Subject: Re: [PATCH v4 02/27] clk: mediatek: clk-pll: Add ops for PLLs using
 set/clr regs and FENC
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
X-CRM114-CacheID: sfid-20250814_201827_432333_1825E324 
X-CRM114-Status: GOOD (  24.82  )
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
> MT8196 uses a combination of set/clr registers to control the PLL
> enable state, along with a FENC bit to check the preparation status.
> Add new set of PLL clock operations with support for set/clr enable and
> FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 42 +++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/clk-pll.h |  5 ++++
>  2 files changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> index 49ca25dd5418..8f46de77f42d 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -37,6 +37,13 @@ int mtk_pll_is_prepared(struct clk_hw *hw)
>         return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) !=3D 0;
>  }
>
> +static int mtk_pll_fenc_is_prepared(struct clk_hw *hw)
> +{
> +       struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +
> +       return readl(pll->fenc_addr) & pll->fenc_mask;

Nits:

I'd do a double-negate (!!) just to indicate that we only care about
true or false.

Also, why do we need to store fenc_mask instead of just shifting the bit
here? Same goes for the register address. |pll| has the base address.
Why do we need to pre-calculate it?

The code is OK; it just seems a bit wasteful on memory.

Either way, this is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +}
> +
>  static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 =
fin,
>                 u32 pcw, int postdiv)
>  {
> @@ -274,6 +281,25 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>         writel(r, pll->pwr_addr);
>  }
>
> +static int mtk_pll_prepare_setclr(struct clk_hw *hw)
> +{
> +       struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +
> +       writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
> +
> +       /* Wait 20us after enable for the PLL to stabilize */
> +       udelay(20);
> +
> +       return 0;
> +}
> +
> +static void mtk_pll_unprepare_setclr(struct clk_hw *hw)
> +{
> +       struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +
> +       writel(BIT(pll->data->pll_en_bit), pll->en_clr_addr);
> +}
> +
>  const struct clk_ops mtk_pll_ops =3D {
>         .is_prepared    =3D mtk_pll_is_prepared,
>         .prepare        =3D mtk_pll_prepare,
> @@ -283,6 +309,16 @@ const struct clk_ops mtk_pll_ops =3D {
>         .set_rate       =3D mtk_pll_set_rate,
>  };
>
> +const struct clk_ops mtk_pll_fenc_clr_set_ops =3D {
> +       .is_prepared    =3D mtk_pll_fenc_is_prepared,
> +       .prepare        =3D mtk_pll_prepare_setclr,
> +       .unprepare      =3D mtk_pll_unprepare_setclr,
> +       .recalc_rate    =3D mtk_pll_recalc_rate,
> +       .round_rate     =3D mtk_pll_round_rate,
> +       .set_rate       =3D mtk_pll_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(mtk_pll_fenc_clr_set_ops);
> +
>  struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
>                                         const struct mtk_pll_data *data,
>                                         void __iomem *base,
> @@ -315,6 +351,9 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_cl=
k_pll *pll,
>         pll->hw.init =3D &init;
>         pll->data =3D data;
>
> +       pll->fenc_addr =3D base + data->fenc_sta_ofs;
> +       pll->fenc_mask =3D BIT(data->fenc_sta_bit);
> +
>         init.name =3D data->name;
>         init.flags =3D (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
>         init.ops =3D pll_ops;
> @@ -337,12 +376,13 @@ struct clk_hw *mtk_clk_register_pll(const struct mt=
k_pll_data *data,
>  {
>         struct mtk_clk_pll *pll;
>         struct clk_hw *hw;
> +       const struct clk_ops *pll_ops =3D data->ops ? data->ops : &mtk_pl=
l_ops;
>
>         pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
>         if (!pll)
>                 return ERR_PTR(-ENOMEM);
>
> -       hw =3D mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
> +       hw =3D mtk_clk_register_pll_ops(pll, data, base, pll_ops);
>         if (IS_ERR(hw))
>                 kfree(pll);
>
> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pl=
l.h
> index c4d06bb11516..7fdc5267a2b5 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -29,6 +29,7 @@ struct mtk_pll_data {
>         u32 reg;
>         u32 pwr_reg;
>         u32 en_mask;
> +       u32 fenc_sta_ofs;
>         u32 pd_reg;
>         u32 tuner_reg;
>         u32 tuner_en_reg;
> @@ -51,6 +52,7 @@ struct mtk_pll_data {
>         u32 en_clr_reg;
>         u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
>         u8 pcw_chg_bit;
> +       u8 fenc_sta_bit;
>  };
>
>  /*
> @@ -72,6 +74,8 @@ struct mtk_clk_pll {
>         void __iomem    *en_addr;
>         void __iomem    *en_set_addr;
>         void __iomem    *en_clr_addr;
> +       void __iomem    *fenc_addr;
> +       u32             fenc_mask;
>         const struct mtk_pll_data *data;
>  };
>
> @@ -82,6 +86,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data =
*plls, int num_plls,
>                              struct clk_hw_onecell_data *clk_data);
>
>  extern const struct clk_ops mtk_pll_ops;
> +extern const struct clk_ops mtk_pll_fenc_clr_set_ops;
>
>  static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
>  {
> --
> 2.39.5
>

