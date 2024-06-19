Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA013C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 17:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnBtZ7Sd6MAJnyQFfVV4G49sUMQYjiSa7hqrQHpozik=; b=lb/RKAX3raeqJ9B2exMo6T8HlG
	X2bQzmzM2AK9g2oNC2MrYzCA7NO/g8LI4YNfGGAMsTavAnwgJJBofGoYHp7vmCK/guLFzNs902WIG
	cTkxEol1B8H/7XAXYKG+X2cukD4Um6oex47m6C1poHES5qbJvVWV204hkTQp14sU67feF2ydBN0pZ
	pcXV96cmMa4wYfKeWtPBTPCJKeBnC1ybyQDYvit3qpp6FMFbEHIfsMY0eS3AmseDYLit40XVvXAFY
	bLdCtMhrOcVoDU6G9OCB1kNByPNgjUnrNfTvBopmYCIE9j/ucpKdGBVrVgekzHNwcbwpBNAAFzrBM
	nFgGM0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzT6-00000002HZq-1e9P;
	Wed, 19 Jun 2024 17:51:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzSv-00000002HXP-0C9q;
	Wed, 19 Jun 2024 17:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A95BDCE216B;
	Wed, 19 Jun 2024 17:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F058C2BBFC;
	Wed, 19 Jun 2024 17:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718819482;
	bh=lnBtZ7Sd6MAJnyQFfVV4G49sUMQYjiSa7hqrQHpozik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIxHs/puxWQlhx0vGCPX0jMsqNTna5ryyot4e/mMfGWARfRYK1u1/D5GfF/0hkYMa
	 g7b8Jv9JllTD/xOjeSlcRYgvFuGGXp2RHweFE7QsaJHB3NxCVjQqcaYsSlWMZmRpIW
	 i/+tEOIz1xrDxXFokhXu2sL9XI/PXMBSF1fGrxV5B7N4dFYx3oh1eW32faPNCHt0Hd
	 cTKE+iT26YQSAI9CC9R0moo1cppquWnjPIxL9qremBtctx4/bieF3Sr1VzOC5YNPhg
	 +d53uD+QV0CLRz4wKGpP99wp9SuiHEGCl1BYwvtxD1NKULErhVL0c9W+UkQp9rDdZl
	 5WO1jsP9RwfXw==
Date: Wed, 19 Jun 2024 18:51:16 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	jassisinghbrar@gmail.com, garmin.chang@mediatek.com,
	houlong.wei@mediatek.com, Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com, Elvis.Wang@mediatek.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 2/3] dt-bindings: clock: mediatek: Document reset cells
 for MT8188 sys
Message-ID: <20240619-retold-wolf-c9222edd647f@spud>
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
 <20240619085322.66716-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eh3REyk7zO/679gG"
Content-Disposition: inline
In-Reply-To: <20240619085322.66716-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_105132_778633_395E6E44 
X-CRM114-Status: UNSURE (   9.47  )
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


--eh3REyk7zO/679gG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 10:53:21AM +0200, AngeloGioacchino Del Regno wrote:
> The MT8188 sys clocks embed a reset controller: add #reset-cells
> to the binding to allow using resets.
>=20
> Fixes: 1086a5310f9c ("dt-bindings: clock: mediatek: Add new MT8188 clock")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--eh3REyk7zO/679gG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMalAAKCRB4tDGHoIJi
0gMaAP4gkosxEKLci6rWeKRSAJLtmgO4bDoFaFXCBri5e1osWAD/UmS3HtF1x/5F
UtPqDbZIQqUAV+7Oxtp+N/SWGIUWlwc=
=+3YS
-----END PGP SIGNATURE-----

--eh3REyk7zO/679gG--

