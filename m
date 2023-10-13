Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53F7CDB482
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FB2R70WBb+RX0qj+NMyIeD7qQ29uR6VXNPam77tDofY=; b=s4AsejhWm0fxEztG906hdZ7JMz
	9Z2odkOHUisgFtUU2rJ+SmqoBUHD3y7zqB7MaToBF0IEJRwWQZeRlZcym4419sikHkUJjBdWdgrtN
	X/rIEvlYAQLocQ+1QjPfYUHdAp+Ip7ciwJGC6KWJwLm3rosQW0ra110yvv5lM+2sN7ExJgucl3Idx
	W4ex1qdAtNth+MvEVEU0dZzCiDVmTw0MnW6KfGL9wTNc66M2ynyVQ1QGUcCScEid3HlEqxNTNnAIr
	07PVy2W12mKN7ATElmctlit5+XSXT5HnjQ/Zq0INwexHCzUVnikTCnxApw3450BAAFkLHM6b2zAxK
	yx4wJhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJiN-003dfS-1t;
	Fri, 13 Oct 2023 15:04:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJiK-003dec-0H;
	Fri, 13 Oct 2023 15:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CBEE6210A;
	Fri, 13 Oct 2023 15:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71FDC433C8;
	Fri, 13 Oct 2023 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697209471;
	bh=FB2R70WBb+RX0qj+NMyIeD7qQ29uR6VXNPam77tDofY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vnu7aFC+LvPhcMA4J3tnalV+kHW/W2NQXWzU/84tgyYqjASJ6w0/+tSswWwWuwXtp
	 AFU8Qt8jsuZdU9IIHCELPTMUFHYtKBVUjZapMWdq/0pvI4GfEMI2+QEBvsqKEk7RJm
	 uzCh5u18ELxFh/IJuLjqSUieoPV4WaqlDJw8p5WNKMWSvHO7ANhsSQq7SlkE1StyVd
	 it0f+NpVUjfs0oxpijbaTFE7jDiKC9frq4CXEybwc/Qu7BsCfHIpamDLdvcN7rGO9D
	 ZxPSsI8+nnwbXiAmIxjz8sNB8qLkC0RXkOP1sxll4JwfFH8+d7oK4AbOAD+WCd3Bgg
	 mqM71qr1LX2cA==
Date: Fri, 13 Oct 2023 16:04:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: arm: mediatek: Sort entries by SoC then
 board compatibles
Message-ID: <20231013-manpower-unmoving-c40fc53e05af@spud>
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yaoptxthnmnc5rvc"
Content-Disposition: inline
In-Reply-To: <20231012230237.2676469-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_080432_172361_0962E606 
X-CRM114-Status: GOOD (  10.90  )
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


--Yaoptxthnmnc5rvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 07:02:27AM +0800, Chen-Yu Tsai wrote:
> Some of the new MediaTek board entries were inserted in a chronological
> order, or just randomly. This makes it harder to search for an entry.
>=20
> Sort the entries by first grouping by SoC, then sorting by board
> compatible strings. Also add a comment at the top asking people to do
> the same.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Yaoptxthnmnc5rvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSlceQAKCRB4tDGHoIJi
0uMkAP9FBpDroU9zuSOnz3MjTjKZpnxV7J+6qg4PS6wmhlUrUgD+Ob9+UuB6eUWL
x6jDnjhbUwiYIxqF0LdzvLoTYl4IRQY=
=7kRj
-----END PGP SIGNATURE-----

--Yaoptxthnmnc5rvc--

