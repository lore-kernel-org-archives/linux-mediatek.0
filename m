Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C45C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 19:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAb0Oji62P7W7XMEmvi9IDXPe1aS1U+EKgRKp0alIOU=; b=mYRLW1/PCbDItffHiePRTERO81
	1ihYsptHYWUKS4ve/5Vies7u6+Rfoj4jIL/fjb3qqlXXVV8ZhX5lKEL2EYaSMM3B2N3uwvTe+kL4X
	/Mx62VLlhwzAIx4rlB1WEW8eDVQnJFMfFmGKwGfSVzVPE0F7FUeY3qukPM556MpvJJaQJnM64vEbI
	Jr2nNvM6I7k8TBypz9Xdls1l51GLB398/ydxORUZoAzdJA8K0Y77himKSHBmMsvyvvjulPZ/HLUmA
	e45xYPSO1B+SH4oyRQH8aTqW20cfu0Pg1zTLjhD/piRLOTwDuVRmzBM5I1WZovEmhwozVbM6OOgtT
	JS0SLK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pctiM-00HRJA-37;
	Thu, 16 Mar 2023 19:56:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pctiG-00HRGd-1f;
	Thu, 16 Mar 2023 19:56:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1F41DB82344;
	Thu, 16 Mar 2023 19:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36125C4339E;
	Thu, 16 Mar 2023 19:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678996593;
	bh=FjeRS+GUqcasumeqOw3zjV7lK1bI7k7/Hp9EIdfabys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eio5cQ/zqDLPE6/XVa6WTcbwNtK/j7T5AfhlG2ky6ZpLdl0UwIPyvQXod7lBeKWQu
	 tIvVHJB2x3l7/l1ze8n6Kn3vot6YlBWrMiLqVOeXA6dJBYyg2CpIafH8zEquTyRbY3
	 4I1s8DHvRR8Gtzso8fRR9r3Inpl25rpliVS2txcxX91QKUEfwjU/7e4+/rKMSZVolP
	 CuLCwgEMbKlh84YDfyGF0XKA6s9R/kUQQUzAQ+k0yEWhahAxUcrhA6wcrK/rpDKbpG
	 SZROrcAhBlu2Z3FeEG2x5rMzg36G4oP4ZgCxfPrH6+Jq04kozxHxbVyYhO2AXwZv6n
	 CZolY5XVV9N/g==
Date: Thu, 16 Mar 2023 20:56:30 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 4/5] i2c: cros-ec-tunnel: Mark ACPI and OF related data
 as maybe unused
Message-ID: <ZBN0bsPpAj9KKf0v@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
 <20230311111658.251951-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NPOuvBlA3xuTK4qO"
Content-Disposition: inline
In-Reply-To: <20230311111658.251951-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_125636_856937_A514A868 
X-CRM114-Status: GOOD (  11.03  )
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


--NPOuvBlA3xuTK4qO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:16:57PM +0100, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF or !CONFIG_ACPI making
> certain data unused:
>=20
>   drivers/i2c/busses/i2c-cros-ec-tunnel.c:295:34: error: =E2=80=98cros_ec=
_i2c_of_match=E2=80=99 defined but not used [-Werror=3Dunused-const-variabl=
e=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--NPOuvBlA3xuTK4qO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdG4ACgkQFA3kzBSg
KbZUJA/+JrUEht5HB7GAzwM81ZXqE5QvGi66MxVAr4lAwp+QJGCEDswnvZQ1ZHld
prFBkMgmWnfCdmmUycQ1jE0qlj0ddLansZNQ8xgLMaEhQPwnVKSVbtuo5GeLOf7e
yne/7/QYZds1eAPvkiLirbeeJ/cySkyfdqIkQjdMlLhNrhBADPD7QXoGlGHmxQI0
pSQg3zwHxfsUv6vlIpa1DGa8Kxqy7C88kjTOXMjMZIv4YE2A6ejFDKofiwlZUvoj
ygLrcmtPGY7WwrAOuanemyprTlGzsTocCGVgFb/Qtgv/EsW+mihmK+HNAutPwc8r
f6S7eiXCrp1Hh7AZfuC30OYE8Yz1GXGP1voAKrtJepVl449KuNtfwJCEyY5K29kL
eY2EqIe7KZodmZFgouk9NsThf/E+DnSxXuuPlbq5o5zwycBMxVF7rfa8Tw9fTe8q
bWgVLpJnF4NGC6bm+OIHMPPdjNqL9MYFh2cV5GgDXjsh5JPPfAJavvaNuQXy0WdO
Gc/5NKKTWUa7dCm7J+8qI9znH2GDP4VtfQkywj0PpemWRNfwPLFXHOrnXABjAATD
K+8A7pH48l3H4j6wU/AOo/zcAHOTAU0Fb1e4IUTx80RIL25cP1xY7mX9agxB0Puv
JzJuHu0VVLxBumer+SxpZblUmFAtk1Yf2oKBJeJ9994AOp3D41M=
=Vfz1
-----END PGP SIGNATURE-----

--NPOuvBlA3xuTK4qO--

