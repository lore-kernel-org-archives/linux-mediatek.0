Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21816606A327
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0DEpv+u0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n05aHFWu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=71z5gCBJeOymYLSOBnrsmJia6D/zSs2bsjFv6ZJhMD0=; b=0DEpv+u04/TVw8ZGRiszk9qck/
	iptemmrsYdYiLx15vJTdevdycrPHRIpQd4kvmmkmwV2Yv90ynSC3c5TY99Pei9d1995NAYuqYdmt0
	V/cD1rIBlAyyCxzH/uJD6QfIrfOnKTzRUd4FoWPSoI2VVO15Y2r/eLWMtF/wYMs8660qj3BY33aLq
	Q4RryjG0Jl9U2d1Q6apSt5dIMzjTXD2OKbP90piqApMi25PQU1N3AHaQ5grlywcBzcSdfMdl0pJMQ
	R8Ia9sIjhsXlYk+xtq8/j4ze2GWqFwd83Be4Ze5zCUhVPmihyZxnRhVpSDvXSJ8h1ZlF/351rFEuh
	ksGcw18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqa7-00000004nJW-3WuC;
	Tue, 10 Nov 2026 18:28:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqa6-00000004nIx-1V7Y;
	Tue, 10 Nov 2026 18:28:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA578457D3;
	Tue, 10 Nov 2026 18:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6BE1F0089F;
	Tue, 10 Nov 2026 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335309;
	bh=71z5gCBJeOymYLSOBnrsmJia6D/zSs2bsjFv6ZJhMD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n05aHFWunLjUbVDjJr+7dG/rN5JXeCkcEUWW56UAf0p/m3/NKoB3F+ggEUYVFatCz
	 P9GNMyE3LyrwWoTgC2onnIGRgTsIj23sIvevFSG7xNqJWK7VkYb8CTzvLv+NzEyVyF
	 hmapRn8sypjmoQT1khs+qKdoUSni0KijrXCFaGvbo4e5ZEKFbOvjjqCg2Bjr9LdRup
	 IaA0iO4KsEUIq+1M9zaD333Ta2v88/UpSsMylpAn68y4HxGlQ/dmrexjnbdsmWU42t
	 Geqnuv6vF/7Eh0BmikszLQyGSPCo7PnDDrRX6OYCG6kLeHo1DPwc+MFtoimzRzEA2Q
	 s4KLIbjUgOfoA==
Date: Tue, 10 Nov 2026 18:28:24 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	lei.dong@airoha.com, Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Rajeev.kumar@airoha.com,
	upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: airoha: add AN7589
Message-ID: <20261110-tremble-ripping-75bb06cd9804@spud>
References: <20261110172143.296304-1-john@phrozen.org>
 <20261110172143.296304-2-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+hlanfLMqur4GNsR"
Content-Disposition: inline
In-Reply-To: <20261110172143.296304-2-john@phrozen.org>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--+hlanfLMqur4GNsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+hlanfLMqur4GNsR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNiSAAKCRB4tDGHoIJi
0jFUAQDXVx6E5NsArY7Gj1j5r6xduRM2nveKZcaagCvtmPfGcQEApckpWnMJ6zQ+
EY5R5udVSj3SdH+Q92aYTYVacQS+xQw=
=C45S
-----END PGP SIGNATURE-----

--+hlanfLMqur4GNsR--

