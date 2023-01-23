Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12CCC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x1VDr5X+k1lOzlKR9ZcryXNvLFoBtiDEgNM7M+D5TM=; b=Hvihq1QkQaAZzfUAPI/kWPeRwG
	BLA2QX21HodHcPW06f6I+l/+QJr/up6r4JjsKPOdt2C9797Je3zDoFm8sQOJDMjeNjgMrzd9iIbmE
	iRNtCH9NuUg7VveCJ339qsj+HUM3sqGjqDHaLYlNPH/GQSevAqnmUl4zBb64eiwrmxy++lOFh581q
	CDf431adKPTt/Jz6KxorLuCRWV6Qzh9BkTfUQU1W5JL+sKLzDiOASqHVmN9a3c+TF7sDG7Q+3rvY2
	VUStoskNhqNcNSiyF7/dDYjrYj5VMZ3nRvCRgqCSyIZN05OymRIp9e9JBxvV8cG5iBjJNIzQeOiZN
	gU3wraQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvni-00H2yS-GG; Mon, 23 Jan 2023 12:19:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvnX-00H2uZ-R6; Mon, 23 Jan 2023 12:19:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 988FCB80BEB;
	Mon, 23 Jan 2023 12:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AFFC433EF;
	Mon, 23 Jan 2023 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674476376;
	bh=/UE80dW4QUmwYJGNIovZ1MTwLypUd44/RC0OvJ6z9RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyu+kWu22XiPKryfvYio/3t84OOQmj1eZ9e2qvynSZxTFa5f3bI6+zhHV0BPjbyg9
	 UIB4/LkcdjNdE7hwajwiGhxc4vE3Q7IjGpiASz0F7gRg3VUFHFDcNL7U4KHle+iAV7
	 s/Ov1tloAY/kop0o0s02fj5CnkEuXS7YBdc/QhI9lCr/KlI4yCOtqBrMyJsIa5ojpg
	 zTsp/Z1AQMnZ3YC1az9eKRVA3aBPAwOYYcIZsgxgYDEB7nxH+qezXE0vZAFno6b/jD
	 ZEUZc0NI3dekjwuevSRV7ZUWm1N/Rku1K6nq5ROsNiLh6qDXTA40JCCa91limv9yxy
	 zIoV1SnCrL4xA==
Date: Mon, 23 Jan 2023 12:19:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
	matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
Message-ID: <Y857VOG5upNJfpdM@sirena.org.uk>
References: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
 <20230120082054.610626-1-michael@walle.cc>
 <CAFGrd9qXL-u4XzG9MLK2zbKoDudhTYpr-gJaZPjbysJ9Fo2gnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F2NJRR7q1YrufWdq"
Content-Disposition: inline
In-Reply-To: <CAFGrd9qXL-u4XzG9MLK2zbKoDudhTYpr-gJaZPjbysJ9Fo2gnQ@mail.gmail.com>
X-Cookie: Serving suggestion.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_041940_060782_32E68E24 
X-CRM114-Status: GOOD (  14.38  )
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


--F2NJRR7q1YrufWdq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 23, 2023 at 10:37:58AM +0100, Alexandre Mergnat wrote:

> Yes I want to expose the SPI on the pin header for two reasons:
> - It's an Evaluation Kit board, I believe exposing SPI helps new
> customers to try/understand it.

That's not how this works.  Anyone connecting something to the
SPI header will need to update the DT to reflect whatever they
have connected, if that is something that should be controlled
with spidev then they should add the compatible for that thing
to the driver.  If that is something that has a regular driver
then the regular driver will be used.

--F2NJRR7q1YrufWdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPOe1AACgkQJNaLcl1U
h9CJ+gf9GkI4+fuHtKD9NFRFbMvHD73e01pZDSR9e8hgGqpBvCOFdvnbGM3XbfH/
JE9mfuuiW37qqJn55qD2ZsPTUFxGjiWOqe0prsHjRx3Ana5GHfibpVLv5/mPPUlT
ZRZr/vVWEJy3L0YabKPVe+18PSVlwtUhhsialkjCfRLzat/LWJL5pKwHb6YpCwlf
NPtZlw+K+dZnJkxobsjvXR51Q07F2idjTBCEqiEBe5BMDMCesW3Gcd5Bl0T1rLXL
wmrb+tpS6qqelUP3+yOPgy69z0jVfVTJ/AOYDqhNT86dyYkNAnjcj8tYN3dHuN5a
v4cMmOkxJ01vdv/bbVqa/28BioVk/Q==
=dFfU
-----END PGP SIGNATURE-----

--F2NJRR7q1YrufWdq--

