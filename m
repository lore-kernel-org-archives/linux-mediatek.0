Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27334C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VajXy8VKCgmH78hIjhm/GyBoQ+moZpLb2R3FSpaIj8=; b=yOASK6fjsctWIfjtzYVJ/VcUE4
	9dgN39VWIlKUwM18NWKck4CKr45y6P5VHI4+TD09aXQrFy1QCClwM7u4zJg3JovXubcuXcvIl3rpf
	drpCAPXFqvx1nLjqk7gW94TNWSZ/3KkFeUY5YmEgCqgEtrTPVlly1Kxy3QhcXN0NNKjJwbl016ISI
	DgwxuLC7yKWKhh0j0YJplFjV77Cj7Ta37MgBy31i9bnkUADXjKiW6q9Ro3J/tivs4HVs6Q7f743Nq
	OQVqtqM3X9euB1E1YV9B1oHwi9+Q6xrsTaOvj7JXOaT4aR0AnsWeIeqWf9eqMeLySj6TjcS9lxKbB
	jhGhfm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwnp9-00AUXC-PC; Mon, 13 Dec 2021 16:05:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwnow-00AUTn-G1; Mon, 13 Dec 2021 16:04:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0892D61121;
 Mon, 13 Dec 2021 16:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDEDC34602;
 Mon, 13 Dec 2021 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639411497;
 bh=gYOJ0eE8CCvPr4jpfQ6mfS7kF4867UnqkkFizMYGLUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OEHI0j2095rXs6qyE/vwCb7G7BeXofSW3mHQnzSYbR29Iwn7jCh6UkttvWGasKUJo
 DT8rfc2EYHgv45v/xZS50BYt7BSApRXQ1IbpfZlhHKX/5PyGSBPvqRq4MWGW0A7NLN
 CUQRM7EVsSh3Lv7dHK4gHd/RkaAQl2SZ+uGW4dazNJDZpE5I2Cq1UlOZH29aPLwLRt
 PQ2B3LgQxbhyw2rRBtIQXFES8UHgh45V1qGNLxgxNhTAtLTZMnucEKmUUR8gSP7CgD
 jwGwRR/QaVa+Ttfso4eNvjgkxKaY/UgNFkkaaPlS9ox5ZsG9e5V0Hf0wxk8iiR6yzP
 51MtX4PP9gyyA==
Date: Mon, 13 Dec 2021 16:04:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: robh+dt@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 bgolaszewski@baylibre.com, sean.wang@mediatek.com,
 bayi.cheng@mediatek.com, gch981213@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 2/4] dt-bindings: spi: add new clock name 'axi' for
 spi nor
Message-ID: <YbdvIPq1hKPmKXXs@sirena.org.uk>
References: <20211211204014.8014-1-tinghan.shen@mediatek.com>
 <20211211204014.8014-3-tinghan.shen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211211204014.8014-3-tinghan.shen@mediatek.com>
X-Cookie: No solicitors.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_080458_604019_C65D37B1 
X-CRM114-Status: GOOD (  12.07  )
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
Content-Type: multipart/mixed; boundary="===============3061575788369705558=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3061575788369705558==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QwPrMVYnODoVzv3P"
Content-Disposition: inline


--QwPrMVYnODoVzv3P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 12, 2021 at 04:40:12AM +0800, Tinghan Shen wrote:

> Some mtk spi nor has dedicated dma(s) inside. Add a new clock name, axi,
> for spi nor dma bus clock.

>    clock-names:
> +    minItems: 2
>      items:
>        - const: spi
>        - const: sf
> +      - const: axi

This will cause any existing DTs that don't have both spi and sf clocks
defined to fail to validate which doesn't seem great.  Given that your
commit message says this is only required for some SoCs shouldn't the
minimum clocks requirement depend on which particular SoC/IP version is
being used?  Not exactly sure how one specifies that in the YAML format.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--QwPrMVYnODoVzv3P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG3bx8ACgkQJNaLcl1U
h9Ay2Af/XYQhfVonsGxpzYrxDghq96zvyoZ2t9jIwoeVsBAchQw3sdWrmcW0wQNS
s7GcStbgA5Kp6T6BLVIeXBNPpH5MmROzcbMYSGksS1OhNfSbC2TxR6P6eETIedRP
4eZCrBxdVHUpBCbJANRPBu6/T8cidCWwuI6Jv+p3keelFFzDTqZlxN6ow+ixW9zj
lqwk84moD5vigyuEGObDgdRTG987ruGDPpJH8hBqLzU0DzP8Hy7yi3jcodhwNwur
QEOL/OYrFqarwAjYA5ozzzecflRBPcjZ/jJvcHRCJTAPldJmmgXZdbOqO3KiXP6i
haN52/C0PIbcRtr6Aab/VWbZ6jKjSg==
=8YG4
-----END PGP SIGNATURE-----

--QwPrMVYnODoVzv3P--


--===============3061575788369705558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3061575788369705558==--

