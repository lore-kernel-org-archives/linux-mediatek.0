Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9543BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 03:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U81sidzaQaJy/rxfn5PHUydwwpgK0dI201eoQyqbyCM=; b=nrreN3eEVdywbsm9NYjItjJqQA
	yHx2yC1/4xAVdJmbKBjy924USaYrrfUc9QSkFlNQ+yTFVkln25kNzr/uY/492FHebRb1D8TEb1OjS
	0Sct4nty+QpyXlbfOHkKKTGq5JsPxRjIpdXWQ6rIv6oA9n0Uue4VYRsyAmvWpY6vVs8yyjbKlHNeb
	u7mQc+QMulTxzKdJK+zC3JUA5F9STUW9Ht8R6qrg3d7LqDH3VozjPh4OTGnUeASFAg5tGywFkpfVW
	DeE2PA30E1dczTyQIGOc4CzMgZ8OQUIlU3qkHXhWtZNuqMCRpGj128u0Q3/om5jHeVM6hjFY8uA6U
	K0wGRO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4w4Q-00AL94-1m; Tue, 13 Dec 2022 03:35:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4w4F-00AL6b-H8; Tue, 13 Dec 2022 03:34:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC6FA612E6;
	Tue, 13 Dec 2022 03:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D242CC433EF;
	Tue, 13 Dec 2022 03:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670902490;
	bh=U81sidzaQaJy/rxfn5PHUydwwpgK0dI201eoQyqbyCM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mdw5ed2DjmHNGbFitiAgdH7uuiRirU07ByfHaJUafc2EhurrydQC8e+66t0L5Y+9x
	 g+6Fi4aFNL3y+hYpLMo92y0p/CJPpxl9g4pLt/0calOFSGrWH/ysNdkLmYuuGOOXo7
	 xB+cNcB7BYPJGJENlYxkW/dRecKJ2R2Tb03ZCiZ/HoiIJyIw3a/6HYkwDqHIAdzFw7
	 +8HErc9Poiyty2YGk1v71k2vZapexynaDfa1uYCqN5/E/LN5E7F6WxMmYQoGLLrOW9
	 oQjB3oq4YOlT7NcqE7CVYdrOWQUQ0GX/lXP8FnEHu7q0viASuHeeOlnYRQzNXcg0Th
	 W08Uo/ufavtQw==
Date: Mon, 12 Dec 2022 19:34:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Vivien
 Didelot <vivien.didelot@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?=
 <alsi@bang-olufsen.dk>, Linus Walleij <linus.walleij@linaro.org>,
 UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kurt Kanzenbach
 <kurt@linutronix.de>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir
 Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Andrew
 Lunn <andrew@lunn.ch>, George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v5 net-next 00/10] dt-binding preparation for ocelot
 switches
Message-ID: <20221212193447.0a69325e@kernel.org>
In-Reply-To: <Y5d67SPMc/YCr0Rq@COLIN-DESKTOP1.localdomain>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
	<20221212102958.0948b360@kernel.org>
	<Y5d67SPMc/YCr0Rq@COLIN-DESKTOP1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_193455_627673_F045C3A9 
X-CRM114-Status: GOOD (  14.48  )
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

On Mon, 12 Dec 2022 11:03:09 -0800 Colin Foster wrote:
> > A lot of carried over review tags here, so please let me know if
> > there's anything that needs to be reviewed here, otherwise I'd like=20
> > to merge the series for 6.2 by the end of the day. =20
>=20
> I just responded to patch 4, which has a small (?) outstanding issue /
> discussion. I asked Rob and Ar=C4=B1n=C3=A7's opinions as to whether it s=
hould
> hold up this series. Everything else is good to go, as far as I
> understand.

No reply :( Since this is "just" DT bindings (as in shouldn't
functionally break anything) - if Rob gives us a green light
we can still pull it into the mid-merge window follow up.
But I'll drop it from pw for now so it doesn't distract us.

