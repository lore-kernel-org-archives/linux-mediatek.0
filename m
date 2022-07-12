Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D58C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmQPMJ1DiJROJe1lhE0z8FSNyRXm8EQ9gl74gm1Aw14=; b=fsgcPp+nONPtkE9XTEYuJBSB5H
	1KhMPONhVBZiFXX36hAJkEZUs3BsEfurOQeoG+WJsIlDvOco75uw0Ew80AVvh4qYneU5dADO7VwME
	B5NvC6QTLOtiyEepOhjxFuEitq+aHgjKewdUfhbvewSRN96lNyJUgbG9TWYw8Djo4hocIVJEIU1UQ
	ngo9PfQDPZNnw8he9YFFoxc9D4VKaumL3RRFWTSjtZM/DebZmPCFyTod7YrSgKc9fckwXjXmr8Jj0
	FO2r+/Mi7a6YOyH2E70QW+G0UW+k+Hv5PXjYR9r5ZeskjGQFNJeP1efJNBjdZz1n7K9ZQolROmoBx
	71zcsA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDNn-00A1U9-Ol; Tue, 12 Jul 2022 10:44:47 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDNc-00A1Op-Oo
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 10:44:38 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31d7db3e6e5so45936057b3.11
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 03:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vmQPMJ1DiJROJe1lhE0z8FSNyRXm8EQ9gl74gm1Aw14=;
        b=CLQ8d2KWcE8rsdb+f8e62PbO1v5gBKB9dlN9JbRFCdzixpfdHDWJUbMl7Bv2RAfjMw
         sm7aGDGQZoVgAi49/7imM0aISJuLGTVf9CwrAJfGRpAm2GixL1XxEv+8xXikiy1oP083
         ogigiGQlHK/2dIhq+gTU1/UYH4RKT+LFSXvNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vmQPMJ1DiJROJe1lhE0z8FSNyRXm8EQ9gl74gm1Aw14=;
        b=Ouas3kFGNdPhXLyhWZ1xaBmARE9qycXpzzFTklP4OYA38pPRGXCFH9uh2CibfI1hpd
         FfvXPcl1S0qHKI0civXiC4PiR4HOD8Nd4XFP46RXwPH5dBkTV5Q8Cpqr8ynPzMSc9nGP
         hebKT3PVxosmjYlXBS+Od92pj9waGQZz4Lmh3z4hUeb0zmMscDeA2MKyY8C6UK8Gc1wH
         p33mQ5vaJOqaTsKgyD0oCa9JoKmJvJ8S53OMB7O8KQihSzfEq0F3PYeMW9DKeRplkSJp
         zc4JkFWEwGr4xPuq9438UYnhaTo0x0AuuHEpLlFBTVGQuYFVGb/6k06Vn2rzQ8JF2pYQ
         vjMw==
X-Gm-Message-State: AJIora8V3qNbV4N6ueD4/pdveLZOg1XsZB+VqjdYkgUdv698GANI+5Hh
	ePqLk3sZjPrYi+nxK07dzbaRaBWSdIugLShVS/s8Jw==
X-Google-Smtp-Source: AGRyM1s5MHY5VheSrcFt+WwyHBLQCd/kxgtkS6UNU6SUcXuOaVFJms5TS1N+k641yMJKjDqYpOj0LJj/Rn2PsodYkVc=
X-Received: by 2002:a81:5909:0:b0:31c:864f:9464 with SMTP id
 n9-20020a815909000000b0031c864f9464mr24246994ywb.165.1657622675241; Tue, 12
 Jul 2022 03:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220711205733.203963-1-nfraprado@collabora.com>
In-Reply-To: <20220711205733.203963-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 Jul 2022 18:44:24 +0800
Message-ID: <CAGXv+5Enkz20o8BLXmnCUBmB930sH+20U=XvTWA82neaiqqc2A@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Don't check HW status for mt8192/5's
 imp_iic_wrap clocks
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Miles Chen <miles.chen@mediatek.com>, Ran Jianping <ran.jianping@zte.com.cn>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_034436_851041_92691E00 
X-CRM114-Status: GOOD (  21.32  )
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

Hi,

On Tue, Jul 12, 2022 at 4:57 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> The imp_iic_wrap clocks on mt8192/mt8195 require that the i2c_sel parent
> clock be enabled before their hardware status can be checked. Since this
> wasn't taken into account, reading from the clk_summary debugfs file
> would cause the system to completely freeze.
>
> Assuming that this clock is managed only by the kernel, and not by any
> firmware, simply drop the is_enabled() optional callback and instead
> rely on the enable count for the imp_iic_wrap clocks.

That's the wrong way to go about it.

The I2C clocks already have the CLK_OPS_PARENT_ENABLE flag set. So the
issue is that somewhere in the clk core, a piece of code is not honoring
that flag.

And it seems that's in more than one place.

Regards
ChenYu

> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
>  drivers/clk/mediatek/clk-gate.c                | 6 ++++++
>  drivers/clk/mediatek/clk-gate.h                | 1 +
>  drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c | 2 +-
>  drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 2 +-
>  4 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-g=
ate.c
> index 421806236228..8e7c719a69b3 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -124,6 +124,12 @@ static void mtk_cg_disable_inv_no_setclr(struct clk_=
hw *hw)
>         mtk_cg_clr_bit_no_setclr(hw);
>  }
>
> +const struct clk_ops mtk_clk_gate_ops_setclr_counted =3D {
> +       .enable         =3D mtk_cg_enable,
> +       .disable        =3D mtk_cg_disable,
> +};
> +EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_counted);
> +
>  const struct clk_ops mtk_clk_gate_ops_setclr =3D {
>         .is_enabled     =3D mtk_cg_bit_is_cleared,
>         .enable         =3D mtk_cg_enable,
> diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-g=
ate.h
> index d9897ef53528..b5502b2911f5 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -19,6 +19,7 @@ extern const struct clk_ops mtk_clk_gate_ops_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
> +extern const struct clk_ops mtk_clk_gate_ops_setclr_counted;
>
>  struct mtk_gate_regs {
>         u32 sta_ofs;
> diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c b/drivers/clk=
/mediatek/clk-mt8192-imp_iic_wrap.c
> index 700356ac6a58..900ee601169c 100644
> --- a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
> +++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
> @@ -20,7 +20,7 @@ static const struct mtk_gate_regs imp_iic_wrap_cg_regs =
=3D {
>
>  #define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)                 \
>         GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift=
,      \
> -               &mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
> +               &mtk_clk_gate_ops_setclr_counted, CLK_OPS_PARENT_ENABLE)
>
>  static const struct mtk_gate imp_iic_wrap_c_clks[] =3D {
>         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_I2C10, "imp_iic_wrap_c_i2c10=
", "infra_i2c0", 0),
> diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk=
/mediatek/clk-mt8195-imp_iic_wrap.c
> index fbc809d05072..e50a77b844f4 100644
> --- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> +++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> @@ -18,7 +18,7 @@ static const struct mtk_gate_regs imp_iic_wrap_cg_regs =
=3D {
>
>  #define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)                  =
       \
>         GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift=
,      \
> -               &mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
> +               &mtk_clk_gate_ops_setclr_counted, CLK_OPS_PARENT_ENABLE)
>
>  static const struct mtk_gate imp_iic_wrap_s_clks[] =3D {
>         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C5, "imp_iic_wrap_s_i2c5",=
 "top_i2c", 0),
> --
> 2.37.0
>

