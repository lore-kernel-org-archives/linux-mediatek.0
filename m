Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5335D1118E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwTEsjIi+Ya6TUFUmWf+6YC1A4d43LkRIrnQGOPpoGc=; b=HTZlZOTiALH6l+UzEKjmD42r9Q
	/Tm6K8//XdpPP/ZnTfgTM2vj5gunmxQEB8RFH3p5A3+BNQxqEqH4DxQ4v3Ij223UFV/ecd2hT81/5
	hEVEjdO5ETwqwkPRAiJC4H1ktXLVTVqb2du0NhQBuRKU6iCdiW8BQ+0Pyhgb5inmgMeztQrW8ImOf
	7TiMnLBB2n2mHDel0K7JRi7vop0rSvZf9dSLDYmob8wo92edoLUtvf3FqoqNVtJIIiE3CcC8pQ79U
	IT2z/ZLVZONL/Odu0w5VjMXPDuZneTL5en29CFdzMhkW7wx/0JEU040iIr9jYI8VfhTTuhyfiM1HV
	6X9SybHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKVr-0000000FVny-2I1a;
	Wed, 26 Nov 2025 18:45:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKVq-0000000FVnT-16jM;
	Wed, 26 Nov 2025 18:45:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DAC46020D;
	Wed, 26 Nov 2025 18:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6013C4CEF7;
	Wed, 26 Nov 2025 18:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764182709;
	bh=7WEZWZo65qTMkzmbLTM8AGcXWJudyd2lttyy7OqktQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTsx/adOwxo7RJaLk5rIJr1AMuA9Sf8IchqWZCqoUNDgaulraw1YiVO5rax9tlCEK
	 HuW1T8Iv6jkyteWNx4xm8NxHv2bhy3IAANhfeqURoCtyyLAjDLM0Y3KM3oJLKGHSmQ
	 f0ey1Vlu3RkkCpzgj8GPb/73Ss2QOcYICgi+dQMxnC4UvVOeIVoKXFYaWmNw7c5tt0
	 lQsw9IrJw4iNLJA+oIj9KpCzMaDU6qtI02s8uNaFvWK9proRhqRZEX368wfhCNM1Rx
	 UDDsyXlqHZzCKarIUssbYP6WNYaE0Q9Lfla05jJ2JYaVv/eGMsEO4F/XGp/ps5SR56
	 XAOlhREOaWNFg==
Date: Wed, 26 Nov 2025 18:45:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/8] regulator: Use container_of_const() when all types
 are const
Message-ID: <ba86ea0e-7c39-42a7-a203-89eeabd2c911@sirena.org.uk>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
 <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
 <d01a19d7-598b-492d-83d4-587a36087971@sirena.org.uk>
 <29ca0d4d-69b2-4b61-bf81-40ce87789428@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4YwFcyBe8r3semI5"
Content-Disposition: inline
In-Reply-To: <29ca0d4d-69b2-4b61-bf81-40ce87789428@oss.qualcomm.com>
X-Cookie: Murphy was an optimist.
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


--4YwFcyBe8r3semI5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2025 at 06:37:49PM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2025 18:33, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> Apologies, I will rebase and send v2 today.

> The files having trouble are I think in this pull:
> https://lore.kernel.org/all/20251021172543.GL475031@google.com/

Ah, no - that's it exactly.  I've grabbed that PR and thrown your v1
into CI, I usually hold off on PRs until they're needed but there's no
problem with using them.

--4YwFcyBe8r3semI5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmknSq8ACgkQJNaLcl1U
h9Chqgf/bo2C94GSgD5UWDq0zbNlouJSdCurjNKDobyJkGFwv0xgJgJ43szCp9fZ
YE2mVNZk62XZcr67x8VoB4khFBvz/TLMgQtThQ2L3fW878l0ivT/kFTMe0jketjz
bCtxUSTicnP+r7/EyLB0mlnj6t2MD1TCDtxXsUYtR1LN8ml7tHBq8Nqn2JcvVZvo
4zKNe2feP9bT/Suox/f07OSSWuQPhRFs5T9msFBMPxhIzyfM2wcjKPcwbemeo7yp
x/rOZ6G+61ecHHyebeTyw1P6ndOZDMYutTarWwWHs9/ss2fE2DdPssTDB8ISFE/L
CLsKbASuh/n4JMo96N1xlfe+Nmckzw==
=cjBv
-----END PGP SIGNATURE-----

--4YwFcyBe8r3semI5--

