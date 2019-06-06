From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/2] mt76: mt7615: enable support for mesh
Date: Thu, 6 Jun 2019 18:19:37 +0200
Message-ID: <CAJ0CqmVBogQrqf4Gckr5gQ6tCrdZG=p60ZiC+-WW-yxt93+40Q@mail.gmail.com>
References: <a1ff446dfc06e2443552e7ec2d754099aacce7df.1559541944.git.ryder.lee@mediatek.com>
 <ade7ef01-8b06-ec7d-4caf-e581f4033819@newmedia-net.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ade7ef01-8b06-ec7d-4caf-e581f4033819-9LViYcISHtuk6R/r8kmGfQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Gottschall <s.gottschall-9LViYcISHtuk6R/r8kmGfQ@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chih-Min Chen <chih-min.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

>
> i tested your patch against a qca 9984 chipset using SAE and without
> encryption. both did not work. the devices are connecting, but no data
> connection is possible

Hi Sebastian,

I tested Ryder's patch using mt76x2 as mesh peer and it works fine for me.
Could you please provide some more info?

Regards,
Lorenzo

>
>
> Sebastian
>
> Am 03.06.2019 um 08:08 schrieb Ryder Lee:
> > Enable NL80211_IFTYPE_MESH_POINT and update its path.
> >
> > Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> > Changes since v3 - fix a wrong expression
> > Changes since v2 - remove unused definitions
> > ---
> >   drivers/net/wireless/mediatek/mt76/mt7615/init.c | 6 ++++++
> >   drivers/net/wireless/mediatek/mt76/mt7615/main.c | 1 +
> >   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 4 +++-
> >   drivers/net/wireless/mediatek/mt76/mt7615/mcu.h  | 6 ------
> >   4 files changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> > index 59f604f3161f..f860af6a42da 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> > @@ -133,6 +133,9 @@ static const struct ieee80211_iface_limit if_limits[] = {
> >       {
> >               .max = MT7615_MAX_INTERFACES,
> >               .types = BIT(NL80211_IFTYPE_AP) |
> > +#ifdef CONFIG_MAC80211_MESH
> > +                      BIT(NL80211_IFTYPE_MESH_POINT) |
> > +#endif
> >                        BIT(NL80211_IFTYPE_STATION)
> >       }
> >   };
> > @@ -195,6 +198,9 @@ int mt7615_register_device(struct mt7615_dev *dev)
> >       dev->mt76.antenna_mask = 0xf;
> >
> >       wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
> > +#ifdef CONFIG_MAC80211_MESH
> > +                              BIT(NL80211_IFTYPE_MESH_POINT) |
> > +#endif
> >                                BIT(NL80211_IFTYPE_AP);
> >
> >       ret = mt76_register_device(&dev->mt76, true, mt7615_rates,
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> > index b0bb7cc12385..585e67fa2728 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> > @@ -37,6 +37,7 @@ static int get_omac_idx(enum nl80211_iftype type, u32 mask)
> >
> >       switch (type) {
> >       case NL80211_IFTYPE_AP:
> > +     case NL80211_IFTYPE_MESH_POINT:
> >               /* ap use hw bssid 0 and ext bssid */
> >               if (~mask & BIT(HW_BSSID_0))
> >                       return HW_BSSID_0;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > index 43f70195244c..e82297048449 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > @@ -754,6 +754,7 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
> >
> >       switch (vif->type) {
> >       case NL80211_IFTYPE_AP:
> > +     case NL80211_IFTYPE_MESH_POINT:
> >               tx_wlan_idx = mvif->sta.wcid.idx;
> >               conn_type = CONNECTION_INFRA_AP;
> >               break;
> > @@ -968,7 +969,7 @@ int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struct ieee80211_vif *vif,
> >               .rx_wtbl = {
> >                       .tag = cpu_to_le16(WTBL_RX),
> >                       .len = cpu_to_le16(sizeof(struct wtbl_rx)),
> > -                     .rca1 = vif->type != NL80211_IFTYPE_AP,
> > +                     .rca1 = vif->type == NL80211_IFTYPE_STATION,
> >                       .rca2 = 1,
> >                       .rv = 1,
> >               },
> > @@ -1042,6 +1043,7 @@ static void sta_rec_convert_vif_type(enum nl80211_iftype type, u32 *conn_type)
> >   {
> >       switch (type) {
> >       case NL80211_IFTYPE_AP:
> > +     case NL80211_IFTYPE_MESH_POINT:
> >               if (conn_type)
> >                       *conn_type = CONNECTION_INFRA_STA;
> >               break;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
> > index e96efb13fa4d..0915cb735699 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
> > @@ -105,25 +105,19 @@ enum {
> >   #define STA_TYPE_STA                BIT(0)
> >   #define STA_TYPE_AP         BIT(1)
> >   #define STA_TYPE_ADHOC              BIT(2)
> > -#define STA_TYPE_TDLS                BIT(3)
> >   #define STA_TYPE_WDS                BIT(4)
> >   #define STA_TYPE_BC         BIT(5)
> >
> >   #define NETWORK_INFRA               BIT(16)
> >   #define NETWORK_P2P         BIT(17)
> >   #define NETWORK_IBSS                BIT(18)
> > -#define NETWORK_MESH         BIT(19)
> > -#define NETWORK_BOW          BIT(20)
> >   #define NETWORK_WDS         BIT(21)
> >
> >   #define CONNECTION_INFRA_STA        (STA_TYPE_STA | NETWORK_INFRA)
> >   #define CONNECTION_INFRA_AP (STA_TYPE_AP | NETWORK_INFRA)
> >   #define CONNECTION_P2P_GC   (STA_TYPE_STA | NETWORK_P2P)
> >   #define CONNECTION_P2P_GO   (STA_TYPE_AP | NETWORK_P2P)
> > -#define CONNECTION_MESH_STA  (STA_TYPE_STA | NETWORK_MESH)
> > -#define CONNECTION_MESH_AP   (STA_TYPE_AP | NETWORK_MESH)
> >   #define CONNECTION_IBSS_ADHOC       (STA_TYPE_ADHOC | NETWORK_IBSS)
> > -#define CONNECTION_TDLS              (STA_TYPE_STA | NETWORK_INFRA | STA_TYPE_TDLS)
> >   #define CONNECTION_WDS              (STA_TYPE_WDS | NETWORK_WDS)
> >   #define CONNECTION_INFRA_BC (STA_TYPE_BC | NETWORK_INFRA)
> >
