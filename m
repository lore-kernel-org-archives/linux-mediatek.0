Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F61FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFHNTHVZ+tEvCAcwPcWTOaIcTXBcj5Ut2kYeG6ScyM0=; b=yq4VZrskTrY0Gdkyp7OVuRwKeC
	KnCkMS+JKKxSXw9Qsjpff0n2jLWOay/dbzsjdXIyvDv2XSMJQHg3lfYumSi1mxWwppHp1GBTHKcU3
	3zCK2WCrpTktSrqCa42UzjtsAmT8WX1uC/bJByfvS6XE+QdjxT43HgFLEGpDGYypCJ3ZmLD2OzaQi
	MZoqeZRR2QGMHubh10ZRrVT16HmQi3UyW1EPj5rPF3QXzYFhIfdzztZnw1HAWWZKCpyb8kQt64osr
	tSmCgToKd324wY3Mw1lgb5zF7qnE4RC9bnSPRwE2Yvra3R307/6C+GOwBfRnieUKlN8fEd8w+fMd3
	484ddkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0lDl-00EDHF-1O; Fri, 24 Dec 2021 14:06:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0lDY-00EDFK-Ot; Fri, 24 Dec 2021 14:06:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55E5BB81729;
 Fri, 24 Dec 2021 14:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF4DC36AE8;
 Fri, 24 Dec 2021 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640354802;
 bh=T7LlPkzUBjVEPbD6AIg/zCyhIKZrRMsVhbF0gD6KXjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MtzpCEL1gOyA1CMS+xKApP9gKaSnROb9RYrtdWHvkChKWlpCU/jbQ6d2mXMAQ4vS2
 hK8doxQf+eSZsHlrS4tCHORZaCAI1/CwAxRiesTEMPc5ZawANttykHEDKtgiAU98b2
 Nm1b8tqO5ZgpbphoMN1fuCuIupnahPcNtNNWLtGrsqt6crR+I1Y4wfWKbbfaEngDAr
 jhzLTtQClGIToDWGooK9W0QYG6sBs5+uNgH8aL4+FHoJdH9w+pDZFTVxo0M2ksGTr9
 YkJcCCTdBj8e9s0kR05eSvpx7nvu73GG/5y9CNhrSl6flFWLgt+FW20Km8z9uHyaHc
 QvevOaRyo3PXA==
Date: Fri, 24 Dec 2021 14:06:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] isoc: mediatek: Check for error clk pointer
Message-ID: <YcXT7bUpVL/JyAz4@sirena.org.uk>
References: <20211222015157.1025853-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20211222015157.1025853-1-jiasheng@iscas.ac.cn>
X-Cookie: Time and tide wait for no man.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_060645_067764_63E2A18D 
X-CRM114-Status: GOOD (  18.16  )
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
Content-Type: multipart/mixed; boundary="===============9063112904501327998=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9063112904501327998==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YSEnFLCeyQGawA2l"
Content-Disposition: inline


--YSEnFLCeyQGawA2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2021 at 09:51:57AM +0800, Jiasheng Jiang wrote:
> On Wed, Dec 22, 2021 at 01:57:15AM +0800, Mark Brown wrote:
> >> +	for (i =3D CLK_NONE + 1; i < CLK_MAX; i++) {
> >>  		clk[i] =3D devm_clk_get(&pdev->dev, clk_names[i]);
> >> +		if (IS_ERR(clk[i]))
> >> +			return PTR_ERR(clk[i]);
> >
> > This now pays attention to the error code here which is good but...
> >
> >> -	init_clks(pdev, clk);
> >> +	ret =3D init_clks(pdev, clk);
> >> +	if (ret)
> >> +		return ERR_PTR(-ENOMEM);
> >
> > ...then discards it here with a random most likely inappropriate error
> > code.
>=20
> Yes, you are right and now the return code depending on the
> init_clks().

Please submit patches in the format covered in submitting-patches.rst -
write a proper changelog for your patches.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--YSEnFLCeyQGawA2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHF0+wACgkQJNaLcl1U
h9ClSwf9G7UDRag5kdedyFEo47nCabkadilrQ6nYUYbag4e0I2vSap5h04MAalS8
J6Kih1+U6lc4PouNCcHb70X2DeS4PntOIdiqfPNBCTfQjkbncq3JXmthcJdRu7OC
nvcEM8xBTHNJ13xMenWZRL3zVMb5v9d8UlsPm7TgDf9XLZayNrx3YPSRglRvCnQM
UHoHkZa/3vMKmz9hZk31vSy6Wh4QuhEqgeVoUw8WCnc9oNOntwwhTOjsP5KtlAd7
9bIgPpLFgyXU8vlwKVJYaZ7levvzIGGgIJNhG49LDFRuegUab5KhT+BPcegvdtMV
koBzaHgZSUBujKOrTNCDV3G+nbyjTw==
=UCt8
-----END PGP SIGNATURE-----

--YSEnFLCeyQGawA2l--


--===============9063112904501327998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9063112904501327998==--

