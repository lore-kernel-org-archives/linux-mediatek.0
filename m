Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F80AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIoxRloG54NTKumTVETQme/QsIJtKm2rzD5h4V6yMug=; b=gifpDqPho1e8Mw3M5Q5vGqphh3
	X8WxjJwDJlsfXDKemSDn55hO29b7JuGQ10iDmcW7qnT4kt7x3HhtLFiIXuF+57Wu4v7NCAXet0cEz
	irFf6pwV7JR7scIxY2kMJQdrmNWZ403nSuVi5aXD9vYAj+hEttmD4fUReaYclXGAZP0TNUXS0+te+
	zpxed2eM3L97lOG/Tmdz4PPUB0tP60B6ZdfZYqlwU5Kr2pylaUale0cmudm3uFh1qaY1ODjRFWajp
	kQ1d2sYh/EeF9h6EYM6N6J5LJYBPz90MKBuuBl/pH5+Eg9MDQzY5ojGohnN3R3uy6rmNJBu/R7+f3
	HXLOLwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7xCN-005Pyj-E1; Thu, 13 Jan 2022 10:19:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7xCK-005Pxt-1Y
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 10:19:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBB3FB81ECB;
 Thu, 13 Jan 2022 10:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC7EC36AE3;
 Thu, 13 Jan 2022 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642069149;
 bh=11HpoOh79JImMu5a+CtI+2j1zpNTutiJy7Ap/Qb5gg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p29KM/aLH7N+JAphxB1qVFmPiDXN8RjhOy1d39xx4d5oKjblr5GzGtRhjoxrMWzBU
 /UuSs5tuG/05fkdEUi5ChDqtIo/QJoxMch50XxeK4pRyaINS7LSBDLNxVo96OX0svx
 TYdZaaMyyWVq/ofRXOfWDLvW8EcrKRISSnE6LftbDoGJgDjuCRgQPSoPxoQSIXPE1b
 8SwDVm1CgCuiCxKEM9zb9rX8eP+aZgdKI06yL4l2C87nO5yVZpmCMHo27V6UBKvHvB
 CQDp4KSEyN1acGiEzaf9W4XmPz7wHRmHHRyt+143KVNm7YkX77Z2GfdJyEmPWm1XAa
 4VZ7Yk2tTmQiw==
Date: Thu, 13 Jan 2022 11:19:05 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Bo Jiao <bo.jiao@mediatek.com>
Subject: Re: [PATCH v2 3/5] mt76: mt7915: add support for MT7986
Message-ID: <Yd/8mXumr25iESux@lore-desk>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <8b2098132192c0381e41ac78a47b7318d5c28b04.1641901681.git.Bo.Jiao@mediatek.com>
 <Yd7ZKb7Qsh4lGA5E@lore-desk>
 <2ab2731dc44494dbfe89363638cdcaf49351afbe.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <2ab2731dc44494dbfe89363638cdcaf49351afbe.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_021912_253560_8E1F43C2 
X-CRM114-Status: GOOD (  21.15  )
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
Content-Type: multipart/mixed; boundary="===============1687402837765496827=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1687402837765496827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvfcff8cOfewXKH7"
Content-Disposition: inline


--cvfcff8cOfewXKH7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 2022-01-12 at 14:35 +0100, Lorenzo Bianconi wrote:
> > >=20
> > > @@ -302,6 +316,15 @@ struct mt7915_dev {
> > >  		u8 table_mask;
> > >  		u8 n_agrt;
> > >  	} twt;
> > > +
> > > +	struct reset_control *rstc;
> > > +	void __iomem *dcm;
> > > +	void __iomem *sku;
> > > +
> > > +	struct {
> > > +		bool is_7975;
> > > +		bool is_7976;
> > > +	} adie[MT7986_MAX_ADIE_NUM];
> >=20
> > do we really need it? Can we just read data from chip when necessary?
> > it is not
> > access in the hot-path, right?
> > I think it is easier and more readable.
>=20
> Adie registers are inaccessible after wfsys power on so we need some
> places to store chip configuration.
> We will modify it to make it more readable.
> + u32 adie;

what I mean is just continue reading these values after the first time (tha=
t is
in common for both approaches).

Regards,
Lorenzo

>=20
> thanks,
> Peter
>=20

--cvfcff8cOfewXKH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYd/8mQAKCRA6cBh0uS2t
rGVEAQCHrAHThMVJZHLoWahbCNC98g2po/d7grDNMgd+uxWRPgD9Ec6DtqPdJcYF
DXkzu4YqSEGJ6gSqxKP0Yf9A1u7q6w0=
=ALze
-----END PGP SIGNATURE-----

--cvfcff8cOfewXKH7--


--===============1687402837765496827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1687402837765496827==--

