Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63976C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrWbBDEoc866g3+8SUlo3dSt6RO2AeOgmBwijfYXZOI=; b=tnDCtkt8lIEW33Wm1POREceSxP
	cjM/MeJVVNz8dmkpIcqlYiZvtmB0BB0m0j0UZ3kjit2PsS+e/FFsCK7CNwq7QKusCC+iaaBBADoeu
	4ENB5+tYwPl6XGEhAlDpJCaMZA6JH7ebiq7P6ikpfW+HcmGtX8Iyqq03oojZb1I2sdwQdrVDQebdR
	XgR6JwhVgBNaEsS2pIIOOA+eJKCVyYGIpoU9j7EiMLa15ow/WTELOiCjlflE9CgCoiMeEPX/iVSXA
	qxh9tP1Fnke1NJiGzoIVNyCCRREJu0xPi7nezgUu7TSogdGV2eRjojLWDdaivcd2J1H5XLmPggnWn
	Wrsdrvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtCo-00000003Ch1-2KHB;
	Thu, 09 Jul 2026 18:10:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtCm-00000003CgA-1T9l;
	Thu, 09 Jul 2026 18:10:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 073DE44BB0;
	Thu,  9 Jul 2026 18:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED531F000E9;
	Thu,  9 Jul 2026 18:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620635;
	bh=FrWbBDEoc866g3+8SUlo3dSt6RO2AeOgmBwijfYXZOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EwO7UAchh32VZo0y/l3KlmYkXl/BWw0kqFJzBwTZ8LuFLLxt9kQRlYy35zOu3j7Hc
	 90rMnP3MGKE+J5kXdFwJ8KXLcpe2pXZ8qQUjXeNvrZj1DSosrS4OnkbYcyqoSRZ3me
	 XsDii6AUvUWPFqwvhRx30ykA/slsXulB6QM5SHrGO2brU1ao5Xx1oqpRJqcuBQs+Ph
	 p0BkrZMbIIED5JAkn3jWj2Uryg4cvXNWfveya0WH+raIw5tPFmcPx0lQiWsxuOSYt4
	 3NjqseaBirOsXaj/d1Cle2TUOtaqEYiR4P8vrfczDQNWbI3VVNIyn6uMTX5e6K1daS
	 F3ZfwZ6iwU0rA==
Date: Thu, 9 Jul 2026 19:10:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 06/18] dt-bindings: clock: mediatek: regroup MT8192
 dt-bindings into MT8186
Message-ID: <20260709-blog-spinal-97568987c6f7@spud>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-6-2926da3db6cf@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3KYFvTnjrsXTUUOw"
Content-Disposition: inline
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-6-2926da3db6cf@collabora.com>
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

--3KYFvTnjrsXTUUOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3KYFvTnjrsXTUUOw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/kFgAKCRB4tDGHoIJi
0qFKAP9A7FGdY/AeVCQME9FhWqYEIfTunaqJh3K5MW3DTRZFPAEA2VVw4IEkf6VB
bzUQ+A0RABfo6wyTiMTwJKdKWqTVyQk=
=JsA9
-----END PGP SIGNATURE-----

--3KYFvTnjrsXTUUOw--

