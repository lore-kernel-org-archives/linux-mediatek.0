Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7904EC07E97
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O3iNCD5Wbl2lrBDm4cJ0DfYOVmGP9igSds9ibbdYA8=; b=HD72pR1D8SoZFDCx5LrC6LHhi9
	vac8V9TA8aUuAq9pjdqP2b5E4RwRUQqE1ELKJG+RZkEgKzaS6gcfXxemy9lMr4K4wx3usC3KRgTT4
	X22aplOA+Ny1bHtTsRKRBoPz1YlOX/nJ9/T8t9uIRXTYfStYRR4ncSJyJZ0BJtKpXVW7N1GkDBRIu
	rTjoTnJK+h9FQFhp6eH4whM0Uk8IKwtCXzyuct9iccCJCvHxM04HbiCRKnM93aH9DMNKQnQONy+9a
	A77REHrMk2ywns++p4HhK6bb+A5pBj8eYQ+vdoI3Wv/9HB/V+jdtsIxImkAP9OFGpl/1VPZLdpXNv
	B7AeFtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r967E-00E8SP-0z;
	Fri, 01 Dec 2023 16:11:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9674-00E8I2-2M;
	Fri, 01 Dec 2023 16:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 39C0BB84809;
	Fri,  1 Dec 2023 16:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E02FC43397;
	Fri,  1 Dec 2023 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701447092;
	bh=jRf4b5sq3QMU3+oPL9KR9b7Qo2nIgS11b+cRCI+8FZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPZYGYdxTQWcyIytDWTWB5LF6ebaaxz2r1aubp545Jlwv2J7mesf+vOXLS2cuvxqo
	 O3UBoS0CA0Or4dATNhWoqHvoz1KafKEKxUMuFXWkOGO7MvkFehA4XT68Iu6ucLx/K3
	 wWZaoU0i+5LmGbB2D76RKIxsG8rCQ5wZr6wE5SNaWQKM7l7u7bBEdhCtuDnj0347//
	 VzmJzIGguIekvZftYeVeilrCQ1JbpgQGZ2HQef4Z8Oiw31JbVYY/g4czshOkZMVJCp
	 flgHvVizrg975oOJfJUIpVqSFx3DKU8DPTfZTHCsTQWXGQlmHmVa4YLtrr6+29XEdz
	 R3upqjMZyiflg==
Date: Fri, 1 Dec 2023 16:11:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/9] arm64: dts: mediatek: Add MT8186 Corsola
 Chromebooks
Message-ID: <20231201-esteemed-finch-84782fad14cc@spud>
References: <20231201070719.1229447-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RfsLZDnPaa0m/Otx"
Content-Disposition: inline
In-Reply-To: <20231201070719.1229447-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_081135_068446_BE367BD2 
X-CRM114-Status: GOOD (  24.43  )
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


--RfsLZDnPaa0m/Otx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 03:07:04PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is v2 of the MT8186 Chromebook device tree series.
>=20
> Changes since v1:
> - Reorder SKU numbers in descending order.
> - Fixed pinconfig node names
> - Moved pinctrl-* properties after interrupts-*
> - Switched to interrupts-extended for external components
> - Marked ADSP as explicitly disabled, with a comment explaining that it
>   stalls the system
> - Renamed "touchpad" to "trackpad"
> - Dropped bogus "no-laneswap" property from it6505 node
> - Moved "realtek,jd-src" property to after all the regulator supplies
> - Switched to macros for MT6366 regulator "regulator-allowed-modes"
> - Renamed "vgpu" regulator name to allow coupling, with a comment
>   containing the name used in the design
> - Renamed "cr50" node name to "tpm"
> - Moved trackpad_pins reference up to i2c2; workaround for second source
>   component resource sharing.
> - Fix copyright year
> - Fixed touchscreen supply name
> - Mark missing components as disabled instead of deleting the node
> - Dropped reset-gpios from touchscreen nodes
> - Drop status =3D "okay", which is the default
>=20
>=20
> This series adds device trees for the various MT8186 Chromebooks that
> were initially released. These are the Tentacruel / Tentacool devices
> released by ASUS, and the Steelix / Rusty / Magneton devices released
> by Lenovo. The device trees are taken from the downstream ChromeOS v5.15
> kernel, ported to mainline and cleaned up.
>=20
> Corsola is the Google codename given to the MT8186 platform. This
> platform has two reference designs, Krabby and Kingler. Kingler was not
> used in any actual product, and is therefor not included. Steelix is
> an alternative design put forward and is effectively a mix-and-match of
> the two reference designs.
>=20
> Most of the core design is shared between the variants. The differences
> are on which external components, such as the display bridges, are used.
>=20
> Patch 1 cleans up the current list of MediaTek boards. The entries are
> reordered by SoC model first, then by board name.
>=20
> Patch 2 through 5 add DT binding entries for the Tentacruel/Tentacool,
> Steelix, Rusty, and Magneton Chromebooks.
>=20
> Patch 6 through 9 add board device tree files for these devices. Patch 6
> also adds the corsola dtsi file for the commonalities between the designs,
> as well as a dtsi file for the krabby reference design.
>=20
> Currently external display support is missing. Audio is not working, as
> enabling the audio DSP causes my test systems to hang.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--RfsLZDnPaa0m/Otx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWoFrwAKCRB4tDGHoIJi
0r+7AP9/1M++ZVkAg204HKeqqsE9wsncwLCYXX7Bx+uL1pXlAQEA7Uc5XHDttJoV
wdpfT6zxPe57C2wIW3XC3uHuB/kcvAI=
=OEBa
-----END PGP SIGNATURE-----

--RfsLZDnPaa0m/Otx--

