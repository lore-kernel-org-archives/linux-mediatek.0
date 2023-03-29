Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F79EC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6G7VBBWKadLkq55HzcTSBY1nQ7HyrXaGqPCCsphDrA=; b=rcFKFgE0ZJQpcxmDL056NRP8HZ
	WbE+zFIm+Mm3LJlM0BSNoXn+mVI6Y9E/tNqtohWR0TYtEDgyhBd7AP10aCCZ22gw8IrEEBh7R3N1d
	5kLzE37raZOM+IHkX3Mce2kJAkyIN6gfIGkbtVxfAGvXWSIBSrNCNTjfgdat5oaawyhDfCqbLGE4J
	OPPlpheX23svzRTjpoS9k/OV7tlsPGx/WTA7Hgyp1v6uSwcTFapDVburrKBz39VCCR68gYxRWPBT1
	TvDsryYpfUWNwKjSKLxdEI/IFH9YFsWlRQ9Wa4UhYlBj7V9isz5ZxEooEZJrOhIaTmNPMyn93usAX
	BFP62s6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVj4-000LHE-1f;
	Wed, 29 Mar 2023 13:20:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVio-000L5L-2g;
	Wed, 29 Mar 2023 13:20:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F132660316F;
	Wed, 29 Mar 2023 14:20:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096013;
	bh=+Gb3T+OEiFKZw1D3ileVDi0PJW+B0xgdY2yBBexB2kQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EQg2hrbHd2UgsF/MuOS04eS04qrxSgCIoOjtW8jKFlx6/tXsYGNgqrroAbdITFtv5
	 qwnUi5sMeEeiQJ4K41mPAMBFa5BPAJ39958ujfG5/R/YyF3XpH6OlB1rUuM2JKXJDf
	 vgX3uCLdhBCwEGWlBfAIcelGLe+aLRcW8kfk30iu6efnqmSLbPm1vBqHCxahExt4Lw
	 jKDi9xDAb7WBo0LeXc9ZsiAZAtNAptf/kblThg2ZhQ8NhVrbphFU+rJs9O9SvZIOIA
	 HLNGS/jb/AaIfWwWHJjE/GXmgOqTwsCKXTG3G/x6UlVwqJFxlRS9IO3Z7L0DTnC+eZ
	 oGGEzMKOIKdFA==
Message-ID: <f963453f-ef7e-1bec-66ae-4bb0354914c8@collabora.com>
Date: Wed, 29 Mar 2023 15:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 07/17] arm64: dts: mediatek: add mt6357 PMIC support
 for mt8365-evk
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-7-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-7-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062015_010860_BC817512 
X-CRM114-Status: GOOD (  15.40  )
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

Il 29/03/23 10:54, Alexandre Mergnat ha scritto:
> This power management system chip integration helps to manage regulators
> and keys.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index fc7f6d8ae173..2f88562c638a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
>   #include "mt8365.dtsi"
> +#include "mt6357.dtsi"
>   
>   / {
>   	model = "MediaTek MT8365 Open Platform EVK";
> @@ -96,6 +97,13 @@ &i2c0 {
>   	#size-cells = <0>;
>   };
>   
> +&mt6357_pmic {
> +	interrupt-parent = <&pio>;
> +	interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;

Please... use:
	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;

Cheers,
Angelo



