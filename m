From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 00/12] Mediatek MT8183 clock and scpsys support
Date: Wed, 20 Feb 2019 11:18:50 -0800
Message-ID: <155069033021.77512.14493210110678229730@swboyd.mtv.corp.google.com>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com> <20190201083016.25856-2-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190201083016.25856-2-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-02-01 00:30:04)
> This series is based on v5.0-rc1 and most of changes are extracted from s=
eries below
> (clock/scpsys common changes for both MT8183 & MT6765)
> https://patchwork.kernel.org/patch/10528495/
> (clock support of MT8183)
> https://patchwork.kernel.org/patch/10549891/
>=20
> The whole series is composed of
> clock common changes for both MT8183 & MT6765 (PATCH 1-3),
> scpsys common changes for both MT8183 & MT6765 (PATCH 4),
> clock support of MT8183 (PATCH 5-8),
> scpsys support of MT8183 (PATCH 9-11) and
> resend a clock patch long time ago(PTACH 12).

What's the merge plan here? Do you want me to apply these patches to clk
tree? Will someone be sending me a pull request for mediatek clk changes
this cycle? It's getting pretty late for much of anything making this
upcoming merge window.
