Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A635C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fgKlm0G+8WGoMRZqsVbzcsJbuj3EfsJIbIyfKGJR6g=; b=ldC22VCp8p0VRtUI8jz4NApTnm
	KbobDKo20QHkOWnC8awg0799K+I5a+wm9XzkWg4FIV+dB8wUl4rcOmPuYk5vvKJa3POU+An4eNHkn
	3mQXWIGkE1B0fWcaEZ1QrwGhdAWJrbs/HfqO/zsvk9XUsEqvrVJY8VMeEaFlwTGLQ0HWigMo4EvUv
	8ohOsEcvMavb/kjhcwFfaC/xTOUGuNB0Wbi6wOi2srYc2pvS1jbkkdrnKv3XyvYHCquAZw3KI69ei
	Ecay0kdRTjkN7RVB/jRq/PneM839wx0NEOpwbcG3xy5LZWRz/ZZ8BLM/BDa5GyT8AcOpFokK2ac4H
	s0fz6yLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93xb-009s2c-QV; Wed, 06 Jul 2022 12:16:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93xP-009rxV-QS; Wed, 06 Jul 2022 12:16:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCBB961405;
	Wed,  6 Jul 2022 12:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFCBC3411C;
	Wed,  6 Jul 2022 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657109798;
	bh=5fgKlm0G+8WGoMRZqsVbzcsJbuj3EfsJIbIyfKGJR6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGRvBzGpYTzumBNvTzv6Eue1beyF5ALxTKiqmKi/DznjkoUpbt73aXe9FSGRvoi2s
	 EaTDs0UoMLcClhosM5wHV2q9KRNY1sw217bBfg5Pb67fbeQPmxCmKw4G6dVXL50Y3B
	 7WimtQqEWjaNRg3m3vtJ9/n9tk7d84VNfQJmOJD/3Rnz/ucFoA3xd++wNKcFHZxk0w
	 YoZNNh7rSkXh+I8fRUcmhnT2IVIeHVCoHzjjusLyeU1pss+4rJUOQrkD25ROQ0D80U
	 6IWvIcVjhsxLJCOrexoqTMy0ewRYr5E3508D/Ueemaz9X019qy8guHvRoVjY8UiM9x
	 X4yhye68/zUCw==
Date: Wed, 6 Jul 2022 13:16:33 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 RESEND 0/4] MediaTek Helio X10 MT6795 - MT6331/6332
 Regulators
Message-ID: <YsV9IerWCoa/xtwM@sirena.org.uk>
References: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3plkxhfqWD9h66t"
Content-Disposition: inline
In-Reply-To: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
X-Cookie: Only God can make random selections.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_051639_936874_540AEFF3 
X-CRM114-Status: GOOD (  11.83  )
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


--u3plkxhfqWD9h66t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 06, 2022 at 12:09:08PM +0200, AngeloGioacchino Del Regno wrote:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.

This previously got 0day failures due to missing dependencies which
need would need a merge with IIRC MFD, I see no reference in the cover
letter to dependencies?

--u3plkxhfqWD9h66t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLFfSAACgkQJNaLcl1U
h9BLEQf/WbdGG7PHABzm2fm6ugNRQfoy3Fefmeh9klqvS9ZuEOev+7iE6O7PQDpK
0v+Sap6zB7+L1A8+B4LVMgunnAVfmGClRhY8/FaJXjJ1dF14sOEvn7yW1GFMmqrH
XisVnT2VK3CxZSDab9gfpt+rUqanrXLFhTTgEYzEek4S2mSP7wUt4MWgwNU+/8sY
4BLly2rUWlwYVoiN+6IbM/bqHnFvipJdNKiaYGlu2iDk+taD47Yof/HIt+Zchh4s
tTvWwbQLAIKXHoiQHPLmRyVpGiJqjZXRquzMMVM8nphi0LNsXKpMGq/8hPxe5I32
VVvI0DvdrZ72C+eQhqIqTnJSDDzeIg==
=P5FB
-----END PGP SIGNATURE-----

--u3plkxhfqWD9h66t--

