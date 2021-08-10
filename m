Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1C0C4320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:53:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC7160ED8
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DC7160ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8OMABzCQxvmgKgDEDt5ZgzrH9Cqz1oUilQ1OPX+XTxI=; b=aE/0eVKPAqI76vPO0r9x+IO5rW
	sCfCbc9zTUzLnF3Hq/M6k1oyJzVCD1TZQtjanj5fU29G4MHvWEL7ICHN/IToaA87twkdCh6V7Faq7
	7c+sr1S6KGg+iZSn3uUlAAK7cE0ds6B1YM4lffsaHmJhTcalG2fhzluxZFMb3RlPeHMfOk/a6WSAH
	1nVm+bJpi555ZRvqzGAvCkjGdhKn1sJnqCdZS0KazO19I63yr1yoiHy+pW506fQYIOwxc2SZkkCmT
	c6Cz8PTZsRdb5QQbYEWg7c4bhLSE2LjliulRTCfqW5NzBGtFNRZ7DqoGPqQUID7FOjkvPiQkn/w3z
	8jgaTAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNVr-003ARJ-FE; Tue, 10 Aug 2021 08:53:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNV6-003AAm-1B; Tue, 10 Aug 2021 08:52:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id i4so7735542wru.0;
 Tue, 10 Aug 2021 01:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YgAuxuU+h/XIrythtI0Ok15glLpfmuhqh3ISQ0rCYXI=;
 b=kYuUmXzNmh4iMRRrDFnX6eGFRlyRVIY66rtAVqIlCv6sCqs5zgnJXLug7FE2zWp6Y7
 Y48riTTJAQLRN+Ygt/VJlTJmZ+fVKXToiCfiZfnUojtwA3xSI1JmfHWoUmjlDk6mvEb5
 RWrD+B/1Abr7YmRgUAv08Xx4bqnCAGzmvUaQegbLAxvfhp9F0CfIh1D8qZ5XWtH4rF2C
 Roup/1S7dGGU+BggzWR+AUoUY5zHyeHjBDSgE8ueQ0PLX6d2m9abLXzD0qFntuaMzYa4
 5hGbYOyeSNb7sPJfJCb35QVjnTFzM8cZC/uA6THoxZVb2veLKeQfbF9KWdfYeaU21XF+
 mYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YgAuxuU+h/XIrythtI0Ok15glLpfmuhqh3ISQ0rCYXI=;
 b=KnFDYbKhfP2/6Jaue62GphtP+BazG7qxdh3P3qEPLqBQ5cXPDcHMLNDfekK3eCQ4nl
 fEbOITiY+pi3lXfzN/9kKt5OrNIq8cunyymJTxVY3dbsjwx338NO2cBu9eW640bM7Byn
 ADk/xnz6tbjtd9k7pFxX4riyOtCIW3hyQYfCoy/XowVNKQNRqCiYFoE9EQyx98gHUqRv
 MRw3DmmfGLJ81T/+gIAGapPWFQfyrU/dxati3r8xAA+JcRZZ177M7SQALN1y/aw6w4Td
 GilLplKn/fJy8js4qU06ZSzfCTsZT7YOxnOTI3up7dDP+T/dglcEVqDLdpvXOaL6rc3J
 T9jQ==
X-Gm-Message-State: AOAM533oxquMvjLC1ObPLE4FmrBKHnMumYD1XYmlRTwCLyqOU+pLiTRW
 bD3kHHmcPOYSAmpNjujpdh0=
X-Google-Smtp-Source: ABdhPJxysmPOIrQySNCpzVGQKxo0wFr0pvKL4Ts5xHiBNLFbH0RnbxLdYee4XXCNJV1kQvqgY4b/6g==
X-Received: by 2002:adf:d083:: with SMTP id y3mr11445963wrh.56.1628585562196; 
 Tue, 10 Aug 2021 01:52:42 -0700 (PDT)
Received: from ziggy.stardust ([207.188.163.204])
 by smtp.gmail.com with ESMTPSA id p1sm218117wmq.48.2021.08.10.01.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:52:41 -0700 (PDT)
Subject: Re: [v6 1/2] arm64: dts: mediatek: Add mt8192 clock controllers
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210727023205.20319-1-chun-jie.chen@mediatek.com>
 <20210727023205.20319-2-chun-jie.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4517664b-7dd5-c338-69a9-86d0b6828f14@gmail.com>
Date: Tue, 10 Aug 2021 10:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727023205.20319-2-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_015244_175636_1183A811 
X-CRM114-Status: GOOD (  16.91  )
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



On 27/07/2021 04:32, Chun-Jie Chen wrote:
> Add clock controller nodes for SoC mt8192
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Applied to v5.15-tmp/dst64

Please help making patch 2/2 better, adding clocks to all nodes.

Thanks a lot!
Matthias

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 163 +++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 9757138a8bbd..c7c7d4e017ae 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -5,6 +5,7 @@
>   */
>  
>  /dts-v1/;
> +#include <dt-bindings/clock/mt8192-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> @@ -257,6 +258,24 @@
>  			};
>  		};
>  
> +		topckgen: syscon@10000000 {
> +			compatible = "mediatek,mt8192-topckgen", "syscon";
> +			reg = <0 0x10000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		infracfg: syscon@10001000 {
> +			compatible = "mediatek,mt8192-infracfg", "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pericfg: syscon@10003000 {
> +			compatible = "mediatek,mt8192-pericfg", "syscon";
> +			reg = <0 0x10003000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		pio: pinctrl@10005000 {
>  			compatible = "mediatek,mt8192-pinctrl";
>  			reg = <0 0x10005000 0 0x1000>,
> @@ -282,6 +301,12 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> +		apmixedsys: syscon@1000c000 {
> +			compatible = "mediatek,mt8192-apmixedsys", "syscon";
> +			reg = <0 0x1000c000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		systimer: timer@10017000 {
>  			compatible = "mediatek,mt8192-timer",
>  				     "mediatek,mt6765-timer";
> @@ -291,6 +316,12 @@
>  			clock-names = "clk13m";
>  		};
>  
> +		scp_adsp: clock-controller@10720000 {
> +			compatible = "mediatek,mt8192-scp_adsp";
> +			reg = <0 0x10720000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		uart0: serial@11002000 {
>  			compatible = "mediatek,mt8192-uart",
>  				     "mediatek,mt6577-uart";
> @@ -311,6 +342,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_c: clock-controller@11007000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_c";
> +			reg = <0 0x11007000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		spi0: spi@1100a000 {
>  			compatible = "mediatek,mt8192-spi",
>  				     "mediatek,mt6765-spi";
> @@ -436,6 +473,12 @@
>  			status = "disable";
>  		};
>  
> +		audsys: clock-controller@11210000 {
> +			compatible = "mediatek,mt8192-audsys", "syscon";
> +			reg = <0 0x11210000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c3: i2c3@11cb0000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11cb0000 0 0x1000>,
> @@ -449,6 +492,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_e: clock-controller@11cb1000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_e";
> +			reg = <0 0x11cb1000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c7: i2c7@11d00000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11d00000 0 0x1000>,
> @@ -488,6 +537,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_s: clock-controller@11d03000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_s";
> +			reg = <0 0x11d03000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c1: i2c1@11d20000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11d20000 0 0x1000>,
> @@ -527,6 +582,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_ws: clock-controller@11d23000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_ws";
> +			reg = <0 0x11d23000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c5: i2c5@11e00000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11e00000 0 0x1000>,
> @@ -540,6 +601,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_w: clock-controller@11e01000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_w";
> +			reg = <0 0x11e01000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c0: i2c0@11f00000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11f00000 0 0x1000>,
> @@ -565,5 +632,101 @@
>  			#size-cells = <0>;
>  			status = "disabled";
>  		};
> +
> +		imp_iic_wrap_n: clock-controller@11f02000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_n";
> +			reg = <0 0x11f02000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		msdc_top: clock-controller@11f10000 {
> +			compatible = "mediatek,mt8192-msdc_top";
> +			reg = <0 0x11f10000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		msdc: clock-controller@11f60000 {
> +			compatible = "mediatek,mt8192-msdc";
> +			reg = <0 0x11f60000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mfgcfg: clock-controller@13fbf000 {
> +			compatible = "mediatek,mt8192-mfgcfg";
> +			reg = <0 0x13fbf000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mmsys: syscon@14000000 {
> +			compatible = "mediatek,mt8192-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys: clock-controller@15020000 {
> +			compatible = "mediatek,mt8192-imgsys";
> +			reg = <0 0x15020000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys2: clock-controller@15820000 {
> +			compatible = "mediatek,mt8192-imgsys2";
> +			reg = <0 0x15820000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys_soc: clock-controller@1600f000 {
> +			compatible = "mediatek,mt8192-vdecsys_soc";
> +			reg = <0 0x1600f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys: clock-controller@1602f000 {
> +			compatible = "mediatek,mt8192-vdecsys";
> +			reg = <0 0x1602f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vencsys: clock-controller@17000000 {
> +			compatible = "mediatek,mt8192-vencsys";
> +			reg = <0 0x17000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys: clock-controller@1a000000 {
> +			compatible = "mediatek,mt8192-camsys";
> +			reg = <0 0x1a000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_rawa: clock-controller@1a04f000 {
> +			compatible = "mediatek,mt8192-camsys_rawa";
> +			reg = <0 0x1a04f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_rawb: clock-controller@1a06f000 {
> +			compatible = "mediatek,mt8192-camsys_rawb";
> +			reg = <0 0x1a06f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_rawc: clock-controller@1a08f000 {
> +			compatible = "mediatek,mt8192-camsys_rawc";
> +			reg = <0 0x1a08f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		ipesys: clock-controller@1b000000 {
> +			compatible = "mediatek,mt8192-ipesys";
> +			reg = <0 0x1b000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mdpsys: clock-controller@1f000000 {
> +			compatible = "mediatek,mt8192-mdpsys";
> +			reg = <0 0x1f000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
>  	};
>  };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
