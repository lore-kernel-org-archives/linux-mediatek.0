Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC483C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFccX0iQGUkPDvHxdXm2Dg7nOAysUilW9CKtDUmJ0cw=; b=DTC5TJ2oHodwqMjzwqhefLkRBD
	3t+nTvpY6pismSA+NCCB28dH/V1wuNIPLSGPlonBy4WP9JNImq4MrFIUEwwcnm04VBAOxlbkxscNM
	vPVGSnaIednUeOku3pQwMcj8wI/V8mdAJ4PX5rpB6emhYKN093RonuXTsqFmR/ZHvb/2S+pdX089u
	On1ivbigInaph3hwp64U6Bk2ywYvpeHl+i2AoK9L7/cFdxrIBX8IsUFX6R97DYM6wljxr1ldYvEJI
	feG0vOBUq3y/XCP7PFepjZtAV9c0Gxww2D3QInl/19lr5+w+3fH2XblJM83a39VGEAnqLWDwnd/Ci
	5oynPbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXwh-0062ce-Mk; Thu, 19 Jan 2023 16:39:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXwN-0062Se-FR; Thu, 19 Jan 2023 16:39:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id b7so2441548wrt.3;
        Thu, 19 Jan 2023 08:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFccX0iQGUkPDvHxdXm2Dg7nOAysUilW9CKtDUmJ0cw=;
        b=I81c7RERXKi+udhauEcEapckO0k8IyPli493C0u5Ry877Fr6qBEqIDv+107R/2YV0h
         RGBlf2WitbBBsk37ywG476iJ9O+F7Ci929YlrSK1e+hBMpiAkqTTdCsCi3XNsanqq2oj
         dFrpAaSLyXY4t7eeUzkB2MdTb7ye6RkvXeqiE6MZxsmjwrFoMK9i1cMdtBm73+bfB7Kf
         AzGl92rNdOnzGoGsfuf7R/ygb48lad37rsjD/i0oJJR1zzz3lwIsXOJ4Jt5eueFugZVK
         P161mwGSEDjTtvGcq9JeTcbSxHXW9D2U7+ke9NCbCNatoPaXSBtR7qhwgR+N6COXKvxP
         jgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFccX0iQGUkPDvHxdXm2Dg7nOAysUilW9CKtDUmJ0cw=;
        b=odTkcyqHWSqLqgIa/xUAooKaK5ebRn7dVtrS6MAiK9jN3+01OvqAjqotaJquK/k09y
         Dub1vHtt546XTU8+hvuwmax4+57fY7aAVnsivXIongLO0YO5PCgy0/D/I/8YrC/DSVb6
         MGc0ZsIWbJ6QnMOESXv767ZFiI4Vpm2THOM6WCnUysgGrX8zAONYyYqCg7AQbrAjsOLG
         I5iJOM+w9VBKe/0M4INeM28hnRKlkRStXqfSt8DIPF5NTJLJNY3/lVbdmrWPmy1pZerK
         WnXutmVdfrUfAv8wzfU8xcQsSmlskKGLnMl9A82Xx7UubQnxF4bFwtnm4NZa2wGsEqfe
         GsYA==
X-Gm-Message-State: AFqh2kqh5SxyA4VQk79VOrHLWGZBXY+GD2ZoMttsV8LFknwAcFBEzCCl
	v+bfJxTyov+hXZpc8/RS3EfMbMMznPc=
X-Google-Smtp-Source: AMrXdXvnv3Mh0kiEG2JAGXOY0znP12LMrjnWY7tdftGlWSZFodg0/DJdtw6YlWjdWjtRZfMIz2R3Hw==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id y16-20020adfdf10000000b002bbe8911829mr10242278wrl.4.1674146341814;
        Thu, 19 Jan 2023 08:39:01 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b0027323b19ecesm33836836wrt.16.2023.01.19.08.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:39:01 -0800 (PST)
Message-ID: <572b472b-088b-4ebe-0b52-927736199f70@gmail.com>
Date: Thu, 19 Jan 2023 17:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 7/9] arm64: dts: mediatek: mt8186: Add DPI node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-8-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-8-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_083903_607168_970A0855 
X-CRM114-Status: GOOD (  14.93  )
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



On 18/01/2023 10:18, Allen-KH Cheng wrote:
> Add DPI node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c52f9be1e750..45b9d6777929 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1230,6 +1230,23 @@
>   			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>   		};
>   
> +		dpi: dpi@1400a000 {
> +			compatible = "mediatek,mt8186-dpi";
> +			reg = <0 0x1400a000 0 0x1000>;
> +			clocks = <&topckgen CLK_TOP_DPI>,
> +				 <&mmsys CLK_MM_DISP_DPI>,
> +				 <&apmixedsys CLK_APMIXED_TVDPLL>;
> +			clock-names = "pixel", "engine", "pll";
> +			assigned-clocks = <&topckgen CLK_TOP_DPI>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
> +			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
> +			status = "disabled";
> +
> +			port {
> +				dpi_out: endpoint { };
> +			};
> +		};
> +
>   		dsi0: dsi@14013000 {
>   			compatible = "mediatek,mt8186-dsi";
>   			reg = <0 0x14013000 0 0x1000>;

