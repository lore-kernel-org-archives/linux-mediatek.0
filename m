From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mt76x[02]u 802.11w support
Date: Thu, 13 Dec 2018 15:39:48 +0100
Message-ID: <20181213143947.GA11947@localhost.localdomain>
References: <CAM0KTbBUXJsBfO0=hQgeTGVteym6iuObdyNynWumQnnGY0L3wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAM0KTbBUXJsBfO0=hQgeTGVteym6iuObdyNynWumQnnGY0L3wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

> Per a conversation with Lorenzo, it seems that 802.11w for mt76x[02]u
> has only been fixed in 4.20.  As 4.19 is a LTS kernel, I'd like to
> request that work be backported.  While the improvements in 4.20 and
> 4.21 are already fairly obvious, a lot of people will be running 4.19
> for years to come.  This is good hardware, with a working driver
> (thanks team) but in the next few months excitement is going to turn
> toward WPA3 which requires working 802.11w.
> 
> Pretty please backport 802.11w support to 4.19

IIRC the isse is just on mt76x0u, mt76x2u should work

Regards,
Lorenzo

> 
> Thanks,
> Zero
