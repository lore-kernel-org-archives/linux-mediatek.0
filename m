Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9AAC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl7FhOkCtAq7fSRYh6YMDAIWBHfXaGVctin+qhonKSA=; b=fYAri1ioQb8ar2QeZ+A37n2Jbz
	Hv7PVydqeg9lbQKasuMUtmVLrFeUnWORi4vkHOJvN9zIHvOL6AOr37fwleDM3CKhrir/oDUlNYBdv
	1N9AUjEe45irorS/urMz3pdsbn9UN9WTa9JehhEQ/E3tAORyL30YTbG8iIt2zMtN3j7Zg6j3a2tif
	WcWCJtJb19YXLiVw+tQ9a0liXhc4Vth+wDSPCFuyDjeoS6mM5fGy4xbIawWYzzDubuH0elSDtJcmO
	f1P0zbUOtBEKB+yJT1KLp7sGflrgJg0TPowUPzZ9V8f0iMEUNMTj66LAzSqwx2JxDX4EQWujHzlWa
	mYQv8W0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ2wA-00FETK-2S;
	Wed, 17 Jan 2024 10:14:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ2w6-00FESR-1o;
	Wed, 17 Jan 2024 10:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705486456;
	bh=syRL93p3m7lOCFY42/TgG/irGtWwZk2a6EBIxB3AtG8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rzaUGLT+FS5la69XrXwkC7+wXBJfGG2Zc+GHh7DoNXgLDFHIWOBbw3+8xKfqHK5uR
	 nE80DdCGwRM73OQERoaRk9LHu17/6Xwu8qXbnYKnjjAoh2w5WiGVxrD001I79BLaBt
	 5Ybnl523C/VQFOnsd7o3YG7AtDy7Uyh73Rq8YqvzHFcQvX2BT/o/v9hw+XhWJm4AXz
	 0+DYra7WjOGDL/QKOT3p8mCaeEOtOXWA9Rxo43jAEQ+GEfUvCyq81GUgRAP/AA4QSO
	 m9C9axzdOmjHD8fzZOmFDGlY15LhocM5KNtHRRTR7o5w9f+3Of262HfKzPeRIXEoDX
	 k/MiMIrqjALDA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E6F737811F1;
	Wed, 17 Jan 2024 10:14:15 +0000 (UTC)
Message-ID: <720dc418-16f7-473c-b33c-f0c9786c02e2@collabora.com>
Date: Wed, 17 Jan 2024 11:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: mt8183: Move CrosEC base detection node to
 kukui-based DTs
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240116-mt8183-kukui-cbas-remove-v3-1-055e21406e86@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240116-mt8183-kukui-cbas-remove-v3-1-055e21406e86@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_021418_764810_1D493AA2 
X-CRM114-Status: GOOD (  22.52  )
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

Il 16/01/24 22:38, Nícolas F. R. A. Prado ha scritto:
> The cbas node is used to describe base detection functionality in the
> ChromeOS EC, which is used for units that have a detachable keyboard and
> thus rely on this functionality to switch between tablet and laptop
> mode.
> 
> Despite the original commit having added the cbas node to the
> mt8183-kukui.dtsi, not all machines that include it are detachables. In
> fact all machines that include from mt8183-kukui-jacuzzi.dtsi are either
> clamshells (ie normal laptops) or convertibles, meaning the keyboard can
> be flipped but not detached. The detection for the keyboard getting
> flipped is handled by the driver bound to the keyboard-controller node
> in the EC.
> 
> Move the base detection node from the base kukui dtsi to the dtsis where
> all machines are detachables, and thus actually make use of the node.
> 
> Fixes: 4fa8492d1e5b ("arm64: dts: mt8183: add cbas node under cros_ec")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v3:
> - Instead of deleting the node in jacuzzi, moved the node from kukui to
>    the dtsis including kukui that are detachables
> 
> Changes in v2:
> - Moved cbas node removal to jacuzzi dtsi
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi  | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        | 4 ----
>   4 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index b6a9830af269..bfb9e42c8aca 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -360,6 +360,10 @@ pen_eject {
>   };
>   
>   &cros_ec {
> +	cbas {
> +		compatible = "google,cros-cbas";
> +	};
> +
>   	keyboard-controller {
>   		compatible = "google,cros-ec-keyb-switches";
>   	};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 306c95166f3f..5c1bf6a1e475 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -339,6 +339,10 @@ touch_pin_reset: pin_reset {
>   };
>   
>   &cros_ec {
> +	cbas {
> +		compatible = "google,cros-cbas";
> +	};
> +
>   	keyboard-controller {
>   		compatible = "google,cros-ec-keyb-switches";
>   	};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index 382e4c6d7191..0f5fa893a774 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -343,6 +343,10 @@ rst_pin {
>   };
>   
>   &cros_ec {
> +	cbas {
> +		compatible = "google,cros-cbas";
> +	};
> +
>   	keyboard-controller {
>   		compatible = "google,cros-ec-keyb-switches";
>   	};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 5506de83f61d..66eb099e15f0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -937,10 +937,6 @@ usbc_extcon: extcon0 {
>   			google,usb-port-id = <0>;
>   		};
>   
> -		cbas {
> -			compatible = "google,cros-cbas";
> -		};
> -
>   		typec {
>   			compatible = "google,cros-ec-typec";
>   			#address-cells = <1>;
> 
> ---
> base-commit: 0f067394dd3b2af3263339cf7183bdb6ee0ac1f8
> change-id: 20240116-mt8183-kukui-cbas-remove-657b62aeced6
> 
> Best regards,


