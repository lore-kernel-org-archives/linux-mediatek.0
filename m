Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24756CCF9E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Oct 2025 17:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWHa0BMJQ+qq1CnBwyGKZSlSoUHzAXIAH1td5ml1nqk=; b=PcVi2fhvy9ojmo1npCZP+SwEiW
	2U1HfTrNvQaWfODxlHTX6CgD+z4Yu1Pg2wIsaf2nWUz/PCcD2Venz10Q44+41mkGQ5T/nF32bI7pP
	qgqctKUlj1O8m+/a1FF+/lboPHaFucDJ5yxYA58KkEv4MF09gKrHH9DSdIyBMFXSjn5JWU2uki4aq
	oTRJY9H7JvMkRZcPLHKLuDRAaJxziQdHym+N1xx3IKQilWnlGRpH90Uf0Atv2qPL/+aV9yTBOkE70
	ZJE7mqJd2qaLAW/kRQx+iDRCZRNuA6K6X/ft177dAEh/6M2S45/QeiCvUOUt1PZ0GldICnAHRkG3R
	BfUSyHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLMH-0000000A5s5-0tHw;
	Fri, 24 Oct 2025 17:13:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLMG-0000000A5rX-1pQD;
	Fri, 24 Oct 2025 17:13:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A91F6023A;
	Fri, 24 Oct 2025 17:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF70C4CEF1;
	Fri, 24 Oct 2025 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761326023;
	bh=R8ei2+rtTjBZldNo1xDWoXq5kwYHchpeiJ1vuqrotkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKN/xz/QtGADSPG/LXyoKlY+GTmbeYUFWlyLfHB/2pBk8eLYD2VW41jr381YkANwt
	 UjnW42UbfSQgX1Cjx8mvTsAOOynRRM2Yr+JK8HN59mvwnfmF+BdHZug9Db8Yop+Pko
	 TXifJM4opjWBFXM7gtFtX8Ut0XB4ImdLBc4q7OzRsZUr5T7KqWuUioXb3vGrB7foOM
	 Nph1xeIyWi+0w5itXmn8s7t1Untza2OpaR25IyKttkF4ctHMzEtd/w+q9/Gz3e5N3j
	 KV7t/rgEEoiWL/XgUYQWy3FOMg/l0ctqMtxENbx/jrc3gNGUr6klToMJESA6+LrVUx
	 G4Q2ZrZ0cSBtQ==
Date: Fri, 24 Oct 2025 18:13:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 03/24] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Message-ID: <20251024-thrash-amid-d5af186c4319@spud>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
 <20251023-mt8196-ufs-v3-3-0f04b4a795ff@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jr8TZfrxyC1RMH9a"
Content-Disposition: inline
In-Reply-To: <20251023-mt8196-ufs-v3-3-0f04b4a795ff@collabora.com>
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


--jr8TZfrxyC1RMH9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 09:49:21PM +0200, Nicolas Frattaroli wrote:

>      };
> +  - |
> +    #include <dt-bindings/reset/mediatek,mt8196-resets.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ufshci@16810000 {
> +        compatible =3D "mediatek,mt8196-ufshci";
> +        reg =3D <0x16810000 0x2a00>;
> +        interrupts =3D <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks =3D <&ufs_ao_clk 6>,
> +                 <&ufs_ao_clk 7>,
> +                 <&clk26m>,
> +                 <&ufs_ao_clk 3>,
> +                 <&clk26m>,
> +                 <&ufs_ao_clk 4>,
> +                 <&ufs_ao_clk 0>,
> +                 <&topckgen 7>,
> +                 <&topckgen 41>,
> +                 <&topckgen 105>,
> +                 <&topckgen 83>,
> +                 <&ufs_ao_clk 1>,
> +                 <&ufs_ao_clk 2>,
> +                 <&topckgen 42>,
> +                 <&topckgen 84>,
> +                 <&topckgen 102>;

This is absolutely a nitpick thing, but if you end up resubmitting, can
you pick a consistent format between the two examples your series adds
for the clocks/clock names?
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +        clock-names =3D "ufs",
> +                      "ufs_aes",
> +                      "ufs_tick",
> +                      "unipro_sysclk",
> +                      "unipro_tick",
> +                      "unipro_mp_bclk",
> +                      "ufs_tx_symbol",
> +                      "ufs_mem_sub",
> +                      "crypt_mux",
> +                      "crypt_lp",
> +                      "crypt_perf",
> +                      "ufs_rx_symbol0",
> +                      "ufs_rx_symbol1",
> +                      "ufs_sel",
> +                      "ufs_sel_min_src",
> +                      "ufs_sel_max_src";
> +
> +        operating-points-v2 =3D <&ufs_opp_table>;
> +
> +        phys =3D <&ufsphy>;
> +
> +        avdd09-supply =3D <&mt6363_vsram_modem>;
> +        vcc-supply =3D <&mt6363_vemc>;
> +        vcc-supply-1p8;
> +        vccq-supply =3D <&mt6363_va12_2>;
> +        vccq2-supply =3D <&mt6363_vufs12>;
> +
> +        resets =3D <&ufs_ao_clk MT8196_UFSAO_RST1_UFS_UNIPRO>,
> +                 <&ufs_ao_clk MT8196_UFSAO_RST1_UFS_CRYPTO>,
> +                 <&ufs_ao_clk MT8196_UFSAO_RST1_UFSHCI>;
> +        reset-names =3D "unipro", "crypto", "hci";
> +        mediatek,ufs-disable-mcq;
> +    };
>=20
> --=20
> 2.51.1.dirty
>=20

--jr8TZfrxyC1RMH9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPuzwAAKCRB4tDGHoIJi
0hLaAP4uJxkdce4PNxbIp4Rzr4024f32v9vwcNnDRCl9lOghRgEA/GmQKqp/HFtv
vmFIaYAOVAPddZvh3zO1MoucBgMwww0=
=WOoe
-----END PGP SIGNATURE-----

--jr8TZfrxyC1RMH9a--

