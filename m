Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B93C7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjJWS46dxTA3LycgAoFHNjU3BCgQOcsso14dh/vMCEA=; b=PeD4Np1hlnoa3eo+6MlzKxZOeL
	0XeP7w8zCmGbWJAPoQdtOFjAmlXf3ui/HPa7ChLE9BVD6LmaW52MgDj0ZyEDmvz6deIRzLl8jrkr/
	GIyA6INjjNR5/g0EVc9HXqehNo+FabA09DD/jmfOTeLb0qAFw7L+gv3IcC/IoJ1UuF31CjiM5B9Yk
	f37D+6OTGUMjfVto5oJ3pyO/JDx5TGsLaf3+zILC/ZEzTV05vX/Pr9sbZ0tCkdIGjB3QIR4jP6Xg6
	Zo0uB9CM+cw25X0L8+aG3nnjIQlUELuQJup7pm2Z83uRmF43IIxWwZzCBzysMu+X984zgr9tAyZjo
	tZFg3uNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1QGk-00A5jv-1k;
	Tue, 23 May 2023 11:33:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1QGh-00A5j6-2O;
	Tue, 23 May 2023 11:33:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DA44624B1;
	Tue, 23 May 2023 11:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABCFC433EF;
	Tue, 23 May 2023 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684841610;
	bh=3mVudTd0kFY4TAOh8iGgobeDIvly0omcI558Swt/BEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNO6WZlKwtuN506NQFF14svIff5nA90RmepWIWZB9XsjtTFG98TAI2Y1aw/23wa1+
	 v4ztOMiXHtKJnDGAsk2wQpmu3YpSleXN2+Os9+N9kVUD145vFFBmypQuqATZ/yIA3s
	 5HR2K0ISj4Su37xw493gY5krPY//c6A4iQ7jTRbQF1a1+Q1W6JAWk7gvOgEUexLPjY
	 9OXY42JM0A1TA5E+n1go8MKy/6C9aPknVVGOYh7svWsYmJzB0Y92RZi8YRVBV7aBfg
	 f4y53jsEy3f+JznQqHUdTn2OQ8eFrq2NLaBQsUeIKD/uaolvzbdPppHWFsm6NCsWq+
	 k2SEsgKPDFlIQ==
Date: Tue, 23 May 2023 12:33:25 +0100
From: Mark Brown <broonie@kernel.org>
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
	"Tim . Kuo" <Tim.kuo@mediatek.com>
Subject: Re: [PATCH] spi: mediatek: advertise the availability of Dual and
 Quad mode
Message-ID: <97af2a29-8aef-499d-9f07-bb262ec398cb@sirena.org.uk>
References: <20230523112608.10298-1-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NLalJAOfHCQ26xry"
Content-Disposition: inline
In-Reply-To: <20230523112608.10298-1-qii.wang@mediatek.com>
X-Cookie: Beware of low-flying butterflies.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_043331_827966_4A1D0726 
X-CRM114-Status: GOOD (  11.25  )
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


--NLalJAOfHCQ26xry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 07:26:08PM +0800, qii.wang@mediatek.com wrote:

>  	if (mdata->dev_comp->ipm_design)
> -		master->mode_bits |= SPI_LOOP;
> +		master->mode_bits |= SPI_LOOP | SPI_RX_DUAL | SPI_TX_DUAL |
> +				     SPI_RX_QUAD | SPI_TX_QUAD;

I don't see any changes to handle these modes?

--NLalJAOfHCQ26xry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRspIQACgkQJNaLcl1U
h9AQjwf/Z7rx0bZ8ZrN0OeYVi+MwMAmK3a00KnP5C8kE1UYf7pWyiVo4AJergA0c
3r3RTV5UN9kiD+MPWyzuYeeHj7gEESvkATksH9Q3LsARbufMdlTR989BRTuT6zBO
g8RyyXcA4ukw84ad4h+5AisMnpizk6ADKuB2y6a2hKUZDhsp2MYFcLC8EJmTzl0n
fC+itAF8PJMWs9f/EeWim0KCcFqpM9zisRfHnsfdSQ5nIPb+ausQLHcpU5F8DQcI
2t1d9bOPovH9wkYpbyvbqcce/qcABFidHVisq7t1DY12bYiE4puj0S/0CsI/OLTj
cZ8co2SHZl/WzNO4pRfkHqVYFu4B4w==
=cE3K
-----END PGP SIGNATURE-----

--NLalJAOfHCQ26xry--

