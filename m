Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12599C47DD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRRwKq5LqVnkhPlBmuRkLsTSp0aAGvhbAw+sw+G5rKE=; b=zrcClin/VVcfinNxHOmUcKLXX5
	OUr59uuyyRs8Q+ByildOACTVMOqU5DcckeXNzRHn1eVukYNVZe1gzesddv3aH94HoUm3YuuqUcmJ8
	tMawUxSrhOzvvmp/reVv3p0O1Wcbj1CDYwdFq1t7KyysTqDtV9laIesmZIuO8BHNO46BAYfgP/yUy
	EkNi5GHTTsvYRWvM1TEuqNrgY6hpXPeXI3+csEU8+j3FUFDy3KVrvr9Y9CDEhGgf7z8Rw+hZC2/gb
	Yr/7VGDFqVvcpry8xRfz0Ujkqzu9oq6StX0RDOy8Dn4l52JOukmATc18JcpXtusmQl7xJROyYv8q4
	LL1nFSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrz8-006AUI-3C;
	Fri, 19 Jan 2024 16:44:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrz6-006ASy-0p;
	Fri, 19 Jan 2024 16:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6BDABCE22CB;
	Fri, 19 Jan 2024 16:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CBBC433F1;
	Fri, 19 Jan 2024 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705682685;
	bh=QRRwKq5LqVnkhPlBmuRkLsTSp0aAGvhbAw+sw+G5rKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwrBjiJIY6u280JXIzDtHkBHRzWVPvj21WBA3CEh+/RxwVDkP1q76R9RcGOAEyyRK
	 as+ANa1c06TpMg4CSg3jgI/b6cHETC2nV29hrJr/oCc2F4jC0QyHxo5j3CW/6xeQS4
	 2/LhaIaaszvyl5bZLnRvvN3nLgKCAYbpZfcIFEEXQ350rEcRG2RgHKJCnZLeg/8v6w
	 JtuC7tca0XPKKcYmAMa1YjrUPxYJg22gsmy55XF+vjJIA79MEhx/IPY+PiDnwlW7H9
	 9O61Ux0CCCSlgDQ027Dydc5dIrvEJeStSAxt9wKgDpDsIe7mqT7guLB6toTJZZ90sQ
	 XVPPRdo7GkE3w==
Date: Fri, 19 Jan 2024 16:44:39 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 2/3] dt-bindings: media: mediatek: mdp: Change
 mediatek,gce-events to reference
Message-ID: <20240119-surrender-both-21c64f5149c4@spud>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R17Or0wU+thr7YJr"
Content-Disposition: inline
In-Reply-To: <20240119063224.29671-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_084448_467956_C859F3CB 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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


--R17Or0wU+thr7YJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 02:32:23PM +0800, Jason-JH.Lin wrote:
> Change mediatek,gce-events property to reference mediatek,gce-props.yaml
> instead of defining itself.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--R17Or0wU+thr7YJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqm9wAKCRB4tDGHoIJi
0oxFAP426FO4m886BrM5F53nZ1cAx5WLgsXMYRGhDk8jJycBJAEA8wHMS3uLk1xV
EfgQYdDiX0aOUSswVeHTyrGZXsooNgA=
=xSy/
-----END PGP SIGNATURE-----

--R17Or0wU+thr7YJr--

