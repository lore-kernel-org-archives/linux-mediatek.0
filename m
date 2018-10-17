From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [SPAM]Re: [PATCH v1 3/3] clk: mediatek: mt2712: add pll reference
 support
Date: Wed, 17 Oct 2018 07:15:28 -0700
Message-ID: <153978572885.5275.2199850145066961212@swboyd.mtv.corp.google.com>
References: <20180920095727.11868-1-weiyi.lu@mediatek.com>
 <20180920095727.11868-5-weiyi.lu@mediatek.com>
 <153936680359.5275.14901579706860255114@swboyd.mtv.corp.google.com>
 <1539784392.16401.28.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1539784392.16401.28.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2018-10-17 06:53:12)
> On Fri, 2018-10-12 at 10:53 -0700, Stephen Boyd wrote:
> > Quoting Weiyi Lu (2018-09-20 02:57:27)
> > > +
> > > +       rc = of_parse_phandle_with_args(node, "mediatek,refclk",
> > > +                       "#clock-cells", 0, &refclk);
> > > +       if (!rc) {
> > > +               of_property_read_string(refclk.np, "clock-output-names",
> > > +                               &refclk_name);
> > > +               for (i = 0; i < num_plls; i++)
> > > +                       plls[i].parent_name = refclk_name;
> > 
> > Use of_clk_parent_fill()?
> > 
> Thanks for the hint, i might use of_clk_get_parent_name() instead like
> below to get each parent clock name.
> refclk_name = of_clk_get_parent_name(node, 0);
> refclk_aud_name = of_clk_get_parent_name(node, 1);

Alright.

> 
> > > +       }
> > > +
> > > +       rc = of_parse_phandle_with_args(node, "mediatek,refclk-aud",
> > > +                       "#clock-cells", 0, &refclk_aud);
> > 
> > This is odd. Is this a custom 'clocks' property? What's going on here?
> > Why can't we use assigned clock parents for this?
> Yes. both the reference clock of all PLL and the reference clock of
> audio PLL could be customized.These two reference clocks shall be
> provided by some component like crystal oscillators on the board. So we
> might unable to switch the PLL reference source at runtime, in other
> words, it should be set statically. That's why we didn't provide the
> set_parent ops for pll clock type. It's also the main reason we choose
> not to use assigned-clock-parents for this requirement.
> 

Ok. Do you need some new software clk flag that indicates we should
"lock" the parent or rate configured at boot time? I would like to see
this driver implement the clk_ops for the hardware and have the
framework be the one that configures the tree, instead of doing it some
custom way for this single driver.

> > > +       if (!rc) {
> > > +               of_property_read_string(refclk_aud.np, "clock-output-names",
> > > +                               &refclk_aud_name);
> > > +               if (strcmp(refclk_name, refclk_aud_name)) {
> > > +                       plls[CLK_APMIXED_APLL1].parent_name = refclk_aud_name;
