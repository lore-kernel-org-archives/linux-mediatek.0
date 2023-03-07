Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E76C6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQgX+OFkaGwQO+Ny7NdW8cV5dWlF2ecQwTfPYmkv02s=; b=Bfenh82MQEJfZ3ML+MChpawDy5
	n9RBOKi17RNinvnKqzcE7LoX/qJHXa2bl5b/uZe8GNp9x0M95iUMc4g+wDr63h6diIFIwT1SyEgRY
	qaafvCHKWee2YKpaGVTXsaMkhjZI0ifpH4H3XtXBR/V6f2YftipVlaFY8GwuvEWf+YT23HCsUQb9h
	uvbZax8ODuST0eKfIVLRtXqOdGe/feJTN5A+X0+DsGokwJD0aDmV4c15vomq56LSL2gNMSt/Ws2wA
	lwC5pp/UcATI4MxSKlnM8bBwSSAy8VQhIeKzT3kWh9ykTlImWd9JzKqi3sCv0VvcvRmwj/lKEG4lO
	ZIm2xCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZ5V-001BG7-Nx; Tue, 07 Mar 2023 15:18:49 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYjs-0010KU-SZ; Tue, 07 Mar 2023 14:56:31 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.west.internal (Postfix) with ESMTP id 9AE3A2B0725A;
	Tue,  7 Mar 2023 09:56:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 07 Mar 2023 09:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1678200977; x=1678208177; bh=GQ
	gX+OFkaGwQO+Ny7NdW8cV5dWlF2ecQwTfPYmkv02s=; b=D7w4Muld8Eu5UCLbVO
	LkJFD+WIQx/Vzhl/X9C7A3qLfJhZNcIALZMfRNsBf7+N55NHVr9FJUhm0NBULAMK
	OdN1V2vrqVaMLDU/IZklg1687bwu5j1CmvmG2CA6DVe2PIWdLUGEF8hQig4Krczx
	V6EV2IYQMElVTx3+qTYWF41t6gcXtpmwEnBu1P1+LLahYaitCge2I2jYbsxmlBQW
	rXRlBxq5JKjAlT3QnidUxg3FOfE5dcKEXlD+cJhw596isAMQouwEYW8x///plLZw
	GoV2fs2GbKvlj8WQ/J6OCAW/IYoSEpi2CZ23J6b/bQybSaatyf4Djxnu9LqkXqrb
	9iAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1678200977; x=1678208177; bh=GQgX+OFkaGwQO
	+Ny7NdW8cV5dWlF2ecQwTfPYmkv02s=; b=KmI5/Os6WpMErhW3w/1B7EuXeAvCQ
	xhfYD5k9CNH3MJZkJgOgkqQNvmfzPZY97/kz27sByxjiByCcWO0iq9Di3H0ozngH
	AJ34GxitJkGvPu3BfwwlKR3OeVQhzyah69W7ESRThiYprN31rCqtxCdDPEHLcsQp
	Mua38OlFMeFfYx8gat2t5Z30dGaEgFeH8r6BBIB5ogU9N5eliiCKTx7lQsiinlkd
	7rpmCHNmCiTbrb0GTqb6qNaPETFhGAYwaCbou6zZPq6Zk5y6qa90IJvlcwtPgQlS
	Z+LEv2EIQYTD3Jkk0AOvgJVjahHihNBwH559ddWvrL/Q1fz+IpJYufmPw==
X-ME-Sender: <xms:kFAHZGeaqwXLPcM2ZfAd9njBAJC7Qi702nIuGITTB9r2mHpiJQmxuQ>
    <xme:kFAHZANks4fE2kD4LVIfrNXPmvJ2LWq68vgJFN5G9I036iVCLwpItQKtwdvvePLG3
    lIz6eoANG5nWgguZsg>
X-ME-Received: <xmr:kFAHZHifYLdjTcgYugedhArfBJX5ZO095Tzyk3GJMwGW_JqKMbxkcv4-6UdvXVWL_IdTdizpJ4-nBCbAKDYobYgANbZBeMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kFAHZD8i7TqRetgXoJKraTcZZ4qAe6yWv7D7zbRf67iVgQS8jbZdiQ>
    <xmx:kFAHZCvzE5SAi7en6Ya85Dfx_8ANirukxjtec1coGl342WvLls9Chg>
    <xmx:kFAHZKHHge_08-IbbPVfQcusfH4wd8uO9ND8Pzsqjnw-7qeaVVPO_A>
    <xmx:kVAHZMtyfuXByAQ91WiEFHmEhoTysW6RSMH7Y31dJM6poMiGIfPxH1JkFNA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Mar 2023 09:56:15 -0500 (EST)
Date: Tue, 7 Mar 2023 15:56:13 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, mikita.lipski@amd.com,
	Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
	harry.wentland@amd.com, Rob Clark <robdclark@gmail.com>,	"Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Manasi Navare <manasi.d.navare@intel.com>,	linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,	linux-mediatek@lists.infradead.org,
	Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <20230307145613.xvhru3fpcudlpazt@houat>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mgg47tbsz3puzqki"
Content-Disposition: inline
In-Reply-To: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_065629_687137_45F59DD3 
X-CRM114-Status: GOOD (  15.74  )
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


--mgg47tbsz3puzqki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 16, 2023 at 12:12:13PM +0100, Daniel Vetter wrote:
> The stuff never really worked, and leads to lots of fun because it
> out-of-order frees atomic states. Which upsets KASAN, among other
> things.
>=20
> For async updates we now have a more solid solution with the
> ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> for msm and vc4 landed. nouveau and i915 have their own commit
> routines, doing something similar.
>=20
> For everyone else it's probably better to remove the use-after-free
> bug, and encourage folks to use the async support instead. The
> affected drivers which register a legacy cursor plane and don't either
> use the new async stuff or their own commit routine are: amdgpu,
> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
>=20
> Inspired by an amdgpu bug report.

Thanks for submitting that patch. It's been in the downstream RPi tree
for a while, so I'd really like it to be merged eventually :)

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--mgg47tbsz3puzqki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZAdQjQAKCRDj7w1vZxhR
xWtgAQD3/rzdROsdbjOwFc/mbmUyG/GnJLulhBcauAuhRqkI9gEAliE4z5x/v2vW
zxe+foePRa9l0/iW//JcHyAuNW9R1Ac=
=Xp79
-----END PGP SIGNATURE-----

--mgg47tbsz3puzqki--

