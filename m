Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87118C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1knPycaa+P8L2foYNOMD0l5jDfQk1X+aQYSZ1MXusY=; b=QC31Bn0DOnLTuR85HNx14NBNZs
	9WFPXxtWoZLxAux+5WbcztQcvgOkNToR48tYFPwyO9jXhGmqyyQNMF6thNvpDoQfuoAJ0YVgIA0FM
	YaEvZQURLQtrG5WGQKg+6uGz3XHnBrw72ojgOLGDh+o88K3RNY3/ZLdvv9RDTPAeIR8kulYSAuWZc
	Iw3/OY9+b/0ByVe3UiIubhA7SrMgeAjaMKDipKt4/6sGv2LGpv9mBig5WQnMAwD9KWIoJE+yUWLNE
	fwuiv/ci95/rACN/2+CEGPUzIkRpUkF06TzkEG1O9XZB36oToWZwet3Mv1cSkSrEGq/T/GLYd4P1C
	xqGhtSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpe2-007DP2-Qf; Fri, 21 Oct 2022 10:52:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpdt-007DG5-8z; Fri, 21 Oct 2022 10:52:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BA6BEB82B96;
	Fri, 21 Oct 2022 10:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC6DC433D6;
	Fri, 21 Oct 2022 10:52:33 +0000 (UTC)
Date: Fri, 21 Oct 2022 11:52:30 +0100
From: Mark Brown <broonie@debian.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: linux-kernel@lists.debian.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
	David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Brent Lu <brent.lu@intel.com>
Subject: Re: [PATCH 0/6] a pile of randconfig fixes
Message-ID: <Y1J57jJ1+FTG7U9O@sirena.org.uk>
References: <20221020221749.33746-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wWcrkmaG6Bl+vyW8"
Content-Disposition: inline
In-Reply-To: <20221020221749.33746-1-kilobyte@angband.pl>
X-Cookie: On the eighth day, God created FORTRAN.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_035245_507287_765C9A3C 
X-CRM114-Status: GOOD (  16.64  )
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


--wWcrkmaG6Bl+vyW8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 21, 2022 at 12:17:49AM +0200, Adam Borowski wrote:

> I've been doing randconfig build tests for quite a while, here's a pile of
> fixes.  I'm not sure what's the best way to submit these: do you folks
> prefer a series like this, or a number of individual submissions?

Individual submissions would cut down on the noise from the enormous CC
list.  If you were going to send as a patch series it should be a single
message per patch as covered in sumbitting-patches.rst.

--wWcrkmaG6Bl+vyW8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNSee4ACgkQJNaLcl1U
h9BDwgf+IkbiCFyXzVrO3F8yBx883iUJM3R8A5LPsrxScBUzS3Nu7PgzWmko3Bfa
wm/rXizNrMQPDqUakrtR8duh+w/eL6Lz3YrZEQEaM2fd8+MayJt9tXB4o/qfcrBc
B3o7lbqL9Hp0yqRKKG8orcvyiJDpOh2Z+zLAYqy+LuFLuiv6kSKu8h7c2vm7DKCw
+wGkRN5blfrYPHGOoU/r6oqjT2qx6BFUsXpnILPw2XRtXlkYv37BLu4rRgZ7qc+D
Afo+DwE5y6d9t9ebOL0UjvgveEysSY3VksxCcjtWru+wN/bjPbET1VFJUrfbMyGf
y+JN6EsaYWeKmGsk5T5pZ5XczMBC+A==
=kG7z
-----END PGP SIGNATURE-----

--wWcrkmaG6Bl+vyW8--

