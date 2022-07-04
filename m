Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D65C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUX21JSs9qi2/VTgRKc2F91JoYv9uyMFGbU9bKYbRqA=; b=2HceQil7q71NkIuLi108KE0kdZ
	F0x0J5FMfNKhiBR0I5owEz3uG/Bg2+sPbU24ZtiPDpM/TCZA+oDusdIgouut1jvkDFNrw75jHDl/g
	6jLfG2Y3pNOm7NSgLMEEzwGGtWnCKEbxB+E6fwKHHxS/yR+vmDdft3sZVCLrN5iNrzKNEHrkAHzuo
	U0Rdrkew6tqRVfd2f2zdqlQx8szl6xLaiRrS/UDS2Jx3BCVHdQHiPh/gyr7Y49nDibw+e0xU3Urwc
	INd2MxBpOepQqMoIWAlWYCDOTesCqtJXfyKEfa3oqq82ECZ3owRo2OIRZBG0A6j3uKNOMpXa/D6+E
	CAIarPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KBk-007gbQ-As; Mon, 04 Jul 2022 11:24:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JYq-0079rR-9U; Mon, 04 Jul 2022 10:44:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 62B6766015A6;
	Mon,  4 Jul 2022 11:44:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931450;
	bh=gjNEsUi0SsF/6vtg4n8Tc6Jg9gWEjEsUA2sD8bp3x9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CioOKrpDBDzPBsG3sOxB6gSfHCwZY7y8rfYurcXucgtbNanLuZyEK65ugGX2LLs4V
	 dFKRiesAMYgxiR47wQvDPJBuBmt3S/nD8IeQWXNnLvdnnYIFDESGu0b5o+6DQDSx22
	 lc0gNcxYvD+zaz+qQS4DA6vBz/s6u+i6BKT5KnWjHv8FTNh5sIDZffjdxdZqZV3j0d
	 OddSGfq5JlDhU6UWuMb75zhx69WQbzMPSCSmLu8ArrCKdV0wU9SpI4aEjTSPTyxFkB
	 soyVnShjmhFu8A+ArMUl7Akqabr6UYyPG2qQqN9FTNJkDlual7BTuzAmndoUYsWB7R
	 IRmJE2yXMbbwA==
Message-ID: <84ce9b03-9edd-9ef1-aec1-127b34c23021@collabora.com>
Date: Mon, 4 Jul 2022 12:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 16/16] arm64: dts: mt8195: Add display node for vdosys0
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-17-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-17-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034412_558215_B45DD7AF 
X-CRM114-Status: GOOD (  15.24  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> Add display node for vdosys0 of mt8195.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 109 +++++++++++++++++++++++
>   1 file changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 724c6ca837b6..faea8ef33e5a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1961,6 +1961,7 @@
>   		vdosys0: syscon@1c01a000 {
>   			compatible = "mediatek,mt8195-mmsys", "syscon";
>   			reg = <0 0x1c01a000 0 0x1000>;
> +			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
>   			#clock-cells = <1>;
>   		};
>   
> @@ -1976,6 +1977,114 @@
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
>   		};
>   
> +		ovl0: ovl@1c000000 {
> +			compatible = "mediatek,mt8195-disp-ovl",
> +				     "mediatek,mt8183-disp-ovl";

This fits in one line, please fix, here and all of the other instances of that.

> +			reg = <0 0x1c000000 0 0x1000>;
> +			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
> +			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;

Same for gce-client-reg.

Regards,
Angelo

