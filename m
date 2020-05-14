Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BD6C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 06:30:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C945206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 06:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KK2uye7a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C945206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FTL4nr53IMGOuFiaJsmMmb8xu+IkkTx1BVYt0YKTVRY=; b=KK2uye7a6L/L0rwgpTMRcbNhM
	Y4otfqGT/8bvMLT0r9QDBjHG1XHlpjZWuZf56OddHdkiNbsWHQuCcsF5C5MSRvbpU3FTQexWUT27u
	EUjFbzvk41aUyQgbcBiEqW+MdI9rHiTyP4AlzOLLPRLFdso869FwFBQ3JozRHPd2yJmVXaPBmi+ts
	vt+/YSpVx7H6xYwjkcVI36KxoQ/8c4Tpcyr+bt1n1q6cTlugOqQNJ4i4muCS7WuJbJxPU+EiYF8jo
	8Bgjjm2w2NJ/kaQu2BYQyOLg1gXT45cibFuaJNQlswGz9PVlDXbfsq1J1u9JSU2nJnh/wliZOVWXH
	upGQVvOmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ7Nq-0005sW-Bd; Thu, 14 May 2020 06:30:18 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ7NT-0003Ap-Ea; Thu, 14 May 2020 06:29:57 +0000
Received: from localhost (p5486CC88.dip0.t-ipconnect.de [84.134.204.136])
 by pokefinder.org (Postfix) with ESMTPSA id EC9C92C01E6;
 Thu, 14 May 2020 08:29:51 +0200 (CEST)
Date: Thu, 14 May 2020 08:29:51 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH] i2c: mediatek: Add i2c ac-timing adjust support
Message-ID: <20200514062951.GA1145@kunai>
References: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
 <20200512133852.GE13516@ninjato>
 <1589418905.25512.10.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1589418905.25512.10.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_232955_634082_6ADB034D 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2455968678535030206=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2455968678535030206==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Last question: You seem to be the one doing major updates to this
> > driver. Thanks for that! Are you maybe interested in becoming the
> > maintainer for this driver? I think there won't be much patches to
> > review and reports to handle but it will speed up processing for me.
>=20
> Yes, It is my honor to be the maintainer for this driver.

Awesome! :) Can you prepare a patch for MAINTAINERS or shall I?


--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl685VsACgkQFA3kzBSg
KbbA8w/+Iih/AnYzyX4NP+kuKMiaDnC4Lof2gegnqKBPDlccUf5qMFAxlvdj5VLg
7fpHoLnxDUaE2VSLT94/l7djAnAiUrDK42F1rXHXfJKmfb4k9dMWI7n+yF29/95a
87gV3x2goe1XucCmobocv2RFwJw7b4rkDkvCb5mN6bvyDBUUS4Q3mW0MGxISVdTE
Z48dW7oyv54Y7kJoEVv3NRcrOfO/2zlrsi1zxamoU8+E5NidGwqySY21PZpq/FZm
4un1Dt98r7nrsm+l75SAahK5AJ/6qYakeJOtwD2NyzOF6dmwOgKLDpMI82Fl5e3p
vO37ZWYXoOeX9u7HFzEmz6CiLQ7Fomg5S6P7pWOV4JWNGbgMvkfnhzhyhZQN/y3z
+n6BX//CKk/Vo2DV7yHc/fO5ueXSP0FpAd4MErTgwUvkbeWj4kM09Q5rug3nwXcb
6+panhqePUGmOpqdT8JvqL+bFc3NpK7eDTmbAW3r6vp06/rttRBNnyKV5R4QMTfq
9qB1gtrcqHz1YJLI+UKW/QXIu04mGdW20TwlnQe06pV8l9/6JoPMMhgz5OnRAMd9
z/j+zHrrH2JMV/2gO+DW7T2Eweo2ZHEJjT1OfJT5pmxfrNVpFmkMsiwFbirC0mDH
l5EQ+idPkrsxFbHMsV/FRdladtoW5CHlB8ujb8StzFIkszZOKUI=
=ZyXd
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--


--===============2455968678535030206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2455968678535030206==--

