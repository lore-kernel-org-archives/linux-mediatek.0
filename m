Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69EDC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pqmnq8xzZa2lyHXyUpObVSAYBy1mnUzOiASQNzSsq1g=; b=I8uYi2ME2jiJ0XWiIh5Idt5rey
	idjyTRCgjN9fwYJLUtgfo50MLImn+GSm0vVlf/aADnl1HWOmwH87R+n1qwoHmHoceijyC7/2b6TSl
	+TzEQBDZJopRDQuY+7lHwgUvKiWo8bg61lAkkgcYIOrxqv4dWc688mwn1M0rFTANVwUtltOjU4Z8Y
	qR1pk6Be6gJe7IjX4Spq+xUhdoL5hDo9WiOjXej8nVlRWlZatoryEURnZR/Sko/lUuukGNMC/DLgL
	5n+GRuDhk5nOKo/Y/DZ53JC5Uo0eu9QpqGB+G7BSkwiJS3nB4GffU+b80a5eypiQXE06WZk44vFvl
	j9YWglPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCQf-0070jK-2J;
	Fri, 31 Mar 2023 10:56:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCQa-0070hX-0h
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 10:56:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l27so21967571wrb.2
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 03:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680260172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pqmnq8xzZa2lyHXyUpObVSAYBy1mnUzOiASQNzSsq1g=;
        b=QDM2PWvm87vJ3RBhg9ErLSog6GEvxd/aECLGrRIkxjjCc47hgT80288j24Dk+6xjVv
         UEUExJ869nFUJgpFweDD9C7mpTALZa142ujLEu+PRqeeX7DvnvNL5K8HoU6GzuUg0RTE
         kIlWUX4DKZla58KFRtz2ixSIPr/w9J9SSbSaqREJK67rZjlFHLqD+DfsCtwxNQklMpBH
         ljMygivHqbQ79QHaVlz4nhKExKTFvOzh9+EIPOOLF8Ep+RZMbDTKYm+B72smb9uAIBb6
         2US56v/Kxj0kA3y82U1V4Tb5fXrqAsh15MLP9lswnx8b3jyMAKqhq4W9ltj2Lo11nN30
         6PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680260172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pqmnq8xzZa2lyHXyUpObVSAYBy1mnUzOiASQNzSsq1g=;
        b=sGSvO4jUpe+Sm9L/YJyD1M/XzOux6CE6iAY9f4ZPofilU3IOmhSAIkPK4U0fSR9Ynq
         dahcPlIgM8KDH4ob9ZBFf3Gvr42CEk7GrCOkJLhFkYw545YHKM7lwAXjTpicHG3mLPYc
         LKTCG28JJ3g94EJyjvffUGDtbksymRtwyXdtN//4cysSCJ1TzqxJ3fJYjcqti1lxo6Ft
         8W0jAGg09SoH3stoCb+8gsQAluoPSLsvIBZC3NgdB/TYX42Wk6HMBXBAPoxCSgy7KnSZ
         k+lpk5N20flhq7Sd7X8o2Y6uVv9V7iXu4vLgrYYlBHJxAT0cOF1/DPgca4Rrhc09aZ0q
         FlDA==
X-Gm-Message-State: AAQBX9d/2QFqfAnxGsTvm/q89pFQCBBPQw0OuIegSI6n5Wcuq4FYUfE7
	1+egDAmVwS3AcElfHU51KEg=
X-Google-Smtp-Source: AKy350bjkArNEhmupglrT3ehOhjiY0S0rZcbOJKvYhK/laZUWUToLhEdQrcMcm4Z880g2mEcZsGN0g==
X-Received: by 2002:a5d:49d0:0:b0:2cf:2dcc:3421 with SMTP id t16-20020a5d49d0000000b002cf2dcc3421mr20544873wrs.5.1680260172315;
        Fri, 31 Mar 2023 03:56:12 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r16-20020adfdc90000000b002cff06039d7sm1897271wrj.39.2023.03.31.03.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:56:11 -0700 (PDT)
Message-ID: <82091587-3d4a-eec2-b3d0-7635dc9ef7b0@gmail.com>
Date: Fri, 31 Mar 2023 12:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next 07/10] arm64: dts: mt7986: move ilm in a
 dedicated node
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-mediatek@lists.infradead.org, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
References: <cover.1679330630.git.lorenzo@kernel.org>
 <5e1168bc8fd29f4871f81d8e4a9fd43a2c3be146.1679330630.git.lorenzo@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <5e1168bc8fd29f4871f81d8e4a9fd43a2c3be146.1679330630.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_035618_403317_053FD480 
X-CRM114-Status: GOOD (  13.89  )
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



On 20/03/2023 17:58, Lorenzo Bianconi wrote:
> Since the ilm memory region is not part of the RAM SoC, move ilm in a
> deidicated syscon node.
> This patch helps to keep backward-compatibility with older version of
> uboot codebase where we have a limit of 8 reserved-memory dts child
> nodes.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 34 +++++++++++------------
>   1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 668b6cfa6a3d..a0d96d232ee5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -89,16 +89,6 @@ wo_emi1: wo-emi@4fd40000 {
>   			no-map;
>   		};
>   
> -		wo_ilm0: wo-ilm@151e0000 {
> -			reg = <0 0x151e0000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		wo_ilm1: wo-ilm@151f0000 {
> -			reg = <0 0x151f0000 0 0x8000>;
> -			no-map;
> -		};
> -
>   		wo_data: wo-data@4fd80000 {
>   			reg = <0 0x4fd80000 0 0x240000>;
>   			no-map;
> @@ -454,11 +444,10 @@ wed0: wed@15010000 {
>   			reg = <0 0x15010000 0 0x1000>;
>   			interrupt-parent = <&gic>;
>   			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> -			memory-region = <&wo_emi0>, <&wo_ilm0>, <&wo_dlm0>,
> -					<&wo_data>;
> -			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
> -					      "wo-data";
> +			memory-region = <&wo_emi0>, <&wo_dlm0>, <&wo_data>;
> +			memory-region-names = "wo-emi", "wo-dlm", "wo-data";
>   			mediatek,wo-ccif = <&wo_ccif0>;
> +			mediatek,wo-ilm = <&wo_ilm0>;
>   			mediatek,wo-cpuboot = <&wo_cpuboot>;
>   		};
>   
> @@ -468,11 +457,10 @@ wed1: wed@15011000 {
>   			reg = <0 0x15011000 0 0x1000>;
>   			interrupt-parent = <&gic>;
>   			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> -			memory-region = <&wo_emi1>, <&wo_ilm1>, <&wo_dlm1>,
> -					<&wo_data>;
> -			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
> -					      "wo-data";
> +			memory-region = <&wo_emi1>, <&wo_dlm1>, <&wo_data>;
> +			memory-region-names = "wo-emi", "wo-dlm", "wo-data";
>   			mediatek,wo-ccif = <&wo_ccif1>;
> +			mediatek,wo-ilm = <&wo_ilm1>;
>   			mediatek,wo-cpuboot = <&wo_cpuboot>;
>   		};
>   
> @@ -490,6 +478,16 @@ wo_ccif1: syscon@151ad000 {
>   			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
> +		wo_ilm0: syscon@151e0000 {
> +			compatible = "mediatek,mt7986-wo-ilm", "syscon";
> +			reg = <0 0x151e0000 0 0x8000>;
> +		};
> +
> +		wo_ilm1: syscon@151f0000 {
> +			compatible = "mediatek,mt7986-wo-ilm", "syscon";
> +			reg = <0 0x151f0000 0 0x8000>;
> +		};
> +
>   		wo_cpuboot: syscon@15194000 {
>   			compatible = "mediatek,mt7986-wo-cpuboot", "syscon";
>   			reg = <0 0x15194000 0 0x1000>;

