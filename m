From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 2/6] usb: xhci-mtk: use __maybe_unused to hide pm functions
Date: Thu, 10 Mar 2016 13:42:37 +0200
Message-ID: <56E15DAD.3000104@linux.intel.com>
References: <1456932255-71725-1-git-send-email-arnd@arndb.de> <1456932255-71725-3-git-send-email-arnd@arndb.de> <56D9B8EE.3060107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D9B8EE.3060107-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 04.03.2016 18:33, Matthias Brugger wrote:
>
>
> On 02/03/16 16:24, Arnd Bergmann wrote:
>> The mediatek XHCI glue driver uses SET_SYSTEM_SLEEP_PM_OPS() to
>> conditionally set the correct suspend/resume options, and
>> also puts both the dev_pm_ops and the functions inside of
>> an #ifdef testing for CONFIG_PM_SLEEP, but those functions
>> then call other code that becomes unused:
>>
>> drivers/usb/host/xhci-mtk.c:135:12: error: 'xhci_mtk_host_disable' defined but not used [-Werror=unused-function]
>> drivers/usb/host/xhci-mtk.c:313:13: error: 'usb_wakeup_enable' defined but not used [-Werror=unused-function]
>> drivers/usb/host/xhci-mtk.c:321:13: error: 'usb_wakeup_disable' defined but not used [-Werror=unused-function]
>>
>> This replaces the #ifdef with __maybe_unused annotations so the
>> compiler knows it can silently drop them instead of warning.
>>
>> For the DEV_PM_OPS definition, we can use an IS_ENABLED() check
>> to avoid defining the structure when CONFIG_PM is not set without
>> the #ifdef.
>>
>> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> ---
>
> Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>

Acked-by: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
