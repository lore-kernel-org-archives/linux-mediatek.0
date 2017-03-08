From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: xhci-mtk: check hcc_params after adding
 primary hcd
Date: Wed, 8 Mar 2017 08:51:25 +0800
Message-ID: <1488934285.14325.8.camel@mhfsdcap03>
References: <1488857543-9384-1-git-send-email-chunfeng.yun@mediatek.com>
 <58BECD83.9000205@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <58BECD83.9000205-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2017-03-07 at 17:10 +0200, Mathias Nyman wrote:
> On 07.03.2017 05:32, Chunfeng Yun wrote:
> > hcc_params is set in xhci_gen_setup() called from usb_add_hcd(),
> > so checks the Maximum Primary Stream Array Size in the hcc_params
> > register after adding primary hcd.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   drivers/usb/host/xhci-mtk.c |    6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index 9066ec9..6ac73a6 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -678,13 +678,13 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> >   		goto power_off_phys;
> >   	}
> >
> > -	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> > -		xhci->shared_hcd->can_do_streams = 1;
> > -
> >   	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
> >   	if (ret)
> >   		goto put_usb3_hcd;
> >
> > +	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> > +		xhci->shared_hcd->can_do_streams = 1;
> > +
> >   	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> >   	if (ret)
> >   		goto dealloc_usb2_hcd;
> >
> 
> Thanks.
> Looks like streams check has never worked for Mediatek xHC hosts,
> 
> Do you know if this has caused any issues?
> looks like it should go usb-linus and maybe stable kernels as well.
No issues on mt8173, because it doesn't support bulk stream. But it
causes a issue on the newest SoC which is not upstreamed, so I think it
needn't go stable kernels.

Thank you.
>   
> -Mathias
