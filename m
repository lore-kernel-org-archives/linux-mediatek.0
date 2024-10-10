Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6CECF11E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGOOf4EC0zuu8RbnWw3xaV6uo8zy6H9y8REmnoNyEFs=; b=YfU/IBGd2Z2TkB4zG1N2FW+ASd
	p0cRj518POP7LZhXljD6JfTn7fSG3Uh1p2TnNXqtHsHDhmwiS+pyc5nEEgp26CisafthNMWMM729C
	HCvItTVhtDbWrrRpnKPACE4bKGfTv5vQ54DOmfu8e0lE9xH4lquYxsoHx7KRLV/XYKgNdbAk/CITX
	fVSqYA0v5aQqo6+4xttp2YTp5BQffKp0HM3izBPglziZ71qd2RD0+pnKjnf86DQdaEO0tX5M+fQRU
	r4XVu6fsXYznHz5Z2iDCGX9Xwfx8aMT+tLoEs/FbPUP8xRifNV/2rSP4D3DhR+ne+g8p6kinRHLHH
	LuO+f1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysuC-0000000CrAu-23sW;
	Thu, 10 Oct 2024 13:08:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysdh-0000000CnGc-2aze;
	Thu, 10 Oct 2024 12:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C15835C6024;
	Thu, 10 Oct 2024 12:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64228C4CEC5;
	Thu, 10 Oct 2024 12:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728564692;
	bh=lGOOf4EC0zuu8RbnWw3xaV6uo8zy6H9y8REmnoNyEFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vpy3bAOVBMeKkTsyW7LZGM3ZBkabxx8Cr6HvGiGdW90KonyFWY3QULsvObyP+miH0
	 O1+cTJU0HSZJTbMMeT+FguCjUNCB3zq2PlpDiWGnashDkXNSPpSKZaYgaliSq88U4J
	 5O5KyqgaRf85iRqn9TdnEl7EiJGAXOCbPPmyWS39Yyiiee/sZXBvBdax38olpqePAt
	 9/CxjMhz3TOPRBqALJtnjEVqgStcZoVj1vFf3to+8myoKMPJ3h6lVBAr8ZR/9uC4pE
	 P3epQ/30pRNkxE9bmlraepYOoa7s2oZ9B1hn0Mf+gYzQaZB66d72GlT27n39y4zL6N
	 gO/3oLetcbKSQ==
Date: Thu, 10 Oct 2024 13:51:29 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?5ZSQ5b2s?= <tangbin@cmss.chinamobile.com>
Cc: lgirdwood <lgirdwood@gmail.com>, perex <perex@perex.cz>,
	tiwai <tiwai@suse.com>, "matthias.bgg" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno" <angelogioacchino.delregno@collabora.com>,
	linux-sound <linux-sound@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: Re: [PATCH 1/2] ASoC: mediatek: mt8188: Remove unnecessary
 variable assignments
Message-ID: <ZwfN0XMKXiHdQ9Pg@finisterre.sirena.org.uk>
References: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
 <ZwejOZQlSsWbAWBg@finisterre.sirena.org.uk>
 <202410101755089538782@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IVUJFxDf0VwMWooe"
Content-Disposition: inline
In-Reply-To: <202410101755089538782@cmss.chinamobile.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_055133_724427_4F450C1D 
X-CRM114-Status: GOOD (  10.38  )
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


--IVUJFxDf0VwMWooe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 05:55:09PM +0800, =E5=94=90=E5=BD=AC wrote:

> I am sorry, it's my mistake. I know the rule, just mistake.

That's fine, could you confirm what the situation is with the second
patch - is there a dependency between the two?

--IVUJFxDf0VwMWooe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcHzc4ACgkQJNaLcl1U
h9DrHAf9FM3gWVAWg+opww6HBSJ+X8+j0aNNvgwBkAgULdM8skCLi0W9mNH1z39m
sGUfwYUTg2li+Q9nnHk/+WonVAByplp7pT/utIxuck44kFyFw1BWxmxbUdnR80al
au8TgWuQ7MalsggRGMOgLh+DmaF8mZXW/29hME5ecMRXm062mghN8T0dAEioxkp+
9J3ItMbFnRltia7+5bF/jY2aLC3DkYxjcmTkDK2hC3hvSG+YsiE+QOGb16EIvHWq
mxBXuNY4IptvkNHYqkk1WlhQ/JxvRwgkNrIEovYDeas7S0+nakOSyzvwi+DJVnVG
1RCHTnxXxbvSxMMlu+FS0HeYkiIW2g==
=FQKz
-----END PGP SIGNATURE-----

--IVUJFxDf0VwMWooe--

