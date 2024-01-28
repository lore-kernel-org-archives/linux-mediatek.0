Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A75BC47258
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jan 2024 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S63lzU5HWOeJ6CqMTZOe+jOUOTYU9dSOZ4hmwj1duZM=; b=NntoTBg4YCAkBD1/HDRiuaAJHx
	9m19s0ewxmdHGEpxBELciYoHcb2k1ttJof5sbkzpQMDIhEwcAYfN5RlE8RVQ8XFd7HZXJvv1+Wav6
	1ho9bJYxBaT0jrNJUr5107Xuclq47LYQugH9GvYfJiy7pRFTTPvi2URQ91rMQcz7n2dCZIZlBaIHa
	U7ktLUPKwKVGy+eMqaJJd8ygqeS4kkYTC11s6yoElFyArRBU47zo+A9G+gB74dklbNyoqFRU6+yz4
	LRs21iAa93MDx2ga3X4r378T1+uq6TAJHeCKjB6u/M1DmN5OZSA86YNVHaui59YGbuLURWIWh0mN+
	03Uk9RAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU1Og-0000000996r-0FaG;
	Sun, 28 Jan 2024 09:24:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU1Oa-00000009968-1QSd;
	Sun, 28 Jan 2024 09:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC57960EF8;
	Sun, 28 Jan 2024 09:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16448C433C7;
	Sun, 28 Jan 2024 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706433846;
	bh=vAmi5VfiuPfMgpUzWVLhzkemLp43TOQ6SblaolpCpeU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=lMwxc7Qu0oHVJPI91GXXDLoO+fz95+HJ9gMP4NbphuEoMcrSG9m0cDtYmdaL+mc0D
	 8ye0Pm1XOyX9C0eEm4+3RXpCD8HukjES5r/RWWVh5RBrFE1QEr34M6pLtJ6mU12Cx/
	 WxDJ9Bm8MQ+X83R1CtubiX91LIAJfvlQhQy5CByGrKE+rxGUx9bNv5cjkB8jMxb0x6
	 TXVe0Vx2dgish6qtjHNFUfU+5Ts1N8aIDd3OUWbCJaqGkgngaV+Chgypy+iQySjVXr
	 wTsOyO73lllXi3Hi1f9ROIg1cIYPW2pREtE4baRZUzOm69tHS8lo9OLj/Q4+7k6XW2
	 jONH1sldIYSlQ==
Date: Sun, 28 Jan 2024 10:24:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, 
	"manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"michel@daenzer.net" <michel@daenzer.net>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "mikita.lipski@amd.com" <mikita.lipski@amd.com>, 
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"daniel.vetter@intel.com" <daniel.vetter@intel.com>, "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, 
	"sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "fshao@chromium.org" <fshao@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jani.nikula@intel.com" <jani.nikula@intel.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Subject: Re: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <vyh5wg2ltmrtqw2mhtyj2lii6i4eccrjjlynzpfg7x63tkrav6@cxbz3sasvjjm>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogyu5zjbyc4numbu"
Content-Disposition: inline
In-Reply-To: <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_012408_491419_D685162B 
X-CRM114-Status: GOOD (  20.53  )
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


--ogyu5zjbyc4numbu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 07:17:21PM +0100, Daniel Vetter wrote:
> On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > Hi Maxime, Daniel,
> >=20
> > We encountered similar issue with mediatek SoCs.
> >=20
> > We have found that in drm_atomic_helper_commit_rpm(), when disabling
> > the cursor plane, the old_state->legacy_cursor_update in
> > drm_atomic_wait_for_vblank() is set to true.
> > As the result, we are not actually waiting for a vlbank to wait for our
> > hardware to close the cursor plane. Subsequently, the execution
> > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > buffer. This can lead to use-after-free issues with our hardware.
> >=20
> > Could you please apply this patch to fix our problem?
> > Or are there any considerations for not applying this patch?
>=20
> Mostly it needs someone to collect a pile of acks/tested-by and then land
> it.
>=20
> I'd be _very_ happy if someone else can take care of that ...
>=20
> There's also the potential issue that it might slow down some of the
> legacy X11 use-cases that really needed a non-blocking cursor, but I think
> all the drivers where this matters have switched over to the async plane
> update stuff meanwhile. So hopefully that's good.

I think there was also a regression with msm no one really figured out?

Maxime

--ogyu5zjbyc4numbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbYdMgAKCRDj7w1vZxhR
xSJlAP95bsUAyxzHt1gZmvkN8tKWAggATAYm9apK9+8NFj/3MAEAnkts/Yh2y6zr
dzc9/lsQ2HaDBNTsjGfOxrlJGX+aKwE=
=2xdS
-----END PGP SIGNATURE-----

--ogyu5zjbyc4numbu--

