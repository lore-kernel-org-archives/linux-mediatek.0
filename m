Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8796BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 10:38:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5457D2078B
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 10:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XI8cEj+l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTRvgLn3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5457D2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Av/VJRr+0Z4p51EUvKXcskcnlw+mBxbyBV/3hRK+RvI=; b=XI8cEj+l2cV/GOS3W5t2K7Ok8
	cQLMnl1riTmrEHGTCEgYC+4wKX96FVgiX1YnavnZ0xxs28783SN9H9GxwLH+o9XWsKVr+wKwtyrh4
	hVUrWB1W4TmWzbhQTWa+berBEAURzGm+O0JWujU3dyXeD++Z1MMPmphBdCp5OVpa234er2hyGfFlx
	q1huOZy5/rV6eOLRe3qgc2FGkOPwXOPEiGWi+FlLYgyVouSCnnvipggU4BDEebjiQFlgfnOhc7Hyn
	aUvETZPNwzUw7PueaU2Z9XSthA3Eydr38gJyR5HXBramUE/rPyNOxjKQeBWQPmaF+BREG7qLy5lmr
	EaHER73bA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqDf4-0007bR-Hx; Tue, 30 Jun 2020 10:38:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqDey-0007aU-8U; Tue, 30 Jun 2020 10:38:41 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FEF220780;
 Tue, 30 Jun 2020 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593513517;
 bh=sWaT5wPlCVsv4sYdI+rs+JPWv5UbHcVTbh4ff8ENRtk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gTRvgLn3AmW/Hwb+XzbdricsNdY/flLuaw+gfiwC6UhXH13Q7P1JRpfjplQ25rXmc
 CwwL7n5ZTqY4ZKww2QsjGQNBQ0z8gYSFV4N1rzpS3HvuXK3vIJFIO+gJ3Z/NbSlDA3
 F+lVpx+BmEA8d83inTWYYUNdfkW75NvcFh+ftm1Y=
Date: Tue, 30 Jun 2020 11:38:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Anand K Mistry <amistry@google.com>
Subject: Re: [PATCH] regulator: mt6397: Implement of_map_mode regulator_desc
 function
Message-ID: <20200630103834.GC5272@sirena.org.uk>
References: <20200630111047.1.I05d781ac794389337a4adc2f6402f673117e2937@changeid>
MIME-Version: 1.0
In-Reply-To: <20200630111047.1.I05d781ac794389337a4adc2f6402f673117e2937@changeid>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: drinkcat@chromium.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsin-hsiung.wang@mediatek.com
Content-Type: multipart/mixed; boundary="===============6949858377687127370=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6949858377687127370==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 11:10:51AM +1000, Anand K Mistry wrote:
> Without a of_map_mode implementation, the regulator-allowed-modes
> devicetree field is skipped, and attempting to change the regulator mode
> results in an error:
> [    1.439165] vpca15: mode operation not allowed

The modes aren't documented in the binding document, any new device tree
property needs to be added to the binding document.

> +static unsigned int mt6397_map_mode(unsigned int mode)
> +{
> +	return mode == MT6397_BUCK_MODE_AUTO ?
> +		REGULATOR_MODE_NORMAL : REGULATOR_MODE_FAST;
> +}
> +

Please write normal conditional statements to improve legibility, the
ternery operator has uses but they're pretty specialist.

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77FikACgkQJNaLcl1U
h9Ax/wf+IVPdecbkSUG4tbn+t4jejFDFIdL/5bQ6kkAjjxdv0pUGsaqzGjzb39hF
lJRPbQqM9XhCfRalxlLtmF+YHlxQ8LwzhfrpKi9eL+5PXRW+fUWS3EluvZ6/UPWh
bqne9EAunUUadAoM0Ra7rmSpDIQ7il/jm/ThdO/9EDIisUZGX8S3vUKSjlX9cafa
Gz5A5k3pdQtQGhFh0QkzxVLXO5CNi6rzWxkBvfmRsSYeoUmgwrbjEdnLC51aPkbN
IjgjTjohlzrU0V5zsC9OUOAneWZFqw5VJnCVC1Liczn/aYywJrcdTMoKzKMLsFJn
IKQneeidUfec36uzhtIqKaBbS6EVrw==
=kQiW
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--


--===============6949858377687127370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6949858377687127370==--

