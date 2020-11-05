Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA361C4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 17:12:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B836A206F9
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 17:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lX6e1cIA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2hKjTD3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B836A206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DWOgX0YOCKJV8T8YpAiecX+Zpbau6MTVwSqKBAM7s8w=; b=lX6e1cIAcCQoqf+cAcU8caM6Z
	Xbh8TavoGPwhm4QtZkMq7PoS8ncVSuatkH9RnQG1caRnkCu7ZmevZ35x1sJtUm1xgD8YGaz/n/uQO
	P4QzoGKzZIjQ4nhhLo7WSXXpcNrWxADjc6nWgB/2l85S7uP5LXsIXCO7QET51S7hH8fc67krXg3BX
	W6uqs/w4ty5jfrVzKZtDKaj09sd1lYK4NhlSy9e9EzS5y7Nk5Q5hAj57B3tP8vMKfIgJKMHcKhfap
	ZBftknGv2ZoFCZ3Zkg68GcYE+RY2DtiBPIG9TEbYJ2uy4govjRALUHZj0ET/biuQUx9CO15OhM7jS
	hQkQ73CtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaio6-0002cM-Gq; Thu, 05 Nov 2020 17:12:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaio2-0002az-IF; Thu, 05 Nov 2020 17:12:15 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3649206F9;
 Thu,  5 Nov 2020 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604596333;
 bh=prd6A+NX6LVE+G7iCgaOeI4PsZ1pzhd+/v/KcHyOs7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2hKjTD3Q7T/nvSvxH8BCCTnpJ+eUegzVk9CdfNBsVLCBLv0mJTC4wLmYztnSDiWDm
 6UHjqbxKsjrm93HgW5CCDac1Fxpaha2MasoC84giqxzcSt1VUFwF/dNq9wpCwKDHdd
 lI7dEKtRblBBHZDqxD/ZpIc+aSNcDyQDtsA5HEtM=
Date: Thu, 5 Nov 2020 17:12:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 2/2] spi: Populate fwnode in of_register_spi_device()
Message-ID: <20201105171201.GF4856@sirena.org.uk>
References: <20201104205431.3795207-1-saravanak@google.com>
 <20201104205431.3795207-2-saravanak@google.com>
MIME-Version: 1.0
In-Reply-To: <20201104205431.3795207-2-saravanak@google.com>
X-Cookie: It's the thought, if any, that counts!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_121214_704025_C99283CA 
X-CRM114-Status: GOOD (  16.50  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Cheng-Jui.Wang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-mediatek@lists.infradead.org, Daniel Mentz <danielmentz@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3092434824017531707=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3092434824017531707==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dWYAkE0V1FpFQHQ3"
Content-Disposition: inline


--dWYAkE0V1FpFQHQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 12:54:31PM -0800, Saravana Kannan wrote:
> From: Daniel Mentz <danielmentz@google.com>
>=20
> This allows the fw_devlink feature to work for spi devices
> too.  This avoids unnecessary probe deferrals related to spi devices and
> improves suspend/resume ordering for spi devices when fw_devlink=3Don.

>  	of_node_get(nc);
>  	spi->dev.of_node =3D nc;
> +	spi->dev.fwnode =3D of_fwnode_handle(nc);

Why is this a manual step in an individual subsystem rather than
something done in the driver core - when would we not want to have the
fwnode correspond to the of_node, and wouldn't that just be a case of
checking to see if there is a fwnode already set and only initializing
if not anyway?

--dWYAkE0V1FpFQHQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+kMmAACgkQJNaLcl1U
h9BOhgf+MWUPQ9E7PEgdJdwUqM+ffCc99Cl/O061oCqIkejrGFzDQBe1C51Mwua5
YqXAvXKEIkITeDVDKeaHM5Jf3bO6Xe1MxaASDZ40nbv+U2qLqG3MleCqwzOYBug0
7dB69Y4Wm7vB8VGN3CzCkkW3wa6AUKTXrPzSM1/lmZ1KPk+x7OtGvjsbtGBMTqEw
kQopqW/5ol63N7M4G9h37IfNzJgPkrpwdDJnWG5OzzWynyj+qPwQ/xku20aGBRp8
ARW3QLNqQERVhfP45O3/Wgppk0SUUFYx+RFUFyaZHbvn7tFrSFtpaPNKySGdVRQ7
Gxj9X9vuN+18Olyswofjx9rqRTiDRw==
=eA6X
-----END PGP SIGNATURE-----

--dWYAkE0V1FpFQHQ3--


--===============3092434824017531707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3092434824017531707==--

