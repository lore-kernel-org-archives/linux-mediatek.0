Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5E0C61D97
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxE0HQKJWm9W3nB/FzE1YjbtmLcXthLRX09JrBoAQXU=; b=IhGpQPrDgGJtM/oWrkBZGQeM+C
	gi2fRiNNRJ7SEWEYyqElQ+4qGwkkpusIrrnuwBHoQLxqOT8juRYC11Vkw9wcb9SuD1qa9uxithikG
	UDQm7syOYXY46b3nQ2UIqI4OPYwQXhhnIMIwO529uEqk8cHdJRutrV4av0LawLB9x2tJoccB+qfo3
	WD+Q+wYNVBqsBvYtJ2yHY2gUPR/rHIYMrpS/f8T/NV2Y9A+4Yr0xNeXvZ9LQ+NDLeYgJuNySYBTwB
	/Dg8Ld3dBTUao6O/wD1X/TNQbeCbNYz3ZPy32XK9Ww7vlk9XeaQfVAo4FgbH2/sQszzgIKsds2pRH
	+jKylvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DKR-005OF4-07;
	Thu, 23 Nov 2023 17:17:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DKN-005OEL-2T;
	Thu, 23 Nov 2023 17:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A1B8CE2B93;
	Thu, 23 Nov 2023 17:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B184FC433CC;
	Thu, 23 Nov 2023 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700759840;
	bh=eW+CaP4BT2sNRyEoRgqQyByj/UxBL0nOsR4Sy6KWAB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4+pi29bIwN67/0/212NMFo+i0rNMY2++XhQ3BSe0x7cAv7zqJlXtL4V3ReslEQW1
	 XaJxbGtNBNmPyY5wGbWd9MSXUrCUN9q2c51w2+nQU2jwTmj5db8sJbgxyz4OlFbYQm
	 Mf4kM1iB5+MKa/xpJUf9Sgc6waDiauIIuibWUXcwAyVO0RQc0St1TMbH7V7sOeF2eI
	 hj/nu7RC4ckUBO0tgiVH+csJMCV9WN/OsoRMVF4AvKSG6LcZVetRPzE9zjBNBmgvVb
	 nfJ8fdqaexbkuL0CIv/PXR5KjfjMohP6mPtkBP+pnqqOUI4vgTw5yDvwdoI4vkQO0W
	 1cqkQ52sCsXFw==
Date: Thu, 23 Nov 2023 17:17:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsi: remove Xinlei's mail
Message-ID: <20231123-reply-runny-87d16e39f9f5@spud>
References: <20231123134927.2034024-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BrmG9mhQOAkPRD4C"
Content-Disposition: inline
In-Reply-To: <20231123134927.2034024-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_091724_009645_D4B2DA32 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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


--BrmG9mhQOAkPRD4C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 02:49:27PM +0100, Michael Walle wrote:
> Xinlei Lee's mail is bouncing:
>=20
> <xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] sa=
id:
>     550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply=
 to
>     RCPT TO command)
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--BrmG9mhQOAkPRD4C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+JGgAKCRB4tDGHoIJi
0pFxAQCyKVuk2eJSY49HrTBq2484vkMJ8MFxC/6EHrUG8IP+jQEAvJ6e6guZQQ5H
M4/Y0irGropjfjLwrA8b4j9bXOhM8AI=
=9maz
-----END PGP SIGNATURE-----

--BrmG9mhQOAkPRD4C--

