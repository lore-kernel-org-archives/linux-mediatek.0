Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4768BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 13:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei3mJ1JyCSC3d8gqnAJiN/nIR0IhFVdsz8zlLL7qLgY=; b=FidMSbZbVOgZi26lO0A90cVFKm
	F091vnmW04ArebVQB1EpCAS883Xdfi8yyU40Dxj27fLUfUAlicwKKe1e1bh5fvKXwJM5I8fOzWwSH
	9L7syyNkg1JC89cxKZVRVxlqv+qWBtbQsR8bATH6Pq91I2S6FCvEUhT/1a9kERaXcjSY+FFoh3aPP
	LOaEozoZRxR/v4cknK7/6nUPfY49POcBZQ7m6aulteDQcWbuFJgnOGS3o+l7aIFo6aZpOWx9MS0vI
	vH9xPf+V+WGBJkIGITIOrekuwI22P86W46BdcZI8I38fA8nyFxf/fFfiQqzLMk524aV87QACcOJdE
	vODAr8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH3to-00AEq2-1h; Mon, 07 Feb 2022 13:17:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH3tc-00AEm8-1l; Mon, 07 Feb 2022 13:17:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 184D0B81263;
 Mon,  7 Feb 2022 13:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B55C004E1;
 Mon,  7 Feb 2022 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644239848;
 bh=16LtBqoEMMiLQCTXhAEgcV9F72cfpCz0MRGQUmR5x/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SgzKT68Bq710WvquBg7y3NXAM/Iod+ZcAnvjYD4VuMtrTAlVXobLNEETmL7Ka43+q
 O/qgHMj1k3EiUFzAaOkrPMrDz00JbP0nN81GwmlLoCCzDQMr/jta4Yidb8LYZeg4Ad
 tgP+eraON92tLnXxTcgHuY+6+oge+kIq9UlsiO0mZnVRIdVMfS1tQebItQU3r4huO3
 TUlINgq3vqORn+YQVHyQn33n8RnBFZWZN/lPeDpPC7wPrAlpZvJsMnbepGjlE7tbww
 m9C5A9zx3AXoqecq6FwbsyI9XKQtFyQYYxrMngH+GixVeoH/xE23LGmEV6eMrl2XBK
 +82yZslluD8gw==
Date: Mon, 7 Feb 2022 13:17:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Revert "ASoC: mediatek: Check for error clk pointer"
Message-ID: <YgEb42YZI1iKwqiS@sirena.org.uk>
References: <20220205014755.699603-1-linux@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <20220205014755.699603-1-linux@roeck-us.net>
X-Cookie: Never give an inch!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_051732_275516_4CEBE1E9 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Kevin Hilman <khilman@baylibre.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5063276428007419474=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5063276428007419474==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Aqk5F9s36CVnq371"
Content-Disposition: inline


--Aqk5F9s36CVnq371
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 04, 2022 at 05:47:55PM -0800, Guenter Roeck wrote:
> This reverts commit 9de2b9286a6dd16966959b3cb34fc2ddfd39213e.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--Aqk5F9s36CVnq371
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIBG+IACgkQJNaLcl1U
h9BJnQf+KcWHmQpnCUz7tmRRQV7SHRdfESvOFdafzfZcgMvJqn170QtNLNqQak4h
P0b+AzksW4Ku0XUDtG22ToW3GL6xaahhdK3z1BIBHv42kHlClcOwqtoaLSEV0q4h
OxIEZaiwRFDLX/a0NByy2M3WThSg9SO6W8wnCXGeghAN9nl3tZgIefVg9Vbns/FF
xHtph1zJ8BEHT8c3k6diVcVIWObQNx2Tsyli6hk78+NgCl2vbLLp7tmxIqPM5/iN
mBYNXhOhFl/Fzq5qAOMqTs8/3EWGpXq8ddodg7xO1JgNLLiMI+C3XZUkn8A0l2Y3
Un2z1wcm9xs2FfCnpoxOpM6hJxoTTA==
=v5Ec
-----END PGP SIGNATURE-----

--Aqk5F9s36CVnq371--


--===============5063276428007419474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5063276428007419474==--

