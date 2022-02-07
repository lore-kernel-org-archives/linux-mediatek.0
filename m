Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40730C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdMSSFwxnA0cY40mww2C0cjTrqEVrMYp03eskFb8GyA=; b=FZFEktaGDG3OMj+vsrfLX/whkV
	EKIxm/T5/t2/jwOIdTihhuzzieKKcvHQVxpQ9XtAedQ1pXCrJxafzyQCv6H3JwPxQMIpUQHo9FOGq
	fuQS2uU70M+C44pTMAmx/ZEOVgFbc96jX8AK59ljigJkAlKaou0ObbQTr5Ies2wTro09EM1kvydT7
	H8wB+Vv0edrJDj5x+gV6WVU0T1sboCtEOrOsxJReJGkYjP8js1t+vj7tq8xT12xPkIhcbzymmAydG
	HpqVpO0fDRH35W0PR13DoiVL+NLlGEuOenrSv2KV+DOLSwqBHceCshTBqxPqLfbC9S6Ru70REDk05
	gY3W6/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH3VF-00AC2t-HQ; Mon, 07 Feb 2022 12:52:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH3V6-00AC1Q-B6
 for linux-mediatek@lists.infradead.org; Mon, 07 Feb 2022 12:52:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nH3V0-0001kT-Ap; Mon, 07 Feb 2022 13:52:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nH3Ux-00F6BR-1a; Mon, 07 Feb 2022 13:52:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nH3Uv-00Acnk-Fe; Mon, 07 Feb 2022 13:52:01 +0100
Date: Mon, 7 Feb 2022 13:51:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] dt-bindings: pwm: mtk-disp: add compatible string for
 MT8183 SoC
Message-ID: <20220207125158.t5362u2dddccdmsq@pengutronix.de>
References: <20220207112657.18246-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220207112657.18246-1-allen-kh.cheng@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_045212_390757_497C4747 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Type: multipart/mixed; boundary="===============1929267959184693165=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1929267959184693165==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d3yuhoeyfgyvlc6b"
Content-Disposition: inline


--d3yuhoeyfgyvlc6b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 07, 2022 at 07:26:57PM +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
>=20
> Add compatible string for MT8183 SoC in device tree binding.
>=20
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt b/Doc=
umentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> index 902b271891ae..691e58b6c223 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> @@ -6,6 +6,7 @@ Required properties:
>     - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
>     - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found on mt=
8167 SoC.
>     - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
> +   - "mediatek,mt8183-disp-pwm": found on mt8183 SoC.$

The patch looks good in principle. I'd like to see the .txt file
converted to .yaml though. Would you care for that please?

Also it would be good if you'd care that sender email address and author
address match.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--d3yuhoeyfgyvlc6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIBFesACgkQwfwUeK3K
7AkkAgf/fg+txDjzVkyHwJVZPCvspksFhmKCPBL43pn/2PuKFzuMBGET5zqIESSD
g/bRy5VJ3sPbOB2IiRqL8e+5uBRpyjErA9hDuBXAeE0j51fonbIeKx5tLMn0CmCm
QqngjwSvxBZin6oHjUsmeJ4DmTltc159yQlZJ4OA+0Ur5cSR2ygGBVf/PhNwD1sr
o6MlZ+PpgNZyD0emGImlgYyEzLlssbqHvcEexQ4Edy+Ia+x+WkKL2PijTSOsPpki
yh42NYdOPlPgvyLf5iAk2tyeb3b3+Z5z8olSGSLpnKmy/o6KFVLdPRmcF/GRvxKd
iGe2/E5kAx/Jh8ObG42MHTmx3NUprg==
=ZzWa
-----END PGP SIGNATURE-----

--d3yuhoeyfgyvlc6b--


--===============1929267959184693165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1929267959184693165==--

