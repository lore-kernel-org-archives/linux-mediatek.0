Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3A4C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+SkSMXEvZL7JnAfLyB9WU4yUTd/UNiUILkQDm11AUc=; b=iFwl6WKygWqpZ4wtjMX3PGBR4U
	zrky9Nrtmdg2F+VGTHmysznWWsaQe9i/cQBhGZ1CvnnXDSxlnabyGR8pbB3FdRHMzQ4qDl9FEpv2Y
	7PPIGHfjzgVt5QKl2HQsuMihcL/svdVmabwyqtfUYZvVOD8ks8S6ib7qQa+5pUrmGA1eZtkH5/XU5
	V7UM2qX6Ctcq4LjgRH470swobURRUfqvyYHez7qF4f8iWbzAsM9H7WWNM63Y5BiPH3LTpptO2c42t
	kmbhjLAq0U8PlGcu1wUQ3CJLw1r9XNr02zWFYqeMevKD08PCHmIGplA3UIAeyxbMHwz1vbGtMIo0P
	mYaEhudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKWv-00HUxE-18;
	Tue, 23 Jan 2024 17:25:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKWr-00HUvm-17;
	Tue, 23 Jan 2024 17:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C819A61C0A;
	Tue, 23 Jan 2024 17:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9239C433C7;
	Tue, 23 Jan 2024 17:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706030710;
	bh=/+SkSMXEvZL7JnAfLyB9WU4yUTd/UNiUILkQDm11AUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsyQZ1ClhmUW+4PfVIea5D+atCt9xW/phWP1Ii1PSiS2YlGgTnee/sGoouvb08n27
	 IQxIk1u6H7IGHU8tvDzFP8iP6hiX7O7H9Jlzo0Jyk0Rp8T+Qa9veHJcoTbuYRdHPZI
	 JRej4AbG0ztvIkkb5xW1Cwfw8XTYUoq4hbDrIuywtDECiBc8j+2a+VCj3vu3kmM39+
	 Zv0NTmnqbQ/CFztrkqZjrQlYYcicdi1CDzv0bZV1d3NH0JbcyBL6zRWY3dWMO8rcKY
	 oBdgxmFjhkwQQDGk1SzUDn+z9bcG7eFRIy6xW41Y5xf76ktmfZjLX7zIqMCwLeMRt5
	 mZilSAZa+7QKQ==
Date: Tue, 23 Jan 2024 17:25:04 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	andersson@kernel.org, nathan@kernel.org, luca.weiss@fairphone.com,
	tianping.fang@mediatek.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Introduce ITE IT5205 Alt. Mode
 Passive MUX
Message-ID: <20240123-doozy-sureness-ce1bb4d555a2@spud>
References: <20240122110446.140226-1-angelogioacchino.delregno@collabora.com>
 <20240122110446.140226-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/XCj4OvKvckKfaBz"
Content-Disposition: inline
In-Reply-To: <20240122110446.140226-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_092541_426579_A1FBBCD5 
X-CRM114-Status: UNSURE (   8.79  )
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


--/XCj4OvKvckKfaBz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 12:04:45PM +0100, AngeloGioacchino Del Regno wrote:
> Introduce a binding for the ITE IT5205 Alternate Mode Passive MUX,
> used for connecting, disconnecting and switching orientation and
> control the SBU signals for alternate modes on USB Type-C ports.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--/XCj4OvKvckKfaBz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa/2cAAKCRB4tDGHoIJi
0sYQAQDQyqLUgZBdQdVEY6xff7eoCvbdU/jaARvKcKaPn1vdDAEA/hmLVL/fRr56
YR12yOvgBBZRx4C0x/9NuNpVPSbnbgU=
=HBIR
-----END PGP SIGNATURE-----

--/XCj4OvKvckKfaBz--

