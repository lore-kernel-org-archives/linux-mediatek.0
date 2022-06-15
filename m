Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8F5C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0ZNCzaGbIN6vYx92G4OUm186Sl4b3mFGrPcQiPkGOk=; b=gvi2VFLM0RERPG0q3O3fpdKQH8
	jDlvFIvUOWKzLgzBxMoMOlbURauJSp9hm6pJwHuHkKi5wMeD0B9Zn/Lwb4wLa21bX/Ih7wQe7J82f
	RXkSvky7mZmBKj8TkhU1FlFGrbL7cCx/aAkg0+SDocAE2onMzQd49YvR8OXKjiJmtV9GdSgDne++4
	ENbgUup0N6ZqiXPnh9ob4MjLOFpUkGJlto5LL1BZdw/WGWaIhF38vX+h+r06bQbJ2E43kf3sHudkt
	Phl8J2dv8543FqwTMA7RWZ025aFAMrZ6fzc1ixP16h6jsJDqpfa1enSTYhx7q9P6ojXdH6/Cpi/FH
	2cUXEk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WIX-00FWMq-V9; Wed, 15 Jun 2022 16:55:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WIE-00FWBc-Tj; Wed, 15 Jun 2022 16:55:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id c21so16213995wrb.1;
        Wed, 15 Jun 2022 09:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=O0ZNCzaGbIN6vYx92G4OUm186Sl4b3mFGrPcQiPkGOk=;
        b=FWFfE/TrOsOqhKNBqDjPUw1E7PsUxALBEn9s+nTsX2df5Hx2wbVhzfUT/DUXRnQpnS
         y1WJqF+s3WJHsn1DPXWQOQtlbNRQuDyptNEM4nr6MeSafsU1dPtHIULXL+MQ3fGzaqYM
         NgASYW/jRkv6l0ZagU9DLznhoJ+G23wWKjS9X/eSpnNdUWMKuepQg/hFM8aVnvJVD1i7
         58rvgMp5z0X4w/AZZn031OrSvk9Vo3t4oNimvCl2flH1cQxaoO9l5kVRc6IYg6tRnlDV
         x3SSlYjYWZyFy79oPP8KftfTu34PQzBwjm1YJ8iuURHu1VsErk2pjiDI/K1c6Sr4M1Ce
         n+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O0ZNCzaGbIN6vYx92G4OUm186Sl4b3mFGrPcQiPkGOk=;
        b=HauL/Ck7pAfyt9Uu1tFihWAZy60VQhTxyFQ5zLRl7RgiNeZEhR2QUk6yq+9mygwYtV
         Fkv0Jgg0wCXfVmLahVSxtiZRzOQsOo75moPBBbkkebjXIO5qhpthenESgZlpP31iWmmU
         nkWVL30fo5QYyda7U296TfEtNXloQkMBtN1uYqweT5HINaMZdnjPzRPhmXUWab3kvQdS
         BEZXlJePy0JtBqNqFfmdCaWh0DtC0S2nAkuRtDDDj4zlDQ20n3DADNmZirgArxHSuvhv
         u15uMNfW8WuwDENcEbNVhXAXqNcEVWG2zdENyC6GZ1UDIVs2HEwy+ma36xJ5mCHHCt0L
         5wQg==
X-Gm-Message-State: AJIora9CM+BzCn+ZD696Q45mvuxRFcjBnWma8YEvdTVMiDj5Glo+mc+X
	7/DORJNXUngr2HjYkaxLcSQ=
X-Google-Smtp-Source: AGRyM1upL28UfLmiDNOCmxFWdPZt1LH1eRzJbtxF7HVF5ZDTc2UCPQgDR6kt2epkDohPh0R41Pw3Xg==
X-Received: by 2002:adf:e2cb:0:b0:20c:c1bb:9fcb with SMTP id d11-20020adfe2cb000000b0020cc1bb9fcbmr704620wrj.35.1655312094114;
        Wed, 15 Jun 2022 09:54:54 -0700 (PDT)
Received: from [192.168.0.36] ([37.223.143.134])
        by smtp.gmail.com with ESMTPSA id p22-20020a1c7416000000b0039c5a765388sm2890998wmc.28.2022.06.15.09.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 09:54:52 -0700 (PDT)
Message-ID: <bd788f00-0328-e57d-d56f-7e975996a9d0@gmail.com>
Date: Wed, 15 Jun 2022 18:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RESEND v10 3/3] ARM: dts: Add PCIe support for Airoha
 EN7523
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220615125335.96089-1-nbd@nbd.name>
 <20220615125335.96089-3-nbd@nbd.name>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220615125335.96089-3-nbd@nbd.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_095459_000241_E6447824 
X-CRM114-Status: GOOD (  17.15  )
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



On 15/06/2022 14:53, Felix Fietkau wrote:
> This uses the MediaTek MT7622 PCIe driver, since the PCIe IP block is nearly
> identical to the one in MT7622
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

applied to v5.19-next/dts32

Thanks!

> ---
>   arch/arm/boot/dts/en7523-evb.dts |  8 +++++
>   arch/arm/boot/dts/en7523.dtsi    | 58 ++++++++++++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
> index a8d8bb0419a0..f23a25cce119 100644
> --- a/arch/arm/boot/dts/en7523-evb.dts
> +++ b/arch/arm/boot/dts/en7523-evb.dts
> @@ -33,3 +33,11 @@ &gpio0 {
>   &gpio1 {
>   	status = "okay";
>   };
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
> index 2e705b87b6c1..7f839331a777 100644
> --- a/arch/arm/boot/dts/en7523.dtsi
> +++ b/arch/arm/boot/dts/en7523.dtsi
> @@ -143,4 +143,62 @@ gpio1: gpio@1fbf0270 {
>   		gpio-controller;
>   		#gpio-cells = <2>;
>   	};
> +
> +	pcie0: pcie@1fa91000 {
> +		compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";
> +		device_type = "pci";
> +		reg = <0x1fa91000 0x1000>;
> +		reg-names = "port0";
> +		linux,pci-domain = <0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "pcie_irq";
> +		clocks = <&scu EN7523_CLK_PCIE>;
> +		clock-names = "sys_ck0";
> +		bus-range = <0x00 0xff>;
> +		ranges = <0x82000000 0 0x20000000  0x20000000  0 0x8000000>;
> +		status = "disabled";
> +
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +				<0 0 0 2 &pcie_intc0 1>,
> +				<0 0 0 3 &pcie_intc0 2>,
> +				<0 0 0 4 &pcie_intc0 3>;
> +		pcie_intc0: interrupt-controller {
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <1>;
> +		};
> +	};
> +
> +	pcie1: pcie@1fa92000 {
> +		compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";
> +		device_type = "pci";
> +		reg = <0x1fa92000 0x1000>;
> +		reg-names = "port1";
> +		linux,pci-domain = <1>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "pcie_irq";
> +		clocks = <&scu EN7523_CLK_PCIE>;
> +		clock-names = "sys_ck1";
> +		bus-range = <0x00 0xff>;
> +		ranges = <0x82000000 0 0x28000000  0x28000000  0 0x8000000>;
> +		status = "disabled";
> +
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> +				<0 0 0 2 &pcie_intc1 1>,
> +				<0 0 0 3 &pcie_intc1 2>,
> +				<0 0 0 4 &pcie_intc1 3>;
> +		pcie_intc1: interrupt-controller {
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <1>;
> +		};
> +	};
>   };

