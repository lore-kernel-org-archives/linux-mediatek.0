Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B361C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:04:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1541320825
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hKyKvGQB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMFTr9tV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1541320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eIgbE6DaQ6K2pA27kDEpgdT0KiL/pJBdNME2+ZmymCQ=; b=hKyKvGQB/C3HdnynJIyT8X6Oh
	17hW5eSZn4ilm5a1ynBiafc/uzmGSA/ouBTWTnKoI30/F3J+FxmSYt2MUTdgLujmytpwPkTf+Sh5S
	pxSTa3Lsh8Qh0xPX1WVJKcNVLTnszRX6CK57JNGNLPUs3fF8Vy9eRvLBLZAVr2w2DkScVpZUomWfo
	Ix+TK67jcYbExX5FMInZaQdlnq/2ZwNA+wMOtCs7tMu/aCWkv3ziYfhbsI2Glz5TuukvbKJtikukf
	tDd5w8QTLUhbM9opy4ZBmfCqThZVKMe9K+Zbg3MWUfoCXZ8O9ZsVJ6LjXubU1E/vOFahYZYlWnTWA
	87BljrVSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBEl8-0003xx-HD; Thu, 27 Aug 2020 10:03:54 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBEl6-0003xN-S6
 for linux-mediatek@lists.infradead.org; Thu, 27 Aug 2020 10:03:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id k20so4564261wmi.5
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2020 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P77OjdgSVrs1pV3ulE59aHFIhH+ydWYh3mBhaqATpgo=;
 b=XMFTr9tVl/x4UBOBhwEoZx9P/wMBMJogiYORKo1QLMt6s8t3aH47qy57Z63cuJy6a7
 hLqcHTD0DG1RsuWnHIdQK/c3Y4YlibYVpb40gHEGnOKRDFuD+xUoHssi3XA7TsukLXZ/
 LHvd6QLcjjRkdkB73PTEtrHvfaTdOZRMsx7ziN1EAHS4DVrbZ0o+Hncc3Ex5V5iXEnYJ
 k8R2OCfUK3sSbuLAtHLadBTiy9QE44ofQIr7GZgnt7BhYD1GPq9vXpywjKovoZJz4ViG
 gEZ4ZMxVJC+7FJdzILHI70OnJfDgICffpskEfHiAOKFdulGf30AYg+jctfR8ViNVJsvn
 qgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P77OjdgSVrs1pV3ulE59aHFIhH+ydWYh3mBhaqATpgo=;
 b=Wfh3UCkvzW3fs89WLj+SWpVrsQNYj1PPXjsBlBauzIsFwzlPpBwK3F6zy4y93GFZgy
 nuDxXZh6ebxd6UL5j8/oGqg7Bsn3YUri/idbFiq7ytr8zrGmzipZS3SafgOf6Kmhy2WB
 sTDsq4a0gPY2C5mC0J8+bMR98BnKNiHgUWHnUHh4VsqBYBWEbjy8t0uTDpHSiRYqsy0x
 uGazFuO7jMxcwAeNKvW/NrcqV53WmGcC5qv8xsdUzhNnK1bGdr5+Acl1LFN0r7qQIqPj
 Yc3EOSR1VxBtnp1W7SIUhiW+fdkfE1dd4qFfc82AfussHsi+eC6CxOEnZz31uEpJx6o3
 MXVQ==
X-Gm-Message-State: AOAM5319+C/Gm9fgFu8O/NeOCM4yN9wH+VsudG0yvyXFt9dtGcqJ0K6y
 iveRFgAsjVvlrgPJIsPaHH2FfY+7E39MSQ==
X-Google-Smtp-Source: ABdhPJy0dRPhZCuViCq8m2QlMCz6uEz38kuyN8jKB+CT3sdi+Qn/nenwqTLS4GhPUOGsx0NoxIby1Q==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr10974844wmk.120.1598522631666; 
 Thu, 27 Aug 2020 03:03:51 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id b131sm4538541wmc.8.2020.08.27.03.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 03:03:50 -0700 (PDT)
Subject: Re: [PATCH v4 09/17] arm64: dts: mt8183: add encoder node
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-10-acourbot@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <02eaeace-22dd-02ea-7162-90200fe1cffe@gmail.com>
Date: Thu, 27 Aug 2020 12:03:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821103608.2310097-10-acourbot@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_060352_933425_EF6FE2F1 
X-CRM114-Status: GOOD (  18.99  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/08/2020 12:36, Alexandre Courbot wrote:
> Now that the MT8183 encoder driver is ready, add its DT node. Also pull
> the iommu and scp ones, which the encoder depends upon.

Please don't do that. Instead of pulling in other DT nodes, it would be handy to 
get a reference of the series this is based on.

Let me try to hunt them down now :)

Regards,
Matthias

> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 10 ++++++
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 +++++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 36 +++++++++++++++++++
>   3 files changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index ae405bd8f06b..9e77b420eee8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -25,6 +25,16 @@ memory@40000000 {
>   	chosen {
>   		stdout-path = "serial0:921600n8";
>   	};
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		scp_mem_reserved: scp_mem_region {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +	};
>   };
>   
>   &auxadc {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index f0a070535b34..3c763be658da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
>   		regulator-max-microvolt = <3300000>;
>   	};
>   
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		scp_mem_reserved: scp_mem_region {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +	};
> +
>   	max98357a: codec0 {
>   		compatible = "maxim,max98357a";
>   		sdmode-gpios = <&pio 175 0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 102105871db2..8f77eea6df27 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/clock/mt8183-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/memory/mt8183-larb-port.h>
>   #include <dt-bindings/reset-controller/mt8183-resets.h>
>   #include <dt-bindings/phy/phy.h>
>   #include "mt8183-pinfunc.h"
> @@ -339,6 +340,25 @@ pwrap: pwrap@1000d000 {
>   			clock-names = "spi", "wrap";
>   		};
>   
> +		iommu: iommu@10205000 {
> +			compatible = "mediatek,mt8183-m4u";
> +			reg = <0 0x10205000 0 0x1000>;
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
> +			#iommu-cells = <1>;
> +		};
> +
> +		scp: scp@10500000 {
> +			compatible = "mediatek,mt8183-scp";
> +			reg = <0 0x10500000 0 0x80000>,
> +			      <0 0x105c0000 0 0x19080>;
> +			reg-names = "sram", "cfg";
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +			clock-names = "main";
> +			memory-region = <&scp_mem_reserved>;
> +			status = "disabled";
> +		};
> +
>   		systimer: timer@10017000 {
>   			compatible = "mediatek,mt8183-timer",
>   				     "mediatek,mt6765-timer";
> @@ -772,6 +792,22 @@ vencsys: syscon@17000000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		vcodec_enc: vcodec@17020000 {
> +			compatible = "mediatek,mt8183-vcodec-enc";
> +			reg = <0 0x17020000 0 0x1000>;
> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_VENC_REC>,
> +				 <&iommu M4U_PORT_VENC_BSDMA>,
> +				 <&iommu M4U_PORT_VENC_RD_COMV>,
> +				 <&iommu M4U_PORT_VENC_CUR_LUMA>,
> +				 <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> +				 <&iommu M4U_PORT_VENC_REF_LUMA>,
> +				 <&iommu M4U_PORT_VENC_REF_CHROMA>;
> +			mediatek,scp = <&scp>;
> +			clocks = <&vencsys CLK_VENC_VENC>;
> +			clock-names = "MT_CG_VENC";
> +		};
> +
>   		ipu_conn: syscon@19000000 {
>   			compatible = "mediatek,mt8183-ipu_conn", "syscon";
>   			reg = <0 0x19000000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
