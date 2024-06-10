Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9582C27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SBQKxFziNtepULMRY6wZaiRMZZADYCczi5ZYCguNvY=; b=huDf8b+aLaAwBJ7DKuDJ59Vwm1
	19+9oi5vjo7dFPLd5mGnzQQm5RV0Aqvg86anQ1268loTsXtFkPM+ZcWmHxTbJCzuhIuHcHlas1RbU
	wK7f2pP97hEHjkjreqKRxFVFlwxo3zMpJ6RyU1MT+bioP2tS6YXEwlPi6PJqsJgjPMzEhW8oukYbR
	G9k8jZU5jYLJ++aOk0gMcVOC1t6q7x8C1mqsLKQXSNpETlLWeDRgSry1ZxDlrWPMWyU3A6NtyRQ7P
	H8/77NFiYLbkClEHbMgvkrdgktnwMI/5uBKdYU2tSAfp9pjwkJQw0UsL0b+Z5jFbWpxD+qU/47+6z
	/NUjcsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhbq-00000005jLe-2Y51;
	Mon, 10 Jun 2024 16:11:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhbn-00000005jK8-0BMB;
	Mon, 10 Jun 2024 16:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3661D60AD7;
	Mon, 10 Jun 2024 16:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F670C2BBFC;
	Mon, 10 Jun 2024 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718035856;
	bh=0SBQKxFziNtepULMRY6wZaiRMZZADYCczi5ZYCguNvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orCNGMkrY7i6t4PYencQGYpdjnGIA9KBkAbKFHIt0yx5f0KnKzEKb1TU9hkGBN9Nw
	 6HzAGUWT0bz8ucq8NtfpivivHpm9ErRcayZeXWIjfT6YLHUQg6IZtESLw4FHwKqatz
	 EohzaE3fkW21/EiHGpDJRGGvpWt0EyVa5yVMQ2dk8YH4R86BXsWCIZ+FDOu8qD37lZ
	 8qx3fJFuf5TFm9UI4qWmNkPjJUZ17tAXb5tCsbDvNuJDOqXxgakDfpo9x4xVjz0Q8Z
	 Wu8RaBDrRqE8n/WKZAHa2OY75zf+c9/FLbG2FxI2GRR5/mowL/zDx8r45cKHjAXQ5W
	 qLeRD9ZcL1q+g==
Date: Mon, 10 Jun 2024 17:10:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240610-roping-ninja-56074ad61f77@spud>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
 <20240607144154.GD18479@pendragon.ideasonboard.com>
 <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>
 <20240610085424.GH26663@pendragon.ideasonboard.com>
 <e9a44b0b-1930-42fa-ab5e-a7eac1470041@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L5tzetz+W9OqfYBE"
Content-Disposition: inline
In-Reply-To: <e9a44b0b-1930-42fa-ab5e-a7eac1470041@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_091059_236153_3D35BB4B 
X-CRM114-Status: GOOD (  18.57  )
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


--L5tzetz+W9OqfYBE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 12:18:12PM +0200, Krzysztof Kozlowski wrote:
> On 10/06/2024 10:54, Laurent Pinchart wrote:
> >>
> >>> There's also the camsv IP in the same series that needs a generic nam=
e.
> >>> I really don't know what to propose for it. Could you recommend
> >>> something that would make you happy ?
> >>
> >> Sorry,that's almost half year old thread. Not present in my inbox.
> >=20
> > I remember someone presenting a talk titled "Beginner Linux kernel
> > maintainer's toolbox" in Prague last year. The talk mentioned a tool
> > call b4. I highly recommend it ;-)
>=20
> Wouldn't solve it. I would need to download the thread and import to
> mailbox (several clicks needed) or open in some other tool just to see
> the email. Or find it on lore.kernel.org - anyway just not convenient.

Apparently you can use b4 from within mutt to populate threads, but I am
yet to figure out if it works with non-local maildirs:
https://b4.docs.kernel.org/en/latest/maintainer/mbox.html#using-with-mutt

--L5tzetz+W9OqfYBE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcliwAKCRB4tDGHoIJi
0lW8AQCShzBBGaBieTe4A+ZSBNiyKUc5whM2VE7q1+SQrFQNTwD/SoFAQzB2ID9X
XndVMh3NKULPW4s3q785mEtlFKVGrgI=
=ihJA
-----END PGP SIGNATURE-----

--L5tzetz+W9OqfYBE--

