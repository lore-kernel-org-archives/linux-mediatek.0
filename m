Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B52C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIptbaeADL4/FTJ9XBuXZc4RmdJ12Vahd++orIz3MZY=; b=WnuvEqiEqZRsDjMvbMZXWZdPLA
	5+f/PKxphpcsvDgOYlNyKrEr82u69Au8vXiubeIuef5mU7S5wV8AfB0ltFqbXfbiG09ocNbt1vnrD
	zQDFEufpN1920g3a4OiqQI+ln3TML0hc14JFD9FLcWBRgQnDODV4w34hzue0DPWGOXp9WZmnkfUY9
	Y68w8GIzZPbsiCEBwBGZw9wk8hZAk7kJZS50pgYOuGXu1lFb4jS7s2XppU+brgZuJxCULzvkgUkfg
	t6P49HuwWUCWX+vNcM8T8qn04Izk0U5U1A+DKOV9/pvqfw4XUczSyxzEM/rHeA9U4SlensJKzpRZW
	RsoiYNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58f4-003Ish-Ek; Tue, 13 Dec 2022 17:01:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58es-003Ifn-0y; Tue, 13 Dec 2022 17:01:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61B70615E6;
	Tue, 13 Dec 2022 17:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E66EC433EF;
	Tue, 13 Dec 2022 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670950892;
	bh=uH0LYOSexEh5rmYdYN0yvY9zCHzaNdE5DduFSGRtqbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMVuCAzlQrQHOlsgTwtFZ+g2DaAoEPxa0+vuEZjFvdj6e/v79u0Kle9K+EB37sTht
	 bhP1tiiO+FoqeCieMeEcTS0vq1TtyipfxvUflLhdGnwp5xh68oULfypFNoywHnDSCm
	 /iA2G+keMD7peo0uOV1NSk6zf+DhsttgOoUGAvl7WpzIfnwzOJldQxrz5ccnixN+hw
	 CR0vpp9gmUKY7Nb9Rc4GAZ/ywx5wY6mx62VbO0AF2ZTgW/TobmW9yIPZmeN4LJV5F1
	 uTVIghQx24MF7a24ZgmhTDCiseGw1S612dXJFShK/W/3Uz55jO8i98n6tehWX0LjtM
	 25PbCqI2G18Hw==
Date: Tue, 13 Dec 2022 17:01:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, benliang.zhao@mediatek.com,
	bin.zhang@mediatek.com
Subject: Re: [PATCH v4 1/9] spi: mtk-snfi: Change default page format to
 setup default setting
Message-ID: <Y5iv5kPsOFm0OQni@sirena.org.uk>
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-2-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jC3ytWRRxsiHrz4c"
Content-Disposition: inline
In-Reply-To: <20221209064317.2828-2-xiangsheng.hou@mediatek.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_090134_123382_799C9EEE 
X-CRM114-Status: GOOD (  14.93  )
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


--jC3ytWRRxsiHrz4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2022 at 02:43:09PM +0800, Xiangsheng Hou wrote:
> Change default page format to setup default setting since the sector
> size 1024 on MT7986 will lead to probe fail.
>=20
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  drivers/spi/spi-mtk-snfi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Angelo, you've not reviewed this one - is there some problem with it or
was it just missed?

--jC3ytWRRxsiHrz4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYr+UACgkQJNaLcl1U
h9BU0gf+IvrSdMswYwsbTgS7DBClWKuOuNQAt7lGGUz71eyMXy9UAzCuEDoScV/w
pB+m2dTLcH79ILHq3hDSDj5S/DjmXwJi6Li/mHhYHvk02J0r6WDrU2zw3z2SECrc
fEB8quuER9gh7d9QInhiVNRbNoSL4WAE0B/qIhA4CxJEBximJKR8j0Z/tSSa7GK3
hQ9hudThr90bPE3ykzjPwygyt0uVMgqLHq3zuVX2azJ9yXmrbfWQn6xHvxGXfyt0
3eeRvgpqUL+FpIMvShXLit8oIoZ5tw/HEa5K2I9RlwAja/TnX1ph49NSRYE/swwk
8TCiI+HH1h0TM4w9Q6/TRJMSq91cxg==
=XCqN
-----END PGP SIGNATURE-----

--jC3ytWRRxsiHrz4c--

