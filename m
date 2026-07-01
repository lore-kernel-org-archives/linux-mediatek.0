Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20539C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GKUiK4lsUyxfOQTa+DkkuPa9nC5WHhgH6dZ6JcMOVs=; b=mTR/F2DiStxbmAzCupLg+63KE5
	WQm1ZK6q8qKFKw6gR2+hR9MA46l4j+nCk9yiiQwhdc5et7DTB7I+nVXqJN8AuHIecNubq4WO9KR8D
	2KD/biWxdybE1he+4ZpRH5moE0QNnpx+e1HhVOn1pkFCAmgz4FuGpWe8cvcf6dGOImva3FkKtK9Yn
	QKn3HyLXseTdt0XHAGQhquxj+8dHlc3YEId0DjzDhYWHdQ2VrOE6GVLzu8PHUBoPCWfQ5+z79opcK
	WO0SVVPTc1P0v3eK8nPgG8MDMX3J04Tsszt4m8rl7aii6XRdaDQ5FZcfnNcHCbf5A7DEQqAUE7ofZ
	wIB/F+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyHt-00000002eQI-0hvC;
	Wed, 01 Jul 2026 16:59:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyHs-00000002ePI-20UB;
	Wed, 01 Jul 2026 16:59:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC31141FF6;
	Wed,  1 Jul 2026 16:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24801F000E9;
	Wed,  1 Jul 2026 16:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925187;
	bh=6GKUiK4lsUyxfOQTa+DkkuPa9nC5WHhgH6dZ6JcMOVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGr0AfCfMipgDELZfH0oNnfdhHmQ9iHn3TMHt2oyDoUr+mrZrIPry83rqlC/Mpc1s
	 vbUc5VJtHdPnLMYSSuHe3Z4yMiskIo94XfuhGpTksHHZaWVI7NqADY+0sp9Iitiy5o
	 s+aQ67e4zxkdBwYCcpFRgVmEmr0G5G1B6C4N0F1bGTAGHHRuu/oEZgyfkh0hLHm+eI
	 UXl0LOtWFDDp3pJMspLg9z7eYML0G3HAUaf4rmL0VipejFw5s1Gp3acukG6WbfPiUR
	 I/Rvc0p54AyDEg/793xbBZlXOlBiGFZr4tNKf2jTebseP7OTJ57sHxfSnnJbuCpca8
	 MbhMFiCinUFLg==
Date: Wed, 1 Jul 2026 17:59:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for MT8189
 SoC
Message-ID: <20260701-graveness-program-2cfcab411ef1@spud>
References: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9rSKBT53BZC4l7pJ"
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
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

--9rSKBT53BZC4l7pJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9rSKBT53BZC4l7pJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHfgAKCRB4tDGHoIJi
0gsbAQCfNvGEjyLqD8GFLj1gnnm4qZzfsFcFiF05x5MMWV//IAD9EICibF/goigl
+KUPdrJ40+4unbogYm9VMeQegp4NRgM=
=p73x
-----END PGP SIGNATURE-----

--9rSKBT53BZC4l7pJ--

