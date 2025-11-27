Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E604D11183
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Nov 2025 11:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0zXTatWlGYyQ1fBUHQXGdNueG6uZZH9fh8FR1yj2BA=; b=bO43yQQg3Dg9/gGeDwfog7mbPq
	NWaE0LL4krJtIIgvjBveOAkkeBUDizJNxGJNX2XLW+iwm8HXDXpKQLNP4G2JMci4PAuM2x8+yGS1r
	nQaIxZ2TumkBFWZShLNXU6UlgjGZp69B9iibz34oY6uBqi5pGRN5BVrEuL6NtvCrwe02LVMcvd3eY
	uJN33x/YubFU1aG0pJdOzuGzjP9EMIsGBLwcz6cWlaqv3anSXvM2FeILfWudNNSortYOsBSVcdCkc
	8TMEooSOWWK31/ZdfMSj3OQFTAs/L4NPUwea0VxSQk0wlB+MtQlqAdsZWDHNvaNmgWo+tOE8Wwasi
	b1f91RZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaPg-0000000GTlz-3djU;
	Thu, 27 Nov 2025 11:43:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaPf-0000000GTlf-3ezR;
	Thu, 27 Nov 2025 11:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F210C60182;
	Thu, 27 Nov 2025 11:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6F2C4CEF8;
	Thu, 27 Nov 2025 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764243830;
	bh=B0zXTatWlGYyQ1fBUHQXGdNueG6uZZH9fh8FR1yj2BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUbR5IUVev/SAp7VYELq0Hv79ogO6ZOFkZVGU256mA2FfeVCqS2uQJ9JMT5H5C4lT
	 7SXPDMl7BaxkXpaBlkyQdPWIzTi/oTO3tdAsbDxC+OtZI0RCtkKYIYOdae4nt8Opnd
	 IsYppPe2fSMuI0M2mwE6IVU7JDhAId3/AG/p4stdPVTcrDjDq++nhBomfC7p5B0w8s
	 ptg2jBunufvrag5X6By3hDg+jaD5z12h99FxfwOKN4PoRpiwEayG53jskNt0reExmF
	 kMPTlvazu0zb1OzxZ5rq2bWQWPqesyDZkhOhnBpCUBMIFAUy6Po4zJTzOBJtZ7v+O+
	 zZSksJJEDNrAg==
Date: Thu, 27 Nov 2025 11:43:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: spi: airoha: add compatible for
 EN7523
Message-ID: <671fb90c-2076-4901-94fc-1eadd1742516@sirena.org.uk>
References: <20251125234047.1101985-1-mikhail.kshevetskiy@iopsys.eu>
 <20251125234047.1101985-3-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hZjdanbYJIzm7qaB"
Content-Disposition: inline
In-Reply-To: <20251125234047.1101985-3-mikhail.kshevetskiy@iopsys.eu>
X-Cookie: But they went to MARS around 1953!!
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


--hZjdanbYJIzm7qaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2025 at 02:40:46AM +0300, Mikhail Kshevetskiy wrote:
> Add dt-bindings documentation of SPI NAND controller
> for Airoha EN7523 SoC platform.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--hZjdanbYJIzm7qaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkoOXAACgkQJNaLcl1U
h9Cw6gf9E93O4G2Sv2weW+jNdofoptCvmy7ha8GrfKyTY6UTeiTqpxs+zFNzl0gu
urBvRIvfaQKLBAeVwyUPBEHCrG3/s1XmYfdezQx7ktFk3uIX57bH6Rddx3zvobVV
oUKwNBv/NSZ2GCCZWMQPXSTbIAYPc2Y1JCNs5CMkEDYHe6WoZyHhH+AQA8HF+3lq
Eat5qvzfO2gQZrY3ko+I1FhMKumgIHYnGw+0MN94DpGwlY7HbS4d5VZavBXRQ1eD
oo5iU/PW6xLI3EHKfrz/lfw2s6gG5fst4g+HiGSQtLgUKvJbkzmwysrdWY9OgzxI
01gcZJaSTzg9FYi8wYwZJ52+blYMHQ==
=mqNc
-----END PGP SIGNATURE-----

--hZjdanbYJIzm7qaB--

