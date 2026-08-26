Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B03EC61DBD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2tCkHhAnhJUieAoIFUwqetCNrCTpIRrvxTeG80BJcI=; b=0tIOrh9rUSVwpnQ+6FuhiRJ0el
	HkIPyMJg0mkb2bt8CexQJouJ8rTMmaJaE7FgrAAGwRTasdLaRJJ1S2NfcOYkw8AJwc3ex7RwiWw1j
	k/GXX2vQpNozjJ+CZeFCFx9ocsAWs4XdllGHRrknslZRH78DulRGMY2DzCDx/d9ZbPZbY2RbhH25m
	DQRW+3aSyMjcBfEJscLS29HkwItyb/YeG66ZYceMc8Cj0F4FjrInWY9Dx0YwyA/KySjdzGwcRnckX
	W5qR2sCKuyJCW0dQEjF/1eNpW70zMHwCXoNEl2KaZ5tM51AKLmmHOhKke+QGoSJCXanGn70dUKjWq
	xb5VOoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzG4y-00000002hoe-1QAR;
	Wed, 26 Aug 2026 16:02:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzG4x-00000002ho8-3HJf;
	Wed, 26 Aug 2026 16:02:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 132776001D;
	Wed, 26 Aug 2026 16:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F248F1F000E9;
	Wed, 26 Aug 2026 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787760137;
	bh=A2tCkHhAnhJUieAoIFUwqetCNrCTpIRrvxTeG80BJcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hTuCTctgZTYuRNeOUOL3Dh8vVZl2dFrmaatOn/Y7BhOSDxGpqMQt5TgUGz3GrV158
	 taSnjYbCC5ZrRhPXrRS71rSq5QJCwjpDgtVJEHDMqTdFQKzcwKJ2KPthSO/qdTKrL/
	 sZ3XiSV4J87OO8PNpYpoI0+pKr0mWH/pb5MABxRPmJ4nW9KO3tL8ouK16T1hoA7arl
	 ZxcY/O+MlNMfH/xTOtGARX3Hjbgll56apmb6aZ2VyeJsY6tbs/yYLWzLmcbVZ29IDC
	 qhZqlnDf94wDy39JS1Q7GxM6mwCCo4SpRcVNbl77JeNXlqEx+7YaMROH2zM1R16riK
	 jcK7xn/2Js4ig==
Date: Wed, 26 Aug 2026 17:02:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add optional
 repeater phys property
Message-ID: <20260826-phosphate-churn-06da285b0c0f@spud>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
 <20260826-mtk-usb2-repeater-usb2-v1-1-e8e48e2fd6d8@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Slhqmh3WOacDfSwh"
Content-Disposition: inline
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-1-e8e48e2fd6d8@collabora.com>
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

--Slhqmh3WOacDfSwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Slhqmh3WOacDfSwh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8OBAAKCRB4tDGHoIJi
0k4+AQDUm2QUPhWgZ45GL8qPZVL+UlFrND1Hjkl5dEzc8QNDtwEAz/kB6ZPUpBNQ
tLL2hWIYvJKTOwtT9FGCc456h7rwBQw=
=YZCc
-----END PGP SIGNATURE-----

--Slhqmh3WOacDfSwh--

