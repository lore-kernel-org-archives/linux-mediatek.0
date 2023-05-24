Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAA4C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rm7aa8jCsnayHnH8S+h7edpVvvWiw8Tnd4kn30CW0rE=; b=NfBu353O9uiZcBdZQtB4/FYdqb
	EY+oY3/G0FvWl/tBU3nPPuUqI8qNWCxZDpdW6mfmr4b8DxtL3fDqO1V0mQ2+bu6RIhs/6k4VXGI6O
	DenpUA8EnDZUBT0Vfb8hLR32v6BZRUiigyGAL2wGunEz3AY8lXNQ3BJOPDTbcdg0vesu8qP2Jawkm
	L8w9dZfNbBagcv8kT1noMWQp3lgt41sWxh0gEvE4975bOKUprYYNmQTWTHoojWtNrFKfi3yuFkTyd
	W48YUlxNsTqHoyh2Ii3FHzYyoWeZmogEU/OBqV/yqEdsOeMdE2PiAKBsdAvlXd9QnTSD/wLCiIv56
	8vPLDk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1vkN-00Egeu-1Q;
	Wed, 24 May 2023 21:10:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1vkK-00Ege1-3A;
	Wed, 24 May 2023 21:10:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48E4863327;
	Wed, 24 May 2023 21:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19329C433D2;
	Wed, 24 May 2023 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684962611;
	bh=Rm7aa8jCsnayHnH8S+h7edpVvvWiw8Tnd4kn30CW0rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTrkFd4LgZgFeHiv/kwY9Irz5GLXBgKptccu0OWya7Ove0pCcBH8VBPNCbmafIAAe
	 DBZ/r/5ZFKwDDbe5PGAdj0fOtiRjdkQ2md7KJ2G/rPtHgO3VLOnU8hiMTsusBuUA5K
	 r+h5U4mMvFzWwqoTzb8nqIG3OWVpd0LHcgwwcmBRqzPUbAeDmT2R+dTSXoZ0cneLNd
	 bUGTYXakBvMxaT08uLDvV+a5bGrN+3Mn/ckp4TTZZGk+GjoBBinjEGARrNIZTANbMJ
	 F8TNnirGUyDFNqzItNASn92JR2Hlc4qVnLyBepZxJIxSL6RELiG4AnUWBHRUCSajk2
	 xf3h0PgZ+7yMg==
Date: Wed, 24 May 2023 22:10:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Runyang Chen <runyang.chen@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: reset: mt8188: add thermal reset
 control bit
Message-ID: <20230524-lividly-bodacious-5247a32ad1ab@spud>
References: <20230524133439.20659-1-runyang.chen@mediatek.com>
 <20230524133439.20659-2-runyang.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ooNPdgsX4foSndKs"
Content-Disposition: inline
In-Reply-To: <20230524133439.20659-2-runyang.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_141013_068674_06E7B26B 
X-CRM114-Status: GOOD (  11.83  )
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


--ooNPdgsX4foSndKs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 09:34:38PM +0800, Runyang Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of thermal
> for MT8188.
>=20
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ooNPdgsX4foSndKs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG59LgAKCRB4tDGHoIJi
0q8eAP92XtJeKUaN47himswTBp0HfGAhr8Hue4pXLR1m8cHM6wEA/JsiXDLCWwuW
wPc3e8ewZElnbmlA6QPKkjuWy4BJQAM=
=HPDT
-----END PGP SIGNATURE-----

--ooNPdgsX4foSndKs--

