From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v5 6/9] clk: mediatek: Add flags support for mtk_gate
 data
Date: Fri, 12 Apr 2019 10:42:17 +0800
Message-ID: <1555036937.2654.5.camel@mtksdaap41>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com>
         <20190305050546.23431-8-weiyi.lu@mediatek.com>
         <155501399858.20095.16525048679717411283@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155501399858.20095.16525048679717411283@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-04-11 at 13:19 -0700, Stephen Boyd wrote:
> Quoting Weiyi Lu (2019-03-04 21:05:43)
> > On some Mediatek platforms, there are critical clocks of
> > clock gate type.
> > To register clock gate with flags CLK_IS_CRITICAL,
> > we need to add the flags field in mtk_gate data and register APIs.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> This patch doesn't apply, because it's already there via commit
> 5a1cc4c27ad2 ("clk: mediatek: Add flags to mtk_gate").
> 
Got it, but just catch a minor defect by 5a1cc4c27ad2 ("clk: mediatek:
Add flags to mtk_gate").

init.flags = CLK_SET_RATE_PARENT;
...
init.flags = flags;

I'll send a fix later.

Thanks for the help on the MT8183 clk series.

> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
