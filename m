From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/6] mt76: mt7615: unlock dfs bands
Date: Mon, 1 Jul 2019 17:57:01 +0800
Message-ID: <1561975021.3950.9.camel@mtkswgap22>
References: <cover.1561804422.git.lorenzo@kernel.org>
         <33184e0b78983fe7c79fa70c5fbb21042aafa4f5.1561804422.git.lorenzo@kernel.org>
         <87muhzs9qv.fsf@purkki.adurom.net>
         <CAJ0CqmU6TLhFa4ZJxWHBzvpx+5g5E4-WkSPECx47F9d3T=5YjQ@mail.gmail.com>
         <87tvc69odh.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87tvc69odh.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-07-01 at 10:59 +0300, Kalle Valo wrote:
> Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:
> 
> >>
> >> Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> >>
> >> > Unlock dfs channels since now mt7615 driver supports radar detection
> >> >
> >> > Signed-off-by: Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> > ---
> >> >  drivers/net/wireless/mediatek/mt76/mt7615/init.c | 6 ++++++
> >> >  1 file changed, 6 insertions(+)
> >> >
> >> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> >> > index 5dc4cced5789..6d336d82cafe 100644
> >> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> >> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> >> > @@ -152,6 +152,12 @@ static const struct ieee80211_iface_combination if_comb[] = {
> >> >               .max_interfaces = 4,
> >> >               .num_different_channels = 1,
> >> >               .beacon_int_infra_match = true,
> >> > +             .radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
> >> > +                                    BIT(NL80211_CHAN_WIDTH_20) |
> >> > +                                    BIT(NL80211_CHAN_WIDTH_40) |
> >> > +                                    BIT(NL80211_CHAN_WIDTH_80) |
> >> > +                                    BIT(NL80211_CHAN_WIDTH_160) |
> >> > +                                    BIT(NL80211_CHAN_WIDTH_80P80),
> >>
> >> Isn't it questionable to enable these without any testing on real
> >> hardware? Getting DFS to work correctly is hard so I'm very suspicious
> >> about this.
> >>
> >> --
> >> Kalle Valo
> >
> > Hi Kalle,
> >
> > unfortunately at the moment I am not able to run any tests with a real
> > signal generator so I just ported the code from vendor sdk.
> > I am pretty confident it works since the radar pattern detection is
> > done in fw/hw so I guess it has been already tested in the vendor sdk
> 
> DFS is really tricky to get it working right, so I'm not easily
> convinced :)
> 
> > but we can postpone this patch and apply just the rest of the series
> > until we have some test results.
> 
> Yeah, I think it would be best to drop this patch so that DFS is not
> enabled by default and apply this patch only after positive test
> results.
> 

That's why I suggested Lorenzo to add this one - "[6/6] mt76: mt7615:
add radar pattern test knob to debugfs"

We can feed radar pattern through debugfs to test if a pattern is
detected as radar pattern or not and verify the fw radar detection
algorithm.

In this format:
RadarPulsePattern="3680128-2-245;3683878-2-245;3687628-2-245;3691378-2-245;3695128-2-245;3698878-2-245;3702628-2-245;3706378-2-245;3710128-2-245;3713878-2-245"

As for testing it on 'real hardware' I need to take some other time to
borrow equipment.

Ryder
