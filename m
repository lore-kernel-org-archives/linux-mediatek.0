From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC usb-next v3 2/2] usb: core: use phy_exit during suspend if
 wake up is not supported
Date: Tue, 27 Mar 2018 11:20:17 +0800
Message-ID: <1522120817.3717.196.camel@mhfsdcap03>
References: <20180326203846.7248-1-martin.blumenstingl@googlemail.com>
 <20180326203846.7248-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180326203846.7248-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: j-keerthy-l0cyMroinI0@public.gmane.org, d-gerlach-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

hi,
On Mon, 2018-03-26 at 22:38 +0200, Martin Blumenstingl wrote:
> If the USB controller can wake up the system (which is the case for
> example with the Mediatek USB3 IP) then we must not call phy_exit during
> suspend to ensure that the USB controller doesn't have to re-enumerate
> the devices during resume.
> However, if the USB controller cannot wake up the system (which is the
> case for example on various TI platforms using a dwc3 controller) then
> we must call phy_exit during suspend. Otherwise the PHY driver keeps the
> clocks enabled, which prevents the system from reaching the lowest power
> levels in the suspend state.
> 
> Solve this by introducing two new functions in the PHY wrapper which are
> dedicated to the suspend and resume handling.
> If the controller can wake up the system the new usb_phy_roothub_suspend
> function will simply call usb_phy_roothub_power_off. However, if wake up
> is not supported by the controller it will also call
> usb_phy_roothub_exit.
> The also new usb_phy_roothub_resume function takes care of calling
> usb_phy_roothub_init (if the controller can't wake up the system) in
> addition to usb_phy_roothub_power_on.
> 
> Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
> Fixes: 178a0bce05cbc1 ("usb: core: hcd: integrate the PHY wrapper into the HCD core")
> Reported-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
> Suggested-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
> Suggested-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  drivers/usb/core/hcd.c |  8 +++++---
>  drivers/usb/core/phy.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/usb/core/phy.h |  5 +++++
>  3 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 15b0418e3b6a..78bae4ecd68b 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2262,7 +2262,8 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
>  		hcd->state = HC_STATE_SUSPENDED;
>  
>  		if (!PMSG_IS_AUTO(msg))
> -			usb_phy_roothub_power_off(hcd->phy_roothub);
> +			usb_phy_roothub_suspend(hcd->self.sysdev,
> +						hcd->phy_roothub);
>  
>  		/* Did we race with a root-hub wakeup event? */
>  		if (rhdev->do_remote_wakeup) {
> @@ -2302,7 +2303,8 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
>  	}
>  
>  	if (!PMSG_IS_AUTO(msg)) {
> -		status = usb_phy_roothub_power_on(hcd->phy_roothub);
> +		status = usb_phy_roothub_resume(hcd->self.sysdev,
> +						hcd->phy_roothub);
>  		if (status)
>  			return status;
>  	}
> @@ -2344,7 +2346,7 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
>  		}
>  	} else {
>  		hcd->state = old_state;
> -		usb_phy_roothub_power_off(hcd->phy_roothub);
> +		usb_phy_roothub_suspend(hcd->self.sysdev, hcd->phy_roothub);
>  		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
>  				"resume", status);
>  		if (status != -ESHUTDOWN)
> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> index 44f008cda7a8..a39d9bb26a4f 100644
> --- a/drivers/usb/core/phy.c
> +++ b/drivers/usb/core/phy.c
> @@ -157,3 +157,38 @@ void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)
>  		phy_power_off(roothub_entry->phy);
>  }
>  EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
> +
> +int usb_phy_roothub_suspend(struct device *controller_dev,
> +			    struct usb_phy_roothub *phy_roothub)
> +{
> +	usb_phy_roothub_power_off(phy_roothub);
> +
> +	/* keep the PHYs initialized so the device can wake up the system */
> +	if (device_may_wakeup(controller_dev))
> +		return 0;
> +
> +	return usb_phy_roothub_exit(phy_roothub);
> +}
> +EXPORT_SYMBOL_GPL(usb_phy_roothub_suspend);
> +
> +int usb_phy_roothub_resume(struct device *controller_dev,
> +			   struct usb_phy_roothub *phy_roothub)
> +{
> +	int err;
> +
> +	/* if the device can't wake up the system _exit was called */
> +	if (!device_may_wakeup(controller_dev)) {
> +		err = usb_phy_roothub_init(phy_roothub);
> +		if (err)
> +			return err;
> +	}
> +
> +	err = usb_phy_roothub_power_on(phy_roothub);
> +
> +	/* undo _init if _power_on failed */
> +	if (err && !device_may_wakeup(controller_dev))
> +		usb_phy_roothub_exit(phy_roothub);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(usb_phy_roothub_resume);
> diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
> index eb31253201ad..605555901d44 100644
> --- a/drivers/usb/core/phy.h
> +++ b/drivers/usb/core/phy.h
> @@ -7,3 +7,8 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
>  
>  int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
>  void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
> +
> +int usb_phy_roothub_suspend(struct device *controller_dev,
> +			    struct usb_phy_roothub *phy_roothub);
> +int usb_phy_roothub_resume(struct device *controller_dev,
> +			   struct usb_phy_roothub *phy_roothub);

Tested-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Thanks a lot
