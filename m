Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A52C433E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 15:42:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2281F206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 15:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gz6BI6Z7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocSI4ZH0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2281F206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4gqGzQCGXXFVB7tup6rZ71OpnxcDOD/ApiiNq/FTTv8=; b=Gz6BI6Z7khY6BEzqIv9QfxhHX
	NQ/ik/sUtkInhIv6lHNGjdHpceS8yP3l0nYtrK81nd+ZPU6O8/wNNsb7/wVIT22AWsaoXIvEMCWeH
	pbMkylU/gl9HUgw80dA9xubsINEv+l9SQMPc35/xyr26PGFddpD2VBnP9EbrtQFnrSA0FYfZ1lYtf
	UQjv+RX+BjsmmcAIpD/nB9H9SJXHPFbUD7Jb/5K00OVyJgOV4pOt/+JDvhn5O8jWKjT3vEzFgUq1t
	gAb7J3O4cbB7WcdzYNlTTpHo+fKv40zVwmjX7BIJs3wsZ/W0ca0f+EhgdwOaXaghkJVeykNDr99gx
	QAtrLF1kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jydMl-0004TX-PH; Thu, 23 Jul 2020 15:42:39 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydMZ-0004Ne-M4; Thu, 23 Jul 2020 15:42:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id x5so4820528wmi.2;
 Thu, 23 Jul 2020 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WmpEF3wAK9MyQIycfqRtOyPcqi5ldyWuyIoAHJsmiPk=;
 b=ocSI4ZH0PyYIM68bnC8T89tdDC4qku8Q6bns0IbSeRi1ZgVm3N/GxGxVS9OvbcFBTz
 oN7uSgt2lKmq43lzIsDXJYDBJAwxxzPHxYg2X68/7Y4M6QFcG5OpgmJQJcIwmCwq8Pbn
 X4yNeIg2evOKg9vwfUFM8w8zPvrBzqIsA/CLeb0RYbFvC5tedw0VnpZ+y5W8cdkQvVQB
 B4qW9aI40iuWv9mIQka7e5M7rF5xN9BydSf+BcZtfkZ1XkUzYMg7gRBGOk5N+mR+G7fn
 Tvq7pFmLlgjBzYZ7VZb3Jn4W762go9m09GdcVOeNhbmfyH3c/Bf1FddziFKl6cFlCC8U
 bv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WmpEF3wAK9MyQIycfqRtOyPcqi5ldyWuyIoAHJsmiPk=;
 b=f4A9RVX20M0mV/1NQF7vO1VVibq3lLUYiz2IvLl1SOrCekxcTVktnB9+63uuIJML8c
 mGjyn+Dee4wSnSRBuN+v/FyN+AbkFWPFrcPGjIn6wqM+XUtLL2o/o4EvAHCHOin3sYpB
 ixAuZi60eUPh3g1CE7pOs+yRv4Fu8As3kiMM5JZwGoM00/sSYeV4WXIBwATwQOSF+0AQ
 aGXNmyVOCZwi2uWOzpTr0NUbXxMCEiKfRUgm+hA5XBTDDQVNLSQRXx50qn64gVCcy0L5
 EO/cAG8KU3r4ad3Zt5TOxMSkdATz5O6c3stWuFH0cN8CuntKdB0bPLQATsxI0OCP8Ddn
 JMQQ==
X-Gm-Message-State: AOAM532t1yGFJEzh87ATSsfAkzfjHlLWBVeAsfv5sp6hn68rwzhWypmC
 r5EhHWbOkUD6KftHiKMwkAxIMF8R6h8=
X-Google-Smtp-Source: ABdhPJyX2JfGZsL+cpAXob0aVplIVs631ETGzU1KEWsj2v12UjMXeteDcjRnFvXcYr5gn4WVKyOiOQ==
X-Received: by 2002:a1c:49c6:: with SMTP id w189mr2301255wma.97.1595518946327; 
 Thu, 23 Jul 2020 08:42:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id d18sm4238353wrj.8.2020.07.23.08.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 08:42:25 -0700 (PDT)
Subject: Re: [v7, PATCH 5/7] arm64: dts: add display nodes for mt8183
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-6-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a8a7232c-6c2b-b606-2091-da540e5cb79e@gmail.com>
Date: Thu, 23 Jul 2020 17:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595469798-3824-6-git-send-email-yongqiang.niu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_114227_784460_12A45EAF 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/07/2020 04:03, Yongqiang Niu wrote:
> This patch add display nodes for mt8183
> 

In comparison, DTS patches should go last in a series as you will need the 
driver patches to make it work.

Regards,
Matthias

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 98 ++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 7b781eb..440cf22 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -31,6 +31,11 @@
>   		i2c9 = &i2c9;
>   		i2c10 = &i2c10;
>   		i2c11 = &i2c11;
> +		ovl0 = &ovl0;
> +		ovl_2l0 = &ovl_2l0;
> +		ovl_2l1 = &ovl_2l1;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
>   	};
>   
>   	cpus {
> @@ -707,9 +712,102 @@
>   		mmsys: syscon@14000000 {
>   			compatible = "mediatek,mt8183-mmsys", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>   			#clock-cells = <1>;
>   		};
>   
> +		ovl0: ovl@14008000 {
> +			compatible = "mediatek,mt8183-disp-ovl";
> +			reg = <0 0x14008000 0 0x1000>;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +		};
> +
> +		ovl_2l0: ovl@14009000 {
> +			compatible = "mediatek,mt8183-disp-ovl-2l";
> +			reg = <0 0x14009000 0 0x1000>;
> +			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +		};
> +
> +		ovl_2l1: ovl@1400a000 {
> +			compatible = "mediatek,mt8183-disp-ovl-2l";
> +			reg = <0 0x1400a000 0 0x1000>;
> +			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
> +		};
> +
> +		rdma0: rdma@1400b000 {
> +			compatible = "mediatek,mt8183-disp-rdma";
> +			reg = <0 0x1400b000 0 0x1000>;
> +			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +			mediatek,rdma_fifo_size = <5120>;
> +		};
> +
> +		rdma1: rdma@1400c000 {
> +			compatible = "mediatek,mt8183-disp-rdma";
> +			reg = <0 0x1400c000 0 0x1000>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +			mediatek,rdma_fifo_size = <2048>;
> +		};
> +
> +		color0: color@1400e000 {
> +			compatible = "mediatek,mt8183-disp-color",
> +				     "mediatek,mt8173-disp-color";
> +			reg = <0 0x1400e000 0 0x1000>;
> +			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +		};
> +
> +		ccorr0: ccorr@1400f000 {
> +			compatible = "mediatek,mt8183-disp-ccorr";
> +			reg = <0 0x1400f000 0 0x1000>;
> +			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +		};
> +
> +		aal0: aal@14010000 {
> +			compatible = "mediatek,mt8183-disp-aal",
> +				     "mediatek,mt8173-disp-aal";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +		};
> +
> +		gamma0: gamma@14011000 {
> +			compatible = "mediatek,mt8183-disp-gamma",
> +				     "mediatek,mt8173-disp-gamma";
> +			reg = <0 0x14011000 0 0x1000>;
> +			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +		};
> +
> +		dither0: dither@14012000 {
> +			compatible = "mediatek,mt8183-disp-dither";
> +			reg = <0 0x14012000 0 0x1000>;
> +			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +		};
> +
> +		mutex: mutex@14016000 {
> +			compatible = "mediatek,mt8183-disp-mutex";
> +			reg = <0 0x14016000 0 0x1000>;
> +			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +		};
> +
>   		smi_common: smi@14019000 {
>   			compatible = "mediatek,mt8183-smi-common", "syscon";
>   			reg = <0 0x14019000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
