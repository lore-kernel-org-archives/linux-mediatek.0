Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD71F483E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11j9z/1fJKiQVdJE20P4e+j+9ToUEls87BE6rvgPEnQ=; b=W4g9sQI7EWXHdsTLfIuhvdTqyQ
	zSkq/Rzy7GOIEJ5frrQKHx0iHdbCic1Ns5SO1tXIFm2cx+PLg0u0IaBsOkz01Q0UE5I/YjblEsohc
	t+ACyI/kDSXIIwDQdNyfXvZ9yI8PKqaVWjk0mY4Meqf1IzLiMRhVM5m9Alfp8ylu9TBmTJvqJFOgQ
	jL/xcyIB48rPGdhVp/tkWtF520NjIfz6cT9LbmjSwTxAnZmCB36+D2YYYaTvY5hO+D27k3uBWCALI
	nTERMuJdBC6/YoO8NVGOxXZhz8Zz4ZoBZMjXzoJZBLXvpmN0PnI1XA8OHg1vSJpoy/y/bHgbpQz0R
	wUfB3aDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAd-0000000HTfb-0DVd;
	Mon, 23 Mar 2026 19:42:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAa-0000000HTem-29iX;
	Mon, 23 Mar 2026 19:42:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D2F7434D7;
	Mon, 23 Mar 2026 19:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167B4C4CEF7;
	Mon, 23 Mar 2026 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294955;
	bh=11j9z/1fJKiQVdJE20P4e+j+9ToUEls87BE6rvgPEnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgPX3A5wg1iUr/7tQS9xp5e6w0B25P8zSkCFksilaSdtWF0zDITP+MM+ylpxRhqqN
	 z1RrpGJ0rkK+G2tQr65a2/Xwv7EiFqD6PuLMWp6NIgNgWPZTiDGxPpc7mIWDXI+lVj
	 WazCdp1gkd01GY8XHb75ph0A9LOKxkfuKGbvWtCEABYmHzURaMEXJmTzb8e3FF9HZm
	 Yd94MYFdCPEkY0FJN62BvsxE7q/dbpPH7fE+CcgiWdhHVGeKHch8avzFVVHAHBzTai
	 26KyXPjH454gkbq++sACIjU4amKyHo63ZwM2pIugLnvvDU+/lf1hAcY1Y2JEWVzJnR
	 x0lY5DPsSmnIQ==
Date: Mon, 23 Mar 2026 19:42:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 07/17] spi: orion: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <7e9fc388-cdc3-4810-9136-9a1f33fed7f7@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <387f2fa1b3e1a356c524bb36eab07e1b431b6382.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ETAL/F05848nVpj1"
Content-Disposition: inline
In-Reply-To: <387f2fa1b3e1a356c524bb36eab07e1b431b6382.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124236_569632_528D7CEC 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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


--ETAL/F05848nVpj1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:03AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the "axi" clock. This reduces
> boilerplate code and error handling, as the managed API automatically
> disables the clock when the device is removed or if probe fails.

Another runtime PM clock managment one.

--ETAL/F05848nVpj1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl6UACgkQJNaLcl1U
h9BT8Qf/dtJjSArsGgU+y0yVED55+m8067SuMbN7WPDUHaKFWCm0BD0AB2I7w1wo
Q2eV7b7mCT9le7uw8d9NPBabofnVmISnVSpguFgRIG7YVtcz6uVBHSV78j6gcMvk
kruWd2xH7oETY56WXrEH08IbyT7W1URHbuWrZ8rHqszSMdKsqCx7ASMx8O92IOx4
JX2u0m/PftCpz/ebstkEkS86e37+yNik2jfo4cb+HhAkYYkgYUzeocNaWEixMslH
FcajN7OlPOnfeey4e2Fj7/C/S62tLwDD1HckZI9Ja3rE252BzECQ9E0U/4Ocf7ZD
kMKNWTPNhkr71ULS8mV6P4nVuyLAgA==
=fMon
-----END PGP SIGNATURE-----

--ETAL/F05848nVpj1--

