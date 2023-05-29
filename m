Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65511C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bhf+dGpQh+ihyXe3XoXHHkBL1Gb6jd21i/gahvLFjMw=; b=v5VPdqEH3mA+EEnfBIHKdp6Zkh
	zVAsslhy262oLBwyOLHNBtzMhY3G6YKNQUTxWpKb0DGEHjN44BL/yz6g3nZSpzsET603vfyHmK09Y
	d92/zaiKV8q6Rk0c61mMXA9i1NfjZm1h4LnWgQx5Y1FUiAvSyIWuz/bimHlTKt2gbvfX5hHE022DX
	fOkdbq0vd42xd7KIpoTpFZQH18yTw7JLfLU/wfFL1vThn1qn4VU+o7k9mnnundw1bsFxQgR0Slyqo
	9JXlbs+lmrdO/gWLyPuqAMFjwqp8g2M2hPvqcfFKwYCSa1UURMQH6A7a/J4RX02CuPZCwYxvMy3p8
	8ZpaiosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dmL-00Aky1-0L;
	Mon, 29 May 2023 14:23:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dmI-00Akwj-0R;
	Mon, 29 May 2023 14:23:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f623adec61so34625355e9.0;
        Mon, 29 May 2023 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685370196; x=1687962196;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bhf+dGpQh+ihyXe3XoXHHkBL1Gb6jd21i/gahvLFjMw=;
        b=F4NVhqLpqy0ymn9TqPQDAV8TTMtXMZWrO0bmMg7bbOwxqlahco0kddrAEqh4PD9Lx1
         hfieb5Nvcw01NXhOHu3235hE0MDhCaAabAVUtD6yaXYyS26PAh2pl2O5U/rJLFG6y2bl
         vk8OYgNQLT7sA7zhjWgS3ORF1XoJn5fUDRYjvPVvAUC9hmbrZwb6JTDATzLSbP1UqjRl
         0xqCV3JZIySH7+PTHwa5kdU45sO+3sKEImTz2TxgGK8YM0L+9DYG9qURJKKygWYXqBtI
         3t6+E6XR+Wi1AvhwdVtIuFipJEUwaUfRQolh2bFRjC27AFATwycUmwpIp/0O58Eplirp
         NRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685370196; x=1687962196;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhf+dGpQh+ihyXe3XoXHHkBL1Gb6jd21i/gahvLFjMw=;
        b=JtjxZWtwSJ/IEVsypAEobEcFpG2qSsjfWIHARzwh/F9b6+v/h6x3XQtonEMBjCphq5
         umw2ojst7sWASr69hEriuFSLlCqnKkoQfjKS2SKgeEMk+g+My3mLDKsdeqOiIaQCAV7r
         //9qiAuLdk5M/ybXH59oMXwkJhglnp/8TqAsFxHtO8os0QyPRDLu/G7HLQ6JO727fQ0o
         p1C/9maIhY64rGAC3TnDup20NQdK8PUFp1pi0UttYItiEJWiF3jNWdV2IQiR8vjPmbYd
         iI54wKi399Zjk3qmG1EYVMGOT1y1SsiKhbjNqg+BN0xUqCLl7DX35NEViH7QWwVMwMOa
         p7Rw==
X-Gm-Message-State: AC+VfDxEAVOnLjEDQnkCu+NCPo1EgoR4vHdMYrhu5ai1b6tl3HE/JBA+
	fhjk1x72nsS+Pi5ZyvDQmtI=
X-Google-Smtp-Source: ACHHUZ5nwRk8NJZ4CqJmbHbZwW+mE2Fld12sMvifhdfTJBxdSDT+RaNQcnm4R3EJqXtTfjM30+ty7Q==
X-Received: by 2002:a05:600c:284a:b0:3f6:3d8:aabb with SMTP id r10-20020a05600c284a00b003f603d8aabbmr9133115wmb.38.1685370196332;
        Mon, 29 May 2023 07:23:16 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003f42d8dd7ffsm14441605wmd.19.2023.05.29.07.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:23:15 -0700 (PDT)
Message-ID: <64b7c2ed-ccbe-8313-8a46-1adf57deb0df@gmail.com>
Date: Mon, 29 May 2023 16:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] arm64: dts: mt7622: declare SPI-NAND present on
 BPI-R64
Content-Language: en-US, ca-ES, es-ES
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <ZEA96dmaXqTpk8u8@makrotopia.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ZEA96dmaXqTpk8u8@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_072318_179822_ECAE0566 
X-CRM114-Status: GOOD (  18.02  )
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



On 19/04/2023 21:15, Daniel Golle wrote:
> The SPI-NOR node in the device tree of the BananaPi R64 has most likely
> been copied from the reference board's device tree even though the R64
> comes with an SPI-NAND chip rather than SPI-NOR.
> 
> Setup the Serial NAND Flash Interface (SNFI) controller, enable
> hardware BCH error detection and correction engine and add the SPI-NAND
> chip including basic partitions,
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Applied, thanks

> ---
>   .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 39 ++++++++++++++++---
>   1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index af3fe61e40938..d583e816684cf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -248,14 +248,42 @@ &nandc {
>   	status = "disabled";
>   };
>   
> -&nor_flash {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&spi_nor_pins>;
> -	status = "disabled";
> +&bch {
> +	status = "okay";
> +};
>   
> +&snfi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&serial_nand_pins>;
> +	status = "okay";
>   	flash@0 {
> -		compatible = "jedec,spi-nor";
> +		compatible = "spi-nand";
>   		reg = <0>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +		nand-ecc-engine = <&snfi>;
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "bl2";
> +				reg = <0x0 0x80000>;
> +				read-only;
> +			};
> +
> +			partition@80000 {
> +				label = "fip";
> +				reg = <0x80000 0x200000>;
> +				read-only;
> +			};
> +
> +			ubi: partition@280000 {
> +				label = "ubi";
> +				reg = <0x280000 0x7d80000>;
> +			};
> +		};
>   	};
>   };
>   
> 
> base-commit: 13961ef828cbc254cc272221b7fc54851caa39a7

