Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE6FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzKAQT6vbiepszrD0+VM2G1/oJOVdJ1k4cSZtQrnzhw=; b=3MFAilEulZUvWcHie8GsL7LfL4
	2l4UX1FpeLIYpU3cX2XMUkZ+2ztKfH0RDvZ8UQ6u+5f65XpK1U9Kv4Q1vKiG+Jzx4P3aG0gYZc1Cv
	01Fd/XtC+7XxkpEe4WRnA23Uz07iqlbWZRujeHzCJP12ivOu55nIdXCzsPh4pByX4e1hEwPwGIz0s
	CJYN6NWme+Syh3+96sCsRi0HE30QLZSpCN2PziwirnZz2ceBdprlEDkumb1Xc/KaVyjCjz9xkFh8z
	GA+IY5Cmdl3cRHUX/WmK5Ae6M4XIhekD9AMDb6Zxd/AuqNeh1sq5NCHqLBZMpcmE0LmEqNXfVac6r
	JtcRAB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68bu-00EMf9-Kd; Fri, 16 Dec 2022 11:10:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68bd-00EMYi-Ku; Fri, 16 Dec 2022 11:10:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so3866983wmb.2;
        Fri, 16 Dec 2022 03:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzKAQT6vbiepszrD0+VM2G1/oJOVdJ1k4cSZtQrnzhw=;
        b=qahHQ2hQalVG872kBe//5V/5jaRnbx1APMf+vUt061g35sTwdMPn3BycY6jv3Mmw9v
         OoAButwJzIftdTe9KRxADOVdCx+G5hwxB7VN97DRsuatS7MZu0x567dCjJBdyKH8FaeT
         hcAZ1lzjaZjaTz+yTk5HYPNofw/XAXuAE38uhYBXWKE0mB6tUw0eJdhrrFGx3zydzcWn
         hrum2AUR7t1Uf18qYdkgeOvwaXPx88jvoDjXgllierTHz8yx/CYP35Zc2VNmimZUwE+/
         Q5GyYC4Xk22dOdMY9LuOnx7WFJHtQ+jYxZoRbrUoNELGQPMTXxPWQSaWpEgphxIiFqXV
         TYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzKAQT6vbiepszrD0+VM2G1/oJOVdJ1k4cSZtQrnzhw=;
        b=p6LVnCKTlTIGizZa2d6pjVRHe1oLsajG98Rwj+JjZez/8hgkbXldprobrT7CDuQHfQ
         YdnHGVX6YMq0oZciPpBEaY0r8/mPVOQ23JxDdVuRqDnfKNAehYeF0mM7e4ibjbNM6ct0
         0bI+Rcpv7XTxmF9EqvKjBdYHqAD83T3WhuZb76UrnUrazL3zStyW1h0mQYIECwz8P6Gv
         54RtQhwKQlqvAp8nN1ivuzSx9Jsu1C2jLepYO/3WBDdwgxqZL+gjpZlBpXh2STYJkv5T
         FglVx73G3kqOCYCIMM7WCbXobKPid65O9GDrf2wXOeJc8Kb3Ox2U41VOEU7Bc0PyhtXi
         ak5w==
X-Gm-Message-State: ANoB5pmc8NO5CUaXCoJPZReE3upSrtgJ7xWhvPeGOijp4RBA7rQ6nhxZ
	zeHE4+BC5iTgUK19gavUvEc=
X-Google-Smtp-Source: AA0mqf6IEVWiFLjp3/9w60Cwc4bWOIs5zm16vVKKgTK3FaHKykwos7vm3VPEVfd3JcJxgK0bqXR+gw==
X-Received: by 2002:a05:600c:6549:b0:3cf:497c:c59e with SMTP id dn9-20020a05600c654900b003cf497cc59emr24959984wmb.6.1671189017920;
        Fri, 16 Dec 2022 03:10:17 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bi7-20020a05600c3d8700b003d1e051f671sm2199552wmb.9.2022.12.16.03.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:10:16 -0800 (PST)
Message-ID: <d2585fef-98b1-39ae-876d-523e385aebe9@gmail.com>
Date: Fri, 16 Dec 2022 12:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: Split out keyboard node and
 describe detachables
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220527045353.2483042-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220527045353.2483042-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_031021_757951_7CBEA72A 
X-CRM114-Status: GOOD (  17.50  )
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



On 27/05/2022 06:53, Hsin-Yi Wang wrote:
> Kukui devices krane, kodana, and kakadu use detachable keyboards, which
> only have switches to be registered.
> 
> Change the keyboard node's compatible of those boards to the newly
> introduced "google,cros-ec-keyb-switches", which won't include matrix
> properties.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 ++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi  | 6 ++++++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi  | 6 ++++++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi   | 6 ++++++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi         | 1 -
>   5 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 2d7a193272ae..981c889a22ea 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -4,6 +4,8 @@
>    */
>   
>   #include "mt8183-kukui.dtsi"
> +/* Must come after mt8183-kukui.dtsi to modify cros_ec */
> +#include <arm/cros-ec-keyboard.dtsi>
>   
>   / {
>   	panel: panel {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 28966a65391b..4b419623c8dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -372,6 +372,12 @@ pen_eject {
>   	};
>   };
>   
> +&cros_ec {
> +	keyboard-controller {
> +		compatible = "google,cros-ec-keyb-switches";
> +	};
> +};
> +
>   &qca_wifi {
>   	qcom,ath10k-calibration-variant = "GO_KAKADU";
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 06f8c80bf553..4864c39e53a4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -339,6 +339,12 @@ touch_pin_reset: pin_reset {
>   	};
>   };
>   
> +&cros_ec {
> +	keyboard-controller {
> +		compatible = "google,cros-ec-keyb-switches";
> +	};
> +};
> +
>   &qca_wifi {
>   	qcom,ath10k-calibration-variant = "GO_KODAMA";
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index a7b0cb3ff7b0..d5f41c6c9881 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -343,6 +343,12 @@ rst_pin {
>   	};
>   };
>   
> +&cros_ec {
> +	keyboard-controller {
> +		compatible = "google,cros-ec-keyb-switches";
> +	};
> +};
> +
>   &qca_wifi {
>   	qcom,ath10k-calibration-variant = "LE_Krane";
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8d5bf73a9099..db1388550f98 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -986,5 +986,4 @@ hub@1 {
>   	};
>   };
>   
> -#include <arm/cros-ec-keyboard.dtsi>
>   #include <arm/cros-ec-sbs.dtsi>

