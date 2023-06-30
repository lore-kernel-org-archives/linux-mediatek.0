Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12893EB64D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPxZ17UkvfpQ7cl+vOGA9tfbMxzVwDfaSHgruYnO23k=; b=kzyFO75n/NY7wOIRygWZzL/cyf
	HZv6IUeD8ArYzbsh4ZYxw0l4i2tgBFGuY1E5iN1IH9VSMdpAVYRicVICxCm7WN7eKD/mHY6u7nB/j
	eHnEpKezCybV4g0pIcretVPjJGyVPU93IRITb4a87ggd2HnPKpDw+EQ9GGBNIyjaR1eLA4CVSeqi4
	/2/HrTR6RLS08O4uYwjYm6iPr/IEmQ41Zc9ukgjLg4e1YfmK5zY2foE6c8Aaa2tkXP+6MZPZaQCNf
	4bf58/Os8BpFqTm6R7AUuNtzHgwskUhWi0a87T96G9tUQoQ6etZytMtkFpoOQRma7qiS+d4NFWKcv
	Lg3a1Cmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIYw-004H3e-1V;
	Fri, 30 Jun 2023 18:09:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIYt-004H2i-0g;
	Fri, 30 Jun 2023 18:09:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB5F6617D5;
	Fri, 30 Jun 2023 18:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1A5C433C8;
	Fri, 30 Jun 2023 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688148577;
	bh=bPxZ17UkvfpQ7cl+vOGA9tfbMxzVwDfaSHgruYnO23k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N42/HycNUB3R9rtOHRq82XbOPVJ4ZvgsDSe7ml5hzKpb6e1I+qg2pUeQJsQW5p9SL
	 ckfnL+XH6Wlurgze98c1hk/HXd3Cri9vYgci7nIpWsGbMxEXM/eNx+ph7gBCPFolkK
	 30liyPbnNpuAp/diWyYWLiSr7sIfxtBCmLuZxsmBP/th62XvXkkRdYA0kTpvO2CynS
	 7J1rQXJ/0pSgYjMSga5pnGYWggYClqN+CTh4/Az+y34rCyR5cJaGNqGzUG9TtaDxKr
	 u3z8Q+jNwdISz41O81vWHe7T2B3hhrpLrQRDbOR5sc5bcS7GhigxLme65HUzxC9oYk
	 kSkr9dtRTwCkA==
Date: Fri, 30 Jun 2023 19:09:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: drop
 assigned-clocks/clock-parents
Message-ID: <20230630-enrich-configure-c0f640e32cbc@spud>
References: <20230629184318.551317-1-linux@fw-web.de>
 <20230629184318.551317-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XiSMeL3djetO3rf/"
Content-Disposition: inline
In-Reply-To: <20230629184318.551317-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_110939_291993_9E52F6D4 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--XiSMeL3djetO3rf/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 08:43:17PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> MT7986 has 2 clock-parents and these properties are not needed in driver
> binding. So drop them completely.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--XiSMeL3djetO3rf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8aWwAKCRB4tDGHoIJi
0rP5AQC2D2dKDFDysbpF3uvL/kWOnVWNg2SDJfdLvMCyaWBkpgD/U6aOgl/StE/w
Vj2pP1AqURfOz3A5FBU7BH6CuyWhRAQ=
=aQez
-----END PGP SIGNATURE-----

--XiSMeL3djetO3rf/--

