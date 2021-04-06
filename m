Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B12C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 19:49:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7358B613CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 19:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7358B613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ExoXaDZBCIdHEpJgXra4Dh5QgtLJrBOjEJQMu4kk69g=; b=TW0M36V9pxJZiPQTzS1GgE35k
	VYv01JGvbWH3M9tlImBFXX1/LAHwInpFqI5slo598YBYexGIFqvhqz14F7tx7kU5iDMVY2adENq1S
	y0MryiHXNsoSTq89fw7DCyB+AxOLJVH/RMVDPfwc0Yt1XUPlWgL92mGsEDL62CmBinNFN6Xf7Vr3b
	Ue8tMLkg7akZjwrVYBemq2nRXtI74E476pc3ubuqeWNSKTHaL0Miqcs9gM1aIVVH7tTGoz+dohMV/
	G1kCxzRDnudzjkwITUd7ImjrCLKy4vQMnQj7NiWZNRQuGRNi/C9NLFuf+DGpD/qtkhLqsnZcf7eBO
	cevGWJq4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTrhK-003MMl-Mo; Tue, 06 Apr 2021 19:49:14 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lTrh6-003MLL-5K; Tue, 06 Apr 2021 19:49:02 +0000
Received: from localhost (p54b3309d.dip0.t-ipconnect.de [84.179.48.157])
 by pokefinder.org (Postfix) with ESMTPSA id 463B32C04D8;
 Tue,  6 Apr 2021 21:48:58 +0200 (CEST)
Date: Tue, 6 Apr 2021 21:48:56 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Message-ID: <20210406194856.GF3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_204900_464228_1135C8B2 
X-CRM114-Status: GOOD (  11.17  )
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
Content-Type: multipart/mixed; boundary="===============6988519874867113283=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6988519874867113283==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline


--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 13, 2021 at 04:04:24PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> clock-stretching or circuit loss, we could get device
> clock-stretch time from dts to adjust these parameters
> to meet the spec via EXT_CONF register.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

I tried to understand from the code what the new binding expresses, but
I don't fully understand it. Is it the maximum clock stretch time?
Because I cannot recall a device which always uses the same delay for
clock stretching.


--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsuygACgkQFA3kzBSg
KbbOjw/7B8MXTjgR11P25HsLFbayUrZDnsFzJtjHOTGDx/XGm4IVlf/c0RHjInRz
VGWqF2EyJA4cDlZTnnsYGadOBQ+SJSAo0xyDqwxmYIV5goFZdV0pFklMLuHEe4ao
rwSeruU9SCM8VdTGMBqsZ9Sh3nApC0ydn5EU7AIwtB+UwRKL7mFwyLX2ZfpGBJDp
gF6j+o/ag3nKMgsLdIf0l3afKMgbeTTepTkEAXYY/y+e06Ea77HuwghsLvoH0cxB
mKPuWLsF6Pr2J8FVb+iqBT6NDwfj9yNGdu96wbFTQaHzJ8rjjXdDyykju0whq8Fe
kux0ugGcM75AlJSxvJhhjcxjcA03LMbOrxhBCzLy6M46ho0GnFFJPFTF8deeOLwu
ZsWI3tifh+MW6tvSKcZzrooevCHTErPncCIxbVTJgIQu3q2HQK0hXBDz/7ede/oU
SlQSrxjU6jUzIYVkASYF3wN/eCj4e7fUuMXioyBf5v9BnMRLjJs1eHGs9c10ah1F
YbTm0oBxADH26HU3KZkAPcWajjWDmgOyjmfcmmcx6y0jyP4k+4ysvunP7QBUgwyC
PLEnZyI123oI9UToZY1UR9v/VEn8tkIhf1qmgI++yQtvwnFOmrvmzcvo5otc3G7b
2x/Hwt1/skpWkj341hmYG3q7ehYX4auMBCSs66OBLYD6UzSS/jY=
=LA70
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--


--===============6988519874867113283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6988519874867113283==--

