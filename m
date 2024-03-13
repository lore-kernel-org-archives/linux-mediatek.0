Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FE0C54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G6tQ6qb1wy4fRsOONK7qWXg2LzQwXihYTJ0PSj1DRM=; b=u5amJbT9YgQ+nQ39XXl8KZficX
	z5TvHUSVk8GKzX2Rda0p8cocN3ZAs8iSrKdRrslSzRTK05Eu0YRwg/dPwCT9X6/iV5RuwIm5q+K0C
	gqOu3DdG6oMSulaoJteLehAH4cAtGbpW9ZcNiRE6HBecdOowRx8Rc5P5yyHDgrYY9NOjLRWRHD2xJ
	wXSSFl/OEr7N6IdRjnWwzlVwi7A2qf8xdz2Xvo8HcrDS7mBIs18KskCshP48F19P70zyZXpVQzn5r
	zPdUjWlhT8Q3i5xjpdCzVlXrdvcEsdi9Yso/9/XwaUiszeplSfJ+fo5pIGMIjkmATDx4L8WdZ6ZIy
	EBn96C3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSLD-0000000B15a-0oKC;
	Wed, 13 Mar 2024 17:24:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSL9-0000000B12X-2F3o;
	Wed, 13 Mar 2024 17:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B98A361477;
	Wed, 13 Mar 2024 17:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68B9C433C7;
	Wed, 13 Mar 2024 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710350670;
	bh=0G6tQ6qb1wy4fRsOONK7qWXg2LzQwXihYTJ0PSj1DRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4QWTDLStOQw4Goek0IKIpEdeUGflrD6+Ri9QAQ2sG2QdJWl50JmaF48yg2y4GUU8
	 a5hlJmNEKLjSQ8eISp9Pt7Qe71uB/WBHh/mz8rlP8NbTdA0BExiLykWkzPriuBuHC5
	 N6welpQ79LSTFw+yy/99QS8iG2tIfT5FVkkfVEYSaAH9rw16kknZeW3PXfdvMcCXY3
	 WcLxnJaleA2GDiUycERB+HA/spu9dw3DryEPtizlnV+GqhxGET6yz7r/EFUmTrYRV+
	 yzfJLVs1jAornCo+Rn9Bf4BfgUuvCtqArlWCgADoAPQCIruW8/8XwuYZUOmKb+nJAH
	 qW9NuL0kb39eQ==
Date: Wed, 13 Mar 2024 17:24:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Message-ID: <594cff80-9cd8-45cc-939b-532f9402940c@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
 <ef4da1f6-d3c5-4484-8df5-1a04df4453a0@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n0CJkGczErMrH2GD"
Content-Disposition: inline
In-Reply-To: <ef4da1f6-d3c5-4484-8df5-1a04df4453a0@baylibre.com>
X-Cookie: It's later than you think.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_102431_646988_82D79A3E 
X-CRM114-Status: GOOD (  15.83  )
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


--n0CJkGczErMrH2GD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 13, 2024 at 06:11:50PM +0100, Alexandre Mergnat wrote:
> On 26/02/2024 17:09, Mark Brown wrote:
> > > index 000000000000..13e95c227114
> > > --- /dev/null
> > > +++ b/sound/soc/codecs/mt6357.c
> > > @@ -0,0 +1,1805 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * MT6357 ALSA SoC audio codec driver

> > Please use a C++ comment for the whole comment to make it clearer that
> > this is intentional.

> If I do that, the checkpatch raise a warning:

> WARNING: Improper SPDX comment style for
> 'sound/soc/mediatek/mt8365/mt8365-afe-clk.c', please use '//' instead
> #22: FILE: sound/soc/mediatek/mt8365/mt8365-afe-clk.c:1:
> +/* SPDX-License-Identifier: GPL-2.0

That's not a C++ comment so checkpatch is correctly warning?

--n0CJkGczErMrH2GD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXx4UYACgkQJNaLcl1U
h9CP8Af+KlLX2plI/F5rZJ9p1uJukH33qkBAEGAHtzF9F3uGHLiua+/rxebEzeC1
ZzIbUyRn+EDtKLerG/GM9tMrlGZgdnENt4T7jnE3Hw0hU+aQJ0IUtB6WnRpyjsON
MFroY93dAi8Yyn1mt0uFzgYEIbBje/+TBiUxqyVzrzIWq1OH/OBN4NmNqPVv3H2p
QttacOYxX77On2LGDbnqRcfv30n8mvJgrYBwy9OsvutAJ8nllaYgzQDrME0N9JpY
0lWOXhg99Mcmx0/SGmfuaNISBhwlwWvcKQ0Iq20Q+AiguyJmPt+kpNTm4Eh7kh+7
9KdkRUEMFfJezI6fB13+outzifLipg==
=yFuP
-----END PGP SIGNATURE-----

--n0CJkGczErMrH2GD--

