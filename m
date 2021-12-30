Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIua/lq/CTL5QMfs9qY0SfHqONbxHkc4NDQj8c2n+Ow=; b=Beu/5J59rMKttX
	sPV6ToxKzmjfZ9wclHsQqELvTQKUE2ETjKsLFdAZz46ElcNjQPoVyhX9CNg8ld8be10lyK0iIA+a4
	2OtO9c/LFK/J9ZEV4Ac6zLzAqwhY7bnpW/kg1dwXALyny9FegGyrf6UzuA5LnMuPq0baoxNhIm0Pi
	ciyJL1+CSZA13gKwXUZq1HY6Ur0p6Gua8I9Wyc8OvilKZf9B6+y47ABm+zKiqPmLhvrwZ6QHNshmS
	6Ffh3nu4ojqQ8SUCAfBatK7VOlUBwxWSc7pP42+t6nY1L1MD5E4VdqYBGzVQYvX1qteHiXvtttTX3
	+02uZZMGf7GVb3uqR42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2uxR-004PYI-V9; Thu, 30 Dec 2021 12:55:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2uxD-004PUm-SR; Thu, 30 Dec 2021 12:54:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id i22so50226132wrb.13;
 Thu, 30 Dec 2021 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YFsE9Hzd6Rw74/QWXyvFaT9SGHT235vGJZ7VH+X9Vqg=;
 b=j1/mXzn1nmea5RST1mMajHuWCuVWhRqN+Lg+syW8EQjxxsP+3z/R93jwf8vgZWbZsm
 OcuVJ9XUPFPEAU9OtCF+ZwU71OGyQMuKXNmj1Jk9ebfSFlPExhHPMigoSVaJforhf6qJ
 MSrs2D6cozE43KuJe0O/r6SMBFCRBNmFMatKgoEH7XYm3mCx1BNX77iTI1GUfR0p3gq4
 tvNKAQZL15557qK/KTsRBQpJFU/bA6CtoGsG0s1HKrGsDf+LMsoSvwqw8ZP6GhC+jaNe
 hzqABqGTxll+o+q2ZW6rBTvjBRH1TaQ20zt2ZjIiL9k2BhLcnof9T1QFjiAB6uUXAa6m
 I6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YFsE9Hzd6Rw74/QWXyvFaT9SGHT235vGJZ7VH+X9Vqg=;
 b=uLs1UcE5hTcJElHO2GtiUs+sWJyac8ZzaQ5foOiQuDdqh8MHNbg3MarJXwUb6YBKat
 EqIMfx92TcsGPWDfcsVEwBK9LdQyaGntNBvala0743mGhWoqWUv+8hRaPYmKk5QCZU12
 CUlv6zAxUtkI2dBlgR2vnpOgdH2N5qJkPQS6xVAsDDdsr7NNbK90MG+cAGEYtMSuLOn+
 9b+8ldJRxAoJyEUPkkWPFOi+0x4r41CiF3+MMApl/wbhidpAVxbH611HdMoEayBiEp5N
 LVtXS9T1iJwP+HxVxVuBMYrrfaSGjrZfEqgTmIL5mep91v6vXssb3kbiL9X9aNEd5FA7
 YgTw==
X-Gm-Message-State: AOAM532JHYOVV1qjw8M95Awp+1RwSTyXAx4bq+2jameoSN2V1VAerA/E
 7kSKPsaCr2FgRIJ69r3EB0pnNcKGX/nlVg==
X-Google-Smtp-Source: ABdhPJzPDe29tdWKwhekT4d7Z3/ncbk+zLexQx66U+rHmm1/X9HvJuKxKAeY5PKXovwjJaFWy4VXjw==
X-Received: by 2002:a5d:6b8f:: with SMTP id n15mr24876182wrx.189.1640868886447; 
 Thu, 30 Dec 2021 04:54:46 -0800 (PST)
Received: from [192.168.1.145] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id j3sm23485981wrt.14.2021.12.30.04.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 04:54:45 -0800 (PST)
Message-ID: <20cf2c1e-d55b-5780-8c6e-4d8beaca5a65@gmail.com>
Date: Thu, 30 Dec 2021 13:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v16 2/7] arm64: dts: mt8183: add svs device information
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-3-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210428065440.3704-3-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_045447_963791_9DAB0127 
X-CRM114-Status: GOOD (  14.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/04/2021 08:54, Roger Lu wrote:
> add compitable/reg/irq/clock/efuse setting in svs node
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 80519a145f13..441d617ece43 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -657,6 +657,18 @@
>   			status = "disabled";
>   		};
>   
> +		svs: svs@1100b000 {
> +			compatible = "mediatek,mt8183-svs";
> +			reg = <0 0x1100b000 0 0x1000>;
> +			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&infracfg CLK_INFRA_THERM>;
> +			clock-names = "main";
> +			nvmem-cells = <&svs_calibration>,
> +				      <&thermal_calibration>;
> +			nvmem-cell-names = "svs-calibration-data",
> +					   "t-calibration-data";
> +		};
> +
>   		pwm0: pwm@1100e000 {
>   			compatible = "mediatek,mt8183-disp-pwm";
>   			reg = <0 0x1100e000 0 0x1000>;
> @@ -941,9 +953,15 @@
>   			reg = <0 0x11f10000 0 0x1000>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;

Please add a new line between the different calibartion data, to improve 
readability.

Regards,
Matthias

> +			thermal_calibration: calib@180 {
> +				reg = <0x180 0xc>;
> +			};
>   			mipi_tx_calibration: calib@190 {
>   				reg = <0x190 0xc>;
>   			};
> +			svs_calibration: calib@580 {
> +				reg = <0x580 0x64>;
> +			};
>   		};
>   
>   		u3phy: usb-phy@11f40000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
