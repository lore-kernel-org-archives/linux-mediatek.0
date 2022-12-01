Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF5BC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b32humZu+PKcy8aKXenWyUF4vn9xYLfzYQwwwXYV6iM=; b=2ozsfbJhDulQKLjh5fntsZydU9
	7PgQMLD+WAOzAOTvZy26KsZz1L2aucXPzkEdODNpfEsFXcZSU5a1M3arw9QtzFWRJis0ebqHBSwQM
	pF8YC7abJOBmvtH0Zx2w/VmRVfmmlTh+m0K7Yhxvxa7P3DsKhj9kqN26nU1B4erSpNfGvC26nmXs8
	XW+ItjN3f2IrVeQZc9/N+J0IgC3y2Nfy8Iwu0cHo35L7Lfm63SzRHOXEWZLCwox0tOWCbOF1kJb1a
	VUAZ0iGeh5KUEams8rf/qg5yKzASCtFmyVDX9x0k+6h5xe3u/ApYsUeDQblLXe5MihXtR8dgqpP80
	O6Km5E4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hyq-00787k-Sj; Thu, 01 Dec 2022 11:43:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hyV-0077vG-8N; Thu, 01 Dec 2022 11:43:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 96665B81EEE;
	Thu,  1 Dec 2022 11:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093FDC433D6;
	Thu,  1 Dec 2022 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669895004;
	bh=b32humZu+PKcy8aKXenWyUF4vn9xYLfzYQwwwXYV6iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNmP9cYw7XrR9Fi8RI2ERKG09CjpM13Han0ROS4DngQb9nsxxEjbE2m3By5K6nflD
	 yN52W8Cn8A2smqxX/2MlNHsGPsEBe6F7ZGzwV6Lq9alN+zR2CX84B1mLnWsEk2jCoW
	 QvQI9lE4tlVpwAO6xrmEnqnaqMv2VflFwll5IyFG4lqVhTJlGuGmW5ppnKDzSYuTz7
	 JZr/JDu9q9IVVmHzdnB3GAHmbwMFYRbM3/4pCX+nRadpcmZMA9qQCkd5dvCbahW7YN
	 CSzOQKTUzQ4EMZspOGw6dz2qrVgVMC+b4KGjCjbZ/E3DKYxuYOGuhDlX1N1yl6Bj7P
	 Cnz1T2Si1AMKg==
Date: Thu, 1 Dec 2022 11:43:18 +0000
From: Mark Brown <broonie@kernel.org>
To: cy_huang <u0084500@gmail.com>
Cc: lgirdwood@gmail.com, lee@kernel.org, matthias.bgg@gmail.com,
	yangyingliang@huawei.com, chiaen_wu@richtek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: Re: [PATCH 1/2] regulator: mt6370: Fix potential UAF issue
Message-ID: <Y4iTVmOA5P/aN2yb@sirena.org.uk>
References: <1669797463-24887-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jonyXJ7Ofmg6Ee47"
Content-Disposition: inline
In-Reply-To: <1669797463-24887-1-git-send-email-u0084500@gmail.com>
X-Cookie: Isn't this my STOP?!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_034331_467399_7B4B3844 
X-CRM114-Status: GOOD (  13.83  )
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


--jonyXJ7Ofmg6Ee47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 30, 2022 at 04:37:42PM +0800, cy_huang wrote:

> The original code uses i2c dev as the parent in order to reuse
> the 'regulator_of_get_init_data'. But this will cause regulation
> constraint devres attached to i2c dev, not the mfd cell platform
> device.

This is a general issue which will affect a lot of MFDs, we would be
better to fix this by changing the API to provide a device to be used
for the devres allocations separately to the one used for looking up the
DT.

--jonyXJ7Ofmg6Ee47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOIk1YACgkQJNaLcl1U
h9CAEAf+OLCtX/qUZlN1eE3kJF4yWWC2wCV8ARG5w6+YoIv3EjUJGyHkXsdCQ9KP
D4nDhttbavKDqseq+3MXE8WpQBqjpH0ib8cjpwrRKgnyREOpkcKRDLGMbZjiN54Y
iiCizyQeZc4YKjgO3/If3xwrXhx1pScpT1wm5KJPj/pd7EaZUrReHtf6oZpvRL/4
jiqXoqOwZLVaq4xP1rBY/NAgk6Dxt8RwxfjoiDBXXj8i7lbpAIuEn6ytL2DVPj5Q
HDEJ5jB+ezP2OuPEVsc1Y1U0pCdJW6qDHilWbz2iwcwNzp7auHtYY70MhOcRq6x4
haVGL6pyAZeo0va9vqQdvltZB9XTqw==
=/yVC
-----END PGP SIGNATURE-----

--jonyXJ7Ofmg6Ee47--

