Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C843FA3746
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 11:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9PVZTr1fh4UFLRanBhn9s1OhJ/Bjd4ZmZyv8BDZt9A=; b=jSTlO9yCPLTGwiP2TbKZv5SY9H
	nPt9mXhN6BDwJUSeIe1cMsk1OMspiydg9X2VzR4jW311TrZ8Xb/h+3yra7tvagojf2UltNQh2dTUu
	5MMKlnyd2bZolVuEw7GDR5fXvAhrrj7r0gmI7XJAIEs6sCSxxxcXT6SXchY2w+MkTMOdy7wtDozCt
	Jx5uYP5/28wbsgdG54ckudgdbQSQs8qVgFnf6vaIiPPY866RmHTvQJr3GOawTuRNbpFo0j+9SvetC
	8DBmW2itohl9ZJKNsKNUENKpjOYyju49pXeIp9YrYfRYSthqpisL6q5DAMxcF5fhUnN5VDh8RDQDu
	skZRg9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp4au-0000000FkNj-2wrc;
	Fri, 13 Sep 2024 11:36:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp4Zh-0000000FkEh-2CYR;
	Fri, 13 Sep 2024 11:34:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so19558695e9.1;
        Fri, 13 Sep 2024 04:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726227292; x=1726832092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X9PVZTr1fh4UFLRanBhn9s1OhJ/Bjd4ZmZyv8BDZt9A=;
        b=KvpsTUmP/kA5Lnjj35nlDvohzD31EMMWsuX+v9D8gia8zAO3TBvRJtew+rdUPkU6Yp
         X49O5J/06F4mzRUHF2emjDv38a6+0w+Z3+VSeTwsIWzNmiVc1ZxL2YrL8TYo6dvW3sYz
         PSyijqKM94CHCvEd0/VM++zZ9xIXw9bynLicZk+LDa82L9o5eaWqjCUN1c/BsLPTEsOx
         3njyjqIGDkvleLQmXx+KVKXkcsr5UNiwOhC+gfg6zgSOexrFYM5Vip0Jb92CoS/KFXZn
         Oc554eWzZyNIVIYgTmOIUefEdXdN5KYuUu/YyO2KN3y8MTgX+aassB3NoFUP7AZ/ISB3
         3bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726227292; x=1726832092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9PVZTr1fh4UFLRanBhn9s1OhJ/Bjd4ZmZyv8BDZt9A=;
        b=GiBPWQNMpPDE8UBaGxV3MZw5H5rJk+HWkGX65IvVALNpa66ZFadjpPaveP4TYnIlzu
         5K1ky8yOQV09t4cII4W+D07UNDqJeeaAcxkwlFlTYQYRZLgaCOky3AYg+Vlx9/Tc2Xk1
         VfQyup+wgD0Psjgqh7WbgIGXSh7IsnfEgVA8QFIMQ61hV+g+JI/Rm24hbsr8L59ygamb
         u7xG0lN7cWsndt0OUKtSdJSVplfLLzWyg5PcLL8PhpitG131WxunbGXQu62z0EeF6M8y
         eoBNezPRbBb0f4UYc4KgK0twZxpM9lKf//5k68IoXKcTfsP6Q0yYvrb0MBYJ1pHSTHDC
         WMsw==
X-Forwarded-Encrypted: i=1; AJvYcCV0II2pSwjvzIN8Mm5d2YRm/rlF2dBWun/TjTadnijLMaFWy2IBdXzl0iF0k8I7eFuotsvcMiC3c+VMxIjWApo=@lists.infradead.org, AJvYcCVLohiwCDyNCpmmA9x3G06cJUTlnvIt+n2pndPk4Quf3K3dMaGK36ayo+wl5JCIpOeaEcCgEXILZaBK7oJIb3WR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz+rvvwktxUkv3YAWlVRQLhhai4dfzacefgW3gjfFuPMV6webw
	7SoQXovRM7hR9h7rXNT9wDVSHkIi4eKvDynUG273Pism8iylrVwFf+sgyQXY
X-Google-Smtp-Source: AGHT+IEl7GKlmReq3OGYMyX5zDP86AfYN6alFNLZd/Xy9rw9+fboK/8UqpKzwm5ckrE89LwvpwuS1A==
X-Received: by 2002:a05:600c:3505:b0:42c:a8d5:2df5 with SMTP id 5b1f17b1804b1-42cdb586ee0mr48328435e9.24.1726227291420;
        Fri, 13 Sep 2024 04:34:51 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b05a700sm22547905e9.10.2024.09.13.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 04:34:50 -0700 (PDT)
Message-ID: <edf25359-1804-445d-bd49-45c7238a3cd5@gmail.com>
Date: Fri, 13 Sep 2024 13:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable
 GPU
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240912070624.25540-1-pablo.sun@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240912070624.25540-1-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_043453_601347_4C5DA0CA 
X-CRM114-Status: GOOD (  19.25  )
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



On 12/09/2024 09:06, Pablo Sun wrote:
> Enable the Mali Valhall GPU on Genio 1200 EVK by providing regulator
> supply settingsi to gpu and mfg1, and enable the GPU node.
> 
> In addition, set the GPU related regulator voltage range:
> 
> 1. Set the recommended input voltage range of DVDD_GPU to (0.546V-0.787V),
>     based on Table 5-3 of MT8395 Application Processor Datasheet.
>     The regulator mt6315_7_vbuck1("Vgpu") connects to the DVDD_GPU input.
>     Note that the minimum voltage in SoC eFuse data, which is read by
>     MTK-SVS to adjust the regulator voltage, does not go below
>     the recommended operating voltage in the datasheet.
> 
> 2. Set the input voltage of DVDD_SRAM_GPU, supplied by
>     mt6359_vsram_others_ldo_reg, to 0.75V, the recommended typical
>     operating voltage in MT8395 Application Processor Datasheet.
> 
> This patch is tested by enabling CONFIG_DRM_PANFROST and
> on Genio 1200 EVK it probed with following dmesg:
> 
> ```
> panfrost 13000000.gpu: clock rate = 700000092
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x1 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7,
> 					   issues: 00000001,80000400
> panfrost 13000000.gpu: Features: L2:0x07120206 Shader:0x00000000
> 					   Tiler:0x00000809 Mem:0x301
> 					   MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x50045 l2_present=0x1
> [drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0
> ```
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../dts/mediatek/mt8395-genio-1200-evk.dts    | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> index a06610fff8ad..4f7d66d6d785 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> @@ -194,6 +194,11 @@ eth_phy0: eth-phy0@1 {
>   	};
>   };
>   
> +&gpu {
> +	mali-supply = <&mt6315_7_vbuck1>;
> +	status = "okay";
> +};
> +
>   &i2c0 {
>   	clock-frequency = <400000>;
>   	pinctrl-0 = <&i2c0_pins>;
> @@ -337,6 +342,10 @@ &mfg0 {
>   	domain-supply = <&mt6315_7_vbuck1>;
>   };
>   
> +&mfg1 {
> +	domain-supply = <&mt6359_vsram_others_ldo_reg>;
> +};
> +
>   &mmc0 {
>   	status = "okay";
>   	pinctrl-names = "default", "state_uhs";
> @@ -407,6 +416,12 @@ &mt6359_vrf12_ldo_reg {
>   	regulator-always-on;
>   };
>   
> +/* for GPU SRAM */
> +&mt6359_vsram_others_ldo_reg {
> +	regulator-min-microvolt = <750000>;
> +	regulator-max-microvolt = <750000>;
> +};
> +
>   &mt6359codec {
>   	mediatek,mic-type-0 = <1>; /* ACC */
>   	mediatek,mic-type-1 = <3>; /* DCC */
> @@ -839,8 +854,8 @@ regulators {
>   			mt6315_7_vbuck1: vbuck1 {
>   				regulator-compatible = "vbuck1";
>   				regulator-name = "Vgpu";
> -				regulator-min-microvolt = <300000>;
> -				regulator-max-microvolt = <1193750>;
> +				regulator-min-microvolt = <546000>;
> +				regulator-max-microvolt = <787000>;
>   				regulator-enable-ramp-delay = <256>;
>   				regulator-allowed-modes = <0 1 2>;
>   			};

