From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] mt76: mt7615: add TX/RX antenna pattern capabilities
Date: Tue, 30 Apr 2019 19:27:58 +0800
Message-ID: <1556623678.4496.1.camel@mtkswgap22>
References: <4f7160cb9f52335ce15fccac087fec25e7650884.1556255852.git.ryder.lee@mediatek.com>
         <c3f6e202-8c2f-a103-a104-e0d1cde8147b@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c3f6e202-8c2f-a103-a104-e0d1cde8147b-Vt+b4OUoWG0@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-04-30 at 11:24 +0200, Felix Fietkau wrote:
> On 2019-04-26 07:23, Ryder Lee wrote:
> > Announce antenna pattern cap to adapt PHY and baseband settings.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> > Changes since v2:
> > - Add a prefix mt76 in the title.
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7615/init.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> > index 3ab3ff553ef2..122f7a565540 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> > @@ -190,6 +190,8 @@ int mt7615_register_device(struct mt7615_dev *dev)
> >  			IEEE80211_VHT_CAP_SHORT_GI_160 |
> >  			IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454 |
> >  			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK |
> > +			IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN |
> > +			IEEE80211_VHT_CAP_TX_ANTENNA_PATTERN |
> If I read the standard correctly, these flags indicate that the rx/tx
> antenna pattern does NOT change during association.
> Doesn't that mean that we should set it in mac80211.c instead, so that
> it also applies to MT76x2?
> 
Right. I will add these flags in common code.

Ryder
