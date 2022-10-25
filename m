Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF764ECDFA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRBpOaPxNlf8SCNOdJkWXPOLIiLsxSs1Ig/b7TsdPgg=; b=cxdcSgfiUS3/qTdmshFdDcbHJM
	Uulb/HE7Lzid4LWA4njpTXg/295iHjgApxY3BueMcAifn5LOMStkVmZxswN/m/rzBMVpEjDQ/DD1L
	aw3kGkTfWiFj/EjhMeK+0lNaDrPkKJ5jmWIydg1GNr2NAeZXKPKN6+bZTHby0lsDwhAOUUmBJeRcc
	4VAlVEspYDoa9Stn7QxB7XzMXA5LSYefjeN+vlB7ZlziBnWEA50We/zTADc1x33G6HNGcAbCcQlNF
	9n5HEl6UpN522u/FlzmaiWkE1mndgizPLMpJAunzKTprD+DaAOrnt+IHngrFPnOu/+SEPm91NDlAl
	bM9yDcZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIg0-00571a-0d; Tue, 25 Oct 2022 12:05:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIfx-00570v-12
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 12:04:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 90D8ACE1D3D;
	Tue, 25 Oct 2022 12:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7752DC433C1;
	Tue, 25 Oct 2022 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666699492;
	bh=imPbkygKCePq1i3EyArChYjYSEwf0BNJm1sKgppu4aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dblssCwT7xEDT3+yhnXZazozanPhhtSA/qTKwLthMAUHTCWL41LHSSFMB+TRISU69
	 SEPEN4iUT8iCs9DZCZigypa3AzG2YioBKbuVDxESBHxHXyQp+2MEOzeAQPG6ZLPe6Y
	 IgKDBREQBglLVlVT9yPV/gCoNUVlVspui+FGxX+jafFp7+h08j6c09dfp7X3ULAoDw
	 fD1bx+6tdzhLv8or4464HLskB0792slh8nmq8w487nfoD+HKccm5CIlXOzSbweufKg
	 LrImQu4jEH7QbDIyNMVS18xyYzgKaHFwVN2D4GcC25SDbtjzJqEKIEaG3PWvupGThq
	 dmaEty5LBqJfw==
Date: Tue, 25 Oct 2022 14:04:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Deren Wu <deren.wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
	Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
	KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
	CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
	Stella Chang <Stella.Chang@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: Re: [PATCH v2] wifi: mt76: fix bandwidth 80MHz link fail in 6GHz band
Message-ID: <Y1fQ4BuvyTujs3sK@lore-desk>
References: <85b5e8374fc9b86fb955060c1840f3b2a1d187e4.1666614616.git.deren.wu@mediatek.com>
 <Y1efUIq4aCFO7V6j@lore-desk>
 <8db3eb8a72da2d478780782a54305e3cf1b5b50a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iRIreIuW1ejbPkiI"
Content-Disposition: inline
In-Reply-To: <8db3eb8a72da2d478780782a54305e3cf1b5b50a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_050457_438429_5396A9D9 
X-CRM114-Status: GOOD (  24.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--iRIreIuW1ejbPkiI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> On Tue, 2022-10-25 at 10:33 +0200, Lorenzo Bianconi wrote:
> > > From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > >=20
> > > Due to information missing, the firmware may be fail on bandwidth
> > > related settings in mt7921/mt7922. Add new cmd STA_REC_HE_V2 to
> > > apply
> > > additional capabilities in 6GHz band.
> > >=20
> > > Tested-by: Ben Greear <greearb@candelatech.com>
> > > Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> > > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > > Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > > ---
> > > v2: Fix le16/cpu type problem, reported by kernel test robot <
> > > lkp@intel.com>
> > > ---
> > >  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 34
> > > +++++++++++++++++++
> > >  .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 11 ++++++
> > >  2 files changed, 45 insertions(+)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > index 011fc9729b38..9bba18d24c71 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > @@ -744,6 +744,39 @@ mt76_connac_mcu_sta_he_tlv(struct sk_buff
> > > *skb, struct ieee80211_sta *sta)
> > >  	he->pkt_ext =3D 2;
> > >  }
> > > =20
> > > +static void
> > > +mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct
> > > ieee80211_sta *sta)
> >=20
> > Is this tlv available just for 7921 fw? If so I guess we should add
> > it just for
> > it since mt76_connac_mcu_sta_tlv is used even by other chipsets.
> >=20
> > Regards,
> > Lorenzo
> >=20
>=20
> For now, mt76_connac_mcu_sta_he_tlv_v2() would be used for mt7921 only,
> not for other chips. However, it would be used for all next-generation
> chipsets. I propose to put it here and we will take this API in new
> chip porting.

I am fine with it, I was thinking just to not introduce regression on previ=
ous
chips.

Regards,
Lorenzo

>=20
> Regards,
> Deren
>=20
>=20

--iRIreIuW1ejbPkiI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY1fQ4AAKCRA6cBh0uS2t
rGfKAPwN7ys9uKwavwjvGyG5Vul14eDtXcZ2sQgm9lg/cb8JfAEApZ8nG9PMe7CW
FyqrzcLcc3daLfqCU/Vz8UUX+vKn+gk=
=srUi
-----END PGP SIGNATURE-----

--iRIreIuW1ejbPkiI--

