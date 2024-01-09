Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10135C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 13:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvVG2KQV/oETOX0CukFpt/vsd01F13tBQ9AIaAYqp6w=; b=JXg38lfre9BEYE42sLpR7hQBcC
	RRD9pxbuNLlIimboN5meaNlh/VWs764YmJA6NpCpJ/2eG6xvd4XsIeHnHExD1Ue1CEct7HKwyQaAY
	zy3lMDWcO2VbooxNM1OkDqVrjHFotWXHLzb7lXlCEsx4KOz44r7bvHHHI1p8u7vwDaypwGoRDYzz1
	cWyqQFpKYtkCOwepryejRHdqhm1QABqBFtdfDLTgyGFFDrHhodE3fXXbY4xWJcp8RG/5Z8lFfBhxw
	MvgU4Zx2AcRDS7FwKd7zI76/JoSN5ksTbMPZssSVo6KHc7P5SzCsc6mFTC7gzBqIO5kfXXye/W50S
	Ia7G4rAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNCTD-008PoV-1s;
	Tue, 09 Jan 2024 13:48:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNCT9-008PnL-2v;
	Tue, 09 Jan 2024 13:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wvVG2KQV/oETOX0CukFpt/vsd01F13tBQ9AIaAYqp6w=; b=GH4SbNxaChv564U3M/bDK7+b6W
	e4yuHL2BbR4aMHapx53lmIvMyxVTYAtqrdRkQYktWCIpUKceG2nUrXqGw2/b97QNGnEZNL4DgCO+j
	9qS+8VnvXTjPKZu+ILIS9TiPBkLrHFksXOg3/HhB2VxLn1JefXhhBq2PT6SUrN1OF6DY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rNCSm-004pw9-Bx; Tue, 09 Jan 2024 14:48:16 +0100
Date: Tue, 9 Jan 2024 14:48:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <2f2328ee-205b-4b4f-a683-2df4fbb22dde@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
 <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
 <1437d9df-2868-43f5-aebd-e0c57fe4d905@lunn.ch>
 <b75e6267-7d54-412e-8882-af4d9a0b54e6@quicinc.com>
 <841ef784-b27e-4f7a-94f2-f04f93178c61@lunn.ch>
 <07c01c11-0cc2-4837-b371-1404f2ce3359@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c01c11-0cc2-4837-b371-1404f2ce3359@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_054839_955562_D8BA8F7B 
X-CRM114-Status: GOOD (  14.44  )
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

> 
> __| |_______________| |__
> | PCS0 |          |PCS1 |
> |______|          |_____|
> |_______                |<---- REF clock 50MHZ
> |      |------------    |
> |NSSCC |    |clks  |rsts|<---- GPIO reset
> |______|    |      |    |
> |           V      V    |
> |_______________________|
> |     |     |     |     |
> |PHY1 |PHY2 |PHY3 |PHY4 |
> |_____|_____|_____|_____|

Not the best of improvements. So the ref clock goes to the package,
and then magically somehow gets to the NSSCC? Are there any more
blocks it goes through before reaching the NSSCC? How does the GPIO
reset get converted into multiple reset inside the package? Details,
details, details.

> There are difference clock trees generated from NSSCC for the different
> PHYs, all clocks and resets for qca8084 CHIP working are internally
> provided by the NSSCC.

So show this in the block diagram.

> Yes, Andrew, the NSSCC provider driver is probed based on the MDIO
> device, the PHY CHIP occupies the MDIO addresses, so the NSSCC is
> registered as the MDIO device.
> 
> DT of the NSSCC device node:
> mdio {
>       #address-cells = <1>;
>       #size-cells = <0>;
> 
>       clock-controller@18 {
>         compatible = "qcom,qca8084-nsscc";
>         reg = <0x18>;
>         clocks = <&qca8k_xo>,
>                  <&qca8k_uniphy0_rx>,
>                  <&qca8k_uniphy0_tx>,
>                  <&qca8k_uniphy1_rx>,
>                  <&qca8k_uniphy1_tx>,
>                  <&qca8k_uniphy1_rx312p5m>,
>                  <&qca8k_uniphy1_tx312p5m>;
>         #clock-cells = <1>;
>         #reset-cells = <1>;
>         #power-domain-cells = <1>;
>       };
>     };
 
This does not make any sense. You have one clock input, 50MHz. So why
are you listing 6 consumer clocks, not one? And where are the clocks
this clock controller provides, clock-output-names=<...>;

I give up. Please consider this PHY driver NACKed.

Get Linaro, or some other organisation with a lot of experience with
mainline to take over the work.

	 Andrew

