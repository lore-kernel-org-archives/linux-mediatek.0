Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FB5C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXKYz7rYMXq321XydKfDJT6eMH6NsCg2Iz+MUF1r7Os=; b=N/y/76IVZFKkW2
	TpVMBWclRrJXcWHpAyaix16wOch7dyyePSBxJ6fiRrtHApjrduFpoRldUtn8d1kmYgaFMcEKv2xez
	W7xLeDF64ENzXy3FvxCmEThL7d3HHiE8HuD5n2pGjpPfnQUL4RNEA+xnT0wLWd1ZfbH6KHIBgmsDV
	bZBI1j1Fn/0YeFGybj4Ctz1tqpWmZ5xKW4U7E/JNaiG7d+jjOADLzWuHGAIi7B1dpT6KGQ8LcVXy8
	kTmxO1ZC3lc+KSIfzo/NBgeBTRdT8sQPnPHLFMpcwehVk6mzAS0Hm/3RKIPwEd2AkP+FSeveY3yfz
	34CUt0EuU4J8Ewp0dYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3EJ-00EXXI-SY; Fri, 18 Feb 2022 13:23:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nQ-00ELMl-4f; Fri, 18 Feb 2022 12:55:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3E1791F46724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188934;
 bh=BRoYVwJM/U76dTqPgt7FwoL/dGJH6kPyI+rQnHeI2Ns=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=YOD1Epml7xZRQSFKg1pgdV4lJIvl9jIZNmlx1Um3pl/rpbvY/JeAxvQsENpDcEhSu
 i0Z1aNX/aC317AcMeghwQ13uaP4H4vqXkFLK1DxDfFxZuOk+CJaUNrZURcea2sAFiT
 n+JVC8kmynuuXjK8LJFGoYQX+h6dH4yL3g50e4X5hdGIL/3KZxsMxqqFX7FCNB4rVY
 ZyQ6EI3zKnfrXoyj8qo1XmSGXMvvULy55hqpuqOvqfGjRVcM54Hsqku9Hxlwnl8bi9
 ngvC0pki1a9jFUfht/DbnS69N/tIvvY5XIViFAYorIR2YTvSs9KvvfXqPPMHueq95x
 HjgubwT7DvmkQ==
Message-ID: <7ce0bf47-b0c9-b6e6-92f3-b7a11b3adfd5@collabora.com>
Date: Fri, 18 Feb 2022 13:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 06/23] arm64: dts: mt8192: Add usb-phy node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-7-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-7-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045536_376616_9BF53358 
X-CRM114-Status: GOOD (  13.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Add xhci node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 61aadd7bd397..ce18d692175f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -875,6 +875,31 @@
>   			#clock-cells = <1>;
>   		};
>   
> +		u3phy0: usb-phy@11e40000 {
> +			compatible = "mediatek,mt8192-tphy",
> +				     "mediatek,generic-tphy-v2";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;

This can be better:
			#address-cells = <1>;

			#size-cells = <1>;
			ranges = <0 0 0x11e40000 0x1000>


> +			status = "okay";
> +
> +			u2port0: usb-phy@11e40000 {

			u2port0: usb-phy@0 {

> +				reg = <0 0x11e40000 0 0x700>;

				reg = <0x0 0x700>;

> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +				status = "okay";
> +			};
> +
> +			u3port0: usb-phy@11e40700 {
> +				reg = <0 0x11e40700 0 0x900>;

			u3port0: usb-phy@700 {
				reg = <0x700 0x900>;

> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +				status = "okay";
> +			};
> +		};
> +
>   		i2c0: i2c@11f00000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11f00000 0 0x1000>,

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
