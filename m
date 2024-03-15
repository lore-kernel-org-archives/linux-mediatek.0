Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949BCC54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7As8kexlHBJiCoMZaN5R/8h3ycXCzuAju2vZXS+EDgM=; b=cmWQavSqSHsNQHAyISXX043T53
	2gJzvJQKDkr2WE4i4X3dhIfQFTUu2CHBIe2c8Mrvrhcs97lEhBiiX/upAGzKt5BTrT/t0HAX1+Vst
	MBlGIrFzqMJPDCUBFvmE9XvXR5jtxFJZBQuo0+aS7b3XFI7o8aPi6NoLYVagObYzk1ztLgUWfMT4M
	j3uACbenP0zEyBbzxECweyfRD4qEL6svsa2/QFmQhVMkFusi6nYUeyT/KmYiwcfzoiqzmY1P2mklt
	hhh27wPaUKdgSkPlpMi3cSj2IXl74tN42GF07Mca3c2zw79ot3H3aAc/+tDSTL9Oq7Fjl4m+LBF9I
	HLJJYvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl8hz-00000000WJc-06lH;
	Fri, 15 Mar 2024 14:38:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl8hu-00000000WHe-2uDk;
	Fri, 15 Mar 2024 14:38:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8307BCE20A8;
	Fri, 15 Mar 2024 14:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37258C433C7;
	Fri, 15 Mar 2024 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710513524;
	bh=LWOPGxaWjPP8E3hvpb0v/9QUSjPMu3aHfXD/4e34bMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfLF0Y3Aw17VSoUcFU9nXUe7DJBTJnsvXRSp5JM2LcK8rgXc6Uqcotv7Rmcu/5y0r
	 /k6jI4bvcl7jt+qndKxRPxKCuZU89MT7ts52FJGGSvHCZWLkGEMpmCxiaerdnhxlP4
	 eca3MDnsqT6qnrh/36IIbVKpEABMWOLcMD840rxSlrl3WJKTxBSuQiGU2islj0xuUz
	 VXPkRyigmU8/GmAk0LgZFCWSwIVB7rmY+yJiXtDISqyjOeYDHvGXasd3yu4D+lLUKl
	 bbYt5HZZ/xwVfB+zMv4jDhP1WyyDmY5pb+X7Fmh9+K/LpfAq+PwR3Wf4s4A1UU0UjJ
	 J5HVGG/SCVpew==
Date: Fri, 15 Mar 2024 14:38:37 +0000
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
	Will Deacon <will@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Nicolas Belin <nbelin@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Message-ID: <bf418207-7f13-4ced-8c21-2824dd07fab5@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
 <7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y91BRilVEGdxtZCJ"
Content-Disposition: inline
In-Reply-To: <7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com>
X-Cookie: If rash develops, discontinue use.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_073851_088536_AEADC51F 
X-CRM114-Status: GOOD (  17.51  )
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


--Y91BRilVEGdxtZCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 12, 2024 at 09:58:05AM +0100, Alexandre Mergnat wrote:

> I'm a bit lost for mixer-test and pcm-test.
> Currently, I cross-compile the alsa lib project to be able to build the
> tests and put it on my board.

> I can execute it, but I still have 2 issues:

> 1) I've a lot of missing module in my environment (Encode.so, Encode.pm,
> Symbol.pm, IO/Handle.pm, ...). AFAII, I've to cross compile the missing perl
> modules and install them in the rootfs

These tests are both simple C programs...

> 2) I don't know how to configure pcm-test.conf &
> Lenovo_ThinkPad_P1_Gen2.conf (or new file to match with my board).

The configuration is optional.

> My test cmd:
> ./run_kselftest.sh -c alsa

Just run the programs directly.  I'm only asking for the output from two
of them anyway.

--Y91BRilVEGdxtZCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0XWwACgkQJNaLcl1U
h9BnLAf/e1vJ3Zr2d9fJBV1LV7sal34lcNVLD3JRrMKuk6bdnA2S2RYAgOf0UJwl
cRuGTcq2lBneNaYnb9jgaf1C7i5kuXvnMG0IJuqVBrTZwiN5SbGhpmdvZj6HLwPu
a8Q5MEwz/DrIXqjghxcXr5bjKi6XJ/9RRB1QpfxQFIwAOYQPNAG2F0j4SrD8zcbA
O2dO4KRIjYUBBnpP5maQh3R3yr+TEEdolkib2FyoHL2jo2Vv1zOiTK2382kuTnKA
y+GgUm8tQ4HiGZdAJqZAPh+Of86A9Rwl2133Tp1dxkFWlOamtyhfYbPESyNchUrV
qduBr5NQ0tnTuAoEKttdYckFHYq6Bg==
=FScF
-----END PGP SIGNATURE-----

--Y91BRilVEGdxtZCJ--

