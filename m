Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76342D7833F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJTLHIDM8cbROBvwekmhQrpvnRkpByccmrZUFB8RV+s=; b=xn88bP+tqgjBNv
	qx35DkIE11/vHAsspqKoTglxbtl0dw3+Y2jxTdA0GqmYvA6Wyvz2i8GrpGmJoXTMI5e/6aA4FUgAP
	zPeTfrq92GgzAQTzAKY+i6FpmTuCYF6n57eH/ccqZ0Aa05SBgpvQDW1H1HsvbyJxd1UkIgpqIXC8v
	5pB89oEtaiJ9gS24Hyb4h8cl/MNbLZtZIBKt/+vqNEytwd6nWIpoZQUw3i6BKD3mHVCnWvoFJ8Y9a
	QOatCM2El2ap4GVYIfO7NAUi6ihFn9+KkQAebA/QbCR+glBLTpZURf0xX1+4DU2AdlxtOAv61wx2i
	a/rsgMLSNpthA1QGcYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPg8-00000008zxn-2hrZ;
	Tue, 03 Dec 2024 09:58:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOo-00000008w40-3LUl;
	Tue, 03 Dec 2024 09:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218853;
	bh=lCldB2eYepeDI9l0gNXW/pWwP1Kv8KXDDck4h6qdu5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fe9PBMktSU7u8+E4ib2sLN6fEYPjnXiCh5a9w/C2cWXoJmIIK/0Cbnk7ANDYeNIz/
	 0gtpxbktLVKYOHjqIfPhLywzc0PfKV+yvcuuqwA2EeBFHVDqTX0TJBRnN/vpcYA+1l
	 SyX051kGyFTEU9BEAeojYIDmzN0F9awt+WBBwOLFfK52+z6HxpkdLRdd+7QFOLFH9o
	 Bbd2vJ4x7prK/E78kXRWEXZ4ZJxx8ck1PoISYVCNz7lmecu7fHW+2Q5Zr25ZF/NBSK
	 dwUHiQkcQ5Wki0WEDXn0X9+hEsloSOzQ7pVDPAlsO9yumdfNeOh9OfZfn+3rDV++xY
	 mhzccaWTTwU0Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1406517E35D8;
	Tue,  3 Dec 2024 10:40:53 +0100 (CET)
Message-ID: <d726c20e-a7fc-4477-b2f9-b933d993a566@collabora.com>
Date: Tue, 3 Dec 2024 10:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/18] arm64: dts: mediatek: mt7988: add mmc support
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014054_983262_296429FB 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add devicetree node for MMC controller.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes:
> v2:
> squash "add missing label for apmixedsys"
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 24 ++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 46969577c87a..5e40446cb7b3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -100,7 +100,7 @@ watchdog: watchdog@1001c000 {
>   			#reset-cells = <1>;
>   		};
>   
> -		clock-controller@1001e000 {
> +		apmixedsys: clock-controller@1001e000 {
>   			compatible = "mediatek,mt7988-apmixedsys";
>   			reg = <0 0x1001e000 0 0x1000>;
>   			#clock-cells = <1>;
> @@ -278,6 +278,28 @@ usb@11200000 {
>   			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
>   		};
>   
> +		mmc0: mmc@11230000 {
> +			compatible = "mediatek,mt7988-mmc";
> +			reg = <0 0x11230000 0 0x1000>,
> +			      <0 0x11D60000 0 0x1000>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_MSDC400>,
> +				 <&infracfg CLK_INFRA_MSDC2_HCK>,
> +				 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
> +				 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
> +			assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
> +					  <&topckgen CLK_TOP_EMMC_400M_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
> +						 <&apmixedsys CLK_APMIXED_MSDCPLL>;
> +			clock-names = "source",
> +				      "hclk",
> +				      "axi_cg",
> +				      "ahb_cg";

One last nitpick: all of the clock-names *do* fit in one line.

			clock-names = "source", "hclk", "axi_cg", "ahb_cg";

After which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



