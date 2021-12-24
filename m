Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D3CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SaNBqZa4zJhuGJF9K83efE2aHBW60JpnBsT1lWO0k4=; b=XxtHMrViJhrjRmZch8bFs3Ehvi
	aoBdS4dk5roguyMG0C7UIkcfU2nfJr0YYYFBUNqn5fUVx0i/G3wVJ5aEWTnYbzBSMRJ2CM0nor1mP
	5ilb6X9vwD7m6LyVGNKko2NdaYnRa0LT/ATIj7WF9XjKufZa+UNxQBjiAXOZ6uGmK4WWKuOzOAE91
	MegAOTDxftxFcVdmJy0k4cxDertkfBdFvO2h5sl6d+vL2RiHQxX9WOXUHEoco4BiAqsM69LbE7Ugu
	L68yGfyFrvC6GRHVlfFCiHiCTHPQunpvvMaGr6+119+87yRTSSaOkghvyJwSxJT+d5SzaCbMM7La0
	OVc+zmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gu0-00E1DJ-DS; Fri, 24 Dec 2021 09:30:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gtx-00E1CX-GR
 for linux-mediatek@lists.infradead.org; Fri, 24 Dec 2021 09:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14E3062015;
 Fri, 24 Dec 2021 09:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00060C36AE5;
 Fri, 24 Dec 2021 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640338212;
 bh=hMd5fq8pI+RLWctT1qOsKOBNJ36WrtEsMxkPmx+St7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qtIOTC5jBIx7oFXeUGrCbFqXLtANzjb3a+a8nbfH/pFKiB7QZmt6mXFRF6BUJv0wA
 SmhpkuuCgbq/BGqFzNAUWGn4qvFRUCcVMhIn3RjkcUxKHb87DqxO2us0iTTy2kXXk0
 akWYqU/ho0GSQQn5/WX2UxLi4gMQYnX+TaWjDdeAbsejU8YVTVDdRRaABNX0FqfhTl
 VkcPlB98JCyjoFm1GdO3IpeG41xzNV6ZLfrnOQECQWZKJxe2AiMD9yi+0Z0aQlvwte
 SLQ2tvoQsX7dooX8whCftsBSxZg9lU72zYJjuYARMnGoJ2iM/oyXKDSCba8/GGm3nN
 0GBwc0Ut9lHrw==
Date: Fri, 24 Dec 2021 10:30:08 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Xing Song <xing.song@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/1] mt76: add mt7916 to set wlan_idx_hi
Message-ID: <YcWTIEGR7pz7+t5v@lore-desk>
References: <cover.1640175865.git.Bo.Jiao@mediatek.com>
 <5b82d68ee7c879591e22da51bfdb4af2e5fad228.1640175865.git.Bo.Jiao@mediatek.com>
 <YcTwP6Hu5VoTMHEq@lore-desk>
 <6d3a52918457d4fedf91a6a224cf35eaf940f22c.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <6d3a52918457d4fedf91a6a224cf35eaf940f22c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_013013_656782_7BB979E6 
X-CRM114-Status: GOOD (  24.71  )
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
Content-Type: multipart/mixed; boundary="===============3088971693845543421=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3088971693845543421==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tefrqXE5aXn843G5"
Content-Disposition: inline


--tefrqXE5aXn843G5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 2021-12-23 at 22:55 +0100, Lorenzo Bianconi wrote:
> > > From: Bo Jiao <Bo.Jiao@mediatek.com>
> > >=20
> > > since mt7916 support up to 544 wcid entries,
> > > add it to set wlan_idx_hi.
> > >=20
> > > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > > Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 5 +++++
> > >  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
> > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > > b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > > index e999d71..8701f04 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > > @@ -110,6 +110,11 @@ static inline bool is_mt7915(struct mt76_dev
> > > *dev)
> > >  	return mt76_chip(dev) =3D=3D 0x7915;
> > >  }
> > > =20
> > > +static inline bool is_mt7916(struct mt76_dev *dev)
> > > +{
> > > +	return mt76_chip(dev) =3D=3D 0x7906;
> > > +}
> > > +
> > >  static inline u8 mt76_connac_chan_bw(struct cfg80211_chan_def
> > > *chandef)
> > >  {
> > >  	static const u8 width_to_bw[] =3D {
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > > index edad583..fc9a084 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > > @@ -1464,7 +1464,7 @@ mt76_connac_mcu_get_wlan_idx(struct mt76_dev
> > > *dev, struct mt76_wcid *wcid,
> > >  {
> > >  	*wlan_idx_hi =3D 0;
> > > =20
> > > -	if (is_mt7921(dev) || is_mt7915(dev)) {
> > > +	if (is_mt7921(dev) || is_mt7915(dev) || is_mt7916(dev)) {
> > >  		*wlan_idx_lo =3D wcid ? to_wcid_lo(wcid->idx) : 0;
> > >  		*wlan_idx_hi =3D wcid ? to_wcid_hi(wcid->idx) : 0;
> >=20
> > I guess I have already included the fix here:
> >=20
> https://patchwork.kernel.org/project/linux-wireless/patch/df4d462f1ef4cfc=
1ae4f6482051a28a10c78262b.1640260901.git.lorenzo@kernel.org/
> >=20
> > Regards,
> > Lorenzo
> >=20
>=20
> I think we can fold these patches together and use !is_connac_v1
> instead so that we can avoid endless is_mtxxxx || ... || ...

yes, it is already in my tree and I will post it in the next series.
@Felix: can you please ignore this patch?

Regards,
Lorenzo

>=20
> Ryder
>=20
>=20

--tefrqXE5aXn843G5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYcWTIAAKCRA6cBh0uS2t
rJQeAP0UBrw+k2EUHpoTT9i6Ll/vZsmYLkbrn/aLr2t0yyftcAEA4A9k06Nc/+3L
k/szkWoofkrONcykvd7Q6Q/8ClTGTAQ=
=Wid9
-----END PGP SIGNATURE-----

--tefrqXE5aXn843G5--


--===============3088971693845543421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3088971693845543421==--

