Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C86E77199
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaZvubb6b/5Y65DKB0twQiviVJsKDAVdNYBE/1h2cAM=; b=RHFLC7jm/CT9e+MKY2EonID2mG
	9jEwTkStI+Ds+6T86XzxpbmJTgrrfCwPIpVx/OuRD2dxqdPOUt2oxjd76qtHPV0R0u7vuhvjjnXY/
	SBIud7P7a7JRT2Q8Q9DEDd49ZhXOIR6hh4+pOfdsWV1qtocrBt5nKWG2MhVzQCDZo+pjjf7C81q2t
	Jek1jiyu5CcrAX0CcVdHlUVk89MoPzxuHnZLfhgRT2+Lsn5T9hFOoaChbFnMHAPKmRcifi/K3bDu4
	wWJo070ezwxLe7BUXXTuwqq99pXpOyqV2wIgC4N3kY3kM1m1eKRH/n+JoECmwFP2q0ECIFKURCROX
	eaJA1l4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZDD-00000009FTx-3Ftp;
	Wed, 08 Jan 2025 16:47:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ3Z-00000009CjN-128u;
	Wed, 08 Jan 2025 16:37:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e3621518so8022541f8f.1;
        Wed, 08 Jan 2025 08:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736354239; x=1736959039; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oaZvubb6b/5Y65DKB0twQiviVJsKDAVdNYBE/1h2cAM=;
        b=Si2Wsu1MDdafNlCO6nVGMjZwCGjm9HHZQ5KCsYPcXDxyUh30EpJ0mQgPETD00jil/0
         pOU4JMtsNEnTNN1DgogILdTB/7owQDEANCfYzp1SnQHX0s5dNw1kHkqIqfPnEeTmzJiR
         nHzRC+iQbGeoCVCMWQR8EUV4rSfWPa8iUSx1j2vOorsilg0JdEz9sXzqzM+YlmymFZYJ
         JXEI/0j+A6c0e/zAVz7EdiFC5fxB6/9zU3RQZ3xYvkseYGJf4vZGDSB+VwqY/J65u6Rr
         64ijsooCqnfzN+F5T4T/5ifLq/hOFVGnG0E+aPQBrwK9XaEFiuC/OZzBWOGEsggwNGNV
         CpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354239; x=1736959039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaZvubb6b/5Y65DKB0twQiviVJsKDAVdNYBE/1h2cAM=;
        b=MXnLFgHJAklh37ePio92v/0YizKC68v0Ci810sJCq4jWH2L840oLJcSx+N5kGtXy3f
         dx087YwOq9+98xExCp1ihtgEm1+uQOimXmPjTyU4XOqE98NZJGyWgpZYXZHsQ28NDETT
         qL2UBGtRUa14kTINjZVqsvAF4PkvS3slSthOnazuTEZXJvAwbfMcUH6+cUtZ2GrFPjMD
         EJb2SfPKDH5eJk0hgQPrB3K7AseWERJB5/EMK4mUDDSDb7KdKYg0eIOz23XjJaIQ7JfD
         40RgQirjFDvwlX9A8luNWsio5K62Ulm+aaWysfaxGJlcQf8KzP/pqUWt3kpRF5fJXRsv
         nXRA==
X-Forwarded-Encrypted: i=1; AJvYcCWiYfZFF67aDRLPcDmDOtyqk1uaY8hb0ywX5mZ4jndimCtPhTw5pbthTiVIQM1aPXEwo+6TOQbsj+ASDYMCJ97I@lists.infradead.org, AJvYcCXPrrkQo9ml5h0ynnnw2c52/e2Rf25vuYdgN4cMwwrdlkBUUADNw52frtOdTWsVxyLT/0Da8WD/wpAQO0XqA+U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwENogJl9JBWXcQZwY6RxneTbJeqYGhdsw4Ud/y/d35ljQMOOTp
	bnBTu8cdrdj27TDCcI5js9tiNXQMAl5EG6WWvQsC/EJ/8+3j3U5o
X-Gm-Gg: ASbGncuGL2tKsZ3HLP0cwtxbC+D2dmAXK07D/5mM3c7014+QV639FmlSsnpsXE+wkZY
	hfcojZU9tqVTi7WnlsLcgWKmPdeY7i++Zbf8ZXjDwyipFNH39uCkyJnZEtlO/1qrBHcKkL/9fLs
	Kgnkygp2HCZJ5fq3trHeJIaAjdryriR+m1xfyRbJ0sznf5iscfYuVjfkA3GQ6DmwjqeiEKKQCgs
	SYKRp0vEGlCD3zjVZYpuPiBqLUnkwBqmx0rroQ65DC6H+vaTlJf4lnNiVoziMl4Z7PwRIDlKIdi
	LMlzPCTRoo2UwkyXbKsDXZVGXorgTIdacGuc8iDRsYs=
X-Google-Smtp-Source: AGHT+IHK2KDzhIt68MjkOew8+0ynFBPykBHBW0JWlGbcvjRJxnfeN213vuCJpkbuwwJfUjUouQWekQ==
X-Received: by 2002:adf:ae59:0:b0:38a:88b8:97a9 with SMTP id ffacd0b85a97d-38a88b898b4mr2057382f8f.2.1736354238605;
        Wed, 08 Jan 2025 08:37:18 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832c45sm52816674f8f.32.2025.01.08.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:37:17 -0800 (PST)
Date: Wed, 8 Jan 2025 17:37:15 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Correct indentation and style in DTS example
Message-ID: <6ugtusk3yhbr4rbuzompfb2apequpxtdpy3zk3xmrhowpne3nw@2h5cvtpd6qsw>
X-NVConfidentiality: public
References: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3vdnth2dvkpxqrns"
Content-Disposition: inline
In-Reply-To: <20250107131456.247610-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083721_283170_C67D63E3 
X-CRM114-Status: GOOD (  16.89  )
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


--3vdnth2dvkpxqrns
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: Correct indentation and style in DTS example
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 02:14:56PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> This applies cleanly on v6.13-rc6 and on next-20250107, so I expect no
> conflicts between Rob's tree and other maintainers' trees.
>=20
> Rob,
> Can you apply it to DT tree?
> ---
>  .../arm/arm,trace-buffer-extension.yaml       |  10 +-
>  .../bindings/arm/stm32/st,mlahb.yaml          |  20 +-
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  42 ++--
>  ...ntel,ixp4xx-network-processing-engine.yaml |  52 ++---
>  .../bindings/fpga/xlnx,versal-fpga.yaml       |   2 +-
>  .../bindings/interconnect/qcom,rpmh.yaml      |  28 +--
>  .../bindings/iommu/riscv,iommu.yaml           |   6 +-
>  .../devicetree/bindings/leds/leds-mt6360.yaml | 195 +++++++++---------
>  .../devicetree/bindings/mips/brcm/soc.yaml    |  42 ++--
>  .../misc/intel,ixp4xx-ahb-queue-manager.yaml  |   6 +-
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |  78 +++----
>  .../bindings/mtd/technologic,nand.yaml        |   2 +-
>  .../bindings/nvmem/amlogic,meson6-efuse.yaml  |   2 +-
>  .../bindings/pci/ti,j721e-pci-ep.yaml         |  34 +--
>  .../bindings/power/reset/qcom,pon.yaml        |  62 +++---
>  .../nvidia,tegra264-bpmp-shmem.yaml           |  15 +-
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        |  22 +-
>  .../amlogic/amlogic,meson-gx-hhi-sysctrl.yaml |  26 +--
>  .../bindings/soc/qcom/qcom,eud.yaml           |  38 ++--
>  .../bindings/soc/ti/wkup-m3-ipc.yaml          |  32 +--
>  20 files changed, 357 insertions(+), 357 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--3vdnth2dvkpxqrns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd+qbsACgkQ3SOs138+
s6HTwg/9FTrBpsyb2c6RxUphewMFJvl+V6nLpfbmnIG7/hlhP5n2Rosba8pnC16d
JnflQ606ls+DtDBqIImY3LYZcPjcRx/ddXj/H3o2NLFsbbTmOKGEJ6SPhi/YR4Is
AFQMkKbLiMldJyCEH9X+NMmIOEGN44f9eHb6CSpLTAsgPYi2Ppi20vtS+ktX2N8V
9hoO0I8YspPvsj3TqOf1vzPMM9aEb7L6norpLMW8MMIWnkUInUhW5gyxs/OPNma4
OJs7ev/OrjPkBxACJwgiLtBGTVJR56080XgSm7GRqVMnR6NhOGMN/g5x/rrBjy0F
5gprsK059F7h3/oyI5Wn315lnjP9VPjC0OIF08WHRlo0c5zA8TDKYQACT6obPHUh
04nYCErIHSixvHlX91uKHGhfHA79vbttEXCIwrXiuUVOTcoMZBGCzv9njLBIoPdl
v5wzOIzZ+V66lAbWRGTjMcRjO1bx0vM+QpmHvjlEQubggzHG0csIRQB/68wk6min
F+kvzSh1aTJkTNUOYn6BBtbzqjCf8y5NHidBSXBWXhP308OXkwy7fUGqIfrIny7T
41KrDRyFAMooM175JQmuMExgOcRi6fGKmvKQ0MXsNR4FTt9NZ5rvTnkxi1qH8uWv
68sSPZB2xOA8iPax09mEhKUKuyYQPa+Ue1EZlHtc75XMisXE1SQ=
=bVty
-----END PGP SIGNATURE-----

--3vdnth2dvkpxqrns--

