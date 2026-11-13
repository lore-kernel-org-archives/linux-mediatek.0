Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B053606BD23
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KazhRiJZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRm9UCDM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9mbztNyPF9d8Im/tzoUpmqFw6e3af2GVAqcZ6iqDoSk=; b=KazhRiJZNLPOSA4/jHSY8oRnBa
	x+h4bUobnFX9k3qYYL+IBJZKXpAZGA7WVfa+tdw/pP1tLe0QzrqtNjwVnGSdsfmPOr7s42RN9iKt8
	wP6zzdzmfqOk6GTXinPGv3JEQrxdKn55icknNwIHfXgj6trKnApEqOODpI/BDuIiqpqQIWoOkCqSg
	CPAuvO7YJZd9rOoHRN4oObZNYTZ9xZ7WfoYHhrmd17B29bGziFWolBvaWlsttUoc6AxJKuAM8IEdD
	t0YAvW0JIJ8RtUVOReywlDJimvOXPgzjYUbcJi61yfO4DFKWdQj95Jjzm54zukeiyWvboVUkdI+/N
	KA/jfvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuzD-0000000DjUA-0IbA;
	Fri, 13 Nov 2026 17:22:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuzB-0000000DjTi-1O85;
	Fri, 13 Nov 2026 17:22:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6180962BF1;
	Fri, 13 Nov 2026 17:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED0F1F000C6;
	Fri, 13 Nov 2026 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590568;
	bh=9mbztNyPF9d8Im/tzoUpmqFw6e3af2GVAqcZ6iqDoSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GRm9UCDMx01yJ1eZjRSvWVwJjF+ThxhtiQzAZ5LaHiSBj1+shDrmOGD3P84+GcY7/
	 eo9Pw33LwJ4cdfDwykvrV1//Eqm3+heyBYbDTahGHF6CmHdUdVkW4xJ0WkgD3oaWu2
	 rwB+tgaMvqxzMGLkR1aeyM/nmTWDlBI2gci5FL4chF/57fXInlkKU8lJ2RJMrScvQF
	 Wb7aSki/XMIasZsffSJPe5rhM9Uwww1Z6Lvnq35vVNohslV+zb467TiIFzYR8Dcp7D
	 coFQs6om05frsoCFMdPrsZ/Sqsi/pQmSztTMg/CGWKdSCVIgLmZ6qM7gqauhY8JJuV
	 LfAIRtCdyoAQQ==
Date: Fri, 13 Nov 2026 17:22:42 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Rajeev.kumar@airoha.com,
	upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: mt7621: add Airoha AN7589
Message-ID: <20261113-sturdy-cope-372ec5b8960a@spud>
References: <20261112185820.1315718-1-john@phrozen.org>
 <20261112185820.1315718-3-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VZgVvdyuSJJK1emx"
Content-Disposition: inline
In-Reply-To: <20261112185820.1315718-3-john@phrozen.org>
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

--VZgVvdyuSJJK1emx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VZgVvdyuSJJK1emx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdHYgAKCRB4tDGHoIJi
0oDaAP9he3qI6FNt/UB2Y/B7fxOlCCpoPFJ7Bke6ChCknlVGNAD/VX/k329GipMt
+C+bFz9cDCTLEnqOag0FIkDLojAwLgc=
=sD00
-----END PGP SIGNATURE-----

--VZgVvdyuSJJK1emx--

