Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E668ECD8CB2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE0JVkVZrrj0DYaTmlnaaMVVZ3bum6caTUwXERfVn5o=; b=VkigCqQOHuwx78pYVCBw+S05DV
	r8oYYc3C6Qyyq+8ga+zV8R7yOMO6zXhgph6ZDsxSaoLj6uBFrTWwmQCVGyNLaf0j1htTVObKBn0bf
	wFSBjkYrCEieO20WFdR3YbCkRAS/or2jiBjJyj5hg/rXmOROiY2LKfIP9P9g+jNY129lxOkmNU2Rx
	bpwHkTd1FHOpIQ2NiPBu4uVCgam62LhlMDgTZoDFod2MbBL6AraBK8cfz5BkWGJGChxEWBknEALey
	+o5bkZmUQWt67FTx3c/PYecOIlBw1EITFZeqr9vnZ/yvRWZq2/ABItTToGY4VPns1HQjJ4q6qHODr
	JxQzTylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzPK-000000063JX-1Tzz;
	Tue, 09 Jun 2026 16:34:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzPI-000000063It-31wB;
	Tue, 09 Jun 2026 16:34:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23290407FF;
	Tue,  9 Jun 2026 16:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70781F00893;
	Tue,  9 Jun 2026 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781022868;
	bh=TE0JVkVZrrj0DYaTmlnaaMVVZ3bum6caTUwXERfVn5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MBKUl9B3Hw8cHltz45RL1oqLl0KnwJX+t4Su1K7RyigUJAdgC+3SupRx4IKE5orMO
	 BnC89sm8cuNX6gmuZ+0aWaWl2G583n8bLV4qqloTseQYPSCmZHQo9Sm8AH70+pv497
	 L3WYYjc5tdNTfdYcB3SZQdReouellKPywO+D3ggeBNAvb4M/4JzXzTlan7HHlDdLk4
	 n9zVCZvrX7Ya9pzSrgCFhSawrvPNiCyoWKio3Fl5F4Dl0R21/JMl+j8aK1kflPi3aI
	 bE6/HrtKeJC1wWSbTubnaZCx6CCjn+B60XYNN73JJaOLaEo4Ju9eKRam3NP+xIbxx8
	 pFKnKGP/bY4Dg==
Date: Tue, 9 Jun 2026 17:34:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: dts: ti: Add specific compatibles for SCM
 conf nodes
Message-ID: <20260609-riverbank-buffalo-ae12ae1317c6@spud>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
 <20260608-n-dt-bindings-simple-bus-syscon-v3-3-4eba9ec1212a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQ5L5UMcTh/jjl/e"
Content-Disposition: inline
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-3-4eba9ec1212a@oss.qualcomm.com>
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


--qQ5L5UMcTh/jjl/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--qQ5L5UMcTh/jjl/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaihAjQAKCRB4tDGHoIJi
0hzzAP9IgmdOgnqiwiYVQ2g4qdVGTjE27anCdxGOJk/6ywkmjgD+JWKwOZ6gm9aJ
GYmHT/Qbuljwrlk++nV9KotKQ5dCGgI=
=3af6
-----END PGP SIGNATURE-----

--qQ5L5UMcTh/jjl/e--

