Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r2PI8npTldXrYm5swcIQqgUeGURrNMGas5C2c9JaIE=; b=wMkfJT8AR7SgB7k5IsdV5t0rAg
	x+xWScHVL7e2J6QWx0uRLj+j/9BfCX155yOFXgDR0rA/arXY3DAZ8k4WKJpobZ3EdE5pp/RvQ9l/H
	JjcjzMbOOZ0hWPKO/J8edsLIXiAxm99wr6dKVZQ/1TU6zRS5EqJJ5XFFSMW3ohniUAuiJV54eXppb
	cmeHb3fStt5CDY1Zl1buIBz9vFQ49IvShIE+jHX27b8k0BxYSi4hy8NqjL6BOQHaKkmMYK0xXDRsG
	pC5qYZK2u+vdmSI/+3K/Ti/V1C5RoHKhcwicE0MvNQHVtQqTO12Yk+C5UsIComsE9j0XW+Rd56wyX
	Nak2draw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDZp-00A9Dh-8J; Tue, 12 Jul 2022 10:57:13 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDZc-00A94S-Eu
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 10:57:02 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 136so13282547ybl.5
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0r2PI8npTldXrYm5swcIQqgUeGURrNMGas5C2c9JaIE=;
        b=gbnll282XWEa2Cv3XRfHOwWx1luDO4K0j9d69VE9kZrmUW9ZdJJDn/at4nhkuNNWYl
         vl0lkRCHaSoFrmJtg7Wj6nesryEg+H7O56iRPCUcTKPSE2JAAxNjFnMI3V+XanDTxApY
         hcl+Rd6vZUdoxjVSlBePicxzqsr6aHc7g+568=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0r2PI8npTldXrYm5swcIQqgUeGURrNMGas5C2c9JaIE=;
        b=39xy93PHrmda9kYc3cfosUxMJNfzBjSs3xeCr8XpWLMfwf3zfYOcnVt3ajhg/9dXr6
         YVuhhmgExMAkyz2by6VZQoOubomu/QGUh9e/O429qgObA4TMxD1W9dvg4tgzJ2EnphvF
         1i5lrjpO3mR9wnSkZpd3Orfdkd0W43i1JmHi+m/2FFftZFplPElww3cHJvvoZUYkR8Gj
         jLRbxH+LYtc7J1tDRBLiFMQDBTtDzbhSds+MpS7imG05BMkp8Qk5iekCuaGn5DOETVXp
         +0WYtJGl+jApyDhECzp2wJ08QjZ3KlVZ7Dug17qk62J3SeTuOCmZxI40Q+/RG6JHiuR4
         SQBw==
X-Gm-Message-State: AJIora+1tyjzWuX83Q/iuPN5r2u8CrPcE4oL06eGAoLYPBdXT7B8VuDF
	vuZQCCNi3DRkp1onybZH+gQHFmzLKfmPNM6+QvAShw==
X-Google-Smtp-Source: AGRyM1tMdKQc/VxwTJCPAq0g/uLp2gj0u9dLb81EOH7w4A6FiGUYX83Iy1Tv2VtLUBxwtW/sCiBHolOxnWHtS82nzEo=
X-Received: by 2002:a25:d852:0:b0:66f:259c:17b6 with SMTP id
 p79-20020a25d852000000b0066f259c17b6mr11036883ybg.438.1657623417430; Tue, 12
 Jul 2022 03:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220711205733.203963-1-nfraprado@collabora.com>
 <CAGXv+5Enkz20o8BLXmnCUBmB930sH+20U=XvTWA82neaiqqc2A@mail.gmail.com> <473aa749-fcfe-bd38-0d83-95375aeef8a3@collabora.com>
In-Reply-To: <473aa749-fcfe-bd38-0d83-95375aeef8a3@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 Jul 2022 18:56:46 +0800
Message-ID: <CAGXv+5E+HVi2kxkRrwhWhq2XgbmfCxj+ZywPT4orBXTxtJ7X1Q@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Don't check HW status for mt8192/5's
 imp_iic_wrap clocks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Stephen Boyd <sboyd@kernel.org>, kernel@collabora.com, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Miles Chen <miles.chen@mediatek.com>, Ran Jianping <ran.jianping@zte.com.cn>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_035700_508215_73B12E5E 
X-CRM114-Status: GOOD (  32.36  )
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

On Tue, Jul 12, 2022 at 6:55 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/07/22 12:44, Chen-Yu Tsai ha scritto:
> > Hi,
> >
> > On Tue, Jul 12, 2022 at 4:57 AM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> >>
> >> The imp_iic_wrap clocks on mt8192/mt8195 require that the i2c_sel pare=
nt
> >> clock be enabled before their hardware status can be checked. Since th=
is
> >> wasn't taken into account, reading from the clk_summary debugfs file
> >> would cause the system to completely freeze.
> >>
> >> Assuming that this clock is managed only by the kernel, and not by any
> >> firmware, simply drop the is_enabled() optional callback and instead
> >> rely on the enable count for the imp_iic_wrap clocks.
> >
> > That's the wrong way to go about it.
> >
> > The I2C clocks already have the CLK_OPS_PARENT_ENABLE flag set. So the
> > issue is that somewhere in the clk core, a piece of code is not honorin=
g
> > that flag.
> >
> > And it seems that's in more than one place.
> >
>
> Uhm, you're right. I gave my Tested-by, but not a Reviewed-by because I
> wasn't really convinced about this solution being the best.
>
> Now that I think of it, the solution may be as simple as:
>
> clk.c
>
> static bool clk_core_is_enabled(struct clk_core *core)
> {
>         bool ret =3D false;
>
>         /*
>          * If this clock needs parent enabled, but its parent is
>          * off, we directly return false for two reasons:
>          * 1. This clock being enabled would be impossible
>          * 2. The platform may crash for unclocked access while
>          *    reading the status of this clock (where a .is_enabled
>          *    callback is provided).
>          */
>         if (core->flags & CLK_OPS_PARENT_ENABLE &&
>             !clk_core_is_enabled(core->parent))
>                 return false;
>
>         ... etc etc etc ...
> }
>
> N=C3=ADcolas, did you try this approach?

I have a patch ready, but I got distracted by other stuff today.

ChenYu

> > Regards
> > ChenYu
> >
> >> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >>
> >> ---
> >>
> >>   drivers/clk/mediatek/clk-gate.c                | 6 ++++++
> >>   drivers/clk/mediatek/clk-gate.h                | 1 +
> >>   drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c | 2 +-
> >>   drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 2 +-
> >>   4 files changed, 9 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/cl=
k-gate.c
> >> index 421806236228..8e7c719a69b3 100644
> >> --- a/drivers/clk/mediatek/clk-gate.c
> >> +++ b/drivers/clk/mediatek/clk-gate.c
> >> @@ -124,6 +124,12 @@ static void mtk_cg_disable_inv_no_setclr(struct c=
lk_hw *hw)
> >>          mtk_cg_clr_bit_no_setclr(hw);
> >>   }
> >>
> >> +const struct clk_ops mtk_clk_gate_ops_setclr_counted =3D {
> >> +       .enable         =3D mtk_cg_enable,
> >> +       .disable        =3D mtk_cg_disable,
> >> +};
> >> +EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_counted);
> >> +
> >>   const struct clk_ops mtk_clk_gate_ops_setclr =3D {
> >>          .is_enabled     =3D mtk_cg_bit_is_cleared,
> >>          .enable         =3D mtk_cg_enable,
> >> diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/cl=
k-gate.h
> >> index d9897ef53528..b5502b2911f5 100644
> >> --- a/drivers/clk/mediatek/clk-gate.h
> >> +++ b/drivers/clk/mediatek/clk-gate.h
> >> @@ -19,6 +19,7 @@ extern const struct clk_ops mtk_clk_gate_ops_setclr;
> >>   extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
> >>   extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
> >>   extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
> >> +extern const struct clk_ops mtk_clk_gate_ops_setclr_counted;
> >>
> >>   struct mtk_gate_regs {
> >>          u32 sta_ofs;
> >> diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c b/drivers/=
clk/mediatek/clk-mt8192-imp_iic_wrap.c
> >> index 700356ac6a58..900ee601169c 100644
> >> --- a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
> >> +++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
> >> @@ -20,7 +20,7 @@ static const struct mtk_gate_regs imp_iic_wrap_cg_re=
gs =3D {
> >>
> >>   #define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)              =
   \
> >>          GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _s=
hift,      \
> >> -               &mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
> >> +               &mtk_clk_gate_ops_setclr_counted, CLK_OPS_PARENT_ENABL=
E)
> >>
> >>   static const struct mtk_gate imp_iic_wrap_c_clks[] =3D {
> >>          GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_I2C10, "imp_iic_wrap_c_i=
2c10", "infra_i2c0", 0),
> >> diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/=
clk/mediatek/clk-mt8195-imp_iic_wrap.c
> >> index fbc809d05072..e50a77b844f4 100644
> >> --- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> >> +++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> >> @@ -18,7 +18,7 @@ static const struct mtk_gate_regs imp_iic_wrap_cg_re=
gs =3D {
> >>
> >>   #define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)              =
           \
> >>          GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _s=
hift,      \
> >> -               &mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
> >> +               &mtk_clk_gate_ops_setclr_counted, CLK_OPS_PARENT_ENABL=
E)
> >>
> >>   static const struct mtk_gate imp_iic_wrap_s_clks[] =3D {
> >>          GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C5, "imp_iic_wrap_s_i2=
c5", "top_i2c", 0),
> >> --
> >> 2.37.0
> >>
>
>

