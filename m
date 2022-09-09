Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083F5ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0Nh9TSTVTuxdZWi8Dbgj9aIebrzI0l3cSRsCgLMXIk=; b=XQPJkizRM5YCWrEONiost8v8Un
	tRPJQNm8R1hmjfgfc3EvLNQgYDnCEttlEKLHHkmD8L/BldHqX+Q3Vd4t+MGmLHjkNafnMroYAo3ij
	0IuunrnM36c55/PXO5hGF5Pkexy2z1qEv0jjpEsRwxGJOzB50dN5NViSGH5nAseT0g9kbQHC2zNSJ
	1OqFNiFcRG3ZMeiDafWDAy43jG+0maaxjQ3/BjK0leQg8amTs8o5llPJGY+ZTZ4ICNehICuxxKi+i
	fDMauGMjRFHnB/X6n5NGelxFtjWsH4tV6UqNYwNPXRHThHyFX9GToMevae3bakmmPuuPSzbwDLPt5
	GFLmzEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWlWv-0033gu-EH; Fri, 09 Sep 2022 21:27:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWlWk-0033cV-9g; Fri, 09 Sep 2022 21:27:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2663EB82627;
	Fri,  9 Sep 2022 21:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81DBC433D7;
	Fri,  9 Sep 2022 21:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662758822;
	bh=u0Nh9TSTVTuxdZWi8Dbgj9aIebrzI0l3cSRsCgLMXIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvvJcbkZ/tG3EaIqrWFPvzsk5M34BxgnN+Eh+8UUkwXmfAium6lM9+kCrqCYiikjr
	 dK747TwvDbux3CcinsBpx+wF08lzMzQF6oMs2cSxD8PCP9m3wCBoDjyRdFTbfM2emT
	 o5jeHMbAjrsM3gcvNBniW2ZAxqoXim2ZKYni9Ge0S5mJ+6PO1sVnDqSQmaxW0shDoJ
	 gBdLuHLyCjofEBUnhRY4nWVo2exWF15IDNWz9JywMbrnay1IFnOQV9V5XJjkyiogdW
	 HoUMQur0TyUQ1VMKb/xEU84hfpt++PAn7jSPEhgi1RhJDAuHT0gN+JpwRyhS10kocZ
	 cjdiY7IU+6mxg==
Date: Fri, 9 Sep 2022 22:26:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu Zhe <yuzhe@nfschina.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	liqiong@nfschina.com
Subject: Re: [PATCH] ASoC: mediatek: mt6359: fix platform_get_irq error
 checking
Message-ID: <YxuvoTEXIshOy+C7@sirena.org.uk>
References: <20220909064511.22343-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gGLklRiEh69K2ySa"
Content-Disposition: inline
In-Reply-To: <20220909064511.22343-1-yuzhe@nfschina.com>
X-Cookie: May all your PUSHes be POPped.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_142706_519061_DF764229 
X-CRM114-Status: GOOD (  11.09  )
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


--gGLklRiEh69K2ySa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2022 at 02:45:11PM +0800, Yu Zhe wrote:
> The platform_get_irq() function returns negative error codes on error,
> fix the checking.

This doesn't apply against current code, please check and resend.

--gGLklRiEh69K2ySa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMbr6AACgkQJNaLcl1U
h9Bf9AgAhvx/rf91KwlZu2N+8PgTsgM42+GZFA6dK9i2ML+gdMa5aYMUlrsQ1phE
fDgTHlDCuRzu4v93hZldk3WCpHvYYs4yoA6Tbx6d6VbQ6xnsyR/gT5FNlcuyRPN2
Nydc7LMN7uPP22r+8IlzVK0LaPj5x7rSW7G6csoFgHw3C/2VgPUjOBE2N97xs6kw
RdLU5tCIrKRvhSlVgCaVrMe/mCNAHqoXY7BTCv6nowNfdQ1gfCwrzcJAh6bfrYH1
FWI60cRcGnYyCyZNeG2bn7ZEG2/zv6nMXxAIqhJXnNnJNd5K6dzaBS7Q3M/3sFsz
kKKEzwz9vszxXeeI9vzy0QbT9dv18A==
=s1Us
-----END PGP SIGNATURE-----

--gGLklRiEh69K2ySa--

