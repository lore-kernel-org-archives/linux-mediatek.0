From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 7/9] drm/mediatek: add dsi transfer function
Date: Wed, 14 Sep 2016 14:39:11 +0800
Message-ID: <1473835151.10216.2.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
         <1472815484-43821-8-git-send-email-yt.shen@mediatek.com>
         <1473215632.11736.21.camel@mtksdaap41>
         <1473675381.12398.27.camel@mtksdaap41>
         <1473758754.28437.40.camel@mtksdaap41>
         <1473833946.24354.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473833946.24354.8.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: YT Shen <yt.shen@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Jie Qiu <jie.qiu@mediatek.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chris Wilson <chris@chris-wilson.co.uk>, shaoming chen <shaoming.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.
List-Id: linux-mediatek@lists.infradead.org

Hi, YT:

On Wed, 2016-09-14 at 14:19 +0800, YT Shen wrote:
> Hi CK,
> 
> On Tue, 2016-09-13 at 17:25 +0800, CK Hu wrote:
> > Hi, YT:
> > 
> > On Mon, 2016-09-12 at 18:16 +0800, YT Shen wrote:
> > > Hi CK,
> > > 
> > > On Wed, 2016-09-07 at 10:33 +0800, CK Hu wrote:
> > > > Hi, YT:
> > > > 
> > > > On Fri, 2016-09-02 at 19:24 +0800, YT Shen wrote:
> > > > > From: shaoming chen <shaoming.chen@mediatek.com>
> > > > > 
> > > > > add dsi read/write commands for transfer function
> > > > > 
> > > > > Signed-off-by: shaoming chen <shaoming.chen@mediatek.com>
> > > > > ---
> > > > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 188 +++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 188 insertions(+)
> > > > > 
> > > > 
> > > > [snip...]
> > > > 
> > > > >  
> > > > > +static void mtk_dsi_irq_data_clear(struct mtk_dsi *dsi, u32 irq_bit)
> > > > > +{
> > > > > +	dsi->irq_data &= ~irq_bit;
> > > > > +}
> > > > > +
> > > > 
> > > > [snip...]
> > > > 
> > > > > +
> > > > > +static s32 mtk_dsi_wait_for_irq_done(struct mtk_dsi *dsi, u32 irq_flag,
> > > > > +				     unsigned int timeout)
> > > > > +{
> > > > > +	s32 ret = 0;
> > > > > +	unsigned long jiffies = msecs_to_jiffies(timeout);
> > > > > +
> > > > > +	ret = wait_event_interruptible_timeout(_dsi_irq_wait_queue,
> > > > > +					       dsi->irq_data & irq_flag,
> > > > > +					       jiffies);
> > > > > +	if (ret == 0) {
> > > > > +		dev_info(dsi->dev, "Wait DSI IRQ(0x%08x) Timeout\n", irq_flag);
> > > > > +
> > > > > +		mtk_dsi_enable(dsi);
> > > > > +		mtk_dsi_reset_engine(dsi);
> > > > > +	}
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > 
> > > > I think mtk_dsi_irq_data_clear() and mtk_dsi_wait_for_irq_done() should
> > > > be moved to the 6th patch [1] of this series because these two functions
> > > > deal the irq control.
> > > We will move mtk_dsi_irq_data_clear() to patch "drm/mediatek: add dsi
> > > interrupt control" and put mtk_dsi_wait_for_irq_done() here, because it
> > > is used in the transfer function.
> > 
> > mtk_dsi_irq_data_clear() is also only used in transfer function now. I
> > think both function could be used for other application rather than
> > transfer function, so these two function are general function for irq
> > control.
> We will rollback the changes here.  Move mtk_dsi_irq_data_clear() to
> original place.
> 
> Add new functions could be used in the future will have problems.
> warning: 'mtk_dsi_wait_for_irq_done' defined but not used
> [-Wunused-function]
>  static s32 mtk_dsi_wait_for_irq_done(struct mtk_dsi *dsi, u32 irq_flag,
> warning: 'mtk_dsi_irq_data_clear' defined but not used
> [-Wunused-function]
>  static void mtk_dsi_irq_data_clear(struct mtk_dsi *dsi, u32 irq_bit)

Please refer to [1], '__maybe_unused' can fix your problem.

[1]
http://lxr.free-electrons.com/source/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c#L76

Regards,
CK

> 
> > Regards,
> > CK
> > 
> > > 
> > > Regards,
> > > yt.shen
> > > > 
> > > > 
> > > > [1] https://patchwork.kernel.org/patch/9310819/
> > > > 
> > > > 
> > > > Regards,
> > > > CK
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 
