Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEDBC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 09:54:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B76464DD6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 09:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B76464DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aKZ/43aNvRrxWJEYoAB3bjh2INGF8F7eZYchyUgqZFI=; b=N14nwzgAptOxYyxK3SnAyuQB9
	Xm4m3dFNTchk0nFymFICTxBPCG6CUxuCTEWwt4KdUu+K1nXqQbSjhGHsjFAiZDVf4KG3eXQPuKGW3
	baxNXSb98KyJQk653Z4YwqoqwVlexzgSfkKpn2VnlknEQJVYLRUqnfmgMlvKCd1KLL17r4KbUZMnh
	cn5YXUKIerlHZOW6IFNfiagUyresTbAKYA4+8up1bfc7L14JerclZ9N91A+T3CK+2VYW4Eq75GQ50
	mFvvpPaLJfeIlkA8EjeUTs2z5fQcDDDyq5gaGr7TXOf9h/77KEBpoOaCZrdsOvrvTsPOfBQrPa1qU
	tO6MtgvWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l540M-0007Gg-AE; Thu, 28 Jan 2021 09:54:22 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l540J-0007Ft-5x; Thu, 28 Jan 2021 09:54:19 +0000
Received: from localhost (p54b33782.dip0.t-ipconnect.de [84.179.55.130])
 by pokefinder.org (Postfix) with ESMTPSA id 6C95F2C04D8;
 Thu, 28 Jan 2021 10:54:18 +0100 (CET)
Date: Thu, 28 Jan 2021 10:54:18 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [RESEND, V2] i2c: mediatek: Move suspend and resume handling to
 NOIRQ phase
Message-ID: <20210128095418.GM963@ninjato>
References: <1610180990-23496-1-git-send-email-qii.wang@mediatek.com>
 <1611661020.15158.4.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1611661020.15158.4.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_045419_347477_BF0BD7A8 
X-CRM114-Status: GOOD (  14.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5214058333386455772=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5214058333386455772==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yaap9KN+GmBP785v"
Content-Disposition: inline


--yaap9KN+GmBP785v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 07:37:00PM +0800, Qii Wang wrote:
> Hi Wolfram,
>=20
> On Sat, 2021-01-09 at 16:29 +0800, qii.wang@mediatek.com wrote:
> > From: Qii Wang <qii.wang@mediatek.com>
> >=20
> > Some i2c device driver indirectly uses I2C driver when it is now
> > being suspended. The i2c devices driver is suspended during the
> > NOIRQ phase and this cannot be changed due to other dependencies.
> > Therefore, we also need to move the suspend handling for the I2C
> > controller driver to the NOIRQ phase as well.
> >=20
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--yaap9KN+GmBP785v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASicUACgkQFA3kzBSg
Kbb1SxAAkdlzqRe2g/+FlrSwbUlvm/+2tdGA2oq/oRPw5uUiSeSC860KEdWS6q0b
eF3cQLo3iiPFeUO0bUc/JPpQn6ItaFDVfbvbBLX2hRJswUPXmVJxHqTQqOKuHgrM
rsCyXohNdxdT40Bf7+0VteZydDXFbcnStJyCKdn2RjjOXnpX4Y5kQmsqkMxKY4bd
4LXYyvKsuqfTSPqdvSKozOuspmNDI+/Vq8x/IZHccR27y2vz8vg7b6yRjiRQp2tc
0dwXzzIUYvMhKEK0ivfNe1uPMI9Sw7SD5i6wFzkT5DIuKfWRpiQxd304nExOvdoI
xe244OgI6WUCXgTax2UwtOnUdscIrP0Edc3wwf7ewdmCAqirUKsZenWbpBOcvdDn
lz5IGU5WOQjjds6rL/dYyUlhQRghhRpsmyiF65vFQ/80h0sEMP/g+CAq7GfuAXw2
rqNkOw4YGCqTy5oidT9s4g+69G8i6alQZ+p1GE0B/2KIzMgwPwcKS3NmIrwcrYEE
+lszyWcK2o3kkcyYls5hvniLK5zSoJomdfqwwRnCNeJng3GqAUaD34Lq5k7lmaIv
IgT3vOzUWN5V/gCtGg6SPEUzkalEhcQ3Z3eu/+nAOj518SLroSdHfWWqwkpktfjs
8KQgg+hYgQxHq5qvs9X12mbYiRI3ZlSnNISA7/k47w3US6BmlLE=
=eBay
-----END PGP SIGNATURE-----

--yaap9KN+GmBP785v--


--===============5214058333386455772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5214058333386455772==--

