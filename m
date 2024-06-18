Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B78BC2BA18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5d62SeATjHecplNOyfLiZkLmKiCQxYL2JfsV9FPMqw=; b=MjQNrf9P2eqjgiJF/QoUeDk04+
	FgK5HWYcME13XVmu1wVSHShU5ZkgD3u0uGQWJaLwmzK2qxWCxh0OB/IWH/yD/35h4GO9xSPctY5ou
	7qjgRgCwtvU0zwo5zeeYdWENSv07gC5D030jl43T+xpUEOX+Py+41v2H/0tzUAArrz3TpZrwUGF9e
	QlABnEe/9Sb7Dv57uoA+oNmrfRQ3bH2fQU5pX139NP0/Eue9THXOmzN819LZgVKgPjMVTwA5z1sqd
	H2GaMSCoZZFKJhU/Bd6ZGpD/p+ftaPVKS+yKOJnQ/m1tS/zcAmVMUQNqQpE+yJxJ1Jft47WWWtIyY
	7IEXRe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJa3x-0000000FRsH-3CCr;
	Tue, 18 Jun 2024 14:43:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJa3f-0000000FRi8-3eup;
	Tue, 18 Jun 2024 14:43:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C705619A2;
	Tue, 18 Jun 2024 14:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE3EC4AF1C;
	Tue, 18 Jun 2024 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718721818;
	bh=1UwzhECrbNMlnaKtuZTayxxlZhsNfsmTEwViXahAyMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPSVDKFMc59K2ZxfIuoVRM4RvajTUeLlZ4COcsXV6z7pVsma53UwTsSN/gJwlcwRu
	 nMSHr6cg+MDveM2Mu1PZF4Ti7e/9u4fmmnlmHOcT0FvU2tJjzbTaqUKLKZiJot622/
	 SDkfn7T+6I4M35iv/e3GABSI6TTcFDcl9a6tSzRvSCXQA2XhfHrwmDO5JvPLEDcFLH
	 nzvpZRx06V6yfLpFrV9ysM7hJ/cf6gGJCCiddSbK7OgM/LBj95sq9buorN65dhNnKp
	 AXTfO1Q3tyZb2+IstKrqXQywERkXXj3bxwXKKIBBGmp6/5YTO3duwawy3VzzB4iTPh
	 LreCkpEx/VT1g==
Date: Tue, 18 Jun 2024 15:43:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
Message-ID: <77872070-6d0d-408f-80c8-c4a996b9d260@sirena.org.uk>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
 <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VWS3IQXFjAKUwyY9"
Content-Disposition: inline
In-Reply-To: <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
X-Cookie: If you can read this, you're too close.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_074340_034800_20EC5F22 
X-CRM114-Status: GOOD (  12.82  )
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


--VWS3IQXFjAKUwyY9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 10:05:37AM +0200, Alexandre Mergnat wrote:
> On 14/06/2024 11:31, Mark Brown wrote:

> > I seem to remember you had review comments that needed addressing from
> > AngeloGioacchino, why resend without addressing those?

> I don't see any comment:
> https://lore.kernel.org/lkml/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com/

Possibly it was racing with comments on the previous version?  In any
case I see it's still waiting for some review from AngeloGioacchino.

--VWS3IQXFjAKUwyY9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxnRIACgkQJNaLcl1U
h9AftQf7B2zRtt6hSQ1Xu+5FarxKtCBDR6nBW7WYRVgndY5irQ8rB15/1pKg5ik1
j0ms8fH3Q91pk4BjDrtj8z7/s2yL3YMJYPhEgKyeoUPs3lM1C3BDxTCiMvafx96y
5tQ5ad+c9UQgS8pq7lTa/xtHXfKFxdA2ABym8/DYpfn8eJ/UyM13wo1OJmW+uLnO
K/o8AJqCzj4+U0PnMPImGUQmX87qmN2XuWrHAFuwRPFsru1+w+Ii5A3pOdMwWSa+
3z9SIUmF3NriAeP7ntviKHjg9Pe8x6fqG/R6WsPkYvp6ydg8si62JAluH8e49NkQ
APIdSQGffLVEELyK6/xmm4XXm6CTQg==
=u7CT
-----END PGP SIGNATURE-----

--VWS3IQXFjAKUwyY9--

