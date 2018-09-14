From: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mt76x0 bug report
Date: Fri, 14 Sep 2018 11:32:46 -0400
Message-ID: <CAM0KTbAu-LJ2ThAHbmbrggMw_ttpQ8fXr0+HTjGBZF6PBPiD8Q@mail.gmail.com>
References: <CAM0KTbBJuhuEyuZB_z_BcDSeXa-CJ+NwupssS2jLx0pJ0KXQGQ@mail.gmail.com>
 <CAJ0CqmWAqdB8Og7fabLDeZnzFO5Aw5Qd0cYGaLrs7Ls-zM_yQw@mail.gmail.com>
 <CAM0KTbAbjDYNOzivxMdLmYrV9QHgwkLp7zXpdCvn1Kf1uEcQTQ@mail.gmail.com>
 <20180906093213.GB16539@redhat.com> <CAM0KTbBRGqNAu1H0myVoWg6Qu1aMXMneSJ7bXQUKbJGZUFkC_A@mail.gmail.com>
 <CAJ0CqmXHHE2J5O4irPogrypL_H95EDm2y+1_6rpWG1v3ZHxzXA@mail.gmail.com>
 <CAM0KTbAF_ztZzFk_iECyPbiWY69xrcdT_93ypnuTzocjX_fRuQ@mail.gmail.com>
 <20180907082413.GC2725@localhost.localdomain> <CAM0KTbAputKNN3seOfN-1zhz5XmT6yg_pbKBnapOsR6Vigv1XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM0KTbAputKNN3seOfN-1zhz5XmT6yg_pbKBnapOsR6Vigv1XQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

*bump*

Been a few days, just a reminder that your monitor mode patch fixed
all channels below 144 but something appears incorrect in regdomain
handling as I cannot get channels 144 or higher working (my main AP
being on channel 149.  Again, this works on mt76x2u but not on mt76x0.
The patch I tested doesn't appear to have landed in wireless-testing
yet, so if you haven't, please do push that up.

Secondarily, ethtool still doesn't report firmware version and that
would be a very helpful thing to have before 4.19 hits.

Additionally, with much less severity, t1u still thinks it is dual
band and I'm happy to run any command, test any patch, etc.  I
honestly don't care about this at all short term, but it does slow the
hardware down tuning to a bunch of channels which it cannot access so
long term it should probably be fixed in some way.

Thanks again for all your hard work, watching the mailing list it is
obvious how much effort is going into this right now.

-Zero
On Fri, Sep 7, 2018 at 3:55 PM Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Fri, Sep 7, 2018 at 4:24 AM Lorenzo Bianconi
> <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > > Actions like that have caused great problems in the past, as the
> > > kernel won't allow channel control of a monitor interface at all when
> > > there is a managed interface on the same phy (afaik).
> > >
> > > But just for fun and codepath testing here are two test scenarios:
> > >
> > > Test 1: "iwconfig t2u mode monitor"
> > > Sees nothing on any channel, no packets reported
> > >
> > > Test 2(requested test): "iw phy phy11 interface add t2uhmon type monitor"
> > > Sees nothing on any channel, no packets reported.
> > > Despite having a monitor and managed interface on the same phy,
> > > iwconfig is reporting that the channel is changing as requested.  So
> > > perhaps my above "afaik" comment is partially outdated.
> > >
> > > For both tests the interface was not used to connect to any ap prior
> > > to or during testing.
> > >
> >
> > Could you please try following patch?
>
> Excellent!  This seems to work for all channels up to 140, however,
> not 144 or above.  "iw list" shows these are supported but I cannot
> set them in monitor mode:
>
> * 5720 MHz [144] (22.0 dBm) (no IR, radar detection)
> * 5745 MHz [149] (22.0 dBm) (no IR)
> * 5765 MHz [153] (22.0 dBm) (no IR)
> * 5785 MHz [157] (22.0 dBm) (no IR)
> * 5805 MHz [161] (22.0 dBm) (no IR)
> * 5825 MHz [165] (22.0 dBm) (no IR)
>
> remote2 ~ # iw dev t2uhmon set channel 140
> remote2 ~ # iw dev t2uhmon set channel 144
> command failed: Invalid argument (-22)
>
> Thanks,
> Zero
>
> > Regards,
> >
> > Lorenzo
> >
> > --- a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
> > @@ -756,11 +756,10 @@ __mt76x0_phy_set_channel(struct mt76x0_dev *dev,
> >
> >         /* Vendor driver don't do it */
> >         /* mt76x0_phy_set_tx_power(dev, channel, rf_bw_band); */
> > +       mt76x0_vco_cal(dev, channel);
> >
> >         if (scan)
> > -               mt76x0_vco_cal(dev, channel);
> > -
> > -       mt76x0_mcu_calibrate(dev, MCU_CAL_RXDCOC, 1);
> > +               mt76x0_mcu_calibrate(dev, MCU_CAL_RXDCOC, 1);
> >         mt76x0_phy_set_chan_pwr(dev, channel);
> >
> >         dev->mt76.chandef = *chandef;
