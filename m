From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC v1] clk: core: support clocks that need to be enabled during re-parent
Date: Tue, 25 Jun 2019 20:52:45 -0700
Message-ID: <20190626035246.4591A20659@mail.kernel.org>
References: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com> <20190625221415.B0DC22086D@mail.kernel.org> <1561511122.24282.10.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561511122.24282.10.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Biao Huang <biao.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-06-25 18:05:22)
> On Tue, 2019-06-25 at 15:14 -0700, Stephen Boyd wrote:
> > Quoting Weiyi Lu (2019-06-09 20:44:53)
> > > When using property assigned-clock-parents to assign parent clocks,
> > > core clocks might still be disabled during re-parent.
> > > Add flag 'CLK_OPS_CORE_ENABLE' for those clocks must be enabled
> > > during re-parent.
> > >=20
> > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> >=20
> > Can you further describe the scenario where this is a problem? Is it
> > some sort of clk that is enabled by default out of the bootloader and is
> > then configured to have an 'assigned-clock-parents' property to change
> > the parent, but that clk needs to be "enabled" so that the framework
> > turns on the parents for the parent switch?
>=20
> When driver is built as module(.ko) and install at runtime after the
> whole initialization stage. Clk might already be turned off before
> configuring by assigned-clock-parents. For such clock design that need
> to have clock enabled during re-parent, the configuration of
> assigned-clock-parents might be failed. That's the problem we have now.

Great. Please put this sort of information in the commit text.

> Do you have any suggestion for such usage of clocks? Many thanks.
>=20

Ok, and in this case somehow CLK_OPS_PARENT_ENABLE flag doesn't work? Is
that because the clk itself doesn't do anything unless it's enabled?  I
seem to recall that we usually work around this by caching the state of
the clk parents or frequencies and then when the clk prepare or enable
op is called we actually write the hardware to change the state. There
are some qcom clks like this and we basically just use the hardware
itself to cache the state of the clk while it hasn't actually changed to
be at that rate, because the clk is not enabled yet.

The main concern is that we're having to turn on clks to make things
work, when it would be best to not turn on clks just so that register
writes actually make a difference to what the hardware does.
