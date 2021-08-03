Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313E4C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 19:31:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B6F600CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 19:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9B6F600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdxTGZ18uO6zoPlwUIyFI3SgFczYLoS8ZwJLLWKDaFk=; b=weICGMPA3oavKUjfEHTFEG6hjX
	3IsUCnTV3Od15ytKF+obs8lZ5fFoE2rO3nag8792lyVumwXMQcuD7f5LXHC1b7FbG+OyMDmeVC2NH
	9rgycOJGaDq/R10MS0GB6XuUlJ3nGzUiGYIXo9w6mn5SCcnobTm7qn7/TQjUkEsqEJwnjI/Sv+qgJ
	t5L1vPWMRAUMCIIXiy4tkEO5leps/a0QQCN5QS7UsW4mFSq++Zr3NI1w06tXfL2h0MTaHIcaqlsac
	rifp56CVNQT78z/NlvPGjYKQqjgFDaWeAGTDXqCHd/BkG0yGiGwI8THJUtlYT6HIy5hZ6b+PuK/Tv
	wS1vQjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB08F-0044ES-B1; Tue, 03 Aug 2021 19:31:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB081-00449V-2L; Tue, 03 Aug 2021 19:31:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36EC2603E7;
 Tue,  3 Aug 2021 19:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628019064;
 bh=QY2GEHpzXPPU0n5auFTFTfMaTFjPa4x8HiZo7mTWQgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nLiKixCz8EnFb9V5uP5sl2zskq4skQRGJDWsaHY+BjhKr6Vl/zauwb4+7GEMHEU2t
 nMSXVjmqUsApK2A+HzwrWQ3HxtMgiWvhP2a9pJNFeLgGVo1hM9/A8/Xw64V7CMjQTV
 vXFIVSILYauP+bOsMEYUTco7ZNI3ona3u7GJ2sUtXSOzBjU2ay/EWb3qvxEYDCspHc
 H7UH7ykNGZfycktslFB0KNDzdaxhQipIYUCAehTwlDN1IV3cJCl1NiL0t7HoSyhOGA
 Dm25+oiXlRm7TU8thaVxRAE76DCalCv28td2CmW0TtnT+mwUR8q7mk+BSwNH+D1xah
 akfxiBDhQao8A==
Date: Tue, 3 Aug 2021 20:30:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mason Zhang <Mason.Zhang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Subject: Re: [PATCH v2 3/4] spi: mediatek: modify set_cs_timing callback
Message-ID: <20210803193049.GQ4668@sirena.org.uk>
References: <20210803102428.6476-1-Mason.Zhang@mediatek.com>
 <CAHp75VcPhBB+21wVErWRq+mSDaCkpQBovn+xvMbXyfENnuu40Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHp75VcPhBB+21wVErWRq+mSDaCkpQBovn+xvMbXyfENnuu40Q@mail.gmail.com>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_123105_180379_AFB7A134 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Type: multipart/mixed; boundary="===============2507295074636587319=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2507295074636587319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z87VqPJ/HsYrR2WM"
Content-Disposition: inline


--z87VqPJ/HsYrR2WM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2021 at 09:20:19PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 3, 2021 at 1:42 PM Mason Zhang <Mason.Zhang@mediatek.com> wrote:

> > +       inactive = inactive ? inactive : 1;

> All of these can be simplified by using ?: (short ternary) form.

Please don't, if anything just don't use the ternery operator at all for
things like this - it doesn't help with legibility.

--z87VqPJ/HsYrR2WM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEJmWIACgkQJNaLcl1U
h9DkVgf/Rv7cu2sTnh6I4OzeDeohVJspONWje3p7I9opiL1FrbONWkc1yKFmhBay
7aUfYhbl9Z+VXUyWmuBCe668PGRT/j0a/9uVsQaKER1xNaW3BaWH5Av99TSZsyB+
J90YRP+TqT9G60dD5jgHodAJ3jEJePoU+7CXCuR4OvhBqdn7SVLD0BMBiwH90cOg
CeyEHO/go1UN/B+CZbKds2d1/uYPh2wmH2JHsmxoYFIRxLKdQkEVpRgTy13dnzy2
p2doLPsVrdHI04N2O4yZKEZrmi5YEtReig8tyGRjMYdP1bC//tLdw21Fy49CsFxD
e8hBwYgr3MfOaL/EW96PbEdXWRGaKw==
=HNVE
-----END PGP SIGNATURE-----

--z87VqPJ/HsYrR2WM--


--===============2507295074636587319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2507295074636587319==--

