Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD44C54E76
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxhddzwNIgG+bk+3II44/LNd5CBnAQSGnu4afaRF7wc=; b=UwrPHAYrtkI5Av0yxUJtGuJLMI
	EZQN67mG0k+xWaZzszgf6fowUyFZP2hOpvRYnPjKebN63kRdTNsnJyEUihfhzgPTOKDjD9m6Glvk8
	ewSMuYlciu30K7kTiaOVdWJ5/N733gWCMdeTXIsBRzHqC0jIACHRJ8zEPJwgGojstBdS4hzDeRcHp
	SMHmr9wwvwyDitjcWxSIphTL64UoKcg59AUWWCsNlK3mYEP4yu2Ptva1t0uaSpTR7+iUMiIm8J3G7
	TtpumBMDLuAtZaAkS4uU7QDiaBpsH/DWiqdF8JvuAcT5cq3/F4rAaYF9MBU7FHaRUZYsifvESZAJy
	6KtW3kTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4hnY-00ADZU-1h;
	Sun, 19 Nov 2023 13:25:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4hnU-00ADYg-0V;
	Sun, 19 Nov 2023 13:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2B2060A2A;
	Sun, 19 Nov 2023 13:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07EFC433C8;
	Sun, 19 Nov 2023 13:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700400309;
	bh=XxhddzwNIgG+bk+3II44/LNd5CBnAQSGnu4afaRF7wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEyBk9xHjQgzNe3JUfRMRpC8nhwfSpFiGj7o1bqgDr3/201wAk4mJNJ+NI1jiPF4B
	 sTEgj9wSfJBDjfOiVuQERo63Nu7u9qgegsXriMdy6uh5++oHykdn1Y0M15OpMauJ+o
	 rEsGnzT1Zh8c6zgHc066j5/E/hxgFXvOm88vRD/xOkCCR9llw1AaJ1WQ1zE54oT5QR
	 0bABp9htnT1BfNnaapquepVc0CwKx9S4CRiVAxF/bd6QvNCQ3b3JvVVBaUM4+5rrQR
	 cG2zlMZwPZZoTlAYidA6RidFgcwWlN8htCWsH+4f164o0pb6yl9drfODminYieHr5k
	 ODVeVFGUHwfEQ==
Date: Sun, 19 Nov 2023 13:25:04 +0000
From: Conor Dooley <conor@kernel.org>
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: mediatek: Remove compatible
 for MT8188 VPPSYS
Message-ID: <20231119-zestfully-riveting-fe9793281903@spud>
References: <20231117053934.10571-1-yu-chang.lee@mediatek.com>
 <20231117053934.10571-2-yu-chang.lee@mediatek.com>
 <20231119-gem-plus-3217ffee6278@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="52bn6chajiCX+Q3f"
Content-Disposition: inline
In-Reply-To: <20231119-gem-plus-3217ffee6278@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_052512_240897_EF4A4054 
X-CRM114-Status: GOOD (  12.00  )
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


--52bn6chajiCX+Q3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 01:13:47PM +0000, Conor Dooley wrote:
> On Fri, Nov 17, 2023 at 01:39:33PM +0800, yu-chang.lee wrote:
> > MT8188 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> > populate device by platform_device_register_data then start
> > its own clock driver.
>=20
> How does one operating system's driver probing model render these
> compatibles invalid?

I see there are 2 patches in the series. Merging them into one would
likely make it easier to explain the hardware-related reason for this
change.

--52bn6chajiCX+Q3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoMsAAKCRB4tDGHoIJi
0ihkAQDJXXL1MR0xmgwkXWBGLU44bL7kUV19Z5GlMv86zlEa/gEA2ghoULkl2Soy
4Yog79X3xremp0NR4VN2JldFYg58TgA=
=gEqL
-----END PGP SIGNATURE-----

--52bn6chajiCX+Q3f--

