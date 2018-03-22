From: Roger Quadros <rogerq@ti.com>
Subject: Re: [usb-next, v3 PATCH] usb: xhci: skip phys initialization of
 shared hcd
Date: Thu, 22 Mar 2018 14:29:39 +0200
Message-ID: <e3560874-cf8b-a554-5226-bc640b0edcb1@ti.com>
References: <643701fef843f91931e3a68779afe053c63c96f6.1521707846.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <643701fef843f91931e3a68779afe053c63c96f6.1521707846.git.chunfeng.yun@mediatek.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 22/03/18 14:12, Chunfeng Yun wrote:
> The phys has already been initialized when add primary hcd,
> including usb2 phys and usb3 phys also if exist, so needn't
> re-parse "phys" property again.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: Roger Quadros <rogerq@ti.com>

> ---
> V3:
>     add the following info about v1 & v2 suggested by Greg
> V2:
>     fix it in hcd.c suggested by Roger
> V1:
>     skip phys initialization when add shared HCD by setting
>     xhci->shared_hcd->skip_phy_initialization=1;
>     for both xhci-plat.c & xhci-mtk.c files.
> ---
>  drivers/usb/core/hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 5a92d8f..777036a 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2757,7 +2757,7 @@ int usb_add_hcd(struct usb_hcd *hcd,
>  		}
>  	}
>  
> -	if (!hcd->skip_phy_initialization) {
> +	if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
>  		hcd->phy_roothub = usb_phy_roothub_init(hcd->self.sysdev);
>  		if (IS_ERR(hcd->phy_roothub)) {
>  			retval = PTR_ERR(hcd->phy_roothub);
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
