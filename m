From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v5 8/9] clk: mediatek: Add MT8183 clock support
Date: Fri, 8 Mar 2019 22:46:01 +0800
Message-ID: <CANMq1KCFCBfaXff3qdGd7CXmz-rNt+aMVP87J84YNgxojV8TZA@mail.gmail.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-10-weiyi.lu@mediatek.com>
 <CANMq1KBuTcVis2CyHB+sysp56YJwkzWytMsx8Tzk_SZyC1H=aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CANMq1KBuTcVis2CyHB+sysp56YJwkzWytMsx8Tzk_SZyC1H=aQ@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Mar 8, 2019 at 2:42 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> )
> On Tue, Mar 5, 2019 at 1:05 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > Add MT8183 clock support, include topckgen, apmixedsys,
> > infracfg, mcucfg and subsystem clocks.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>
> In v1 a while back (https://patchwork.kernel.org/patch/10669765/) I
> was complaining about code duplication between these many files, and
> wondering if we can make simplify a lot of this code.

Okay, we had a discussion on this gerrit:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1510921,
and I didn't know the history that having separate clock domains that
we can enable/disable with config options. And the same pattern
already exists on clk-mt2712-*.c, for example.

So, for now:
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

Some comment below about how this could be improved, potentially:

> Apart from that:
> Tested-by: Nicolas Boichat <drinkcat@chromium.org>
>
[snip]
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8183-audio.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (c) 2018 MediaTek Inc.
> > +// Author: Weiyi Lu <weiyi.lu@mediatek.com>
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-mtk.h"
> > +#include "clk-gate.h"
> > +
> > +#include <dt-bindings/clock/mt8183-clk.h>
> > +
> > +static const struct mtk_gate_regs audio0_cg_regs = {
> > +       .set_ofs = 0x0,
> > +       .clr_ofs = 0x0,
> > +       .sta_ofs = 0x0,
> > +};
> > +
> > +static const struct mtk_gate_regs audio1_cg_regs = {
> > +       .set_ofs = 0x4,
> > +       .clr_ofs = 0x4,
> > +       .sta_ofs = 0x4,
> > +};
> > +
> > +#define GATE_AUDIO0(_id, _name, _parent, _shift)               \
> > +       GATE_MTK(_id, _name, _parent, &audio0_cg_regs, _shift,  \
> > +               &mtk_clk_gate_ops_no_setclr)

This macro (or variants that end up being equivalent) is repeated 103
times in drivers/clk/mediatek/*. We can probably do better. My
suggestion is to do something like this:
#define GATE_MTK_CLK(reg, _id, _name, _parent, _shift) \
GATE_MTK(_id, _name, _parent, &reg##_cg_regs, _shift, \
&mtk_clk_gate_ops_setclr_inv)

and use GATE_MTK_CLK(audio0, ...) in the gate clock arrays.

> > +static int clk_mt8183_audio_probe(struct platform_device *pdev)
> > +{
> > +       struct clk_onecell_data *clk_data;
> > +       int r;
> > +       struct device_node *node = pdev->dev.of_node;
> > +
> > +       clk_data = mtk_alloc_clk_data(CLK_AUDIO_NR_CLK);
> > +
> > +       mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clks),
> > +                       clk_data);
> > +
> > +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > +       if (r)
> > +               return r;
> > +
> > +       r = devm_of_platform_populate(&pdev->dev);
> > +       if (r)
> > +               of_clk_del_provider(node);
> > +
> > +       return r;
> > +}

This (almost exact) function is now repeated 33 times in
drivers/clk/mediatek, I think it's really time for a cleanup... Maybe
there should be a common helper in clk-gate.c (or another file, not
sure), that fetches the clocks (and number of clocks from .data field
in the structure below).

> > +static const struct of_device_id of_match_clk_mt8183_audio[] = {
> > +       { .compatible = "mediatek,mt8183-audiosys", },
> > +       {}
> > +};
[snip]
