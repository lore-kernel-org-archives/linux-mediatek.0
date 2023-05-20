Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F2C77B7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 May 2023 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzLOnS8kzGIbprSfZlyNNfBG8QnbzdeZRhoxDyMoyrI=; b=Z2ylrdGVVI9Z8HrOS0shzr4rn5
	bxod6DfQL/CeL2JLtKyCqXl1Uer5aiMKHxgp1Zu849EbPC/iqFKBQ9d/qUc8JL+yVd+eH5wC5Y5/p
	JQMJJvpem+WqgAqsfvK00bZX7ucNNa53M6vccr1L5/GcMcb2aL7PFTku5eqJUftaH2jA3vsouU8kr
	4MruOwdCFaA6EmbgN0iSLBu7byiJxBOFgcqj1D5oSykqADLXesuF7T3+ZRqMVztmLzejJECBhphxN
	i2N7UCjDLpn+bvL0GYH690kXeloPqxCPtYRfbvILFJa5N8hc2KncKyFOARZz8LD3k8zJOIDHHZI/X
	dPdCuy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0MA9-001XFs-0Y;
	Sat, 20 May 2023 12:58:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0MA6-001XEz-0Y;
	Sat, 20 May 2023 12:58:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E2376090A;
	Sat, 20 May 2023 12:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB432C433EF;
	Sat, 20 May 2023 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684587496;
	bh=WzLOnS8kzGIbprSfZlyNNfBG8QnbzdeZRhoxDyMoyrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mf2dfG3VsMC1BsJB1sEqHWWCtB10GCwOHoOSVHXJ292fbuU5Kyca+wdtI/bOfoiON
	 cp+Po2AmQ4XYhaSjtLDDQIQg1Xw9aWhden/JXJ0GC74U5UP6UXPxyfpelNNgsC9jau
	 uVPMXhhnA7pObFVj9S0g1K4q+EZnM3qElYuHPlkBFWypl0qLYDLn5+Sa9l0rs8oiMa
	 QBHCs0VqEJmsjwMxrCIz94XlG2IOfnhefks9jVjeVFqcecKtPKchPyYaZY+zU+EuCv
	 JpM0xdCUa1h09imlYDaXrh1LpVYcPH+HPnMYVJza9/5i7VOEmoDolPhJKiejTMqPQb
	 1itPcuuC9EjFw==
Date: Sat, 20 May 2023 13:58:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	geert+renesas@glider.be, mazziesaccount@gmail.com,
	conor.dooley@microchip.com, j@jannau.net, mailingradian@gmail.com,
	me@iskren.info, lpieralisi@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Add Cortex-R52 to the list of enum
Message-ID: <20230520-apple-hamstring-2118e172cd71@spud>
References: <20230518152730.82954-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CdlCP2MJ8bAkn4CQ"
Content-Disposition: inline
In-Reply-To: <20230518152730.82954-1-ayan.kumar.halder@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_055818_274226_22A8D2B2 
X-CRM114-Status: GOOD (  11.24  )
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


--CdlCP2MJ8bAkn4CQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 04:27:30PM +0100, Ayan Kumar Halder wrote:
> As a pre-requisite for porting Xen on a Cortex-R52 based System-on-chip, =
we
> need to add "cortex-r52" to the list of enum.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--CdlCP2MJ8bAkn4CQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGjD3gAKCRB4tDGHoIJi
0rjPAQCXFLPt8nqDKNxhLc4OHCKpGilLHIsGf9pazW0V6WETfAEAn5HPPzB8bsOn
KnyAv7J5eKStm1VkRXJQIFGwpDAvAQQ=
=n1vn
-----END PGP SIGNATURE-----

--CdlCP2MJ8bAkn4CQ--

