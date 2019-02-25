From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V6 6/8] clk: mediatek: using CLK_MUX_ROUND_CLOSEST for the clock of dpi1_sel
Date: Mon, 25 Feb 2019 09:19:44 -0800
Message-ID: <155111518481.77512.14619508720748400478@swboyd.mtv.corp.google.com>
References: <20190225020912.29120-1-wangyan.wang@mediatek.com> <20190225020912.29120-7-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225020912.29120-7-wangyan.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Michael Turquette <mturquette@baylibre.com>
Cc: wangyan wang <wangyan.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Quoting wangyan wang (2019-02-24 18:09:10)
> From: chunhui dai <chunhui.dai@mediatek.com>
>=20
> The MUX clock of dpi1_sel should select the closet clock for itself.
> We could add this flag to enable this function of MUX in CCF.
>=20
> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> Signed-off-by: wangyan wang <wangyan.wang@mediatek.com>
> ---

Applied to clk-next
