Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C822C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07T0PeommmxanlKZ6yvJLEJr86GzZDD1TFaAoNkBZVw=; b=p3d0Cc/inPwsPzp90SU9NowSKz
	pLZAK9Zd6Wgw2O0ctFviBsy4qW0aw+qn0sCU1uSNA1GV7ww/moQCNPA0vkwkSVjC5pNHw++YhID9K
	0N0Q5cO/NKezAaZ6EYyI5TJDXjHooO+64GQC0IDYfn5V2nywEn4qVX72A34W7GLmlsTO2XPY7pVSj
	JTeZrDcmTmb5EqPEC62Fjw1yWyZlNTvds2hlYQp34Fgzr8GvqKawsS5OICGQCFDqQoMnkPvKcLgQJ
	oPELltJ+s9K0rnpVtv8wDn9nwbtb5fkVcZHrJJdEPYycPxqvryICoIEXboXK3J+YC3KgH2fjf+eVs
	ZHUNgplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ollm0-005kBx-Tf; Fri, 21 Oct 2022 06:44:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olllx-005kAq-JA; Fri, 21 Oct 2022 06:44:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C70F61DD2;
	Fri, 21 Oct 2022 06:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC4FC433D7;
	Fri, 21 Oct 2022 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666334687;
	bh=dg+igT/kH5vNLile/55ugMghQ6bHOl5tdBoCQSBXYac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGeMyJeg87UlxSe5k2XIw2g27XDq3ZEoGhJylOgn/Pc+deCE0ymZDPF3pyhTXbf62
	 BkfHG3/Jo3vHInZD0+8lFJ/J32KahCu6OAm/wJgPFxd9F/HemwazCjH13UA8hJ60mM
	 b7/YE//cHLp3hSWuNDGNIrsZr73GEPOrbsw5jMJf/PXtSzJrG6IggCpuVSgIjAuv7T
	 mkRnUX2cWBckGEDpW/KQuEh4jbsZI+7HVNHZJlkU6jCmsTyk4td814k6t0S+O3WWSh
	 8xaaW5CBclarLFx8oWJMBlgIHD63a03DVy9s1ojqs8YIrBNztmRJ02YHmW3QFs0F8Q
	 AkwK4fKzudFJw==
Date: Fri, 21 Oct 2022 08:44:44 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: linux-kernel@lists.debian.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
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
Message-ID: <Y1I/3KPxSI1voRHh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Adam Borowski <kilobyte@angband.pl>, linux-kernel@lists.debian.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
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
References: <20221020221749.33746-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ASNnxeSggHlth0r3"
Content-Disposition: inline
In-Reply-To: <20221020221749.33746-1-kilobyte@angband.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_234449_748224_045604BF 
X-CRM114-Status: GOOD (  12.97  )
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


--ASNnxeSggHlth0r3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've been doing randconfig build tests for quite a while, here's a pile of
> fixes.  I'm not sure what's the best way to submit these: do you folks
> prefer a series like this, or a number of individual submissions?

You sent the one for i2c-mlxbf seperately, which I applied now.


--ASNnxeSggHlth0r3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNSP9wACgkQFA3kzBSg
KbbjSg//Qpjk7lLoKdOzvsdmL0Mq2o5hT22qP9eF8TiQ3pE1B3B9C9AsdWQ7FjOB
ClXU5SlQmHPj//fgEfmr9Vj2bKBssiA4QkjiF/fcjthcBqG2j3tLeQPRmFr6qcd7
a873ogKipCuWcb7wHngTM9a7820xTtzm6AUCGCfWQHKiXjdCWsSdBoSEyHDocLiz
CVpTOsOeH+pC5Sa1WwXdONrrOMoA1Cttpxu8Y/ZCLzyqQ4M+WL5j17g/jMihywZ3
hg4uduAbJ9Oq2gWXAi8JvnNLPYE5RdYjk3d0j4jFxyxSD8DeIOjp1tw/UT6VSoWK
n+ygnkytK+33BTuEoIKKEfl3O5XTYtERfroHf3trO+xaIMKqa06p3+qPM5+2Rnqx
cZ9cfqYqw+vCs/zkbtzWArA81N4O/QBDhNe4ktHyFkChCAN8dJSf0Yx5QM1oY50f
Vkj0kWe6nA34LURe2MazhrLSQP7ht/8WkC1l1efH+2gHOdNBmxsr3fqOvYznCziB
BWT40k8BRRdByRFICeSeS001FW+AUlbpE8q637iYCR8sGyqxJmCCb541W35o2gdT
5ciiIlzkqA3NudtWem09SR8UuBv9wXaiLx8qQXd72b/Na86U8dT3Bc8DKthJFWn6
59ubRiZuumctWs6sE7kZ9aPXpPpci4isfJAhNOCtgJ7+pC+g65E=
=s3Uy
-----END PGP SIGNATURE-----

--ASNnxeSggHlth0r3--

