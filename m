Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F7CC6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zg30mVd0K4jynuTHfXNyGn5g3EK3nP9W12VgDvTnH2Y=; b=LO5Yqd4AT6BgWhHvtoiCXEgHvv
	L9WuUW5YMk7WcbIimmQ5OHUUSxfbQWccbiGCMomwNv+mjIoNY4DHfrYFRLzg5zwOnlNwvBXnpjzms
	f8m5v/lvICjaqqcEB+P00k26uBD+J7scVnb7d7jRJ30PazQOIFM7SUiOeqTFm5z+aG9p3kRcALdAx
	BTunFYM6vpMY1mDmBmSnT33B2o03MoJB0m2rselFh19wzudHv8w3PE1hkVvKEj42UkHz/1q/GEwJ+
	VjM1Cys3se7huaykg8f8A9KuhpO4uORnrHfM1DKAxSyTV8tptkMO92urlCMOguiQJ2M2KsDBi+yQl
	51lu2ZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obd78-002i7y-Ls; Fri, 23 Sep 2022 07:28:46 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obd74-002i5z-Da
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 07:28:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1obd6m-0001Cg-UD; Fri, 23 Sep 2022 09:28:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1obd6l-002PwT-Ts; Fri, 23 Sep 2022 09:28:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1obd6j-002x7p-Iu; Fri, 23 Sep 2022 09:28:21 +0200
Date: Fri, 23 Sep 2022 09:28:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@list.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH,v2] dt-bindings: pwm: Add compatible for Mediatek MT8188
Message-ID: <20220923072821.fy732jaayqdyfeht@pengutronix.de>
References: <1663915394-30091-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7db7yim5if2sboqg"
Content-Disposition: inline
In-Reply-To: <1663915394-30091-1-git-send-email-xinlei.lee@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_002842_475260_DCB25FAD 
X-CRM114-Status: GOOD (  11.78  )
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


--7db7yim5if2sboqg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

hint: You don't seem to know about git send-email -v2. (Or git
format-patch -v2)

On Fri, Sep 23, 2022 at 02:43:14PM +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
>=20
> Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
>=20
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---

It is usually helpful to note what changed since v1 here. I looked it up
myself now: Only the commit log changed, it was shortend not to mention
development details about how this patch was created.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7db7yim5if2sboqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMtYBIACgkQwfwUeK3K
7AkYGgf/U4i3QfL+sMDHS1hzBnjl2JNNEFmxOmB6Llcg+aW+9/nfQrKvTv+s9qOD
iIppkKLXrPDwN2P7wprRzLOXTPLooQkXV6N0yIIefGbVu6fX8s8mYBeUW58vBVSE
lEfuiKF8kNqCSesxSYohnRbh+A1J3eokuDp7W/2hFuzn0nFEEt0Ec2UDjtf7fmhD
+Cqq/ivOFiD9oiUQxMiarcfqy7PEahD/yRlElg8jHT5ZO9deo+NnLqSead/OqogI
Xlz7YShR2VPQpLdnRLg6tochWd+N9HGIp7QL6BD4n459dxCmJoJQzuUD1Lw1Ft2m
K6vpS1bvwC0CkLKGbTGQY59MLZ79BA==
=wTGz
-----END PGP SIGNATURE-----

--7db7yim5if2sboqg--

