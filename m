Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC50C25B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHmmE+ZVT6Wpbk0/k2WTlXBXfRIKUb5qPHbfiGbi69g=; b=WRkrjEUkEVhyhS9CuFHNibYs9C
	hLButwpSmv5mTcj0gnwmdvuhbpEgwM3fcDaRZgIC51bG7vcThqD6a4uCAe6+EWnvTIfsMBqzG0pmc
	+zqY1u52jvqYCWvbYx2VrCxfGtn/C9TwyQn+zo7dXAc/+baHrs5SBPYDJqiMurmW8EVCNHV2zrW5D
	gGHsBUeMQ1nJa4+UkgtiW3kg4CZEVIotVXoxjOfn+yOqbUYxQRDbp59Px1PTbN4e8mBDKc3nKrgky
	dt+hm0h1mWixCzFSwtGkGbSmnWSYu5mv0bMq7bPmDzSqTcUvfHTFKXQIU2CBJte7S9RrGUblLrE5P
	OEQM5Z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QKs-000000008ud-46gE;
	Tue, 21 May 2024 14:19:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QKo-000000008tI-2hUH;
	Tue, 21 May 2024 14:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716301161;
	bh=azKC0Vfzh32+CSfRP2wDq5OaQ3ELUVlycMEY4NkDgU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eZc1qmfAiQAaUmlDqAvO0MSkWkwr2IA9QonlE5eg8HeZqqeA3GfTJq7mUjPkKNtsS
	 +QpkrquKWAYUXmDvsGAqBjOtYqz/Flpuzf8XhIZM5fCcxUcZqrJZcdvfFNkNyPShQ8
	 VEymr8zDhfZE4lI7ufMIzoOqphgAJYU/p9JjP6PBxzHDNPpEpPsTNaHy7YhZE3ZXjr
	 EgUbppA0xwqCxflZhyjhiAAJssRDVbI1mEyJJSx9PY3OByttbJUL8OiyNhNOb3TKLe
	 2SZlpmoSEMq6VU4LYo/UvJzOEilVMMRQi9fjwq68seTj7c1uG7DTKfAEWWZo2/4ZHs
	 69PvrMfxnbYdw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B65F3782137;
	Tue, 21 May 2024 14:19:20 +0000 (UTC)
Message-ID: <ff12e104-da8b-4800-bfbe-a006ffe1b840@collabora.com>
Date: Tue, 21 May 2024 16:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: mediatek: mt8188: add default thermal
 zones
To: Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com>
 <20240521-mtk-thermal-mt818x-dtsi-v4-4-b91ee678411c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240521-mtk-thermal-mt818x-dtsi-v4-4-b91ee678411c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_071922_845637_B7B892E0 
X-CRM114-Status: GOOD (  15.65  )
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

Il 21/05/24 16:05, Julien Panis ha scritto:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Inspired by the vendor kernel but adapted to the upstream thermal
> driver version.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 432 +++++++++++++++++++++++++++++++
>   1 file changed, 432 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index a9f1b9db54a6..2b0f3e03acc1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -12,6 +12,8 @@
>   #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
>   #include <dt-bindings/power/mediatek,mt8188-power.h>
>   #include <dt-bindings/reset/mt8188-resets.h>
> +#include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
>   
>   / {
>   	compatible = "mediatek,mt8188";

..snip..

> +
> +		gpu1-thermal {

You forgot to implement my feedback to Nicolas - this must be gpu-thermal

> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8188_AP_GPU1>;
> +
> +			trips {
> +				gpu1_alert0: trip-alert0 {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				gpu1_alert1: trip-alert1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				gpu1_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gpu2-thermal {

...and for consistency with the other SoCs, this must be gpu1-thermal.

> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8188_AP_GPU2>;
> +
> +			trips {
> +				gpu2_alert0: trip-alert0 {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				gpu2_alert1: trip-alert1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				gpu2_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		soc1-thermal {

Any idea of what can "soc1" ever be? What measurement point is that?

VPU? IMG? INFRA?

soc1, soc2, soc3 make little sense.

Regards,
Angelo



