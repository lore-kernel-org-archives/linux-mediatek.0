Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81692C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:52:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CF620872
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4Gvw34d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSVmDTNc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20CF620872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l0Rb6/XcX7hnRoqqSFdcBqddFJAA/7o++wWEGfW4Gwg=; b=s4Gvw34dRQsAHOHmChInF9lih
	LgQgBOPCmcvoiYzCSQoE2NOEu3noF8SPJjBANeF5eaZD8dy6ojUgS88JNdJii/Du1ifJMCVyhJjQM
	CMsthEC/eWxN4J8eCaD2E7R89ccdbevIQXsh0HWgHMcWsVftdRaI4ljIksq90uDAJCs44NxJW5gn2
	IgkbGsIgs6+hNQ+o8t/H8bOJFS87chAxn0X9lPBthQxskNEpyrgFJjm1N+4Isat54/YJ4uCw8ExUO
	fAvQfZfc7xrzI6M/7DZBF0BRBCvREJ6J/I7/QldyE+4dQHn4dIsgYPG8uFlFpR0Q932Ht+YjIIOK/
	kkoPtjuCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGKBD-0006vh-AY; Thu, 10 Sep 2020 10:51:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGKBB-0006uC-2d; Thu, 10 Sep 2020 10:51:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id e11so1616110wme.0;
 Thu, 10 Sep 2020 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ot8jLrMGoKI52DFvpwNiXxm1aPXePUwKu6AER+w1zcA=;
 b=OSVmDTNce3UfD6pLMp92sJYy7LtVaFsAUNTTq3z3WcBkr1iDsczZ5VKWsZtSs+fpm7
 Q11hAKIHC12W7xWiyKUq6pll4rGVaiuE/d0GxjJ1E+fhYLIN82QcOjQvZ/2x6psxTDqY
 RhvofhMrT37rJvvmxlgmD/VkS28WoLGFz/SqCe8o+Er6ILlmPogxtYp2fG0gElOv5VjJ
 GPcRB1e/kugyqd5l1wNLdjsvrKT2tnugRbITg1gyFGzE6Uo3cd/QImRfsdm8/YKemdOR
 Ce5fHpuMjBGnE6dft/WV0U28keX5cVX1ctbb5Qp5F5KhFOrxpqVMXNioQKDaaWwqVRKE
 iI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ot8jLrMGoKI52DFvpwNiXxm1aPXePUwKu6AER+w1zcA=;
 b=r+sypIidA6RHuz/ww1L/++BXiZUy87nCHBdwqS2dyQEVDkePjIXyO4QmUxqKeO51v3
 MzoPI21WYUHUKENSuE10uWQtahKwAxP4EEEf/XoHt+6WvlYDwvQO1F/PUV6kabC1un2o
 U8wku/aD1QHauafM/wSzwmDXSd08xe0i9CoL2jlNEM/3JbCEqJ6hXfm4Ka5UYyn52o0f
 HDCP93tcbxonVUtsz7z7FwfIojfSBSY/2BweWNg6xS+Q2HPgqRlQtC2kEQlrmRXiJKL0
 6mUFQvEvNo0tee9RQkOmPwDKRyeZa7uLNZjsC+RB6zyzSEyHY2SI4/7OP1M/Mm56zAkJ
 zZRQ==
X-Gm-Message-State: AOAM531PR9GWAodPdLhuq7Xstdfm/7slccOoqvpJJknTLGHv0sw8y9ej
 v8uKyAaYTDron5QWNOj7rmw=
X-Google-Smtp-Source: ABdhPJwUp9n39OfdocNAzLEpVjdh2cJbTXLst76QyqtMocve1sQWinFB2t0gtuOCrJhfTEb8XehRig==
X-Received: by 2002:a1c:5a87:: with SMTP id o129mr8184635wmb.145.1599735107055; 
 Thu, 10 Sep 2020 03:51:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id q12sm8287954wrp.17.2020.09.10.03.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 03:51:46 -0700 (PDT)
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To: Pi-Hsun Shih <pihsun@chromium.org>
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <74669282-bb02-d753-e117-666fea5d7a9a@gmail.com>
Date: Thu, 10 Sep 2020 12:51:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20191112110330.179649-5-pihsun@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_065149_145464_29B80FF4 
X-CRM114-Status: GOOD (  20.99  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Erin Lo <erin.lo@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/11/2019 12:03, Pi-Hsun Shih wrote:
> From: Eddie Huang <eddie.huang@mediatek.com>
> 
> Add scp node to mt8183 and mt8183-evb
> 
> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>

Applied again to v5.9-next/dts64
Thanks!

> ---
> Changes from v20 ... v14:
>   - No change.
> 
> Changes from v13:
>   - Change the size of the cfg register region.
> 
> Changes from v12 ... v10:
>   - No change.
> 
> Changes from v9:
>   - Remove extra reserve-memory-vpu_share node.
> 
> Changes from v8:
>   - New patch.
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 11 +++++++++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 12 ++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 1fb195c683c3..ddb7a7ac9655 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -24,6 +24,17 @@ memory@40000000 {
>   	chosen {
>   		stdout-path = "serial0:921600n8";
>   	};
> +
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
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 10b32471bc7b..e582f5e6691d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -269,6 +269,18 @@ pwrap: pwrap@1000d000 {
>   			clock-names = "spi", "wrap";
>   		};
>   
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
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
