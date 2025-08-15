Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D87CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 03:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLAZnsZy8mysFSYeQu/zRgcIgupbd8f4aYQXFFI2MWI=; b=Pc0dhGfBvyiOFC30ZZujnNu6qI
	TNG24j4FjM089GZYwer92Lv1r5b3QtsOC4ErYctogL2nQJmSN7lZkaBxRyP9RWwoAiQIESYlZrpVm
	Nysmb9cbAAYftDRnXwDvBKCDBLk55cAcSwHpiZ93bIrEJsoxjCE6LT9By6omVDMGD+94coAQFnRFj
	TP+r5QxbCINLbaxYV+G+GxSZq4SBkr8TQ8cMUuQE3DI+8f2PXEuQ5t0+qMUe3iddHH+OSSJteEgCk
	9MMBaT4GrYHphhwAbhLfxArz4/BOKCaUyVsdYKQjQsARu12ZKGX23GeBJJDwHxKLDJ8BWFt+EWwVt
	4uy7uQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlRT-00000001Ksr-2tAC;
	Fri, 15 Aug 2025 03:49:23 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlKd-00000001Jrd-0Dwj
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 03:42:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55cdfcc0ceaso2472452e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 20:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229337; x=1755834137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLAZnsZy8mysFSYeQu/zRgcIgupbd8f4aYQXFFI2MWI=;
        b=XRpPgWzo19P5ADLts7nPtazUyPi2mwigs5T12TNiEpfkcYpPWR0oiB1lNzTnrfnxfJ
         9FzCe/IXVblWKqWDmgtsLBUMXy2xj3gROolco7N3aClHMRv/1i6GKiDu8K4x7mhXA3aC
         Rh6p0HZ8+UeoBS3UBOrNpHpDmEzzEAMaq3eEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229337; x=1755834137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLAZnsZy8mysFSYeQu/zRgcIgupbd8f4aYQXFFI2MWI=;
        b=J3cJSzHv6L+XWJjbv96qrKA/rFZKk/OCJxMtgQE7jeRXorD9dtxCVblJP6fsImMOTX
         aMDlP5WIejSNj+/TshZUAQ5FZgviCkxFwr1rm++Al5IabARwcinWES08SsMDlsulzRhg
         Y76adBgGfpCLx7UflNFLH+QI5bqHUCOpeqIfpsXOeqSt8Br5m0teW0psARz284yp+Otl
         r1Tl8+nONrvMxkIo66nmyTN1P/hYMaLljQqT0EJ7jwwcvys2Ky0Qm59ak8SL5uy2ZX3v
         Be3PbSG5FSHG5xPNdBxnWHQen95mPZFPweSveQM1F9NeMEqM9Z6NtEN/5hsGEZJJai0V
         lIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVLr4ZwpAgCC811rKx1yx/x6hcNfD4SUctYhTiNGytWidBLlyz53gvg25yM7KV/AJw5xTpiH3bL0evjhL52g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLrMILRED1t/tZOuiRhVYF8qys3+RFsbSmMgnQflR4OXnAD77L
	u+wq4yFfAVIpySqfD+cYP4vrEyYOdGB0bprUtGEdkQO0/fbgaSzhrk2MlbgCIoIzEZVcxDDtZ8h
	X23VH87BLQUB4h97B044cW5iV8tlcOcVMEvQcL83W
X-Gm-Gg: ASbGncs/LvMOIcp0GzXZInBVidQO+EZW99z+Y9Wbw1kKkjjDJvkQkL/vHGhV4JqMZuH
	hLLmzmL1fN229PikrW37e++m/A997/3eBpmHwpPZcX4lcjT9iszlTT1U8pGM3nQpRp/4x4sINyD
	JZf5AqrDZiCQvU8nbO4LJy7OBkAlUG5MfX35WV+c+pmJHWpIxTWUPTdaneBNK8owkOIaRNN0Bwd
	dTSTFLSnxofEh9Gmo1ggOdIc1LpqEJdYr1y6w==
X-Google-Smtp-Source: AGHT+IG4MHT9xlQA8q+aRzeI2TOWcXJ3eWM4zAEjXRmpGzb6++EC3UVO4G2WwSWQHvNm7WXOwl7nEj1UnHJTPSq8Yys=
X-Received: by 2002:a05:6512:230a:b0:55c:d6c9:38df with SMTP id
 2adb3069b0e04-55ce62cd258mr1499674e87.21.1755229337315; Thu, 14 Aug 2025
 20:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-7-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-7-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:42:06 +0900
X-Gm-Features: Ac12FXy2dCuPlbnz3eN56WS0B1sITUha0hiPx6j9G95oILsqMsxPgE4MrEBU4UM
Message-ID: <CAGXv+5GxJs03EcMt0jm-x_fDuy_RtCrnOmyJvVVgAP9O9R6E2Q@mail.gmail.com>
Subject: Re: [PATCH v4 06/27] clk: mediatek: clk-gate: Refactor
 mtk_clk_register_gate to use mtk_gate struct
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
X-CRM114-CacheID: sfid-20250814_204219_093937_1E3F919F 
X-CRM114-Status: GOOD (  17.22  )
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
> MT8196 uses a HW voter for gate enable/disable control, with
> set/clr/sta registers located in a separate regmap. Refactor
> mtk_clk_register_gate() to take a struct mtk_gate instead of individual
> parameters, avoiding the need to add three extra arguments to support
> HW voter register offsets.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++---------------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-g=
ate.c
> index 67d9e741c5e7..0375ccad4be3 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -152,12 +152,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv =
=3D {
>  };
>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
>
> -static struct clk_hw *mtk_clk_register_gate(struct device *dev, const ch=
ar *name,
> -                                        const char *parent_name,
> -                                        struct regmap *regmap, int set_o=
fs,
> -                                        int clr_ofs, int sta_ofs, u8 bit=
,
> -                                        const struct clk_ops *ops,
> -                                        unsigned long flags)
> +static struct clk_hw *mtk_clk_register_gate(struct device *dev,
> +                                               const struct mtk_gate *ga=
te,
> +                                               struct regmap *regmap)
>  {
>         struct mtk_clk_gate *cg;
>         int ret;
> @@ -167,17 +164,17 @@ static struct clk_hw *mtk_clk_register_gate(struct =
device *dev, const char *name
>         if (!cg)
>                 return ERR_PTR(-ENOMEM);
>
> -       init.name =3D name;
> -       init.flags =3D flags | CLK_SET_RATE_PARENT;
> -       init.parent_names =3D parent_name ? &parent_name : NULL;
> -       init.num_parents =3D parent_name ? 1 : 0;
> -       init.ops =3D ops;
> +       init.name =3D gate->name;
> +       init.flags =3D gate->flags | CLK_SET_RATE_PARENT;
> +       init.parent_names =3D gate->parent_name ? &gate->parent_name : NU=
LL;
> +       init.num_parents =3D gate->parent_name ? 1 : 0;
> +       init.ops =3D gate->ops;
>
>         cg->regmap =3D regmap;
> -       cg->set_ofs =3D set_ofs;
> -       cg->clr_ofs =3D clr_ofs;
> -       cg->sta_ofs =3D sta_ofs;
> -       cg->bit =3D bit;
> +       cg->set_ofs =3D gate->regs->set_ofs;
> +       cg->clr_ofs =3D gate->regs->clr_ofs;
> +       cg->sta_ofs =3D gate->regs->sta_ofs;
> +       cg->bit =3D gate->shift;

I'd rather see |struct mtk_clk_gate| (the runtime data) gain a pointer
to the static data |struct mtk_gate| instead of doing all the copying.
This is just needless duplication.

ChenYu

>         cg->hw.init =3D &init;
>
> @@ -228,13 +225,7 @@ int mtk_clk_register_gates(struct device *dev, struc=
t device_node *node,
>                         continue;
>                 }
>
> -               hw =3D mtk_clk_register_gate(dev, gate->name, gate->paren=
t_name,
> -                                           regmap,
> -                                           gate->regs->set_ofs,
> -                                           gate->regs->clr_ofs,
> -                                           gate->regs->sta_ofs,
> -                                           gate->shift, gate->ops,
> -                                           gate->flags);
> +               hw =3D mtk_clk_register_gate(dev, gate, regmap);
>
>                 if (IS_ERR(hw)) {
>                         pr_err("Failed to register clk %s: %pe\n", gate->=
name,
> --
> 2.39.5
>

