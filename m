Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B29C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JW2S8XtH2w0oEakH/oOgs84YyeslEKxjY8L2izjfDk=; b=fovDZKCsWS5Umvfz+LNM1d5OHE
	CQPhtka5/Yn0EPwCGVoS10CaPwX3v/szDi2EHjE7WwCfIzmN5m7QmMZPxNC/Fxbm4mwmhViJagNmi
	V0npHNWnn03WQkBttPaypzGb+3lpYAMHPQNhPID95/nHrtoDp3KxPOV2TPvMgO1wBGX78iVz6y4ap
	5ZKIFuhluIO56IgiAjIX0oyr9u2SLLng/FJUQt/3JNCPE7XZnUAKtXbf0CByWAIfZ65gHcCjK+jn8
	z5GVAuRyQuoijyBIKbQZJ/JM2Pvf1O6iu1dAsgt7JJeshQCSB5lxrJdX3pFiToOT73mMeCiajJrJt
	im820MHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5dn-00CDf6-1m;
	Tue, 12 Dec 2023 16:29:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5dh-00CDdh-2M;
	Tue, 12 Dec 2023 16:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E3407B81741;
	Tue, 12 Dec 2023 16:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944BAC433C8;
	Tue, 12 Dec 2023 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702398583;
	bh=4JW2S8XtH2w0oEakH/oOgs84YyeslEKxjY8L2izjfDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUMX9KRLgK/+PuRSRYFVx98x9iA0mSlMupFig+yV0Uw5dFXtiUNE406wFDEwI22l9
	 iP+br3B9xrKSyP76l6Pff/jLfR+X4sMQjOrgUMiM0/GvjuG34XXlSGcEa+X+QG6THd
	 Uds+8/topXVekPryazuwUyuLpJk8bXXwibuyOKR+4W16ORWQyk3lv94goxS/eEOCeS
	 ynLhYh/YBWQQ5YaX98NbpRQzUGcyD3Nttu8a00ol+S2d61QwbpaaE/Wb5O7/S/mKV9
	 oK3+qT19TFPUAJEnKBz4mNLWouagrb35WTWBNUXWXpm2oYfDLn8yQ5zd7YdOFSMqwJ
	 KHZEI4f2RUZ9A==
Date: Tue, 12 Dec 2023 16:29:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH net-next v3 6/8] dt-bindings: net: mediatek: remove
 wrongly added clocks and SerDes
Message-ID: <20231212-operative-stubbly-2104c96bdee5@spud>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <5859da6629b8b6c100eca4062dd193105bf829ba.1702352117.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+o7guYCYluYJGIdc"
Content-Disposition: inline
In-Reply-To: <5859da6629b8b6c100eca4062dd193105bf829ba.1702352117.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_082948_551214_622E0D08 
X-CRM114-Status: GOOD (  13.60  )
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


--+o7guYCYluYJGIdc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 03:48:10AM +0000, Daniel Golle wrote:
> Several clocks as well as both sgmiisys phandles were added by mistake
> to the Ethernet bindings for MT7988.
>=20
> This happened because the vendor driver which served as a reference
> uses a high number of syscon phandles to access various parts of the
> SoC which wasn't acceptable upstream. Hence several parts which have
> never previously been supported (such SerDes PHY and USXGMII PCS) have
> been moved to separate drivers which also result in a much more sane
> device tree.
>=20
> Quickly align the bindings with the upcoming reality of the drivers
> actually adding full support for this SoC.
>=20
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth bind=
ing")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--+o7guYCYluYJGIdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiKbwAKCRB4tDGHoIJi
0i6mAP4xedv8lwi5+7mG3Qv7H3gtEeZ+DpqQpCRsutWbDn8KZwD7BsjQ2fZrh+hO
LiWdVCZSG8Ibj8eKPbm5Qai3qluMGgA=
=F1mi
-----END PGP SIGNATURE-----

--+o7guYCYluYJGIdc--

