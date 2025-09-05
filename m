Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B061CA1010
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 04:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B01bmRXAH2QxWeqvPvWQshPIhSklJV5XtS7pyRMi7sU=; b=d8wQyXfS0TmoCBmScQHZLLeRuj
	6Db83F+iHaHXkruADqif0C7FC+Uli/1iNaO8y56VrWokQXSvBpX4t0t4a44zPuH5NPeCDK99ihxEW
	Z72MiFGBfM7ESla++uZhIibgfWY22jaQw99TqJZzh4KEOx4N0V+P32yw06YEZxuox62r6Iha35Qiy
	uiXB6By5kfOFuiyWZWfBmURrhqeHdlH4U0rS1vULKhef3IzHySbGndM2VIE+Ny1qczMB7cwd4MhRb
	i87PbJ1R7yLI+fUzvQ7a9pdeBzhXkxwV+TmgnCuLeiC7oUfQTVlDvHPlegjZnpNljxvCzl8yEQMR/
	dPFoOPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNoo-0000000GfGs-3NhA;
	Fri, 05 Sep 2025 04:12:58 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNnt-0000000Geys-1YRm
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 04:12:02 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-336b908cbaaso14811661fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Sep 2025 21:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045519; x=1757650319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B01bmRXAH2QxWeqvPvWQshPIhSklJV5XtS7pyRMi7sU=;
        b=H2zIyIaCSxdWZcvPA7gqBdEpv4EDMNN+LenIL9vimhhuynRcImaChq5uJ7DkXPNDO4
         Q+9TDDhy2wyOV7e5i1FZQLz91c93DDvanapXiIgdEzzHmj0hIu4YJ7Qqq47u8RfD7SXC
         HOFaIQAKegxzwFw7FJdYjfkU7RoEEcdg8kaow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045519; x=1757650319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B01bmRXAH2QxWeqvPvWQshPIhSklJV5XtS7pyRMi7sU=;
        b=Qb7GU168K9uthq0fHvrQwgw2jAHbcq/XOtCk8jaZ/w/r3dLCJCE1m2HDVm9WX/MQIL
         IfKe1gIUbAy6sedaKXIiBV3dhNtZ8q3gfe2CkykGHMM84RKxZEVG+A1gtWfzQNjjn758
         8+2y8jCwhcJodK6aHyZVpASf0nIo1GMZunNhbkpEqQkj/5ig1V8rGqB8wHVaxspDw354
         tsOeDbRLD9GQIUA3SlXfXDvOtjIlcPU1l6cYtY36gwicuIagNcLkZRydMKGtlRtryUJT
         pc9fdLIAFuPI38mt1sa12/NPtWABcOoQb9A6MVJz7I/PjEioqMAumcoqYwVjQ8MAF18E
         t65g==
X-Forwarded-Encrypted: i=1; AJvYcCUSUE1VV2eJcqryXjg69JpGjj5R2kvizSoC3nTd5ljlCV6t19ZQCt9DEwQvmsOlpXfEoFDTPi+PcLb+0i1g7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP/TcsvunQLEFbFWioAIK2R+nlrjawLUYb3h35sKLGSylq245E
	aeG5klu5o2jN826ID4kzFebefKz/N+TcZ8KqHydKHkV5ZnK0pbdVGzvrqesFTIpbYMZ2lpZkdJf
	QTgDuNl3UDqvHQ7WCtB07FJE0lK1X07x0jW/vtlrgT2BL8rW8Cc+uRA==
X-Gm-Gg: ASbGncswiCiAzWZRirMWmbEq2QiJYZK/Wl0Imd6ZQKpordlmPODm3C5qwF5GPsLRHnr
	+O7PgvoeT6XZEEP9uiGo9qlaiUqTaf9GTco+016NBGHF1X3N31gq751k534gtkdmoDuEotq4Qlh
	W9sB8qdYGwZtC/BdVWfuY1xcnQm/SKkgQ2XegItd1g98lJhBr3zANZKXphNvkGMFOlKYprJcbU6
	Hf1ayhdGB89rdvA8gtaj+KMDpe3Pwh9dN2rFQ==
X-Google-Smtp-Source: AGHT+IHYbfT4YDZymjaehpt2dXCn45+LCQHpybmvo8P6U3yHsdZLz6BM1N5npkfa7ulF9V213ctJPW+ye/twek7OL9E=
X-Received: by 2002:a2e:b88e:0:b0:336:831d:9e00 with SMTP id
 38308e7fff4ca-336caafcd05mr54910501fa.25.1757045519418; Thu, 04 Sep 2025
 21:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-6-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-6-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:11:48 +0800
X-Gm-Features: Ac12FXxJqW2o_w5uvmk3WVayIoiyKNEplrPyOCeaEvIjyu6tO3A5A0cEjAtjJqA
Message-ID: <CAGXv+5HaKD_2oUnYkRX+AswFre__ZKah27=+c-RH_W_J5Gio3A@mail.gmail.com>
Subject: Re: [PATCH v5 05/27] clk: mediatek: clk-mux: Add ops for mux gates
 with HW voter and FENC
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
X-CRM114-CacheID: sfid-20250904_211201_412036_8F8F127F 
X-CRM114-Status: GOOD (  21.59  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 use a HW voter for mux gate enable/disable control, along with a
> FENC status bit to check the status. Voting is performed using
> set/clr/upd registers, with a status bit used to verify the vote state.
> Add new set of mux gate clock operations with support for voting via
> set/clr/upd regs and FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mtk.h |  2 +
>  drivers/clk/mediatek/clk-mux.c | 73 +++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/clk-mux.h | 42 +++++++++++++++++++
>  3 files changed, 116 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index 11962fac43ea..c381d6a6d908 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -20,6 +20,8 @@
>
>  #define MHZ (1000 * 1000)
>
> +#define MTK_WAIT_HWV_DONE_US   30
> +
>  struct platform_device;
>
>  /*
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mu=
x.c
> index 3931d157b262..2c2679e158e7 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/compiler_types.h>
>  #include <linux/container_of.h>
> +#include <linux/dev_printk.h>
>  #include <linux/err.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> @@ -15,6 +16,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>
> +#include "clk-mtk.h"
>  #include "clk-mux.h"
>
>  #define MTK_WAIT_FENC_DONE_US  30
> @@ -22,6 +24,7 @@
>  struct mtk_clk_mux {
>         struct clk_hw hw;
>         struct regmap *regmap;
> +       struct regmap *regmap_hwv;
>         const struct mtk_mux *data;
>         spinlock_t *lock;
>         bool reparent;
> @@ -119,6 +122,41 @@ static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
>         return (val & BIT(mux->data->gate_shift)) =3D=3D 0;
>  }
>
> +static int mtk_clk_mux_hwv_fenc_enable(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       u32 val;
> +       int ret;
> +
> +       regmap_write(mux->regmap_hwv, mux->data->hwv_set_ofs,
> +                    BIT(mux->data->gate_shift));
> +
> +       ret =3D regmap_read_poll_timeout_atomic(mux->regmap_hwv, mux->dat=
a->hwv_sta_ofs,
> +                                             val, val & BIT(mux->data->g=
ate_shift), 0,
> +                                             MTK_WAIT_HWV_DONE_US);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_read_poll_timeout_atomic(mux->regmap, mux->data->f=
enc_sta_mon_ofs,
> +                                             val, val & BIT(mux->data->f=
enc_shift), 1,
> +                                             MTK_WAIT_FENC_DONE_US);
> +
> +       return ret;
> +}
> +
> +static void mtk_clk_mux_hwv_disable(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       u32 val;
> +
> +       regmap_write(mux->regmap_hwv, mux->data->hwv_clr_ofs,
> +                    BIT(mux->data->gate_shift));
> +
> +       regmap_read_poll_timeout_atomic(mux->regmap_hwv, mux->data->hwv_s=
ta_ofs,
> +                                       val, (val & BIT(mux->data->gate_s=
hift)),
> +                                       0, MTK_WAIT_HWV_DONE_US);
> +}
> +
>  static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
>  {
>         struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> @@ -190,6 +228,14 @@ static int mtk_clk_mux_determine_rate(struct clk_hw =
*hw,
>         return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
>  }
>
> +static bool mtk_clk_mux_uses_hwv(const struct clk_ops *ops)
> +{
> +       if (ops =3D=3D &mtk_mux_gate_hwv_fenc_clr_set_upd_ops)
> +               return true;
> +
> +       return false;
> +}
> +
>  const struct clk_ops mtk_mux_clr_set_upd_ops =3D {
>         .get_parent =3D mtk_clk_mux_get_parent,
>         .set_parent =3D mtk_clk_mux_set_parent_setclr_lock,
> @@ -217,9 +263,20 @@ const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_o=
ps =3D {
>  };
>  EXPORT_SYMBOL_GPL(mtk_mux_gate_fenc_clr_set_upd_ops);
>
> +const struct clk_ops mtk_mux_gate_hwv_fenc_clr_set_upd_ops =3D {
> +       .enable =3D mtk_clk_mux_hwv_fenc_enable,
> +       .disable =3D mtk_clk_mux_hwv_disable,
> +       .is_enabled =3D mtk_clk_mux_fenc_is_enabled,
> +       .get_parent =3D mtk_clk_mux_get_parent,
> +       .set_parent =3D mtk_clk_mux_set_parent_setclr_lock,
> +       .determine_rate =3D mtk_clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_GPL(mtk_mux_gate_hwv_fenc_clr_set_upd_ops);
> +
>  static struct clk_hw *mtk_clk_register_mux(struct device *dev,
>                                            const struct mtk_mux *mux,
>                                            struct regmap *regmap,
> +                                          struct regmap *regmap_hwv,
>                                            spinlock_t *lock)
>  {
>         struct mtk_clk_mux *clk_mux;
> @@ -235,8 +292,14 @@ static struct clk_hw *mtk_clk_register_mux(struct de=
vice *dev,
>         init.parent_names =3D mux->parent_names;
>         init.num_parents =3D mux->num_parents;
>         init.ops =3D mux->ops;
> +       if (mtk_clk_mux_uses_hwv(init.ops) && !regmap_hwv) {
> +               return dev_err_ptr_probe(
> +                       dev, -ENXIO,
> +                       "regmap not found for hardware voter clocks\n");
> +       }

Nit: The braces aren't really needed. But no need to respin just for this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

