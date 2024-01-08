Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E02C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQZDa6ilZNXmfNTth7j6XpoepsKlorpYmcwfbtEgwkU=; b=EuM2qXWCdt08GXabkau3V2YGWv
	i+ptcJ0yWNqI05SvuEtWDTamqQhk4oh2mGgaH5Q9bEGaZpb/fx4kNce1wuikDc7huaBAZw6mBDKlq
	lsRl3ZaMszgj1JbljHCS33vGHTK5bWBGxTuUxx2JG2AUgghRPmfD1n4ZGnDOm5XkdlohgJS+HIaDw
	DhYi5MeO2OYwckxFn0mV400m92jmBfyJ0jei76VwND/gQKSHoqYITcwFwXkIt7b4J7kZWuRUSTG8O
	u3sGXkaFHlYOEHhoLtVTkOP/HjcMSyByVo0CMZKkHs++A8GWt/69nD0onVncspFFdlXZA0Yqueu9e
	Zpn/EAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rModV-0051fN-0s;
	Mon, 08 Jan 2024 12:21:45 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rModR-0051el-2v;
	Mon, 08 Jan 2024 12:21:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rMod7-0004sJ-33;
	Mon, 08 Jan 2024 12:21:23 +0000
Date: Mon, 8 Jan 2024 12:21:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2 3/3] arm64: dts: mediatek: mt7988: add clock
 controllers
Message-ID: <ZZvou6RXPcXZS72s@makrotopia.org>
References: <20240108085228.4727-1-zajec5@gmail.com>
 <20240108085228.4727-4-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240108085228.4727-4-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_042141_943662_F3267F30 
X-CRM114-Status: GOOD (  14.43  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, jason-ch chen <Jason-ch.Chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 08, 2024 at 09:52:28AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add bindings of on-SoC clocks.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
> V2: New PATCH in the series thanks to Daniel's bindings work
> 
>  arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 41 ++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 5a778188ac21..bba97de4fb44 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -78,12 +78,51 @@ gic: interrupt-controller@c000000 {
>  			#interrupt-cells = <3>;
>  		};
>  
> -		watchdog@1001c000 {
> +		clock-controller@10001000 {
> +			compatible = "mediatek,mt7988-infracfg", "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		clock-controller@1001b000 {
> +			compatible = "mediatek,mt7988-topckgen", "syscon";
> +			reg = <0 0x1001b000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		watchdog: watchdog@1001c000 {
>  			compatible = "mediatek,mt7988-wdt";
>  			reg = <0 0x1001c000 0 0x1000>;
>  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
>  			#reset-cells = <1>;
>  		};
> +
> +		clock-controller@1001e000 {
> +			compatible = "mediatek,mt7988-apmixedsys";
> +			reg = <0 0x1001e000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		clock-controller@11f40000 {
> +			compatible = "mediatek,mt7988-xfi-pll";
> +			reg = <0 0x11f40000 0 0x1000>;
> +			resets = <&watchdog 16>;
> +			#clock-cells = <1>;
> +		};
> +
> +		clock-controller@15000000 {
> +			compatible = "mediatek,mt7988-ethsys", "syscon";
> +			reg = <0 0x15000000 0 0x1000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		clock-controller@15031000 {
> +			compatible = "mediatek,mt7988-ethwarp";
> +			reg = <0 0x15031000 0 0x1000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
>  	};
>  
>  	timer {
> -- 
> 2.35.3
> 

