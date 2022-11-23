Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpOfjD7j/Rp783J2m0+A9BpqEQItESEc2TO4AhrSmVA=; b=2vKg4wTj8kAEdM12CZu6qsenok
	jny3L8hfmHzCEJIgvPOuCVNH/fuSDgbPbR5NaHRpQ8AjeNTLQpgTo/A7NjgjeOTxc9P8ir5yHrSCP
	3JmP4QQh5vKGfZLJaO7OTAPDdiThh8FqxitRMp8mbbyNSE/whQHsKbVKIb2WDZ2h8CFqxX2O45QRj
	U6exHmDzlTqlzRKGf9+jH7KR+jOar3FjhTp/zRbsavIwspoFcNAAZOdd+jIkH0i4hPO3IAxUe9IMZ
	yVH+MIxf4AmX3Ic9lzU1kflwrNPR//r1MTAfIFKG5pzi0IJzEnCborht4vuWmUv37b5vJTbQiY0Ch
	MX1D1Ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrhq-000Rmh-MD; Wed, 23 Nov 2022 15:30:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrhN-000ReX-Bp; Wed, 23 Nov 2022 15:30:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1536315wmi.3;
        Wed, 23 Nov 2022 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bpOfjD7j/Rp783J2m0+A9BpqEQItESEc2TO4AhrSmVA=;
        b=hM3SOVHGwLlws8xrfb0FFcF0Y+5QOgaPSyLYc1uwSz+yG+KoBbD2wWmJPwydUYq49f
         24CZlfTDaWEDi7/+kZX6JTqwPmxZia1M/FoCNnFEYwL6DlcCl60aydfSJ3/jPifz+Wvw
         oi3ra9WuGDYP8p4grhmiRWgs5p/h8QE5Ua8KIrDcONx4k2UqC7MsO+HBnmVXhwNCDU8G
         BBQC1mbrTOe8aq3LESltSYvHyW6paL6LEdulpCkV+oqub0yZs9ifcsNc1hlBiKma5fr3
         v8y8ooj2GhljboAEfygTHATK6lOwUL+Cqbg7WmkqIbuM2KAGXplaK1dynh/kI/LQGEPO
         tENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpOfjD7j/Rp783J2m0+A9BpqEQItESEc2TO4AhrSmVA=;
        b=i/dYgm1RE67OEqx1pjYdgz98yfvYHd7R2kgmj6DztvyoM4arFCpw3lLsYPfJ+QqpBB
         UJ2kD2mclGjAsOyNdDbmopJtAhfUXtMpRqWLmBUO9IFtsmXcd5kd94suY7qvvPOl2hIq
         wgrf8fQtDMaIRFwOdajAGqDGiRIzwmIF3qc2vZCIHtCxhEPwlvCT3tWc6WSyA6hJVyLz
         wg+ywK0969gAkBMgJ/MHIRdz6hCdpUeNpTLPItziRrkIR+KOys/IC5+RAyjB3M+iSZ32
         H1qiHRQ9ulqV0ygYvEwCT0Abux/DuXMvobqmTzUQQfCyqLItKA+STkMybU55IuKbPZ0j
         WEVA==
X-Gm-Message-State: ANoB5pn7ao6aqHhqx5cEvFCDDEEStIOCReBoS/ZXPZXGj73Iv6SuzBjv
	ao7uJIuBxogUXA/GHpf2vl8=
X-Google-Smtp-Source: AA0mqf48NKm6cCxxcl+5VTmNaZVQjZE0+MXp1r2BS9HXWJ5keVIsFYwuf1MT28TfKun1cdl98l7NHQ==
X-Received: by 2002:a1c:2743:0:b0:3c6:e471:7400 with SMTP id n64-20020a1c2743000000b003c6e4717400mr6927100wmn.98.1669217403138;
        Wed, 23 Nov 2022 07:30:03 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003cfa3a12660sm8469311wms.1.2022.11.23.07.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:30:01 -0800 (PST)
Message-ID: <2238a980-7e04-1615-d836-c385a41628a9@gmail.com>
Date: Wed, 23 Nov 2022 16:30:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] arm64: dts: mt8186: Add dsi node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org
References: <20221123135531.23221-1-allen-kh.cheng@mediatek.com>
 <20221123135531.23221-5-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221123135531.23221-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_073005_430247_EDB54574 
X-CRM114-Status: GOOD (  14.78  )
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



On 23/11/2022 14:55, Allen-KH Cheng wrote:
> Add dsi node for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c0481f0dc527..4a2f7ad3c6f0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -979,6 +979,25 @@
>   			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>   		};
>   
> +		dsi0: dsi@14013000 {
> +			compatible = "mediatek,mt8186-dsi";
> +			reg = <0 0x14013000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_DSI0>,
> +				 <&mmsys CLK_MM_DSI0_DSI_CK_DOMAIN>,
> +				 <&mipi_tx0>;
> +			clock-names = "engine", "digital", "hs";
> +			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
> +			resets = <&mmsys MT8186_MMSYS_SW0_RST_B_DISP_DSI0>;
> +			phys = <&mipi_tx0>;
> +			phy-names = "dphy";
> +			status = "disabled";
> +
> +			port {
> +				dsi_out: endpoint { };
> +			};
> +		};
> +
>   		iommu_mm: iommu@14016000 {
>   			compatible = "mediatek,mt8186-iommu-mm";
>   			reg = <0 0x14016000 0 0x1000>;

