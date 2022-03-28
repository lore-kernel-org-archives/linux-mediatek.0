Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00805C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fABhriIOJaPkmpWcQbrMXf1Wu6AD8CZyFUxJVx4zmn8=; b=3/1eM478h+fK9x
	n11435Lf8/kZsKNnzsQ+qvE935DggAduAHtOOUxbgKM2zVZeaSxHuh02b4PgTlggaSguEEpcjX3k5
	mJwECiIuyVcLZf45YCfN1xXM3JReGKpMaA+sOUfF7pLoe1ehYh92Ogwj2r++J1AmjVBKDUBnoEs4G
	v8ueM2H+rFkqaLuXGLtmXA9atCV7A7XXcbem19semHxk6T+N9K+tB+D2nVjMC5Fa4Phn1Dc/oGd1b
	C3JTgR9a8XL63kzruf5bFoc7xpQquaDlaP8i2AuXoO9voJctz2qpUCEkFnsAWlYQ5WCGsOh/BU2HG
	OMD9HmXK5CL0x6djc/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYnD2-008IVq-Oe; Mon, 28 Mar 2022 11:06:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYnCq-008IPz-PJ; Mon, 28 Mar 2022 11:06:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b19so19786239wrh.11;
 Mon, 28 Mar 2022 04:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5zRnuOddM/pnWASo81ZkoEvRnzsP8QPd1DZ1UKdPT4s=;
 b=TvR0RF4TSiqYGppaBCf3IX0Ss0m3JX0VcGIFPCXzP3QMvO6MmzrY6msrSb0inupxxS
 ecyJfWtZUcxFWt3sQsvtuHHccIPyaGdqtcvOuWJx3w4tgn49DyGAxEegJB4xF4gfo/xb
 F85fJG/tPjNn7mMNSrPaBItoYbIbs2XCNPgP+svEYUttrmrN1J+Px7lsmKO59WOB+XAd
 5eOtnGF5GY4yMTAXsYOyP5RsPo2YkD1IqWw5x0do+FlZj8icNXksB4NtcLPhlk+9XkFp
 7bzfYW2FYnSoFvU42nMltjFqnbCzqvIcjU6/o/X7QQjLZ+oJhhaP2/JokNTumxlmHnh/
 wKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5zRnuOddM/pnWASo81ZkoEvRnzsP8QPd1DZ1UKdPT4s=;
 b=u+WRKaNvHw8luD0u47Qp0nyASHq6qEKovNufXKe1EGtlS5A4b89E+bacKhEsRk/g/K
 Oqj7/CbOJC4Tz2XeFAep8vVROKOCf0B8pagBlJGPHgit+xS6FjgsMB4PpH8xY4Nn2biP
 1AOcyu4ENQs2L3i2uf35QzkOV6UwVj6zJLBy8sa4RRzhauNLjNfbp8VvHt3nWQynxXdG
 PlMC8JzlX8pcMkpl/IkHSX84bgPLhoZJoRXAPecVEHuYQLt71WrSAmbW+AECUQbBOinK
 /KELgVBZiac4JjP/lL+cS9URMNALRB4uBJeCM+Ey43yN1QOQa8SOK1felHsZdsssRICh
 fNvQ==
X-Gm-Message-State: AOAM530B8++JnW6jB4bLHMdpVnK1ZWuoogdCHypCTKQzscAYFnHntPzR
 gjUDAxUbzVpcfzLqeO+6ZJU=
X-Google-Smtp-Source: ABdhPJx7rpc/toOY4+iILxDNjbBaHiG5lJc9/4OUSNSkreGSfS2g+0AIDa2rLFDWRYiR8xh8/HtdcQ==
X-Received: by 2002:adf:e744:0:b0:204:213:ae40 with SMTP id
 c4-20020adfe744000000b002040213ae40mr23462516wrn.344.1648465598948; 
 Mon, 28 Mar 2022 04:06:38 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0038cbcbcf994sm11873706wmq.36.2022.03.28.04.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 04:06:38 -0700 (PDT)
Message-ID: <c62c29d1-e373-a0f2-482b-98c70cf22b4b@gmail.com>
Date: Mon, 28 Mar 2022 13:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 21/22] arm64: dts: mt8192: Add gce info for display
 nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-22-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-22-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_040640_933457_D4F15A0B 
X-CRM114-Status: GOOD (  15.82  )
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



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Add gce info for display nodes
> - It's required to get drivers' CMDQ support
> 

What keeps us from adding that in the display nodes in patch 18/22 of this 
series? When doing so, please mention in the commit message that we then need to 
add the GCE to the mmsys node.

Regards,
Matthias

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 08e0dd2483d1..f0f0f067c023 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1203,6 +1203,9 @@
>   		mmsys: syscon@14000000 {
>   			compatible = "mediatek,mt8192-mmsys", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
> +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
>   		};
> @@ -1212,6 +1215,8 @@
>   			reg = <0 0x14001000 0 0x1000>;
>   			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
>   			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
> +			mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
> +					      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
>   		};
>   
>   		smi_common: smi@14002000 {
> @@ -1253,6 +1258,7 @@
>   			iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
>   				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
>   		};
>   
>   		ovl_2l0: ovl@14006000 {
> @@ -1263,6 +1269,7 @@
>   			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
>   			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
>   				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
>   		};
>   
>   		rdma0: rdma@14007000 {
> @@ -1274,6 +1281,7 @@
>   			mediatek,larb = <&larb0>;
>   			mediatek,rdma-fifo-size = <5120>;
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
>   		};
>   
>   		color0: color@14009000 {
> @@ -1283,6 +1291,7 @@
>   			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
>   		};
>   
>   		ccorr0: ccorr@1400a000 {
> @@ -1291,6 +1300,7 @@
>   			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
>   		};
>   
>   		aal0: aal@1400b000 {
> @@ -1300,6 +1310,7 @@
>   			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
>   		};
>   
>   		gamma0: gamma@1400c000 {
> @@ -1309,6 +1320,7 @@
>   			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>   		};
>   
>   		postmask0: postmask@1400d000 {
> @@ -1318,6 +1330,7 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
>   			iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
>   		};
>   
>   		dither0: dither@1400e000 {
> @@ -1327,6 +1340,7 @@
>   			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
>   		};
>   
>   		dsi0: dsi@14010000 {
> @@ -1351,6 +1365,7 @@
>   			clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
>   			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
>   				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
>   		};
>   
>   		rdma4: rdma@14015000 {
> @@ -1361,6 +1376,7 @@
>   			clocks = <&mmsys CLK_MM_DISP_RDMA4>;
>   			iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
>   			mediatek,rdma-fifo-size = <2048>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
>   		};
>   
>   		dpi0: dpi@14016000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
