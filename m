Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80DAC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 15:35:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F0720756
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 15:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GM1gT/Zj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjR+fgEF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43F0720756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taiRZ3VYmrOa6BFp3v+XibQ4S3G4smX9dhux1xEp3HA=; b=GM1gT/Zj6bbNTP
	etBI7DYXJ9b9h9c9w/M36E2N9c9staLaZXv/jmLbSAzbwco0V8ISEFYuL/YFMpaGBUcX003Q8Wazr
	6ItW/xBlVkJ6Ux3i5fHu39VYQQaTz9G3815cQbYLp40EhyZiMx5FK2knGxQ4u+zoHezqSpGABrt9U
	nPBpJmRw1QFn20zBnM+SzKyCUjAbwvo7kev+fx9OjR3VbZQK0jlOxwE6fsUY/Val4rHIz7yu2F89Z
	LPCH5bdD5hW3uGZpHzWtkZ/FBElvn1/RZDTU1W0pDuIGwfXKtdCE2BjNMoT+CNse6LMz1Ox3aSD5B
	E9vgL4FVCmFtKiFXfQNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZyqU-0007WK-EP; Sat, 16 May 2020 15:35:26 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZyqR-0007Vi-MN; Sat, 16 May 2020 15:35:25 +0000
Received: by mail-ot1-x343.google.com with SMTP id z3so2759414otp.9;
 Sat, 16 May 2020 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/GuI5j0F8zuQQcxV/ULqO2KUI6KnIMmelfO0Ywbye2U=;
 b=ZjR+fgEFmg99/oZKZeWNX6ftxjDJ+WubmSsWdDH4NZOV1qBxCcawaGb1NIJU/C9bGU
 ti8kCvRZ7F2M165Tll4dcq9VIMh5PtfcfgitdQIXktEyy+vLgvmlJnNTb/rngHfaRnrB
 XpWWEs2nePOZI5TJqZcYkXWSjwv70zQjlWtmlD65tUuR/IcllzaNLop6PSjFAO/BOO1a
 hLXRCRKykxZQWYXuoSPYpnlOCHobJsQg5sQjYBKDl0MpVbcw7771/VJIDNHszFKgVrbG
 0tFvcOkz8jMw4wMmrr73XpMgeRP7B3C95W4bh3YNEf1Wy7/w6kjQPghtx9lOIM1DOYEb
 Klqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/GuI5j0F8zuQQcxV/ULqO2KUI6KnIMmelfO0Ywbye2U=;
 b=A1cepSA8ktLSmESTZfqELZFw1w05n7C65oDlKfi4Ho03d8FOYCwx4VANXtftqFYk81
 hRDyl3X25cC+heTMDbQxp3cy8wXVFN75TUSDSLqC8E5UPCD5NBDsfzkYkz7TI3UYej2P
 u8QTrPOCYtC3wmmfnwW4T8ZpduNmIOZAfnwEmwhxXoEFbwrmb/FMfEQ8OnCRGJKV0xzt
 zhKHKaHwtBdCM/6Zu1qK+/F9y16nE5emNK9quB4tKekX2DjEr3Lk8/EiHgzaSuktMeZW
 j/Vkm5XTJQvqbfvjVtE70hI9uiIAPpxm5K4xgE8cvJBiLRB3CwZ7mIm+XyGsZdXd847r
 MEsg==
X-Gm-Message-State: AOAM531qMb7ZytXXTh/HYJ6aIRGz9xuGFUuhynveJovLKZYd/fbQokiS
 /kxMzRLtHj35r2qZeI6eQt71XqiX
X-Google-Smtp-Source: ABdhPJwX+o5CfAxYzi43Y0SQF4bpeViXitXKpO2mk7bh22ms/FZilYOcRe4dVdV78XDI9wywsT5dpw==
X-Received: by 2002:a9d:70d4:: with SMTP id w20mr1746192otj.179.1589643322718; 
 Sat, 16 May 2020 08:35:22 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id g94sm1440356otg.74.2020.05.16.08.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 May 2020 08:35:21 -0700 (PDT)
Subject: Re: [RESEND PATCH v5 11/11] arm64: dts: mt2712: use non-empty ranges
 for usb-phy
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <bfcf6a4dd6829dfa1bd0119b34043db7364dfd8e.1581389234.git.chunfeng.yun@mediatek.com>
 <0b039294697126edb25a699b8c25b7fcc84eed36.1581389234.git.chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <dbeb21d5-ece6-5a09-4802-ad5ba3d2b21a@gmail.com>
Date: Sat, 16 May 2020 17:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0b039294697126edb25a699b8c25b7fcc84eed36.1581389234.git.chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_083523_752014_EC59E333 
X-CRM114-Status: GOOD (  17.08  )
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
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/02/2020 04:21, Chunfeng Yun wrote:
> Use non-empty ranges for usb-phy to make the layout of
> its registers clearer;
> Replace deprecated compatible by generic
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

queued for v5.7-next/dts64

Thanks a lot

> ---
> v3~v5: no changes
> 
> v2: use generic compatible
> ---
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 42 ++++++++++++-----------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> index 43307bad3f0d..e24f2f2f6004 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> @@ -697,30 +697,31 @@ usb_host0: xhci@11270000 {
>  	};
>  
>  	u3phy0: usb-phy@11290000 {
> -		compatible = "mediatek,mt2712-u3phy";
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> +		compatible = "mediatek,mt2712-tphy",
> +			     "mediatek,generic-tphy-v2";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0x11290000 0x9000>;
>  		status = "okay";
>  
> -		u2port0: usb-phy@11290000 {
> -			reg = <0 0x11290000 0 0x700>;
> +		u2port0: usb-phy@0 {
> +			reg = <0x0 0x700>;
>  			clocks = <&clk26m>;
>  			clock-names = "ref";
>  			#phy-cells = <1>;
>  			status = "okay";
>  		};
>  
> -		u2port1: usb-phy@11298000 {
> -			reg = <0 0x11298000 0 0x700>;
> +		u2port1: usb-phy@8000 {
> +			reg = <0x8000 0x700>;
>  			clocks = <&clk26m>;
>  			clock-names = "ref";
>  			#phy-cells = <1>;
>  			status = "okay";
>  		};
>  
> -		u3port0: usb-phy@11298700 {
> -			reg = <0 0x11298700 0 0x900>;
> +		u3port0: usb-phy@8700 {
> +			reg = <0x8700 0x900>;
>  			clocks = <&clk26m>;
>  			clock-names = "ref";
>  			#phy-cells = <1>;
> @@ -760,30 +761,31 @@ usb_host1: xhci@112c0000 {
>  	};
>  
>  	u3phy1: usb-phy@112e0000 {
> -		compatible = "mediatek,mt2712-u3phy";
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> +		compatible = "mediatek,mt2712-tphy",
> +			     "mediatek,generic-tphy-v2";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0x112e0000 0x9000>;
>  		status = "okay";
>  
> -		u2port2: usb-phy@112e0000 {
> -			reg = <0 0x112e0000 0 0x700>;
> +		u2port2: usb-phy@0 {
> +			reg = <0x0 0x700>;
>  			clocks = <&clk26m>;
>  			clock-names = "ref";
>  			#phy-cells = <1>;
>  			status = "okay";
>  		};
>  
> -		u2port3: usb-phy@112e8000 {
> -			reg = <0 0x112e8000 0 0x700>;
> +		u2port3: usb-phy@8000 {
> +			reg = <0x8000 0x700>;
>  			clocks = <&clk26m>;
>  			clock-names = "ref";
>  			#phy-cells = <1>;
>  			status = "okay";
>  		};
>  
> -		u3port1: usb-phy@112e8700 {
> -			reg = <0 0x112e8700 0 0x900>;
> +		u3port1: usb-phy@8700 {
> +			reg = <0x8700 0x900>;
>  			clocks = <&clk26m>;
>  			clock-names = "ref";
>  			#phy-cells = <1>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
