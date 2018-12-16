From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mt76x[02]u 802.11w support
Date: Sun, 16 Dec 2018 11:39:26 +0100
Message-ID: <dd275289-99d0-54a8-9ac5-cb137123950a@gmail.com>
References: <CAM0KTbBUXJsBfO0=hQgeTGVteym6iuObdyNynWumQnnGY0L3wg@mail.gmail.com>
 <20181213143947.GA11947@localhost.localdomain>
 <CAM0KTbCMrcXNFHUFEmoHg+nseN1GkegqAM0GSuWBDHP=gVgi=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM0KTbCMrcXNFHUFEmoHg+nseN1GkegqAM0GSuWBDHP=gVgi=w@mail.gmail.com>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 15/12/2018 04:43, Sid Hayn wrote:
> On Thu, Dec 13, 2018 at 9:39 AM Lorenzo Bianconi
> <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>
>>> Per a conversation with Lorenzo, it seems that 802.11w for mt76x[02]u
>>> has only been fixed in 4.20.  As 4.19 is a LTS kernel, I'd like to
>>> request that work be backported.  While the improvements in 4.20 and
>>> 4.21 are already fairly obvious, a lot of people will be running 4.19
>>> for years to come.  This is good hardware, with a working driver
>>> (thanks team) but in the next few months excitement is going to turn
>>> toward WPA3 which requires working 802.11w.
>>>
>>> Pretty please backport 802.11w support to 4.19
>>
>> IIRC the isse is just on mt76x0u, mt76x2u should work
> 
> I can confirm that it does work on mt76x2u on 4.19.5; so my request is
> to backport 802.11w (software crypto I believe) support for mt76x0u to
> 4.19 LTS.  Pretty please :-)
> 

Stable kernel are not used to do feature backports but just bug fixes. Please
reach out to your favorite Linux distribution to backport this driver into their
kernel. That's the value add a distro has :)

Regards,
Matthias

> Just in case it helps to confirm what is needed, here is the error
> from wpa_supplicant when trying to connect to an 802.11w AP
> wlan0: WPA: Failed to configure IGTK to the driver
> wlan0: RSN: Failed to configure IGTK
> 
> thanks,
> Zero
> 
>>
>> Regards,
>> Lorenzo
>>
>>>
>>> Thanks,
>>> Zero
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
