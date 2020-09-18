Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81455C43465
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:52:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B25C2311B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hq6EFqw1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B25C2311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JY/xSaJRPOiqlFRS8jDjhUKsM2VToA4mlVblvZnZYEM=; b=Hq6EFqw1pAmNlmkMeRA6Bk7aS
	rOwcz7y5q2CnQhN9oglTrVgdbh++CYDCrWToScA7itLaL/uP1o2GDYbqQ9FnQww3G0b5+NRTbJlAr
	YpOqX85YhA74wSOoqZptT+E25eosYZuFtjlU2ugDERBz//517e14Uq8NYlvrz1E3fztZGC0dO+Ml5
	LmhWK8Sp312dYvKNnCIBbW/Y0pgqZ/dXT/8dgcTqed8i2GsdcSNjrUmgNLhgRAq4A8y0jrf8lwvz+
	wJhXXESiHEX0Y/ugHCCrjDEHo4haPdQR7emtm5wMbkf32xheL0fQJuwosg+deeMKhDA43NciOuWhg
	oAatkFL0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJNN1-0003Dz-NU; Fri, 18 Sep 2020 20:52:39 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJNMw-0003C9-Ea; Fri, 18 Sep 2020 20:52:35 +0000
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 by pokefinder.org (Postfix) with ESMTPSA id C43342C079A;
 Fri, 18 Sep 2020 22:52:33 +0200 (CEST)
Date: Fri, 18 Sep 2020 22:52:33 +0200
From: <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH 1/2] i2c: mediatek: Fix generic definitions for bus
 frequency
Message-ID: <20200918205233.GB52206@kunai>
Mail-Followup-To: <wsa@the-dreams.de>, Qii Wang <qii.wang@mediatek.com>,
 <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>
References: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
 <1600343742-9731-2-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1600343742-9731-2-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_165234_619056_1ED21BD5 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3272895282413292679=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3272895282413292679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 07:55:41PM +0800, Qii Wang wrote:
> The max frequency of mediatek i2c controller driver is
> I2C_MAX_HIGH_SPEED_MODE_FREQ, not I2C_MAX_FAST_MODE_PLUS_FREQ.
> Fix it.
>=20
> Fixes: 90224e6468e1 ("i2c: drivers: Use generic definitions
> for bus frequencies")
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lHhEACgkQFA3kzBSg
Kbbjow//QIfxC7xv1/DAD8qHFZKWr2xqf18Z6s90nhgp+f/9icrHa688DcC0D9gg
4pgQlECnkgumniGAothwbe6PejMhlcJu8JnuGlCP5Wtm1i7vk70yvPkl7M2RG3hx
SE39FJF5Np1ztQ+qkk/ETtU70s7IIGmNz0YLBhvqvaeQTy1T/AdVMTR/Hxq4hEB5
SHQkcviltacPNaXwPS+OSoOtxrXYM1PHCnEamcigPbGQwpo7h5PNj4tEOP3elzya
xwzRCxdq4A4F+bd+i2ZMhvriANIVcVxXk6Sxc0vLEAexG/aWIltXgFNGrBwXro0o
1Ol0jp1FNcaWM9kOhs0sv8PTKZY1vd+ktHH2mUCGkT6tTCyHmXZSixFDDIjQ4d2H
y1MPP2RUkjTpfSHXv9v+r76M3o5XdNjpZctvgnqGR9J8DIdW3D76YfjPNN/ML6/P
BeX8BBLD1H1dLMeI9DjnVmidzESvm2xzhf6ftCJEfQTBlDNW9om8UvDTsR2rEQC6
yyjvbZMPnOUi24N5qXxVRc14QUitSJ5nMT/JrgaoqU8ICEZzLhQgSs53HLVFjjY5
V9Xvt2AMo19+f2No0MiU9oSzELCYC3VbOzTRQ/X/MoaPOBy2WMQPCLWvJ4c3Xku9
CeWL5b9x2rSL6KvZLufp6PTnb7cnOGLJKo50vlGrcvPCg4fSUyk=
=gn6K
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--


--===============3272895282413292679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3272895282413292679==--

