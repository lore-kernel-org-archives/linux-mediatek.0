Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC8CC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 20:09:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF2F60F41
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 20:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFF2F60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttOgneseVBsCXdPXrpu9a3U5mMR+jXpQSuQi8D2XRFo=; b=fy+25q55DzKZ8mD/SBVUq5o7a1
	RasR7iDn/n1qj8dfTPHGwrmMy+GVpn2E+aUD+YOqI6AWl5p3mC1xg7XLX1Chmhz1nXxDRojFTV0mQ
	GDLCqNEDTzDyZnE2N++08zcfooj9/Fkph2qnljICsE+DeZwg7O5bRtr9gNTparjAXbfvNnJYSXlfB
	gtSQSmH8aRbazQiHjKjnlgv5E4I1Cxn5xpv9CAas9YU1UF7e+9FhwpY/Yy8KChvfPjZXmJNjEz6/K
	XszdhFEldXdDq34pq/VoU/BkWEauUeNfjrAAsGvNLFAe+ElnkpC5Kh4kLKz9HlY6bNgdwcXL+iBJO
	PNn7c4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG5On-003M1l-RN; Tue, 17 Aug 2021 20:09:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG5Oa-003Lzu-HX; Tue, 17 Aug 2021 20:09:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FF0E60F35;
 Tue, 17 Aug 2021 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629230952;
 bh=1mBxSLmpdpOV1fOv7ziL7hOsqQXQWzH33HEO1fBbdl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pLurhdNOPcrzDsVFf2CMqdwYDpN9yrVjzKPfXz8V9M/vvmSKzdSgihEJ9X3UHbTMg
 UARWrAjfbbMzcCFGcrJeQ3wbjMjI08yyGkzgF9c1j8vC2imDY2RRcLTiA/AWMHX0wn
 uC9acoQkBizmGlKzwylbD0lSI65d0AngpqlREWKC4stbKt5Sq3v3BxWwvSENF1zT74
 eiwWstcFOQbaabOHsE4i1p2CMQh1gdimAGHkF/FCXigE95cIYln+F8Oi7yBHRJaT+E
 5w5AFrarc8i6Cz6q6G7OqFUcHToc9Ebz+ORlR0ZoUpyLx+SkOml/oGkGmX5sAmfCnK
 NzUr+K9yOhLFw==
Date: Tue, 17 Aug 2021 22:09:09 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/5] i2c: mt65xx: fix IRQ check
Message-ID: <YRwXZVxORTpddj2k@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
MIME-Version: 1.0
In-Reply-To: <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_130912_646040_5F900481 
X-CRM114-Status: GOOD (  15.71  )
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
Content-Type: multipart/mixed; boundary="===============8847142202553331884=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8847142202553331884==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0yY7MVuXzIX4oSrC"
Content-Disposition: inline


--0yY7MVuXzIX4oSrC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:38:45PM +0300, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0, the driver's probe() method will return=
 0
> early (as if the method's call was successful).  Let's consider IRQ0 valid
> for simplicity -- devm_request_irq() can always override that decision...
>=20
> Fixes: ce38815d39ea ("I2C: mediatek: Add driver for MediaTek I2C controll=
er")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

Qii Wang, do you like this patch?

>=20
> ---
>  drivers/i2c/busses/i2c-mt65xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Index: linux/drivers/i2c/busses/i2c-mt65xx.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/drivers/i2c/busses/i2c-mt65xx.c
> +++ linux/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1211,7 +1211,7 @@ static int mtk_i2c_probe(struct platform
>  		return PTR_ERR(i2c->pdmabase);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (irq <=3D 0)
> +	if (irq < 0)
>  		return irq;
> =20
>  	init_completion(&i2c->msg_complete);

--0yY7MVuXzIX4oSrC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcF2UACgkQFA3kzBSg
KbaS4BAAkuQqKBfaT+tbSEvRQ0R7x/ilbpIC+nlWrCwPD18yUSWkgzIJPL08yqZR
dMLEkeLFQjNTgkk3M6YvD3soi50s0EohVG97o7YFXMV9QI1di3+RpTw73nuKDEl7
e5CYpNCnGST3/iElUj5aJZweQnrZ4DYw6XDOK7qhS+hhNZQiOIR6J5Z8mFBmKfwx
oXMtyUQnyhyqGzSTA2yM0+Q/u7KIS21bMwePSwpjyqS2/eS3YkqjvnmhiCKnPwR0
AQfX7m2Cg1qbgOqu1oEOfp+oCh4BDVZpPIY31NhodoUFb2/JMelIDc7FDlEs4Nrs
pyuW/9tRr6JGiRTzTQ/b11xuNQYW5PTD5krQas19SpsMOXOeOfUkg9Ewx6yaPJRN
z+h/48Xw7zAi1YGEx8k5RtGZ/2cVPL7CMcSjtyIkqzuP+//62UmsJJFWsqVgQpt1
1LpTqiYYF03hggNbWv8ql1F1uR78kDIXE6tOnoQn/YgvshjEm5owM3jXwniODI1N
G/XtmPrQpdE6YkJrKl2SfNkTqacf8Nou2qwGdzGK2b/ghfduV62TZHbHqLsvSsK5
1cwZBw8zxmQYamzC3loUT8vqnXRBXfJDi8d1GLuLJB636viHtFBn+bRmK/CncTl2
0JjO1knFr4E+rxSqdHmQYNiKKLzvDqO5i6OxiFLpWKXentDqDDQ=
=+38Z
-----END PGP SIGNATURE-----

--0yY7MVuXzIX4oSrC--


--===============8847142202553331884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8847142202553331884==--

