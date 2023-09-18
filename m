Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A5CC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 18:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8roNBuuDaR//rlNAY0ErGJWNOyM8Y8kuZbzLqR97Vw=; b=x2tZnj4esI6ybBcRXpV3pZ7xYl
	7Tr66diULqjgxFCHyoMAIIl1tnqObLrxOWZFPuHzKo0FBIpD1N/MxMAYUU0fqy/KTqvEG7Bk+DGqR
	/n+Wa6cYAwNZutWfEJJ75Bmf1HjETxhGCNamGieXVPA0Vq3VY+/FkNrrXcKf7bzzZcrf9L0abM8Mb
	uaEenbD41k99k8ul9U+1O6QDWfY3yu6N+yL68z1g83/xbEnRtH4uSKW/+x4xGjONnH+xv8PslOMu0
	TuUqC4zLd7E6d2BAOMpu44z4pe+CFmgfoONtUcknuWJ5uymTj2pDx6zU/bihwVvE3nDH14yUBdg1L
	yBVtTYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiItq-00G4k9-0f;
	Mon, 18 Sep 2023 18:23:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiItm-00G4jk-2x;
	Mon, 18 Sep 2023 18:23:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F36861269;
	Mon, 18 Sep 2023 18:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6319EC433C9;
	Mon, 18 Sep 2023 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695061385;
	bh=K6Jke6f1gOGRYXeQmbl6ZNz2+SRAqJPVYZt+5kqTTuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCofasMjtggYwXhb+cdAOlpMq73wdnDBhaK2BjV1PXve7JJnbun1K7Yd8CfgBcJes
	 APO/WThH3dJEURfJTdhL4LhTR5qfzhDyl7qR4r4T+GhlpAbmF7gUcff4dBXVUtgxlC
	 WCtNvN/ryoRGoQ0hWllcRTEaUx0FKXieC9N+GN1L0YugaKAxPjINaSlcfImXyEsE/N
	 rmblrUxjhhgTbcIgnNxMtotA+z0ypE8D/mRh+O1H1yQbwiR02DVk461kA6n4I1H3AS
	 PygbfKTKnxJgBefLnHW0JhLLC2Nv63ULzQ4RRuUqu9JjZAagYdZjAFjic2ord/kIew
	 SfErX9sRBlzMQ==
Received: (nullmailer pid 1473334 invoked by uid 1000);
	Mon, 18 Sep 2023 18:22:58 -0000
Date: Mon, 18 Sep 2023 13:22:58 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, George McCollister <george.mccollister@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, Marcin Wojtas <mw@semihalf.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>
 , Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Marek Vasut <marex@denx.de>, Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, John Crispin <john@phrozen.org>, Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Horatiu Vultur <horatiu.vultur@microchip.com>, Oleksij Rempel <linux@rempel-privat.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar
  Nori <nsekhar@ti.com>, Shyam Pandey <radhey.shyam.pandey@xilinx.com>, mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 04/10] dt-bindings: net: dsa: nxp,sja1105:
 improve MDIO bus bindings
Message-ID: <20230918182258.GA1464506-robh@kernel.org>
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <20230916110902.234273-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230916110902.234273-5-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_112307_059445_08AB7390 
X-CRM114-Status: GOOD (  12.32  )
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

On Sat, Sep 16, 2023 at 02:08:56PM +0300, Arınç ÜNAL wrote:
> The SJA1110 switch uses the mdios property for its two MDIO buses. Instead
> of a pattern, define two mdio nodes. This ensures the same compatible
> string won't be used twice. The address and size cell definitions can also
> be removed now that the reg property has become unnecessary.
> 
> Move the comment to the description of mdios, mdio0, and mdio1 properties.
> Disallow the mdios property for SJA1105. Require at least one of the MDIO
> buses to be defined to prevent empty mdios child node.

It's an ABI. You can't just change this.

You can split the pattern into 'mdio@0' and 'mdio@1' with different 
compatibles for each if you want.

Rob

