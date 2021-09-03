Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6A6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 10:40:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804E560238
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 10:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 804E560238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tE1XlOq51Y3fSLj5ff9uTDFUN9E2CtLxtRUYJ5uHxqw=; b=lkLulytpQst/l7b7mDkAGZfeA0
	2Ml+55mspAI9Q2CGg+8iveFJ4m4l/agzKSZoT2GBNs97hCc9z+vBTTrMARzalEB8HzNNY5I27VEH/
	drU+0KWlIOEQe8LjLMPYbU7FgfHbaA3M20Tmd4Q1SxOOa5xAnlEdLMhyOhOERKG1L2zpACjhVv2f3
	YG783N+CUnW9FUbWpdUSiVGSCRQoeAGdd/7vfYdMq8HWlC7LevWv/TcvUKsiivcnQjK38kJcmD4n/
	W+9n/lJz6rLhuNS3LBrHxF98zUOvOAIj0GYquDhJ3mURSjnRV38mbzv3w2q5uKennqa8E9l/CKu0x
	o01wANHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM6co-00BgRW-PZ; Fri, 03 Sep 2021 10:40:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM6cl-00BgQM-H5; Fri, 03 Sep 2021 10:40:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id u9so7551043wrg.8;
 Fri, 03 Sep 2021 03:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nRpUBKoD2Qc6noVZ4Y4NpGJIU0gjshS75iBQB9zMpy8=;
 b=V9DGIMtPYt9W0EUZOwpvvbsDaz13dnCLH2rE+WwNlpWVsU4sQaUwc7zHHuyhls5T6v
 6wtZXoLsekCvm79RfEd2jn8BPGRbrWWs5n09EluRcbcq2jGlj0jVZQ9fdf3y7KXCTFpE
 RT43XKqCmoCabMJ0CIBUb45ogsZ5oyOCsxsz9UpxNuwKKPOhWfsQ/o+pkZlQw6GFguv7
 7PHQssHoviWtVkcp3/MaVlYWk9nnXW33At7rQ+5B7hFWm3RBcPoBWbHc/kY59AH7NTOs
 7FcJSWPPy3ikCrOMrFQqIY/8tURuT9sT/8fWXz05yDY1Tkg0Kj3ASwFWhWMEg17rW/hS
 JVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nRpUBKoD2Qc6noVZ4Y4NpGJIU0gjshS75iBQB9zMpy8=;
 b=XwIfVN+rPiDmOxXjXPIev80LD5umyUd95UilG9bL+vtL3EO9cX3KM8MjJyrx5cVqhE
 DmB4xfO9ScqE4J6eHtyY2A904p4uw8OA4fU1YsGBM8KMQbGm4o+x8kqSiMBkPIZ4t6Ld
 xHqMlZr2fk5Ope8m1R+IR3uASGZJeAI+kH36XbpnN/JSWKfSZqj+DcgK6uyLAXm29y6f
 zdB86BpquXZUxwmcTEvUJeojuzJuz2Qw1bt2qmnsw/nAqifvc5nA0RNBk2QYryur280c
 LPeGe2rTNJxOtO/IlJLYXCdRKnK96J++m9b9gzZhhbtc0sFLF3RQHCyxoeBtT4wTsi3u
 4Zjw==
X-Gm-Message-State: AOAM530fLBUl/wGIpeRmtgsimQOpqXVLkJF+QjEUP29MgJxlvMUWAfKq
 oaX+TtFfIJ9J0XCmfFmNS08=
X-Google-Smtp-Source: ABdhPJygMcEsTKYxWfkujXhXEo9X8ysv08YMDZ9nnstdTDNHuMVulrfsqK2tQgqJBloNocuiTbaPPQ==
X-Received: by 2002:adf:eb8d:: with SMTP id t13mr3323097wrn.4.1630665641998;
 Fri, 03 Sep 2021 03:40:41 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.66])
 by smtp.gmail.com with ESMTPSA id z9sm4413006wre.11.2021.09.03.03.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 03:40:41 -0700 (PDT)
To: Michael Kao <michael.kao@mediatek.com>, fan.chen@mediatek.com,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Tzung-Bi Shih <tzungbi@google.com>
References: <20201223074944.2061-1-michael.kao@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8192: add thermal zones, cooling map and
 trips
Message-ID: <55bdd2fb-1379-4e98-0a78-a18bfb7d0fb8@gmail.com>
Date: Fri, 3 Sep 2021 12:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20201223074944.2061-1-michael.kao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_034043_620282_43C0469E 
X-CRM114-Status: GOOD (  27.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/12/2020 08:49, Michael Kao wrote:
> Add thermal zone node to support mt8192 read temperature.
> Thermal throttle will start at 68C and the
> target temperature is 85C.
> 
> This patch depends on [1].

Please provide this kind of information below the three dashes '---'. Otherwise
this will end up in the commit message.

> 
> [1]https://patchwork.kernel.org/project/linux-mediatek/patch/20201221061018.18503-3-Yz.Wu@mediatek.com/
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 169 +++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 4a0d941aec30..4020e40a092a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	compatible = "mediatek,mt8192";
> @@ -42,6 +43,7 @@
>  			clock-frequency = <1701000000>;
>  			next-level-cache = <&l2_0>;
>  			capacity-dmips-mhz = <530>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu1: cpu@100 {
> @@ -52,6 +54,7 @@
>  			clock-frequency = <1701000000>;
>  			next-level-cache = <&l2_0>;
>  			capacity-dmips-mhz = <530>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu2: cpu@200 {
> @@ -62,6 +65,7 @@
>  			clock-frequency = <1701000000>;
>  			next-level-cache = <&l2_0>;
>  			capacity-dmips-mhz = <530>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu3: cpu@300 {
> @@ -72,6 +76,7 @@
>  			clock-frequency = <1701000000>;
>  			next-level-cache = <&l2_0>;
>  			capacity-dmips-mhz = <530>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu4: cpu@400 {
> @@ -82,6 +87,7 @@
>  			clock-frequency = <2171000000>;
>  			next-level-cache = <&l2_1>;
>  			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu5: cpu@500 {
> @@ -92,6 +98,7 @@
>  			clock-frequency = <2171000000>;
>  			next-level-cache = <&l2_1>;
>  			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu6: cpu@600 {
> @@ -102,6 +109,7 @@
>  			clock-frequency = <2171000000>;
>  			next-level-cache = <&l2_1>;
>  			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu7: cpu@700 {
> @@ -112,6 +120,7 @@
>  			clock-frequency = <2171000000>;
>  			next-level-cache = <&l2_1>;
>  			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu-map {
> @@ -178,6 +187,140 @@
>  		method = "smc";
>  	};
>  
> +	thermal-zones {
> +		soc_max {
> +			polling-delay = <1000>; /* milliseconds */
> +			polling-delay-passive = <1000>; /* milliseconds */
> +			thermal-sensors = <&lvts 0>;
> +			sustainable-power = <1500>;
> +
> +			trips {
> +				threshold: trip-point@0 {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				target: target@1 {

Please review the node names.

> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				soc_max_crit: soc_max_crit@0 {
> +					temperature = <115000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&target>;
> +					cooling-device = <&cpu0
> +						THERMAL_NO_LIMIT
> +						THERMAL_NO_LIMIT>,
> +							 <&cpu1
> +						THERMAL_NO_LIMIT
> +						THERMAL_NO_LIMIT>,
> +							 <&cpu2
> +						THERMAL_NO_LIMIT
> +						THERMAL_NO_LIMIT>,
> +							 <&cpu3
> +						THERMAL_NO_LIMIT
> +						THERMAL_NO_LIMIT>;
> +					contribution = <3072>;

By binding description value is in per-cent, 3072 does not make sense.

> +				};
> +				map1 {
> +					trip = <&target>;
> +					cooling-device = <&cpu4
> +						THERMAL_NO_LIMIT
> +						THERMAL_NO_LIMIT>,
> +							 <&cpu5
> +						THERMAL_NO_LIMIT
> +						THERMAL_NO_LIMIT>,
> +							 <&cpu6
> +						THERMAL_NO_LIMIT
> +						THERMAL_NO_LIMIT>,
> +							 <&cpu7
> +						THERMAL_NO_LIMIT
> +						THERMAL_NO_LIMIT>;
> +					contribution = <1024>;

Same here.

> +				};
> +			};
> +		};

New line here.

> +		cpu_big1 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 1>;
> +		};
> +		cpu_big2 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 2>;
> +		};
> +		cpu_big3 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 3>;
> +		};
> +		cpu_big4 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 4>;
> +		};
> +		cci1 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 5>;
> +		};
> +		cci2 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 6>;
> +		};
> +		cpu_little1 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 7>;
> +		};
> +		cpu_little2 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 8>;
> +		};
> +		apu {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 9>;
> +		};
> +		mlda {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 10>;
> +		};
> +		gpu1 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 11>;
> +		};
> +		gpu2 {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 12>;
> +		};
> +		infra {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 13>;
> +		};
> +		camsys {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */
> +			thermal-sensors = <&lvts 14>;
> +		};

I think I'm missing something. We are creating a whole bunch of thermal zones,
but no trip points neither cooling maps for them. What are the needed for?

> +	};
> +
>  	timer: timer {
>  		compatible = "arm,armv8-timer";
>  		interrupt-parent = <&gic>;
> @@ -224,6 +367,10 @@
>  			compatible = "mediatek,mt8192-infracfg", "syscon";
>  			reg = <0 0x10001000 0 0x1000>;
>  			#clock-cells = <1>;
> +			ti,reset-bits = <
> +				0x120 0 0x124 0 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
> +				0x730 12 0x734 12 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
> +			>;

How is that related to the commit message? Looks to me like a separate patch.

>  		};
>  
>  		pericfg: syscon@10003000 {
> @@ -318,6 +465,24 @@
>  			status = "disabled";
>  		};
>  
> +		lvts: lvts@1100b000 {
> +			compatible = "mediatek,mt6873-lvts";

This driver is not upstream. Please provide a link to the submission of the
latest version so that I can track progress.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
