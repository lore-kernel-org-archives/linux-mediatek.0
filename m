Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 11:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLomzjbmuMDF6+4KeukTSPMqYU7szL3n9sFFVkOXF2U=; b=pItODY4tTXWDUOx9O6dJ5fYeS9
	qSc118SumY4cPgw2mrA53BvhiIn4nIpFzyEMKzMaixIOqq3BEcoi7RqOf6O8gaZjaJmTzhhhLhaUz
	/T/ZkPhdPq2DKKV/LywxoTwBdtLt8oc63ZnmZFa5uL/5SWm+5rR9n93v+9PaWTkvr06uGu+Jks8Bn
	9WQUR4AtBrjHI5OgGFta+5rpnbhJJqB6u0eVt37wv6bnz0+Q3CQw13Et2gEU+ChZPNeuDC2O13P5a
	fwUgdQnRYzuEioORl2BlCeOYhrLAopkJpgx6T/m/I+RSjXgzXe3Jlm6dvd9g4Mfef1AtRoKrYYtno
	2qz1STkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyto7-00CuVa-8C; Wed, 08 Jun 2022 11:25:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nytnw-00CuTj-0s; Wed, 08 Jun 2022 11:24:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5B97616C3;
	Wed,  8 Jun 2022 11:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EFAC34116;
	Wed,  8 Jun 2022 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654687490;
	bh=gxuRxmn8LltL6EShbwujtTGcPs590C9dPrlLHgw8yFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0+PV/9eBcimatHw1QFoUGvheIowOl9qq2FFyDOD3cBHqgEbBeyHUC+D8j0XdXd2m
	 A4Oh7V1PRqZmIqrvBAK8ejapVyycZ/IKBraDQYigEjf6T/CqPLsNezjNag0ZfqtTty
	 aIjaUe6Uj9XoGrW5cL3sQQ29XZL8QxiNYNyBZ+LYg7KdZKdnYHLZCtM0J2OyYGwm7w
	 w7Tw2ky3wrcHAwtFIzPFBc0eTDadiv1XVUTxNAD9L+EkZRnvFv8+8wYwRaGrDTlIC+
	 GrMAk0Ju6QNB2YQaNUnm8z0+OWcmZvkbNZAObcbgx7Ui2cCkJ9VmwAqK442Yuxkblg
	 27fSaQaECCi5Q==
Date: Wed, 8 Jun 2022 12:24:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: robh+dt@kernel.org, angelogioacchino.delregno@collabora.com,
	aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
	tzungbi@google.com, julianbraha@gmail.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 2/8] ASoC: mediatek: mt8186: add platform driver
Message-ID: <YqCG+9YkuXsDeh/I@sirena.org.uk>
References: <20220607142046.28060-1-jiaxin.yu@mediatek.com>
 <20220607142046.28060-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220607142046.28060-3-jiaxin.yu@mediatek.com>
X-Cookie: Never give an inch!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_042452_140916_947139FD 
X-CRM114-Status: GOOD (  13.68  )
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
Content-Type: multipart/mixed; boundary="===============8226019476247735659=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8226019476247735659==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ETWoB/2pglKUOdqk"
Content-Disposition: inline


--ETWoB/2pglKUOdqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 07, 2022 at 10:20:40PM +0800, Jiaxin Yu wrote:

> +obj-$(CONFIG_SND_SOC_MT8186) += snd-soc-mt8186-afe.o
> +obj-$(CONFIG_SND_SOC_MT8186_MT6366_DA7219_MAX98357) += mt8186-mt6366-da7219-max98357.o
> +obj-$(CONFIG_SND_SOC_MT8186_MT6366_RT1019_RT5682S) += mt8186-mt6366-rt1019-rt5682s.o

This breaks bisection - these drivers are being added to the build here
but the relevant source files aren't added until later on in the series
so the commits in between won't build when the relevant Kconfig options
are selected.  The Makefile and Kconfig updates should be moved into the
driver patches.

--ETWoB/2pglKUOdqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKghvsACgkQJNaLcl1U
h9B4mwf9HGDlHmNk1TjFP832KkIO385bqzgKxTOtgibu1i5TUutnTN3f36lv+FUc
IIi+QaUpFHyArXuTY9vK8ucB4JU4Lv2uPXSngImJwTCIFhcOxgnKymFYhrTXoyPN
Vjd45Su/+rD0FtSZfyoltQ55n/InkmXhSSM+YnPdAef1fyyRneTXE/XQUf9jGacR
hIxq2HvnVFk/ts/N6U29ebBTDjISvCax0YUBBhbw494r1QTKFMSRIdSZ9ETOQeep
WtxnWuVmFNm8WhWK5Fgl2cSCI+NmJ1XvlwJSUsTTf6ogdifjwYF+PyzlqEaVpddT
0HyYM/5R86UhVW1MY9AqJ1yR4Wg8Wg==
=2c29
-----END PGP SIGNATURE-----

--ETWoB/2pglKUOdqk--


--===============8226019476247735659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8226019476247735659==--

