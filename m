Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B871AC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Aug 2024 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0K3dMHlaH6Glrz0OokQ0u2YuFhaqhGezqO5X9jzBXXc=; b=GqNvgoxkOjyn6nXA8jvSB4coLb
	SLEQB5Tw87fZdZS9E0ZU/5JDM2Ll7NN6Mhdqb1QxV3VfSzv8/+f0U52A0ZMt4Gy+kNT7+aabe/TB+
	AXLX3Bwywrn+rtgc0+xR3i1a0XnbuO9fkbIRe22xbsew2bRufqcQyEtPLYdZfkZnlhfx5+REKyckI
	B4gdK4XImelaCf1UaGrilW8rpImDhGS3hGXlXW+nQvcS7XHqg7GEv7N99OkzPxN1e6sSBy26b1yAK
	vdY0uSMXFdIksVMFXN62J3pxlWTQfSygJ4eU2/iZ09ZX7caTdN3jivvZi86chyYY8T0wZeI7VQKUv
	5Vb1cOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEeN-00000007D08-28iI;
	Wed, 14 Aug 2024 14:06:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEcl-00000007CXZ-3p5x;
	Wed, 14 Aug 2024 14:05:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0953561A56;
	Wed, 14 Aug 2024 14:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941C6C32786;
	Wed, 14 Aug 2024 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723644314;
	bh=rsrPj3HibZ4DCsL9Ic4OQt4Rsa7JTdGV+7CZoZd1B/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oixb9P7IKMS3/QO3M+v6BsLenBwFo04WV3M2FM4b+PnTBnM+H8LGThWzI2ZaiPrE7
	 KnT4LaSTN8Kbn7uJ49JPGpPqAKL0lh631pNmnutXfEGcuXmdOA4rpjWCkuWPEMokQi
	 RdVWgigeciXAaPBIGcO8bVETqszsvXDHmm8iXRlMMpdMixIuPRF2C9V/sIagWgkXJg
	 fXvbuxQwilJ+8zcimVOxsdl2OCfVzZGJqL0Op6IpfoN2iSy/Tn2aWkun7cfUo3g4bF
	 iLdGMW7At7uBIBcF1QgTtSnnoddaLSLLq40P7swf55ctf26w506ePlPRSDM1XCw9Wb
	 4isDAlOl8VI0w==
Date: Wed, 14 Aug 2024 15:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, khilman@baylibre.com,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>, linux-media@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v7 00/16] Add audio support for the MediaTek Genio
 350-evk board
Message-ID: <ae9a5147-95a9-4da3-a56a-ecc22f4e8f04@sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8B/Fc53TUe95dwQa"
Content-Disposition: inline
In-Reply-To: <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
X-Cookie: The second best policy is dishonesty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_070516_103234_8F45D8E0 
X-CRM114-Status: GOOD (  14.66  )
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


--8B/Fc53TUe95dwQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 10:23:12AM +0200, Alexandre Mergnat wrote:

> Simple gentle ping, the serie seems ready to be applied.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--8B/Fc53TUe95dwQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma8uZIACgkQJNaLcl1U
h9C15Qf/aWN3somXkLeCmkhFfrV7QHTBExyjsMeiPhzPWZtkgtCnWe3qurwNFxJW
hZepPzW5OTzlmzxUY13O4q1omXjfbfIM5wpYSui2CeaJo15WV+/BxfMEjLwhB942
fDai25vauENBytYGG0rmb5lW0+92gWHVXdFYjB/Zew6sMd3uNCQNZGsfEVXJD3pU
U9rb2939laF2Lqbjvr502BhhHEPgiBCx0vsPCVtasNrArpTFfinGw2wYA4ZNRGM3
IB78TudnvuQHQtt9ytOfos5mN+fv5LxoYO16MMmuhTP753QbXipEJ4wYBKWSSPs1
JLIAGwiAAXiCyPEMjizKQ3fph09SVg==
=LwLG
-----END PGP SIGNATURE-----

--8B/Fc53TUe95dwQa--

