From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3 12/12] clk: mediatek: Allow changing PLL rate when it
 is off
Date: Fri, 1 Feb 2019 16:22:33 +0800
Message-ID: <1549009353.22634.6.camel@mtksdaap41>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com>
         <20181210073240.32278-14-weiyi.lu@mediatek.com>
         <154482488309.19322.1300826887966936368@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154482488309.19322.1300826887966936368@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org


On Fri, 2018-12-14 at 14:01 -0800, Stephen Boyd wrote:
> Quoting Weiyi Lu (2018-12-09 23:32:40)
> > From: James Liao <jamesjj.liao@mediatek.com>
> > 
> > Some modules may need to change its clock rate before turn on it.
> > So changing PLL's rate when it is off should be allowed.
> > This patch removes PLL enabled check before set rate, so that
> > PLLs can set new frequency even if they are off.
> > 
> > On MT8173 for example, ARMPLL's enable bit can be controlled by
> > other HW. That means ARMPLL may be turned on even if we (CPU / SW)
> > set ARMPLL's enable bit as 0. In this case, SW may want and can
> > still change ARMPLL's rate by changing its pcw and postdiv settings.
> > But without this patch, new pcw setting will not be applied because
> > its enable bit is 0.
> > 
> > (am from https://patchwork.kernel.org/patch/9411983/)
> 
> Remove this.
> 

OK, I'll remove it.

> > 
> > Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> > Acked-by: Michael Turquette <mturuqette@baylibre.com>
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
