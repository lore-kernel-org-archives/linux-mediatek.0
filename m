Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E49BCCD19F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8A/8QJefHFzHEQJtja+BTUUIvgOL5xaNp24xSIDQ6E=; b=LkKlGpv1pVxp/miV1kragsN/K9
	kqFJ9Fw7i6l1N5Y1B5UUV8oM/aRRscZg78xTyCISkPSX/iVqE8QclG0sOWspzUyIrvQTyu26pAyVN
	xGPA6IsWwAbDE2eCzWKR+4DhGa3tPboIcj5KEseOZBaMiVbnf309V9B5Qui0EJg59/wlrIWMDd4VL
	7D9YXkTrLReattRCVQID6LvwAsz867kiH8WK0ftizfT/fOeL3KPKkaKmzpwL6EVzVVS0ZI1qwBvqY
	p+4/wY63/GH/aJybdc1DnrNr83oJjwcN+9jK+tCJ8ZvCjzFJJ+AuHVUIZxYsRiTiuCvJHxQI/oyks
	Y25uMrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UFu-00000005r4v-0gD4;
	Thu, 16 Oct 2025 20:07:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UFs-00000005r3T-23pw;
	Thu, 16 Oct 2025 20:07:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B016260454;
	Thu, 16 Oct 2025 20:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8367EC4CEF1;
	Thu, 16 Oct 2025 20:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760645239;
	bh=b8A/8QJefHFzHEQJtja+BTUUIvgOL5xaNp24xSIDQ6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQrf2G3q7IGQ262axDmLxmlGTpFrCUt+iYRq6W12e86jBm2ZmAotSRTpJ6wI0YhkG
	 zQc3rkjsCpGzgo2oHXA/QeIwkHkhwKCCYfo4qrWf38t04DSQDb5LHotVqrSjeBk1Bd
	 8SP0x1nhxv4CYDnZs99wIDtF//r6OItKdOBq60V0drFqVBjiDD+hycPHBhidREjeXu
	 YstiqBLk9wEufOPcVtmWsgDUGhQxkRHIMIaO/tnfsOHAOCiUMOvk9yP6jVZ3EVc0nw
	 GUDyhT9sD/ej38NOmSkBODyy5ifBXXRlFO6EkYvV0iAFKQll6OyMf4nmVt9wZIZzrV
	 vRQ3x9dn7/THw==
Date: Thu, 16 Oct 2025 21:07:13 +0100
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
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: (subset) [PATCH v10 00/16] spi: airoha: driver fixes &
 improvements
Message-ID: <c4393e20-3fc8-45df-be7d-5f80dcb069bb@sirena.org.uk>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
 <176064054115.223781.11856902416382505599.b4-ty@kernel.org>
 <6255f959-e37d-4582-88c0-f3808f9701a1@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VlH0SB1DgdrCjiBy"
Content-Disposition: inline
In-Reply-To: <6255f959-e37d-4582-88c0-f3808f9701a1@iopsys.eu>
X-Cookie: Whoever dies with the most toys wins.
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


--VlH0SB1DgdrCjiBy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 16, 2025 at 11:01:04PM +0300, Mikhail Kshevetskiy wrote:
> On 10/16/25 21:49, Mark Brown wrote:

> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

> If I do fixes or change a bit description of patches not applied to
> linux-next yet, should I post a whole series or it's enough to send
> patches based on linux-next?

You shouldn't resend already applied patches, base your new work on
what's already applied.

--VlH0SB1DgdrCjiBy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjxUHAACgkQJNaLcl1U
h9BKoAf/W0hMhMelK+3lqNj1jeD0jDoQibBDbhBV1hWA9On1GlISCjan7/MV9jEz
wN7SXElGXKskOQNxNgRmNeaWl2XzvFzPQLKHY+cdM+PDr8CpS7Rf2MgVrwHtgFRv
2omdimPf6zi+b0Po9gv8FKpMTSKVcBz652KI4hvtllBwcpnMVVJYCJIkBVf8XTAP
peCwPUcDBnHPolj/GIf/oTJ8hV90oU/ZB5mu4jBoBWFcWcDGgG/wD5T5dr8tISUs
ocxD365zsJhMoiUTvyxPNB38ouLVDD6y7cAl29WonD4wUwQaeHXQj4L+gXijeH6O
fi+vIf/XBhXkMoEYdu9SJ4McZrwMZQ==
=R1yd
-----END PGP SIGNATURE-----

--VlH0SB1DgdrCjiBy--

