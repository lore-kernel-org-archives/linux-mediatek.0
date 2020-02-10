Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD4DC352A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 14:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C333C206ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 14:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uFKryjci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C333C206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=syS+YKfWN0eyuLTC13kxFUvIO6D92rsy1unIDY8tgv0=; b=uFKryjciSkclsCJJVm/s/BAFb
	G1bgcxSbngvbKV1D3vV93szRpoNuruyNY4ye7BCqn+Zm1svz7xu+0OEqcntB8N0pU7H6FgpPh62EW
	RSJ+H3QLLRqkQbeZZQGWdzWFbI0nTJIYo6rMThRcz7l51DDn5pyvOf2KF+ZysxizNGrZqTXWEayqn
	Ltn47k+fUxJME/cpeBfcxf1NoZ1tvqebIG0j7f7W3ZzB4ImWOHNyIiki/jviPOH3RiGZN1Egu3CvH
	noCdAOws5h3S21g4ywhlfYYKYPELiS0pljX1tFlRXA8P3sgKM8J+0iYOEDz2jFOb+EKgACkOpHVmn
	8Jd4u9jFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j19bt-00079g-17; Mon, 10 Feb 2020 14:00:25 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j19bl-00072k-Kh; Mon, 10 Feb 2020 14:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAD291FB;
 Mon, 10 Feb 2020 06:00:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EC1E3F68E;
 Mon, 10 Feb 2020 06:00:16 -0800 (PST)
Date: Mon, 10 Feb 2020 14:00:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v4 4/7] drm/panfrost: Add support for multiple regulators
Message-ID: <20200210140015.GM7685@sirena.org.uk>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-5-drinkcat@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200207052627.130118-5-drinkcat@chromium.org>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_060017_726452_FD13CB67 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7648841744038097791=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7648841744038097791==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bZ2MuwyI/0uB8yuJ"
Content-Disposition: inline


--bZ2MuwyI/0uB8yuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2020 at 01:26:24PM +0800, Nicolas Boichat wrote:
> Some GPUs, namely, the bifrost/g72 part on MT8183, have a second
> regulator for their SRAM, let's add support for that.

Reviwed-by: Mark Brown <broonie@kernel.org>


--bZ2MuwyI/0uB8yuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BYe4ACgkQJNaLcl1U
h9CfMQf/QzQ87xi7iHEnbkDh0DvfRVBElMOh5yZEs/7vrCKXq48DQSPhy5qTSNe0
ELgi8tL9ZNzBSrkpyMdv8p/CS1J0sFo84mWLhKCukEMsBUzk5xzH0Bl8IaIq12ia
zV3bz3qMfraesjQ4Epu79BurC/81bsk+7Yr51OIajamncY7iePAnJOUdA3KsCNVa
89Klh4Je02sA9pUAg88IEA72n+YJ1Cm7S7xtA5FbJJf0EzNyD9WKY6tF3lF9bqts
5w7iGUDPe102X5urJGl38NliUpk8nkjFvREH4kDcOoyo07yZv14YGpiiqCcC3KD2
4NbAUoMEmAh9tXfdABSgDX/n414tSw==
=gI44
-----END PGP SIGNATURE-----

--bZ2MuwyI/0uB8yuJ--


--===============7648841744038097791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7648841744038097791==--

