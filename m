Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3DEC2B9F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 19:07:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02B9C613E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 19:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02B9C613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iXHa8XjPsuzO5Qy2nJwYL56IuVmc8kskUjWoO43Seo=; b=chPcfari0fHr1mux28Mk2LWt83
	GgHW4LMMmYNe+4tK7h+l2ISeWy8kqHaALUye6Q+1voLR5A05XwX9kGpHBqQfiCer/6Bauh0LahN11
	+Ry6rkj5qhRsDCMXmwvzvz4xjKLdyRkxxwKCo37euNXGb0Zk13IFkgOlQJx3MwaTHK3plLhITUF7h
	DrPZV+WzBanpQQkpfJD8QutMpq8QiijvuIJCfAoP9TL6Pg6zR62ejOUVtwe+hX9uFx1EiFFGYgCQg
	eFm+f1wVGcmlY6NBytvVMk9MXjZEBCeMEBpuoAdJq0iem6CYjtAt99OXmUOM0u4Q5lhnR1LhZ7GEq
	dhwakRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhpZ-000XGk-3u; Fri, 28 May 2021 19:07:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhpK-000XB8-7G; Fri, 28 May 2021 19:07:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 144E8613E3;
 Fri, 28 May 2021 19:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622228841;
 bh=A8ZvWfbCTzIORXrbB5IHvBtsCyJ0YrEOLYb4qLBlngM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=brxuD+QNP1OKThSSy25F23fA5EQgJa71uob1bicHv0xk5GewGMHb/UtTYXFGnrGMX
 bwN1jd6pifowvR41JNBQcGhYt/ebJV5WGjcYuXjn/pRF5kjdu2gyQgZt+APHNHj4R2
 LzvzhV0PGSTEuZLQUUQEMB+8hYtFG86oLlAotcjRTbwH9uqlA8up7dYDn4wAj8/mpR
 IUvE1rT6V9vTeh/7k6fQ20QjNS7IQ4Fs0QXZzrULJSvBGDXRkePVLE01j54X48b7MK
 YBaCNEJFYvwEAVtSQGxca36apv9geY7vR5JpRR2ZG4g5rD7U58z4dOxNWr/PKBF8pj
 tUHJV+06nj+iQ==
Date: Fri, 28 May 2021 21:07:18 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v21 RESEND 2/4] dt-binding: i2c: mt65xx: add vbus-supply
 property
Message-ID: <YLE/Zs+354OXEbFY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-3-hsinyi@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210527075556.1709140-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_120722_307872_9C159642 
X-CRM114-Status: UNSURE (   9.81  )
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
Content-Type: multipart/mixed; boundary="===============8018548753057017768=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8018548753057017768==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ch9zul9aqPzgWby0"
Content-Disposition: inline


--Ch9zul9aqPzgWby0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:55:54PM +0800, Hsin-Yi Wang wrote:
> Add vbus-supply property for mt65xx. The regulator can be passed into
> core and turned off during suspend/sleep to reduce power consumption.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--Ch9zul9aqPzgWby0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxP2YACgkQFA3kzBSg
KbbPeQ/+MQBPF+RvaYWRFnX0MHmoLvK2hn8z1p7wc6lqdjQQOKSNdZDArysYbmK7
iiCg4ngf8oygzl9P47hWXxjkiKX7pcWborDcFMYdWfGN/V8w4XwW+1GIxYGcaOTE
l8cov0wPkHzSPdr31nqX6bBPr41dWuZWHmvLVsvX2R80UZlpgIfCG8Tx4q5ZVRQi
hc66BlNqFYkVxDjo4u37zF6+zrfFeYliBZln3bvjT7YQELXbGc9h7xVJDUUCdL2y
C7gC8cK7lqitkAzdwtO7OeesiOUTmoexd9WA1KDTMQuteoSg5x1mQlb1XfHpRblt
FN6DXXTFzieEy+7B2hKqUF7RBfOftbqeuE5VVPweD7k7bVK4Kx8cncucq1ksIyfu
Xi3inUN/AgD3ILXTZ2/S5/WuGydg1gKBbOhoAhPnLuuP9UnasLW26a07Z+12aZ3r
Uva0kOYIIvbn7R0xT9jr1CCwmBWToz5dA2B6rk8SEUj3zzgZzlze//pM6yE29pn8
0vn8q9QRkxRfj4raNetpB1/qSXVON7NvR3TLkQhDm6GNwLKv1yBOwSbbxYpaue0x
KKGrY32rFbyVzEeI4IxMF61pGGIqHf4dAWSNp8cbxYyFkEw2sYfYVxxiRuHI3Ako
m8dORn2gNOabqC1jXLt1RrVcLe/JAQzAWNemPA91jQj/Z5WgOMA=
=CLCP
-----END PGP SIGNATURE-----

--Ch9zul9aqPzgWby0--


--===============8018548753057017768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8018548753057017768==--

