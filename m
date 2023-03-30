Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEB4C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8C7GCDTGTEyH0AOHKmhfixymkIHQz9SRHOuIDmLbko=; b=cLSCM33xQCqMFqaXQDVk4uF4FL
	T2luy/ckCrJpgGxImtzWtHwP7JVLWeIBs1wtPOy8JndSe9hdceZY9bYXhzEncVjlysbre6u5tbIcZ
	Yf/QcnYYkX1mWv4gymnNcjdrFflRmoiTE9E2rUj7Wvo1kgFNtvETzo/qK4lKbhOkaT2wPZkrn6vH8
	229NH939JpuMZV+VuowkwFLgNWLJczZch+FCHZa2c+lcUKa/jXHEzJNSrBUPiBokUXWo6zQEv2DtO
	rJV5vBJtcuAO53oEi8JepJdRlJG2QiWIXzw9RCZMu5FZdee05zQSpdeMJjtqX0FRUS5hyqQSLJJjq
	QMf0q2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phw7m-004eBT-0w;
	Thu, 30 Mar 2023 17:31:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phw7h-004e9m-2g;
	Thu, 30 Mar 2023 17:31:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t4so14645234wra.7;
        Thu, 30 Mar 2023 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680197499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8C7GCDTGTEyH0AOHKmhfixymkIHQz9SRHOuIDmLbko=;
        b=N7u8QTWTvUqZGEVlZfqEizdpr5VUNBM+pV6CnqB/wrVeToff7amDfenDK3fKrdDtb8
         j347QbU+VvKBy+6f7x2UgbwXaH1utnycH4NNASNI8cjP3bMeN8vkxeYkyUX5Q736j+bU
         4MBV7bJpMRlkhUDdK8MDpR8046AaEJl94ZL8TMy2PGb2dGwLvApLMB+XlIE6vOGJYrXN
         dMf7JtFRMExcWGKRUEXpPWXPMzbNy7yqqBJjnN0kxY3XWNw3JJNe/eF7oAewaVuwemex
         VRM3cErDyKIynRzqjCV3Vo++AsyoqPQeScMoU1WZ+UgEo8x6Czs4TARY42tCaLznLh+3
         VIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680197499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8C7GCDTGTEyH0AOHKmhfixymkIHQz9SRHOuIDmLbko=;
        b=TtdPqXjwg/4eXW9KEAb8WhmSITcZ5eK50eDrHq2YDJUf6A6PAmRLE2xxyvNwqMhIQ0
         v2QKH0ir5vbOVMPBx09MIgsx0jLShgWYV8uyee6PBdHnSw3mAsMtJ6WPJP7q8xoC+Ev7
         LI5Fad8SiYv81LIEX19bNBXsNVgkImh92WbRv9pldKZjxf6hMs2dQ4IJ9uQNhCb1nn+p
         kVaue0ZqY0vIREszCL1/kdV/+N20Og+6D+BMPLKpPB0+6P8A9y4rC949Q1OT+SeKV4mB
         5s4e1ekBVRTrB+rWj6KRUvChi+wU/XYoiESCWlW8tHArqHYmHWnYSSCKcy8ZRdNFi2W2
         f9Yw==
X-Gm-Message-State: AAQBX9dLXp3ZYsK80ttXLaNfsK1txRRJ7vE1ptqTTwAIOtkeKZLdjNTw
	9nsKUwDUSoO0g3CeMFsQI7Y=
X-Google-Smtp-Source: AKy350bTdpoUHIsagb+4BTrzzRfsNOzsybVTgw+GzV1DuXqyaLBQbEtimDuEJgScEaHe1uFKXxi+aQ==
X-Received: by 2002:a5d:6e90:0:b0:2e4:efd9:987a with SMTP id k16-20020a5d6e90000000b002e4efd9987amr2151856wrz.69.1680197499507;
        Thu, 30 Mar 2023 10:31:39 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q1-20020a05600000c100b002e51195a3e2sm1408157wrx.79.2023.03.30.10.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:31:38 -0700 (PDT)
Message-ID: <fa3d3f99-59f4-7397-7a7b-e342ed39dd00@gmail.com>
Date: Thu, 30 Mar 2023 19:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 12/17] arm64: dts: mediatek: add ethernet support for
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-12-0003e80e0095@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230203-evk-board-support-v3-12-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_103141_874332_11318B08 
X-CRM114-Status: GOOD (  16.35  )
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



On 29/03/2023 10:54, Alexandre Mergnat wrote:
> This IP is a 10/100 MAC controller compliant with IEEE 802.3 standards.
> It supports power management with Energy Efficient Ethernet and Wake-on-LAN
> specification. Flow control is provided for half-duplex and full-duplex
> mode. For packet transmission and reception, the controller supports
> IPv4/UDP/TCP checksum offload and VLAN tag insertion.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index a67eeca28da5..394a5a61be59 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -438,6 +438,18 @@ mmc2: mmc@11250000 {
>   			status = "disabled";
>   		};
>   
> +		ethernet: ethernet@112a0000 {
> +			compatible = "mediatek,mt8365-eth";
> +			reg = <0 0x112a0000 0 0x1000>;
> +			mediatek,pericfg = <&infracfg>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&topckgen CLK_TOP_ETH_SEL>,
> +				 <&infracfg CLK_IFR_NIC_AXI>,
> +				 <&infracfg CLK_IFR_NIC_SLV_AXI>;
> +			clock-names = "core", "reg", "trans";
> +			status = "disabled";
> +		};
> +
>   		u3phy: t-phy@11cc0000 {
>   			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
>   			#address-cells = <1>;
> 

