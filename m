Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E93C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 12:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OecKR2JuH7Kr+IH3P+ogztO1Jfk6tPwEJam+eiVNZTM=; b=Lq165zp+d+r0cyJ/D3p6XExpkJ
	YbGjoQe8nu+Hl/cwoo5/7Btmbami72IgvxMp7zVeS+PwlEpJ2B1bCrPlaOZCN3bX3B79ptXICf/6G
	03SjP35mj7OWOf34ZdFYPO9GBcoHXp2mANnoVbacFA21b0WcTG4hD4v+20TqtskDFslJg/JpbToQw
	fztJPu9+LN+2qLXLSMaUQrlHczZrI1PoEG5475DVlsGu0rNYMhfSc1pcVwwDNf+poq0RnauB4Hz4U
	q9JFjLChdz1aLLc9FRYsfRtXziH31OJaWSvuZc19bjr6Lz03i6gNefDRFzSvThguCkMGReZJaj3z9
	RT2wIY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osk70-00DOev-Of; Wed, 09 Nov 2022 12:23:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osk6y-00DOeG-6G
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 12:23:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E2A49B81E1E;
	Wed,  9 Nov 2022 12:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC4EC433C1;
	Wed,  9 Nov 2022 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667996597;
	bh=kqYezkJ/OwLF81BrpqzBRwkgR1PfPxPSMDoLYP15RAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqTAZPK96eaepNDjtJqr2PkoBnNcWnXBOCuzOXk/Kh9TqEIgjEWnvwXyuBrFJni2Q
	 m5TUSV0/NHFaWEJcziQic1miTxCLAiEZBxScOJY9L1LR5OOCDjkxgdFe23uY5YlamW
	 B4kNfLtYE9L6n5oeKtq3sfJU/xLy9aAnjWOAg+uMMlGkG10agRTtjZzaYJlVRvr1F9
	 RZc9DyU9vc1WDOZ8Q94LS9hyH2hytzyMlk+lSRZVL57L3xlGqh/hZYcneZhxqfkLRM
	 1rRgxul8x18Ye9+udruLFPR1TfKHhU9ids03n4nm5ULSvH3vCyQhxumhhjAOlsFZc/
	 lbofgbt5xvHfA==
Date: Wed, 9 Nov 2022 13:23:13 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 08/10] wifi: mt76: connac: add more starec command tags
Message-ID: <Y2ubscudOqgM6KVz@localhost.localdomain>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
 <20221031164000.17063-9-shayne.chen@mediatek.com>
 <Y2uXJh5rFm9uocvz@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UCQWQl3MBJUcf10d"
Content-Disposition: inline
In-Reply-To: <Y2uXJh5rFm9uocvz@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_042320_384870_47C7A1A0 
X-CRM114-Status: GOOD (  17.48  )
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


--UCQWQl3MBJUcf10d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > Add starec tags which will be used in new chipset.
> > This is a preliminary patch to add mt7996 chipset support.
> >=20
> > Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/dri=
vers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > index ed1d24822c37..336c20fcc8dc 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > @@ -791,6 +791,8 @@ enum {
> >  	STA_REC_PHY =3D 0x15,
> >  	STA_REC_HE_6G =3D 0x17,
> >  	STA_REC_HE_V2 =3D 0x19,
> > +	STA_REC_HDRT =3D 0x28,
> > +	STA_REC_HDR_TRANS =3D 0x2B,
> >  	STA_REC_MAX_NUM
> >  };
>=20
> I guess this patch does not apply cleanly.
>=20
> Regards,
> Lorenzo
>=20
> > =20
> > --=20
> > 2.25.1
> >=20

I guess I am missing sta_rec_he_v2 structure definition. Is it already upst=
ream
or have you missed it?

Regards,
Lorenzo

--UCQWQl3MBJUcf10d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2ubrgAKCRA6cBh0uS2t
rKoRAP9fcTnggQxj1gHoI5gfn/9YlJ1lOMGr0cQU65KLW/TedwD/UbioEm9r0EpW
Gvo79uNqhSE2xbiru/pcgpeShHA8KgU=
=pM2l
-----END PGP SIGNATURE-----

--UCQWQl3MBJUcf10d--

