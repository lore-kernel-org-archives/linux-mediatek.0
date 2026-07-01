Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC9CC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkp4HiOPABBONoTf78hQOCnxl/elkCfMhe6Bpuh0yx4=; b=EXZgGdvV1lXF4CeOlz+0KrVsU7
	d9C0nRIMoI8Fqq89yn3I+wrXqO2bI6M1AKTieyh1rvjTAfdBKiP8CP2NbQQbdy186HGCTFzv6KTtL
	g9EX1JHH8HkpMYWYVOJD+CQnzDs9Mc22mkVGt0RVP08J+Z9yRVSbrBP/tBoSzCFykpcyQ3bp9ac3A
	acSUQLPgMIPu7nP7jFvvmJF4iRznorlmjY1orbrlp68Lr1sFkG0ZFf7GjC+E1a4mrX1aB3yoCaGeD
	kEtZF1y+9n/MI9MAa7BrUATjf6F6O7HgoTN57FGpMsnfiIn5vVIENo0lZEN1y97JtTUNpFuDF8Xuj
	gdsAMEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyIF-00000002eaI-1iJt;
	Wed, 01 Jul 2026 17:00:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyIE-00000002eZU-1ZSq;
	Wed, 01 Jul 2026 17:00:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 789686001D;
	Wed,  1 Jul 2026 17:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE47A1F000E9;
	Wed,  1 Jul 2026 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925209;
	bh=Lkp4HiOPABBONoTf78hQOCnxl/elkCfMhe6Bpuh0yx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A8j4rPn8GXnN682mi5i14xifdRIV0M5B159dMsfcnWdWH2sb2mMioWiJGhFLzrWc0
	 Dyr9c2MoFSnr/orqV99qlyqFaveNQ7qAy7okRZOhpWmyag2MRRhGCGhbLZ4Dzm3qU5
	 VAU86MGUpc7T7/jw5E1fWMEAbyZcF2sEGdVKV4IqwoTy4PP/cP407BP1fy5X6UqH5b
	 DSogYVufJ95XHKi8Y+HofC3K131mqd68wdmHEx6GpZGyk0kiFJlnJsk7EgvequLex5
	 MoL5cW4HPQUA6iRA59HhmxmIdKm1dSIH3EqXDHzNpdjlxAzdbVR//xcefQ6xZsHOvm
	 Twzdtils5wQJw==
Date: Wed, 1 Jul 2026 18:00:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support
 for MT8189 SoC
Message-ID: <20260701-twisted-splurge-d8428a6ab8c2@spud>
References: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6LIruBZ0RnifyB06"
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
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

--6LIruBZ0RnifyB06
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6LIruBZ0RnifyB06
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHlAAKCRB4tDGHoIJi
0v2hAP4xG8uRvU5urx9tcNk5sTMtXUUWh0Pp6QoPg3ZhJxrmsQD/W7k1BGw3eGna
wHVQ02sZvHrnrhOF9xU/nWYvggscKAk=
=8Tor
-----END PGP SIGNATURE-----

--6LIruBZ0RnifyB06--

