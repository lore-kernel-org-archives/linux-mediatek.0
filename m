Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C04C34026
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 12:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F270D2067D
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 12:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HaOdJPS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F270D2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RfnQmi5EYQVNCd5tSGb173RA63SNKITU6gvVlBGLYNQ=; b=HaOdJPS4xFofqsN5vTp0pMvRo
	RtGk3Juy19D677WeJpQrg7CmP5ng8OGnCDNTBh/MpmunUbZaCl6EN7P326d8DVGccMd5T4/RFSSVD
	c1qEWr4ylEmYU73Mgu0fnqMB251UGSLspNU20QrY9V0HGKd/aDM7Tn+VLU75UlkMHhDYnl7fs7B+R
	hpWbNFHTEQMKhWA4CUnZlNRDxoFHHvYMeICyjprKiTSf8GbxudMyZbyDaF5OEyC07cyN33TfFHUph
	5SNIrLBl1SO2o4fgNkhZLwi9K45a4egrs7JP6enHKWjZc/X/WHFcege6+9nlJcAdCQHbbhbNmZHon
	TQvnxH4YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j42Q5-000673-Qm; Tue, 18 Feb 2020 12:56:09 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j42Pw-0005wB-Kf; Tue, 18 Feb 2020 12:56:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 316511FB;
 Tue, 18 Feb 2020 04:55:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A616F3F703;
 Tue, 18 Feb 2020 04:55:58 -0800 (PST)
Date: Tue, 18 Feb 2020 12:55:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH 0/2] rewrite mtk-quadspi spi-nor driver with spi-mem
Message-ID: <20200218125557.GD4232@sirena.org.uk>
References: <20200215065826.739102-1-gch981213@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200215065826.739102-1-gch981213@gmail.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_045600_723353_7DF0977D 
X-CRM114-Status: GOOD (  15.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6326554839747594039=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6326554839747594039==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 15, 2020 at 02:58:24PM +0800, Chuanhong Guo wrote:

> To keep patchset small for easier reviewing, there will be 3 patchsets
> including this one.
> 1. add the new driver, which is this patchset.
> 2. update existing dts for the new driver:
>    spi-max-frequency is missing in current mtk-quadspi binding. Old
>    driver parses child node manually so it doesn't need this, but
>    new spi-mem driver is probed via spi subsystem which requires the
>    presence of spi-max-frequency. Since this doesn't break old driver
>    support, I'll send this separately as a standalone patch.

This is an ABI break so you shouldn't be doing this, if the existing
binding works it should continue to work.

> 3. removing the old driver. I'll create this commit after 1 and 2 are
>    applied to avoid possible rebasing due to any changes in the old
>    driver.

This isn't great as it means we have a period with two drivers for the
same thing in tree which is at best going to be confusing.  There's no
advantage to splitting this out.

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5L3twACgkQJNaLcl1U
h9CQ0Af/bCSGtGQh9O/SezBLGjZ59DSJjcG/kJ2CB/e5Ub3WkveUKq3prcIpbWRZ
j7LZ1+3P0+IQJC2b4wWFTf6xOOoucP4Qb1qVBc1HyBt9SrqrrZ3SdEXzhbsYJ1Zq
tLGrQ37qdRhfSpspLm1N3FN+EBZuVW3tYPclxUjkHTE50mu0wmMAk4OXtrbyBKp7
H046klgqVPBXzTlP8mFTtp0/E/hYhrBUTqcEcUBTAw3nCMBMiVxUjdxRx+tB41CR
TBBlM9+VwbxRbrzZC9IL5S+l+Bi9EW2axbZ2zFG7vOTc+AoCIT/PxwyZBshr8Xoh
A7hM2b6D+BSbpRcPwjpZLi3E11d0ug==
=CyQ7
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--


--===============6326554839747594039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6326554839747594039==--

