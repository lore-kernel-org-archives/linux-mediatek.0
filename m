Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5A6CA0FE8
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAVZJpgvllT4Mhe7ltBfIHVEtwo4VMq7SD8mCyRK+bY=; b=iwpoQB5AUXBVZya4BXcVP+GF31
	qUNBugKDUhZsB/UjAusmsfQvJeC8glwB/deZNwzZar2Ayhf0F19p3MqQ1FuyKmkOdqQj6Y6HU6WUb
	JstxOpYnfzNBIha6LAQxAxnQRrpGVvQbj4cwFlxTfgKmF+8AGOyTrpwLaR4fSVzRQRMczmBJZHZgt
	9DaaAYhDPEt1/T7+3wZz4AEpAqgzCwwdX55KAI49ziB/UR/NE/6piGSDvbLh48t2OHgp8tSXziq0d
	yGjkyKkNAtEeZSdt6MdlE08AKL0sJ75OzCQ4beLbZsolIDnJme0Z1SqpAp6Ej6IFOytJ2Dn0xGAlP
	g0MZQ9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYf-00000008kEI-0LpE;
	Mon, 25 Aug 2025 17:00:37 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYXH-00000008JeT-2cp5
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Aug 2025 14:51:06 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55f4978bc0dso582007e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Aug 2025 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133461; x=1756738261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAVZJpgvllT4Mhe7ltBfIHVEtwo4VMq7SD8mCyRK+bY=;
        b=eaB8mlJl4YAbBhNf5KksFIjU/NG2bzvu57XJ0D2QHrTI+VLZkEVCFzSyoBPudTw90q
         TPgImQLVzQy3JSGWbsViwjjicmoEvLQi7cFpgkixhgZC1yV2QFYf2VmzTxnyH9Z6RmbC
         59vAL1fcZzaCPb+a2dYcZd5yLrR0f9yr3B55c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133461; x=1756738261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAVZJpgvllT4Mhe7ltBfIHVEtwo4VMq7SD8mCyRK+bY=;
        b=uxIQEiPhhY6EstHB53JhmgxiMlo47oI9AaI5lCPHBcwkDJTDslH9iN0riljRhsPchu
         8av3xlm09BrV6nket4z638POe0Qwutw06xZcxZp3WejW3cMmT30zE0kmQaeM1RYBz46Z
         4qsS4TryGmlgioBGYxMrhhqA0h+kZoqdNUYt+dnhOwf+JbSZYQLiIX174NIC4OTkFNfN
         9eSNRWc92kLwelqlvybPFZRKFfq5rr2btCyM52r+vIVG0W03FUsObs8y/hRQS4LezD/a
         mHWOe7Pn9N8QsjFTJdFA5g7GIkrUiUFCGLHm8AHUeaKzRG5PI7P0R0H789Gvk0KwFoYx
         G0PA==
X-Forwarded-Encrypted: i=1; AJvYcCWyMDnDyxhGZ/N5JVXruTEMj5tQbOxATQgcCBHisgvik4UEaK60Of1MF8OYDOiOnrTE77u5NDAhO9hWrDQTwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjC056a/mvJ2J2rTS5Lfi6ZQnX8+deYfuMUjO+ApMamfk7iI7u
	Oli/VfpAcwSTHwwIhlxrLX7cih7qAacVmk8PlV77eMkGa7zAEMKyLNL/yyx6FyIDw4jzq9m9akI
	GqZI7f+Fi+3INHU1aOO8ZibxDQCIXdAq5kRfQygXW
X-Gm-Gg: ASbGnctS3+4qjzHg/Ld7mFHVTWx7bIgRnCZreQ3b/c66aM+j755/wqlRfxZCgKirPu4
	HSjBVb85k68WUCCanzq5s8yToKEiA90LI2h9fo1k6YtZhB4BG2a9JlKBCn0F7sD/tpqi5UdAJnp
	vKQGC0INJvlKwVT71x7KjiabpL6toHKjeJ+YmlSPG5DlI6irGaSDcsvuv0Qz/7UPt4lZs4rx5gm
	/KoJTid5A==
X-Google-Smtp-Source: AGHT+IEe7w9pVPejypkcEJDKdxceIu7p/7dzKMCCMCcrZIlfu17d7XkyMHIibXiLNiCq+NAGnq/H6nnnbCqYo6xbSyU=
X-Received: by 2002:a05:6512:230c:b0:55f:496e:99b1 with SMTP id
 2adb3069b0e04-55f496ea2e6mr746059e87.31.1756133461346; Mon, 25 Aug 2025
 07:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HRKFrdjjXkwN6=OLtk=bK3C3mBnrDtmkEWeuxjz0pFKg@mail.gmail.com>
 <20250825125141.209860-1-laura.nao@collabora.com>
In-Reply-To: <20250825125141.209860-1-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Aug 2025 16:50:50 +0200
X-Gm-Features: Ac12FXymdIbpYgVvUuTRHx1l6uFl8EsOrYD9IbMYYkm6u39sg-0GTOO7AjUR4wY
Message-ID: <CAGXv+5HQrMY+osCZKVOq28fQi-Be-eZ=_-=5HcrkacivHekOTQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/27] clk: mediatek: clk-gate: Add ops for gates with
 HW voter
To: Laura Nao <laura.nao@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, guangjie.song@mediatek.com, kernel@collabora.com, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	mturquette@baylibre.com, netdev@vger.kernel.org, nfraprado@collabora.com, 
	p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org, 
	sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_075103_692698_35719CD9 
X-CRM114-Status: GOOD (  22.65  )
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

On Mon, Aug 25, 2025 at 2:52=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On 8/15/25 05:37, Chen-Yu Tsai wrote:
> > On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.=
com> wrote:
> >>
> >> MT8196 use a HW voter for gate enable/disable control. Voting is
> >> performed using set/clr regs, with a status bit used to verify the vot=
e
> >> state. Add new set of gate clock operations with support for voting vi=
a
> >> set/clr regs.
> >>
> >> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
> >> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> >> ---
> >>  drivers/clk/mediatek/clk-gate.c | 77 +++++++++++++++++++++++++++++++-=
-
> >>  drivers/clk/mediatek/clk-gate.h |  3 ++
> >>  2 files changed, 77 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/cl=
k-gate.c
> >> index 0375ccad4be3..426f3a25763d 100644
> >> --- a/drivers/clk/mediatek/clk-gate.c
> >> +++ b/drivers/clk/mediatek/clk-gate.c
> >> @@ -5,6 +5,7 @@
> >>   */
> >>
> >>  #include <linux/clk-provider.h>
> >> +#include <linux/dev_printk.h>
> >>  #include <linux/mfd/syscon.h>
> >>  #include <linux/module.h>
> >>  #include <linux/printk.h>
> >> @@ -12,14 +13,19 @@
> >>  #include <linux/slab.h>
> >>  #include <linux/types.h>
> >>
> >> +#include "clk-mtk.h"
> >>  #include "clk-gate.h"
> >>
> >>  struct mtk_clk_gate {
> >>         struct clk_hw   hw;
> >>         struct regmap   *regmap;
> >> +       struct regmap   *regmap_hwv;
> >>         int             set_ofs;
> >>         int             clr_ofs;
> >>         int             sta_ofs;
> >> +       unsigned int    hwv_set_ofs;
> >> +       unsigned int    hwv_clr_ofs;
> >> +       unsigned int    hwv_sta_ofs;
> >>         u8              bit;
> >>  };
> >>
> >> @@ -100,6 +106,28 @@ static void mtk_cg_disable_inv(struct clk_hw *hw)
> >>         mtk_cg_clr_bit(hw);
> >>  }
> >>
> >> +static int mtk_cg_hwv_set_en(struct clk_hw *hw, bool enable)
> >> +{
> >> +       struct mtk_clk_gate *cg =3D to_mtk_clk_gate(hw);
> >> +       u32 val;
> >> +
> >> +       regmap_write(cg->regmap_hwv, enable ? cg->hwv_set_ofs : cg->hw=
v_clr_ofs, BIT(cg->bit));
> >> +
> >> +       return regmap_read_poll_timeout_atomic(cg->regmap_hwv, cg->hwv=
_sta_ofs, val,
> >> +                                              val & BIT(cg->bit),
> >> +                                              0, MTK_WAIT_HWV_DONE_US=
);
> >> +}
> >> +
> >> +static int mtk_cg_hwv_enable(struct clk_hw *hw)
> >> +{
> >> +       return mtk_cg_hwv_set_en(hw, true);
> >> +}
> >> +
> >> +static void mtk_cg_hwv_disable(struct clk_hw *hw)
> >> +{
> >> +       mtk_cg_hwv_set_en(hw, false);
> >> +}
> >> +
> >>  static int mtk_cg_enable_no_setclr(struct clk_hw *hw)
> >>  {
> >>         mtk_cg_clr_bit_no_setclr(hw);
> >> @@ -124,6 +152,15 @@ static void mtk_cg_disable_inv_no_setclr(struct c=
lk_hw *hw)
> >>         mtk_cg_clr_bit_no_setclr(hw);
> >>  }
> >>
> >> +static bool mtk_cg_uses_hwv(const struct clk_ops *ops)
> >> +{
> >> +       if (ops =3D=3D &mtk_clk_gate_hwv_ops_setclr ||
> >> +           ops =3D=3D &mtk_clk_gate_hwv_ops_setclr_inv)
> >> +               return true;
> >> +
> >> +       return false;
> >> +}
> >> +
> >>  const struct clk_ops mtk_clk_gate_ops_setclr =3D {
> >>         .is_enabled     =3D mtk_cg_bit_is_cleared,
> >>         .enable         =3D mtk_cg_enable,
> >> @@ -138,6 +175,20 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv =
=3D {
> >>  };
> >>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_inv);
> >>
> >> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr =3D {
> >> +       .is_enabled     =3D mtk_cg_bit_is_cleared,
> >> +       .enable         =3D mtk_cg_hwv_enable,
> >> +       .disable        =3D mtk_cg_hwv_disable,
> >> +};
> >> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr);
> >> +
> >> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv =3D {
> >> +       .is_enabled     =3D mtk_cg_bit_is_set,
> >> +       .enable         =3D mtk_cg_hwv_enable,
> >> +       .disable        =3D mtk_cg_hwv_disable,
> >> +};
> >> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr_inv);
> >> +
> >>  const struct clk_ops mtk_clk_gate_ops_no_setclr =3D {
> >>         .is_enabled     =3D mtk_cg_bit_is_cleared,
> >>         .enable         =3D mtk_cg_enable_no_setclr,
> >> @@ -153,8 +204,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_in=
v =3D {
> >>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
> >>
> >>  static struct clk_hw *mtk_clk_register_gate(struct device *dev,
> >> -                                               const struct mtk_gate =
*gate,
> >> -                                               struct regmap *regmap)
> >> +                                           const struct mtk_gate *gat=
e,
> >> +                                           struct regmap *regmap,
> >> +                                           struct regmap *regmap_hwv)
> >>  {
> >>         struct mtk_clk_gate *cg;
> >>         int ret;
> >> @@ -169,11 +221,22 @@ static struct clk_hw *mtk_clk_register_gate(stru=
ct device *dev,
> >>         init.parent_names =3D gate->parent_name ? &gate->parent_name :=
 NULL;
> >>         init.num_parents =3D gate->parent_name ? 1 : 0;
> >>         init.ops =3D gate->ops;
> >> +       if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
> >> +               dev_err(dev, "regmap not found for hardware voter cloc=
ks\n");
> >> +               return ERR_PTR(-ENXIO);
> >
> > return dev_err_probe()?
> >
> > I believe the same applies to the previous patch.
> >
>
> mtk_clk_register_gate and mtk_clk_register_mux actually both return a
> struct clk_hw *.

Oops, you're right. If that case I believe dev_err_ptr_probe() could be
used?

ChenYu

