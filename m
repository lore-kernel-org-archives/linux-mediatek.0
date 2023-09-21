Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEFDE706FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+vZhOZ+kADCdlkNh/ewNubAwKMK2F34h8/SL9SRhQE=; b=kkKOAET+XgrG9TvAivULftcKJq
	Bja5t1GrEiUlpkOvCEjmg8NNIHucOWFFf+yMEqSAMaARuCDuyyQPzXIvoRrMinb63cF+zBM0SJIP8
	D2yzOEMldqv+WgvQlHTmFYwBaWY4ypLEfVFFte4r1IGxzUg+l8QmVEgH6TprMOWwF0Gpkekxo4KPV
	eMUHpT0E7sI8upICIS4xr8vuJz5gfq09LMPXiqquoeMmQXp69EqKbCmjfxdjcgeFZw4Lgf/da+m7b
	LwWgPp2YvY0hrRj7BoXE19uamDTqHPP3tAOt/viJd6jk2T4PdZIH1vxd/oVfKdR7rIzADFLlmR9aX
	YAFXVJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFnx-005ZQ3-2h;
	Thu, 21 Sep 2023 09:17:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFnv-005ZPB-0F;
	Thu, 21 Sep 2023 09:17:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 802E461EAD;
	Thu, 21 Sep 2023 09:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52C8C32777;
	Thu, 21 Sep 2023 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695287817;
	bh=L+vZhOZ+kADCdlkNh/ewNubAwKMK2F34h8/SL9SRhQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKwFLd0jXAMRuLlul0c7VWcfGPByInmWP9KdPOz1MKQ1gd5QXckHnTdP0YYEeWceh
	 DjIlUty4xIaEJqfl0PTnLlfU0/Zm4fyf7hSugAD4u6Khs3T+6FEI4TmOSSvndtfNoA
	 FcRl75SSu//v5N6Yzm/5uTnBvmUsX4yRIs21Af8BYv0RL2fUSqeNpPbp7e3fnJ5nyL
	 lPDqaFY2VXA9FG/KtikMTNuYOiiiNQapMA+/jEdL/LghBhbOMJtNXaO+70IMbKn8ew
	 8jJwFAp5GrxCTtKnjoH8V9/nMZStYWqRv/TVdfgVRbrUyDhlb2d/K43pTqtedLCYT5
	 0RbVJIPSbCGiA==
Date: Thu, 21 Sep 2023 10:16:52 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: thermal: mediatek: Add LVTS thermal
 sensors for mt7988
Message-ID: <20230921-552234bd29791cbdcd037a2c@fedora>
References: <20230920175001.47563-1-linux@fw-web.de>
 <20230920175001.47563-3-linux@fw-web.de>
 <31fbdae8-d41c-358b-c8ea-6ee31b158dfd@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yu54HnRP5ZgUSnoq"
Content-Disposition: inline
In-Reply-To: <31fbdae8-d41c-358b-c8ea-6ee31b158dfd@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_021659_159852_9159F842 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--Yu54HnRP5ZgUSnoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 09:55:46AM +0200, AngeloGioacchino Del Regno wrote:
> Il 20/09/23 19:49, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >=20
> > Add sensor constants for MT7988.
> >=20
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--Yu54HnRP5ZgUSnoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQwJ/gAKCRB4tDGHoIJi
0miwAQCKJ0wVlAlz1nuHioGwDLUxrjxPyHOl3leR4myna8AQdAD/eX7X9YhwjllL
Nsb24tuvDQAHgMvN/gj+zYyrG9Nevw0=
=7RDp
-----END PGP SIGNATURE-----

--Yu54HnRP5ZgUSnoq--

