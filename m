From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 02/11] clk: mediatek: add new member to mtk_pll_data
Date: Wed, 21 Nov 2018 00:03:24 -0800
Message-ID: <154278740462.88331.17720342357503268022@swboyd.mtv.corp.google.com>
References: <20181106064206.17535-1-weiyi.lu@mediatek.com>
 <20181106064206.17535-4-weiyi.lu@mediatek.com>
 <CANMq1KBjtyQFyJ-mZBndPDSfSDnD0K8izy39jp9zKE4xfiCiog@mail.gmail.com>
 <1542685880.5132.11.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542685880.5132.11.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, srv_heupstream@mediatek.com, jamesjj.liao@mediatek.com, sboyd@codeaurora.org, lkml <linux-kernel@vger.kernel.org>, fan.chen@mediatek.com, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, owen.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2018-11-19 19:51:20)
> On Tue, 2018-11-13 at 08:18 -0800, Nicolas Boichat wrote:
> > On Mon, Nov 5, 2018 at 10:43 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > > @@ -138,9 +140,10 @@ static void mtk_pll_set_rate_regs(struct mtk_clk=
_pll *pll, u32 pcw,
> > >  static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u=
32 *postdiv,
> > >                 u32 freq, u32 fin)
> > >  {
> > > -       unsigned long fmin =3D 1000 * MHZ;
> > > +       unsigned long fmin =3D pll->data->fmin ? pll->data->fmin : 10=
00 * MHZ;
> > =

> > I'd put parentheses around (1000 * MHZ), to avoid the need to think
> > about precedence...
> > =

> =

> OK, thanks for the suggestion. will add in next version

Better style would be to not use a ternary statement for anything like
this and have an if condition instead.
