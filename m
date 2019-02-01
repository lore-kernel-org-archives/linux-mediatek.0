From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3 08/12] clk: mediatek: Add MT8183 clock support
Date: Fri, 1 Feb 2019 16:22:23 +0800
Message-ID: <1549009343.22634.4.camel@mtksdaap41>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com>
         <20181210073240.32278-10-weiyi.lu@mediatek.com>
         <154482479243.19322.7465842539016312943@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154482479243.19322.7465842539016312943@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


On Fri, 2018-12-14 at 13:59 -0800, Stephen Boyd wrote:
> Quoting Weiyi Lu (2018-12-09 23:32:36)
> > +       "apll2_ck"
> > +};
> > +
> > +static const struct mtk_mux top_muxes[] = {
> > +       /* CLK_CFG_0 */
> > +       MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_MUX_AXI, "axi_sel",
> > +               axi_parents, 0x40,
> > +               0x44, 0x48, 0, 2, 7, 0x004, 0, CLK_IS_CRITICAL),
> 
> Please document why CLK_IS_CRITICAL is being used everywhere it's used.
> 

OK, I'll add some more comment at where critical clock data is declared.

> > +       MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_MM, "mm_sel",
> > +               mm_parents, 0x40,
> > +               0x44, 0x48, 8, 3, 15, 0x004, 1),
> > +       MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_IMG, "img_sel",
> > +               img_parents, 0x40,
> > +               0x44, 0x48, 16, 3, 23, 0x004, 2),
> > +       MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_CAM, "cam_sel",
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
