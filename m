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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194CBC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:48:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0316146D
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0316146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H0KhemUZ9YzwxSBNTVBVx4GrHw5Sx4ixXGAdLq6LtP8=; b=J8YgYgUcvkf0B0QKcRASKOxOY
	taMsBY5/HXUGL8R5KynJuYkhDoj3P6IlK5EASOB4LqG3He9eY+xNsnvDPX/oshVedTvmAuhaa4bVo
	RlQTC35LsQnb/DyNKe7thteT16UdpVcFuNbaeQXzhGQ23aWoJuqPpIqk361Lx+kARrnJDpskUNsy8
	WT0t7C3V4LecGPDwKmPjqjJxgmT/7j67bz085SIJuZihsxAKRuAjEnbde3HrICb4Czm9t6qVQMOUN
	G+wOxtGIpHE0oa14VVsp+Q5VfqwHC+KBjOmapNVA0mgfa8ji8EhDTUvG4Iu43t6D+FRpzDyy4Z7F3
	08cEPyvKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1c6-00229Z-UB; Mon, 29 Mar 2021 23:48:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQvbO-000u0K-Az; Mon, 29 Mar 2021 17:23:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id j18so13660134wra.2;
 Mon, 29 Mar 2021 10:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0gRNq2eAkLmvH+yhlKLcp66Rj3Ad23U42HOwmj/mbKU=;
 b=o5L/FHD2NRooZuUKXAkhJ9dRTYHC3RMSTsceG8wztcrJsP7EMSq7y5Crqjv8h2R6Yq
 O4Ugy7Zgk4scwcFGcajgSiAbLMJA4FseEr6YARUzJp5eAVgcBLMp+rbgFbEqNkttrGup
 FkpSJb6BgNvUbIE5GU4AzUoFvmYfQ/N2ufTfkO0IXNuq63NEdjIr6AfJ9L+CUYGhZpgU
 eo6q8qTKyShLEQCJwegudNC13GDvUADhB4ypmDfQnGa///GLjw8LqA3ewBNrDXFSlkQ2
 STj277reA/bn9I862J7kaP+aH/h2SYhPQPstdzPVBGueQpK9eb387ajVZiWI3nC2oUxW
 pyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0gRNq2eAkLmvH+yhlKLcp66Rj3Ad23U42HOwmj/mbKU=;
 b=o2axpjR5GcHBlbZOrUBsN7kI8Cv0cWj7KsmBQYT5bru3eG/ZPNPxwkBAtJO7qkLwwa
 u7lNe0YbgY3kxTFGGHLd02IfY/wrTjc/KefgxKQaa1RpV7nhfjc3t+08PaAnp2uHhX9M
 sLhh2VXFtRy/V3rtO3IMcBk/NT3SuG6M/B5OHs5LK7pWf5zfu1vfFT9lPAFVvTCwwqpJ
 jkf8q2CNItfHpmy+DjpwtQMT7aOLzN3D9cFHHES4wpPrH53cgrYkXc6KqSZsaFvH3qZm
 hLuxXJf4+jbojsPx+wO6kk8LazpNHRVEoQKg6hku62sAQYvrGJ/9zFHz4br0iPBqj9Uj
 gj/g==
X-Gm-Message-State: AOAM532OHDA06ZWUzVDXYbKo6H+T6ZmfWc1bbcO9EB5xDjiq0yuIOvkX
 sn1BPFczZ9lLdlSFp/LNRuk=
X-Google-Smtp-Source: ABdhPJy/EMYWJxvna4g7gKFWJ4d0RX84xR2gk+FxfoXe60VFXgHaTZBcoxtDpG19Q2rIIs8ws980+A==
X-Received: by 2002:a5d:4b43:: with SMTP id w3mr21801254wrs.406.1617038577756; 
 Mon, 29 Mar 2021 10:22:57 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id z15sm29379926wrw.50.2021.03.29.10.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 10:22:57 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8173: fix wrong power-domain phandle of pmic
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1616048328-13579-1-git-send-email-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <55dd47f2-f961-4228-a13a-fa90193f9cbf@gmail.com>
Date: Mon, 29 Mar 2021 19:22:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616048328-13579-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_182300_338805_189F13EA 
X-CRM114-Status: GOOD (  17.87  )
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



On 18/03/2021 07:18, Chunfeng Yun wrote:
> Due to power domain controller is added, the power domain's
> phanle is also changed from 'scpsys' to 'spm', but forget to
> modify pmic node's
> 
> Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied to v5.12-next/dts64
Thanks!

> ---
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 6dffada2e66b..28aa634c9780 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -294,7 +294,7 @@
>  
>  &pwrap {
>  	/* Only MT8173 E1 needs USB power domain */
> -	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> +	power-domains = <&spm MT8173_POWER_DOMAIN_USB>;
>  
>  	pmic: mt6397 {
>  		compatible = "mediatek,mt6397";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
