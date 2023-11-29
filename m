Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC5BC07CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4l0EJnHFs9kMVCqLlaDSBNN5K4Yy69DJ6wA0JtlHug=; b=nsNw/jT6I3UX1WVMpkAPPD4jl8
	gLjCL/WoMo7xXDf+eJ2q3Rinqpq64aqD1/VQNmm3MCTW4qHN0i6k4/ecWHvxygaxYF+EMt4LmWkEI
	SKfso71lp2RNz3kNKEDnCm8GxnknxxeJx2cQhl+JawJs9Weg0xSALhBSga6E3Le+pTHkFMQ0w6Hx5
	FX/k+qCL0bV7RmIxFiA4ZcWs3CQ0IM/jrQthU8OB+i8IJR0zltiQNwnUVZo6vEtHYhIIcImTVK0s0
	vDfNilbn3RU4GCQkwonW68JEXnadlMSGP3sUy5R5EYOb8QXjY/KFvbdPe+Uh6A7Kh+QtyVnvLFUyQ
	cT3Pbgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8F16-007M7j-05;
	Wed, 29 Nov 2023 07:29:52 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8F10-007M4o-02;
	Wed, 29 Nov 2023 07:29:49 +0000
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 3023420395;
	Wed, 29 Nov 2023 08:29:36 +0100 (CET)
Date: Wed, 29 Nov 2023 08:29:30 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Message-ID: <ZWboWqELHbIrblnz@francesco-nb.int.toradex.com>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_232946_234248_138131BD 
X-CRM114-Status: GOOD (  13.83  )
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

On Sat, Nov 25, 2023 at 07:44:22PM +0100, Krzysztof Kozlowski wrote:
> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.

Thank Krzysztof, we had most of this collected as BKM in some internal
documents and it's great to see the effort to consolidate this and add
it to the kernel documentation.

> ---
> +Following order of properties in device nodes is preferred:
> +
> +1. compatible
> +2. reg
> +3. ranges
> +4. Standard/common properties (defined by common bindings, e.g. without
> +   vendor-prefixes)
> +5. Vendor-specific properties
> +6. status (if applicable)
> +7. Child nodes, where each node is preceded with a blank line

On point 4, do you have a more explicit way to define what is an actual
standard/common property? You mention the vendor-prefixes as an example,
is this just an example or this is the whole definition?

What would be the order for this for example (from an existing DTS file)?

	reg_sdhc1_vmmc: regulator-sdhci1 {
		compatible = "regulator-fixed";
		pinctrl-names = "default";
		pinctrl-0 = <&pinctrl_sd1_pwr_en>;
		enable-active-high;
		gpio = <&main_gpio0 29 GPIO_ACTIVE_HIGH>;
		off-on-delay-us = <100000>;
		regulator-max-microvolt = <3300000>;
		regulator-min-microvolt = <3300000>;
		regulator-name = "+V3.3_SD";
		startup-delay-us = <2000>;
	};

I guess the point that is not obvious to me here is where do we want
pinctrl. I like it at position between 3 and 4, the rationale is that is
a very frequent property and this way it will be in a similar place for
every node.

Francesco


