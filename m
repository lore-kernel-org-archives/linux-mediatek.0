Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B7D606A32C
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D1TEZnuQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B2LuHxPN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ItAKBk/a6HZLA+n/bMMub1+ytthQppN9B9c92bnvYeU=; b=D1TEZnuQLOtiPFt3HS8RWOWQwQ
	u78QrM6F8XfiSi/tsz8hbeXXN012Uo2M/ZeBfcfbWfHc7lWCYSsk8mEbsSezwOFrzWWE96JPw7Ti2
	QEg5TqyR9COnH20RPvvInTLNypPpFHMm0jCrTI/5gzKJDU69v3ABY/zmJWvOSowujS+1dljv9HNLA
	pVwcQ4NrKhz/aDULG5+pWkVH/pFJSlEwpnkjH4R5kGS9J2hDatyycspjR9zkT4x4cG2Kz6OExBS6c
	vrFuj92lCLnpMMU2HJ4/j+aFXeOJRwQ5HBNudV/0yHAkdYziUuvZQP09WE6/CYmXCZnsl+6y6jdsk
	98fP3rCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNve-0000000DGYA-1uIB;
	Fri, 06 Nov 2026 17:40:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNvc-0000000DGWf-1g8n;
	Fri, 06 Nov 2026 17:40:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCE7B418A8;
	Fri,  6 Nov 2026 17:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422861F0089F;
	Fri,  6 Nov 2026 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986839;
	bh=ItAKBk/a6HZLA+n/bMMub1+ytthQppN9B9c92bnvYeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B2LuHxPNeiH/42/5p2bVdvdN4g8Xf0QnWJODS2LViTKuagTwOMmpvzJOwgazsygu1
	 gQVFuPJi37wvoVjfoIYoElwU4/Eo9X7uAlsVgul/QBNsglcY4XYuyedNvQjmqNbV9X
	 sIPygIA57yJJY/9b3ORKTkTPbqSSdMkOWU4JObRFCAlJzUHRWnIkbolUhiA2BZgPgV
	 awBODHnuxAOiUaMe0sh2jmHP6sYPMslQK33XJm0jE7GrabLcatnxL7/ZoXuO44UFhq
	 gj3w7UXVra4fcuISF7wzPAq6Zdb3OJ8WvXoSF8jVHEHAdjXTu9iAm21SNbuM3dwony
	 waVpJu0pnvh+w==
Date: Fri, 6 Nov 2026 17:40:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
Message-ID: <20261106-headlamp-trekker-f522f951e18d@spud>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
 <20261105210622.523747-4-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4YGTUr4yo0rugW2E"
Content-Disposition: inline
In-Reply-To: <20261105210622.523747-4-asalde.le1@gmail.com>
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

--4YGTUr4yo0rugW2E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--4YGTUr4yo0rugW2E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4REwAKCRB4tDGHoIJi
0iRGAP9bW6Ptz/epY1NELu2GY325xNrBXBp/aRVP70BOQXB2HAEAoee+mfPvFvfe
upnlk0d4fbPXgPYBCxrJauWqlU1Y/Q4=
=DIWD
-----END PGP SIGNATURE-----

--4YGTUr4yo0rugW2E--

