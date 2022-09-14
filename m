Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF393C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwyubeJPVUrd1h9FlW76eQo/N10BJF1zmVjG/8LIMQ0=; b=SuHXd5NfET2ZEHLDyz9+luyLVL
	fXHG6+JBeXr+Q4CLYTR2fd2grbQXYnHI20e4ohyw3N7fVkH+TcEfzEPV2q4SeUxDtG2xSmD7u/tya
	KYqzGewjyPHZZulMkb3/FvD+STmG0yusiZl7JMI0/+e0EKHrCmAx3UcraHfIo5IWXT/kEAT4vvKDY
	vpsI8j05EwcpqjiauWssnOr2MslQF8i8Nl3yghYb3hoPWn9/OAVJGqAOcjjT183ojzGQkQgs7LSSU
	rtK3GCaKkQrr/fACkGDUcb19a68EUOvU1iTa/vZsmBJZcR1Prs18Sx3otHT8EC6MWxsAscK8/x7at
	vgWdgIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYTG-008fxB-1C; Wed, 14 Sep 2022 19:54:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYT4-008ffe-KR
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 19:54:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYSu-0002uX-BS; Wed, 14 Sep 2022 21:54:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYSr-000krh-Ou; Wed, 14 Sep 2022 21:54:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYSp-000vzE-Kt; Wed, 14 Sep 2022 21:54:27 +0200
Date: Wed, 14 Sep 2022 21:54:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH,1/2] dt-bindings: pwm: Add compatible for Mediatek MT8188
Message-ID: <20220914195421.23z5r3notsmx4sdw@pengutronix.de>
References: <1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com>
 <1661239875-19841-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="23bdvmkeqotnlzsg"
Content-Disposition: inline
In-Reply-To: <1661239875-19841-2-git-send-email-xinlei.lee@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_125442_719152_E8772150 
X-CRM114-Status: GOOD (  10.14  )
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


--23bdvmkeqotnlzsg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Aug 23, 2022 at 03:31:14PM +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
>=20
> Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
>=20
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--23bdvmkeqotnlzsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMiMWsACgkQwfwUeK3K
7AkHuAf/YbpnjsXH7ZSoZyTgl2dDDyrYOAiNHDLVW+9H2izU/kcIloGBS5Cifd88
cf0jqYzIm6oF8Sfl6U8Bs6y38ug7Nb396Pg3RKTcDfkoTgo5fSvIBNcIEZhFWknB
jIMGHvo0sG584nxnPGtc4qWiczVJjb7ETSG9LQH5hAZYCEPbVTAFlAkzwTlOFAXg
JtViZbxO5bWiWoN4BZjMQW7DLIhP1S0rLBzLuIBjth6N8Z/jV0ySgrK/jJCbQ/fm
J20NpniXnGVPIo7UFtI8YaCCw/deVgd7LlD2IVRU+DiXN/mrDhM710INLFkLNBG6
+qnJwyVQncs6gTiC5UZXdaNtfWxhpA==
=RVce
-----END PGP SIGNATURE-----

--23bdvmkeqotnlzsg--

