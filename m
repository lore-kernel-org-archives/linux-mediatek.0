Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9660DC25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB0MmybYo3CIQd+gytr6S3Y+F0W3ehGkmi3+XA96szM=; b=e9jj/W14tic30qP8zAT1VRuof5
	v844jTl4OdfNeCUYTk4c3UIY6jtQimeW7QNAcjMMhe6DwW4rmvOkfn7E5DQjCCOqJmLwrkkJHp7mx
	4emQfNbV+ts1x0yH9B816QpOC/HRmQBnrXXS+57EAQUDABmcVB4hlNa+z2D7RyFCqeaS4aZkTXwOr
	Mev6+K0EVr1CzPOWDs7OedURojca+VJylK8C1oC31dmthcH0WvkHtiNgUiIQM76WTKOkPf5fJBJXB
	RVwdJfMHr5X5fzhdC19LAcyViCHKPiJkzyznwVUx6n92TXLbMMSl36FJfUBZadznGVfCjdtQph7Fz
	4d/f6uUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImyq-0095y0-Ql; Fri, 20 Jan 2023 08:42:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImyg-0095uu-3s; Fri, 20 Jan 2023 08:42:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0F769B81853;
	Fri, 20 Jan 2023 08:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63366C4339B;
	Fri, 20 Jan 2023 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674204142;
	bh=tB0MmybYo3CIQd+gytr6S3Y+F0W3ehGkmi3+XA96szM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMV02sHEMtZDjobYL/T669czLEGSbDoQX6as42+vgygCGbcY+YD7ZUieJA7g8W5jn
	 /B08jybxOVX+tZ3rgjLqVemGoktwZd1kraYFLy8zTFxuFZeHf7AI/iT+yqGe4mi4M9
	 CU8QD1EFJ8RbnLM64LKZzBMuLPYgqPB3gENwjRjoOaQzza6CihZie+DgOgEixn3qDK
	 oTeV3Kpz9bAIS6EUlzq3QATDPZPvQ19ScreBoX0em2WLMOFwT8SzfA56PfwISRs61x
	 R4Y1X+uUjzJUO1IZFzN3mRmOdCZd7PgHdvVex4bPonMy7HTtrCPurvNlOBqe/1wafO
	 XH0vZ22MYvTsQ==
Date: Fri, 20 Jan 2023 09:42:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-mt65xx: add binding for
 MT8365 SoC
Message-ID: <Y8pT6dhe8xcDEz9k@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
 <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FHiaATq8WsrcHDfa"
Content-Disposition: inline
In-Reply-To: <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_004226_483819_B54D1F1A 
X-CRM114-Status: GOOD (  10.96  )
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


--FHiaATq8WsrcHDfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 06:08:52PM +0100, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
>=20
> Add binding documentation for the MT8365 I2C controllers.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied to for-next, thanks!


--FHiaATq8WsrcHDfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKU+UACgkQFA3kzBSg
KbbYAg/+NvPont0Ra5ivgZMy0aWdgYNhPXjOIwbtl0vtaaU1ZeUbGnHll9skN77k
w2FSH9BR8dZiTgwgw1PGaVNhvFTU6BOkIrnN9TXAsTdUAj82JxHhQKer4kIM/uVf
cCjwDN+9rrapuUCBJbMqAhEWvWvm1ylodAs1lF5tik0WxBX/qPpiZn6MFkl3qCfm
Kr0zsZ3MRjj0A1eA9F3ptxL1Y7yvPBfFEDWjyaFxIQgkAkIlfOXi+Sv8QyUD4Ncs
o8Uy5Q0EZsTG2CElvnlPW6h0TSIc6uJbMzW/vuXH+3G1IUoYAHFxkNxyDbBoH6Dk
9BIeCj9VdQBSDYwvRrCvB5+eGrCB3NE94eI6ArUFiYA+ZNMIw74bFsIKYnJv/6Dr
VoPG0eOOkJEeWA4vKgPPJzWadCj/WvHlZp5mJ2JeY2zchRf4IuYhUiJiZW+gOhGr
Lp4eXYNxblarSF+9DwYZ+GK/oNVRE7M7JjD2j02eRTunVkkAOIBCzCt+egKq/gbW
53SnS5rSQRhHT+TixOtqdsY8li2pLdpF2Uj9k1eaIoLX1CaPSqo6UE5oijt+8Yi1
+jwAfNQ7Tdcw+PadlhCylVCUw/TLSZ1WTrJTPuLZ2dkWAoem1eLsLedyRiuu4DVV
G2qyr4BM86T+5gNypaj/uufkz2aB5BxwNFU/tJ+X9EjkRf/1m/s=
=mGx/
-----END PGP SIGNATURE-----

--FHiaATq8WsrcHDfa--

