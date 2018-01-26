From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC/RFT usb-next v1 5/6] usb: chipidea: do not set the "phy"
 field in struct usb_hcd
Date: Fri, 26 Jan 2018 22:05:42 +0100
Message-ID: <CAFBinCCzghJxHe-1Jzwa1ohHYYytn53QAsXYue229dVu7tB7UQ@mail.gmail.com>
References: <20180125001639.14681-1-martin.blumenstingl@googlemail.com>
 <20180125001639.14681-6-martin.blumenstingl@googlemail.com> <HE1PR04MB145071FCFAF041E0A9252FF08BE00@HE1PR04MB1450.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <HE1PR04MB145071FCFAF041E0A9252FF08BE00-6LN7OEpIatVC+P/YwrXEHc9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org" <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, "mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Peter,

On Fri, Jan 26, 2018 at 10:06 AM, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org> wrote:
>
>>
>> Now that usb_add_hcd parses all generic PHYs anyways the code which skips
>> initialization of a single PHY will go away.
>> Remove the code which sets struct usb_hcd's phy field from the chipidea driver as
>> this field will go away soon.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  drivers/usb/chipidea/host.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c index
>> 19d60ed7e41f..fc324767cb0f 100644
>> --- a/drivers/usb/chipidea/host.c
>> +++ b/drivers/usb/chipidea/host.c
>> @@ -124,9 +124,7 @@ static int host_start(struct ci_hdrc *ci)
>>
>>       hcd->power_budget = ci->platdata->power_budget;
>>       hcd->tpl_support = ci->platdata->tpl_support;
>> -     if (ci->phy)
>> -             hcd->phy = ci->phy;
>> -     else
>> +     if (!ci->phy)
>>               hcd->usb_phy = ci->usb_phy;
>>
>
> The reason hcd->phy is initialized by chipidea core is we do not need HCD core to
> touch PHY, and PHY operation is shared for both device and host mode for chipidea.
Chunfeng wanted me to drop the mtu3 patch because I forgot about
device mode in the mtu3 driver.
however, the chipidea driver seems to be different because I'm not
dropping the whole phy_{init,power_on,power_off,exit} code from it,
but only a "flag" that tells the HCD core to skip managing the USB PHY

> If I understand correct, your HCD core PHY wrapper patch set will do PHY operation if
> there is a "phy" node under controller's? If it is correct, you may supply one way to let
> the HCD core bypass phy operations for some USB controllers, eg dual-role controllers.
> Thanks.
could you please explain why the HCD core should not manage the the
PHYs when the chipidea driver is used?

my understanding is that all phy_{init,power_on,power_off,exit}
operations are ref-counted internally in the PHY framework
this means that if the chipidea driver calls phy_{init,power_on} first
then the same functions called from within the HCD core are no-ops
(except for the ref-counting)
so I think it should not change anything - however, I have no hardware
to actually prove that.
it would be great if you could explain the issue behind this (and
thereby answer the question: why we would not want the HCD core to
manage the PHY states)!


Regards
Martin
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
