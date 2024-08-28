Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3F6C54755
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSk/OEHoPMhRCK/ZaRMyI/zmjD4EdJp4kRX9RWfkNhI=; b=Ttbnl86XeK3BiRnBSrLa1NR58K
	zfmJp2HxLjZWwlth3BkEVma+eRQZ6etGMxPby/krcr40ClYV9UV3H5bfNsGXRN3ecBP1g+TUcJNsl
	nyFNnP+tv4yL07spx8gnI0IvZNjTAhDuKvJPnx5AYpH6oySxdR7hbQwGU5BVcBr3sbhd62cNyT5gO
	f6jQC43KjXofcTd8y1o+1cM1IdWX9qttkFZ6jzV1+arNcNlfDOzHW6YtSJ8ho2Fgm4MNbsxgikTSt
	hGQbxP/Q0hu4ARCU3ilvBKDflmagBREX/azwLoMiaTvnMel1VOb6revlv8NSqK3jj81W0LW61bHRl
	GMt2vR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEmD-0000000EfZT-1o71;
	Wed, 28 Aug 2024 09:15:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDmW-0000000ETrr-1KwD;
	Wed, 28 Aug 2024 08:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dSk/OEHoPMhRCK/ZaRMyI/zmjD4EdJp4kRX9RWfkNhI=; b=OjOs3+QJ6wAt2FpOlwPSNhA8vn
	f9nztOKU5v9T57rC7hCDYx+4m+QjRzpgfz0Rehkmejs9eW34JRobEyDAi3mHUXstfWbmB+6NMUsDx
	gF0UT3IndD1PBk1cmZfP0ycmQScUoR8Qa5cgzFAu/KZYhnMjJ3DDTPYYZY+4gvWTj6cNxHLN/dy38
	GFVsjxCQBRcyJwP8dwIjZy1Y+kZBPZnVoipljQSNlHHXD8swC/8iuFFnqXZnfEvE2213boKi3dSqS
	clwaH73+HLUnwLKhv2X+xXbly+miMJIroYij8i//Y7Qw6wLd2Vqma+HkuOgwHVHY06AbabAk6bETz
	TMre+yLg==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDmS-0000000B66e-2hc6;
	Wed, 28 Aug 2024 08:11:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-371a92d8c90so3320087f8f.3;
        Wed, 28 Aug 2024 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724832709; x=1725437509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSk/OEHoPMhRCK/ZaRMyI/zmjD4EdJp4kRX9RWfkNhI=;
        b=OeFhPk4wbc5+w4N16QPbN4FHBxoAakBl8VME1bWzCkLC+2kSrIEF+SYdC9z5CpHwgZ
         iqC6UgTYDMoeNegeyIM0HlxdZ1WxPPPHNNPuE68OAYGJ16v2ZDiT2yV5E1/sKSadSrrl
         LrTTkQhTAoOt6oejL6VrilmQ9ncakc8C5zx7OFVpknJSJZbheLXQHzqIfbbARBVWpY1H
         T7KRBbP4yGUFkDTiTYQIVzA+6k+4Wf+SQE/yQFI0/jWjd7I/6B/R4cn5fNr0SAieZ/pl
         7NvoNiiVC+q5NqgtI/uFWJbee6NdjyaJolx7je1uH1KrB1FLf+M0p2Hu7W+Uaz6NLcFG
         C8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724832709; x=1725437509;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSk/OEHoPMhRCK/ZaRMyI/zmjD4EdJp4kRX9RWfkNhI=;
        b=BUsA1mAEGVRd4F/bHtPj2xr+x6y9J83thVXDWzgLKOf+Kb5Bzll1Gt+rDkgMMRmDPD
         0x96gVxRGCGHeG9DSDWEBIv334JMCoyxUKJ/qSxLPj63+586gCyGMk3LjcQe1D4JMWeG
         1MeFju9b4fSn7RR5gzoPGV8wvkeh2qAFb9OEF1wKr+BDAIOFMaQEDJlUElXp/F8hBOZA
         h5VWPfwnCzCtiAP6xXoruETW8I44QUpOs7HIwtKHwfL0/ugCvLQtiMXaWcXPBfp4fRBW
         YWB/OC27BtINNRKmPuf6a/bhl62VH+rTlk1QeSNuN9Ld+iMh/778RbKjDtdTlKl2jMA3
         PYkw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Kn5m5TtU32YvozkRx5xzNmcqaBAB9bPR0eErF3OhxvRYftkmESeTzWO1W1Js3iAewq7AetaGSpckwejb7679@lists.infradead.org, AJvYcCWUJTo11m+F777Qm/N4ynanxYXFD6F/rqEJmMP2BIH8E4ZLeFO9GRF56aVsHQfNIfJFlv/2229AuFCtqIb+7S8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqkFt/lEYhQsPHQhVCLatIOonf6tnkVcvbWvKR1sm2RUr2+umP
	VSvtW6UPc+Pk+S7CZwPNfz1KSBgeHOCBHvJxTi9vkgue+NEd5XJW
X-Google-Smtp-Source: AGHT+IF8lcvZiFVTHUZ/tpOE7NQ2mVYYVRKLrUmvMJQgvic+d058iumAAiF97qbfy80oik/EDFhJNQ==
X-Received: by 2002:adf:f08f:0:b0:371:7e19:b9de with SMTP id ffacd0b85a97d-37496821fb1mr774969f8f.32.1724832708968;
        Wed, 28 Aug 2024 01:11:48 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba7b4271fsm7517625e9.29.2024.08.28.01.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 01:11:48 -0700 (PDT)
Message-ID: <66432301-d5ad-4703-a08d-833573e733e0@gmail.com>
Date: Wed, 28 Aug 2024 11:11:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Fix supported-hw mask for
 GPU OPPs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240725072243.173104-1-angelogioacchino.delregno@collabora.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <20240725072243.173104-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_091152_880107_09D817C5 
X-CRM114-Status: GOOD (  17.52  )
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

Hi,

On 2024-07-25 10:22 +03:00, AngeloGioacchino Del Regno wrote:
> The speedbin eFuse reads a value 'x' from 0 to 7 and, in order to
> make that compatible with opp-supported-hw, it gets post processed
> as BIT(x).
> 
> Change all of the 0x30 supported-hw to 0x20 to avoid getting
> duplicate OPPs for speedbin 4, and also change all of the 0x8 to
> 0xcf because speedbins different from 4 and 5 do support 900MHz,
> 950MHz, 1000MHz with the higher voltage of 850mV, 900mV, 950mV
> respectively.
> 
> Fixes: f38ea593ad0d ("arm64: dts: mediatek: mt8186: Wire up GPU voltage/frequency scaling")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Appears to work on my magneton, I can see "Mali-G52 r1 (Panfrost)" as
the OpenGL renderer in various programs after this patch.

>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 4763ed5dc86c..d63a9defe73e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -731,7 +731,7 @@ opp-850000000 {
>  		opp-900000000-3 {
>  			opp-hz = /bits/ 64 <900000000>;
>  			opp-microvolt = <850000>;
> -			opp-supported-hw = <0x8>;
> +			opp-supported-hw = <0xcf>;
>  		};
>  
>  		opp-900000000-4 {
> @@ -743,13 +743,13 @@ opp-900000000-4 {
>  		opp-900000000-5 {
>  			opp-hz = /bits/ 64 <900000000>;
>  			opp-microvolt = <825000>;
> -			opp-supported-hw = <0x30>;
> +			opp-supported-hw = <0x20>;
>  		};
>  
>  		opp-950000000-3 {
>  			opp-hz = /bits/ 64 <950000000>;
>  			opp-microvolt = <900000>;
> -			opp-supported-hw = <0x8>;
> +			opp-supported-hw = <0xcf>;
>  		};
>  
>  		opp-950000000-4 {
> @@ -761,13 +761,13 @@ opp-950000000-4 {
>  		opp-950000000-5 {
>  			opp-hz = /bits/ 64 <950000000>;
>  			opp-microvolt = <850000>;
> -			opp-supported-hw = <0x30>;
> +			opp-supported-hw = <0x20>;
>  		};
>  
>  		opp-1000000000-3 {
>  			opp-hz = /bits/ 64 <1000000000>;
>  			opp-microvolt = <950000>;
> -			opp-supported-hw = <0x8>;
> +			opp-supported-hw = <0xcf>;
>  		};
>  
>  		opp-1000000000-4 {
> @@ -779,7 +779,7 @@ opp-1000000000-4 {
>  		opp-1000000000-5 {
>  			opp-hz = /bits/ 64 <1000000000>;
>  			opp-microvolt = <875000>;
> -			opp-supported-hw = <0x30>;
> +			opp-supported-hw = <0x20>;
>  		};
>  	};
>  


