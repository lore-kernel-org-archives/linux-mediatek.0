Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08752C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 09:41:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4530206C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 09:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q5/OKzsw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4530206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l0xjp0NgEU0B6CaGV4U9LsPVIsI0GJbPYx3p7O/N2/8=; b=Q5/OKzswZcjidniRJcSvUJA+Q
	OK9qrxE7tFEST6fs06CSBEyUM66T23KhMVhOBThAbEN4cHvAZ3WB6O4MwAlWoAzU4vBoEkPP0S5Ih
	KqijvFmbzZdMSgAxoA4SWTDfd4+EoBlRODliQXY9/d3D3cN/xLVpXbcYag2zLcATJZ9qH8Z3bptb7
	P6HhQpCCl6/mwanIxX8OxSKUGHfdX4amgZ9iBu1wAUcUKiynngJ+YeGNPWBheq30ZE+aySOOrO+Oe
	Y2KRnLWYscOB/qckZaLs2mqMGidj5WF+13UKiSwEJq11mzLIKx5/NLr1eKM5AFtjNAibFBDmmgVkF
	xMt3423ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k54Ie-0002O8-0q; Mon, 10 Aug 2020 09:41:00 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k54IY-0002MT-UV; Mon, 10 Aug 2020 09:40:56 +0000
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
 by pokefinder.org (Postfix) with ESMTPSA id 74B342C0505;
 Mon, 10 Aug 2020 11:40:51 +0200 (CEST)
Date: Mon, 10 Aug 2020 11:40:47 +0200
From: wsa@the-dreams.de
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] i2c: mediatek: Fix i2c_spec_values description
Message-ID: <20200810094047.GE1290@kunai>
Mail-Followup-To: wsa@the-dreams.de,
 Matthias Brugger <matthias.bgg@gmail.com>, qii.wang@mediatek.com,
 yingjoe.chen@mediatek.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>
References: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_054055_145840_F780CA9A 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, qii.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, yingjoe.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5696799761642624097=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5696799761642624097==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dFWYt1i2NyOo1oI9"
Content-Disposition: inline


--dFWYt1i2NyOo1oI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 11:48:37AM +0200, Matthias Brugger wrote:
> The struct i2c_spec_values have it's members documented but is missing the
> starting '@', which leads to warings like:
>=20
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member
> 'min_low_ns' not described in 'i2c_spec_values'
>=20
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Applied to for-next, thanks!


--dFWYt1i2NyOo1oI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xFh8ACgkQFA3kzBSg
KbYgHhAAq9H+auUH5FyFYrBR04XS/pPIsK7MAVECu+xkSqyKjOh9KUMWty4Olepo
2vkYDm24/Q9qGMshcaEnNKT67saeD/dprFWcz/pI1zlXXUHWT9s55UZFMFlJ73ui
By+eoOcqW/rVD/tO/aR0KRXevq4C9ddQXellwczhPpQCm/oZ8q+YoBhCgRPV6rn5
nZc8nfqyl+CCIpqpdBQD96kLokwILVElm0o2+oJB+9nohmH3BPPjh+TlDNV8HwpU
CIJmvUHy8rHBBvOhG7ETrFSopu56nNJQO9IiuFdVe9oWpCHhLhL9tMiMRbRiY1lI
q0ehOQL2JCGynZNFz0SrCg5lTEIFZTIZ4LcwBhKsbkut3Pqgab4ja/CUEJwjWeak
972aXFX+YpYpoKhcJ9YA3j0ClM2uiDZWnPqHC57PS37O1HV9ZEkyQITZXBzWSAvf
1oLUy0+jHD8OCFy+SnHVd0PSOEcSQS1UFRdbXEu/+VEnhfnB5axcDUMk3Q60/QXg
Tfz12jzXLpnYlQ8IPKXJki1nzKVkiCry7e9wcLZoJLZ81DZjndMi0LydYkZRcs6M
8NQjXuAzd/GaUj4CizQRGeTVKg36IPpWWQCu8oTSomzQv6VHXKxfLemz1FvAJiuI
pJLkFFyWKf6dY7dsqEyeEw0iVZn0vsyl8HCBJoavP8HkQnizwa0=
=eJXK
-----END PGP SIGNATURE-----

--dFWYt1i2NyOo1oI9--


--===============5696799761642624097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5696799761642624097==--

