From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH net-next 0/2] net: mediatek: Add MT7621 TRGMII mode support
Date: Tue, 18 Jun 2019 03:53:09 +0200
Message-ID: <20190618015309.GA18088@lunn.ch>
References: <20190616182010.18778-1-opensource@vdorst.com>
 <20190617140223.GC25211@lunn.ch>
 <20190617213312.Horde.fcb9-g80Zzfd-IMC8EQy50h@www.vdorst.com>
 <20190617214428.GO17551@lunn.ch>
 <20190617232004.Horde.mAVymZdeb9Jjf29W2PeOggU@www.vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190617232004.Horde.mAVymZdeb9Jjf29W2PeOggU-ZhRpVFQjr3SrG/iDocfnWg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivien Didelot <vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

> By adding some extra speed states in the code it seems to work.
> =

> +               if (state->speed =3D=3D 1200)
> +                       mcr |=3D PMCR_FORCE_SPEED_1000;

Hi Ren=E9

Is TRGMII always 1.2G? Or can you set it to 1000 or 1200? This
PMCR_FORCE_SPEED_1000 feels wrong.

> >We could consider adding 1200BaseT/Full?
> =

> I don't have any opinion about this.
> It is great that it shows nicely in ethtool but I think supporting more
> speeds in phy_speed_to_str() is enough.
> =

> Also you may want to add other SOCs trgmii ranges too:
> - 1200BaseT/Full for mt7621 only
> - 2000BaseT/Full for mt7623 and mt7683
> - 2600BaseT/Full for mt7623 only

Are these standardised in any way? Or MTK proprietary?  Also, is the T
in BaseT correct? These speeds work over copper cables? Or should we
be talking about 1200BaseKX?

   Thanks
	Andrew
