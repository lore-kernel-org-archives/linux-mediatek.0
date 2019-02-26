From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 00/12] Mediatek MT8183 clock and scpsys support
Date: Tue, 26 Feb 2019 09:45:54 -0800
Message-ID: <155120315465.260864.9490825097795511702@swboyd.mtv.corp.google.com>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com> <20190201083016.25856-2-weiyi.lu@mediatek.com> <155069033021.77512.14493210110678229730@swboyd.mtv.corp.google.com> <b7abe484-71c1-5ec0-796c-544f1ac5d6f5@gmail.com> <155082168901.77512.12893153125579041936@swboyd.mtv.corp.google.com> <1551153650.1047.4.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1551153650.1047.4.camel@mtksdaap41>
Sender: stable-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-02-25 20:00:50)
> On Thu, 2019-02-21 at 23:48 -0800, Stephen Boyd wrote:
> > Quoting Matthias Brugger (2019-02-21 00:36:24)
> > >=20
> > >=20
> > > On 20/02/2019 20:18, Stephen Boyd wrote:
> > > >=20
> > > > What's the merge plan here? Do you want me to apply these patches t=
o clk
> > > > tree? Will someone be sending me a pull request for mediatek clk ch=
anges
> > > > this cycle? It's getting pretty late for much of anything making th=
is
> > > > upcoming merge window.
> > > >=20
> > >=20
> > > As far as I can see, the clock patches are independent, so I think it=
 is OK to
> > > take them. SCPSYS patches will go through my tree once they are in sh=
ape.
> >=20
> > Ok great. When patches for clks are interspersed throughout the patch
> > series it makes me think that something later in the series depends on
> > something that isn't a clk patch so then I can't apply it.
> >=20
>=20
> Hi Stephen,
>=20
> Sorry for making such complex dependencies between the clk patches and
> others in this series. And just like Matthias mentioned, the clock
> patches are independent from others. I could resend a clock-only series
> right away if each clock patch in v4 is qualified to merge into
> clk-next.
> If there still some provide need to be fixed, please let me know. I'll
> fix them and send v5 only for clock.

It looks like Matthias has some comments on the first patch that need to
be addressed. I looked over the rest of the clk patches and they look ok
at a quick glance. If you resend just the clk patches without the rest
then I can probably apply them for the upcoming merge window.
