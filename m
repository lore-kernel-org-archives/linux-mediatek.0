Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE737606A326
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fqcs95uS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amHYenwN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6iCz8uPmaivGK2IfBvxWCreSuE+UWU0XRqrSzi+k0Sw=; b=Fqcs95uSjZJX0mhZD/yBV6Aj2o
	aVrZ4rOvk620FFndn1dw+n/jEayJI8X7rWPHT8JDz1dvKMXp9pxQVdb+TDo4iqknUqZTokHRREWjp
	kEeDht+G/glXJLMnHVveKwQQLiHQnEdccLN79OazW9NhQibmw+pr+vUVF/TSLcuNyI0jRZ9TMaGfM
	NBeER7WY4GYuYe/JrEp/jX0rYJgc3hy32WjofxHH60kxcndyuSUUPXDfxieDHkjBfsba7fXlr898+
	IdnYut8gHRiAVFiEcHgch6fSPdyK1itOrHkncF0zniCM+jmWoo7j+hK/Qd4axNzeEaKCEvf6ic8Ae
	+CG1ytAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNvT-0000000DGTt-1Eqc;
	Fri, 06 Nov 2026 17:40:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNvQ-0000000DGTU-3O0n;
	Fri, 06 Nov 2026 17:40:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 292F3601BF;
	Fri,  6 Nov 2026 17:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653E01F0089F;
	Fri,  6 Nov 2026 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986827;
	bh=6iCz8uPmaivGK2IfBvxWCreSuE+UWU0XRqrSzi+k0Sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=amHYenwN3Ln2et+kOQfWN1SJNABijL2Js0a5jRmO6CZZBpwmogMZbQNXk8UaJQ77K
	 pRlHlptn6we3Cz9/4fvgNiCKJ3y/q7iymXFHpHNOtyCtA5kHEOHAn6kW8AC9XBgV1W
	 PyBCeazkuXC1nAuvutr8op5aGvmkccpMFFKqS0SUPf3J2PMihYQyMBjodqu0Ty/yRv
	 0WuC79D9XDKmg3CU37LdP0Vd1XXOdLgmxbxES4O5jwOcq3cSUHeB7CKlDVbexNGK7N
	 p98A0G5HuXe65ZXZhV4RiYRkWj5e12u6TlAIRt7z7rVtB+OE+YvI2jK81Hf4Nd6d3u
	 pqGWO4EQ0/P7g==
Date: Fri, 6 Nov 2026 17:40:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
Message-ID: <20261106-gulf-extended-fe3771d9d70e@spud>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
 <20261105210622.523747-3-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JYHp8Y84ezkOabFk"
Content-Disposition: inline
In-Reply-To: <20261105210622.523747-3-asalde.le1@gmail.com>
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

--JYHp8Y84ezkOabFk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--JYHp8Y84ezkOabFk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4RBwAKCRB4tDGHoIJi
0qIZAP9BbUTJCJBFwXZbdcK7EV7D1qfEEy9W5eTCWsx9+SR3ZAD/ZSPl3XM2WvFy
tQJtKWnZ4EK9GySbgthNiOBevVPZbgA=
=Nrh4
-----END PGP SIGNATURE-----

--JYHp8Y84ezkOabFk--

