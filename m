Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A07C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:18:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A942068E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YqrD3W2i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKMk2YIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4A942068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Nyx84HY8KUTZNtgiUef5aKNWBrOMUMiMSi9UNMYQJE=; b=YqrD3W2iEueBs1Gw5cyZB+V6P
	xTqsNUG6pOEQeKH/VVi7tpNXGln+DjPwgk5cKNeys5K6QSrH23k6yO6WqErvSPWz1sY8r9KJ71l2D
	neYJYniv4ENzkB1kEtR0NLk/WgEEEHR3TyzIZE6YqQz0a8oR+g+K4d+LhEKnHfv+PhVAv3047oXLW
	Jb3FuMZIOhR7Ai6NGxCdkW3AcJ4zfIdajd6HASI7x33EBJNVAhmMof1Uzv/OEtgc7zHz6UQ5RA0nP
	/V86f4CZKvgUJp5Jq1C3RQZgd5zAoPC4Iv34avfwhEUsOW4PoYKCWiMbTxehrclpuoO1c77RDNpum
	5w40DtPiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHCK-0004gK-Hz; Fri, 02 Oct 2020 09:17:52 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHCI-0004fY-9Y; Fri, 02 Oct 2020 09:17:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id m6so991149wrn.0;
 Fri, 02 Oct 2020 02:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dIX1QnSd8Sm6GMg/Obp/yg2Em8bvCIKWhcgetLs0oPc=;
 b=SKMk2YIFw/7mFo49CvNuLB++JAjObQQWwzsb7eLvuUFYxejU2zZpfYU7p+rrLA1fgy
 sLwKtg8kDuxdSiTogM4+kNDr7nt4zNVc7mew7jhxVDvdID4m/z0EBknkYHsuScHxwllj
 pIFHDZ8MKg1Om5efa/bGhY0A9puDwcTSepLInpvBdPkPzjAQILHuY5q0zE3YOIghBdar
 I/DdduQzDzRjXTXEkjHeA6zFGFc6mSjeAUqO6Xik6NirBcCArLEKYAspJA5s8eybVD9J
 bPFl7JjX1QxbM+SNg7ZN4bIX13AW+ewfF8ZRSwcr1KA7AVjdFxHVvN8GiTRkE7dpBrMa
 mDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dIX1QnSd8Sm6GMg/Obp/yg2Em8bvCIKWhcgetLs0oPc=;
 b=Pi5/VuG40RtrFHw2WlyR0JiiMqv4BZs3urf7YKT5oE7Cd4D7wbvOx8gRDVJxJ18JW+
 vSkZZ12hJROwSgwboNCaaOa/zuOzsFI6geBGtiDMNIetyZ2IiaRUXmbBpPd4O2qaT+Ep
 39KXeV9H/C2OCmlTvHelGnI7RGX2fC1OwfIfrdWQ81VvBZrJFn3qDOZUZCzmOa6qWpYq
 UbMdz8AClvW0Yz2IC36oEfLDNXVffzFaibVtitTKZjypYzAA35wBo5yC/lAbRfkbcrDY
 zHy6YS4rGRVN3xuXFqJh+VbXtnkfH4T6HR79vsgqtX52HliQZu66vbAAaAgG5Mv1A1/3
 nC7Q==
X-Gm-Message-State: AOAM533vYwfuC8ObwDWhFLJae74nhFcb6FlHAgTQ9TwCUzePnutbvNPL
 lTeKAxthSk/f0B7NhT45JSZg6T+W3vHMKg==
X-Google-Smtp-Source: ABdhPJweC7f5XPBbqWwxBlys1kcLJBUypBWOTuPXbrHo9UUwrGb4Ucz6TMjRsiFp7J0u0qYQfXy/bw==
X-Received: by 2002:adf:91c2:: with SMTP id 60mr2042425wri.292.1601630269185; 
 Fri, 02 Oct 2020 02:17:49 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id t10sm1071439wmi.1.2020.10.02.02.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 02:17:48 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mediatek: Add smi_common node for MT8183
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201001162823.3592352-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d937daf7-469f-8d74-4267-057b89cf1dd1@gmail.com>
Date: Fri, 2 Oct 2020 11:17:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001162823.3592352-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_051750_349600_1227AD07 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 fparent@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/10/2020 18:28, Enric Balletbo i Serra wrote:
> The SMI (Smart Multimedia Interface) Common is a bridge between the m4u
> (Multimedia Memory Management Unit) and the Multimedia HW. This block is
> needed to support different multimedia features, like display, video
> decode, and camera. Also is needed to control the power domains of such
> HW blocks.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c2fd141afcf6..9082bc65e15e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -916,6 +916,16 @@ mmsys: syscon@14000000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		smi_common: smi@14019000 {
> +			compatible = "mediatek,mt8183-smi-common", "syscon";
> +			reg = <0 0x14019000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_SMI_COMMON>,
> +				 <&mmsys CLK_MM_SMI_COMMON>,
> +				 <&mmsys CLK_MM_GALS_COMM0>,
> +				 <&mmsys CLK_MM_GALS_COMM1>;
> +			clock-names = "apb", "smi", "gals0", "gals1";
> +		};
> +

Having a look at the bindings description, it states that the power-domains 
phandle is a required property.
So I suppose you have to base this on the power domains series.

Regards,
Matthias

>   		imgsys: syscon@15020000 {
>   			compatible = "mediatek,mt8183-imgsys", "syscon";
>   			reg = <0 0x15020000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
