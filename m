From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mt76x[02]u 802.11w support
Date: Tue, 18 Dec 2018 09:09:39 +0100
Message-ID: <20181218080939.GA16795@redhat.com>
References: <CAM0KTbBUXJsBfO0=hQgeTGVteym6iuObdyNynWumQnnGY0L3wg@mail.gmail.com>
 <20181213143947.GA11947@localhost.localdomain>
 <CAM0KTbCMrcXNFHUFEmoHg+nseN1GkegqAM0GSuWBDHP=gVgi=w@mail.gmail.com>
 <dd275289-99d0-54a8-9ac5-cb137123950a@gmail.com>
 <CAM0KTbBV_YZqt6kkrKeY5tRtKn10UOLQY3EyTKPY+zLzht7sgg@mail.gmail.com>
 <20181217154628.GA4773@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20181217154628.GA4773-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Dec 17, 2018 at 04:46:28PM +0100, Stanislaw Gruszka wrote:
> On Mon, Dec 17, 2018 at 10:07:43AM -0500, Sid Hayn wrote:
> > Interestingly when I asked for the monitor mode patch to be ported it
> > was initially refused and then just kind of happened a few weeks
> > later.
> 
> It was not quite like that. It was refused to apply on 4.19-rcX due to
> -next merge -rc conflict that it will cause. And it was promised
> that fixes will be backported thought -stable.
> 
> Regarding this case, there is no single commit that add 802.11w support
> we could request to add to -stable. It was added together with other
> features in:
> 
> commit 0ae976a11b4fb5704b597e103b5189237641c1a1
> Author: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Sep 6 11:18:41 2018 +0200
> 
>     mt76x0: init hw capabilities
> 
> which depend on switching mt76x0u to mt76-usb layer.
> 
> So I'm not sure how this request should be satisfied.

Can you check if adding

ieee80211_hw_set(rt2x00dev->hw, MFP_CAPABLE);

is sufficient to add support for 802.11w ? 

Most likely it is, since in 4.19 mt76x0_set_key() do not allow to
set unsupported ciphers. However it returns -EINVAL instead of
-EOPNOTSUPP, so I want to be sure.

Thanks
Stanislaw
