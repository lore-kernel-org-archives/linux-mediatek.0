From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V5 5/8] clk: mediatek: add MUX_GATE_FLAGS_2
Date: Thu, 21 Feb 2019 23:55:00 -0800
Message-ID: <155082210099.77512.4042430864962937771@swboyd.mtv.corp.google.com>
References: <20190220025357.7354-1-wangyan.wang@mediatek.com> <20190220025357.7354-6-wangyan.wang@mediatek.com> <155069142918.77512.15726787055211591362@swboyd.mtv.corp.google.com> <1550716451.23876.5.camel@mszsdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550716451.23876.5.camel@mszsdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk14994 <wangyan.wang@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Quoting mtk14994 (2019-02-20 18:34:11)
> Dear Stephen,
> > +       unsigned char mux_flags;
> >=20
> > Why isn't it an unsigned long? Isn't this supposed to match the
> > frameworks version of the clk flags?
>=20
> ---->   it is unsigned char mux_flags ,becasuse struct clk_mux {
>=20
> ....
> ....
> u8 flags;
> ....
> }
>=20
> it is matched when use " mux->flags =3D mc->mux_flags;"
>=20

Please try to not top-post.

Ok I thought it was the generic clk flags, not the mux specific flag
bits. Sounds fine then, but I would sort of expect it to match the type
in clk_mux then, i.e. be a u8 instead of an unsigned char (yes it's the
same in the end but it looks different at a glance).
