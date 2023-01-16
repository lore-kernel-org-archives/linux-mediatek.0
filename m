Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C321C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4ymnYKhsS5iGv9bsc4wQY9ntYFsPX+jp5KzAaLzQD4=; b=3KmmuCPZjDLUf1Hj1fVTOnCnC4
	Bag4QXP/VUL8N3s1XKbS7E6epx1UOnSKu6Xxfcx2LkPF5DIbvxpIeuMekaJIaHSVGFokdw8YB2SD7
	TfQK3iZ92VKwpwtPniBcn0D2TJmJXvr4ZP2jEG+K+2lCzgvTjUfzWm6VMjqFbKKCcYD0XrCSQBOHq
	LDruqSXIc14u+v0isQnYGRHZqsffSsEGmg4vErdo63ahQVtXQ+sTUUByNFt1hrQqtrBsCoS3fseGi
	9qfaD/zwloEA2zZsUiKS0gJ4u+/QaDWGQkqzXxUPmRP3sj1XrN2S05K89L+aqz0uSqQ9Dyntjinfw
	zFASFwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKag-0097TB-IJ; Mon, 16 Jan 2023 08:11:38 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKac-0097RK-Hg
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 08:11:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id az20so47072909ejc.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jan 2023 00:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4ymnYKhsS5iGv9bsc4wQY9ntYFsPX+jp5KzAaLzQD4=;
        b=xWuVPpbqSPdKQoVpn+evZUOz92Ak0AkA2LERHD4T1TTO28wKqxKz+bFsrqX98liYZF
         fjdr/eMRiJVOss4qNo+G76S+TTDHjGBMM9DAuvnm/GGJXfjrJ2xlUz4kP4qXGxN53s1E
         xFiK8JauJxOfzcqUK9wQa7qzhLMDUhDg3XV+CdjZdxKNUmvOxI+jzq2UWgRk29a7NuPj
         GdTdXacEmxT4M5N/oSjUAtwyz8dEkrKFRW5gRpVnQLX9ijd6jRxMDH9pfuedkr2TGG9M
         yP+FmlEeTcD+UhTP+xPqLIVtLJegrmApSkNpggApjFjAVpWpcQckA+yT6lT5BlqVB4SF
         ta2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4ymnYKhsS5iGv9bsc4wQY9ntYFsPX+jp5KzAaLzQD4=;
        b=yV+6aX6B0Gm2P4uWM1QKQWMY9eQ8GkMEH/1zWNHsyzVi9Y/qPzkAhqC3Cv8WH2rqKx
         FDAyQpOFxUJ4g5Au7UCZB8DIpqK7uh9YizredNK4SDfWeEWnmWo2hDZHQoW/NNIg/qqZ
         JpFCekCOCbYCe+7gDhYgK0/Jzw6q2Dea8YwKKYAdLUFxPU0giAAh10hU2zyR0bOwp1QU
         cjyIzQMmaD4FBEcXkkWpKD2FOA3fkppQQkb9qbKTBkobfX40uxPGkzRVdTq0PyMh8tzR
         V8n02IJtRsII4xjmAfMVVGhMzKcv0JWkXDg96Dl+auDLHpTCxCH1kfXEElo4pvGV/9xt
         ncCQ==
X-Gm-Message-State: AFqh2ko96QmoQD4ifx9p4XDjgeI28AJGa5yrG7RcFfucTRkcSEPmcuBe
	QD7Frez5W3cToBnsyViNXv6AxA==
X-Google-Smtp-Source: AMrXdXsBdP72AkcKF65oxwlJ7ZJRCVcEpKDcRDmYVyokU253P4At6lvgwyuEbeN/2E/ruNFGCMa3rQ==
X-Received: by 2002:a17:906:b00d:b0:7c1:8ba6:6eb3 with SMTP id v13-20020a170906b00d00b007c18ba66eb3mr81757639ejy.35.1673856692269;
        Mon, 16 Jan 2023 00:11:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v18-20020aa7cd52000000b0047eeaae9558sm3158160edw.60.2023.01.16.00.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 00:11:31 -0800 (PST)
Message-ID: <63f3d41a-1aa3-396a-b515-bc805f4a19b4@linaro.org>
Date: Mon, 16 Jan 2023 09:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND v3 02/13] arm64: dts: mediatek: mt8195: add MDP3 nodes
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230116032147.23607-1-moudy.ho@mediatek.com>
 <20230116032147.23607-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116032147.23607-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_001134_631052_9461F69D 
X-CRM114-Status: GOOD (  13.29  )
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

On 16/01/2023 04:21, Moudy Ho wrote:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 420 +++++++++++++++++++++++
>  1 file changed, 420 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 206dd534c3f6..d2d1ba71222d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1706,6 +1706,133 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		mdp3-rdma0@14001000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

0 is definitely not generic

Isn't this dma-controller? or if not then just rdma?

> +			compatible = "mediatek,mt8195-mdp3-rdma";
> +			reg = <0 0x14001000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
> +					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>,
> +					<&spm MT8195_POWER_DOMAIN_VPPSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L4_MDP_RDMA>,
> +				 <&iommu_vpp M4U_PORT_L4_MDP_WROT>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>,
> +				 <&topckgen CLK_TOP_CFG_VPP0>,
> +				 <&topckgen CLK_TOP_CFG_26M_VPP0>,
> +				 <&vppsys0 CLK_VPP0_WARP0_ASYNC_TX>,
> +				 <&vppsys0 CLK_VPP0_WARP0_RELAY>,
> +				 <&vppsys0 CLK_VPP0_WARP0_MDP_DL_ASYNC>,
> +				 <&vppsys0 CLK_VPP0_WARP1_ASYNC_TX>,
> +				 <&vppsys0 CLK_VPP0_WARP1_RELAY>,
> +				 <&vppsys0 CLK_VPP0_WARP1_MDP_DL_ASYNC>,
> +				 <&vppsys0 CLK_VPP0_VPP02VPP1_RELAY>,
> +				 <&vppsys1 CLK_VPP1_DL_ASYNC>,
> +				 <&vppsys1 CLK_VPP1_VPP0_DL_ASYNC>,
> +				 <&vppsys1 CLK_VPP1_VPP0_DL_RELAY>,
> +				 <&vppsys0 CLK_VPP0_VPP12VPP0_ASYNC>,
> +				 <&vppsys1 CLK_VPP1_VPP0_DL1_RELAY>,
> +				 <&vppsys1 CLK_VPP1_SVPP2_VDO0_DL_RELAY>,
> +				 <&vppsys1 CLK_VPP1_SVPP3_VDO1_DL_RELAY>,
> +				 <&vppsys1 CLK_VPP1_SVPP2_VDO1_DL_RELAY>,
> +				 <&vppsys1 CLK_VPP1_SVPP3_VDO0_DL_RELAY>;
> +			mboxes = <&gce1 12 CMDQ_THR_PRIO_1>,
> +				 <&gce1 13 CMDQ_THR_PRIO_1>,
> +				 <&gce1 14 CMDQ_THR_PRIO_1>,
> +				 <&gce1 21 CMDQ_THR_PRIO_1>,
> +				 <&gce1 22 CMDQ_THR_PRIO_1>;
> +		};
> +
> +		mdp3-fg0@14002000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

"0" suffix is definitely nothing generic. Drop such suffixes everywhere.
Drop also "mdp3" prefix everywhere.


Best regards,
Krzysztof


