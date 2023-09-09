Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A710EE57DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Sep 2023 21:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zt6OrCismPf+aycVIJ+FicoSu1Q1+BGOLqCiYwahFl8=; b=zbaIZJd0HSBRpPgkgFOnH4xdX4
	lMThM1E5l4zT/GaDJ54Z8sewezFPN3bgIWlA39u+RgSDkfJEq1a5n2OajlhT/oXFHbbXS5sILCxc0
	8W8Hz/0avk6D1IjyI9xqokoTQ9Q2rzJezTIa+WInq5usQIBP8efWBasOKdyrw/TqizBTWje+5A/Ni
	L2HHRLlmj02gAPNoPdBgCwtMD59uqKKDPYQOI6Pf4bQ5wL5Ywsc89B0Lb6dXP9ONkCN2/2Jtgxtuv
	RZPNM863H8PaRkfxxAkkYQr1nV5FD6iy7Dv1kETHP0IboxRjkYJDOhteUbbTsslY68h4CDVxgv3Rs
	Mj6fnWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf5Jl-00FoU6-2H;
	Sat, 09 Sep 2023 21:16:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf5Ji-00FoTc-1c;
	Sat, 09 Sep 2023 21:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Zt6OrCismPf+aycVIJ+FicoSu1Q1+BGOLqCiYwahFl8=; b=coKzf3opw1nK9pbEe4bFgAR6Lf
	AcLRY6jlcfWy5v+CNsR7DaCMqlDaCfDALWhQILBbx+sTVkzO8DrN6F4y4s/e3UATN38JM+WMaPvk0
	jJ2VbbEMEKKJ+JqHChsqm6lVfDp5TFl2FP1C9sGXT9bHln5wHM45FameMSFKrepR/nW8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qf5JF-0064b4-2c; Sat, 09 Sep 2023 23:16:05 +0200
Date: Sat, 9 Sep 2023 23:16:05 +0200
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
Message-ID: <71f7c475-e111-4e4b-9e8f-4c8a6bf6bc34@lunn.ch>
References: <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_141634_561552_BC9688CD 
X-CRM114-Status: GOOD (  10.99  )
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

Please trim the text when replying.


> I'm writing below as a mix of patch log and discussion.
> 
> Phylink bindings are required for ports that are controlled by OF-based
> buses. DSA, like any other driver utilising the Linux MDIO infrastructure,
> can register a bus. If I understand correctly, non-OF-based registration of
> OpenFirmware MDIO buses is a feature specific to DSA which certain DSA
> subdrivers make use of.

This is not really DSA specific. Any MAC driver, or MDIO driver, can
call mdiobus_regsiter(), or of_mdiobus_register() and pass a NULL
pointer if there is no OF node available. It then requires that the
MAC driver uses an function like phy_find_first(), or knows via other
means what address the PHY uses on the bus. For DSA, that other means
is assuming a 1:1 mapping between port number and bus address.

   Andrew

