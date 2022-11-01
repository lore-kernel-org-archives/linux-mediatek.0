Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7692C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jgiz81LfMDnh1i1jRq/N+QDaXUx5gxBcrHBgxl01Wg=; b=KYzCGOpW4cWXb612XWPAmlPCmJ
	Ae6o96ZNccQusflDcSDar6rYlPw5SrSFFi6+UtDmvfFfI7Rx9iY6PGlpqQysMcTwNUlCZsioFfnnS
	eZNSOJyKA7rebxj0w6Ce7pbpiIDurA7vorpIbXCep3IUE6eIsXSIFNpFd83eb9P3Ofh1rHF8DY3Ol
	Cx2qTzlGLH9kfoRPFgKw7BjlrBk33RjWA0fv4Os+xlaaZzpXOtnBexpiw34gnC5mbjKrY3SKWMD7g
	Htubv5W5S/l4oN/aKNaP9ws38tOefZZfwvmQi1C73MM0zOvCBYaKgHb/mPoDFbD30MBDpO3F0YHnT
	mCvrc04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqaf-0055HR-WA; Tue, 01 Nov 2022 12:42:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqaT-0055C1-0i; Tue, 01 Nov 2022 12:41:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34DC16114B;
	Tue,  1 Nov 2022 12:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C65C433D6;
	Tue,  1 Nov 2022 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667306506;
	bh=8jgiz81LfMDnh1i1jRq/N+QDaXUx5gxBcrHBgxl01Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3ZnawNuuV31Op9VrdDGcKViEbokbP1IioDKDywoeD7QTDDRGtpdY6a1CM4RHRi2G
	 uB9o8WAiiOPc07IpRO45jz4yOk0XsCCRGPC+ZvE7L3/DvAXK63WwMFHPoRGAGFGden
	 W454Jum43tzXvObveAGPk/++t1w64SIxEFuy0ijdvC2t+5DWbjNs8uOYKSqkI8VB34
	 w7UactYLewvyM290wdlq7/2btgYx9NpG5QWpQ1D6F0LpEsxF3wyyPRzFjuF6cld1xo
	 ARgN3baTfFYygyZn8H5gF2sEmavkh6Q2JGOnWqbqKBJVp8G/826w8+aovU7jsJTyT9
	 zhHiEXcVUnNOQ==
Date: Tue, 1 Nov 2022 13:41:43 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH 2/2] i2c: mediatek: add mt7986 support
Message-ID: <Y2EUB4fNykwas9/U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Frank Wunderlich <linux@fw-web.de>,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UtZpHD59sJ0nSnvF"
Content-Disposition: inline
In-Reply-To: <20221009101631.82380-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_054149_117525_523226E6 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--UtZpHD59sJ0nSnvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 12:16:31PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add i2c support for MT7986 SoC.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to for-next, thanks!


--UtZpHD59sJ0nSnvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhFAcACgkQFA3kzBSg
KbYgTQ//VQ2t9ksOXBL57DNCUocjol3yUOAxdKPK1xvXyUdHIVea/f77QHqQHhs9
QX4JoSozwlp4jVnxMLoq/I2xMN/nhKV9Xfq02gWDG1yl02/iCN+B/DbvtKDJzTWi
WvllbSYmcDSgFxWKb4LRwnC0V7bfqRdxW5CN6gulAYePfFRuUgSRG4Dc1pA3UVh2
5SvJeDJuF8jzjyw8MgehYcYKorFwErgRKHASkoDSBWYT71wvAA5+PIj8t6PJGM0/
rSiOoeIYzX7OFZIY17HqJ7095Uis/bpjwspfbf8ThszlGV7/+alrZLKM6JaJzIcu
ypRw7cXtW2zvtxs0/M93yfWtZIp71oLuEUZ+YOPnBg6Zj5z2fl8S0og29wsKLmO3
W8TCI/Fe5ijNDfPlpfvWb//P0VSTnyoHrgmpba50kJ4DGuHwqV/aJMNGCP+MRixo
xM0ls2iglbYaOFrYGM3T02uR3dKTW48FTWGeGx3BsMUJVoq/RdNBtGMliki70q4F
xiSAJ39i+9CN5E1SlqJ/85M0L4OOqLMrZaXSO0Tl0aC/Qivnd+h/MxD+n0PsaAK1
WtNu8+t8BTHhXVgNhlByfFMJbXodTyh8smsyfv16b/Epoj7h5F5N5b5wL/ImP9Rv
bGoIjk6dgNjVBO4MpzlkhgaiuGIccNEYZ4W736IDo8iUjQD85gs=
=6hmY
-----END PGP SIGNATURE-----

--UtZpHD59sJ0nSnvF--

