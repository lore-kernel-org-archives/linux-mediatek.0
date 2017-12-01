From: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] usb: xhci: allow imod-interval to be configurable
Date: Fri, 1 Dec 2017 10:50:58 -0500
Message-ID: <fc7d120e-22c6-7a8a-8221-914cc40e0b47@codeaurora.org>
References: <1511970775-11103-1-git-send-email-awallis@codeaurora.org>
 <1512099124.17567.156.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512099124.17567.156.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Chunfeng,

On 11/30/2017 10:32 PM, Chunfeng Yun wrote:
> Hi,
> On Wed, 2017-11-29 at 10:52 -0500, Adam Wallis wrote:
>> The xHCI driver currently has the IMOD set to 160, which
>> translates to an IMOD interval of 40,000ns (160 * 250)ns
>>
>> Commit 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
>> introduced a QUIRK for the MTK platform to adjust this interval to 20,
[..]
>>  #include "xhci-mvebu.h"
>>  #include "xhci-rcar.h"
>> +#include "xhci-mtk.h"
> Needn't it, MTK makes use of xhci-mtk.c but not xhci-plat.c
> 

Thanks - I made this change in V3.

[..]
>>  
>>  static struct hc_driver __read_mostly xhci_plat_hc_driver;
>>  
>> @@ -269,6 +270,18 @@ static int xhci_plat_probe(struct platform_device *pdev)
>>  	if (device_property_read_bool(&pdev->dev, "quirk-broken-port-ped"))
>>  		xhci->quirks |= XHCI_BROKEN_PORT_PED;
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
> Can be moved into xhci-mtk.c for MTK quirk, like as following:
> 

I moved this into V3 as suggested - could you test on an MTK platform (I don't
have one available) to see if it performs as expected?




-- 
Adam Wallis
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
