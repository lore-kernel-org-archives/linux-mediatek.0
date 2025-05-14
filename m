Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5DCC3ABCC
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQBOK2idp1nxsNCCEs74fOX/cJ4nuhcieBGWeFG1D/g=; b=4rH/DW1HgO0ZstkOZHCgwy2klv
	JrzLMaGpyWNsfqlt2ZGKi09+mRPNgfTNgFfykUwQprPH6uB6X0Tqwa24oY06PQgCi8yDmn+f9AWDW
	xmCX3Vb5mKpkUtALhDJk/2A9Z6ySIEHs/vcJGNkoZpa/EA+XzTSObWlFc6QJr1NbZm4YYgNL11YvG
	n5yXjhtrTZBNGURsQIF0KxF0/0B9K7UAvmy4uI/QfJhP1Nefm3y7qwewf3GS6NqfUmBAXN66hevnh
	VZo0InEboX/jRkECbp0zd9lJKbgtzVkfEvYWER7PZKSOOmxvitJ7YcweoY5MNQBDRV4YVt2vwmvXP
	BskqmzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3b-0000000Ezxm-3Rcz;
	Wed, 14 May 2025 12:17:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7sb-0000000Ea6T-0FcC
	for linux-mediatek@lists.infradead.org;
	Wed, 14 May 2025 08:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EE7F61126;
	Wed, 14 May 2025 08:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E610C4CEE9;
	Wed, 14 May 2025 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212859;
	bh=VQBOK2idp1nxsNCCEs74fOX/cJ4nuhcieBGWeFG1D/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Du1CDjSyWSoA/EGDHyC2KaC7ioh46+/frf7hBPrUuxcmVMtDLpQh2YGmf6Htgda82
	 D/1VYuweFU0f5lW1SJN0O3pk/xfVGwWGQcCoCbwPd5Nq/WNgHhAasRRtgnbpwQoyyP
	 gARh7W+PfZYovJQVDG6V1+YPmdz7UCYBLTWrZTXgNyrBqj4ULhM5PlTPqTsSuAm4lN
	 4ay46Z+yRtFYfSxTUU4wYvhuW5/2wdkQDW30QzT08o/3qT7TmoL+n9Wc62BsGIXlm4
	 C6q7kiAQ4hevMYDsCsWzCGu9VHmwvgGB1MtT+OPFrCXz10lrREuDR+h7XdxoKYqdb+
	 oKPjomluptx/w==
Date: Wed, 14 May 2025 10:54:15 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Message-ID: <aCRaN27p32c9gxDN@finisterre.sirena.org.uk>
References: <20250425082551.1467042-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RJEVfGPvKI8lIx/3"
Content-Disposition: inline
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
X-Cookie: Well begun is half done.
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


--RJEVfGPvKI8lIx/3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 25, 2025 at 04:25:47PM +0800, Chen-Yu Tsai wrote:

> This series is meant as an example on how to use macros and range cases
> to shorten the MediaTek audio frontend drivers. The drivers have large
> tables describing the registers and register fields for every supported
> audio DMA interface. (Some are actually skipped!) There's a lot of
> duplication which can be eliminated using macros. This should serve as
> a reference for the MT8196 AFE driver that I had commented on.

AngeloGioacchino?

--RJEVfGPvKI8lIx/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkWjYACgkQJNaLcl1U
h9D/1Af/XElCtNyti+25emI4YNKEfk2R9v0BZ0vK0d5J9W/iLMsLIU37Tr+WcgFA
oxm/P+uo3MjQwbQUj7c8d5XOXFtpMoUR+QlEIGuR43vkTM+e02n9CqGaY9m408WM
LHUx6i1REXPRha8FgKbFvcWsDqdSnATl04GWrGOKTXNH8QhZbLL884SCxYwZGaty
HLrBvsUYhiFN/LHz4RUCCuvm42rp4lA7/5EQ07+QEy3tHqmRYSxyegKkkQ++v3Og
EslpX2I7nIyz2X0+U0Y9rSJfYBWQR2APwqSq/AKqzlp6YkbTv9MTO6KUhCr4k4ah
F7qUWkQs6HfYygh4haJYsdX0s9WacA==
=PgTh
-----END PGP SIGNATURE-----

--RJEVfGPvKI8lIx/3--

