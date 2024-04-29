Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0BEC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJZ8QasGzmijXQVkG9V9fKJa/f1XqrNRU4PDTZrp2Uc=; b=ii/aiPnJMGXCuJOkfWc/Q/dFEB
	noA6LDsmy29QR0cUTU0sKHD4SYs+DF7tsiVBn9Fp83jOAAIo/OlORLxDKDxIDcRQwX80k2PBTGnfu
	kfdITobLSEBqSA/p+cSZOIJXjZCwcvowNi+R3P7Q+0qZjg+EI6a75aQtF8eSi9WVvxYp8IWaezv4b
	TQHcb7VV6n1k+Jg9N/7xjhz5X0QImkzFLjJQWW7+RhGAI8g1vcN7z4kCJOGq/Mzrj0Ohgqi9qBh3q
	Qk5v7tuvTIFTG1Eb7ah58cUhpKqvG6O2PPf3BQVndAVlEkn4+j3aFluTW8Y+SXJ4AddO92FTbWAKt
	hkiNZwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SEs-00000003ASR-35bH;
	Mon, 29 Apr 2024 14:44:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SEp-00000003ARQ-1AKb;
	Mon, 29 Apr 2024 14:44:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10D3060DDA;
	Mon, 29 Apr 2024 14:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331BFC113CD;
	Mon, 29 Apr 2024 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714401853;
	bh=OJZ8QasGzmijXQVkG9V9fKJa/f1XqrNRU4PDTZrp2Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Un7qa4q1crb9OyUCdLgWWFuWgrAJiyu10NlOIPbgqHlSAu5OabyJzuympIYoUdPs6
	 ZOpE/xD0zuKphaxaryHG5bX1bslKr9WWvdK7Qpo3CePYkL5edQ6vIMaDCCeuKMaJdG
	 Unr+BrxRThdxZ9xwq3c70enLrL+2Z6xLcLI/4VOVQ39KBlwa/j7No45GvCubpp0ET3
	 0JFK/No4MqUSECJUFjAqu4Ok8TM2rPhxD3StLSH56Ij34VDbWB68a5+JgJWsQcdk6l
	 tP21IlUe9bKrXVI6yJuibFAAzun3HDtIbtNAN9RGOUgLXlMeq2k7kEvKuOPQI3i4QZ
	 T5cyBQycWYnnQ==
Date: Mon, 29 Apr 2024 23:44:11 +0900
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
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 05/16] SoC: mediatek: mt8365: support audio clock
 control
Message-ID: <Zi-yOzFhgKQXx9tk@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-5-082b22186d4c@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LT6g6VETYU3X2f5e"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v4-5-082b22186d4c@baylibre.com>
X-Cookie: TANSTAAFL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_074415_382736_3C11F967 
X-CRM114-Status: GOOD (  10.11  )
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


--LT6g6VETYU3X2f5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 26, 2024 at 07:22:34PM +0200, Alexandre Mergnat wrote:
> Add audio clock wrapper and audio tuner control.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--LT6g6VETYU3X2f5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYvsjoACgkQJNaLcl1U
h9CAlAf7BkKtB98FNb4ZDCugUcYlYByugcjzPafZiPbUVpmYfmvJYoiOrSDEXePb
NRZWBGpWUDpa1l+TOGWwcOQegbbwV48nDMyJnQn+CXRUvUg0dePpRmUSLsXCwB0+
X6Z+EJ9hoQ3OrqBmt1mTld6Uk5GoZWkhoJ+OcEKXoLtQJcfUUL8uCqjciW9ySs+g
ibgnMTOqccfOfUoZNYTGIKKYypfUnQHFcKV5Lk03UtWeatQXk5SUe131QsK2w5xB
8uFXF4PuB9RiX0OQEtKgENtVVwajA3M6z3euJ2RkXwqtR+klGzgUJFFnJKjJQmye
wr8Eom+wgxxY7GyPGD3aRCnBuFDyHg==
=ccn2
-----END PGP SIGNATURE-----

--LT6g6VETYU3X2f5e--

