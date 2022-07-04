Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1249C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x880kuS6PNUF918Mktd1de/5BgyubBGYBWa3z9pZQa8=; b=H6fuEb+Pt1klRdAC80M1JHDeSn
	fPJxhLG1ZvB+t8ktg7SslVqUTQYiPnt5X98tKNnIk27N+wdG71S9FKO76VrLDRmZFA8CbaV/MMjQ4
	4Gr+FMG7ZmMNxiX2zKdbOA6wV9bE81PeIMIQUUQ7onIItCAMb8jgbuRS67W6snTt6nqcaDHYi7zqo
	nQBHVeb4XxO0Jy1aQHmOW7zUQ4vKE4Kaas0SA7L2n5bj4mSbwbTVr08FuKeE9wuNiKxOWC3a+rJ5e
	CFklw3wLR+TwMSbVNAiKfA2oyR1xkMvbBoG/5Z8mQaZn4bIoGP8CagnT6sseEBBgzn7AfTv/5KQS9
	2pzW+iKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8LMp-008qX8-Lm; Mon, 04 Jul 2022 12:39:55 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8LMm-008qSn-Iz
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 12:39:54 +0000
Received: by mail-lj1-x235.google.com with SMTP id a39so10904463ljq.11
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 05:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x880kuS6PNUF918Mktd1de/5BgyubBGYBWa3z9pZQa8=;
        b=Q1X8I1wKoipJvnCB/pUw1wiyXOfTGXV/Nce3Mgckmw5ubtkVsRjwxbMsqpkJm3xiEv
         +CvpKh3gKUq0c8sZYrc06FqHc7ANjERfslK4wf8ysBEN+unfPS0eA773kfKt4Af2FpaW
         R7LjUDuBKj8FRN4n+KdITPsrCdWA25m+GGLpGzelaTKyLPFTxD08NdWl7/+f1g0Zn+kO
         kRzfaeEbMcE8Ut6YeIYVUR0tSWxf6wzAR9qzveYFBRykOGJxwesuJsx/xyPMybmhfvj5
         efN3SuCztUGrs4cxI/7g9tbEBiQo1p4AfDn2w7oOuFhtYOkf5n9LhBsdoPhlr9n+yTN6
         XGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x880kuS6PNUF918Mktd1de/5BgyubBGYBWa3z9pZQa8=;
        b=P56XHls2ty15dE8XEtZD2L7tMrvwXTCH8+jOFyO8B/f5pKvkv1n3Sndt3F5wCIymPY
         RDvAe9QNl1U71NDrq6k8GtifzloeS232FqPfcUCJrzEfD5cu1UxS39aZ21W/p5CFlEIo
         GTsWvLTdclrnMECyYZhmxwHvflEgKvAwf3YICbP3Rh9fh1xn2zq8/41rpfeVIR8HQzjO
         RSAJR/wCIMpn9ZiqCJh5xv69CE/prsSKP2HftR6CH64cZEzz1tRTCHs3q5sIC4MCAn5Z
         cGp0Jtc8Mlb+21pjZEWJEpUNXdkGlaEbit5ZhMI69IdVZop9nSjtIHqBmcVukyRKJ3zl
         Rfxw==
X-Gm-Message-State: AJIora9xfB9J5fbBhzHv+Eb2HQYeNW94TtJvJrzGP6tgRV+EBAwjJsmB
	5D57UfjyNTypVstq6A7Zr7H1Tw==
X-Google-Smtp-Source: AGRyM1vqUXvSAsn7AogRlPoSUu3j3CYCJPTYiSe4MRhkAljhqJZmpSrBqVZa8ahYb+Kd5xySXteurQ==
X-Received: by 2002:a2e:730b:0:b0:25c:63cf:1ffd with SMTP id o11-20020a2e730b000000b0025c63cf1ffdmr8410032ljc.208.1656938388417;
        Mon, 04 Jul 2022 05:39:48 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id p11-20020a056512234b00b0047f6b4a53cdsm5104577lfu.172.2022.07.04.05.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 05:39:47 -0700 (PDT)
Message-ID: <27c8f7b1-c308-89c2-54be-2d6c1a5527b8@linaro.org>
Date: Mon, 4 Jul 2022 14:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 16/16] arm64: dts: mt8195: Add display node for vdosys0
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-17-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704100028.19932-17-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_053952_757252_E2B6DBC3 
X-CRM114-Status: GOOD (  15.02  )
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

On 04/07/2022 12:00, Tinghan Shen wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> Add display node for vdosys0 of mt8195.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 109 +++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 724c6ca837b6..faea8ef33e5a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1961,6 +1961,7 @@
>  		vdosys0: syscon@1c01a000 {
>  			compatible = "mediatek,mt8195-mmsys", "syscon";
>  			reg = <0 0x1c01a000 0 0x1000>;
> +			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
>  			#clock-cells = <1>;
>  		};
>  
> @@ -1976,6 +1977,114 @@
>  			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
>  		};
>  
> +		ovl0: ovl@1c000000 {
> +			compatible = "mediatek,mt8195-disp-ovl",
> +				     "mediatek,mt8183-disp-ovl";
> +			reg = <0 0x1c000000 0 0x1000>;
> +			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
> +			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;
> +		};
> +
> +		rdma0: rdma@1c002000 {
> +			compatible = "mediatek,mt8195-disp-rdma";
> +			reg = <0 0x1c002000 0 0x1000>;
> +			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
> +			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
> +		};
> +
> +		color0: color@1c003000 {
> +			compatible = "mediatek,mt8195-disp-color",
> +				     "mediatek,mt8173-disp-color";
> +			reg = <0 0x1c003000 0 0x1000>;
> +			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x3000 0x1000>;
> +		};
> +
> +		ccorr0: ccorr@1c004000 {
> +			compatible = "mediatek,mt8195-disp-ccorr",
> +				     "mediatek,mt8192-disp-ccorr";
> +			reg = <0 0x1c004000 0 0x1000>;
> +			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x4000 0x1000>;
> +		};
> +
> +		aal0: aal@1c005000 {
> +			compatible = "mediatek,mt8195-disp-aal",
> +				     "mediatek,mt8183-disp-aal";
> +			reg = <0 0x1c005000 0 0x1000>;
> +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
> +		};
> +
> +		gamma0: gamma@1c006000 {
> +			compatible = "mediatek,mt8195-disp-gamma",
> +				     "mediatek,mt8183-disp-gamma";
> +			reg = <0 0x1c006000 0 0x1000>;
> +			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x6000 0x1000>;
> +		};
> +
> +		dither0: dither@1c007000 {
> +			compatible = "mediatek,mt8195-disp-dither",
> +				     "mediatek,mt8183-disp-dither";
> +			reg = <0 0x1c007000 0 0x1000>;
> +			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x7000 0x1000>;
> +		};
> +
> +		dsc0: dsc@1c009000 {
> +			compatible = "mediatek,mt8195-disp-dsc";
> +			reg = <0 0x1c009000 0 0x1000>;
> +			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c00XXXX 0x9000 0x1000>;
> +		};
> +
> +		merge0: merge0@1c014000 {

Generic node name.

> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c014000 0 0x1000>;
> +			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_VPP_MERGE0>;
> +			mediatek,gce-client-reg =
> +				 <&gce0 SUBSYS_1c01XXXX 0x4000 0x1000>;
> +		};
> +
> +		mutex: mutex0@1c016000 {

Generic node name.

> +			compatible = "mediatek,mt8195-disp-mutex";
> +			reg = <0 0x1c016000 0 0x1000>;
> +			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +			clocks = <&vdosys0 CLK_VDO0_DISP_MUTEX0>;
> +			mediatek,gce-events =
> +				 <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;
> +		};
> +
>  		larb0: larb@1c018000 {
>  			compatible = "mediatek,mt8195-smi-larb";
>  			reg = <0 0x1c018000 0 0x1000>;


Best regards,
Krzysztof

