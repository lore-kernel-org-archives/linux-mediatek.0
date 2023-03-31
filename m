Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA7DC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZU9pqSmJFWScbRHErpBRLTTVYGZxJgYc6ooM9EOJFo=; b=nOkp3gIVISl/6QBMgDNIhwzuAN
	e3lkzrfqeagN1oLasfdd+bCXq9Bi/+EZcnlWfSkFhjSzkn+bW7iBJB7/2xJHu61+ptU/IFGcNzPYY
	n4sCeQoJlb4DGAXgUOnShFk5L3++GaWsG2TB6DoMaCDFLKZcjaS+fMpCIvuG4E6SwS7h8Iqu4l+cN
	Ntwzac+7YAP6yNWLo9u3cfe+xBomVkBKfD98GsnAdb1P8smo3bVjfdJGPV98/KX4uPdlAn0jcdKjN
	wvTvwhWphh7q6tT/5P2pwYH6HqiSi4PDg0nOQgLc4HAx9ALt+SUiFFZ56M95iPvgbz9iD3R39DU4j
	ZU21EpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCQz-0070pU-1N;
	Fri, 31 Mar 2023 10:56:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCQw-0070oH-1p
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 10:56:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so9617428wms.5
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 03:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680260195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZU9pqSmJFWScbRHErpBRLTTVYGZxJgYc6ooM9EOJFo=;
        b=a5YYtQaitITpatbAMwu7SUclPfEBUIKxeJhiA0fQkPl/XebHkXu+q2il+sMxop645y
         kmaXkz15ka80OmpIypiZDmZaRhmt6QgYfRwiSkMjegbxDEjVU9VTl4BUbXtPT4i2CeUb
         PM1BVBi1vjuWl4QezZ+0e6aUa9klF9U2MVlwgIfiqSbXPm7bwCd+7zcsBkkoyxEVkny/
         ocY6y5CLUOq/fK1Jl0b/3bVAJB23LnobybPaEQBgRilZFyd2XqaKpRGFhY76y0Vi7llm
         pqVD5DuWTSsLfPT9tIsCZMkkWelCDqlOy/nSJMAUv6o4l3Hp4g9L97BYFbN36ae+4YfY
         Q5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680260195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZU9pqSmJFWScbRHErpBRLTTVYGZxJgYc6ooM9EOJFo=;
        b=QJzGGAG+8O7iuwxlICqhGg9ZLnNkA8qQdjP2MSN7VgZoj1GsKhJIP/5DktwvnCD/ym
         G0TWn/w3tLVB3qh6ydFqxl3xJOKX+8N13NcWcAPnMnSp1HCbc4hC7ezaTiCZu0UDHxL6
         SRZdlCKdPOu4+CaYr91tcyz56fnKBye9CIyQ8Oci1oGBxNzwGWUafE9VasoJPGtNWhjW
         8chAGoEwET5OzygsM//wgqlmlgTsTb/HMuP6v8AxoOzJSblGueRA6ul/7NvlevZ8GeUh
         zhUlkSXLHo68zDEu20ifwUPepK5C/IdU6QY4c7g4AYWd4hTWEx9gRx5LeTlQ1GpOpLX8
         7QHQ==
X-Gm-Message-State: AO0yUKXtY6dH54VNLzQ5dHlfEV+whIOM8rLTv5s36GaKV7rPJdeQXeTa
	5qlODx0CK6jhTPq3BONFu7w=
X-Google-Smtp-Source: AK7set8h2IuPF/9IdjhnSRSd7WIlTiiKTDb6jgTDgpp76wEIcv6kA5w6f0BVtbmp63oifX4/aE3nCw==
X-Received: by 2002:a7b:c853:0:b0:3ed:ca62:418e with SMTP id c19-20020a7bc853000000b003edca62418emr19677202wml.9.1680260194637;
        Fri, 31 Mar 2023 03:56:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q3-20020a05600c46c300b003ebf73acf9asm16683148wmo.3.2023.03.31.03.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:56:33 -0700 (PDT)
Message-ID: <68a51c57-ba63-94c3-3ca3-f7d4ab4984ae@gmail.com>
Date: Fri, 31 Mar 2023 12:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next 10/10] arm64: dts: mt7986: move dlm in a
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
 <d74e38de00ad1b858b59a7ef6cb02321b0faf750.1679330630.git.lorenzo@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <d74e38de00ad1b858b59a7ef6cb02321b0faf750.1679330630.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_035638_606959_E88D6311 
X-CRM114-Status: GOOD (  13.84  )
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
> Since the dlm memory region is not part of the RAM SoC, move dlm in a
> deidicated syscon node.
> This patch helps to keep backward-compatibility with older version of
> uboot codebase where we have a limit of 8 reserved-memory dts child
> nodes.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 30 ++++++++++++-----------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index a0d96d232ee5..0ae6aa59d3c6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -93,16 +93,6 @@ wo_data: wo-data@4fd80000 {
>   			reg = <0 0x4fd80000 0 0x240000>;
>   			no-map;
>   		};
> -
> -		wo_dlm0: wo-dlm@151e8000 {
> -			reg = <0 0x151e8000 0 0x2000>;
> -			no-map;
> -		};
> -
> -		wo_dlm1: wo-dlm@151f8000 {
> -			reg = <0 0x151f8000 0 0x2000>;
> -			no-map;
> -		};
>   	};
>   
>   	timer {
> @@ -444,10 +434,11 @@ wed0: wed@15010000 {
>   			reg = <0 0x15010000 0 0x1000>;
>   			interrupt-parent = <&gic>;
>   			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> -			memory-region = <&wo_emi0>, <&wo_dlm0>, <&wo_data>;
> -			memory-region-names = "wo-emi", "wo-dlm", "wo-data";
> +			memory-region = <&wo_emi0>, <&wo_data>;
> +			memory-region-names = "wo-emi", "wo-data";
>   			mediatek,wo-ccif = <&wo_ccif0>;
>   			mediatek,wo-ilm = <&wo_ilm0>;
> +			mediatek,wo-dlm = <&wo_dlm0>;
>   			mediatek,wo-cpuboot = <&wo_cpuboot>;
>   		};
>   
> @@ -457,10 +448,11 @@ wed1: wed@15011000 {
>   			reg = <0 0x15011000 0 0x1000>;
>   			interrupt-parent = <&gic>;
>   			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> -			memory-region = <&wo_emi1>, <&wo_dlm1>, <&wo_data>;
> -			memory-region-names = "wo-emi", "wo-dlm", "wo-data";
> +			memory-region = <&wo_emi1>, <&wo_data>;
> +			memory-region-names = "wo-emi", "wo-data";
>   			mediatek,wo-ccif = <&wo_ccif1>;
>   			mediatek,wo-ilm = <&wo_ilm1>;
> +			mediatek,wo-dlm = <&wo_dlm1>;
>   			mediatek,wo-cpuboot = <&wo_cpuboot>;
>   		};
>   
> @@ -488,6 +480,16 @@ wo_ilm1: syscon@151f0000 {
>   			reg = <0 0x151f0000 0 0x8000>;
>   		};
>   
> +		wo_dlm0: syscon@151e8000 {
> +			compatible = "mediatek,mt7986-wo-dlm", "syscon";
> +			reg = <0 0x151e8000 0 0x2000>;
> +		};
> +
> +		wo_dlm1: syscon@151f8000 {
> +			compatible = "mediatek,mt7986-wo-dlm", "syscon";
> +			reg = <0 0x151f8000 0 0x2000>;
> +		};
> +
>   		wo_cpuboot: syscon@15194000 {
>   			compatible = "mediatek,mt7986-wo-cpuboot", "syscon";
>   			reg = <0 0x15194000 0 0x1000>;

