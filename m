Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0494C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 16:57:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D0D2075A
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 16:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+y7lcdx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCbzduRg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3D0D2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IlEe66IR6TX9TXv4lrYhMgqVfLnsJG4qJag6gMaMQWM=; b=O+y7lcdxvP4HYnIso9HRFS13n
	7FRxdqhZRobBJl2it+7HRPSttZXBKAMPS6Mnm07Q1IK5Up7MlyZGaFbXA6bN5V35puMAFOPxc43RG
	tOdVu9zEEeQ2aERfdPUvcZpsr/2PP9+p475bQMIHwMrHsZw3SEHFi49oZGmjPBkih/JBIOWKDSuL3
	LxzAnvJHqaAZA5KsdenHdhPArdAbwsd0Z73I9uGQRVobGZgnlAUro9Yh2ZTRF94/ZMDt1aHq/J46t
	O7jMedahwYUzkNkUAJDrbgDXPgGCWAY6ChPeD0lTwjO5qL2HhHySmxfN7YwQwXdEDVl4MZfq8JM18
	Uce1itiAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeiKN-0004DJ-Ap; Fri, 29 May 2020 16:57:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeiKC-00043b-MN; Fri, 29 May 2020 16:57:41 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BDFD2075A;
 Fri, 29 May 2020 16:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590771460;
 bh=HWaJ8knx8jrtX7vWoPGCCZuj0FJ8BoiCzWy4GdgYnO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BCbzduRgjSFdejSVXTKyb4aBGbgxLCd3Zu5BI/JY6FwKuB36l0/z0zq0mmYi3rqT/
 Lb+edgaa5BiCvyMhhB0TfzqinNJ1U0wHVILwbpMBlYrsfua9zE7rZehF/YRotogZb5
 RFAmWgO1nSn3av8C6YbepQw1oVnNsKgErWaOSO0A=
Date: Fri, 29 May 2020 17:57:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sean Wang <sean.wang@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 0/2] regmap: provide simple bitops and use them in a
 driver
Message-ID: <20200529165736.GO4610@sirena.org.uk>
References: <20200528154503.26304-1-brgl@bgdev.pl>
 <159077110913.28779.5053923375043778782.b4-ty@kernel.org>
MIME-Version: 1.0
In-Reply-To: <159077110913.28779.5053923375043778782.b4-ty@kernel.org>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_095740_752537_51BE8D0A 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Pedro Tsai <pedro.tsai@mediatek.com>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5500081348619202923=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5500081348619202923==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gqEssfNGWsEa4HfM"
Content-Disposition: inline


--gqEssfNGWsEa4HfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 05:52:00PM +0100, Mark Brown wrote:

> [1/1] regmap: provide helpers for simple bit operations
>       commit: aa2ff9dbaeddabb5ad166db5f9f1a0580a8bbba8

Let me know if you need a pull request for this, given the merge window
is likely to open over the weekend I figured it's likely too late to
apply the second patch before then.

--gqEssfNGWsEa4HfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RPv8ACgkQJNaLcl1U
h9Csowf/Yd4cPlSB5f6vZznQyt6ZA4E9LGl+xUJ0HP+QooGqUbPwRV29fAMfSDUY
rWXfSQzj8EtTBt9ukCNQLMrmsHZ8EYqD+YC2E3j7yxXtdYknq9rg4vUPXaie/X1S
D40fyHEDaMDKwk469zZbJJavMooYstd6PEkPTFSiOy6jN5X/asm1bYUH3JEJCXp+
l3b6FlrXH+RChM75PPhzNZD8GpMdXUzBUIbWwvFErM3I8OcVoLJKHHhSX7hW9fDu
Zb+jZtjHDBCfVzauWnwt1drGsDCHCAD+QXLAaMty1KJMa9+00P2fMv++2JICI0Qe
IhTFLfPiVmMkifKoF1wf6TFbu8jN1A==
=2xIa
-----END PGP SIGNATURE-----

--gqEssfNGWsEa4HfM--


--===============5500081348619202923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5500081348619202923==--

