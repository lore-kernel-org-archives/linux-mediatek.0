Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FBCC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4+G1KQTU6U1MnbwdZYpD6TQRRzHivY16+X7bz0jyfI=; b=GW0HN0TRomI1Kebhynqg451EiN
	8utDRo76Ed2dq5UhBQuSyVsPSy8ziB7E+OITOtjuYUucM9N2cIowYadtv99XmMh0ua9r27CXcPiGe
	jcSf20jzKHgmVnkTvaOOUBrZcWDSVGbq/80COC5DLIPu9tXqzHejlUtRjVJ1hgmiGg5p/f67GSE3K
	hY2okkHoP2E6en7QwrGO4mZdP8xVQeWNTTlTy2jkvPmOkfN+g7zfsczWEK/cyO+Lceg3G/HT4sxCH
	5nynixtatRsm5YyNvophtuXeqdsvvL/chx75EixmZnrKalMPEP36ZPmE6yEIvKg9gq4ANN6NP0j/N
	kFe4Nzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XJ2-00C2Co-HY; Wed, 29 Jun 2022 13:00:32 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XI9-00C1hd-4v; Wed, 29 Jun 2022 12:59:38 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 6FCEF1C0B8F; Wed, 29 Jun 2022 14:59:29 +0200 (CEST)
Date: Wed, 29 Jun 2022 14:59:29 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	jejb@linux.ibm.com, matthias.bgg@gmail.com, beanhuo@micron.com,
	avri.altman@wdc.com, daejun7.park@samsung.com,
	linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 5.10 10/34] scsi: ufs: Support clearing multiple
 commands at once
Message-ID: <20220629125929.GA13395@duo.ucw.cz>
References: <20220628022241.595835-1-sashal@kernel.org>
 <20220628022241.595835-10-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <20220628022241.595835-10-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055937_373061_FB2F1749 
X-CRM114-Status: GOOD (  12.69  )
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


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit d1a7644648b7cdacaf8d1013a4285001911e9bc8 ]
>=20
> Modify ufshcd_clear_cmd() such that it supports clearing multiple commands
> at once instead of one command at a time. This change will be used in a
> later patch to reduce the time spent in the reset handler.

This and "scsi: ufs: Simplify ufshcd_clear_cmd()" are not really
bugfixes. Patch they are preparing for is not queued for 5.10-stable.

Please drop.

Best regards,
									Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYrxMsQAKCRAw5/Bqldv6
8spgAKCrEm3g+0xxO7RBnswwHkbwojFTAQCggJYrnNnnP5agGkiGWSzYQDwjG5M=
=jUUt
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

