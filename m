Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A983C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egA2zRVCO5ye9Zp22i4F5cr30urD5JG/X5U4kQHF+QU=; b=HO7EDmZOpKx94pFcZcBiuuOgdp
	rByzXCF6Oy5sYLmvzHUmupq4r7wDc1FX0CcPfZlaVBuHg8jCtbVMdGekHqOu5Z+ZszYUUXT13Dwkl
	EPia2WbDPGdjpOCRnFhGWsLxqeT/0zn8AE0ffJYki2Ud7PWM6PUK/0BTQmcJfzmyyXPeWZgjsGim7
	IMSJmMB/rnrK/NcAvnZrlVWlnlXN69qrI8Z0WO/STbck2QWv2EufxSO9S4fw7J10EEfjc/5rTWpoh
	GlZUMp4lmJ3FSBN5PkWCHy83M4nVIm4gJe8xigqxsC9HGyRRnKrHIFrjxWy4YN+DetiMf0WmEy4Zb
	Uq3gbxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCUl-00AB10-O4; Fri, 17 Dec 2021 12:37:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCUT-00AAvZ-Tj; Fri, 17 Dec 2021 12:37:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91C8DB827D6;
 Fri, 17 Dec 2021 12:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF93EC36AE2;
 Fri, 17 Dec 2021 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639744655;
 bh=5CtqiJ7f5AzZgI8XLwwVBxYzfvfyk+EKiJkQa4XB0fM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lJG1BJJDKdhZRifs/1R/XXWOYK2sYD7hefP3K8h7V+9KiT4uxIahhcYP2lD+D7Hdx
 brbn4mOe3QsLWr1hgXVntQBXNqkO8MsFNN/EI6WFMTFqbPNaLZFKfJKg0qOuIbXD1G
 6zs5hSEcDUKG7XYq+ylTHZTXuU4UiHMDQlFKE8YIUGD4I8N4wjq+YMwiLCQLKLi32B
 l+Sn9giOwtxQm1XvOH+49iG1L0Mz/cdoToGE1UJ4Z3+UaR3wbyHmM1//7xJljU6U7E
 Y7Ps+EwdJujkmqozm5oeWemjiX4FD5dzyoUleqSDBn1A6vEat0ID45ctakhfwrb65S
 0DKB0fhNUIXng==
Date: Fri, 17 Dec 2021 12:37:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] isoc: mediatek: potential use of error pointer
Message-ID: <YbyEigc8o5zxrEIh@sirena.org.uk>
References: <20211217120845.628024-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20211217120845.628024-1-jiasheng@iscas.ac.cn>
X-Cookie: Pause for storage relocation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_043738_152162_173CCB4D 
X-CRM114-Status: GOOD (  14.30  )
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
Content-Type: multipart/mixed; boundary="===============1796967810462289552=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1796967810462289552==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zMLeK8tkMwZF4Dyq"
Content-Disposition: inline


--zMLeK8tkMwZF4Dyq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 08:08:45PM +0800, Jiasheng Jiang wrote:

> -	for (i = CLK_NONE + 1; i < CLK_MAX; i++)
> +	for (i = CLK_NONE + 1; i < CLK_MAX; i++) {
>  		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> +		if (!clk[i])
> +			return ERR_PTR(-ENOMEM);

That's not how to check the error code from clk_get(), still has the
problem with unconditionally using -ENOMEM.  Please at least check that
the patches you are sending build...

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--zMLeK8tkMwZF4Dyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8hIkACgkQJNaLcl1U
h9AwEgf+MymMJRprn0AO42rTHOUqzPhgzGnAPqUzKB/o0cBQ6ykHPPVr+u/U1OEc
Zb3iwpu8LKn89t+Dg9mYzkax6PHyT2LE/mhKUJWfBGsCIj22EeJXWweiIKra3RYO
cLek+igwWU0uw+g4BTJpdMvQ3U7+a1+Y83aEHqy2d8pefzwSVZLLId1Pjq9kwEYT
y+fOjTe4rrQtu9JD6AXLiJWiUlbuzeENh6pif2LpkDTIciOGzAX4AFLuxqxZcdxi
/5fBBxUGo9XT/xlKfO8lDKAzmiLXIj9BDW9QK2PgVMYRIuKLJFO9s5KQVwDazCRr
m1gsMsi/R3F9wy/ejTujdvrni+N6Lg==
=txnz
-----END PGP SIGNATURE-----

--zMLeK8tkMwZF4Dyq--


--===============1796967810462289552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1796967810462289552==--

