Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5992C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8565160FC3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8565160FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=txVEjTMe4Oekg2HwItCi1xZV4Xi3C+A0UrKMjjZEwe0=; b=0SO9KnytSbADe7qIUYGx6/VjXT
	Onhq9wbbf0Jq01a9pWM+ug+bS7dFnr5/MJ5JBQCAkrd8D7hqAan8BqUGsCWh05N6QWSHMni/JF42r
	uF1221ceQRzRA9F83b10fRE3Ct39QtB4dEM+mgVxLNJdgHeZmaPLu76PGecxmPF7Ek7OXTfmOZskZ
	hBmGRMD0rJF2M64He74gIZ0n44SDPJRkybpWcmxbRdUArE4QyrtwHMDyPot4BJMyLcXu+aP0gtmfz
	t7Ov9HVFHxKHJ5yuDk3mcq7IHDd6TrJgcOeQ6aGmfZBygLaSznWeZNc7QY7Cbw2tF0v3BPISEfQkm
	Y8rjXlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBKV2-006tDC-PT; Wed, 04 Aug 2021 17:16:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBKUp-006t9x-Jl; Wed, 04 Aug 2021 17:16:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id k4so3105898wrc.0;
 Wed, 04 Aug 2021 10:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c4j6T3m1C4pL+lPcW0oUDbkxI8uRYoCs76i1TtiXvnc=;
 b=sJpff0nnWDGvxC8ZM3ej4RZnYJELHF3NM1ikHDdi1c4Fk36WpZk+hGcOpgXXjwAdSo
 K1EmXD7mCJNKoYowu6E8yC/z2eHUFN6eFBHYxosBSsaTwprZzwW1be5veR7y+ZUflmoC
 cbSlcvu97XJRZyblcAy+wnCdMDj7DNnJdic80yzOhb/+E9KrobeBkPOzt26XBhPq3j/Z
 OcARkok9Z2zQkg/2FoMZZhy1WY4lRcdyaty8Pz/rw4OtZX+9ef2x5B97wVrHRWLwPWip
 xlWqkrvI/t7b4sO9PCkD5oSLAe61LskvLYpa8HGv91FRwlCaKBfIVYV1Ytm+TwF1IOxj
 7Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c4j6T3m1C4pL+lPcW0oUDbkxI8uRYoCs76i1TtiXvnc=;
 b=CPzXO3Z2evmENKf4eu83Bgn6jJjVmRcRjmHUIWxcFYlPrOjEGiyJp7JxQLiPHheupy
 Ch5//xgyytGSPLryuI8IceW1b8Av0jyvAB3U9Y2mrwwznjIcStXkUJFCUs/huH5jbgJt
 57E3HSWFoIS2mbmZM2j2OhURMZVTVp0OuUfRDMmYvzrfH0ORNIyuG8gLKlpR+bIt+Q3Q
 uXo2iVL7oxQvbuPE9BWyqGagKB7Oi/FWaLLbXM1hWOahmG2KkvQ6I70pRdzOhZVEgW/c
 QdXI/qZsKDodom4Ej+6AHSUoweVLAl7ae4LmI6u48dBluIxk3augyz8uuLow/BkgOkly
 dA0A==
X-Gm-Message-State: AOAM530IRfWpYTBzDClguh1Si3438h8S6+Z0NSNDLQC2BF0VcMfLVy4I
 6RUAVUlv4jIqUwFiJ/jrQKY=
X-Google-Smtp-Source: ABdhPJwUObN0r34XPKPFfFXf0JVqSRsPVdEbkOCBYZN6v7CvkdaIkZBUf9JibNEtGgRtI50h2yRmIw==
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr446654wrw.158.1628097358323; 
 Wed, 04 Aug 2021 10:15:58 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id z6sm2844141wmp.1.2021.08.04.10.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 10:15:57 -0700 (PDT)
Subject: Re: [PATCH] arm: dts: mt7623: increase passive cooling trip
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210725163451.217610-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8122ce40-ee45-ff09-cc08-ac4d6ae2bfa5@gmail.com>
Date: Wed, 4 Aug 2021 19:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210725163451.217610-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_101559_708580_DAD79B83 
X-CRM114-Status: GOOD (  18.28  )
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



On 25/07/2021 18:34, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> MT7623/BPI-R2 has idle temperature after bootup from 48 degrees celsius
> increase the passive trip temp threshold to not trottle CPU frequency at
> this temperature
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

pushed to v5.14-next/dts32

Thanks!

> ---
>  arch/arm/boot/dts/mt7623.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index b7247ab082aa..11933494e03d 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -160,7 +160,7 @@ cpu_thermal: cpu-thermal {
>  
>  				trips {
>  					cpu_passive: cpu-passive {
> -						temperature = <47000>;
> +						temperature = <57000>;
>  						hysteresis = <2000>;
>  						type = "passive";
>  					};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
