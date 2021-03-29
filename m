Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5F2C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:36:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20B7617C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20B7617C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cNWhJ0Stc/N4+LqLZ9QzqQjJN0R05uHPTfZ5EMAGCKg=; b=cu8WHrzOS8P5AaBzYLjf19aWV
	ABr33GTLEETsNeKMbLebwJFQou8dqWrM2SnNFUNU9lEv9zW3+2u4oTUtLcGWXN7DVZ2SF8/UWeVGf
	D0TURZ+J05YJrxQZzKmMqmYk18SJ0f5Vk/PWaiVrvZqj5yg9wtg/mPJuDjdEOuZDMYOUXea0mKAhO
	68bNSEa70ZECSUdRjTVRUl51AvPjti/G0NmMMAGC4DaRBqlAf2MVMSqX+bExoHO6sR0bCrUOs55VW
	DFcnjA3FuPpBhNupOpBNoX++2E2oK6ON0ierBIBXT//jePhgQIkYR2ly8BKGbEtn9DhMiOzQhqeWw
	yIyZeXLzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0U9-001hKw-R0; Mon, 29 Mar 2021 22:35:50 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsEF-000goa-0p; Mon, 29 Mar 2021 13:46:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id j9so11209040wrx.12;
 Mon, 29 Mar 2021 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VSdiOrRt5A5A6ik3jTpUtYldOZfvz8Pi38YucpFr6l8=;
 b=MCxyXVvcvdvVoXMVp3fxHBlxeNbm0IApsEt53rYdfT2KvWP0Fy3id135pTc+dZdIDX
 6QFBnBke6LhWl4locC7ajLCVbNeUazqfvD9XrUawL/6kzf1V6XNjNAFSALC3tSpoX+kR
 KaR/AMntZT04YpyR7jX3BQ1+YuPpe+yebmmeIaZ9UsI67dSoXTQLk37WTCDQnhOYrN4d
 evwlIxgxwKu25DZsI2jtFL5GI4oUY/L0SEqeAs6Lk7ItE8f3sZt+MfZsD4ZAHomL6tPs
 H9y5KR/OkI47MRN93bfq3yW2kfx4kzR6usGKGrwuCtHV4Ss9EFHrsRBzPBhpM0xPNpX1
 +VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSdiOrRt5A5A6ik3jTpUtYldOZfvz8Pi38YucpFr6l8=;
 b=ODSbKsjvrbBvBFJPCvmeE0pe1Jjk4EF3JK7ebk9AJrkRWA0wceuj9u9N5ee5Rznr+2
 vAENGZydqIgd3SaZq0Z2MDeW/R3v1wz+FXPyawnlqwfL31iesjyn2aT/Mi3aa6oMEqh5
 2XkYCu6DlqH5DYw+Y9dt/FFLAHHRNMhPILxP32aLq8xw9TR3Geom7AHX8rG95gVDB0k8
 wTMh3yl01vL4ivbdY+BkfflpBON+SsoVOm5ocXKBzQnmQzTW1TKwEmRWNMpkOMpp6v/5
 e8aTRXDe/PE6Kgw2n7HjoXtHvFv8+9UFNwl9pqP7hHePBqYEJ7C5rPQ+8VItSBPijeXY
 Rx/A==
X-Gm-Message-State: AOAM532P4AcmyTQxI5f5IqsYHU8Jt8daHvRWMnjVh6bNKNd/5HEBcUzM
 3eOi7w09C1Hr1ScrNvCOn9s=
X-Google-Smtp-Source: ABdhPJzGJUBfC8jn1gAhsDG4i4XVmBFR5fUJC6pZnEJYT0DqoJ040+EuDixRc4Y8BFCQ2QHGOqdung==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr27951844wry.232.1617025609329; 
 Mon, 29 Mar 2021 06:46:49 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id x14sm29409219wrw.13.2021.03.29.06.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:46:48 -0700 (PDT)
Subject: Re: [PATCH v5 07/13] arm64: dts: mediatek: mt2712: harmonize node
 names
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-7-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f4ab274f-3dd4-69f3-2bd3-cc786491bad8@gmail.com>
Date: Mon, 29 Mar 2021 15:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-7-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144651_384759_843DD431 
X-CRM114-Status: GOOD (  15.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/03/2021 10:22, Chunfeng Yun wrote:
> This is used to fix dtbs_check warning.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied now to v5.12-next/dts64

> ---
> v2~v5: no changes
> ---
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> index db17d0a4ed57..a9cca9c146fd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> @@ -805,7 +805,7 @@
>  		ranges;
>  		status = "disabled";
>  
> -		usb_host0: xhci@11270000 {
> +		usb_host0: usb@11270000 {
>  			compatible = "mediatek,mt2712-xhci",
>  				     "mediatek,mtk-xhci";
>  			reg = <0 0x11270000 0 0x1000>;
> @@ -818,7 +818,7 @@
>  		};
>  	};
>  
> -	u3phy0: usb-phy@11290000 {
> +	u3phy0: t-phy@11290000 {
>  		compatible = "mediatek,mt2712-tphy",
>  			     "mediatek,generic-tphy-v2";
>  		#address-cells = <1>;
> @@ -869,7 +869,7 @@
>  		ranges;
>  		status = "disabled";
>  
> -		usb_host1: xhci@112c0000 {
> +		usb_host1: usb@112c0000 {
>  			compatible = "mediatek,mt2712-xhci",
>  				     "mediatek,mtk-xhci";
>  			reg = <0 0x112c0000 0 0x1000>;
> @@ -882,7 +882,7 @@
>  		};
>  	};
>  
> -	u3phy1: usb-phy@112e0000 {
> +	u3phy1: t-phy@112e0000 {
>  		compatible = "mediatek,mt2712-tphy",
>  			     "mediatek,generic-tphy-v2";
>  		#address-cells = <1>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
