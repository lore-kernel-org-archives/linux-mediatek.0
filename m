Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A17EC7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 19:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eF7rCf3BiceKus3xPnJbIwlSyusl3Zx2kSvPQz3qXQw=; b=P4Nfy7FVav5vuvygynWyf9h/Yp
	3uCpWWa8cZNU1nW8FqshBZFO0DBLzC0A+EPvDCivY5heHRwxdhX+5q+Trw9/HbVwLatQldUBeCtth
	DEz1HA6guqFaPgJa5j+VtMZkV44ucuL7Nt5qxZe0ylvm6ui2WanURlxgEgA78aiV/L6zHmDYpgUgI
	5dimNuiso07XlYMbspbBGFORwN0Na4LMdYBE8D/a/UPTFSE3Wi40Bptp7dSAN9vp82iaKA9eysdtk
	KYLnwa8GAuGc2xPNKzYYfXD7seW4A3z6PCUlFWLONmG9RI79JdeJAIdXetL4BCLFP/UAzZHohMvft
	NBllljiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdXN-003dOw-6z; Fri, 24 Feb 2023 19:15:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdXC-003dKR-FK; Fri, 24 Feb 2023 19:15:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB989B81D03;
	Fri, 24 Feb 2023 19:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3DFC43442;
	Fri, 24 Feb 2023 19:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677266107;
	bh=wvpHz3Awiez4EzQ/5a9FnelPVKhKufDDpe5+aqSfoVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4ZimhzFe113b+q2l+n7gImRPaTvekuZtWzz9EMWw4/hQKQUV+HEXMrS3hANxJ8yn
	 WqdkjEiYeWpIUNdSBNQ9QMOSW0Rzl0g70WzSSy6pxLnZA1vWq5uylWRFnY1RT+WTTM
	 NxoZJPNUXCg2qWrXw8w+sRummFlXU/fYwgKjMVi60z/5sSC+bJVcSoWWMtNaBkaJQM
	 rtIi0B7JJnzzbv388SsmJiqpS4hEwEnI7yp38zgLcm/9NHSmE0Q7/7UJg8GPYNpN88
	 IzSSj8Ea7YFGFcORBpn2dkB9fsgnfJ9dxBI0WVwCLjVflshHTns4zXSUT9BH42tC4U
	 BPBC+aVbYKQ/g==
Date: Fri, 24 Feb 2023 19:15:01 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: mt8192: Remove spammy log messages
Message-ID: <Y/kMtXmrIYoLNV8a@sirena.org.uk>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
 <20230224190657.edrvkg22gz5gff4g@notapiano>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udvt/bvCvfnRf3US"
Content-Disposition: inline
In-Reply-To: <20230224190657.edrvkg22gz5gff4g@notapiano>
X-Cookie: The early worm gets the bird.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_111510_832227_949A280A 
X-CRM114-Status: GOOD (  19.33  )
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


--udvt/bvCvfnRf3US
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 02:06:57PM -0500, N=EDcolas F. R. A. Prado wrote:

> Probably the spammiest messages are=20

> [   33.881459] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_ru=
ntime_resume()
> [   33.889320] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_en=
able_clock()
> [   34.029456] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_ru=
ntime_suspend()
> [   34.041718] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_di=
sable_clock()

> from mt8192-afe-pcm.c, so I think it would make sense to get rid of those=
 in
> this commit as well.

They should definitely go as well, I don't know that there's a specific
need for it to be this commit though - it was mostly just what I noticed
while looking at the controls that were failing tests.

> Way less spammy, but there are also

> [  176.209790] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_dai_tdm_h=
w_params(), id 43, rate 48000, channels 2, format 6, mclk_rate 24576000, bc=
k_rate 3072000
> [  176.224149] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_dai_tdm_h=
w_params(), out_channels_per_sdata =3D 2
> [  180.272153] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_tdm_en_ev=
ent(), name TDM_EN, event 0x8
> [  180.281462] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_tdm_bck_e=
n_event(), name TDM_BCK, event 0x8, dai_id 43

> from mt8192-dai-tdm.c.

Yup.

> Anyway, if you prefer to keep only changes in the ADDA driver for this co=
mmit
> that's fine too, and I can send another patch removing these other ones l=
ater.

That'd be great, I will probably take more passes at this stuff at some
point but it's very much a background thing.

--udvt/bvCvfnRf3US
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP5DLUACgkQJNaLcl1U
h9DLFwf/YAM2Ep/kv6qQZQ6+TxtU7vTdLiprq5aQtl2WrtHV1TeDyqQh7kR9Li5D
75H051WimadBJSKxF19fHEd3ISMefuIYUhpQACpS0xyyN5Dg8kbp/Kfp2HdIWLsl
Kiptkup62x8YDVO1kVkyNrsJlimZU14yPx8OhPk475PB/pBXUXrozRiI9uwxHELc
/GiMndnDjS/xHRHqIBvg2wrSQYaZblAw8NBNL5wbgc99twQ04kftOceFoY+LDZ1y
ouTizm1i/w8ZtV9WjbQ2sq3/dMS3hSoXEMgQFcuZfyGdN/JTKKTwtg/2BiHr8k/J
3+69dA+Tg4vSKZjKrkiZs6ROKKxJ4w==
=J6dC
-----END PGP SIGNATURE-----

--udvt/bvCvfnRf3US--

