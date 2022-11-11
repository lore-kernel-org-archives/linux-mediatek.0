Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC43C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:References:To
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jovw191tkqhEY/091trHnhlrx/URL9SGNNv7OLPeWTQ=; b=zb0eV6nioceuvf
	/zr3Fg23v9lxD+GNE5W3fuL3BX0k4GsLgQLeu1W7ijTojMKtY7J/I2LGtfWuoyCqfms0FvjgtDbi/
	UoPiYrqq2KTvVh+61J/VZxS8j6XA6gQWje1uhPBaYEECHwJ2GRITWlrHfGh3t5MYz+ldhUpdvwBlv
	g4GUXq/GZMiDoP8DtHhimKb8cGHvw8tK5Pye5bS+XbZSq5dGGyjIfp5L57L8huLfI3uckjFP2Fxv8
	Z/N2eTxLZ+zO7c7u4CCE16LEGGoI0RxXF0ELTqAJ2bCyefJExtoE7FSoLlWDSsnaVfFV/xZBsOgbK
	wteaTw+BUuZCWbtF7NVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otQ9a-00EXkZ-B8; Fri, 11 Nov 2022 09:16:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otQ9X-00EXj7-7M; Fri, 11 Nov 2022 09:16:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id cl5so5636250wrb.9;
        Fri, 11 Nov 2022 01:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jovw191tkqhEY/091trHnhlrx/URL9SGNNv7OLPeWTQ=;
        b=QZ4qUEYywU25+PgljwAk53ASLfWTPNIIJylvWVU4Y8JyQX9plUYn0ALvKbih/5RMPE
         GvSYY90MsMVyO4vtRwyieahWlG2iWiNESdeN572tvMSzNAOL8xKRoy1BbamgRnG/jblx
         Uy+x5C3JondEUg6F1GniqGmCeP/nKKXnXTKsBMlL6QRSyfSiA2yIjml1ZVWGdCb6r5t7
         gu4gLkxEXy4Rp9IFqrJjApbZmZMkMlMQV5rezaNZ+NHfSkfqwE1wMCsKb5fpRJtyk19v
         vo/RqVu0A7hEROSQdZaCsQw1bdLzFu3Pd3WgiSYbsCsId8CCP4M+Z64UlISJ0EuLvPkZ
         kCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jovw191tkqhEY/091trHnhlrx/URL9SGNNv7OLPeWTQ=;
        b=iJhQsIAOAQWxBMd8aKtg/SUZHDpv1zDZjZRjItv7RBSxOPyftjVefkheX3c+gsPBSn
         3iMUzCafA6nlzvOko5gMUrL6xRRNCRdFRyzMGbBE9Jr9C4AoUDgVuwIJ9w9/lzCOQwyx
         iCrzBZJZjFCbqFL3MRkN173fMgOLpmEiURCNNoGcQdZV/KVh17QEHpBtzKvnniQn3O7C
         bH28Tn0AR+RHkI20mAIxpZJhmTu32on4F1krYDCkCC2JMPgbGXxfa8CgZxn4xCtNkAsi
         RsLGOTCmMKlgQ5LNeWjM77+nQoJJIP6XSc+Ptj12002hgHKSWGmRxsKs9Sc7/asX1Pl2
         zjDg==
X-Gm-Message-State: ANoB5plwwriO3zQi41Jd6thiYpvzjmstFt5e+sQBlzbzcWJqRbcWJMQz
	ExAXF2ALKLzI3/JgOZOVRMc=
X-Google-Smtp-Source: AA0mqf4WOo4GYRvJTD5FEYyn6wAGMohgHK1JIfF6SWmlWvK2hyBZhFpiw9mF2RR/u7NBQe9HXADfWA==
X-Received: by 2002:a05:6000:181c:b0:236:60ce:7c10 with SMTP id m28-20020a056000181c00b0023660ce7c10mr673951wrh.440.1668158205774;
        Fri, 11 Nov 2022 01:16:45 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id fc18-20020a05600c525200b003b49bd61b19sm8545557wmb.15.2022.11.11.01.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 01:16:44 -0800 (PST)
Message-ID: <5ece2b19-cbc7-5ecf-c29a-8f0258f260f4@gmail.com>
Date: Fri, 11 Nov 2022 10:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-12-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RFC v3 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
In-Reply-To: <20221106085034.12582-12-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_011647_316659_BFE8F72A 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rob, Krzysztof,

On 06/11/2022 09:50, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add devicetree overlays for using nand and nor on BPI-R3.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>   .../mediatek/mt7986a-bananapi-bpi-r3-nand.dts | 53 +++++++++++++++
>   .../mediatek/mt7986a-bananapi-bpi-r3-nor.dts  | 67 +++++++++++++++++++
>   3 files changed, 122 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index e8902f2cc58f..d42208c4090d 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo

Do we allow the inclusion of overlays in the kernel?
I don't think so. I see there are some dtbos for some freescale platforms, but I 
wasn't aware that we support that. I thought it is all about dtsi includes.

@frank In any case we would need to apply these overlays to some base board to 
create a valis dtb.

Regards,
Matthias

>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
> new file mode 100644
> index 000000000000..e12ff825bb50
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +//dtc -O dtb -o bpi-r3-nand.dtbo mt7986a-bananapi-bpi-r3-nand.dts
> +
> +/ {
> +	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
> +
> +	fragment@0 {
> +		target-path = "/soc/spi@1100a000";
> +		__overlay__ {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			spi_nand: spi_nand@0 {
> +				compatible = "spi-nand";
> +				reg = <0>;
> +				spi-max-frequency = <10000000>;
> +				spi-tx-buswidth = <4>;
> +				spi-rx-buswidth = <4>;
> +
> +				partitions {
> +					compatible = "fixed-partitions";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					partition@0 {
> +						label = "bl2";
> +						reg = <0x0 0x80000>;
> +						read-only;
> +					};
> +
> +					partition@80000 {
> +						label = "reserved";
> +						reg = <0x80000 0x300000>;
> +					};
> +
> +					partition@380000 {
> +						label = "fip";
> +						reg = <0x380000 0x200000>;
> +						read-only;
> +					};
> +
> +					partition@580000 {
> +						label = "ubi";
> +						reg = <0x580000 0x7a80000>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
> new file mode 100644
> index 000000000000..f11ffd9c4bce
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +//dtc -O dtb -o bpi-r3-nor.dtbo mt7986a-bananapi-bpi-r3-nor.dts
> +
> +/ {
> +	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
> +
> +	fragment@0 {
> +		target-path = "/soc/spi@1100a000";
> +		__overlay__ {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			flash@0 {
> +				compatible = "jedec,spi-nor";
> +				reg = <0>;
> +				spi-max-frequency = <10000000>;
> +
> +				partitions {
> +					compatible = "fixed-partitions";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					partition@0 {
> +						label = "bl2";
> +						reg = <0x0 0x20000>;
> +						read-only;
> +					};
> +
> +					partition@20000 {
> +						label = "reserved";
> +						reg = <0x20000 0x20000>;
> +					};
> +
> +					partition@40000 {
> +						label = "u-boot-env";
> +						reg = <0x40000 0x40000>;
> +					};
> +
> +					partition@80000 {
> +						label = "reserved2";
> +						reg = <0x80000 0x80000>;
> +					};
> +
> +					partition@100000 {
> +						label = "fip";
> +						reg = <0x100000 0x80000>;
> +						read-only;
> +					};
> +
> +					partition@180000 {
> +						label = "recovery";
> +						reg = <0x180000 0xa80000>;
> +					};
> +
> +					partition@c00000 {
> +						label = "fit";
> +						reg = <0xc00000 0x1400000>;
> +						compatible = "denx,fit";
> +					};
> +				};
> +			};
> +		};
> +	};
> +};

