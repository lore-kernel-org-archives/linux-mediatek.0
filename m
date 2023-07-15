Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EE8EB64DC
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jul 2023 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pRSKy/ycb5olH1fPJAFZqv9dE9xpVHJ6yGDagpwg/c=; b=TJs9vbGZIeE0riOmscxByRwiQe
	E89659F8GPDCBdSLVAwvELrM7Q9HCS+6LalF547rKZTP3cBI9poC8LXSZZH/xnyagqB8tTWtnBxid
	NPLSU8lW9n5aQZ1h7vO+tlhLcKB8kpEQTlni9KCJDwn22KqHFtJh+G+hMcTRIfI0l4BsV5sBhygLR
	qqRqy16lqF/R4WJPpLSf+7ztot2wzdTTqxnSZ+mclhCygazBK6aVQEfOEt8L2HhkHybGHLNkWmT0K
	K4oxPzPloiv1zWefQFzmMlIj4J07t1jy1IJgGrd5OnspRTLaS73KMr6nNutZtFCEDEN41zleILPED
	QhAhWc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgKN-008xJU-02;
	Sat, 15 Jul 2023 14:32:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgKJ-008xIr-3C
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Jul 2023 14:32:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23FEF60915;
	Sat, 15 Jul 2023 14:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DBEC433C8;
	Sat, 15 Jul 2023 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689431570;
	bh=thxOyn9+vn9MQxgNeqgk5Feb1jIpgtAzB4Rf5/OKh8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gel+swbkCif5tNpB/eBxrbB+Y1Wvr9ymb7R57goYM1z3UIffmlZXjB1TT80LpQQ8n
	 wfW2fWgxf/X04aDFxeF1ZQXhr8gn9cV8eavd6pT7cOPq2PNeoj6nHNMYAI25gmLnNo
	 vR3ccfyfSPa913K+2FmI39/1DXxFbyezVbQn/FPe+amleGrsOeInS9G0aGezq7/4I2
	 Pap3ANWjUwXJoXoyJtD97Uu2PxJl08Zf/ZPwwBRMGAjjxBXggFO5HAB9IUCWK1MsX+
	 ZHd1Loh90pudCecFR2xzs+wxqmuY1nQMQE4gxc2j9p+4wCO+8wpMEeOzCWJKKVgMko
	 fW5ViHtJkOyrQ==
Date: Sat, 15 Jul 2023 15:32:45 +0100
From: Mark Brown <broonie@kernel.org>
To: kernelci-results@groups.io, bp@alien8.de
Cc: "kernelci.org bot" <bot@kernelci.org>, x86@kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: tip/master cros-ec: 10 runs, 2 regressions
 (v6.4-rc6-330-g0f2eeb20bbb85)
Message-ID: <8ec4b938-59a7-4b7f-93ee-6b7593cb443d@sirena.org.uk>
References: <6486e33f.170a0220.2703a.ef05@mx.google.com>
 <20230612092922.GCZIblcveb5p8crgmO@fat_crate.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GJqzJgQ0YUMUvGkp"
Content-Disposition: inline
In-Reply-To: <20230612092922.GCZIblcveb5p8crgmO@fat_crate.local>
X-Cookie: Oh no, not again.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_073252_134550_BE1ED387 
X-CRM114-Status: GOOD (  17.36  )
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


--GJqzJgQ0YUMUvGkp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 12, 2023 at 11:29:22AM +0200, Borislav Petkov wrote:
> On Mon, Jun 12, 2023 at 02:19:59AM -0700, kernelci.org bot wrote:

> > tip/master cros-ec: 10 runs, 2 regressions (v6.4-rc6-330-g0f2eeb20bbb85)

> So as far as I can use that web interface, the error is:

>  3649 08:46:19.915046  auto-login-action failed: 1 of 1 attempts. 'wait for prompt timed out'
>  3651 08:46:19.915828  end: 2.2.5 auto-login-action (duration 00:04:20) [common]
>  3653 08:46:19.916858  depthcharge-retry failed: 1 of 1 attempts. 'wait for prompt timed out'

> and the only warnings in that log are:

> <4>[    2.437968] mtu3 11201000.usb: supply vbus not found, using dummy regulator
> <4>[    2.470840] xhci-mtk 11200000.usb: supply vbus not found, using dummy regulator
> <4>[    2.536866] onboard-usb-hub 11200000.usb:hub@1: supply vdd not found, using dummy regulator
> <4>[    2.743384] i2c_hid_of 2-002c: supply vdd not found, using dummy regulator
> <4>[    2.757753] i2c_hid_of 2-002c: supply vddl not found, using dummy regulator
> <4>[    2.793475] mmc1: queuing unknown CIS tuple 0x01 [d9 01 ff] (3 bytes)
> <4>[    2.813935] mmc1: queuing unknown CIS tuple 0x1a [01 01 00 02 07] (5 bytes)
> <4>[    2.826621] mmc1: queuing unknown CIS tuple 0x1b [c1 41 30 30 ff ff 32 00] (8 bytes)
> <4>[    2.834802] mmc1: queuing unknown CIS tuple 0x14 [] (0 bytes)

> which don't tell me anything.

Current -next oopses a couple of times on boot trying to probe some
nvmem of various kinds, there's something off with the platform:

   https://storage.kernelci.org/next/master/next-20230714/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt

> Can we get this fixed pls so that I don't have to ignore those reports?

In general if a platform is just not booting like this it's best to
chase it up with people who work on that platform - they'll at least
hopefully have the hardware and be able to drill down into things.  The
CI correctly identified a problem, it doesn't really have the ability to
understand where it came from.  I've added some Mediatek/ChromeOS
people, and also nvmem since the two oopses are both there.

--GJqzJgQ0YUMUvGkp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSyrgwACgkQJNaLcl1U
h9CREwf/frb8OMhjab/5mJgPgGz+KzcGy9faLkJNogSFhfR4FZcuo4I6N5MMNdS4
GzGNswx/mBDBZpRl1BUJ5pFPVo76CN6q62zHUwywC6BQA2t1/ZGQpsFlz8jbaW7B
WDSwnbehJSsUK0cBWzKuHKwbAH2g7F+YwuqjHMFdnteVoRd5Ks/CnQSUrvGSG8kt
Irx5UNcBge33y/8+KNaL3L4HGvlb7MtLn1B35BsdXqPGkceEHnIO/3Yp0aqDNCzD
UW9/cEh2Pd2mPLWh8gkLTsRwd0Z4/d/bzPSbEl2OFKDaMEXMPzcemFHg4Yb9eRPo
iXDYUHfftLLapweTYtX+wzdBYrqyNw==
=rdbE
-----END PGP SIGNATURE-----

--GJqzJgQ0YUMUvGkp--

