Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7194C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoFx71q/N+0qvQAXga+00ibSeehFlmzztyqyJ4eQ8tU=; b=EUcr4I3KAuwc3p
	tauhJvoXr6/rD5/6eL+ytp+XMs4OH/NJBbOqH4Gi/WGrPzwDDAxcc3X+yAAubeUFF2S5lyRLnu9xU
	9OUpoR5sr2M2iVMaFcjhIr+ocMgnvrqoweH5KlhyKW0FYEDLsPWPweDxCfcJCzW56xGCcUW9u2ouw
	qFqZbycoZOeZZv/9eXzSRU/Os85lGj7fmPsQSLd+Xb0O0ahwuCYV/mQ3zATrjVN0f2xxQZ4FCAYbl
	B/oeulfCvSSs+DUq0xEtSYaIFSsEnOPjsSOYmky5gVgt3fcHJ1+4iDvRpP5sWJUPRRFSsjvBPc54s
	IR+ahWClXIHTUOFhS1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxADb-00G8gq-Jv; Mon, 21 Nov 2022 17:04:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxADZ-00G8fV-Qm; Mon, 21 Nov 2022 17:04:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id o30so8939970wms.2;
        Mon, 21 Nov 2022 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoFx71q/N+0qvQAXga+00ibSeehFlmzztyqyJ4eQ8tU=;
        b=SOzH1U73ZCGPIl43YAXV6NsMIfqJufbn/wt/jIDoIOp6GOyDnyNUbweXEzy6k7i/GC
         U7kDF6zkGTZJaKsG8HlSLw6o4jH+zrzamUK2ttsK/v0Ev0UHeFKF0cgO56PL/UfJ/VJq
         P5tegS169frMGQLFONlxqSDw7DKPL4qSX28m2Y8oxjCQK9OaNMfJcmdEA58NrNYCcXMD
         tVeexNRwQNzZfTAaPFiTj34BZsAFgPj6pDjykwWIRKBwlD0kuFXmIK8+OSHKMvwmpdIz
         xqrzkxoEMdn0qCvI3EfBZ+LkJcoeDhsKeEQYm3cS36/rtajPjkuv9RSkbX50qFpzKnan
         569A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NoFx71q/N+0qvQAXga+00ibSeehFlmzztyqyJ4eQ8tU=;
        b=2xSftteKc0UKWhvTlyThykVC2NkKNsVx7KYeCrM0RwKiC5yemO9gGeHjhFrUNNrail
         oQKLxRFSNeAeH/ZmwCMtGrNljCb5ZCPzAYDh6Ceqv3VBmzJwnN3gG6vEkm8Esfuz5c8l
         MapyYqhAr05OG+lQjibky38ifybBPpAkOqB5Q5DFoI5x3NTC1br7GanujCYIPOhFj2lt
         ERDFBcc1sEW/5uPLa+3doVTjCHPSEcDH5EsT7kitQNDsVBinW4n1/3F6Iujah5FQZcCE
         Q3Rn6SNfLA1/I++wUyV4ljjb9N4o2J86wKPuRS1xXNGeBWBBtFwYNds8LBLor7yhfqum
         5A1g==
X-Gm-Message-State: ANoB5plvmSBNWbestdlImCM3o5G2oYx5bplezMuS12+FceGOOc2/VdF3
	ESvUVUnhbENq76fBUGY6V0A=
X-Google-Smtp-Source: AA0mqf7NevCCp2kHDxm/siKILqFB87Rj2TAPdnv2R9chC5DSXsq7GJxVOqlYf2BRJ2sM75AZqf8HGg==
X-Received: by 2002:a05:600c:35c8:b0:3cf:cf89:2f02 with SMTP id r8-20020a05600c35c800b003cfcf892f02mr2889036wmq.2.1669050262379;
        Mon, 21 Nov 2022 09:04:22 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c4ed100b003c701c12a17sm21447872wmq.12.2022.11.21.09.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:04:20 -0800 (PST)
Message-ID: <a257049b-d3a8-e0ac-d887-5bb0420579ad@gmail.com>
Date: Mon, 21 Nov 2022 18:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 01/11] arm64: dts: mt7986: move wed_pcie node
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-2-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221118190126.100895-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_090425_892768_1398A16E 
X-CRM114-Status: GOOD (  15.30  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/11/2022 20:01, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Move the wed_pcie node to have node aligned by address.
> 
> Fixes: 00b9903996b3 ("arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index a22e10e89ab9..afc01abfa99c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -112,6 +112,12 @@ infracfg: infracfg@10001000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		wed_pcie: wed-pcie@10003000 {
> +			compatible = "mediatek,mt7986-wed-pcie",
> +				     "syscon";
> +			reg = <0 0x10003000 0 0x10>;
> +		};
> +
>   		topckgen: topckgen@1001b000 {
>   			compatible = "mediatek,mt7986-topckgen", "syscon";
>   			reg = <0 0x1001B000 0 0x1000>;
> @@ -257,12 +263,6 @@ ethsys: syscon@15000000 {
>   			 #reset-cells = <1>;
>   		};
>   
> -		wed_pcie: wed-pcie@10003000 {
> -			compatible = "mediatek,mt7986-wed-pcie",
> -				     "syscon";
> -			reg = <0 0x10003000 0 0x10>;
> -		};
> -
>   		wed0: wed@15010000 {
>   			compatible = "mediatek,mt7986-wed",
>   				     "syscon";

