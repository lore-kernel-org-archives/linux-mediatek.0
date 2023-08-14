Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC4DC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 13:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNlIR5BmjVdCXJgcGwHTe/YYZhq8OipyVgHsLjLm8ko=; b=wXm6N2iGoVTi6833xmzoW6A1WN
	FiOBJAfQ6T/PHYKPnxHXidCmQj7T+HR5K8CewDWXnFRM1Lfdp1JnH4/SkACE6+g+6+3alWUpiw8zf
	ugxfEbxRqaJWliFSaidzDMg1wwe+hiof67QfqjXpXt0+pO2wnf4LliXUchS6rep7aqoq1wG+YpfcN
	L96wMDQZYAy6OlwOFasyzTYzakfTx91p5PCPTpgyDQNxHSDZLBhR7+lcJrOYdv88Qt4rNLTdxnfE2
	HVbJKxp8EVNM+3o8R9646KpKqd32iAaJ7WdOowgnMLwu/BrUjbwWbpv0Q8/iZmU1KZDvkXRfrBcBN
	sFt5I+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXKf-00H7lv-2V;
	Mon, 14 Aug 2023 13:10:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXKZ-00H7jt-2o;
	Mon, 14 Aug 2023 13:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gNlIR5BmjVdCXJgcGwHTe/YYZhq8OipyVgHsLjLm8ko=; b=4BD0nhJSTcT3h243KKZyN1Ocjf
	J04TgJOGP3ZgK3VSC52joEwASYDajz767mA/mDAelddXU3iSrrgWXHiZb9nMx6dbBzYV4j+frTPYf
	4w2PlS5hWWxzSXEuBSt6mcFBfkgYw19kl4Re3rHXfJ1lap287z9RZh2/xEbk9cGLwR/I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qVXK1-00431W-Ni; Mon, 14 Aug 2023 15:09:25 +0200
Date: Mon, 14 Aug 2023 15:09:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <617c51cf-2c09-4865-ac60-96599db597e7@lunn.ch>
References: <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_060959_906858_F457A230 
X-CRM114-Status: GOOD (  11.93  )
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

> Ah okay. I didn't consider the switch architecture where the data interface
> of the PHY is connected to the switch, and the PHY management interface is
> connected to the mdio bus that the switch is connected to.

The generic Linux architecture for PHYs and binding them to a MAC via
a phandle allows the PHY to be on any MDIO bus anywhere. DSA has some
additional shortcuts to support 1:1 mapping if the switch has its own
MDIO bus, without describing it in DT, but this is just in addition to
the generic code.

> Not json-schema documentation, don't care about:
> - ar9331.txt
> - lan9303.txt
> - lantiq-gswip.txt
> - marvell.txt

The marvell switch can have up to 2 MDIO busses. If i remember
correctly, there is also one switch which has one MDIO bus per port.

	   Andrew


