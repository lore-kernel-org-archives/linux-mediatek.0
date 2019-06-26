From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [RFC v1] clk: core: support clocks that need to be enabled
 during re-parent
Date: Wed, 26 Jun 2019 09:05:22 +0800
Message-ID: <1561511122.24282.10.camel@mtksdaap41>
References: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com>
         <20190625221415.B0DC22086D@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625221415.B0DC22086D@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Biao Huang <biao.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-06-25 at 15:14 -0700, Stephen Boyd wrote:
> Quoting Weiyi Lu (2019-06-09 20:44:53)
> > When using property assigned-clock-parents to assign parent clocks,
> > core clocks might still be disabled during re-parent.
> > Add flag 'CLK_OPS_CORE_ENABLE' for those clocks must be enabled
> > during re-parent.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> Can you further describe the scenario where this is a problem? Is it
> some sort of clk that is enabled by default out of the bootloader and is
> then configured to have an 'assigned-clock-parents' property to change
> the parent, but that clk needs to be "enabled" so that the framework
> turns on the parents for the parent switch?

When driver is built as module(.ko) and install at runtime after the
whole initialization stage. Clk might already be turned off before
configuring by assigned-clock-parents. For such clock design that need
to have clock enabled during re-parent, the configuration of
assigned-clock-parents might be failed. That's the problem we have now.
Do you have any suggestion for such usage of clocks? Many thanks.

> 
