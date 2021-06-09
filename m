Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4422EC47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 08:57:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F2661182
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 08:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F2661182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ekLs3iQUyigYJX5t3/wFp3+TT0dGJ9qQM45msqi+knY=; b=4fWOxPW4QRyvh13Pdmh9hMwnfp
	ZupOwW/hiXpkta05DTPnTVwkRD17Rl/bnbrPDErj/Mk7+1QpkrC2ebsyDcu9hCuR85cvTUlAsE6sG
	wMJ94G6r5don3lSASGfLowc5URqkXgjWz0+T/SwM/B72/5CPna3D3fbpuxF0hNatJxO3Mf69Fxm6c
	58UVq7nCNI436nm+nNQX2fCO+3SrwrYENeN38UiIqqz/l922a3cnCHLkF6DBoT8EZhnKj4uyj8vlH
	Qdtr7LPhwaDfOEGG9TVh2mJdQuQ9v/nNK/+ziWqGuWrwlccPCX6H/FWwXoL5SGqrbwN0cJGTPwvzE
	AlGIrAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqu1l-00CWER-9R; Wed, 09 Jun 2021 08:57:33 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqtDT-00CHAN-4k; Wed, 09 Jun 2021 08:05:36 +0000
Received: by mail-wr1-f43.google.com with SMTP id f2so24352180wri.11;
 Wed, 09 Jun 2021 01:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wT8jMSk2fM+J5ZgJXdeEUVeym5jcaNbFNA2ciIih7RE=;
 b=A27j6cFCvfhUIj11imB2Akrk6OKq23vnyfFbaKwRxt7bQbCFXu3ONVex1OxuB48nS1
 WAAxkXD+5Rib7zFJUcb6aPan0ger24D7KZj64lfeEUyq2kCGw+PGBmDiudUT89zvsMon
 cQRNGqmRstXpQ3ZCP1UjljPNYjJmTmEBhhNpoE4wWp2plVWvaZYDs2ZIfcHh4G9r6kyp
 rg2IgjrtjTOAs2Zkak59Y7JkHrnsE1jPgeOb9loXi1DPoAmhpwV0Ew4+ytUi2GWJX8hQ
 CemkpkRArAcmfh1tZV4Jz+P6GmCDX8chxD3BWasEbZSlQDXurmfnk51EUheGnbo18VwX
 meFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wT8jMSk2fM+J5ZgJXdeEUVeym5jcaNbFNA2ciIih7RE=;
 b=O54riWn2RyBt2LPeWeF4DZlTVwaXSJgHMjz4KCdtYGWTXx95iWtNHDCV2JUnGnYsQ3
 OGZPe0dXW2+fJ9Kaj6tz8bhcumoIKNSlrSALnOi+Y8T4y4y8078dW3eVlJ4xfSi7RQ0v
 9hGyMZ59k+poh8X+mL8Q4vdKgIrnEU8KOB94ZTEp6laiO8GIrIqxbsGBelMknbvLk4Ru
 lmxbQnhaMmPsMFPC4XzmsGzkZdy/k653vTvMJccYYUDaw1eX06LRqJ3T2844D7DjLzlH
 yo7YzPR5re1kCDA2ITzEp3BqGhScCtT3F7Nl3gdogjoMqbObeXLLH3ASzz5To82J3iLu
 eV3A==
X-Gm-Message-State: AOAM533pCDLe1bciGEoZcgMmG+hwIuMGYvYGwtkmu1G35psZIiwb1bS6
 ZiwMJ4lm1PKgCsnBJuZr0Cc=
X-Google-Smtp-Source: ABdhPJxcdlRhjCnbcVbYr9xZ88zmOBBIJbICZY/xUibynL/tQ9TAgojkqsgCpCOSigZQ9JvuSnMpQQ==
X-Received: by 2002:a05:6000:2c4:: with SMTP id
 o4mr26967217wry.267.1623225873633; 
 Wed, 09 Jun 2021 01:04:33 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id o3sm16695687wrc.0.2021.06.09.01.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 01:04:33 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
To: Ikjoon Jang <ikjn@chromium.org>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20210609032554.2443675-1-ikjn@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6fa5d766-83ab-737a-f081-e21d989c14dd@gmail.com>
Date: Wed, 9 Jun 2021 10:04:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210609032554.2443675-1-ikjn@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_010535_253422_37F01884 
X-CRM114-Status: GOOD (  19.13  )
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



On 09/06/2021 05:25, Ikjoon Jang wrote:
> Add a 'cbas' device node for supporting tablet mode switch in
> kukui devices.
> 
> Kukui platforms with detacheable base have an additional input
> device under cros-ec, which reports SW_TABLET_MODE regarding
> its base state (e.g. base flipped or detached).
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Applied to v5.13-next/dts64

Thanks!

> 
> ---
> Resend this as a spin-off, other patches for dt-binding and
> hid driver were applied.
> 
> Link: https://lore.kernel.org/r/20210514122051.266169-1-ikjn@chromium.org/
> Link: https://lore.kernel.org/r/20210415032958.740233-1-ikjn@chromium.org/
> 
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..1512605a438e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
>  			compatible = "google,extcon-usbc-cros-ec";
>  			google,usb-port-id = <0>;
>  		};
> +
> +		cbas {
> +			compatible = "google,cros-cbas";
> +		};
>  	};
>  };
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
