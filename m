From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mt76x[02]u 802.11w support
Date: Wed, 19 Dec 2018 08:47:43 +0100
Message-ID: <20181219074743.GA3538@redhat.com>
References: <CAM0KTbBUXJsBfO0=hQgeTGVteym6iuObdyNynWumQnnGY0L3wg@mail.gmail.com>
 <20181213143947.GA11947@localhost.localdomain>
 <CAM0KTbCMrcXNFHUFEmoHg+nseN1GkegqAM0GSuWBDHP=gVgi=w@mail.gmail.com>
 <dd275289-99d0-54a8-9ac5-cb137123950a@gmail.com>
 <CAM0KTbBV_YZqt6kkrKeY5tRtKn10UOLQY3EyTKPY+zLzht7sgg@mail.gmail.com>
 <20181217154628.GA4773@redhat.com>
 <20181218080939.GA16795@redhat.com>
 <CAM0KTbCWtwYE3DzmqeHSs3m7A7JojeFFs2_Mp1q5Kg=ySaN0Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAM0KTbCWtwYE3DzmqeHSs3m7A7JojeFFs2_Mp1q5Kg=ySaN0Rw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Dec 18, 2018 at 01:38:54PM -0500, Sid Hayn wrote:
> > > Regarding this case, there is no single commit that add 802.11w support
> > > we could request to add to -stable. It was added together with other
> > > features in:
> > >
> > > commit 0ae976a11b4fb5704b597e103b5189237641c1a1
> > > Author: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > Date:   Thu Sep 6 11:18:41 2018 +0200
> > >
> > >     mt76x0: init hw capabilities
> > >
> > > which depend on switching mt76x0u to mt76-usb layer.
> > >
> > > So I'm not sure how this request should be satisfied.
> >
> > Can you check if adding
> >
> > ieee80211_hw_set(rt2x00dev->hw, MFP_CAPABLE);
> In this case I inferred from cotext that it should be
> ieee80211_hw_set(hw, MFP_CAPABLE); hopefully that is correct.

Yeah it is. I copied the line from wrong driver :-) 

> > is sufficient to add support for 802.11w ?
> As a matter of fact it was sufficient.  I can now connect to my AP
> with 802.11w required and prior to this one line change I could not.
> Thanks for taking the time to suggest this, it seems to work well
> enough to connect.  I don't much have a means to test to see if deauth
> frames are properly handled, do you have any test cases you want to
> suggest or are you comfortable enough that it should work properly?

If you using wpa_supplicant, 'wpa_cli disconnect' should
trigger deauth exchange.

Are there errors in dmesg ? If there are many errors, I think
we will need to change EINVAL to EOPNOTSUPP as well.

Thanks
Stanislaw
