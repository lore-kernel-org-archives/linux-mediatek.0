Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131A1C74A4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 13:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/Lfjdl8HRYwPSttCh9fkPu62f5gNPMty1H4AujF9lg=; b=NAhXfte3EO7cyZHOPUaDH8ZK1f
	M2g0u+GBBY7Qj/VZHMVZxGS5lBsYXSXbW48cVRZ4qd2jFG3BkQsm2WYN6EUhW6SneK4rPirm7fbm4
	58hZkbYcy1qHRuAr8b7P7YhOzcKy+HxPZJVk3sGyAHg9UffRYqVrM90pE9EmE+czi+Cf4IWDMRD5B
	vGH6DIHZNCx6BYJiqDetPUfOfSUUbBMg+CQtXEn02SA4UFUVpZqLgaq6QC4waFcUAKgDJDgx+TyDx
	O9DweUIXdGFh24cC9lWVKPZmS66s0mzWjImbwd1HI7cBWAWwg7KSBnK/+JBmv0eH2EQ0VGOKd8St8
	xRhB16fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbihm-0061YD-AR; Mon, 13 Mar 2023 13:59:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbihZ-0061PM-Bh; Mon, 13 Mar 2023 13:59:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AC83DB8111D;
	Mon, 13 Mar 2023 13:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A34BC4339B;
	Mon, 13 Mar 2023 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678715938;
	bh=zEcQUdMeBfoETlPddkKFkjIDDgvirbomXMlkHaajWe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEu82KsPAFa2JlJsPns2YbDSdht0+ESoS/nkVvjQMhJ1+EuOY4YHHM8jWXmlw6Lue
	 0ItydL57xtY29cHzYD2+xqk/RhZeL5oSCE9u/1egMtP9XV6c8vVFiFEqIUGV8CYwwK
	 Koj58JUag+J1f3sa/euBpe6mLKnlzUFG2Mvmj9b1UsFZGX2Sc5coWWsMu7SEB3LdOg
	 O8k/H5TIKsy5cE5yTptmqNF5/QR0lunWpjQe03UOiFJDofqUsgNbULnvlCc9q80x6d
	 4ou8QmxC4uyk59dTfcR6SgleKnp3ByCSCI7/xRYh0qpy8GOSRIRsnTxOBzKiE2f9AU
	 xtmfugXQY012g==
Date: Mon, 13 Mar 2023 13:58:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/9] regulator: lp872x: Mark OF related data as maybe
 unused
Message-ID: <a3c886f2-571e-4b66-827a-2b0fade61c61@sirena.org.uk>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5sz95mK51+KCvPTd"
Content-Disposition: inline
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Type louder, please.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_065901_646047_64DA4F16 
X-CRM114-Status: GOOD (  11.59  )
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


--5sz95mK51+KCvPTd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 10:45:45PM +0100, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>=20
>   drivers/regulator/lp872x.c:931:34: error: =E2=80=98lp872x_dt_ids=E2=80=
=99 defined but not used [-Werror=3Dunused-const-variable=3D]

Here you're using maybe unused instead of removing the of_match_ptr()
(which does seem like a better approach).  This really feels very
random, there's obviously a usability problem here.

--5sz95mK51+KCvPTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQPLBsACgkQJNaLcl1U
h9CyJwf/WqKJPKC6kh2mubKAh8kZ595kuWjjTRVC3nIoN7SeXxKElHC+EAekIWW2
N2CKvSu+0/rnDO1xXVlzwlxocljHthQoB3llq8k8ffUdsKdk5a56cG+31hklnuPs
CydA9CgZmqBiLG5nj5h7FteJjO39HdZa5iwWO2AHodjF7RECQCfsiBcjjz9vyiZg
ckx9xRTNsQSKzG0GPMSwugJd8zRvv2nbbTTdIZkd45K3E1FqNL4LhRC73QJByH9E
vTxR1ustr/UVD3gR1P22DKLOJH2egLgVZfdInAbbL5fmtrCXWfPYefZCMJ1puXwJ
DYamtgQhghBCKuguwjidqjAVkjwMxw==
=GokI
-----END PGP SIGNATURE-----

--5sz95mK51+KCvPTd--

