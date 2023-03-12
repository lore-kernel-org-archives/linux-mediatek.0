Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2321C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 02:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLIgvG34Sc+lDohdVZWPEZo6FgjzStnEHWeCstzLe6k=; b=qBAfposvRiZCEsu3Bf5wnGkYMt
	mbWvCw5Bc6M6UJdL5aeWtQnE7tWoTG3JyX5NLMip+WcwV5BMVzxDKY6KHZ6gdjT+gI5E5eTnv3zMt
	MRiIG2+LTEnAP/7i/7Rzksr+M52bIigCythsnqA83lZG7GWgsa1Ll3zpuk+SN4KgvYM90ZFHE2+3X
	UFyUU+9Vt616lMszCu+HuNcVHUNP5ijdRqepj2U7GuIzDGb81LJ0RoaWM3u0TJXH+Xq6mjNp2fv/x
	LlOL/tO9VRG18la/RLH4dy/l1ikifSaPBJHFKdSjcy+NuXnm17XbXBBn8Y2hydd/5SKNMFTOstOfO
	XHX13N0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbBqw-001j4L-5b; Sun, 12 Mar 2023 02:54:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbBql-001j3V-Hy; Sun, 12 Mar 2023 02:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xLIgvG34Sc+lDohdVZWPEZo6FgjzStnEHWeCstzLe6k=; b=JJC1gzH4XjKAY1yMwNL6sqcv37
	gSSSB8dGXc3gMl0PdFDUv5w3aSdiDh9830SEmmbma+yikri5UNuOesvefuHisH8/fpv0HNO4ICXC0
	Pr97yR0lgntFbgpaWKDDaTvR4i/nOnW29hKU0w3QeXYDB7DkO1n6s7925UjcRlWlZ4eU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pbBq8-0075xU-UV; Sun, 12 Mar 2023 03:53:40 +0100
Date: Sun, 12 Mar 2023 03:53:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Michael Walle <michael@walle.cc>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-aspeed@lists.ozlabs.org,
	Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
Message-ID: <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
References: <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_185419_645824_79D41653 
X-CRM114-Status: GOOD (  10.77  )
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

> Here's the definition of the switch in the Turris Omnia device tree.
> 
> 	/* Switch MV88E6176 at address 0x10 */
> 	switch@10 {
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&swint_pins>;
> 		compatible = "marvell,mv88e6085";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		dsa,member = <0 0>;
> 		reg = <0x10>;
> 
> 		interrupt-parent = <&gpio1>;
> 		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			ports@0 {
> 				reg = <0>;
> 				label = "lan0";
> 			};
> 
> 			ports@1 {
> 				reg = <1>;
> 				label = "lan1";
> 			};
> 
> 			ports@2 {
> 				reg = <2>;
> 				label = "lan2";
> 			};
> 
> 			ports@3 {
> 				reg = <3>;
> 				label = "lan3";
> 			};
> 
> 			ports@4 {
> 				reg = <4>;
> 				label = "lan4";
> 			};
> 
> 			ports@5 {
> 				reg = <5>;
> 				label = "cpu";
> 				ethernet = <&eth1>;
> 				phy-mode = "rgmii-id";
> 
> 				fixed-link {
> 					speed = <1000>;
> 					full-duplex;
> 				};
> 			};
> 
> 			ports@6 {
> 				reg = <6>;
> 				label = "cpu";
> 				ethernet = <&eth0>;
> 				phy-mode = "rgmii-id";
> 
> 				fixed-link {
> 					speed = <1000>;
> 					full-duplex;
> 				};
> 			};
> 		};
> 
> What you are proposing here would not show any improvement on the
> Omnia, as only the 6 ports would be scanned - right? 

Correct. But their also should not of been any noticeable slow down,
because there should not be any additional scanning when everything is
described in DT. And the move of the MDIO bus registration from probe
to setup should actually make it faster than before.

	  Andrew

