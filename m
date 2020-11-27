Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED7EC63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 08:34:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF4A221FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 08:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t/o1BA1h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIAvA/ce"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BF4A221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aGkq3THmGUdfLus3h66x9dl53SFSKRmrsbxSjTL9R+0=; b=t/o1BA1hxgit15vS6Wt2ieWVZ
	riX2KjXh52tad69lDCXKOEWIQeJFnMieEfYxi4ZNZ8WXU/x/M23JXr1RuBUkBbDFmw1Njrx/FBsiT
	gU9EGoP+hs+bmSK96drAEJCV6L4GIwnOFTUTYzWLzAUz75EINI0CiGn3y+800Gl6KBZwHXSUywwiU
	2lA1zu+2HCln0u5EQvdyaA430IYVTgbdD+MO0LS89w8XalZrgfyZyz5DLo6SKaRQYXIpQh+QxEjbC
	1RGCvwg1QpwmAnOrREZyFwa7OePGA+nFzQwPTy8oBaHWqUbi5OCdp2++tEKQxVnVQ+nvyGDnm6+mC
	jzeLDRv1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZCy-0002pN-GL; Fri, 27 Nov 2020 08:34:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZCo-0002o1-53; Fri, 27 Nov 2020 08:34:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id w24so5736496wmi.0;
 Fri, 27 Nov 2020 00:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8YrOJTHLtcyBPxE1lVFupdOc3UITMpGz5WVfIQMw4pc=;
 b=NIAvA/ceYfuVeLpQWNASN6GHR40y6WySR3d4tQldhIJJtjHijw8Tx5rEoprL/KsFlx
 UwnTIfRMfrP9Apl4a8Hgv3ASjDVwzy8K+6ENiUQzvWUPqDAILVwghMngwaNWfVKP0/O0
 dNsT41HT3sc46Vkp/IKUM4gl7aolsvQz4Id177677BPQ411jqs1xqRnJcm8cGI/iw5g3
 AGM0Cnh/hZoqK3YMhzl8rk9VWMOIGc/HAejwgrydNZxd8LVGvIMMG6dL5mrLYo53V3hR
 V6DYWru4ZbXnmnjccW1wzDtLp3QnwVwnupAR21dgIQm90jchTCdsKleAERCM7ChK53T7
 E4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8YrOJTHLtcyBPxE1lVFupdOc3UITMpGz5WVfIQMw4pc=;
 b=nWAT+bALw1YqDsahTiBnagpqSbkMJYU6MBuLOqTMgZuZ3/rJy2q6rpy4qtcBIFK+si
 TbfUk0byMDwu1t8Bv+xQe6BfBJPoPaS95ECn3ZGXIsMcObgVQvMqdFx3299JXhuTX+d5
 JujVQDpiPKn1FJndQG+mRnBn+omYtc9uNN13aw+QbkNMZJhplm8Tp6+SCJX30rPEp4fa
 pGMFBDfdOCpjsqbJhyFru+tMA03zJlmIYuuq49Fd4Z5AWQmmQ8cV7IEg4kAY8e0rSn0Z
 fVvdqRoWURYVbS4w+Pvd7YFvm6NmUGOi3KX6wTAI0Yi8LsOqqwX9q+lHXo2k+S4b95A7
 K+ew==
X-Gm-Message-State: AOAM532IK+29mZxzPA4ZnueZa6aWS3Rt11R9DKw5QJEGHbXV0WVNKSdC
 MS9Icqb7TmZAkjs7ZkEiKKk=
X-Google-Smtp-Source: ABdhPJx7wCV6lvX4kuYDrgqjQ2zwj8fqZZkR8YvZ2PpgI+xeOBGWUH4Cn2wuk2UmG5r0eoRyHn9rrA==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr7877923wmg.68.1606466051687; 
 Fri, 27 Nov 2020 00:34:11 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id l10sm6091285wme.42.2020.11.27.00.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 00:34:10 -0800 (PST)
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8516: add efuse node
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20201016171837.3261310-1-fparent@baylibre.com>
 <20201016171837.3261310-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <34955ee3-3505-9445-709e-34d95ea37dbb@gmail.com>
Date: Fri, 27 Nov 2020 09:34:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201016171837.3261310-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_033414_281070_6A71DA99 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: robh+dt@kernel.org, srinivas.kandagatla@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/10/2020 19:18, Fabien Parent wrote:
> Add node to support e-fuses on MT8516
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 

Applied to v5.10-next/dts64

Thanks!

> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index 89af661e7f63..18ddea519be2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -237,6 +237,13 @@ pio: pinctrl@1000b000 {
>   			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
> +		efuse: efuse@10009000 {
> +			compatible = "mediatek,mt8516-efuse", "mediatek,efuse";
> +			reg = <0 0x10009000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>   		pwrap: pwrap@1000f000 {
>   			compatible = "mediatek,mt8516-pwrap";
>   			reg = <0 0x1000f000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
