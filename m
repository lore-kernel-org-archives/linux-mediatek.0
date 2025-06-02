Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E27C5AD49
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jun 2025 11:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YC0EqCOZh+bGnAS0g2+hJzdV0xxtzSuWEz6dOnQ4Dp0=; b=nHD47YI2XTjdB1fhGDt3dwAdsv
	N8J9KShbHIEAcUkmke2ltvPMgI1t3nXUidf4VjCq8TDso8TIJFrFKhBQyTuDBCE85yyCZ2EQ0Xg/J
	Oxls+qlweT7p8ZOa0f/0VhriLJHDa/VXDPac4FWYxEuXODP2MUhBfOurjH6thWwZ6m4aOVADx2wY4
	rto8J3avdrReNN13UxsUpJyHDj15H4TB6aLK1WkD+60J3oxInIAsirVG4GQf31kxotDw3+BcB5VAx
	J8DuFOSq6YLx8g3gmr2nLF0vsdzJPspWSRDD3NDrHV1md2IBhR1/SStC+WjD+dkXyCt/XpDTTiCVi
	68BlHlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM3EP-00000007Gq0-3Hfn;
	Mon, 02 Jun 2025 11:21:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM3EP-00000007Gpc-0Wmg
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Jun 2025 11:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F5DE6111C;
	Mon,  2 Jun 2025 11:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9998EC4CEED;
	Mon,  2 Jun 2025 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748863288;
	bh=YC0EqCOZh+bGnAS0g2+hJzdV0xxtzSuWEz6dOnQ4Dp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWIjQUl9Nbkx5Plohd4MnWjQlnxZ+y5p0geoc3A/PsyKEIv0lPMjTdAgImsBUVKS5
	 txK5tdfgiNpQy35l6h2zzzLQBcSVdTfmyuzE6kD+sDw7POHhw4p3nO8o+vw7I2gymx
	 jiiZXdtl6qtNnCReOjPyWJpVhXbjFr7TALEbf66ySRy/JWth7krcg/yGi02JC/WUIP
	 NzKQ0GymQ5dcou5zXiYsJvYFfHORbtlKl2TIffHCa6PkDWtf/ljigZ+G3p+lHLNkj3
	 MOlrVTLeSzv24oOgPFlDGWD1U2JLvgrDD8zAD52DcOKwTO/c+ZZPOdbQCqMSqYMt2b
	 8axp7Hq+/kwyw==
Date: Mon, 2 Jun 2025 12:21:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	SOUND ML <linux-sound@vger.kernel.org>,
	MEDIATEK ML <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] ASoC: mt6660: delete MODULE_VERSION
Message-ID: <bd02757e-458b-4a3c-9194-7d7bbbd318f5@sirena.org.uk>
References: <20250531155950.101164-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BITvhzOI4tGAp1//"
Content-Disposition: inline
In-Reply-To: <20250531155950.101164-1-xose.vazquez@gmail.com>
X-Cookie: Knowledge is power.
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


--BITvhzOI4tGAp1//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 31, 2025 at 05:59:49PM +0200, Xose Vazquez Perez wrote:

Why?

> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: SOUND ML <linux-sound@vger.kernel.org>
> Cc: MEDIATEK ML <linux-mediatek@lists.infradead.org>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--BITvhzOI4tGAp1//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg9iTMACgkQJNaLcl1U
h9B9ggf+Loveli4/RDFRqTHaFC6/CBG63rebesdMGUnYUtvOmCxl+57fKdkjzLqn
Aa604mlfThBqgiFrW1LUlEGXohRq9aD/EBfKxwn64VDq5e2kDtVnKozr2FcnD8+6
tR3TSwvdvrq1G2sWahRR09v176jweqbdUVd/4q3LojhKCT3arXdL0EZtvMQMZVLo
p4FUMAH2ZpnFVOusr074RyX2bmeZl/toiiNAligp3N0GlhJXU9PcQAA0USYs38zq
5hwS3sejJpnP7D8DPceYrzisKywf80nK2+RSHYObUvcQSNwrySK6Y8pAkoI6NB5c
CtQm4xzQGAW9F5b/+v7sfFAlDRkVvg==
=Jazz
-----END PGP SIGNATURE-----

--BITvhzOI4tGAp1//--

