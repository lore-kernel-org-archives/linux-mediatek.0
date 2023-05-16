Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7526C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHLX1usvTE25d32xOJZghsRQHJSP49ohNFiseF41+Mc=; b=T3qz+cuujy0Mzj0eVqLWqQnGia
	F0h4Ft8FzulnHSyLardcYzA8lQq7ImGIoNZL8Z0gmQxqDFn5S5fdS686eG4cLJpFgVUU1QX3kiBMS
	XArglA5SsN2T3W8onDJuTFV5HPvXUF75Vjmq8TZmjBY13CDhVyd7T9jRtabaV7VOnLJJDbKFQWqkj
	fQSs2/uM1m4DoV7IgyejtvfpbpqI5Y7+2TPRKa9xUAIIx/0yKRL7WPE0Du21C7qnEOizh+LtZJdDs
	UDl8kWJ3ty286yQU9HZWoy6Yh4apnTwC78gZZCwATTkP8CrRzeoBT3ncV0y3BmydvmDdXxRQi8p4Q
	bX9Rt3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoVu-004ZAn-1E;
	Tue, 16 May 2023 06:50:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoVq-004Z9C-2p
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 06:50:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pyoVl-0000di-HX; Tue, 16 May 2023 08:50:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pyoVi-000XiK-M0; Tue, 16 May 2023 08:50:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pyoVi-004v4C-3L; Tue, 16 May 2023 08:50:14 +0200
Date: Tue, 16 May 2023 08:50:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH v3 0/2] Support PWM on MediaTek MT7981
Message-ID: <20230516065013.u2oqdonovdckuvop@pengutronix.de>
References: <cover.1682007088.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="so7atcmfgma6sw4o"
Content-Disposition: inline
In-Reply-To: <cover.1682007088.git.daniel@makrotopia.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_235022_909301_773825EA 
X-CRM114-Status: GOOD (  17.21  )
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


--so7atcmfgma6sw4o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Apr 21, 2023 at 12:22:20AM +0100, Daniel Golle wrote:
> Add support for PWM on the MediaTek MT7981 to pwm-mediatek.c as well
> as new mediatek,mt7981-pwm compatible string to the existing bindings.
>=20
> Changes since v2:
>  * improve commit message, adding that alphabetic order is restored
>=20
> Changes since v1:
>  * use pointer to reg_offset instead of u8 reg_ver and if-else
>=20
> Daniel Golle (2):
>   dt-bindings: pwm: mediatek: Add mediatek,mt7981 compatible
>   pwm: mediatek: Add support for MT7981
>=20
>  .../bindings/pwm/mediatek,mt2712-pwm.yaml     |  1 +
>  drivers/pwm/pwm-mediatek.c                    | 39 +++++++++++++++----
>  2 files changed, 32 insertions(+), 8 deletions(-)

whole series looks good to me,

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--so7atcmfgma6sw4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRjJ6UACgkQj4D7WH0S
/k6yuwf/ZduV3pWBQmvuxxeH3faEOg2E0ttlDDUG/4fkQeBgASYpDAQvapTJqj/o
ZIOoIjdBS5X5WbYjl0wshrWc79B6bA/5TUrQxLjc8HRFfN4Q8+Ia+LQH10w/mBND
ShHmmb5CrVwVUa2t6/zrkUoXRUAM1pU+UM0XDvGHBFxRruPcUb8yuU0oEmgFU0ZQ
sJz9teGh1jhvxClHVso2erPoz+l64KNc7XSSyR6lwfMm9sMYnKQFvOyrW/LUOHeu
lkacUxGWTphramLuhvcjatEHqpUrWrvhahwx2k4C0f3aOLZtRTROsZ58xtFtK4Pt
i725zuKbzW6luWcTX+Ac3O8HlFME6Q==
=o+7Q
-----END PGP SIGNATURE-----

--so7atcmfgma6sw4o--

