Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08AFC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 11:26:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C028061483
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 11:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C028061483
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4S+RkCCzBUVWxb64i/Y7YyM7qlnuVpIvCivP73Sx14=; b=PoKAb/kQCYy7UTlfOZWxE+hp1x
	2wPXx7MQ7VIuZvRhZYjCfTOR8bRPpOyp0hyTzm+AnGhy+Yc8o2yAm/j0W6J6tLzaPuOvhKs+fKgp7
	Tv3oniPzBVIrlaYVZOsxRft/wqDF4fTr4hovWqgR803RS0bYq94F+fh2zS4Gcxr27maGrcR8Wxmc1
	/zDW0y0n94bKaq3e/2CKylCJ+becSZGMmf8j1qYGTG0HUR6TdIjSZxUvw0uIa9qKMgiMn2YvOSQrL
	3Kgp6UYdYVIxhq2yjfQ4eh+vqvKN8rY+qEvWnFwSyjD9mPJybUzZ2x0+X0Q7SKvSIU8NbQ9HTeBlf
	ZbDRouTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjya-001JSQ-Lf; Fri, 25 Jun 2021 11:26:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwjyM-001JPX-Lk; Fri, 25 Jun 2021 11:26:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C6B561483;
 Fri, 25 Jun 2021 11:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624620368;
 bh=5gGlFkG5ejd5XqK39wO+xof0g27mNIXfwL4EcnWkZIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TOvqvDd09a5EaIbb7zxlefl62wNMvE/KjEeeQCnCIVk4vgQP+tWLc/idfafcor625
 zrPm14rgtbxoeUVODbsFTGyXWjZn+G1ggCVJewDk2vgYlvmOGsre/dftdvYYpLGYZJ
 xto3Q7lXgmhKxrfe37+FCw9apLHmi9GR4sLpOFrhHC3siVHQ8odA/B/91vqzuk1ldP
 U7rCHBxDenkSuG+svsY+a7n4r9r0nuuFNPUUyhRAK65b/eeTe1ahbRNPsYG1j6oeQX
 GGuZXN6knJLskd8QFqRPrm3/OyuwuhIEi71/a+DdCsK3lXvqtMsowMVfcT8KAdoQB6
 9Et9SeGSXj5BA==
Date: Fri, 25 Jun 2021 12:25:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mason Zhang <mason.zhang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, hanks.chen@mediatek.com,
 linux-kernel@vger.kernel.org,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
Message-ID: <20210625112544.GB4492@sirena.org.uk>
References: <1623721803.24597.9.camel@mbjsdccf07>
 <20210615111426.GC5149@sirena.org.uk>
 <732a8061-e8be-5c8a-ea75-6da87947db02@gmail.com>
MIME-Version: 1.0
In-Reply-To: <732a8061-e8be-5c8a-ea75-6da87947db02@gmail.com>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_042610_790931_38AB6BE8 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Type: multipart/mixed; boundary="===============6268623760177140384=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6268623760177140384==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 21, 2021 at 05:31:41PM +0200, Matthias Brugger wrote:
> On 15/06/2021 13:14, Mark Brown wrote:

> > I don't have either patch 1 or a cover letter, what's the story with
> > dependencies here?

> No dependency. The dt-bindings was just send a second patch in the series. First
> one can be found here:

The point here is that if you're sending a series that's generally
because there's some dependencies so it's important to copy people on
enough of what's going on (generally at least the cover letter) so that
they know what the story is.

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDVvTcACgkQJNaLcl1U
h9BHrQf9F5/P+HsqVqRSUY1U2QheeUKbq475n6BZxva5qfaOSn478e0/IRiOu9zM
pnYfiilc8Ut5OlZQQ0634J2LZZydDSIYarRrPxXXFXxUNUIEDCIjJGHn0dkrBsUm
VjpWGlGAbl1lLkIzFWb9O19H7Uo7rOzTb5AtPO4Uo5EPg0y40dPYFXZFZ0HYA1mS
1aQT41fHHPHsZohCWwiLkjIYn1iMFco+Z3n8pwp+1pgsOcbIkcFLFB2FzkO4QU9z
IRgwgWTVZ7sMMw7t/zPtYbRO4WoDfys7qtRwkF/ORU5LjjPlSgaH0FAo8c+8sp+8
QBTEM350xjoF50d5SX2HBUOg7onqlw==
=D5wu
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--


--===============6268623760177140384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6268623760177140384==--

