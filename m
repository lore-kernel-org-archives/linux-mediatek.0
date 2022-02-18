Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4E0C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1adiuDGAjTYy8RY34TQkkxflfu1zXFZSZ0yzb8LG8M0=; b=YVxH8vj2bHlz+M
	efnfOggo8q48X+p9nKmHH+VNYfG9nGVXD4BGoOGgfb1wknH8q8bLF2CX+rqgQAWT+HBGQU+wZIBsJ
	AwvxyOIP3b591Q9Ns63WheujSt5BlJmd6jl6aABThiR3faM+6LBl4Zk5jQGwq+2k1ilva02S5px71
	2HVNxIjkc8GsxnZyYganRII7Fku5Mp3nCOTE/o5Ov+kij72dzGPOMGpwwnrmQEs1rBEEqUAUyKWg9
	Foy8x1MCt1JlylYV0zByfsBcIeG4zbvtBFOiER/fzj1FJr7Fis626iV+bhoPPHocVFh2qC/Sm1nfU
	eS/AI6EnkQhJayw98eYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3TF-00EdtS-Gm; Fri, 18 Feb 2022 13:38:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2oP-00ELwK-Ou; Fri, 18 Feb 2022 12:56:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EF41A1F4241F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188996;
 bh=zFUQjy3wezXzoLPL7LBwuGlQGw/lZcvr6zcFJ77F9Y0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=hH/5CMbuPz1k5AETD3XwiFw9SHm8qfwGOZWGg4/nk0OmbrmxTpDyZC7YC4NxWxR68
 FDoKPS/3WZel7kDE7sPXTQSuCh4GdBiL9v/AoFzffvmhR7RiVVV1Tu8t9s47uP0VnQ
 uCK5PODLJOVyj+Gekic5v4Ula1sik3HKcM7UMFxY55XvNVsrQ4WCxzGXdWUOyj+vhu
 9nYkiVhSeXh95SFkkNzIzp8hEEvOCZ+T+Zm/JynWLdzrLQi+hYWiCi9EXxZjRKSGZ+
 ieGUFb2sPsv7DVXsDZ2T+00dwfSWDvsgobmCZfGl7508oVjQb3gb9a0s+TzcCPkLXJ
 EfDkUiNZxYUYA==
Message-ID: <b28ca906-efa8-9f6e-8364-b053c1fead2e@collabora.com>
Date: Fri, 18 Feb 2022 13:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 23/23] arm64: dts: mt8192: Add pwm node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-24-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-24-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045637_999367_2B5E7604 
X-CRM114-Status: GOOD (  13.62  )
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
> Add pwm node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index df884c48669e..c0fc723fdf0a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -642,6 +642,16 @@
>   			status = "disabled";
>   		};
>   
> +		pwm0: pwm@1100e000 {
> +			compatible = "mediatek,mt8183-disp-pwm";
> +			reg = <0 0x1100e000 0 0x1000>;
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#pwm-cells = <2>;
> +			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
> +				 <&infracfg CLK_INFRA_DISP_PWM>;
> +			clock-names = "main", "mm";

Depending on the machine, some displays may not be using this PWM node, so:

			status = "disabled";

> +		};
> +
>   		spi1: spi@11010000 {
>   			compatible = "mediatek,mt8192-spi",
>   				     "mediatek,mt6765-spi";
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
