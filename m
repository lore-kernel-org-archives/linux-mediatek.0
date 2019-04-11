From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 8/9] clk: mediatek: Add MT8183 clock support
Date: Thu, 11 Apr 2019 13:24:11 -0700
Message-ID: <155501425125.20095.3209997665406275606@swboyd.mtv.corp.google.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-10-weiyi.lu@mediatek.com> <CANMq1KBuTcVis2CyHB+sysp56YJwkzWytMsx8Tzk_SZyC1H=aQ@mail.gmail.com> <CANMq1KCFCBfaXff3qdGd7CXmz-rNt+aMVP87J84YNgxojV8TZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANMq1KCFCBfaXff3qdGd7CXmz-rNt+aMVP87J84YNgxojV8TZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Nicolas Boichat (2019-03-08 06:46:01)
>=20
> > > +
> > > +#define GATE_AUDIO0(_id, _name, _parent, _shift)               \
> > > +       GATE_MTK(_id, _name, _parent, &audio0_cg_regs, _shift,  \
> > > +               &mtk_clk_gate_ops_no_setclr)
>=20
> This macro (or variants that end up being equivalent) is repeated 103
> times in drivers/clk/mediatek/*. We can probably do better. My
> suggestion is to do something like this:
> #define GATE_MTK_CLK(reg, _id, _name, _parent, _shift) \
> GATE_MTK(_id, _name, _parent, &reg##_cg_regs, _shift, \
> &mtk_clk_gate_ops_setclr_inv)
>=20
> and use GATE_MTK_CLK(audio0, ...) in the gate clock arrays.

Feel free to send patches.

>=20
> > > +static int clk_mt8183_audio_probe(struct platform_device *pdev)
> > > +{
> > > +       struct clk_onecell_data *clk_data;
> > > +       int r;
> > > +       struct device_node *node =3D pdev->dev.of_node;
> > > +
> > > +       clk_data =3D mtk_alloc_clk_data(CLK_AUDIO_NR_CLK);
> > > +
> > > +       mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clk=
s),
> > > +                       clk_data);
> > > +
> > > +       r =3D of_clk_add_provider(node, of_clk_src_onecell_get, clk_d=
ata);
> > > +       if (r)
> > > +               return r;
> > > +
> > > +       r =3D devm_of_platform_populate(&pdev->dev);
> > > +       if (r)
> > > +               of_clk_del_provider(node);
> > > +
> > > +       return r;
> > > +}
>=20
> This (almost exact) function is now repeated 33 times in
> drivers/clk/mediatek, I think it's really time for a cleanup... Maybe
> there should be a common helper in clk-gate.c (or another file, not
> sure), that fetches the clocks (and number of clocks from .data field
> in the structure below).
>=20

Yeah that would be great. I only tried to fix the problem where mtk
has this duplicate code that probes platform drivers and finds things
from it. See my branch on clk.git

 https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mtk-of-p=
lat-probe
