Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F1C98317
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpNzIOf6JBg8PY3kgkufSnFkA9KEdOeE2vPEyyc4THs=; b=olvVQFXQGM8za8aq/ornz27F5a
	jxdHrLzgv+r2yIyebDaaa0yLcOkc8A+FjKa/PDbCMqma6Eiiv70MklXuVqGrYqxGbdQWs+E9XXH9q
	/+jdQO72u2KFbnoAw4j3Jgl/cHPxsu/NX+MyoCsS0+wET9FbcpvbdnN6IOcfp5yWTcsM2TzCEbnsB
	qBMgHzdroVO/FkbO5wL+WNGjHdw59vqctAM6AIn2fkKa0I3eyHRJq3h/WU4VQlm6IMrubUpQUGDO4
	ra6VVCtEXqHJ+BF5MoIqX0wnUgPhjBhVjYVn+SlRcsx/pnwUIcRLyqPh0/b7q7+tleu2RiBuaTrdX
	1sYUTb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iBc-0000000AvTk-2Kdp;
	Thu, 24 Sep 2026 12:04:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iBb-0000000AvTV-08eL;
	Thu, 24 Sep 2026 12:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B1C1600AA;
	Thu, 24 Sep 2026 12:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC7B1F000FF;
	Thu, 24 Sep 2026 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251461;
	bh=cpNzIOf6JBg8PY3kgkufSnFkA9KEdOeE2vPEyyc4THs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8HApBs/bqL2niZIu5y5MMZcH1oSpsllMbogtMlXbpUmNUD0o42PjBA4tNMcegtnX
	 mluffjtBYXYmiH3t98uXwoDKdyYGwYdXKgYXzUtrkZH5kTKe/mValbQUjBz5DvMUc9
	 abu8To6eIbxLRsXAufxnN/BxK9NTVKQI4RE8d4+tOHfWWwZbX451ETXURIms/SUBCP
	 LHLwC/n16qQG/5rZJEB8H/nWkZn3+x7Gw3rfWItLU0yUvvzzROYzgCLxGaDTJuTHy8
	 bVKYdoAvx2uRIk3qlRwm7M5V8COIrGLXctHcllHw2e9p1XwpuvmuWRfDqvlOTp/xF+
	 V62khVuM/lrJg==
Date: Thu, 24 Sep 2026 13:04:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: use regmap_assign_bits() for conditional set/clear
Message-ID: <0a1eb6d0-262a-4e19-b947-e9c810a79261@sirena.org.uk>
References: <20260924083420.461715-1-peng.fan@oss.nxp.com>
 <arTxlkxUFjg8EOJ2@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dyw+g88Kkc0aBFcB"
Content-Disposition: inline
In-Reply-To: <arTxlkxUFjg8EOJ2@opensource.cirrus.com>
X-Cookie: Oh, so there you are!
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


--dyw+g88Kkc0aBFcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2026 at 10:47:02AM +0100, Charles Keepax wrote:
> On Thu, Sep 24, 2026 at 04:34:12PM +0800, Peng Fan (OSS) wrote:

> > Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> > the simpler regmap_assign_bits() calls in the cs35l45 codec and the
> > mediatek mt8188 ADDA and DMIC DAI drivers.

> > -	if ((bool)ucontrol->value.integer.value[0])
> > -		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
> > -	else
> > -		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);

> > +	regmap_assign_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK,
> > +			   (bool)ucontrol->value.integer.value[0]);

> This doesn't work value will be bit(0) but SYNC_EN is bit(8).

No, it's _assign_bits() not _update_bits() so it'll set the bits
specified in the third argument if the fourth argument is true.

> Also would be better to split this patch into two, one for the
> mediatek stuff, one for the cirrus stuff.

Yes.

--dyw+g88Kkc0aBFcB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1Eb8ACgkQJNaLcl1U
h9Ag9Qf/bbluKqqo8gwkquyxMVdUqUH8brqCm+6p+VsV9Vs6wCTg7IaHDuPkGuAT
X2z+UORhW3l9s437znTQK6dbJ5A5holY0VLcIxe8Gy5s0x7zLzsBZ8QJCmosx6R1
L8g9/Mp3AxicrwjLxqXPIFWl7UCkD0Qs4ovtd0nHeZT0dnzv4wh/FV9klrICnxE7
1YyvUMwTddCRcO7aVOSgF3v6GxtW94NT8ZSFfNIg0UwWZWYIMQSIFll0fuJRf1/N
BPcrjFX0hd1bNTtO8GpMwem5b57Mot8a2ma40Ojjw1AGRGofNb1oF8tCFQATFfYX
ktVmnIyxOXnEaiDvUlNphZo1jA/v8w==
=45lD
-----END PGP SIGNATURE-----

--dyw+g88Kkc0aBFcB--

