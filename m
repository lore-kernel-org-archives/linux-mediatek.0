From: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mt76x[02]u 802.11w support
Date: Tue, 18 Dec 2018 13:38:54 -0500
Message-ID: <CAM0KTbCWtwYE3DzmqeHSs3m7A7JojeFFs2_Mp1q5Kg=ySaN0Rw@mail.gmail.com>
References: <CAM0KTbBUXJsBfO0=hQgeTGVteym6iuObdyNynWumQnnGY0L3wg@mail.gmail.com>
 <20181213143947.GA11947@localhost.localdomain> <CAM0KTbCMrcXNFHUFEmoHg+nseN1GkegqAM0GSuWBDHP=gVgi=w@mail.gmail.com>
 <dd275289-99d0-54a8-9ac5-cb137123950a@gmail.com> <CAM0KTbBV_YZqt6kkrKeY5tRtKn10UOLQY3EyTKPY+zLzht7sgg@mail.gmail.com>
 <20181217154628.GA4773@redhat.com> <20181218080939.GA16795@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20181218080939.GA16795-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Dec 18, 2018 at 3:09 AM Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Mon, Dec 17, 2018 at 04:46:28PM +0100, Stanislaw Gruszka wrote:
> > On Mon, Dec 17, 2018 at 10:07:43AM -0500, Sid Hayn wrote:
> > > Interestingly when I asked for the monitor mode patch to be ported it
> > > was initially refused and then just kind of happened a few weeks
> > > later.
> >
> > It was not quite like that. It was refused to apply on 4.19-rcX due to
> > -next merge -rc conflict that it will cause. And it was promised
> > that fixes will be backported thought -stable.
> >
> > Regarding this case, there is no single commit that add 802.11w support
> > we could request to add to -stable. It was added together with other
> > features in:
> >
> > commit 0ae976a11b4fb5704b597e103b5189237641c1a1
> > Author: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > Date:   Thu Sep 6 11:18:41 2018 +0200
> >
> >     mt76x0: init hw capabilities
> >
> > which depend on switching mt76x0u to mt76-usb layer.
> >
> > So I'm not sure how this request should be satisfied.
>
> Can you check if adding
>
> ieee80211_hw_set(rt2x00dev->hw, MFP_CAPABLE);
In this case I inferred from cotext that it should be
ieee80211_hw_set(hw, MFP_CAPABLE); hopefully that is correct.
>
> is sufficient to add support for 802.11w ?
As a matter of fact it was sufficient.  I can now connect to my AP
with 802.11w required and prior to this one line change I could not.
Thanks for taking the time to suggest this, it seems to work well
enough to connect.  I don't much have a means to test to see if deauth
frames are properly handled, do you have any test cases you want to
suggest or are you comfortable enough that it should work properly?

Thanks,
Zero
>
> Most likely it is, since in 4.19 mt76x0_set_key() do not allow to
> set unsupported ciphers. However it returns -EINVAL instead of
> -EOPNOTSUPP, so I want to be sure.
>
> Thanks
> Stanislaw
