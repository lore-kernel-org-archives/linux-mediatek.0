From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/2] usb: xhci-mtk: check hcc_params after adding primary
 hcd
Date: Tue, 7 Mar 2017 17:10:59 +0200
Message-ID: <58BECD83.9000205@linux.intel.com>
References: <1488857543-9384-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488857543-9384-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 07.03.2017 05:32, Chunfeng Yun wrote:
> hcc_params is set in xhci_gen_setup() called from usb_add_hcd(),
> so checks the Maximum Primary Stream Array Size in the hcc_params
> register after adding primary hcd.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 9066ec9..6ac73a6 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -678,13 +678,13 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>   		goto power_off_phys;
>   	}
>
> -	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> -		xhci->shared_hcd->can_do_streams = 1;
> -
>   	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
>   	if (ret)
>   		goto put_usb3_hcd;
>
> +	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> +		xhci->shared_hcd->can_do_streams = 1;
> +
>   	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
>   	if (ret)
>   		goto dealloc_usb2_hcd;
>

Thanks.
Looks like streams check has never worked for Mediatek xHC hosts,

Do you know if this has caused any issues?
looks like it should go usb-linus and maybe stable kernels as well.
  
-Mathias
