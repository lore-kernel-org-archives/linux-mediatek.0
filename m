Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85998ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAMC1YBlvX0pShtCvbF6kwhdmpJj/sMAIAv4jEjIW6A=; b=Gk6vdXKpD0X3xim8J4acBlmOgO
	V3pExo4UHbSP/lXNfsWLBxu2ICHQtboYvSVOpGKxosNfaWoE1doHOwOtpWI2jCDXlMQUyGCRf9VZu
	d3xCCmU+EZSHGW/UP2COuoEo1LwrmKY9nDLLLZvyAnSdNbuF3X161dgmIPjKFwfsemInmMRU4vJc5
	VmTxyxRNLqD79ZwUyD9IZ0NCL8j+hFjqLxfmMuRE21gt1W2UZhdF/Jq/FyiFEBtOAQPqZ6e1DNwTD
	UbhZ8W5DGNn8OBQXTZdgsu4YeOYf3bRDiUXwDFLSRzH7k7VLR8VQjThcgJ1Qhmzfn8MaNpJ/w2q94
	hTBECGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBpt-009nVu-0q; Mon, 19 Sep 2022 08:09:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBpe-009n8Z-SZ
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 08:08:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaBpR-00024Z-23; Mon, 19 Sep 2022 10:08:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaBpQ-001cYn-Um; Mon, 19 Sep 2022 10:08:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oaBpO-001tgj-NS; Mon, 19 Sep 2022 10:08:30 +0200
Date: Mon, 19 Sep 2022 10:08:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] dt-bindings: pwm: Add compatible for Mediatek MT8188
Message-ID: <20220919080830.cmuzuuk5h564ouz6@pengutronix.de>
References: <1661744916-15441-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axihye5zdoc3qesl"
Content-Disposition: inline
In-Reply-To: <1661744916-15441-1-git-send-email-xinlei.lee@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_010847_006746_68404003 
X-CRM114-Status: GOOD (  13.20  )
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


--axihye5zdoc3qesl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2022 at 11:48:36AM +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
>=20
> Base on the branch of Linux-next/master.
> Split from series [1].
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/1661239875-=
19841-1-git-send-email-xinlei.lee@mediatek.com/
>=20
> Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
>=20
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The change looks fine, the commit log isn't that informative. I'd just
write:

	Subject: dt-bindings: pwm/mediatek: Add compatible for Mediatek MT8188

	Add dt-binding documentation for PWM found on MediaTek MT8188 SoC.

	Signed-off-by: ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--axihye5zdoc3qesl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMoI3sACgkQwfwUeK3K
7AmQLggAn7bjuR94Q+/jw6sBzjXrsF/ycisR1aBRBuWDMeG7mNOXhsX/VkNdcxg/
7dO9DsVR1a+3uYfvmaJuRYfygimAizemmBw2xeWohdl6lUXykVU9kkp55iIJEEaQ
wRIjD1xH2tpTLODGTRWM7LCVRsDO/DHOgs2MY2axGybI4X+DR6ya9ss5neU4V3WF
QCqOU/9vy74I0FzsxRF+pRNqFxDh/2ZLFN/2Jmp6If3NGi3rRtH1EfVL/pm1t+kj
d+XvXny1oDY5cJa4rcAX5oSHUAcOeoVqXUkfCOmGEe8FNxBWi1UJIELu+c8/DQhF
G3DEwhZAfgzPsxAaiCW4NOuRNhqazQ==
=I8Y5
-----END PGP SIGNATURE-----

--axihye5zdoc3qesl--

