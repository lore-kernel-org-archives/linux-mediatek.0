Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AA4C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4hif7EODqPU9RIQoNSM7f4kViT96m8PqRMy1FOSRqmw=; b=Zq3o0NR0Sf2aUpMLvu0Bci5TAK
	Nv5/CJ72IO6BoLy+Eyc/16EGDOG/8/+3uS6dQ+iiedK1EMI6uD2GJcoWMGs9ucRaixIZrHizhYMg6
	xt/OQn3SmU+00ukx1bMwjWylm4/ha0lyhJ1AgWj8WIt47NEDl2jU0BeMoyA67tnUInbad1tLg1mTt
	A1XH7GKYtt+F8pbc9tr/jm/I9pw68IaPXqfP7iFMb2OJ/ZkW44ssGPuIN7jp6daAZhrMLPKZIaGIQ
	ohZ9vNc1WorGI81BT58TimRHqcwlTuyDuQu9iXi3YUn/PJqX8YbaS2DBzMwatMWncLQPgqNT3wnwj
	W8iXyu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0h1S-006noD-C2; Thu, 01 Dec 2022 10:42:30 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0h1L-006nk8-2g; Thu, 01 Dec 2022 10:42:28 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNCLc4QCXz4xFy;
	Thu,  1 Dec 2022 21:42:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669891334;
	bh=4hif7EODqPU9RIQoNSM7f4kViT96m8PqRMy1FOSRqmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XMDViV6CFDY+O8nTTE8IlEWWvY7H8YPqwD0Tn3KS84kUAblouGGNC2+Nia8sW2MYv
	 qiQITUGJnoNf2rF8FqcIgIFTtKJlyIpcKBWiNrEakO5NLQ+ickTPEjtr01+GlyanLx
	 mzZ9YX/t1jp5UON6rpZmvdKzHLeuceJXW2c99G//FjEB6EQyCPN8TlRw5ClPGntYn1
	 1lstUDxUIwXt5rogz0qwgKe9XH3/+5CPLNT6DZ3ksaq4/yXNeIe6xOWsdnc3/9h44G
	 yfuCxdwdv4chZHzuDDmEcJxiTEJT36pr3DPrHlRrFjnXSjff4fqmP4a9zPs8OfNA43
	 pIMyXosyZ93DA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
In-Reply-To: <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <Y4d9B7VSHvqJn0iS@lunn.ch>
 <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
Date: Thu, 01 Dec 2022 21:42:00 +1100
Message-ID: <877czbs8w7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_024223_568800_F2E020FC 
X-CRM114-Status: GOOD (  16.09  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-rockchip@lists.infradead.org, Gregory Clement <gregory.clement@bootlin.com>, =?utf-8?Q?Rafa?= =?utf-8?Q?=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com> writes:
> On 30.11.2022 18:55, Andrew Lunn wrote:
>> On Wed, Nov 30, 2022 at 05:10:35PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrot=
e:
>>> Hello folks,
>>>
>>> With this patch series, we're completely getting rid of 'label =3D "cpu=
";'
>>> which is not used by the DSA dt-binding at all.
>>>
>>> Information for taking the patches for maintainers:
>>> Patch 1: netdev maintainers (based off netdev/net-next.git main)
>>> Patch 2-3: SoC maintainers (based off soc/soc.git soc/dt)
>>> Patch 4: MIPS maintainers (based off mips/linux.git mips-next)
>>> Patch 5: PowerPC maintainers (based off powerpc/linux.git next-test)
>>=20
>> Hi Ar=C4=B1n=C3=A7
>>=20
>> So your plan is that each architecture maintainer merges one patch?
>
> Initially, I sent this series to soc@kernel.org to take it all but Rob=20
> said it must be this way instead.
>
>>=20
>> That is fine, but it is good to be explicit, otherwise patches will
>> fall through the cracks because nobody picks them up. I generally use
>> To: to indicate who i expect to merge a patch, and everybody else in
>> the Cc:
>
> Thanks for this, I'll follow suit if I don't see any activity for a few=20
> weeks.

IMHO the best solution if the patches are truly independent is to send
them independantly to each maintainer. That way there's no confusion
about whether someone else will take the series.

It's also simpler for maintainers to apply a single standalone patch vs
pick a single patch from a larger series.

cheers

