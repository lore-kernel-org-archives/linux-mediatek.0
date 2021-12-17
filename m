Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWCLNERKvlcldAxDukUYvvyaCsB3yvTF4z9DfMPdTAM=; b=lc+VWBA4g0tiSWzqhYZogSy6Y/
	EhvyODdFzE1ZGy93WvR6ueWcOqF2H1TJFT18A7u7NDTDyzhPA1GnG2EaC9QkAKvcbmMK2jCkGtk7M
	MY4vLMv/SuPZYOSntLF/4hb/NLP/oN6DOhwRfWMQZ0k/mryEia2SidQ5S9ouvYF0Bt/d8ulLshBmX
	VspZTK3EQmR7LlHjoBRCX2Cmij0TbB+VRdLp8qdu35Q0R9v8v+43Uyl16U826D/p/WBKQcMfrzB3I
	IyoxlaL2tKnu4HDlVIytyRBy1sjFAqWcGJaG9LII5EQAzP9+HKQzHoLmhYc7TOoNmEhqkrvpIAzHT
	b3lSFdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myBYf-009sRW-2Q; Fri, 17 Dec 2021 11:37:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myBOX-009nqB-No; Fri, 17 Dec 2021 11:27:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59FC9B82797;
 Fri, 17 Dec 2021 11:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4A3C36AE5;
 Fri, 17 Dec 2021 11:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639740443;
 bh=gCj6M3fgYAowhTn0haiHmB2bEGG+t+sL1+hhnl1D+Gk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=noOfF5QfATS6h2XJ7bbPpixX+sCebZ0/24d7gSLMG7CpYv8B5xl4ixa4UimMEpwrF
 fJDx/dnccIJd5w7cRPZj2gEsKtSabX6UnwtM9cKAelfGcjmWVhrmx6rq02k/UTbzUM
 Ik3wrH3aQ8TkXc6qLQmY0AffBavin1TuVrpVxBsGRKTDoVpoyF4jNYnaTpNN5QUKpH
 n4WQ1l5tvXMvn481l9whS/9gxzZO4ZQUZMSpQQhoV0V53NHCZP46mHwNW7YqvtJJ+p
 F0Isp1xiqd7bg8sjXt+j0oPjO7YUsIIRutdnDY/lW2SxFg/YyMUoUYgtbj3MKd+b5c
 CiC3Q4XdNS6mQ==
Date: Fri, 17 Dec 2021 11:27:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isoc: mediatek: potential use of error pointer
Message-ID: <Ybx0FouFzlI79zjU@sirena.org.uk>
References: <20211217064140.517160-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20211217064140.517160-1-jiasheng@iscas.ac.cn>
X-Cookie: Pause for storage relocation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_032725_956075_373E9F64 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Type: multipart/mixed; boundary="===============0037539052703956231=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0037539052703956231==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8QwhTE1g/UziorTz"
Content-Disposition: inline


--8QwhTE1g/UziorTz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 02:41:40PM +0800, Jiasheng Jiang wrote:

>  		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> +		if (!clk[i])
> +			return -ENOMEM;

The whole point with returning an error pointer is that there's an error
code in there, we should use that rather than overriding it with another
value which might be misleading.

--8QwhTE1g/UziorTz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8dBUACgkQJNaLcl1U
h9DsBQf9FTg6jkzyG1wK1SgbhFjoSeICsQhrkB/lOxpY+krjK5nB7PacLuSPEQcd
9kiM1QqQYFtAxQsHTxJ5j8l4zrimA1BQ67miLtrMN/Uv+/fb47HWaKqOqNCaXqYg
aKNbTREM1+fyeQuj1s24vM77eNQ098721WcVaecNYWdf7eWOETIcrkrkX/JlEW25
jQoDYDZ+qB/z2odrPdBz5Kh23F/u/+Q9wkqlgbHxKPGSVGbjKRYfkuGuae3sN+96
7V9DPtzTL9iTy+w/3Sx1RW0X7M65C5d2CN5X+gd6C+nUJyD1ibMl/qENRiXD659k
pgoYR2SCBW+IawM37lVegfSx877blg==
=pcgO
-----END PGP SIGNATURE-----

--8QwhTE1g/UziorTz--


--===============0037539052703956231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0037539052703956231==--

