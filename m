Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B4FC77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Q2vg60TchhvD+IUBI+0nBx3nlmFtstny4yDTzDDMKU=; b=AqRbXeVYrRFx8Lp57BmGtufEBS
	QfQ3WK+hULMKTqQdVTvharlC7w5Zi2Q6TnOndBpmh0O/SiwUShe5n1vsqg7FWzXEyTlKdV9jnS6yV
	xVfhm5K+ZnOr2yr9ve5gSjdi0Ciyj741PCkigo1s2KrA7xEr0xZ7XXbfxovzO+5mBQejdYV+QcpNs
	m9nZC1Jsn9Zhe9xy/zimzabTIc3hBq0NXCsNrbX+GpKkQPJtPQIyhtmDJq/B5mKTBxSrq04RZgKzH
	8ab4BnLxRF88+VhTmr3x7zggH6Gk7ibYawOBqYwF2zj5BnshF0qAYPMQCZFGxtppWqCdASt/3K20o
	TJREBh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVgk-000JVb-2w;
	Wed, 29 Mar 2023 13:18:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVgZ-000JOV-0Q;
	Wed, 29 Mar 2023 13:17:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF74D660316F;
	Wed, 29 Mar 2023 14:17:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680095873;
	bh=qTmxjyfcP5I5Xj6wCEgR0k1cS22atKBkP1Lgre2sabQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FaIVp1r52Fx00yV49EnK0WzOWDoXi12jY33WMlwI/oJO0/2cEeqd2vopPu72LiWAC
	 jMkjAOlm68kEYppT0VjI4UnlPSk7HqWlKhHKv/BmZlq7zrEsTlMVaq6xJtxnd8poAo
	 IpI9/u9jQUJrEFUQZEbn4+zQEBLC7RYOhiUBHp216Oj2c6t74RCorpIzJTHojXquSe
	 FaX23FAAajNdpeorVFUOwnEch3x+a/hmFZQkx+Euz7ro6S7kHH5vUK76hIuNwUb+M3
	 xtpHnBzSt8q2e1OMcsI53xdQRd9DzUge0v/suvoiWLvT1ZxeZwQhUxqi8AC0vG1g3f
	 yOHNsJHe8zVFw==
Message-ID: <dd3a26af-819b-6d79-3e08-a351c404060e@collabora.com>
Date: Wed, 29 Mar 2023 15:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 04/17] arm64: dts: mediatek: add watchdog support for
 mt8365 SoC
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
 <20230203-evk-board-support-v3-4-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-4-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_061755_306793_38403C4B 
X-CRM114-Status: GOOD (  14.95  )
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
> Add watchdog support.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 553c7516406a..e018df6844f6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -162,6 +162,13 @@ syscfg_pctl: syscfg-pctl@10005000 {
>   			reg = <0 0x10005000 0 0x1000>;
>   		};
>   
> +		watchdog: watchdog@10007000 {
> +			compatible = "mediatek,mt8365-wdt",
> +				     "mediatek,mt6589-wdt";

This fits in one line, 83 columns is *definitely* fine.
Can you please compress that?

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



