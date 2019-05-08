From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] mt8183: emi: add bandwidth driver support
Date: Wed, 8 May 2019 09:17:33 +0800
Message-ID: <1557278253.3536.3.camel@mtksdaap41>
References: <1556532571-8234-1-git-send-email-jjian.zhou@mediatek.com>
 <1556532571-8234-2-git-send-email-jjian.zhou@mediatek.com>
 <1556588366.20107.14.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1556588366.20107.14.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jjian Zhou <jjian.zhou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Jjian:

On Tue, 2019-04-30 at 09:39 +0800, CK Hu wrote:
> Hi, Jjian:
> 
> On Mon, 2019-04-29 at 18:09 +0800, Jjian Zhou wrote:
> > From: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > EMI provides interface for get bandwidth  on every 1 miliseconds.
> > Currently, just support GPU bandwidth info.
> > 
> > Change-Id: I515db6194b0978b0d27a51d966c914a0b0f9d362
> > Signed-off-by: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/memory/Kconfig     |    9 +
> >  drivers/memory/Makefile    |    1 +
> >  drivers/memory/mtk-emi.c   |  412 ++++++++++++++++++++++++++++++++++++++++++++
> >  include/soc/mediatek/emi.h |  116 +++++++++++++
> >  4 files changed, 538 insertions(+)
> >  create mode 100644 drivers/memory/mtk-emi.c
> >  create mode 100644 include/soc/mediatek/emi.h
> > 

[snip]

> > +
> > +static int emi_probe(struct platform_device *pdev)
> > +{
> > +	struct mtk_emi *emi;
> > +	struct resource *res;
> > +	struct device *dev = &pdev->dev;
> > +	int i, ret;
> > +
> > +	emi = devm_kzalloc(dev, sizeof(*emi), GFP_KERNEL);
> > +	if (!emi)
> > +		return -ENOMEM;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	emi->cen_emi_base = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(emi->cen_emi_base)) {
> > +		pr_err("[EMI] unable to map cen_emi_base\n");
> > +		devm_kfree(dev, emi);
> > +		return -EINVAL;
> > +	}
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +	emi->emi_mpu_base = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(emi->emi_mpu_base)) {
> > +		pr_err("[EMI] unable to map emi_mpu_base\n");
> > +		devm_kfree(dev, emi);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i = 0; i < MAX_CH; i++) {
> > +		res = platform_get_resource(pdev, IORESOURCE_MEM, 2 + i);
> > +		emi->chn_emi_base[i] = devm_ioremap_resource(dev, res);
> > +		if (IS_ERR(emi->chn_emi_base[i])) {
> > +			pr_err("[EMI] unable to map ch%d_emi_base\n", i);
> > +			devm_kfree(dev, emi);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	platform_set_drvdata(pdev, emi);
> > +
> > +	emi_dev = dev;
> > +	/* start emi bw monitor */
> > +	mtk_emi_mon_start(dev);
> > +
> > +	emi->emi_bw_max_idx = ARRAY_SIZE(emi->emi_bw_array);
> > +	/* setup timer */
> > +	timer_setup(&(emi->emi_bw_timer), NULL, 0);
> > +	do_gettimeofday(&(emi->old_tv));
> > +
> > +	emi->emi_bw_timer.function = emi_bw_timer_callback;
> > +	emi->emi_bw_timer.expires = jiffies + msecs_to_jiffies(1);
> 
> You could set
> 
> emi->emi_bw_timer.data = emi;
> 
> So timer function could get emi.
> 
> Regards,
> CK

Sorry, the latest kernel has removed data field. From [1], it suggest
another way to pass the data to timer callback function. The [2] is the
example to pass the data to timer callback function.

[1] https://lwn.net/Articles/735887/
[2]
https://elixir.bootlin.com/linux/latest/source/drivers/soc/mediatek/mtk-cmdq-helper.c#L18

Regards,
CK

> 
> > +	add_timer(&(emi->emi_bw_timer));
> > +
> > +	/* debug node */
> > +	ret = device_create_file(dev, &dev_attr_bw);
> > +	if (ret) {
> > +		dev_err(dev, "create bw file failed!\n");
> > +		goto err_create_attr_bw;
> > +	}
> > +	ret = device_create_file(dev, &dev_attr_dump_bw);
> > +	if (ret) {
> > +		dev_err(dev, "create dump_bw file failed!\n");
> > +		goto err_create_attr_dump_bw;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_create_attr_dump_bw:
> > +	del_timer(&(emi->emi_bw_timer));
> > +	device_remove_file(dev, &dev_attr_bw);
> > +err_create_attr_bw:
> > +	devm_kfree(dev, emi);
> > +	return -ENOMEM;
> > +}
> > +
