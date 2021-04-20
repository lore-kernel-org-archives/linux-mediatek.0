Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273A5C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:34:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643C7613CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643C7613CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X7b7EG/RQBwWAcOooo02+pb3sUotDzxH7FcOa3TQFs4=; b=SGGMPka/+0V7bBQS4gz/mCupr
	ux7wA496X7OAq3QZeTmuyhurI9r75WPDVPzmRTsy1NyRMO8nMr+CaBBD4V2DyEcken+JVEnpWlUFw
	vbWqWHiI6g8m7C9mbRVY7zjwyaH5dHx3oy/OdVqPnIwZEVvAVtRlKFXv8DJCusbILX5HFTvh75kTJ
	Xb4E/4RETx6Wo0fWSNZUiumQxKg90lDs/Pkv5CHJShYMLEoJuxanmjsqPtqFhtlP5Jsyhs0Wt6BVl
	LWrKAzz1torkUrCnd05H2gGJwz5lKeQ6x7pmIx1dH0aVQEhENkIVNaFZy2ChTLFKI0yeUixEUaqvM
	EcQIuOW8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYsO2-00CV4l-3f; Tue, 20 Apr 2021 15:34:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsO0-00CV4Y-TX
 for linux-mediatek@desiato.infradead.org; Tue, 20 Apr 2021 15:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=2RUcpYL/40xZk/Fwbeu/5LDtsqSdVxolXOdE5oj/SaE=; b=ACRcd80UPeSmel7kCqotebaBDb
 4fpjD1Aitimu/j95ZzlxMPoGk5EULVAIMcAibDeykq5DqjY6K9Yel8z+K1zzGiCpVv2eYU+TlsYNx
 SuEItR1gN/yv546izmemq1kk6tUoytGojiZ/G5EywPiClm/oMOt84I3wV79SV3QWuAXBxJ+jyqfB2
 78fGQL3HoHPL6SVJ+qo9yAwYnZYBWe4S632JN8UZOr8aPmgBlkCZcZTs64tH4OhS8NrlaBav5lAYh
 6T2hibOZyg9nAWK8xxP+vvIRCmhbhzeFB1ch11250U3iM+Td3rWbTJhw8hSIJ12e1fpPPnMfi/R7v
 tgqHlp0w==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsNv-00CErs-KH
 for linux-mediatek@lists.infradead.org; Tue, 20 Apr 2021 15:33:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id h4so29046748wrt.12
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 08:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2RUcpYL/40xZk/Fwbeu/5LDtsqSdVxolXOdE5oj/SaE=;
 b=jW47qVb6Sff7g5KDuO7kOczbtJ5s5+TLXXsMdeI166bWCOqCuoQj7VR9abtIsYgTIy
 YfKtSbCeXok6vje9cNwY93AibypKuQ4Or8ZoZs59Y+VXChEkWRPrNkAo9p/qGMcGLt1Y
 91oJxfHsMbelUceeOO5BRvIXHirptUPRCIIRRbc79MZfze20JlZW/dVNHd4T92yeMXsw
 IKhPqXVFCVqDcWWiINRVTM45twBj2WUlYeEpLOeg4sT/H+bFiFqHYUzFl2wCzDdldidH
 6fBYuwKtM8c/bgoEZvSXo58vPe47cIzuLiukkqtUQgYBYEd+iZS8wXsZH0pdmNC9WsAy
 O/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2RUcpYL/40xZk/Fwbeu/5LDtsqSdVxolXOdE5oj/SaE=;
 b=OvtSUXp4ImzJawgmI91YRXrsCeq3KUkhsZMZ/UWY8Y6zqGPeGOqMjNinCZySgg4luz
 u/iVEWwFBhFzLnd8BlGdKaXRI8CHbcE0SP8EG9+FTg1+JFQoDrPiXyuddZIOBWKlFo5d
 k7G0IeSKAjckC8vUrda+kUaeROZ4jysPtitcxzxH8xTii7EGpWI3BQPEt2Xvy1jXf2IB
 zoo79wLBulq7qAXKjJlTIdXFjDdkWaxlnzqiLpjFqAfHCoMhyjvVzzLJYCmlz/9md6c1
 Y1TJdTD1Z5qzFyoA8SyAFKATCE3lWPb5d+uBS09JhpRQURzPCycjyg8KkCPCObIYfve3
 coIg==
X-Gm-Message-State: AOAM530KTnLKBQAQMgVHmtqHFYR6kwOjHTmFztv5+kVQL/+1oForKA5i
 UhmY6z70Hj4yycSUuOJxRdM7vw==
X-Google-Smtp-Source: ABdhPJy5l0gIuB65i1nz6DiiogsfamvF/J/BoQblaMJkVSqvHrVhib9McmSo7ecHx7lP56sGnoOphw==
X-Received: by 2002:adf:b1d3:: with SMTP id r19mr22055115wra.97.1618932834092; 
 Tue, 20 Apr 2021 08:33:54 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b4:316d:263e:1360?
 ([2a01:e0a:90c:e290:b4:316d:263e:1360])
 by smtp.gmail.com with ESMTPSA id p18sm26966711wrs.68.2021.04.20.08.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 08:33:53 -0700 (PDT)
Subject: Re: [PATCH v11 2/4] arm64: dts: mt8183: Add node for the Mali GPU
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <1a37f9be-8ec8-893a-e2fc-f0739948f71f@baylibre.com>
Date: Tue, 20 Apr 2021 17:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210126091747.v11.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_083355_711604_B3BBAAE2 
X-CRM114-Status: GOOD (  25.62  )
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

On 26/01/2021 02:17, Nicolas Boichat wrote:
> Add a basic GPU node for mt8183.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> The binding we use with out-of-tree Mali drivers includes more
> clocks, this is used for devfreq: the out-of-tree driver switches
> clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
> switches clk_mux back to clk_main_parent:
> (see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
> clocks =
>         <&topckgen CLK_TOP_MFGPLL_CK>,
>         <&topckgen CLK_TOP_MUX_MFG>,
>         <&clk26m>,
>         <&mfgcfg CLK_MFG_BG3D>;
> clock-names =
>         "clk_main_parent",
>         "clk_mux",
>         "clk_sub_parent",
>         "subsys_mfg_cg";
> (based on discussions, this probably belongs in the clock core)
> 
> This only matters for devfreq, that is disabled anyway as we don't
> have platform-specific code to handle >1 supplies.
> 
> Changes in v11:
>  - mt8183*.dts: remove incorrect supply-names
> 
> Changes in v10: None
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6:
>  - Add gpu regulators to kukui dtsi as well.
>  - Power domains are now attached to spm, not scpsys
>  - Drop R-B.
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2" (keep R-B again).
> 
> Changes in v4:
>  - Add power-domain-names to describe the 3 domains.
>    (kept Alyssa's reviewed-by as the change is minor)
> 
> Changes in v3: None
> Changes in v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
> 
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>  3 files changed, 115 insertions(+)
> 

If you re-spin, you can also add the same changes to mt8183-pumpkin.dts :
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index eb6e595c2975..cc23e5df391e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -68,6 +68,11 @@ &auxadc {
        status = "okay";
 };

+&gpu {
+       mali-supply = <&mt6358_vgpu_reg>;
+       sram-supply = <&mt6358_vsram_gpu_reg>;
+};
+
 &i2c0 {
        pinctrl-names = "default";
        pinctrl-0 = <&i2c_pins_0>;

I did a boot-test of the platform with panfrost and drm-misc-next and it worked fine.

Thanks,
Neil

> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index cba2d8933e79..1cfbea5a0101 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -42,6 +42,11 @@ &auxadc {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&mt6358_vgpu_reg>;
> +	sram-supply = <&mt6358_vsram_gpu_reg>;
> +};
> +
>  &i2c0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c_pins_0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index bf2ad1294dd3..a38315b604df 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -249,6 +249,11 @@ &cpu7 {
>  	proc-supply = <&mt6358_vproc11_reg>;
>  };
>  
> +&gpu {
> +	mali-supply = <&mt6358_vgpu_reg>;
> +	sram-supply = <&mt6358_vsram_gpu_reg>;
> +};
> +
>  &i2c0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c0_pins>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7..5430e05e18a0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -964,6 +964,111 @@ mfgcfg: syscon@13000000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		gpu: gpu@13040000 {
> +			compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
> +			reg = <0 0x13040000 0 0x4000>;
> +			interrupts =
> +				<GIC_SPI 280 IRQ_TYPE_LEVEL_LOW>,
> +				<GIC_SPI 279 IRQ_TYPE_LEVEL_LOW>,
> +				<GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-names = "job", "mmu", "gpu";
> +
> +			clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
> +
> +			power-domains =
> +				<&spm MT8183_POWER_DOMAIN_MFG_CORE0>,
> +				<&spm MT8183_POWER_DOMAIN_MFG_CORE1>,
> +				<&spm MT8183_POWER_DOMAIN_MFG_2D>;
> +			power-domain-names = "core0", "core1", "core2";
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +		};
> +
> +		gpu_opp_table: opp_table0 {
> +			compatible = "operating-points-v2";
> +			opp-shared;
> +
> +			opp-300000000 {
> +				opp-hz = /bits/ 64 <300000000>;
> +				opp-microvolt = <625000>, <850000>;
> +			};
> +
> +			opp-320000000 {
> +				opp-hz = /bits/ 64 <320000000>;
> +				opp-microvolt = <631250>, <850000>;
> +			};
> +
> +			opp-340000000 {
> +				opp-hz = /bits/ 64 <340000000>;
> +				opp-microvolt = <637500>, <850000>;
> +			};
> +
> +			opp-360000000 {
> +				opp-hz = /bits/ 64 <360000000>;
> +				opp-microvolt = <643750>, <850000>;
> +			};
> +
> +			opp-380000000 {
> +				opp-hz = /bits/ 64 <380000000>;
> +				opp-microvolt = <650000>, <850000>;
> +			};
> +
> +			opp-400000000 {
> +				opp-hz = /bits/ 64 <400000000>;
> +				opp-microvolt = <656250>, <850000>;
> +			};
> +
> +			opp-420000000 {
> +				opp-hz = /bits/ 64 <420000000>;
> +				opp-microvolt = <662500>, <850000>;
> +			};
> +
> +			opp-460000000 {
> +				opp-hz = /bits/ 64 <460000000>;
> +				opp-microvolt = <675000>, <850000>;
> +			};
> +
> +			opp-500000000 {
> +				opp-hz = /bits/ 64 <500000000>;
> +				opp-microvolt = <687500>, <850000>;
> +			};
> +
> +			opp-540000000 {
> +				opp-hz = /bits/ 64 <540000000>;
> +				opp-microvolt = <700000>, <850000>;
> +			};
> +
> +			opp-580000000 {
> +				opp-hz = /bits/ 64 <580000000>;
> +				opp-microvolt = <712500>, <850000>;
> +			};
> +
> +			opp-620000000 {
> +				opp-hz = /bits/ 64 <620000000>;
> +				opp-microvolt = <725000>, <850000>;
> +			};
> +
> +			opp-653000000 {
> +				opp-hz = /bits/ 64 <653000000>;
> +				opp-microvolt = <743750>, <850000>;
> +			};
> +
> +			opp-698000000 {
> +				opp-hz = /bits/ 64 <698000000>;
> +				opp-microvolt = <768750>, <868750>;
> +			};
> +
> +			opp-743000000 {
> +				opp-hz = /bits/ 64 <743000000>;
> +				opp-microvolt = <793750>, <893750>;
> +			};
> +
> +			opp-800000000 {
> +				opp-hz = /bits/ 64 <800000000>;
> +				opp-microvolt = <825000>, <925000>;
> +			};
> +		};
> +
>  		mmsys: syscon@14000000 {
>  			compatible = "mediatek,mt8183-mmsys", "syscon";
>  			reg = <0 0x14000000 0 0x1000>;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
