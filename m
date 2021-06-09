Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94ECC47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:05:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BA2061285
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BA2061285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i161vVbiHJEIUyOnhiRvDswJmIpMpR8io2aHOxDwsdY=; b=SMybjzqN0nkst/54rwxlDgNmxK
	Ut+Fsng2S59SbReU4Nz6YAUJ9C6qOr79azgm11pNIXgY9MsKcQfnujK9HCnzykrKy0zwk9o8r1JXE
	XMBdq4j+RitJN6gtE5jB6CgbrmmUExUtQOM2Qms/imGyBWeeqom7ykYEBwBr+RuRGRvXg8/a8ETG1
	MpdDoLA+txZlleK7UoZOCNC2NimRDgCHR6JclOGretLRAAzMJ2yOAVTJlFYlbMw1D5cIH3e5D+Qtz
	QO0x1ma3PWO2oJM7a+kvmzfcSZGrqrQqC8gMsXrRiPLwrjG5YB5ojWktW7+tnUPOqsEmYlNtHFkUU
	thjT9jUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqu9B-00CYQX-Uu; Wed, 09 Jun 2021 09:05:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqtLi-00CJq8-8T; Wed, 09 Jun 2021 08:14:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2731389wmc.1; 
 Wed, 09 Jun 2021 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yDejX14cuoEO/H0sRTILaHtqtnRlGOdZIVyLc1gELHM=;
 b=Z77K2BYnb+Go65fwl0un25idVvkqskG0HIPT/qX1xuMGcqLCdmhusQc1pc5IuAIyNE
 zQpyAltc7qofw7NDilEFmZW7m5Dt6YaeUS6eU9gZv5yGLhJQHoewFCy2Fr0UbbKOkkkf
 MU2vNTXoOyRuQgJMRiyn/16ui3KMDj5FIX1xRIqRmTmglVTdZRxYm25qL8XNLUXU0avG
 dQM9XPtgpW0gBBi/Wrh0LoOeOXw5dUQ6Hh94EwF8qUOsiSsEw0K7kqQnMENDL0ooyBup
 n9+0APznaBA1vI7Jca5LrqIFYMbnH0gm47Fx7zZLVzn9qUMZYpYNzxPtJi3wBRG42YZb
 g3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yDejX14cuoEO/H0sRTILaHtqtnRlGOdZIVyLc1gELHM=;
 b=VVV1hU9wBC7w7xuTDuiX4TQSWzkgpUUw1JERcWQ9RwS3w0G2IZU2deoTnAGMkRbPt3
 7vBe1twpeRA1ZMaRmt/StkGXpyMUwiFvsiHwV2S7ghBy87O1KNVbeoyYRQnTh7vRP+eA
 dDnw3XsJGUtrNLYVCcEtQnREv6pTcl6bIzY8iZfw37I8VumMF5WSYy3lJhMwJM7pKSsC
 KAQ5SEv2Zm/F+WmFTtpjBq2HNXXzABtH6yA91QciaulpXhhMhn5xCCbSDXaPSu8sZt0g
 XIP5ICXuhrussA7u0uxwdaj6H+F6ASmGQ3tC+x8BQr+mOAq1BcnSPnlB3NiBhSWj3jx4
 4avA==
X-Gm-Message-State: AOAM531yENK4lw8XVTsp3FKTSSnESPz+lmk5G3uCcn9f3+X+8dvHJg3L
 MFFKMn31U3E7CejkE77Rs3EKhvd3JsY=
X-Google-Smtp-Source: ABdhPJxf7dhagIxY/xwnJJ5qRNr31sHti4hpeyNOyE/mNhLkwm1Lwdkn+cVNJ4Mcw+uIV+cdMplYBg==
X-Received: by 2002:a05:600c:3393:: with SMTP id
 o19mr8623579wmp.163.1623226444421; 
 Wed, 09 Jun 2021 01:14:04 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id n13sm25862628wrg.75.2021.06.09.01.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 01:14:03 -0700 (PDT)
Subject: Re: [PATCH v3] arm64: dts: mt8183-kukui: Add tboard thermal zones
To: Ben Tseng <ben.tseng@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>
References: <20210604093755.13288-1-ben.tseng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4b94148e-f52b-c8a0-d068-2b7b65f61240@gmail.com>
Date: Wed, 9 Jun 2021 10:14:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210604093755.13288-1-ben.tseng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_011406_368651_9989661F 
X-CRM114-Status: GOOD (  20.64  )
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



On 04/06/2021 11:37, Ben Tseng wrote:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add tboard thermal zones.
> The tboard thermal sensors are a kind of NTC sensors which are located
> on PCB board to correlate the temperature of the case (Tskin).
> 
> pull-up voltage: 1800 mv
> pull-up resistor: 75K
> 
> Vsense = pull-up voltage * Rntc / ( pull-up resistor + Rntc )
> AuxIn = Vsense * 4096 / 1500
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> 

Applied to v5.13-next/dts64

Thanks!

> ---
> Change in v3:
>         - Modify Tboard to tbaord in mt8183-kukui.dtsi
>         - Add more description about tboard thermal sensor
> 
> Change in v2:
>         - Rebase to kernel-v5.13-rc1
>         - Resend
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcf..601f866 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -847,6 +847,20 @@
>  	status = "okay";
>  };
>  
> +&thermal_zones {
> +	tboard1 {
> +		polling-delay = <1000>; /* milliseconds */
> +		polling-delay-passive = <0>; /* milliseconds */
> +		thermal-sensors = <&tboard_thermistor1>;
> +	};
> +
> +	tboard2 {
> +		polling-delay = <1000>; /* milliseconds */
> +		polling-delay-passive = <0>; /* milliseconds */
> +		thermal-sensors = <&tboard_thermistor2>;
> +	};
> +};
> +
>  &u3phy {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b..4173a5d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -673,7 +673,7 @@
>  			nvmem-cell-names = "calibration-data";
>  		};
>  
> -		thermal-zones {
> +		thermal_zones: thermal-zones {
>  			cpu_thermal: cpu_thermal {
>  				polling-delay-passive = <100>;
>  				polling-delay = <500>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
