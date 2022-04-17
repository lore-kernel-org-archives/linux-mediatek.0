Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C65C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Apr 2022 02:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk5Jyp5QRZBgZpYctaaZm82dRvV8OGKPbc38g/+hNCc=; b=gw0DG6u8mFWQMl8HV4vT8TJ34P
	wH+vmMVztkyf3hpyzrZysZRWMw2XElhOnAMALOLZ/t1AjkZYWjjvwn2CEr7vi75awTn67TT1kY6t/
	LDac6EWJnSutZOIntSA7sk3XnPMIJTEOE45+CjGhWJmkjEI17+nevDZv2h8YWkfTcsrD9TAnc7fE3
	Tt/qOOqL1FopaL/Tm+5veOf45GnWD2xmdyA4jZZ9xv0cNPtGzmNn0uqkWX16U4DTNikI8nXA1efdm
	A491IF7IbsWpbs+UnzFjz0tQzKjw7kxGM5NIGpSM20m69oc33EtCnSBWpUhg+NL1cmRVsic7vFGHZ
	wFAW/0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfuXF-00DnZF-9z; Sun, 17 Apr 2022 02:21:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfuX3-00DnXX-KM; Sun, 17 Apr 2022 02:20:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D563761053;
 Sun, 17 Apr 2022 02:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B468AC385A3;
 Sun, 17 Apr 2022 02:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650162055;
 bh=fgvai5CvpzVMO7BVUu2fC8BWY+ejHgQ/sklYiOA2FtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rnzQ2UIe97xqOGl+Qy4+R5YzMv+AKdA+qrr7TVDjWiv4uKoDoHy6vyw7hALBoCxB4
 E+5JdGZYnwD+okqNvXZ+0hXDusI6zHXzQNQFN8Hu9xj72oF91ptsG4ziqL22Zx/eA1
 xsKaJmSlFofippzdap3UXVEfQVLwBGGBR0gndBV0/Khb6uvY0P8BQo1MBW4ix1btmu
 HBQ2v1IJzPEY5R3DkbpaOlCJUgue9kYR+07UpH43g0RcdWd5xQTehaeEnzFjsKigv5
 5gFP1/tySZ31Bobuq14VC6D90Oe+hnRyu/+pKAG3JqC4XDy0L9RAQDZEoEMeLJhwbm
 AO5QE1q+PywmA==
Date: Sun, 17 Apr 2022 04:20:48 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Boris Lysov <arzamas-16@mail.ee>
Cc: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: remove mt6577 support
Message-ID: <Ylt5gOqaGaz7k1iY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
References: <20220120185853.24266-1-arzamas-16@mail.ee>
 <20220120185853.24266-2-arzamas-16@mail.ee>
MIME-Version: 1.0
In-Reply-To: <20220120185853.24266-2-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_192057_745210_91E300E3 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Type: multipart/mixed; boundary="===============4265350564529865434=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4265350564529865434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mTO0wy4BUSfB0BYW"
Content-Disposition: inline


--mTO0wy4BUSfB0BYW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 09:58:52PM +0300, Boris Lysov wrote:
> Remove mentions of mt6577 from the dt-binding doc because the existing dr=
iver
> doesn't support this SoC. mt6577 was used in this driver as some sort of a
> "generic" configuration and it is now replaced with mt2701.
>=20
> Update the dt-binding example to replace mt6577 with mt6589, as the examp=
le
> uses [1] register addresses of the latter SoC.
>=20
> [1] https://marc.info/?l=3Ddevicetree&m=3D159949247901831&w=3D2
>=20
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>

Applied to for-next, thanks!


--mTO0wy4BUSfB0BYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJbeXwACgkQFA3kzBSg
KbYp9w/9EJRkwejroj7l2qVIdQGdlyXoR4I8tC5K9v3y9+AlVxwBrP906u3DTQHF
WwFIvhNu4meKfaYOMQVAAD5IUZPBDJURHITZS/C3iCKheoLohVNRS7uCybCcqE9a
eQk7d3HhQPbQWR5nYpAQCvAM56p4849rzY/S4IpCKh+jXT2Ff8OvG/ymbKuD7H3I
BcHB7/u+B02thcWVD/9OEVWT29D+9sZvz2A8f9C/oLW0ZNdEnDGPj5VKdJERAz45
ETfz4bPiyW+KbmG4DZpEqLb4lyTJi1TBOO0E3/djfsDBMIB3xBkp1wIdL/LndJCe
JILE0ZndYBdg32N79lyX1W9SaaI8atXUYl02dGLHJ8WIdWa5JsmTCw/T4kW6cqdU
sLbzcImPVUSDGBdYJh7mHgDZk/XbHBfv5ZRDak7B01AoFzRsFAFilSYmQkyynZc1
/rZE7hE2nWk0mYAAOn8zDgPnHYTBXDVK+ekYv4UTR+5jb23StNtObFJCCiuEUA1D
xCDnnuc7e4dMr6CrLwQherqvoXObK2NLxrZYuUJ84UfzAsRSHQ17i8D1zSCheHBw
6ESbHDDURq+Otog03F0qDMV1yj+JnQdSHcE2TnPxB8eFdB/2VeOlot7qM8qfWa9p
6sam7KeSS98FYAtLU5ESOPaSL90X7vpvKj3TnL+zkZtf96yl9hM=
=CIJ3
-----END PGP SIGNATURE-----

--mTO0wy4BUSfB0BYW--


--===============4265350564529865434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4265350564529865434==--

