Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455EDC19F4F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwId/gHhUdygsSivVIU/29aukVTF9P90rQHgLkHXaBQ=; b=KK3Ey5MFVdnd0Uz3KPJ8xSUo3j
	Hpu1bZoJllA0THAznhJ10jdYHAUFXl/f8BL3vmNzaBGfB+wEmBqafoYwz9dEzW4oiKynj+4iT5vtk
	FzlbQMTmUxUSn1ZPLb15IPKz7ob0r93vbOhNONAlbgBqcnVEMKs9ijCfBLfiEYAj1wLeTIQ1Frow6
	GF9Ij0mjUKJZKa2dfJrbJCuNYfjbv5rasuRt5O8t/0odCs8qRMsrrwDBQMGGRP+OtYP+oCOiZKN4J
	SrWjw/tjjZGXEgWFc0+ejdAGFlMf6TA9VCDTUiF2pIuSM0wl9W8iHWwdFmdXRHhTdokv4VfZyM+iz
	d7tHOXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Qbd-0000000CZhT-1gy5;
	Tue, 07 May 2024 19:36:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QbZ-0000000CZey-3z5z;
	Tue, 07 May 2024 19:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2A425CE167C;
	Tue,  7 May 2024 19:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DFEC2BBFC;
	Tue,  7 May 2024 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715110559;
	bh=bRHbcYBsOau7RDjFb4TOtC+YEMb0oH2Rg3gRpr/6wGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUhfyIqgDc7kjRSbwQgC0OoI/RDBN9Ux6JALUaqshYxEFPa6wmQ2fkgPhNkgM2dtU
	 QTzt1ROsrKQhB/LJi5Hei/I/nSEyAld3Iat/IbbGFHuFSQ2y2QvXtxAt3AX2lnHYAo
	 J8YVu0/7vBFKKD+MDwLe3sj7V5tNZYNzOwgg/3taLFAdn7EHpDO13WIWeX2S7DI3UV
	 hxWSrxgrulED+svg0ShBGgzKks8Kw3qd2z5KhpdgJyRR6SqRcNM+0PR4YDK+Eit0R/
	 qQF7h5hPXbik8gNcWut6WxI045KzrabGMvqTlHsdza4HlMTJtpvEagRE4uT46RtBom
	 RXmqb+qmu8bvA==
Date: Tue, 7 May 2024 14:35:57 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Frank Wunderlich <linux@fw-web.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Tianling Shen <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: Aw: Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add
 address-cells and size-cells to ethsys
Message-ID: <20240507193557.GA924525-robh@kernel.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
 <9f8237c4-f603-459a-9d34-9cda556874b8@linaro.org>
 <trinity-9ceb52ff-9a3b-4fe2-93f8-2e95b8ffb1ee-1715014303393@3c-app-gmx-bap23>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-9ceb52ff-9a3b-4fe2-93f8-2e95b8ffb1ee-1715014303393@3c-app-gmx-bap23>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_123602_198334_448BAEE0 
X-CRM114-Status: GOOD (  13.80  )
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

On Mon, May 06, 2024 at 06:51:43PM +0200, Frank Wunderlich wrote:
> > Gesendet: Montag, 06. Mai 2024 um 10:18 Uhr
> > Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> > On 05/05/2024 18:45, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >
> > > Add missing properties already used in mt7986a.dtsi.
> >
> > Missing for what? Or why? Provide context, IOW, explain why they are
> > missing.
> 
> ethernet-node in mt7986a.dtsi hast reset-cells-property
> 
> https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm64/boot/dts/mediatek/mt7986a.dtsi#L559
> 
> and
> 
> address-cells and size-cells are used here:
> 
> https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm64/boot/dts/mediatek/mt7986a.dtsi#L495
> 
> i saw the warnings while checking my r3mini dts...
> 
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: syscon@15000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml#
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15100000: Unevaluated properties are not allowed ('#reset-cells' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
> 
> so i thought it is a good idea to fix this now ;)

The dts is already fixed dropping these properties in linux-next.

If you don't have child nodes with reg/ranges, then you never need 
#address-cells or #size-cells.

Rob

