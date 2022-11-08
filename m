Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D684CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKWZw8f3KDA3uN1tbZ06k0BAsz8ZmwlT0FyHTdt1NpE=; b=w07k1nJ5Pw9gcMB0h+lLtP+09k
	6BD4F9g4LmRFR8DonRF5oRFuD+Ngqba+bhXHDaHldvCVeo17WLhokB6Y2KRGulUFM/MP9zthiD9Fa
	cb4rReOg4Cbuku0Nh7/agfXf8tm75rQAxW0BV132mZh3IW0mx9YOmzbwIEUUbpN0bxXYhvk6EW7qU
	C6WZuXitWfY6bxEbhU2o/RefO8B6C6meEshG7eOXLZDWUWapV1eKSQ+uS3M5aQQIJsW0VsDVjEGWO
	nH/dx19GWkgKLj1lWqIAS+x87ekqIE2tXMfxiHrk3PnKGWI9rfGKGqlyJviv7R6E287eWirknU6AR
	lytkU6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osN04-004u9T-0k; Tue, 08 Nov 2022 11:42:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMzt-004u5n-1W; Tue, 08 Nov 2022 11:42:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id o4so20557422wrq.6;
        Tue, 08 Nov 2022 03:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKWZw8f3KDA3uN1tbZ06k0BAsz8ZmwlT0FyHTdt1NpE=;
        b=bbFVf4ehELM6Sf47QyuVf6xwC/JS0r6QsJ2HCw/mb0bmmhjKAQDLzV+8W8KaTmtdaU
         WlhROl2mLDodTdp8k93NPp0C+tuU9C1p0oSgUftsOydJiR7kiHjx6bIb9aQuOzTd6laf
         64svrr+CMLf2ylsIPBGZaow3hOQYAIzaKQ0CBFJ1RQrEHYQlje7zUUfRZKm0yu4w98Gn
         FZlfkRhXLjlBnaG08+d4Te61Gg26jLIfN/jY3V1Q7STY9CNL3VhqP2biRHrms8kbCmWc
         2V1/swCWsWbdno/JJuso3OkZOXQ9RNC2gTKl7JWM2Z3Y8B0lxar994olPJQz3r5XZgw9
         7Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKWZw8f3KDA3uN1tbZ06k0BAsz8ZmwlT0FyHTdt1NpE=;
        b=s6Jr3N05IXM1D0mPLqbZLdG1PwstEHI9QPDlxNiF25lLknI0kcQGEP4O1Q2HbpH/iE
         LNcJ1eIbPKYAW8sHkGwi7nzWTxF6cI7ZIM0Tlpt6eR3k3Nn4yVMfIngYFl/OccG8qsg5
         qNZ3yMxNBakl7nVfodSOew/1uFEcEb1ePDtWa2qB9FB9tuS6gtJH8fYVdxvBtTZhetcX
         giMimhXqfKW2nOq0khtFz8cu3NnIsyZ1pxFR7MNPsvLnVq98qzAXVxxa3pRo6Q7uDLcG
         /HyrDUKsf0CUnBunloqvQYazdvXfW9iVAFa9u9q8kbHpxZN7chn0Rp94C9LiAZbC3uOt
         ltjw==
X-Gm-Message-State: ACrzQf2XW545GtYsGpJkiro0UjSLVBgzdvrGcGFht4f09bKUjqs+iPVz
	qu3uw1fuZrRAuMuF5Jb8Eo4=
X-Google-Smtp-Source: AMsMyM5nUdlHaDGjmApV1ZGe5XmH3xwHTqd1fvJFnS1APUmgka76olr6JYvnDs2PnV9JeIF2IMEadg==
X-Received: by 2002:a5d:538c:0:b0:236:a6a5:9cfe with SMTP id d12-20020a5d538c000000b00236a6a59cfemr33267919wrv.121.1667907744110;
        Tue, 08 Nov 2022 03:42:24 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k4-20020adfe3c4000000b0022ccae2fa62sm10188253wrm.22.2022.11.08.03.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 03:42:22 -0800 (PST)
Message-ID: <552e9d45-715a-62dc-09bf-58d565b62837@gmail.com>
Date: Tue, 8 Nov 2022 12:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
 <20221107155825.1644604-13-pierre.gondois@arm.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 12/23] arm64: dts: Update cache properties for mediatek
In-Reply-To: <20221107155825.1644604-13-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_034229_111046_6A7727C0 
X-CRM114-Status: GOOD (  15.64  )
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



On 07/11/2022 16:57, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
> 
> Update the Device Trees accordingly.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>

Applied, thanks,
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 3 +++
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 3 +++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 64693c17af9e..c326aeb33a10 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -198,16 +198,19 @@ cluster_off_b: cluster-off-b {
>   
>   		l2_0: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   			next-level-cache = <&l3_0>;
>   		};
>   
>   		l2_1: l2-cache1 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   			next-level-cache = <&l3_0>;
>   		};
>   
>   		l3_0: l3-cache {
>   			compatible = "cache";
> +			cache-level = <3>;
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6b20376191a7..424fc89cc6f7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -169,16 +169,19 @@ core3 {
>   
>   		l2_0: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   			next-level-cache = <&l3_0>;
>   		};
>   
>   		l2_1: l2-cache1 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   			next-level-cache = <&l3_0>;
>   		};
>   
>   		l3_0: l3-cache {
>   			compatible = "cache";
> +			cache-level = <3>;
>   		};
>   
>   		idle-states {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..cb74905cfbb8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -213,16 +213,19 @@ cluster_off_b: cluster-off-b {
>   
>   		l2_0: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   			next-level-cache = <&l3_0>;
>   		};
>   
>   		l2_1: l2-cache1 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   			next-level-cache = <&l3_0>;
>   		};
>   
>   		l3_0: l3-cache {
>   			compatible = "cache";
> +			cache-level = <3>;
>   		};
>   	};
>   

