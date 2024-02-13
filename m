Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16590C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjPr2WSWhtcrjXsWrqNBb2JLkYeHIe+jLmn2aStuatM=; b=3ZupagQDFD3FietY7YHixPbtc9
	KoTC0zAV/fnxXcmWD13cHoS6VIe0ilLBiwOo6ZMYjgtt4/WxAXnwp7JGHSHGFAaVyrvXLZlgA0vu3
	2g0r3lQEN2GB/TYyRHtWTVqEe+cUug8grvK1RYfpEzLL/bE0bI1jEnCuNGe12/eoFQXISMRQpITo9
	O9Yu8MdhIWwmpaJ1wNZ8o1MDNAsWcsXBFYUWg5dQ8Bz0LX1lDPpld8pcQooO1plgXfjUp672njgAk
	A+mmsti0ZfXAH3OJ5bfXL8JDY7Z/fjPh6HZSHpyvlL7edKnlOPCMIAmN1qQchV3j9fZeqNjfCeNwL
	U/SJk63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxt5-0000000ANaK-37VC;
	Tue, 13 Feb 2024 18:52:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxt3-0000000ANZa-0eOu;
	Tue, 13 Feb 2024 18:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E33E6CE1BC6;
	Tue, 13 Feb 2024 18:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B245C433F1;
	Tue, 13 Feb 2024 18:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707850326;
	bh=xGBGp2KusBdHqpkbLi4LaLap+E1NX9EdzDd8gu2SmTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7Z8QiWk0+h2LOMo4nEXq0PRd3wd+/VTYxqc5/Ef7pM3yq3UC2DgGFntmINrSNDSG
	 M+PQq4HFiU4dUEm0wBQbCf+JHyjXc7wH3yAOkfIoKCQahUdTqvRLH8ke4G+7wvam16
	 1ahC4VQMc0/0TqzNuJ6u2nYylngS39s+2dxJCIafYz9Ch0neW8qalXPgAHg+xIP7BN
	 7duhEvOPlIEMDgGKF0KnqPjxZqgp87mtbGKA6fpMqURJ5QY7UQf8y+tHdr3HfThkRK
	 /C1F15CgY98ME9AO65lN8SPJEIDaYQW1JfhW8mrJ3XlftNWEyKwnvfYWvOChuH3XNp
	 Wo5Z89sqGlYYQ==
Date: Tue, 13 Feb 2024 18:52:01 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: dma: convert MediaTek High-Speed controller
 to the json-schema
Message-ID: <20240213-dandy-snowflake-1dabe0e88b3a@spud>
References: <20240213063919.20196-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qjC9HOLp6OBijnn1"
Content-Disposition: inline
In-Reply-To: <20240213063919.20196-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_105209_388162_3745D5D7 
X-CRM114-Status: GOOD (  10.67  )
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


--qjC9HOLp6OBijnn1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 07:39:19AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:

> +  "#dma-cells":
> +    description: Channel number

I think you can just remove this description if you end up doing a
resubmission for some reason, but this looks good to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--qjC9HOLp6OBijnn1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcu6UQAKCRB4tDGHoIJi
0qwfAQCsjz5wMsihMi/eDMkAKpOJlXsvSKeljSH3NgN3d+2jsgEA8lLln5Z/Wazx
tEcnartUmmlaaPue4Um+naT4WLBBvQU=
=4BX2
-----END PGP SIGNATURE-----

--qjC9HOLp6OBijnn1--

