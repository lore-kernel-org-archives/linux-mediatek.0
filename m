Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C725C04FFE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 May 2024 09:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkB2CmWVoQi8nHsh1zrtwZs7auH/ln4/oBpNWO83qYA=; b=FW2N+K12xbC6bS19u4FfiwOA37
	qDAaBR4Mn7kea13Ku8LUFq9ByzdJWLuYxay6NXu/4GYy47X06PuTGKkCUdDny5t9+KW5XY8RtpVn2
	MVUpnTAz43RuCWsNJE8dGqNMHB5XtI/HxVGDzZ6F/Qzki9N7os5yfnEFbGbhZkPT6SCKT4UkmrYtd
	tDhaly2uxulPZs+An7CrjlzFnrJUA6Lxw5zTahx52YCyaAL7eKZbi0O1Ue9kiNIrUI5iIGixixgsf
	fodbS9UXFphNAqtZ9v5inTvixWeA1NRRU+oA6vrtDxAhUrvF+yC4h6BzQmHGRbwL4gZjcT8xxPLYt
	8UlRV+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6okB-0000000FUzX-1wjc;
	Tue, 14 May 2024 09:46:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ok7-0000000FUxT-0TOy
	for linux-mediatek@lists.infradead.org;
	Tue, 14 May 2024 09:46:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41fd5dc03easo33266045e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 May 2024 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715680000; x=1716284800; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkB2CmWVoQi8nHsh1zrtwZs7auH/ln4/oBpNWO83qYA=;
        b=qUbS3zDHmDwJroGFAkJ+0Nnx1HlMq8XJbnUYn8d2jIrXYkQrYXGSN0QJg3TjFpOmFa
         DOMLARLO+oA5V+GWGc9KgiBxO+JgX0pXJmB/0d+N7tK1p9Y53Y/unchR1r18zqxBoWvZ
         NoQTbVU5qjGp2CZzujJzpvTobWil0nDPogpjUqH+G2UtIwfr43FWFPomMSNekN0UoX3o
         gD9K0f2EglyxREM41I6nfflY3Ht1wZAVlU1cHaAAZeJFF26i+5QH0LVIrunFqlNHfe6R
         jmzNTd8wkrpRgCWbzW9aVN83dciAAomyC6GSWYPj/0ThEgxjnrZbCo9eFIEtnj0Njogo
         orkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715680000; x=1716284800;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkB2CmWVoQi8nHsh1zrtwZs7auH/ln4/oBpNWO83qYA=;
        b=QytslTWDDXXz43qly6wzttnIZYEr5h8DK0BrzpHj3j79E2UE1d07eOD4DpV5uGpymh
         n7HQ1ByxDYCMvEP2V29kaLfzFnYh3NcAtDaCdqW8b0A2FBnCxGAKIBl7ZyTUsN1RUTkN
         039RJQiPnD8X+yDK+Ow85+FowslScTsjC13aEoEq0dcmLGQGNaxuX23J1opujEIJkXTd
         xRbriNuV2s33X7rrkLTJ5RwDNGC19iTMPZcUT4ay22rbQu9+Ft2WyriVOwZwQQOCFFhz
         CqBPiuoXTGDRjDN+y9sXrvKTEixvtS64Dfjw0qeweYw117GZzAuExBM8YZsw8Suf5kvM
         tB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCQitqyYhVacuTbyW6kf9XibPtMDisWZdsCxZwha1WUu63xv0NQfT+d24/mKAG7qiBKYsMihGPHFTLqhzNChgINNXLJte9vG5QBcsemCdwK/Te
X-Gm-Message-State: AOJu0Yzr/FrTbN9Hac9wskLMfKTe8tGVTZ2SyqFbmGx9MdjKkiRpFUKl
	pN1FvTiXGZjRZG3/txf+5Q6B+0VKO+rr5SzbTPY6XNL/fi7Bsd644wOONOc8hSs=
X-Google-Smtp-Source: AGHT+IHI9NnnEnfZQk9MA7NTlxQwC32L9S31bdQwSyla8T9wKGzvt0e3SXI39TydgYKcKtH5LYQ8qw==
X-Received: by 2002:a05:600c:4f4e:b0:41b:f577:604 with SMTP id 5b1f17b1804b1-41feac5a675mr86518995e9.30.1715679999836;
        Tue, 14 May 2024 02:46:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4200e518984sm120917605e9.23.2024.05.14.02.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 02:46:39 -0700 (PDT)
Message-ID: <1815c5b4-ab7a-410c-b5ea-26ef83813d3c@baylibre.com>
Date: Tue, 14 May 2024 11:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
From: Alexandre Mergnat <amergnat@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
 <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
 <a77357c7-0442-4478-b375-436eb6b114be@baylibre.com>
Content-Language: en-US
In-Reply-To: <a77357c7-0442-4478-b375-436eb6b114be@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_024643_253185_46345EA3 
X-CRM114-Status: GOOD (  28.61  )
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

Hi Angelo,

Gentle ping because I'm stuck if I rebase my serie on top of yours.

On 02/05/2024 18:53, Alexandre Mergnat wrote:
> 
> 
> On 30/04/2024 13:33, AngeloGioacchino Del Regno wrote:
>> Il 30/04/24 12:17, Alexandre Mergnat ha scritto:
>>> Hi Angelo,
>>>
>>> On 09/04/2024 14:02, AngeloGioacchino Del Regno wrote:
>>>> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
>>>> NIO-12L with both hardcoded paths, OF graph support and partially
>>>> hardcoded paths (meaning main display through OF graph and external
>>>> display hardcoded, because of OVL_ADAPTOR).
>>>
>>> Is that make sense for you to add the DTS changes of these boards into this serie ?
>>> I asked because, IMHO, that could help to understand the serie.
>>>
>>
>> Yes and no... but I imagine that you're asking this because you're trying to
>> prepare something with a different SoC+board(s) combination :-)
>>
>> In that case, I'm preventively sorry because what follows here is not 100%
>> perfectly tidy yet as I didn't mean to send the devicetree commits upstream
>> before this series got picked....
>>
>> ... but there you go - I'm sure that you won't mind and that the example will
>> be more than good enough for you.
>>
>> Please note that one of the reasons why I didn't want to add this to the series
>> is that the following changes show only a mere 50% of the reasons why we want OF
>> graph support on mediatek-drm (but mainly, it's because I didn't have time to
>> actually rebase etc :-P )
> 
> Thanks for the explanations and examples.
> Unfortunately, I have 2 display but only one is working (the main: DSI0) when I use the dts method.
> I've probably missed something but I don't know what.
> 
> In my "mmsys" node, if I swap display (the ext endpoint with the main endpoint), the DPI0 is 
> working, but not the DSI0. I conclude my both paths are good.
> 
> Then, I've put some trace into "mtk_drm_of_ddp_path_build" to check if it parse the two endpoint of 
> the node. Both are parsed, but "of_ep.port" is always = 0. According to "of_graph_parse_endpoint" 
> function, "port" is the value of the parent "reg", whereas "id" is the value of the endpoint "reg".
> So I replaced "of_ep.port" by "of_ep.id". Now I've of_ep.id = 0 for main and of_ep.id = 1 for EXT.
> 
> Now I've the good CRTC path, I get this error:
>    mediatek-drm mediatek-drm.1.auto: Invalid display hw pipeline. Last component: 54 (ret=-2)
>    mediatek-drm mediatek-drm.1.auto: probe with driver mediatek-drm failed with error -22
> 
> After quick look, the "cpath" into "mtk_drm_of_ddp_path_build_one" (or deeper functions) seems not 
> be used as it should, due to the previous "of_ep.port" => "of_ep.id" change of course.
> 
> But I probably have to fix "of_ep.port" because I've mis-coded something. Just in case, I share you 
> my diff:
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 1aa3426f561b..f660481d3fe8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -109,15 +109,51 @@ vsys_lcm_reg: regulator-vsys-lcm {
>       };
>   };
> 
> +&cpu0 {
> +    proc-supply = <&mt6357_vproc_reg>;
> +    sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu1 {
> +    proc-supply = <&mt6357_vproc_reg>;
> +    sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu2 {
> +    proc-supply = <&mt6357_vproc_reg>;
> +    sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu3 {
> +    proc-supply = <&mt6357_vproc_reg>;
> +    sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&dither0_out {
> +    remote-endpoint = <&dsi0_in>;
> +};
> +
>   &dpi0 {
>       pinctrl-0 = <&dpi_default_pins>;
>       pinctrl-1 = <&dpi_idle_pins>;
>       pinctrl-names = "default", "sleep";
>       status = "okay";
> +    ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> 
> -    port {
> -        dpi_out: endpoint {
> -            remote-endpoint = <&it66121_in>;
> +        port@0 {
> +            reg = <0>;
> +            dpi0_in: endpoint {
> +                remote-endpoint = <&rdma1_out>;
> +            };
> +        };
> +
> +        port@1 {
> +            reg = <1>;
> +            dpi0_out: endpoint {
> +                remote-endpoint = <&it66121_in>;
> +            };
>           };
>       };
>   };
> @@ -137,36 +173,28 @@ panel@0 {
> 
>           port {
>               panel_in: endpoint {
> -                remote-endpoint = <&dsi_out>;
> +                remote-endpoint = <&dsi0_out>;
>               };
>           };
>       };
> +    ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> 
> -    port {
> -        dsi_out: endpoint {
> -            remote-endpoint = <&panel_in>;
> +        port@0 {
> +            reg = <0>;
> +            dsi0_in: endpoint {
> +                remote-endpoint = <&dither0_out>;
> +            };
>           };
> -    };
> -};
> 
> -&cpu0 {
> -    proc-supply = <&mt6357_vproc_reg>;
> -    sram-supply = <&mt6357_vsram_proc_reg>;
> -};
> -
> -&cpu1 {
> -    proc-supply = <&mt6357_vproc_reg>;
> -    sram-supply = <&mt6357_vsram_proc_reg>;
> -};
> -
> -&cpu2 {
> -    proc-supply = <&mt6357_vproc_reg>;
> -    sram-supply = <&mt6357_vsram_proc_reg>;
> -};
> -
> -&cpu3 {
> -    proc-supply = <&mt6357_vproc_reg>;
> -    sram-supply = <&mt6357_vsram_proc_reg>;
> +        port@1 {
> +            reg = <1>;
> +            dsi0_out: endpoint {
> +                remote-endpoint = <&panel_in>;
> +            };
> +        };
> +    };
>   };
> 
>   &ethernet {
> @@ -229,7 +257,7 @@ port@0 {
>                   reg = <0>;
>                   it66121_in: endpoint {
>                       bus-width = <12>;
> -                    remote-endpoint = <&dpi_out>;
> +                    remote-endpoint = <&dpi0_out>;
>                   };
>               };
> 
> @@ -557,6 +585,10 @@ &pwm {
>       status = "okay";
>   };
> 
> +&rdma1_out {
> +    remote-endpoint = <&dpi0_in>;
> +};
> +
>   &ssusb {
>       dr_mode = "otg";
>       maximum-speed = "high-speed";
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index d34519a33c90..dbb559959a9d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -762,6 +762,19 @@ mmsys: syscon@14000000 {
>               compatible = "mediatek,mt8365-mmsys", "syscon";
>               reg = <0 0x14000000 0 0x1000>;
>               #clock-cells = <1>;
> +            port {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                mmsys_main: endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&ovl0_in>;
> +                };
> +                mmsys_ext: endpoint@1 {
> +                    reg = <1>;
> +                    remote-endpoint = <&rdma1_in>;
> +                };
> +            };
>           };
> 
>           mutex: mutex@14001000 {
> @@ -801,6 +814,24 @@ ovl0: ovl@1400b000 {
>               interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
>               iommus = <&iommu M4U_PORT_DISP_OVL0>;
>               power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    ovl0_in: endpoint {
> +                        remote-endpoint = <&mmsys_main>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    ovl0_out: endpoint {
> +                        remote-endpoint = <&rdma0_in>;
> +                    };
> +                };
> +            };
>           };
> 
>           rdma0: rdma@1400d000 {
> @@ -811,6 +842,24 @@ rdma0: rdma@1400d000 {
>               iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>               mediatek,rdma-fifo-size = <5120>;
>               power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    rdma0_in: endpoint {
> +                        remote-endpoint = <&ovl0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    rdma0_out: endpoint {
> +                        remote-endpoint = <&color0_in>;
> +                    };
> +                };
> +            };
>           };
> 
>           color0: color@1400f000 {
> @@ -819,6 +868,24 @@ color0: color@1400f000 {
>               clocks = <&mmsys CLK_MM_MM_DISP_COLOR0>;
>               interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
>               power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    color0_in: endpoint {
> +                        remote-endpoint = <&rdma0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    color0_out: endpoint {
> +                        remote-endpoint = <&ccorr0_in>;
> +                    };
> +                };
> +            };
>           };
> 
>           ccorr0: ccorr@14010000 {
> @@ -827,6 +894,24 @@ ccorr0: ccorr@14010000 {
>               clocks = <&mmsys CLK_MM_MM_DISP_CCORR0>;
>               interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
>               power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    ccorr0_in: endpoint {
> +                        remote-endpoint = <&color0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    ccorr0_out: endpoint {
> +                        remote-endpoint = <&aal0_in>;
> +                    };
> +                };
> +            };
>           };
> 
>           aal0: aal@14011000 {
> @@ -835,6 +920,24 @@ aal0: aal@14011000 {
>               clocks = <&mmsys CLK_MM_MM_DISP_AAL0>;
>               interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
>               power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    aal0_in: endpoint {
> +                        remote-endpoint = <&ccorr0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    aal0_out: endpoint {
> +                        remote-endpoint = <&gamma0_in>;
> +                    };
> +                };
> +            };
>           };
> 
>           gamma0: gamma@14012000 {
> @@ -843,6 +946,24 @@ gamma0: gamma@14012000 {
>               clocks = <&mmsys CLK_MM_MM_DISP_GAMMA0>;
>               interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
>               power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    gamma0_in: endpoint {
> +                        remote-endpoint = <&aal0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    gamma0_out: endpoint {
> +                        remote-endpoint = <&dither0_in>;
> +                    };
> +                };
> +            };
>           };
> 
>           dither0: dither@14013000 {
> @@ -851,6 +972,23 @@ dither0: dither@14013000 {
>               clocks = <&mmsys CLK_MM_MM_DISP_DITHER0>;
>               interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
>               power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dither0_in: endpoint {
> +                        remote-endpoint = <&gamma0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dither0_out: endpoint {
> +                    };
> +                };
> +            };
>           };
> 
>           dsi0: dsi@14014000 {
> @@ -874,6 +1012,23 @@ rdma1: rdma@14016000 {
>               iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>               mediatek,rdma-fifo-size = <2048>;
>               power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    rdma1_in: endpoint {
> +                        remote-endpoint = <&mmsys_ext>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    rdma1_out: endpoint {
> +                    };
> +                };
> +            };
>           };
> 
>           dpi0: dpi@14018000 {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index dacf4eaa3457..5992b7865310 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -230,22 +230,6 @@ static const unsigned int mt8195_mtk_ddp_ext[] = {
>       DDP_COMPONENT_DP_INTF1,
>   };
> 
> -static const unsigned int mt8365_mtk_ddp_main[] = {
> -    DDP_COMPONENT_OVL0,
> -    DDP_COMPONENT_RDMA0,
> -    DDP_COMPONENT_COLOR0,
> -    DDP_COMPONENT_CCORR,
> -    DDP_COMPONENT_AAL0,
> -    DDP_COMPONENT_GAMMA,
> -    DDP_COMPONENT_DITHER0,
> -    DDP_COMPONENT_DSI0,
> -};
> -
> -static const unsigned int mt8365_mtk_ddp_ext[] = {
> -    DDP_COMPONENT_RDMA1,
> -    DDP_COMPONENT_DPI0,
> -};
> -
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>       .main_path = mt2701_mtk_ddp_main,
>       .main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -334,10 +318,6 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>   };
> 
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
> -    .main_path = mt8365_mtk_ddp_main,
> -    .main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
> -    .ext_path = mt8365_mtk_ddp_ext,
> -    .ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
>       .mmsys_dev_num = 1,
>   };
> 
> 
> 
> -- 
> Regards,
> Alexandre

-- 
Regards,
Alexandre

