From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2] usb: xhci: allow imod-interval to be configurable
Date: Thu, 30 Nov 2017 10:41:20 +0200
Message-ID: <ffa34aa3-0a1f-ba85-e7ba-356bdffa4e5a@linux.intel.com>
References: <1511970775-11103-1-git-send-email-awallis@codeaurora.org>
 <20171129174619.GB22267@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171129174619.GB22267-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 29.11.2017 19:46, Greg Kroah-Hartman wrote:
> On Wed, Nov 29, 2017 at 10:52:55AM -0500, Adam Wallis wrote:
>> The xHCI driver currently has the IMOD set to 160, which
>> translates to an IMOD interval of 40,000ns (160 * 250)ns
>>
>> Commit 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
>> introduced a QUIRK for the MTK platform to adjust this interval to 20,
>> which translates to an IMOD interval of 5,000ns (20 * 250)ns. This is
>> due to the fact that the MTK controller IMOD interval is 8 times
>> as much as defined in xHCI spec.
>>
>> Instead of adding more quirk bits for additional platforms, this patch
>> introduces the ability for vendors to set the IMOD_INTERVAL as is
>> optimal for their platform. By using device_property_read_u32() on
>> "imod-interval", the IMOD INTERVAL can be specified in nano seconds. If
>> no interval is specified, the default of 40,000ns (IMOD=160) will be
>> used.
>>
>> No bounds checking has been implemented due to the fact that a vendor
>> may have violated the spec and would need to specify a value outside of
>> the max 8,000 IRQs/second limit specified in the xHCI spec.
>>
>> Backwards compatibility is maintained for MTK_HOSTS through the quirk
>> bit, however, imod_interval should be pushed into device tree at a
>> future point and this quirk should be removed from xhci_plat_probe
>>
>> Signed-off-by: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>> changes from v1:
>>    * Removed device_property_read_u32() per suggestion from greg k-h
>>    * Used ER_IRQ_INTERVAL_MASK in place of (u16) cast
>>
>>   Documentation/devicetree/bindings/usb/usb-xhci.txt |  1 +
>>   drivers/usb/host/xhci-plat.c                       | 13 +++++++++++++
>>   drivers/usb/host/xhci.c                            |  7 ++-----
>>   drivers/usb/host/xhci.h                            |  2 ++
>>   4 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> index ae6e484..3998459 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> @@ -29,6 +29,7 @@ Optional properties:
>>     - usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
>>     - usb3-lpm-capable: determines if platform is USB3 LPM capable
>>     - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>> +  - imod-interval: IMOD_INTERVAL in nano-seconds. Default is 40000
>>   
>>   Example:
>>   	usb@f0931000 {
>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>> index 09f164f..3c63de1 100644
>> --- a/drivers/usb/host/xhci-plat.c
>> +++ b/drivers/usb/host/xhci-plat.c
>> @@ -23,6 +23,7 @@
>>   #include "xhci-plat.h"
>>   #include "xhci-mvebu.h"
>>   #include "xhci-rcar.h"
>> +#include "xhci-mtk.h"
>>   
>>   static struct hc_driver __read_mostly xhci_plat_hc_driver;
>>   
>> @@ -269,6 +270,18 @@ static int xhci_plat_probe(struct platform_device *pdev)
>>   	if (device_property_read_bool(&pdev->dev, "quirk-broken-port-ped"))
>>   		xhci->quirks |= XHCI_BROKEN_PORT_PED;
>>   
>> +	/*
>> +	 * imod_interval is the interrupt modulation value in nanoseconds.
>> +	 * The increment interval is 8 times as much as that defined in
>> +	 * the xHCI spec on MTK's controller. This quirk check exists to provide
>> +	 * backwards compatibility, however, this should be pushed into
>> +	 * the device tree files at some point in the future and
>> +	 * checking the quirk should be removed from xhci_plat_probe.
>> +	 */
>> +	xhci->imod_interval = xhci->quirks & XHCI_MTK_HOST ? 5000 : 40000;
> 
> Personally I hate ? : logic, just write the if statement out.  It
> doesn't save anything except make it harder to read.
> 
> Yeah, the original code had it too.  Oh well, I'll leave it up to the
> xhci maintainer, he is the one that has to maintain this, not me :)
> 

I don't mind that line so much, this still looks better than the original.

I do however mind that I don't get any default imod interval value for my
pci based xhci host after this patch.
That needs to be fixed

Thanks
-Mathias
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
