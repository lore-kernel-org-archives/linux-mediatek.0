From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/2] usb: xhci-mtk: rebuild xhci_mtk_setup()
Date: Tue, 7 Mar 2017 16:57:15 +0200
Message-ID: <58BECA4B.3010503@linux.intel.com>
References: <1488869841-9959-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488869841-9959-1-git-send-email-chunfeng.yun@mediatek.com>
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
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 07.03.2017 08:57, Chunfeng Yun wrote:
> simplify xhci_mtk_setup() and add xhci_mtk_start() for
> xhci_driver_overrides struct
>

Code itself looks fine, but it's bit unclear for me what the benefit of this is?

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c |   16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 67d5dc7..9636884 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -381,8 +381,10 @@ static int usb_wakeup_of_property_parse(struct xhci_hcd_mtk *mtk,
>   }
>
>   static int xhci_mtk_setup(struct usb_hcd *hcd);
> +static int xhci_mtk_start(struct usb_hcd *hcd);
>   static const struct xhci_driver_overrides xhci_mtk_overrides __initconst = {
>   	.reset = xhci_mtk_setup,
> +	.start = xhci_mtk_start,
>   };
>
>   static struct hc_driver __read_mostly xhci_mtk_hc_driver;
> @@ -492,7 +494,6 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
>   /* called during probe() after chip reset completes */
>   static int xhci_mtk_setup(struct usb_hcd *hcd)
>   {
> -	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>   	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
>   	int ret;
>
> @@ -502,9 +503,14 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
>   			return ret;
>   	}
>
> -	ret = xhci_gen_setup(hcd, xhci_mtk_quirks);
> -	if (ret)
> -		return ret;
> +	return xhci_gen_setup(hcd, xhci_mtk_quirks);
> +}
> +
> +static int xhci_mtk_start(struct usb_hcd *hcd)
> +{
> +	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
> +	int ret;
>
>   	if (usb_hcd_is_primary_hcd(hcd)) {
>   		mtk->num_u3_ports = xhci->num_usb3_ports;

In theory this causes xhci_mtk_sch_init() to allocate new memory
for mtk->sch_array every time   .start callback is called.

In practice it should not matter as .start is only called
when hcd is added in usb core.

Still wondering if there is a reason for this change?

-Mathias
