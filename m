Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CDEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrrCuZch9XQ5lNFv3l4LEwKB6XJGCwDavRlMiPzRChE=; b=pYvVLFFcBzXKb0
	17vhpxmBVi+8Kp6Y5mafpKB804fztuePRp62hgG47A35VQIwd8Z9JsNM+6MKqofPj+1JUMTSYm7tk
	dyXDi/DX68lEta6z9HW8zKwhrJccNx885zS2WrbXUkycmWDM7wisTGuX9fNOImwOcGsP9Z47MjuzD
	MawagYYDThxs9D8dHk0pmAOBzh/FBhlbM/yDuR57SwAJr2sL06x5QbSoj8ayWx9+PT6a9KYRhwWsa
	CJSDla3M8plCzGV0/ueTLqb8fakfy/gqbTnvQ5OY8gb6ZTulfEbNuJQK/SQHHrWWs4XhTciiiDTi0
	yJSDlvF1aPs1oEbF2BAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxHO-00FPg5-KE; Tue, 01 Mar 2022 07:50:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxHA-00FPd2-D3; Tue, 01 Mar 2022 07:50:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id v21so19014248wrv.5;
 Mon, 28 Feb 2022 23:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ncaBgOYHVHyX562hJ+dSZXG5SoGXqG/UuIq2nR2m4Ds=;
 b=posku0yAYAZ8Q7U6hzwy/v5OpkmWndRqp33Jjkoaw/Oq7onxRCi7jD1qn1P329zn4u
 3nBjiUhHmSpgrmqMsjAXqkzmvmLIEiEigZRHFAgwztMqKPK0cLQ3TQQh/2PZIcRAGsP2
 gcqqS004c9CIK614nvAnivYjXiNHr7ZoWqnxoE6W8y+XBQmmVUnzLnC906QPhIAy29Ju
 VRw5yWLIBu5BUI+6TIWDRJNWCgGlctbnPhFx1WwEVjs521ccmOYip3IE0QOteKOBIkYF
 bpcmMotTmLeBTV7MSVVGL2GiLO9/SY/1xGLUzg3xPPrFqEYXUtAO1qMqyMe0z5NybcTo
 h7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ncaBgOYHVHyX562hJ+dSZXG5SoGXqG/UuIq2nR2m4Ds=;
 b=12b4G0yorhBHYfSvx52p7xIyasT0uLXSv3+honPMHwyKuqUO2PiUtQSE4742kCuZOZ
 /7qn/Y3UWzkCSevLRzlD/7K6tofa6EdNK3ICEvTisSddqWdyozqQMYqQOtZy7AjxVyia
 naxEw72OCHTiv1KUqS6wRgWMfX7AXGjb1lXbVbciYLVOePx8ugVUcwGRVA8G8Q4MOFMt
 06DOKwA7gnnjZbo3XEQAdb8pmszHtw+JPFJ/k/lggMISZyIHPYRdMIpmou/Iwiy4h+g6
 3i/dfEYm/uDXYmTxkVpg349jaE3muEBbHkfdMQZkdDThgsBj0bTCaRt/cTuznZ/NMkur
 D3+A==
X-Gm-Message-State: AOAM530GYx5EuKL+EwSbYQevGqpzTzcIfoxrlxXVXYcAnue9to2H1HMl
 JDfHle4Vj4VvihkAsyTmzbA=
X-Google-Smtp-Source: ABdhPJyemxdHJ9Az+Ep1C+iGVaYqqNCM/xE0+JQuhKHn+ThMhopwCbRS4EE9kztTc3Kgfso04bPDbA==
X-Received: by 2002:adf:90e2:0:b0:1e3:f5a:553c with SMTP id
 i89-20020adf90e2000000b001e30f5a553cmr18027194wri.476.1646121026453; 
 Mon, 28 Feb 2022 23:50:26 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d4941000000b001ed89dcacbbsm12622004wrs.23.2022.02.28.23.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:50:25 -0800 (PST)
Message-ID: <908437cd-1f9c-2ef2-eb70-94e409d252e0@gmail.com>
Date: Tue, 1 Mar 2022 08:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v5] arm64: dts: mediatek: Add mt8192 power domains controller
Content-Language: en-US
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210825010426.30303-1-chun-jie.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210825010426.30303-1-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_235028_523980_DD069A5F 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 25/08/2021 03:04, Chun-Jie Chen wrote:
> Add power domains controller node for SoC mt8192
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Applied thanks!

> ---
> This patch is base on v5.14-rc1,
> series "Mediatek MT8192 clock support"[1] and [2].
> No changes compare v4
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023205.20319-2-chun-jie.chen@mediatek.com/
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 201 +++++++++++++++++++++++
>   1 file changed, 201 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index c7c7d4e017ae..a0084a7a5bcd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +#include <dt-bindings/power/mt8192-power.h>
>   
>   / {
>   	compatible = "mediatek,mt8192";
> @@ -301,6 +302,206 @@
>   			#interrupt-cells = <2>;
>   		};
>   
> +		scpsys: syscon@10006000 {
> +			compatible = "syscon", "simple-mfd";
> +			reg = <0 0x10006000 0 0x1000>;
> +			#power-domain-cells = <1>;
> +
> +			/* System Power Manager */
> +			spm: power-controller {
> +				compatible = "mediatek,mt8192-power-controller";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#power-domain-cells = <1>;
> +
> +				/* power domain of the SoC */
> +				power-domain@MT8192_POWER_DOMAIN_AUDIO {
> +					reg = <MT8192_POWER_DOMAIN_AUDIO>;
> +					clocks = <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
> +						 <&infracfg CLK_INFRA_AUDIO_26M_B>,
> +						 <&infracfg CLK_INFRA_AUDIO>;
> +					clock-names = "audio", "audio1", "audio2";
> +					mediatek,infracfg = <&infracfg>;
> +					#power-domain-cells = <0>;
> +				};
> +
> +				power-domain@MT8192_POWER_DOMAIN_CONN {
> +					reg = <MT8192_POWER_DOMAIN_CONN>;
> +					clocks = <&infracfg CLK_INFRA_PMIC_CONN>;
> +					clock-names = "conn";
> +					mediatek,infracfg = <&infracfg>;
> +					#power-domain-cells = <0>;
> +				};
> +
> +				power-domain@MT8192_POWER_DOMAIN_MFG0 {
> +					reg = <MT8192_POWER_DOMAIN_MFG0>;
> +					clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>;
> +					clock-names = "mfg";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					#power-domain-cells = <1>;
> +
> +					power-domain@MT8192_POWER_DOMAIN_MFG1 {
> +						reg = <MT8192_POWER_DOMAIN_MFG1>;
> +						mediatek,infracfg = <&infracfg>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG2 {
> +							reg = <MT8192_POWER_DOMAIN_MFG2>;
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG3 {
> +							reg = <MT8192_POWER_DOMAIN_MFG3>;
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG4 {
> +							reg = <MT8192_POWER_DOMAIN_MFG4>;
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG5 {
> +							reg = <MT8192_POWER_DOMAIN_MFG5>;
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_MFG6 {
> +							reg = <MT8192_POWER_DOMAIN_MFG6>;
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +				};
> +
> +				power-domain@MT8192_POWER_DOMAIN_DISP {
> +					reg = <MT8192_POWER_DOMAIN_DISP>;
> +					clocks = <&topckgen CLK_TOP_DISP_SEL>,
> +						 <&mmsys CLK_MM_SMI_INFRA>,
> +						 <&mmsys CLK_MM_SMI_COMMON>,
> +						 <&mmsys CLK_MM_SMI_GALS>,
> +						 <&mmsys CLK_MM_SMI_IOMMU>;
> +					clock-names = "disp", "disp-0", "disp-1", "disp-2",
> +						      "disp-3";
> +					mediatek,infracfg = <&infracfg>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					#power-domain-cells = <1>;
> +
> +					power-domain@MT8192_POWER_DOMAIN_IPE {
> +						reg = <MT8192_POWER_DOMAIN_IPE>;
> +						clocks = <&topckgen CLK_TOP_IPE_SEL>,
> +							 <&ipesys CLK_IPE_LARB19>,
> +							 <&ipesys CLK_IPE_LARB20>,
> +							 <&ipesys CLK_IPE_SMI_SUBCOM>,
> +							 <&ipesys CLK_IPE_GALS>;
> +						clock-names = "ipe", "ipe-0", "ipe-1", "ipe-2",
> +							      "ipe-3";
> +						mediatek,infracfg = <&infracfg>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_ISP {
> +						reg = <MT8192_POWER_DOMAIN_ISP>;
> +						clocks = <&topckgen CLK_TOP_IMG1_SEL>,
> +							 <&imgsys CLK_IMG_LARB9>,
> +							 <&imgsys CLK_IMG_GALS>;
> +						clock-names = "isp", "isp-0", "isp-1";
> +						mediatek,infracfg = <&infracfg>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_ISP2 {
> +						reg = <MT8192_POWER_DOMAIN_ISP2>;
> +						clocks = <&topckgen CLK_TOP_IMG2_SEL>,
> +							 <&imgsys2 CLK_IMG2_LARB11>,
> +							 <&imgsys2 CLK_IMG2_GALS>;
> +						clock-names = "isp2", "isp2-0", "isp2-1";
> +						mediatek,infracfg = <&infracfg>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_MDP {
> +						reg = <MT8192_POWER_DOMAIN_MDP>;
> +						clocks = <&topckgen CLK_TOP_MDP_SEL>,
> +							 <&mdpsys CLK_MDP_SMI0>;
> +						clock-names = "mdp", "mdp-0";
> +						mediatek,infracfg = <&infracfg>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_VENC {
> +						reg = <MT8192_POWER_DOMAIN_VENC>;
> +						clocks = <&topckgen CLK_TOP_VENC_SEL>,
> +							 <&vencsys CLK_VENC_SET1_VENC>;
> +						clock-names = "venc", "venc-0";
> +						mediatek,infracfg = <&infracfg>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_VDEC {
> +						reg = <MT8192_POWER_DOMAIN_VDEC>;
> +						clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +							 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +							 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +							 <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
> +						clock-names = "vdec", "vdec-0", "vdec-1", "vdec-2";
> +						mediatek,infracfg = <&infracfg>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8192_POWER_DOMAIN_VDEC2 {
> +							reg = <MT8192_POWER_DOMAIN_VDEC2>;
> +							clocks = <&vdecsys CLK_VDEC_VDEC>,
> +								 <&vdecsys CLK_VDEC_LAT>,
> +								 <&vdecsys CLK_VDEC_LARB1>;
> +							clock-names = "vdec2-0", "vdec2-1",
> +								      "vdec2-2";
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +
> +					power-domain@MT8192_POWER_DOMAIN_CAM {
> +						reg = <MT8192_POWER_DOMAIN_CAM>;
> +						clocks = <&topckgen CLK_TOP_CAM_SEL>,
> +							 <&camsys CLK_CAM_LARB13>,
> +							 <&camsys CLK_CAM_LARB14>,
> +							 <&camsys CLK_CAM_CCU_GALS>,
> +							 <&camsys CLK_CAM_CAM2MM_GALS>;
> +						clock-names = "cam", "cam-0", "cam-1", "cam-2",
> +							      "cam-3";
> +						mediatek,infracfg = <&infracfg>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8192_POWER_DOMAIN_CAM_RAWA {
> +							reg = <MT8192_POWER_DOMAIN_CAM_RAWA>;
> +							clocks = <&camsys_rawa CLK_CAM_RAWA_LARBX>;
> +							clock-names = "cam_rawa-0";
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_CAM_RAWB {
> +							reg = <MT8192_POWER_DOMAIN_CAM_RAWB>;
> +							clocks = <&camsys_rawb CLK_CAM_RAWB_LARBX>;
> +							clock-names = "cam_rawb-0";
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8192_POWER_DOMAIN_CAM_RAWC {
> +							reg = <MT8192_POWER_DOMAIN_CAM_RAWC>;
> +							clocks = <&camsys_rawc CLK_CAM_RAWC_LARBX>;
> +							clock-names = "cam_rawc-0";
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>   		apmixedsys: syscon@1000c000 {
>   			compatible = "mediatek,mt8192-apmixedsys", "syscon";
>   			reg = <0 0x1000c000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
