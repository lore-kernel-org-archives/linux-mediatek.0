From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mt76x0 bug report
Date: Thu, 6 Sep 2018 17:42:57 +0200
Message-ID: <CAJ0CqmXHHE2J5O4irPogrypL_H95EDm2y+1_6rpWG1v3ZHxzXA@mail.gmail.com>
References: <CAM0KTbBJuhuEyuZB_z_BcDSeXa-CJ+NwupssS2jLx0pJ0KXQGQ@mail.gmail.com>
 <CAJ0CqmWAqdB8Og7fabLDeZnzFO5Aw5Qd0cYGaLrs7Ls-zM_yQw@mail.gmail.com>
 <CAM0KTbAbjDYNOzivxMdLmYrV9QHgwkLp7zXpdCvn1Kf1uEcQTQ@mail.gmail.com>
 <20180906093213.GB16539@redhat.com> <CAM0KTbBRGqNAu1H0myVoWg6Qu1aMXMneSJ7bXQUKbJGZUFkC_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM0KTbBRGqNAu1H0myVoWg6Qu1aMXMneSJ7bXQUKbJGZUFkC_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zero Chaos <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

>
> On Thu, Sep 6, 2018 at 5:32 AM Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > On Wed, Sep 05, 2018 at 08:52:18PM +0000, Sid Hayn wrote:
> > > On Tue, Sep 4, 2018 at 5:11 PM Lorenzo Bianconi
> > > <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > > >
> > > > >
> > > > > I have one mt76x2u (Alfa AWUS036ACM) and a few mt76x0.
> > > > >
> > > > > I've noticed two additional issues in my testing.
> > > > >
> > > > > First issue, is that it appears the mt76x0 devices don't work properly
> > > > > in monitor mode.  Sometimes they seem to monitor one channel properly,
> > > > > but nothing else.  The mt76x2u works great, channel control, lots of
> > > > > packets, etc.
> > > >
> > > > Could you elaborate a little bit please? how can you reproduce the issue?
> > > > just add an interface in monitor mode and run a scan?
> > >
> > > Correct, standard stuff, use iw to create a monitor mode interface,
> > > use iw to remove managed mode interface, run some tool such as kismet
> > > or airodump-ng or even wireshark.
> >
> > But what exactly are the syptomps, I don't understand what you mean by
> > "mt76x0 devices don't work properly in monitor mode" ?
>
> Basically, when I put a device using mt76x0 into monitor mode (adding
> a monitor interface with iw and removing the managed interface) it
> will not report packets on any channel, or sometimes it will report
> packets on one channel but not any others.  I can switch channels as
> much, for example hopping channel 1-11, but it will only see packets
> on channel 7 and report no other packets on any other channels.  In my
> actual test case it was channel 44 that successfully reported packets,
> but even that mostly doesn't work.  I suspect the reason it reported
> packets on channel 44 in one of my tests is because the channel was
> set to 44 while in managed mode (connected to an AP).  If I put the
> device in monitor mode before connecting to any AP, it reports packets
> on no channels.  As such, I'm suspecting this has something to do with
> channel control in monitor mode.

What about if you do not remove the managed interface and sniff on the
monitor one?

Regards,
Lorenzo

> >
> > > > I guess it depends on eeprom values. Could you please enable debug
> > > > messages a paste
> > > > syslog output?
> > >
> > > I don't see a mediatek specific debug near the driver selection in
> > > menuconfig, what debug messages do you want me to enable and how?
> >
> > You need to uncomment this line:
> >
> > # ccflags-y := -DDEBUG
> >
> > in drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
>
> found it.  this box takes a few min to rebuild a kernel, so I'll get
> back with this response later today hopefully.
>
> Thanks,
> Zero
> >
> > Thanks
> > Stanislaw
> >
