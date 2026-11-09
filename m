Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24756606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L6FoSa9K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqQKiMKn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CjOvZKlvZft8qBVkpgInrkwiduQn9vDLXCRBkO1lIrI=; b=L6FoSa9KLQONVYih9uAheSFAMR
	bejgY6s0a2JaVuOQex+o40ZwAroteOBfU0IyV4j/QtutI6ap1esbC+B2GqxZ48Rd3OZ9iKI/LmfPD
	ZX3FwffrmQQP9ZdhRvWGc5uJgv8b3WiNdxm8eEtX0C1pGIrNIKO/fRZ76v2L2QTY9NMeGYJf9FViA
	r/jaEi0j9QyW7gTsYtnmvjgn/gzlNT7Tu1b39tBZROL5ypL5yjlxK3V1chzVCL8o+q34sAq2JhnYr
	1PEuMXbqcO8jFBj6/04m92QXysdDGqxccglcjOtyqK4IYPgmgEsZ94+nFx10/ACKfFuIz/cgrsWwX
	SEC02c+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO1m-00000000arn-2To1;
	Mon, 09 Nov 2026 11:59:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO1k-00000000ar4-21Yr;
	Mon, 09 Nov 2026 11:59:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7835F63095;
	Mon,  9 Nov 2026 11:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC7F1F008BE;
	Mon,  9 Nov 2026 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225547;
	bh=CjOvZKlvZft8qBVkpgInrkwiduQn9vDLXCRBkO1lIrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LqQKiMKnWUnThuvM6vcThPSJ4kddSJeQNoYgTNVLXct71OrwG1zaWznekW2i6hQUc
	 Qiij5xuYWbfMio9OLPEeDczGJm/cIQf2pqUznQMjIYV0nE4u5+pI9A2W5myaYD/Jxo
	 MFmFd5XDjv3NoN494RQG9p8eG1ikn8U0xl+MPbmzAIxMlh1ZeBaCPIxSydmJqhfMyi
	 YR+QZ8MZ0j8OvsHF8V/K5LuPoNAx1ItX3PkYOxrj/r9O4wdBOr2GgN1fY1VmRanX95
	 owCdLypLmIwjMfpk66ZrSgEbiOgSaoOWq71f8Mo3x6id3ofgn5Ra1+Hz0xFFnYQtcE
	 iSEKagEMLNbSw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 79B892D3F6C2; Mon, 09 Nov 2026 11:59:04 +0000 (GMT)
Date: Mon, 9 Nov 2026 11:59:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 0/1] ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI
 jacks
Message-ID: <d92ec73b-9a75-4301-a0d3-b849c3184673@sirena.org.uk>
References: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l+9r/ggjKvtaRv5j"
Content-Disposition: inline
In-Reply-To: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
X-Cookie: Whoever dies with the most toys wins.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--l+9r/ggjKvtaRv5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 11:24:08AM +0800, Cyril Chao wrote:
> This single-patch series declares the MT8189 DP and HDMI jacks as AV
> outputs, matching the status reported by the HDMI codec and exposing
> the video-output input switch when jack input devices are enabled.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--l+9r/ggjKvtaRv5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavG1gQAKCRAv73Ows9A4
iQbeAQDm+zJK/irl1t6ZLB+k5GYfuInzTNEv71Md4KEhZ9z/9gEA1QrY700airU8
muU3Y6OQLYfWh4wxCJhLygKL+SWfhwY=
=NFhw
-----END PGP SIGNATURE-----

--l+9r/ggjKvtaRv5j--

