From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] watchdog: mtk_wdt: mt8183: Add reset controller
Date: Tue, 08 Oct 2019 16:08:39 +0200
Message-ID: <1570543719.18914.7.camel@pengutronix.de>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
 <a0b2e9a3-ca77-814f-b7bd-edc69f00fce2@roeck-us.net>
 <1570255179.29077.24.camel@mtksdaap41>
 <70b77fb3-7186-734d-3415-64acb30bab8f@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <70b77fb3-7186-734d-3415-64acb30bab8f-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yong.liang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Jiaxin Yu <jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tzungbi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eason.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Guenter, Yingjoe,

On Sat, 2019-10-05 at 07:46 -0700, Guenter Roeck wrote:
> On 10/4/19 10:59 PM, Yingjoe Chen wrote:
> > On Thu, 2019-10-03 at 06:49 -0700, Guenter Roeck wrote:
> > > On 9/27/19 3:31 AM, Jiaxin Yu wrote:
> > 
> > <snip..>
> > 
> > 
> > > > +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> > > > +			       unsigned long id)
> > > > +{
> > > > +	unsigned int tmp;
> > > > +	unsigned long flags;
> > > > +	struct toprgu_reset *data = container_of(rcdev,
> > > > +				struct toprgu_reset, rcdev);
> > > > +
> > > > +	spin_lock_irqsave(&data->lock, flags);
> > > > +
> > > > +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> > > > +	tmp |= BIT(id);
> > > > +	tmp |= WDT_SWSYS_RST_KEY;
> > > > +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> > > > +
> > > > +	spin_unlock_irqrestore(&data->lock, flags);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
> > > > +				 unsigned long id)
> > > > +{
> > > > +	unsigned int tmp;
> > > > +	unsigned long flags;
> > > > +	struct toprgu_reset *data = container_of(rcdev,
> > > > +					struct toprgu_reset, rcdev);
> > > > +
> > > > +	spin_lock_irqsave(&data->lock, flags);
> > > > +
> > > > +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> > > > +	tmp &= ~BIT(id);
> > > > +	tmp |= WDT_SWSYS_RST_KEY;
> > > > +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> > > > +
> > > > +	spin_unlock_irqrestore(&data->lock, flags);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int toprgu_reset(struct reset_controller_dev *rcdev,
> > > > +			unsigned long id)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = toprgu_reset_assert(rcdev, id);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	return toprgu_reset_deassert(rcdev, id);
> > > 
> > > Unless there is additional synchronization elsewhere, parallel calls
> > > to the -> assert, and ->reset callbacks may result in the reset being
> > > deasserted while at least one caller (the one who called the ->assert
> > > function) believes that it is still asserted.
> > > 
> > > [ ... and if there _is_ additional synchronization elsewhere, the
> > >     local spinlock would be unnecessary ]
> > > 
> > 
> > I'm not sure if this count as additional synchronization, but you could
> > get exclusive control to the reset by calling
> > reset_control_get_exclusive so others won't try to reset the component
> > while you are using it.
> > 
> > In this case, you still need spinlock because other drivers might trying
> > to reset their components and they share same register.
> 
> That isn't what I meant. I referred to synchronization in the reset
> controller core. AFAICS the reset controller core prevents parallel
> calls into the same reset controller driver using atomics.

No, it doesn't. The atomics in struct reset_control prevent parallel
calls on the same, reset control only, for shared reset controls.
Two calls on different reset controls can still run simultaneously on
the same rcdev.

> Unfortunately, it is not well defined if additional synchronization on
> driver level is needed - some drivers implement it, some drivers
> don't,

I think all drivers protect read/modify/write cycles to shared registers
with a spinlock. Those that don't either have separate set/clear
registers or use regmap, otherwise it might be a bug.

> and I don't find a documentation.

I am aware this is a problem.

regards
Philipp
