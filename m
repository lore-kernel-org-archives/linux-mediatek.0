From: mtk14994 <wangyan.wang@mediatek.com>
Subject: Re: [PATCH V5 5/8] clk: mediatek: add MUX_GATE_FLAGS_2
Date: Thu, 21 Feb 2019 10:34:11 +0800
Message-ID: <1550716451.23876.5.camel@mszsdaap41>
References: <20190220025357.7354-1-wangyan.wang@mediatek.com>
         <20190220025357.7354-6-wangyan.wang@mediatek.com>
         <155069142918.77512.15726787055211591362@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155069142918.77512.15726787055211591362@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: CK Hu <ck.hu@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Dear Stephen,
> +       unsigned char mux_flags;
> 
> Why isn't it an unsigned long? Isn't this supposed to match the
> frameworks version of the clk flags?

---->   it is unsigned char mux_flags ,becasuse struct clk_mux {

....
....
u8 flags;
....
}

it is matched when use " mux->flags = mc->mux_flags;"

Best Regards
Wangyan



On Wed, 2019-02-20 at 11:37 -0800, Stephen Boyd wrote:
> Quoting wangyan wang (2019-02-19 18:53:54)
> > From: chunhui dai <chunhui.dai@mediatek.com>
> > 
> > Add MUX_GATE_FLAGS_2 for the clock which needs to set two falgs.
> 
> s/falgs/flags/
> 
> > Such as some mux need to set the flags of "CLK_MUX_ROUND_CLOSEST".
> > 
> > Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> > Signed-off-by: wangyan wang <wangyan.wang@mediatek.com>
> > ---
> >  drivers/clk/mediatek/clk-mtk.c |  2 +-
> >  drivers/clk/mediatek/clk-mtk.h | 20 ++++++++++++++------
> >  2 files changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> > index 9c0ae4278a94..2ed996404804 100644
> > --- a/drivers/clk/mediatek/clk-mtk.c
> > +++ b/drivers/clk/mediatek/clk-mtk.c
> > @@ -167,7 +167,7 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
> >                 mux->mask = BIT(mc->mux_width) - 1;
> >                 mux->shift = mc->mux_shift;
> >                 mux->lock = lock;
> > -
> > +               mux->flags = mc->mux_flags;
> >                 mux_hw = &mux->hw;
> >                 mux_ops = &clk_mux_ops;
> >  
> > diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> > index f83c2bbb677e..4b88d196d52f 100644
> > --- a/drivers/clk/mediatek/clk-mtk.h
> > +++ b/drivers/clk/mediatek/clk-mtk.h
> > @@ -81,15 +81,13 @@ struct mtk_composite {
> >         signed char divider_shift;
> >         signed char divider_width;
> >  
> > +       unsigned char mux_flags;
> 
> Why isn't it an unsigned long? Isn't this supposed to match the
> frameworks version of the clk flags?
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
