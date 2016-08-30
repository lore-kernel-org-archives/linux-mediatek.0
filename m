From: zhiyong tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH -next] iio: adc: mt2701: Remove redundant dev_err call
 in mt6577_auxadc_probe()
Date: Tue, 30 Aug 2016 09:29:59 +0800
Message-ID: <1472520599.24148.13.camel@mhfsdcap03>
References: <1472221581-28836-1-git-send-email-weiyj.lk@gmail.com>
 <88307772-dd0f-a2f2-efd8-6c64a0cb14e4@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <88307772-dd0f-a2f2-efd8-6c64a0cb14e4-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2016-08-29 at 19:47 +0100, Jonathan Cameron wrote:
> On 26/08/16 15:26, Wei Yongjun wrote:
> > From: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > 
> > There is a error message within devm_ioremap_resource
> > already, so remove the dev_err call to avoid redundant
> > error message.
> > 
> > Signed-off-by: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Hi Wei,
> 
> I'm not so sure these are actually redundant.  Overly verbose perhaps,
> but they do provide additional information in the log as the
> devm_ioremap_resource doesn't know 'what' has failed, merely how
> it has failed.
> 
> I'm happy to take these, if the driver author / maintainers
> agree, but I'm not keen enough to take them without that.
> 
> Zhiyong Tao, what do you think on this one?
> 
> Jonathan

Dear Jonathan,

Thank you for your suggestion. I think that we can know 'what' has
failed in the driver, if we retain the error message log. It maybe 
advantageous to debug issues.

Zhiyong
> > ---
> >  drivers/iio/adc/mt6577_auxadc.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> > index 2d104c8..a268954 100644
> > --- a/drivers/iio/adc/mt6577_auxadc.c
> > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > @@ -206,10 +206,8 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
> >  
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	adc_dev->reg_base = devm_ioremap_resource(&pdev->dev, res);
> > -	if (IS_ERR(adc_dev->reg_base)) {
> > -		dev_err(&pdev->dev, "failed to get auxadc base address\n");
> > +	if (IS_ERR(adc_dev->reg_base))
> >  		return PTR_ERR(adc_dev->reg_base);
> > -	}
> >  
> >  	adc_dev->adc_clk = devm_clk_get(&pdev->dev, "main");
> >  	if (IS_ERR(adc_dev->adc_clk)) {
> > 
> > 
> > 
> 
