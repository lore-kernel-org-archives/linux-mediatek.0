Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2174C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:31:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1707207BB
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="blyKC/Fi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3iLBpGF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1707207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cSmd8ycpg9fAa8pHGpmXEXghpAP/lXUgOE82T3dAbRE=; b=blyKC/Fi/Mg9nBZQnrKNXSu6X
	U6FSGKHKrCsMQp7FS98x51AQjurkbI5x8vIR+fbH3bHyE9dU3wD+CIlT8IhvwmUIl90PlnmbzO7mR
	X8jN9dEiW+nLRcaxNrpHCsZX/lK/v6C2vHz99Im8zoJ9vZpDRpNGHFmvJ3WQgWPuzEgYzkS7LsuZb
	tnekZQSldyvpcKTDVIxVrujAupTdAkPGcClyaKoKncSlJMn9fQv9cRfUSvNgh9DybEk6apAvgdJHV
	qixrNjb7/g05TdjztOZRpdaG7OCbei1p/QkEw2Adl+5ZyEW0cED/FqQNFyQ0uV1kDtpyU4aDnSyr8
	4rwn/XRTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8imT-0004OS-35; Thu, 20 Aug 2020 11:30:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8imP-0004Nf-ES; Thu, 20 Aug 2020 11:30:50 +0000
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16321204EA;
 Thu, 20 Aug 2020 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597923048;
 bh=0zMYJ5oh5YMdX4pO293LF39UhxSYtvTe+EEHCB8h2oI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U3iLBpGFiwiloH/TS9/0Rd657qBi5S3FKwoNOZHTEHHpXKuJzRwGAwMhI/BBvYzDt
 cb486WvZEEZELB18sEf6e5LV89N12ykeAr7RdHoszbAsJoXc5OsKZ7RWCqFCEyTqNr
 fFOmEtNwtxyjRdBv1EYnFHIKQOHtwNbEVUgAFQJI=
Date: Thu, 20 Aug 2020 12:30:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
Message-ID: <20200820113015.GB5854@sirena.org.uk>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
X-Cookie: Dead?	No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_073049_587124_23D3AAFC 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8827685285842905439=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8827685285842905439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2020 at 03:53:42PM +0800, Gene Chen wrote:

> +properties:
> +  compatible:
> +    const: mediatek,mt6360-regulator
> +
> +  LDO_VIN3-supply:
> +    description: Input supply phandle(s) for LDO3
> +

Only LDO3 needs a supply?

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8+XscACgkQJNaLcl1U
h9AlBAf/Rg+0tMXV5si2xJ024erGWC2hIyYtwI3+xCyY9sHhRgfsHGL0OavnQmH1
XrzrHV2HlLPBpDOAsKc9FlToTqLxXHp6mWHlyl0AUgadrSqjIJKXKk53jrbAbWIo
fx5TFc4o+WblH6MYd5sXUo5l5yzwESjU1zoT67WS4rIt/oVKOn5+e2VRUA+Y3nsy
ThaA4Y1uYFRnH0IMEjw6TrHwWCHmDsSPoiNhcmt1GyQYrbVuroV3Nz4iQNS8MJDN
zntnN8oAuDDVkPHkrSyY33fmOfKO+p7myQ+M/fR7E7gZvCNWU0f2D0hBTTLOmwXJ
skfkHi2rhY3HPyKehk56JaL72atI7Q==
=vywJ
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--


--===============8827685285842905439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8827685285842905439==--

