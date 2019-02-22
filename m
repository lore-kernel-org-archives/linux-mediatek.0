From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 00/12] Mediatek MT8183 clock and scpsys support
Date: Thu, 21 Feb 2019 23:48:09 -0800
Message-ID: <155082168901.77512.12893153125579041936@swboyd.mtv.corp.google.com>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com> <20190201083016.25856-2-weiyi.lu@mediatek.com> <155069033021.77512.14493210110678229730@swboyd.mtv.corp.google.com> <b7abe484-71c1-5ec0-796c-544f1ac5d6f5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b7abe484-71c1-5ec0-796c-544f1ac5d6f5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Matthias Brugger (2019-02-21 00:36:24)
>=20
>=20
> On 20/02/2019 20:18, Stephen Boyd wrote:
> >=20
> > What's the merge plan here? Do you want me to apply these patches to clk
> > tree? Will someone be sending me a pull request for mediatek clk changes
> > this cycle? It's getting pretty late for much of anything making this
> > upcoming merge window.
> >=20
>=20
> As far as I can see, the clock patches are independent, so I think it is =
OK to
> take them. SCPSYS patches will go through my tree once they are in shape.

Ok great. When patches for clks are interspersed throughout the patch
series it makes me think that something later in the series depends on
something that isn't a clk patch so then I can't apply it.

>=20
> Do you prefer to get pull requests for clock patches? I wasn't aware of t=
hat.
> But if you prefer that, we can find someone who prepares every merge wind=
ow a
> pull request.
>=20

I don't really care one way or the other about pull requests vs.
manually applying patches. It helps if someone wants to pick the patches
up and send them along when there are complex dependencies between the
clk patches and dts bits or something like that. It also helps if
there's someone else with knowledge of the particular SoC saying "these
are good, please pull these patches". Subsystem maintainers obviously
aren't experts in all SoCs and their various quirks, plus datasheets
aren't always so widely available, so sharing the load with SoC
maintainers who are familiar with the hardware usually makes a lot of
sense.

Otherwise, if you just want to put your "Reviewed-by" tag on any patches
that look good and are sane then I'll quickly understand that these
patches are good and that I should pick them up into the clk tree from
the list. Just please communicate one way or the other about patches
that you care about because it helps to know if they've gotten attention
or not.
