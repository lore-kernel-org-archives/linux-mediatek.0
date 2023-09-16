Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BBEC2BA12
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cicF7chj7riRpPja3q96dvd4VI1Db8nQ+jlNJBelRdk=; b=jaa0kFjQE2j9ftpq7XJ1Eo33z3
	EF6e12+7V5COyI0vMsUAiH8weKcki/XNZ/dMKxT0Bi4ak6uIb/wSEfvUOSoucI22y4ciw+udmfwnh
	tyag8ZQH6uKJ8U20Sv0CwiH2X3KbKD/j7bmAN2xVNIvLjvWFRq1gzlXhrmO8TVLmRoLWYA2ZW52i7
	cKfZ7muwpJOwuLBbY3Lh9uJrdXUnOve87/X45nw+JNX50d5QG6YvBFHQf1ZiWKkPCNJc3g3LzKYG7
	qOsANEt8hJcEEQsZyFOLkTM83j6T0Qp0R2KfRhxj2vXKbsM64TC/+1+ezJFG12zx0yMYCsLNfdfET
	LCQDzFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhXjL-00CdTW-1C;
	Sat, 16 Sep 2023 16:01:11 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhXjF-00CdSZ-1e;
	Sat, 16 Sep 2023 16:01:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD3E820004;
	Sat, 16 Sep 2023 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694880059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cicF7chj7riRpPja3q96dvd4VI1Db8nQ+jlNJBelRdk=;
	b=eGZbIXcnDc09K7Gp+rHBN3OWiS/9NK5vw0Gj4xYPxi3VsYaLThWXFfxH4EV8zHrfJJBo6T
	9fq+QNQP1zC4Ukto5j86b4GRfy0XcYAfBXBr/WCRyDMELcpISzTyfM9WJ5GCNKy3mUQ+1i
	LR4/aFA3t3jgS4u2fQGC3Xm4+nr9pk69bV1fe3l0MFGebw11iqbOEYW9guWMrtY0FiDZl2
	KZpnwCsEGY4KEPfCQRmVTmSx/o31pU9Va4K99L9c9nYjT/MaJkviA7yVC8v6pQ/6lIECS4
	gY4v/1Vv0/grUi3JTXrI7+1/mcdFNKdZ11PDij6YbPh3xCAOO59eKmW3FKYuUQ==
Message-ID: <bdd2b752-21f9-4d1e-85e1-75a04479bc73@arinc9.com>
Date: Sat, 16 Sep 2023 19:00:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/10] dt-bindings: net: enforce phylink
 bindings on certain ethernet controllers
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Marcin Wojtas <mw@semihalf.com>, erkin.bozoglu@xeront.com,
 Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Machon <daniel.machon@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Magnus Damm <magnus.damm@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, UNGLinuxDriver@microchip.com,
 Steen He gelund <steen.hegelund@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, mithat.guner@xeront.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, devicetree@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 John Crispin <john@phrozen.org>,
 George McCollister <george.mccollister@gmail.com>,
 Marek Vasut <marex@denx.de>, "David S. Miller" <davem@davemloft.net>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, DENG Qingfang <dqfext@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 linux-mediatek@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Woojung Huh <woojung.huh@microchip.com>,
 Alexandr e Torgue <alexandre.torgue@foss.st.com>,
 Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <20230916110902.234273-8-arinc.unal@arinc9.com>
 <169487630940.1637895.12001153052612710003.robh@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <169487630940.1637895.12001153052612710003.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_090105_842774_55B1EF46 
X-CRM114-Status: UNSURE (   7.87  )
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

On 16.09.2023 17:58, Rob Herring wrote:
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/stm32-dwmac.example.dtb: ethernet@5800a000: 'anyOf' conditional failed, one must be fixed:
> 	'fixed-link' is a required property
> 	'pcs-handle' is a required property
> 	'tbi-handle' is a required property
> 	'phy-handle' is a required property
> 	'sfp' is a required property
> 	'managed' is a required property
> 	from schema $id: http://devicetree.org/schemas/net/stm32-dwmac.yaml#

I will address the examples once I get a comment on my paragraph starting
with "RFC:" on the patch log.

Arınç

