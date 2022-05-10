Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 12:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKxMnbRQjTOGO7CvuWVGPhJRMDLEcNdprVKoA6IaYb0=; b=rhvXNA9x2ZgGyDPnldnMW5JO4J
	GOCfz7tQpWAGtcFQQoxRcAbOD2T7QiuuCgWuA3shumTPHcPwIQCoYb8GmCoDDSriNxqEaDg23VlHa
	7RoyLvfD/owwA3II7FUF1XJwhL23YaQekkGzfalwdWCRFTo7WHeAe3/G/pUznrHSZGrSCQzRWv/Ap
	omS4RYmqsj3Wk565KxJWoVyoNW3C1kg7sO7CIlk4A+2FfirZ+iWdtPx0nLauMWw1JS053aAZzEjN9
	XmvY4wxhSdIgqIQf26Lzv3sSyVF8/6AVAOOu18YWf5+SBnkoOIexZaHk79PSJPuLapvGTvlLHfH/J
	dNhBi68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noPFc-001yyg-GP; Tue, 10 May 2022 12:46:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noPF2-001ygx-4e; Tue, 10 May 2022 12:45:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BAD98B81D0A;
 Tue, 10 May 2022 12:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E830C385C2;
 Tue, 10 May 2022 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652186725;
 bh=6Tfsp4itt1Mc3PO44t815pdkzz8WkX2HTQRq8Fx0SZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VCU5SEB1Qol28GTL2mHwXApm+Hc0wPXWT55Emw2+4xCbWXbIF6CUBSpoJ4odwKQ6V
 6UWFUMhHTNnNSWGciRePfWWeZ3MutAMA7f3F6rddeb1b+wHN928/a1Pz048PahIeFS
 2z8u5WeTBx0me0A2xRg9fhAZRqOYh8XcTgw8v/1HsIVhwHNFwWXtz/YojQjeS5wxuO
 llX/z/N2nE42clXfqQ5HtQJs/DioaBMYnXDSDuBzXCq9g5b5+sDTZ1BsEP88SBdu9k
 imexGaCSXnu8Orgtj0IqJHODzIdfZDuqptQIZUEpM4LaMvCLaVPMuA0ojh2e6B8sEk
 3XD/ygF74XGbQ==
Date: Tue, 10 May 2022 13:45:20 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com,
 colin.king@intel.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wenst@chromium.org
Subject: Re: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Message-ID: <YnpeYGbo7JJK0lDk@sirena.org.uk>
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
X-Cookie: I've read SEVEN MILLION books!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_054528_385664_C8F41258 
X-CRM114-Status: GOOD (  13.41  )
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
Content-Type: multipart/mixed; boundary="===============7235636243492845945=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7235636243492845945==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FZQV7cHcKQJUXSUX"
Content-Disposition: inline


--FZQV7cHcKQJUXSUX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 02:26:20PM +0200, AngeloGioacchino Del Regno wrote:
> It was found that some MediaTek SoCs are incompatible with this
> change. Also, this register was mistakenly understood as it was
> related to the 16550A register layout selection but, at least
> on some IPs, if not all, it's related to something else unknown.
>=20
> This reverts commit 6f81fdded0d024c7d4084d434764f30bca1cd6b1.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Reported-by: "kernelci.org bot" <bot@kernelci.org>

--FZQV7cHcKQJUXSUX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6Xl8ACgkQJNaLcl1U
h9CCcgf9GdWINYkwQNpa49JWR+D4PX3vyDYOvAMhApkx2tIGvJiHQ42wCUjXN5G9
9uGCwzkhq1g4N6ppRhhr2rHaTTHPIwi0J/KaGIGuCMEiFu2MiqmTVmPjXkZ6X9KJ
TvlW1Q+d9qc+fAdqagKU3py8jQMVY/kEFwXTPE2s6NhUf/TxujQbuSHX4JhJ6CiU
NtMkMsALrNPQXu0L+7WI1+u84gRGpDalpQpBcPhAZVSuCGUMFUCMKRr/J5PotKoS
l89HHcBvjyz5IRUtaHnZ23ermw6mOrS9dEAn8jWXSIy7vqhHDHNLfoDMa/loIcMu
/BhdI1rOs34c3ZtwqzhAT9Tk66Af0g==
=wDoc
-----END PGP SIGNATURE-----

--FZQV7cHcKQJUXSUX--


--===============7235636243492845945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7235636243492845945==--

