Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DECC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrNdip0xbegVVlOqR8agmJ+S77ZMuuDeifkGOEZ2+TI=; b=oK5vQbwjJ2gaLvGDrjYm94wz7S
	Z5YZwm1F6+tj+i3cxSdnkMR2yp8PiloRqBqno3Q+QIVJMo3B/KKlu4lPp7Tqu1sXRJf20sSo+5XTv
	ZD4Xsac+rjtFiIl3xx+mXhdS0R99rnjKKsGra6jHu1FiDSHxFLrj6ZOKM7v89/xmGYXTMN8sLUk9G
	zBhBJAGxhYRFUoi1ccRvXC2BuD69xx0y30kLY8X+fsAyXSfLFNmZNZfJoreG0DmOLIEN0jMTY1WA2
	5mGp+HTomL/VkuLkW0MTg4Obfzf0oEFDX/5nZICwio5f+86BEJ47n4aUzNIL8c9kONJVdnlyo44yx
	PXVkx4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o94bd-00A6JI-D1; Wed, 06 Jul 2022 12:58:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o94bS-00A6BT-1O; Wed, 06 Jul 2022 12:58:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F3E9B81CA7;
	Wed,  6 Jul 2022 12:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A908C3411C;
	Wed,  6 Jul 2022 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657112279;
	bh=QrNdip0xbegVVlOqR8agmJ+S77ZMuuDeifkGOEZ2+TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9Uig1t7Ar00l00Xt4taBoCN6h5RQu9EZAnamu3fXB/uTXiccnGvppLS0jB7hHFwT
	 R6EgCw1YnyZnV27o8IufOEasTu1V/4W0a2exQ0itloEXU/4Ls985hwAu0KFLeRe5X5
	 9E7J25N/jFGJXtz63JHueVtN/ibiJyPHbVTgYOwik9BJH++cP14ve0p09F/aYmTCr9
	 oV6LTQ3RSqgQ/tPvYNR2Iifqa8NqiLWDa7SqekSZkXXhfdYA6eHdurHqbCt/EuaVPK
	 Bm1NTBotjtAIxC2i6JL1/bZESfFwBOsYJOhoZe3cLB7mL9aOJ6ckd/LfC2nHgo7xWY
	 vaeeeYSWrKA1Q==
Date: Wed, 6 Jul 2022 13:57:54 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 RESEND 0/4] MediaTek Helio X10 MT6795 - MT6331/6332
 Regulators
Message-ID: <YsWG0jfqAf4EqojE@sirena.org.uk>
References: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
 <YsV9IerWCoa/xtwM@sirena.org.uk>
 <57367b11-f2d4-476b-b92d-16c1726316c0@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MIMUgHtOMspXsyrA"
Content-Disposition: inline
In-Reply-To: <57367b11-f2d4-476b-b92d-16c1726316c0@collabora.com>
X-Cookie: Only God can make random selections.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_055802_286424_560D2114 
X-CRM114-Status: GOOD (  15.51  )
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


--MIMUgHtOMspXsyrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 06, 2022 at 02:49:56PM +0200, AngeloGioacchino Del Regno wrote:
> Il 06/07/22 14:16, Mark Brown ha scritto:

> > This previously got 0day failures due to missing dependencies which
> > need would need a merge with IIRC MFD, I see no reference in the cover
> > letter to dependencies?

> The only blocker for this series was the MFD patch, which got picked and
> it's present in next-20220706 (as you suggested me to resend when things
> were picked... I decided to wait until they actually landed on -next...)

Right, I also said I'd need a pull request - if I apply the patches
without having the MFD bits they depend on in my tree then it will fail
to build.

--MIMUgHtOMspXsyrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLFhtEACgkQJNaLcl1U
h9ALhwf+LcbvrKU5D7gTwFnixM5NNn/A9PB/fB/gEcbgteuZ6nZvu7YIWEjhmeik
ZSY3RIskvA/4Ms51cN1SlkhylcUXcqeT5+/p5iI4Oaa6UEfvxtN1TE6rWwaLU/9/
7DbQEJJdZvyEm5BEI51pGX8cYLlacS+izmLX28NNXB6gloekTUP7212Ip8x7FYas
yTQueiiLvH1oUJfRRnqp80BoT12VnABkilqA7RLAVpn4ZlkmOqC9Fd6v4LVyBv0G
QV7BPsE+qpR3K53VEGqCRhkmbf5elbDpf5FGy5FVsb3izC80yUT2RDY2FELtXwD3
n4McJcj/rC50Pqj1PYrv7xOy4ErKsw==
=BF98
-----END PGP SIGNATURE-----

--MIMUgHtOMspXsyrA--

