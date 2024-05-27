Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9B1C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 21:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhVfWIrto4jIU5ikPnSkoETBiu2Uq0drRspSjx8EjrE=; b=mxIaH3Knhwwbdc1o9iBCo0Fda+
	oMoZ9ojDf3xYSvHtE38Kl4lwDquu0GaUHxQZGdplgvB1VMAAIkXCfODZNpWYLyZRHuwgoVnk1Bfhm
	YfF71aLv0f9M9dSaBDNCkEzhRHCHwBKAQ1cqoKWmetsJIaa472LC+G1XxARcf/AQ6VKhOgW78TynT
	B13X5AcrwEIB3eX/OwIBOHjKdFqqlzH8YOHAAJ5ENU3u+Qj+ZwOJxX5+BBkqechmsK2odtlLX9ZMu
	dKoIqE1yUvOUgyxGJLXyplhOA0Efkf3TfcSb1y3YYiUjGRRNxWMsGHaVPmQSvGoFMWbLdAsKFOMqN
	Iidm9f8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBhZN-0000000GJvm-00kv;
	Mon, 27 May 2024 21:07:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBhZK-0000000GJtX-0Flf;
	Mon, 27 May 2024 21:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFEC861BB0;
	Mon, 27 May 2024 21:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C3FC2BBFC;
	Mon, 27 May 2024 21:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716844053;
	bh=mhVfWIrto4jIU5ikPnSkoETBiu2Uq0drRspSjx8EjrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyeY8w8iM3a2bKqXDG6a5LCeGu84qqJ1ghEDJrUibye8UWiHMZ26cN9Srpo8k+Bo0
	 eJcl+jTC0oRs64ZMgJ9MCEcGQjVeCOnGVpnYRgax/rnyX8RdPKjytNF8MxejhswWVq
	 +OckIrSDp2jp5e/QyypniY29hLvJ9uhNul4IrEe2pCVDnmqSP4IlXP1u5iYzEy7EEm
	 xOqcd5JYMYGlMOIOIHmBu7TUiZGIL4TgeLtiQ8wjhrmpbi8qcLE7b1BTT6/lPpEHko
	 jmcFPAm3tRCsuawEQnq9b2CHGIALDfxKli0x6MfJ0EpgvBz+nKxNyhghDSstcL8sKz
	 OhleTPgmzvL8A==
Date: Mon, 27 May 2024 22:07:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: thermal: mediatek: Rename thermal
 zone definitions for MT8186 and MT8188
Message-ID: <20240527-reclusive-elderly-5b2d6bfee6b9@spud>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
 <20240524-mtk-thermal-mt818x-dtsi-v5-1-56f8579820e7@baylibre.com>
 <20240524-concerned-fritter-262f5e16293e@spud>
 <20240524-clatter-antivirus-b1939900ee58@spud>
 <61a1be10-7df3-4ba7-b7b4-ccc7f0379656@baylibre.com>
 <20240527-wife-dress-3ecaf1509506@spud>
 <r9q3n5n4-4pqn-53so-4n65-33p432530793@onlyvoer.pbz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wMFiEWgMGRM5yNJl"
Content-Disposition: inline
In-Reply-To: <r9q3n5n4-4pqn-53so-4n65-33p432530793@onlyvoer.pbz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_140746_196168_C9FEAC11 
X-CRM114-Status: GOOD (  20.02  )
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


--wMFiEWgMGRM5yNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 04:57:15PM -0400, Nicolas Pitre wrote:
> On Mon, 27 May 2024, Conor Dooley wrote:

> > > Would Russell's suggestion be acceptable for you ?
> > > I mean, this one:
> > > https://lore.kernel.org/all/ZlDMNkdE2jmFgD8B@shell.armlinux.org.uk/
> > >=20
> > > I could implement it, but before submitting it I would like to make
> > > sure that it suits everyone.
> >=20
> > How's that going to work? MT8188_AP_GPU1 currently means 1, after your
> > series it means 2.
> > You're gonna need to pick a different naming for the new defines to
> > avoid that. Additionally, why even delete the old ones? Just define
> > new names with the same numbering and you don't need to worry about
> > any compatibility issues.
>=20
> Isn't this making a mountain out of a molehill here?
>=20
> Seriously... none of this was present in a released kernel. The naming=20
> can be adjusted "atomically" so compilation doesn't break, and=20
> it is within maintainers' discretion to bypass the checkpatch warning in=
=20
> such particular case.

If that's the case, then great. Provide a fixes tag, and a better commit
message than "Use thermal zone names that make more sense." that
actually explains why it is okay to change the definitions. There'd've
been neither mountain nor molehill were a sufficient commit message
provided.


--wMFiEWgMGRM5yNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlT2EAAKCRB4tDGHoIJi
0ukrAQDMx2V/zyc186dIn+Ks5bop1v80bcJVAiGhMggRt21d8gD/bXAHQUuzVQKi
99Y5nTyefGk40OXYnqLeWsRQxfcm9wA=
=qebK
-----END PGP SIGNATURE-----

--wMFiEWgMGRM5yNJl--

