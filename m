Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 18:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlQOM6gVFBizm4lhvmWCowC3dP6rFw7+AxDBRE6JYoI=; b=Ie0odUgJKxOBy4tVh1uOFiOUmu
	jzBCtohi5fUSCOn+s9uMHR0G/+fhJeuWDbfZ/NTFROCgnEWa2yLF/zVXklo4fH4ZzpR1HQDgE4dmT
	jzgPOpzVpTPUCXkPR2Egu/fRTmjLMjx9XMoPLf7ecUtbhBI2RE7P42hDn/2qkpXe6SpF4aoHVlzeE
	8IWB1mYnRh8etR46vz/XE8OXh0kU5hfa1WU0EkCE+uGkmsh1/ZwYaSWwx7v0P0fUO42Ry0SjPloAZ
	iJ49ZZkGmJKnsdRLmjypXBsvFjXDJmgxLB4fPglmF38vJED3pFiT1CH3Wz+pAb/GfRXeuG1EjoB9t
	8nV17XdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjcP-0081LN-Kw; Tue, 21 Dec 2021 18:12:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjO7-007xr5-6N; Tue, 21 Dec 2021 17:57:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 286F1B81683;
 Tue, 21 Dec 2021 17:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EEBC36AE9;
 Tue, 21 Dec 2021 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640109440;
 bh=ed9LAFFxmkjkEyfpFrbWs3q90RhuKwcyZUvVJ/3hLok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J2PZYQW5bGTHUK33CAFywnHhMNT5a2zDst0AkksTErU5AyWiVN5lW+MOPQn1d+m+/
 R2och2njJjBV99xWrVYVNKUmMEVcZt7yJL3KWXx4tkxajK7PauPOaIAukpf0ze8c6o
 2D5fdlLBsvxOLL3Zfj1OqmAhIAaI3fJ4IYS3VP/zoq1B4FN//+i9J4Ar/Fua72v/s2
 PhVa4sQqq5vw9hW1Ze3oVuteqzKkqlXECGRZFyo3L3sTNK9MRBwrEuNsDP5CgwPkeU
 BSsOcQrFDJMPAyeMkmA43Eos5t/84kYLPCRVSELrEYIm4WQHe7ZeMdSh3MulUiOFbG
 q6syM+p5BixQQ==
Date: Tue, 21 Dec 2021 17:57:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isoc: mediatek: Check for error clk pointer
Message-ID: <YcIVe+dDoE4SWa3D@sirena.org.uk>
References: <20211217173005.698876-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20211217173005.698876-1-jiasheng@iscas.ac.cn>
X-Cookie: knowledge, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_095723_434356_4B3CF36C 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: multipart/mixed; boundary="===============6476763235284867894=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6476763235284867894==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1QX5gkzmV5X6OYo"
Content-Disposition: inline


--y1QX5gkzmV5X6OYo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 18, 2021 at 01:30:05AM +0800, Jiasheng Jiang wrote:

> +	for (i = CLK_NONE + 1; i < CLK_MAX; i++) {
>  		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> +		if (IS_ERR(clk[i]))
> +			return PTR_ERR(clk[i]);

This now pays attention to the error code here which is good but...

> -	init_clks(pdev, clk);
> +	ret = init_clks(pdev, clk);
> +	if (ret)
> +		return ERR_PTR(-ENOMEM);

...then discards it here with a random most likely inappropriate error
code.

--y1QX5gkzmV5X6OYo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHCFXoACgkQJNaLcl1U
h9Agfgf/f7m/N2DMVZ5PNdYe9h34gphjGr4sR1SnO0LB7atpG9EZ3nAUrR8Dq8HA
v9qoZ9vqPvdaJvzkAQ6Uyk0xeL2MZzalzBicaPDk0ZPMZyMtpGNOBfQ7Hg/eebw0
FgcFdAt7eBcIflPVHE7HxP2Qfma/Yf73nGyF0PClWPeJBUv+D/+IUs2FEmhuOfKT
jK1pw4xc/u8zUYQGR1J8NY3h9e9rLgW/sTwlvDa+o1O+qzZqHdMFDyZd6YUsidQD
/jbPQsA6KMyu0EcUs5r9+JqSJMVhKI1VqfTYxcGfzxKNPs2jyOeBYBbBCqoiWozL
6XZrX1QiHVCptfxh5JkNz2c0Jfppag==
=uxBx
-----END PGP SIGNATURE-----

--y1QX5gkzmV5X6OYo--


--===============6476763235284867894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6476763235284867894==--

