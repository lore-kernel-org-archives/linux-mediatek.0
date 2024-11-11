Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E920AD3ABF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4MgOboHDGtArnfKiEq9gLM88LKKae7ra0P3dbQQh+o=; b=LXYOjhlwygGZwK6Zp5S2uCBRoC
	OUREy8YlWgC171bH43yeJ3S4lA68+02eES22uQbJZmavMcX0uFSorXHFx+W20RDftKDVf6qpiAA8S
	c9axAYc7zB8pphB0hm1z6AVlwIoEkdgJOQ7slrkMX8ORijypQ75KeIFC1eo/68yKKKbYZQ9rdzGBS
	hllzy4b/PeOlOVmVa3QT2YUzeJx/9jqODKCEV795M8HElMLGhrEB5sTfiB9wDl4Ys6Y8GQLs2CWWv
	Ues5A0X1l1rzSEMKo+gE68IJOCR36BN+C3OEz09yryBMBzgn4D1ibMbiggLT1M7WvMdhA91KiOY/0
	EOaDwwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaOu-000000016Ko-1tSQ;
	Mon, 11 Nov 2024 19:48:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaLz-000000015nv-0Nxo;
	Mon, 11 Nov 2024 19:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8A27A404E0;
	Mon, 11 Nov 2024 19:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2182CC4CECF;
	Mon, 11 Nov 2024 19:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731354337;
	bh=d4MgOboHDGtArnfKiEq9gLM88LKKae7ra0P3dbQQh+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nr0d2xAfMpq6SNZ2t+tAWHRm/SOmakiGQ9MWVnJfK+KhLB/SeyZ8RFVtTDTx9CYcM
	 GzzCHp3/npKlx6jVZ97g01NSgbyUVMhbtHMmmSFu323D36vo5XVFNUdipdozTJCxHd
	 ZyfmA8KBfNMRUjHCV+KqOm38DLJG/V+2lEEUNKgf2LkYMiQ8Y1DknmdSoNa1P9pTBU
	 BCyZNXIlX+svZbS9VKhjg0zNgHYrTHYubQ8OzDNgXPpsOrrHDlen7axLHaq7jIoZeb
	 pZ3SjyxYz7EjQBQBZ+TRuvnxyNpX0ScEIvjfYJ1WxoHz+J6x7TmIqLeDCogfmWt12m
	 JqtJvQDScsWfQ==
Date: Mon, 11 Nov 2024 19:45:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] dt-bindings: spi: add compatibles for mt7988
Message-ID: <20241111-progress-prowling-218c6deeb80d@spud>
References: <20241109105029.52748-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9tiAjd6YQ+IiB3Gu"
Content-Disposition: inline
In-Reply-To: <20241109105029.52748-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_114539_328114_F84CF324 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Leilk Liu <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--9tiAjd6YQ+IiB3Gu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 09, 2024 at 11:50:28AM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> MT7988 has 2 different spi controllers. Add their compatibles.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--9tiAjd6YQ+IiB3Gu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJe3AAKCRB4tDGHoIJi
0mw1AQCb5apX26pqvjtNd0u/x/gAxpqpZjI5yV2+/RYZnNyFvQEA9vWKqaUMxxMG
5FhEkO64XoDuZC7W0YM+ELEVVtXM0g8=
=X0+9
-----END PGP SIGNATURE-----

--9tiAjd6YQ+IiB3Gu--

