Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FD7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR9enGyCg4wUkR5Ya0XVwQPHpD2eo9caA+MMP+7uLkQ=; b=jyZoFQfCFhGr3ETYKBdsbt4lYz
	gleKe5aHWAryIHUPKtQV9OXzVsrREoKSy6WPEAH2OzNYRLHWkTbA3chrXxvGQh/9+IwkS1FpN8E3r
	vYaXr6zb5FqaEUK93j9wawGWk6biJoM5K+sNNPOXQSrcr1oPvALWC9IQrxvHaXjazdsWjK3AmUxmK
	21AaAtJyP2J8t2d1i/OLu2R1KPulLD/GV699+vTf30kEXZKLzov85+ZrE97SbgUKMbQ+L+iFFpxKQ
	7uwiS9X/HztOgm9k15SSeeipP9je/kNiYJPw5IBmxKj1fXYpSaaREdnOm/Z9xiAAFPZQtuIVx/Ma9
	AWwsYM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms58e-005v5K-ES; Tue, 30 Nov 2021 15:33:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms4rx-005q07-T9; Tue, 30 Nov 2021 15:16:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1CE7B81A1A;
 Tue, 30 Nov 2021 15:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4884CC53FC1;
 Tue, 30 Nov 2021 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638285390;
 bh=CsuglpE/divFk/5CQWjHUMB7KiYZRmVgd/wkp2Q8Q44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hl8pDsVkBR89t8Weo7V3jLHabABj06Xa+cUu0TUExCcDe6bkpcmHo71IF77u8mp9O
 LrSanYUkqr4rsCO/qakHXAKyhJ8xppn2MNZDTtdmD3Fca0S28aw2g52TwYTWfQsKSS
 b23452oHk8nMshc8Spg3e7l5KCuiI1DYMSZ7YF9azPK6Oswgl0NhAc1XZqqDlFjF/l
 rEuJAJsy8r9PXXWNjk/Nsz4ukHkzSaprOf4puA+DnZ1sXjbmH6TpL6ZqA2/4sIx/8H
 jWjX3kaf4jDBSkxzRDZQdMIbQh/904d5UMNph8YvQgDmo6xVW/YnwpazGBjMkQAbjB
 fu3sZ5oT3afoA==
Date: Tue, 30 Nov 2021 15:16:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 5.15 01/68] ASoC: mediatek: mt8173-rt5650: Rename
 Speaker control to Ext Spk
Message-ID: <YaZASLLyOC9EwnMs@sirena.org.uk>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
X-Cookie: Check your local listings.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_071634_144920_50EB0F20 
X-CRM114-Status: GOOD (  13.78  )
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
Content-Type: multipart/mixed; boundary="===============6873492881628262814=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6873492881628262814==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EpYEx7V8UqnZBosf"
Content-Disposition: inline


--EpYEx7V8UqnZBosf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 09:45:57AM -0500, Sasha Levin wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>=20
> [ Upstream commit 0a8facac0d1e38dc8b86ade6d3f0d8b33dae7c58 ]
>=20
> Some RT5645 and RT5650 powered platforms are using "Ext Spk"
> instead of "Speaker", and this is also reflected in alsa-lib
> configurations for the generic RT5645 usecase manager configs.
>=20
> Rename the "Speaker" control to "Ext Spk" in order to be able
> to make the userspace reuse/inherit the same configurations also
> for this machine, along with the others.

This might cause people's userspace configurations relying on the old
name to break.  Obviously we're hoping nobody was doing that since
that's also true for kernel upgrades but it seems kind of aggressive for
stable...

--EpYEx7V8UqnZBosf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGmQEgACgkQJNaLcl1U
h9C12Af7BOB8qKYgh1ta/a6KlxNqPdnCcPfgt75Zppjx5a+wS5BhWIW8uhF0Bs67
UjGiaO1WRqrfwtcFWXadhQxa1BrpskWt3afgg0KFYtcjf3KFXCFcdVFhdzRMcCe3
SY9eGKabGIsXJdQ18qKRBEPnQ+gXSQbCatqs2cgCgdS07R4nwfFb008U5P3zFysq
PmN9hWOfC5A0cX1EUWPR/zy7qNdFcCEDQu4n5kJTVdpEjKE7lqEA6wy2zw3pQXyZ
dIb4IGxWKyuZ5yt5D0WPX0IlasJvU6QxPxtDgoVYFLhqi9KPivLJJZ82FO2e0Aw0
oZ3H5YPHbUl9/DueY8z+0kk6ZATmCQ==
=q/3k
-----END PGP SIGNATURE-----

--EpYEx7V8UqnZBosf--


--===============6873492881628262814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6873492881628262814==--

