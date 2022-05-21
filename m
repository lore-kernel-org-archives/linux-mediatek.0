Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8030AC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oG4n8BrAnqjcZZrxeEZ65Z+1Oa5QkAJfsgfDsPBZwc0=; b=EoJSOG6/x2dvw+evouIbCGGUI8
	SnP5opNvlPb7jgO/hwJdDubMsNeKwBpEGndFov+vvZW72lcOo4/uOY0vXF19vCra/RIrP+S9eLLxH
	LS7UNSUk4Umco8mKq5IuU3rQ+aM75abcdz5Kz48c6TjId9e5LQ6imX5+QDchlmwhwD/zNedoPDXxE
	JxODJ+RhJ34QvxQRCoyNWp/3EwkCvysurPYIpxJ7aevCe0U896nieDA7dx8Y5E1mEhhylK67LZQbO
	/iiuGDQsADnwWNMrlWh5Cqr4uhAgkrf4+HdPJld5+IdXreeKSBHCR8FqjsqBZPA0dAEp1zG7twk5B
	7SlGXYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsMCM-00G9pM-Ix; Sat, 21 May 2022 10:19:02 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsMC1-00G9m1-O6; Sat, 21 May 2022 10:18:44 +0000
Received: from localhost (p54ac0650.dip0.t-ipconnect.de [84.172.6.80])
 by pokefinder.org (Postfix) with ESMTPSA id 2E2A32C01B6;
 Sat, 21 May 2022 12:13:20 +0200 (CEST)
Date: Sat, 21 May 2022 12:13:19 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 matthias.bgg@gmail.com, sr@denx.de, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH -next v2 2/2] i2c: mt7621: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <Yoi7P//OBmZJ9fYS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 matthias.bgg@gmail.com, sr@denx.de, christophe.jaillet@wanadoo.fr
References: <20220514023148.305457-1-yangyingliang@huawei.com>
 <20220514023148.305457-2-yangyingliang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220514023148.305457-2-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_031841_979686_6B0A0CDF 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6665165569554661488=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6665165569554661488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/1HGW9nXdbcfngwT"
Content-Disposition: inline


--/1HGW9nXdbcfngwT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 10:31:48AM +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: Stefan Roese <sr@denx.de>

Applied to for-next, thanks!


--/1HGW9nXdbcfngwT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIuz8ACgkQFA3kzBSg
KbY5nA//YOH2uqeLuwIvPdKPHoj3FA7a5OdgJj6DrdP3HZ1ETBze7IT2YTWs2gHJ
1q4qfDUkgq1xcPfChXmVqpUPwk0ABAVntALdr0ZGxhXO/L419LrGEIeJ3d6hi+N2
Mt9a8Z7/zP/aU/wduNhi2hykfB62Am/vQ3JZ8ozhh1eAyTTmrUHGCTnSz3YWHaPD
jRQ9kOG6qqwAkSHe/MpvPgKzLQPXMitNRuk4+cSz4u6pUncaNeCqPErWicXXDRKz
sM0wuVS4oGVysClHtlZjFJzSeIp3g67oSVmWkOADplB1JoJWwhAdNHg5e2n4Ot9t
gWrST3ol4/AOrdh8uI4If0K7zKg/BkqMGF41uqO6kFvq5NEjzVizA7Dikl0giiEz
Hdgc6xtSJdjjgX7OMhSMy0nDUt17pPRBGWmvXZaz7cPtKCiVzmRAbg5UuAJMHmXw
J5dg8DH0oj5WfHlfF9DHaw25ENYHYuqjo4ZxH/Uxxtqvw4aTpum/UpZ7vmNAb5a3
mCHoLXRT/JRk72VEBrZJWgrVbOzhy+GjdqsERr7mPhd09oowP3lW4h6WmDy+gik3
xy3LZP+eo+RR6AiR04vGNwz7a1/+Em80gt8hISK+jBCfTl3qbPbXWLtM2u96Avgf
gad9uKzW85Ml0OXo7D8Q1qaqrQIhpLjHLJcmwIAkWJPQX9WdaDY=
=FwFo
-----END PGP SIGNATURE-----

--/1HGW9nXdbcfngwT--


--===============6665165569554661488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6665165569554661488==--

