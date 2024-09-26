Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAFACCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XczHlGp6eZWeY8DEWzMAFSa7FFU9/M3A+aSoVFxqcD4=; b=fh/0d4a+V2zKZVw/H8+uago4Kv
	hFec2NWCR3XAVG5qpDn2cI3EJUwOpDDEqK7Yx3NfvwuMCoDLZOXpqRHZvwHGt65avuq2pFyIhwtci
	/2enbkTGpBnGVOedvjNIy61NO9noR7HpxcBvpVeaPM7xeHbg5XnqmUH+yXvVEy7hBZpThu9pk7cpK
	CwbtXisE8SkuY+uTPLCKBR+zSPOONN5tCA60Tkgk05uBT5FVmYx/Z6DndqMj1seS9OCxhIUd9e30g
	SM/+EjhQEWzkX4NzywA4YdwayQ6GhbHlCK1vKm58L5na231Gw3vBXwr1kfMwKoFyZwm0A+0Egv0J2
	P/vL0MPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stj8A-00000007XuJ-3ald;
	Thu, 26 Sep 2024 07:41:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stitU-00000007VOS-3y44;
	Thu, 26 Sep 2024 07:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E2945C5DD1;
	Thu, 26 Sep 2024 07:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8D4C4CEC5;
	Thu, 26 Sep 2024 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727335590;
	bh=ePa5u/BcnZ/dATlftydtRiE5hN7gmuT0GTtjNoDiKEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2HjjNSyNaWEZ1yenHHEyui1RPMh8RJVBscCwUg+TXnkGbJouUPm2CIehBM3+Co6X
	 VedGYDOORpYZqCXP1lA+ySO90Fwuu1ocnuaf/2z42w+C0bfF8oHdF9o/oTkHsVlwdt
	 Bf9nj/u01qIShO0iWrBh8GkbROFRYw53rMgHLuBCyUdr+dM6Ch0H1hEOVk1h39MPXE
	 7xLZP3vgb0rUT9712TiCXty9H7+EMJJ4XbeTqBu35iZX4CcMVSvlhmQeFt1qvfMBRR
	 ugPSGU54cl34WqVGyPrygkOEOE89m5ePQQ98JoI1Rvhy/0rPTMoiMuolGmKpad2Y37
	 nywPery26f36Q==
Date: Thu, 26 Sep 2024 09:26:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	dmitry.baryshkov@linaro.org, rodrigo.vivi@intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/gpu: ci: update flake tests requirements
Message-ID: <20240926-athletic-gregarious-markhor-cc78ac@houat>
References: <20240926070653.1773597-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xmj2ly46kzbkkxma"
Content-Disposition: inline
In-Reply-To: <20240926070653.1773597-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_002633_395177_B0DC0EAB 
X-CRM114-Status: GOOD (  21.42  )
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


--xmj2ly46kzbkkxma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:36:49PM GMT, Vignesh Raman wrote:
> Update the documentation to require linking to a relevant GitLab
> issue for each new flake entry instead of an email report. Added
> specific GitLab issue URLs for i915, xe and other drivers.
>=20
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>=20
> v2:
> - Add gitlab issue link for msm driver.
>=20
> ---
>  Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/=
automated_testing.rst
> index 2d5a28866afe..f918fe56f2b0 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific=
 hardware revision are
>  known to behave unreliably. These tests won't cause a job to fail regard=
less of
>  the result. They will still be run.
> =20
> -Each new flake entry must be associated with a link to the email reporti=
ng the
> -bug to the author of the affected driver, the board name or Device Tree =
name of
> -the board, the first kernel version affected, the IGT version used for t=
ests,
> -and an approximation of the failure rate.
> +Each new flake entry must include a link to the relevant GitLab issue, t=
he board
> +name or Device Tree name, the first kernel version affected, the IGT ver=
sion used
> +for tests and an approximation of the failure rate.
> =20
>  They should be provided under the following format::
> =20
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $GITLAB_ISSUE
>    # Board Name: broken-board.dtb
>    # Linux Version: 6.6-rc1
>    # IGT Version: 1.28-gd2af13d9f
>    # Failure Rate: 100
>    flaky-test
> =20
> +The GitLab issue must include the logs and the pipeline link. Use the ap=
propriate
> +link below to create an issue.
> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
> +https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver
> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
> +

I can't comment for the others, but drm-misc at least still requires
reporting issues by mail, so, no, sorry, we can't switch to gitlab only
for now.

Maxime

--xmj2ly46kzbkkxma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvUMowAKCRAnX84Zoj2+
dmrwAXwJooR80dwdvsWLwVqq5T8Tn9xQ8jXG5egqf3JJs5K3KqLQK01ARZoz96es
RPNQmi8BgI1h2/qRTFQd2zqn7QgKcGKOtkv4Yc4dQqncavbg/HkcoYrbjgDyP6za
D5kG4mEAOg==
=hh9h
-----END PGP SIGNATURE-----

--xmj2ly46kzbkkxma--

