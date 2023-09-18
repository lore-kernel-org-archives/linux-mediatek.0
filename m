Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD9CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K06M3VCr0WHKqkg1Cw3llw5aRxi2imdgpuq+0caHVrg=; b=TQN8y7skg/knToHU6ICHah3z5U
	g/5xey5OzIIXiybRH/Fu0UW739Mu4pNNnFrwpmM1YvKy/bs1f6pZbn7UIKDiW/n3R1Ikrjyjw/R7I
	1KklTKmIDNZmC8pALAdTZD693kPxLURJmtEsd9R3iquWa8X/brSTmXavhxR/Kj7/pUnLVWfYfq6Al
	qanwHFUO2FXtMhypK8GWJY7xqafFQy8jLImONRl2VUCbMsvaI18ngFSzrA0e1tpPSunX48hB9sLTp
	/Q81DYA0gFz/v17b5wsfrBMvbQB1c1TWhomLo8DBiUHvG98JBpY70zl9ylX/yakxOjf63p/fh1tZt
	lq1yk49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiELl-00FZhX-2P;
	Mon, 18 Sep 2023 13:31:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiELi-00FZgm-1l;
	Mon, 18 Sep 2023 13:31:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F382B80D13;
	Mon, 18 Sep 2023 13:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCFFC433AD;
	Mon, 18 Sep 2023 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695043894;
	bh=K06M3VCr0WHKqkg1Cw3llw5aRxi2imdgpuq+0caHVrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIkb50CwTmrvliTx4dhLfE3sM2zHntXcc0rjgJrTIRi8nlkvU6XdOzQqvcqT+6Vkt
	 OgR48Iq/Txyw1RuyjMqQVmzsd1Ie1EcSSdnp9cZBHzl0CM7Dlw5i9ULq9wPbkRCpxu
	 /vt1twaho0ZShLhc8ohWqIPFncebh3mxB5aJW8cbAlDLnGMMxu7EIf6ZHNrxfZuxW2
	 AKwrw2lynoZSQC68AqoU7ugpRuE6T20273oWoqJ9IgG3F4r6Anwl6mmEHxclDKBVPE
	 DbhV572jaEE3ZxlhRXnKJMFVR74bB/bQ5FbZ8U4UkSbuDNgkgaBC5XVzytS8F6PRz2
	 NXP+esALPesUQ==
Date: Mon, 18 Sep 2023 14:31:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Eason Yen <eason.yen@mediatek.com>, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] asoc: mediatek: common: Remove check of return value of
 mtk_memif_set_addr() and mtk_memif_set_format()
Message-ID: <0b94717e-1198-4b6d-bd64-270dbeb92f79@sirena.org.uk>
References: <20230825153650.20923-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DRbDaKLEClkXmGi+"
Content-Disposition: inline
In-Reply-To: <20230825153650.20923-1-adiupina@astralinux.ru>
X-Cookie: Never kick a man, unless he's down.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_063138_763190_1B4891A7 
X-CRM114-Status: GOOD (  16.90  )
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


--DRbDaKLEClkXmGi+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 06:36:50PM +0300, Alexandra Diupina wrote:
> The mtk_memif_set_addr() and mtk_memif_set_format() functions always retu=
rns 0, so it is
> necessary to remove the check of its return value (which was
> probably specified by analogy with the check of return values
> for other functions) to make the code more readable

If the return values can be safely ignored the functions should be
updated to return void, if the functions are returning a value it is
sensible defensive programming to check it.

> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: df799b9502ed ("ASoC: mediatek: common: refine hw_params and hw_pre=
pare")

This is in no way a bug fix, please don't include noise like this - it
causes people to waste time doing things like considering it for backport.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--DRbDaKLEClkXmGi+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUIUS8ACgkQJNaLcl1U
h9B5fAf/Wt1o8/BD/FOp0dhg9MPqSJ4CExDadYY8vIXEpw9Txy/tYSjqR1VbchGZ
OBfqVnvtKgqQy7XgNCLffYhzsq1dCkQO1TDWU38imdMCCYswL7+MfBdxA6ZqqQlK
GGChui6/43ql1XZ1rQ76ZQiuNo4SEKVf2DmcPNee1CiwIoTm7JPVQcWL7SDXAHnC
v+GQrwEVj4BHZzfWuIa8vuoHf/GdYpGWuUkVYPVxS4/Wsd3NoKMQ/4O3ajJOQD4g
F/2uzEi9/y6EX0/8n8xIJ0+vKtPtvuxR5Y7aKnTU509sCU2TQgOEGzAfqc13odCj
3xhnA7V0r+I66VKwPZXUCimV2+Jhyw==
=uuBR
-----END PGP SIGNATURE-----

--DRbDaKLEClkXmGi+--

