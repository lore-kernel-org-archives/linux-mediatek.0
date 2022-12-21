Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E641EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsIO6fcgLcj0cnDXBlcqy/fjcRfEhqdy3sfloL/qhGs=; b=CfGYQPcbd7QObCrg2wYdX5Nhh4
	KXdwKh593mG908vHEnPLHRzCsvc6lNiLN8RpkgnjrSzMLTn0R0fO8aoiiqKr36b3ETztJqhGEa0BL
	3aoQJgxgq/vXvY4mfGJKQNXuY1JStj1qrKWkRVevkFoTW/KJ9ioVmQTF7lFtsuCG+Z46A9FUSqtlJ
	FryiXCIbPSxLuBoKPmMX2Ddo/kNZPgUGuPoYyltTR8kq4I8GKu7BUFrKZCYn7sfoA9lv3Qqzxro4D
	AZRxNlLl4eTtsFqHxga68rENzNhi3bTmGwTlpNRSiVXBvlIO/5Vw7ltAFPhG1soyBn7Mp8SLr1NJb
	yxWVUjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7w8o-00DIBo-J8; Wed, 21 Dec 2022 10:16:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7w69-00DFcs-ME; Wed, 21 Dec 2022 10:13:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1D1C6602CBE;
	Wed, 21 Dec 2022 10:13:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671617591;
	bh=n9OD75LWbhmmE+p5PTtkkUSFONy/coTD+gGYR7GYpbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X8Mx8SIZzCnbeE3LdffT171/+o2OjubaXA2Kz0R4rzt2ROYvvHQHK23QwaOOMrxG9
	 RgXxrksd3kUKYNGamMDpIkTSWpo+nloYUaaksHGqT455U8rYXXEigxWXo+6n9ZFIBo
	 VfGJd/2m/7nKps9oxigztO2m1xn6lRd92mvvDX1KP721TPDyUrqnJekwD8+WWLiNKt
	 cyabcbyXsTOmRicICbyjxOCp9SYE3G9/A9pR+Kygn26Kdi5UR4MzVIjeoATQnBTGQj
	 vYq3/RnlJJJqvptlZxMU5ZC6q7A+n2yKAfnI1hF0mC99Dpo7SduiqUjkiybKUojvxL
	 Subs/MjIoR0tw==
Message-ID: <f591f169-acd8-d408-970b-8afc66eda8cf@collabora.com>
Date: Wed, 21 Dec 2022 11:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v4] arm64: dts: mt8195: Add Ethernet controller
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com
References: <20221221022523.8458-1-biao.huang@mediatek.com>
 <20221221022523.8458-2-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221221022523.8458-2-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_021317_899562_518243DA 
X-CRM114-Status: GOOD (  12.77  )
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

Il 21/12/22 03:25, Biao Huang ha scritto:
> Add Ethernet controller node for mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88 ++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 86 +++++++++++++++++++
>   2 files changed, 174 insertions(+)
> 

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 5d31536f4c48..02112bbf2bdf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1046,6 +1046,92 @@ spis1: spi@1101e000 {
>   			status = "disabled";
>   		};
>   
> +		eth: ethernet@11021000 {
> +			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
> +			reg = <0 0x11021000 0 0x4000>;
> +			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "macirq";
> +			clock-names = "axi",
> +				      "apb",
> +				      "mac_cg",

mac_cg goes as last clock, as specified in the binding.

Order: axi, apb, mac_main, ptp_ref, rmii_internal, mac_cg.

Please fix.

Regards,
Angelo

> +				      "mac_main",
> +				      "ptp_ref",
> +				      "rmii_internal";
> +			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
> +				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
> +				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;


