Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B34C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhejCaHEsc1UdpWwQxlKoRmiVHCRjz5J/YeUYAk1xo4=; b=DnvQ3WkABobRwiGFO9vF87Lp1Y
	aJCpND3yhoNjikd31wKIteaK8+0MdAhQ7zBil/HGC3p0Q0H6JQu8na575kpc42ryWk79aBxU+scOz
	xaCWsYn9+i0F1VlogtZ3ZGjBhuQBv2OCQ+ryfT5TPNLctsAC0HGQUrVNCwpultGtRWWPvjMXzdtgh
	xiXJFuIz+uCn3Bj/ecUsBgD/MnxH3tPHvcyWswDN2QuMT44oyzEHU/QTQkmB0r+4joVnlY/EeE3EX
	6roZRyqmtO1wj1JNJ/y2nuwjBqWbZL5xJuMtVLbjEzINMwOuV/wXU2lUxpH9oW4+fUoZJJDhETy+U
	rH2PVLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sK7-00BQjf-45; Thu, 01 Dec 2022 22:46:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0s8A-00BOyR-GR; Thu, 01 Dec 2022 22:34:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EDCB8B81F75;
	Thu,  1 Dec 2022 22:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75663C433C1;
	Thu,  1 Dec 2022 22:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669934047;
	bh=Uq1l4BgLlKqVDMyvtY+SMzQv/bliKLm/IypcYi8plHk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=I/RiAYoUbcK7MDuWH4SxhjdwwfkDlcK81s6TTMNad9RbBv87TGg//UGog3mvk08kc
	 KeJvTwKPYgyrbP+AQ8ohNh45GW0+cq13sk+ecwFTdPRwUfZnPnAXLtaDz28MaPdIMi
	 If2+zk7b6neGK9OmZcRrsSVJq6XHg3+uy/NgWUcGcxKsrsXxA687iDOOSWZMLx4fqC
	 YhVIj+BzjGiafIeKyzoEjH0mAy3CozQe4yGuHnu1P0IL+64VeMsoxZZ32g8eiEc9J9
	 Yv15iKEcVBQsCNgxRwJAyw6AUbM+NurbuZ21MEegoj9R96Wrspq7gT9CHYdyogn0g/
	 POVrLgCImxl9A==
Date: Thu, 1 Dec 2022 16:34:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH 2/5] arm: dts: remove label = "cpu" from DSA dt-binding
Message-ID: <20221201223401.5yews4hlbyyaasop@builder.lan>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_143410_863423_C3DB99A6 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>, Gregory Clement <gregory.clement@bootlin.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 30, 2022 at 05:10:37PM +0300, Arınç ÜNAL wrote:
[..]
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts                 | 2 --

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

