Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC7FC0018A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbtOFlbX3gHkIOuFiIoYXf34nIoIu4v7XweB+a+552E=; b=GADbxG907NST2ltVgvhKCCip0i
	wVDql7YMhdrghB/HmGxwQ0yRm3gXVAA8+rTWT8Cbie3x60lmCKoes1+BurtHXgNkLUIlMqLbXWqm2
	dswnljGx6O3522uFfuIqYdQv7KCz79S+TAdye5j1qy+xzQn4w8v52tPwvswtW1nZtNq//7CeD4eMe
	xKdta5SI++ldlE5lWDUZlB0HWzX9yaEO5M+Deq4Wv8dglIHm5ZYTfSYr8lifaDnJMfXnSo8zs7E/j
	lr4awQS6liLneNGMgtiEsgsTEAHz5bhdWmtVs181iZFnk6UesFUb9Yb/7j9kPmJmQHG0+uibAnImc
	qREL3QCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDFS-007khw-26;
	Wed, 01 Nov 2023 15:35:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDFM-007kgr-2n;
	Wed, 01 Nov 2023 15:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5A044B818D2;
	Wed,  1 Nov 2023 15:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596B4C433C8;
	Wed,  1 Nov 2023 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698852906;
	bh=i7SLqNYwMroJ9j6IeGlb9lr1J6JFmKijcwga1nozlgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjiS0rGQuzpA1Uq8UA44VJt7uRBrMkUEIhCSNc/J8Z1G+X4CenLaQ9c5gQAhqXkRd
	 zqftjQYhulP9KricxTbFD6XlVDXzpYb5XWd9hng/jkmvsup0K+cjrTKB8yf+9ZjkiQ
	 tjeNNADvfOsxZQtddYey0B7ZnKmJkmqBOxnU5EFLQbB7CicMuo+r0ViFNTTEX0lO8Q
	 4/VcSShzHB1dCG5yWhdj+9ieK2+X8ghpQ+bXlPKa+Bgr3MImV6ex+7wtA5ULqCd548
	 TT56hJcESdfB/BkoPxU0AiL5vxZ+BVmjslLmpH28bwGMx1vuvYIqJq+JCz8av32lfI
	 VH0lzDs0u+weQ==
Date: Wed, 1 Nov 2023 16:35:03 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Tom Waldron <tom@baremetal.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] wifi: mt76: mt7921: Add a new VID/PID 0b48/7922 for
 MT7922
Message-ID: <ZUJwJ+bimXFVcXps@lore-desk>
References: <20231101095533.45258-1-tom@baremetal.dev>
 <ZUJoFAcKMrVD5Glo@lore-desk>
 <CANjHDnBkCW_zQxyCcKcyrZOYnnLNVKT1Z2AJr6x6DT55UZ+A7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WqCCO7JUs1yhqnjX"
Content-Disposition: inline
In-Reply-To: <CANjHDnBkCW_zQxyCcKcyrZOYnnLNVKT1Z2AJr6x6DT55UZ+A7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_083509_046899_4C1D9187 
X-CRM114-Status: GOOD (  19.28  )
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


--WqCCO7JUs1yhqnjX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> PCI VID 0x0b48 doesn't appear to be listed anywhere I can find, though
> a website named pcilookup.com suggests it belongs to TechnoTrend AG. I
> think it's more likely to be part of AMD RZ600 series - rebranded
> mediatek devices. Not sure how any of this might be verified.

I have just found it here: include/linux/pci_ids.h
but I am not sure if it is related. Anyway:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> On Wed, 1 Nov 2023 at 15:00, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
> >
> > > Add VID/PID 0b48/7922 for MediaTek MT7922 wifi chip.
> > > Change tested on Redmi Book Pro 15 2023 (Fedora 38).
> > >
> > > Signed-off-by: Tom Waldron <tom@baremetal.dev>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/driver=
s/net/wireless/mediatek/mt76/mt7921/pci.c
> > > index 3dda84a93..ba805cb02 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > > @@ -21,6 +21,8 @@ static const struct pci_device_id mt7921_pci_device=
_table[] =3D {
> > >               .driver_data =3D (kernel_ulong_t)MT7921_FIRMWARE_WM },
> > >       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0616),
> > >               .driver_data =3D (kernel_ulong_t)MT7922_FIRMWARE_WM },
> > > +     { PCI_DEVICE(0x0b48, 0x7922),
> > > +             .driver_data =3D (kernel_ulong_t)MT7922_FIRMWARE_WM },
> >
> > is PCI VID 0x0b48 PCI_VENDOR_ID_ITTIM?
> >
> > Regards,
> > Lorenzo
> >
> > >       { },
> > >  };
> > >
> > > --
> > > 2.41.0
> > >

--WqCCO7JUs1yhqnjX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZUJwJwAKCRA6cBh0uS2t
rDnIAP46mx8DfEExBed+hFhMm/5wX5CN9oCke5LtPX763BQasAD9H/IqZt28/EsZ
4vCLxApqMXI2QJzrT5l2rnGv80S6twc=
=QvB7
-----END PGP SIGNATURE-----

--WqCCO7JUs1yhqnjX--

