From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3 01/12] clk: mediatek: fixup: Disable tuner_en before
 change PLL rate
Date: Fri, 1 Feb 2019 16:21:59 +0800
Message-ID: <1549009319.22634.0.camel@mtksdaap41>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com>
         <20181210073240.32278-3-weiyi.lu@mediatek.com>
         <154482465853.19322.3763394015657394960@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <154482465853.19322.3763394015657394960@swboyd.mtv.corp.google.com>
Sender: stable-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


On Fri, 2018-12-14 at 13:57 -0800, Stephen Boyd wrote:
> Why is "fixup" in the subject of this patch?
> 

I'll fix in next version.

> Quoting Weiyi Lu (2018-12-09 23:32:29)
> > From: Owen Chen <owen.chen@mediatek.com>
> > 
> > PLLs with tuner_en bit, such as APLL1, need to disable
> > tuner_en before apply new frequency settings, or the new frequency
> > settings (pcw) will not be applied.
> > The tuner_en bit will be disabled during changing PLL rate
> > and be restored after new settings applied.
> > Another minor change is to correct the macro name of pcw change bit
> > to CON1_PCW_CHG because PCW_CHG(BIT31) is on CON1.
> > 
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> 
> So there should be some Fixes: tag here too so we know what commit is
> being fixed?
> 

I'll add in next version.

> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
