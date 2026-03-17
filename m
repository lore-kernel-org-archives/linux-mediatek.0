Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C93FD875E
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17QQxtRUtaf7KEtmNuQbCZyqj8LsLetQhwKYrcsm9Tg=; b=Wu4v4VpXHr1/YoIpVE3kM4ldgq
	Ur1jXEYwtyo5zqUx1bWc8SCDniiIDmoUEhBwv8yTMl4r9Qw17+zsKlWAFY2CY/vTvKqY6htqs8ahz
	JP1uLO3n58S7PUqP5P5DGmk1u5DhmUDXSC2yar6XVrMQMovn9l+LaQpc3nLK1ufuMbF06zg38deOT
	DEv89akNlCv8xMtH64++OSymAlX7bO4tkGn5Rj8PiOMcwHB1jI17uiFvc2svA6GGU1hnzF2Tk7Kc6
	m7o1gijH+JH84K3BrUzl5Ku/2WDLY6VQi7uahqT3shkjLiBGAKEZbdemogg713I3ZLQXzjmlRK1qZ
	clsFIabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UKz-00000006PNK-2P2R;
	Tue, 17 Mar 2026 13:19:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UKx-00000006PMj-2nVj;
	Tue, 17 Mar 2026 13:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7BE660018;
	Tue, 17 Mar 2026 13:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61E9C4CEF7;
	Tue, 17 Mar 2026 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773753593;
	bh=17QQxtRUtaf7KEtmNuQbCZyqj8LsLetQhwKYrcsm9Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryqgogP1Js25YVHvobHnOKBl5MYdxOSD2aOiI1tf6rJQER5WihsK9Uq3jfo6Qlf2b
	 BtONs2A6D54IA4DNEv1Sy0CY6z9gO4p20SThPPkHcwNdCWn5jr22BFpMDOYrAoLSbq
	 sgZTC8u9xZQu4B/IWVM/GrLwf4dd+exti7RlPqEl4f4czsv51D3od0djhhjvtRmmTC
	 WYdwB8SCN+QNUbefFUPZOXTmnR7msjPL2f9KXr88ikHvO9/N48Zi3PI1IevuuXxGuW
	 Jg7rPyI7R0lNjmB0khjEhzaAAgXytb9Tc7RPeU0j3kdsOWVHghNIyu8gn0Kf3R8YE6
	 65mGvnUDWFheQ==
Date: Tue, 17 Mar 2026 13:19:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 01/17] spi: axiado: Use helper function
 devm_clk_get_enabled()
Message-ID: <00540689-fbc5-49cf-b185-5af372f7ef0d@sirena.org.uk>
References: <cover.1773733017.git.xiaopei01@kylinos.cn>
 <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8+YRHFs8YF4SBCDe"
Content-Disposition: inline
In-Reply-To: <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
X-Cookie: Must be over 18.
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


--8+YRHFs8YF4SBCDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2026 at 03:41:43PM +0800, Pei Xiao wrote:
> devm_clk_get() and clk_prepare_enable() can now be replaced by
> devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
> longer necessary to unprepare and disable the clocks explicitly.
> Simplify code.

This doens't apply against current code, please check and resend.

--8+YRHFs8YF4SBCDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5VPQACgkQJNaLcl1U
h9BDXgf9F2bMcNxWFiGlImGG2lAZ6+rhIz0gb1xd8L/zXFcj49GbT66gTFF+vs6Z
nJhYnwuUnf46hnhc583pZ39MeS/psE2kjIaTNiGva4NLDwWkiYkn79oJk9zepDF0
9HRb3mjyaDDPQtfCgnrkTb2VZObD/41CWBtZ8x5JxjFwHkIG776RlhYJUU2y2myN
oAvCWPJddLcAOZapamPyu/LZvMwFfhWgP4mAr81G/th9dO45ELAiKqMj33zN4VzV
yJ4r0AY9ZSXuW+NmdztaukKEKWwKGDeT5I3vRWqSJ2EvkvODgAw209d76768VQ+G
JJtidlXADpZe7vD4DCReLGZERU0QQw==
=AabK
-----END PGP SIGNATURE-----

--8+YRHFs8YF4SBCDe--

