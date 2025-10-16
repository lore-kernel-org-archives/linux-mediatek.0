Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D6CCD199
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyUtjkO5Dx3bwD3ESxY3owdYu3eKu7j1RTp0Owu07Fc=; b=T/Ugjk22scZC03zDgG5vSrYy8/
	s9rNA7flt3ls2vLQHbYY8IWHGTPGJbXEJOCSCryfBLIEvr3sq+Us+jBbeh2hp68dh58pFULsh6PyE
	axoEMMuIQkFGhiP7JXQgoudgLLEgXpgl/VshtaEVdABtGzNWA/EnWVvYTu2NmINabKlqxqwye197k
	c2ytDG89Fi1WYQS1cG+ssHYA2P/zhyZmwqLwh3oQ7ChirXRB5UQNjlpwo16KYwDD8Ww6Mk293DK+B
	oOO4YTw0WvgJTFQFyu1zfVzE3lczw+jdqmBh8wSoWblTKIuxoH3NNFziydgKDZ59f95hgaZ8yrFtz
	A5COvA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NG5-00000004lU8-0jbx;
	Thu, 16 Oct 2025 12:39:05 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NG2-00000004lT8-1DIB;
	Thu, 16 Oct 2025 12:39:03 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1v9NFk-000000001SH-1ypz;
	Thu, 16 Oct 2025 12:38:44 +0000
Date: Thu, 16 Oct 2025 13:38:39 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH 02/15] arm64: dts: mediatek: mt7981b-openwrt-one:
 Configure UART0 pinmux
Message-ID: <aPDnT4tuSzNDzyAE@makrotopia.org>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-2-de259719b6f2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-openwrt-one-network-v1-2-de259719b6f2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_053902_323946_F4299B86 
X-CRM114-Status: GOOD (  14.49  )
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

On Thu, Oct 16, 2025 at 12:08:38PM +0200, Sjoerd Simons wrote:
> Add explicit pinctrl configuration for UART0 on the OpenWrt One board,
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> index 968b91f55bb27..f836059d7f475 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> @@ -22,6 +22,17 @@ memory@40000000 {
>  	};
>  };
>  
> +&pio {
> +	uart0_pins: uart0-pins {
> +		mux {
> +			function = "uart";
> +			groups = "uart0";
> +		};
> +	};
> +};
> +
>  &uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };

As there is only a single possible pinctrl configuration for uart0,
both the pinmux definition as well as the pinctrl properties should go
into mt7981b.dtsi rather than in the board's dts.

