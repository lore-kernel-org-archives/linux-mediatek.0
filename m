From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V5 5/8] clk: mediatek: add MUX_GATE_FLAGS_2
Date: Wed, 20 Feb 2019 11:37:09 -0800
Message-ID: <155069142918.77512.15726787055211591362@swboyd.mtv.corp.google.com>
References: <20190220025357.7354-1-wangyan.wang@mediatek.com> <20190220025357.7354-6-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220025357.7354-6-wangyan.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Michael Turquette <mturquette@baylibre.com>
Cc: wangyan wang <wangyan.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Quoting wangyan wang (2019-02-19 18:53:54)
> From: chunhui dai <chunhui.dai@mediatek.com>
>=20
> Add MUX_GATE_FLAGS_2 for the clock which needs to set two falgs.

s/falgs/flags/

> Such as some mux need to set the flags of "CLK_MUX_ROUND_CLOSEST".
>=20
> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> Signed-off-by: wangyan wang <wangyan.wang@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c |  2 +-
>  drivers/clk/mediatek/clk-mtk.h | 20 ++++++++++++++------
>  2 files changed, 15 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 9c0ae4278a94..2ed996404804 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -167,7 +167,7 @@ struct clk *mtk_clk_register_composite(const struct m=
tk_composite *mc,
>                 mux->mask =3D BIT(mc->mux_width) - 1;
>                 mux->shift =3D mc->mux_shift;
>                 mux->lock =3D lock;
> -
> +               mux->flags =3D mc->mux_flags;
>                 mux_hw =3D &mux->hw;
>                 mux_ops =3D &clk_mux_ops;
> =20
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index f83c2bbb677e..4b88d196d52f 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -81,15 +81,13 @@ struct mtk_composite {
>         signed char divider_shift;
>         signed char divider_width;
> =20
> +       unsigned char mux_flags;

Why isn't it an unsigned long? Isn't this supposed to match the
frameworks version of the clk flags?
