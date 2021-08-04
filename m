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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465D9C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:56:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18DDA60ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18DDA60ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5cQUP9tv3JemxpNpJcztKhzqRWxgUw6m70/MlJuDUEs=; b=bTsgLfY5Vl61gnQuk0U/uNVx1W
	Ut1u4bxpKS9QWnHv+HuQWAn2e/GK9GPecMojhU9LYKoylhS0NMucA15p3NExh5WKYt+h8G32oH1D1
	txDxkWIsVO8hwDbTfEoWbPq7VIhBYUBlcdFfTgpp++/vOSbylhPkFE97Liqqm9GrefsYtqdAO9zm8
	YbiR3x0lafxi8hCy8RsVuKqt9P3mDSIHJU6JqhWpUtjlLqPBmKIYE6qZoeem6eQ/Lm6IZSNZ7IwOU
	1Bru1d61WFXp9UYMd/kpGSEuhBcRO0NK68EplY1fWXwsSZltozJWrCYpnXzg6iat3BKGsyzMLJ6aU
	9U1APxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBJFe-006eq0-OC; Wed, 04 Aug 2021 15:56:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBJFb-006eoB-0k; Wed, 04 Aug 2021 15:56:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id p5so2811864wro.7;
 Wed, 04 Aug 2021 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gRPELMyvF9vRYWRJ3xMQSU8Idzl0x4DGYrIx0j0yc8g=;
 b=XDrLsgF8UjhNK1nH1zHBglqcihcCEbFJ5ETncYdXTQeOatntskwOoA6XwGhq+Wd5A9
 h2I0IVd7r+WjlvPOLzwjN7P5TcXeixdsCC1q7hSiF/mWS5WkUz9Po7UAscOWT4c0NRCW
 P5SaUDtp3uQMoF7dgIjgFEUB68q/5Lte1ug6zicLGVMO6uZD2n1j9YvgCRvXRNpEEObJ
 ElntYrOX1XsedwvKCRpi79IYbrjsE52/feIsQVUwkufZFEXJ1fpdZblg2XFrVGoVHEHg
 iZmNfusXWGm+dgXSGOZUTqYI7J1oRXilpQ7aVND4Dtur+qEaSje8KdYFkwcEsX2XPmmn
 gdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gRPELMyvF9vRYWRJ3xMQSU8Idzl0x4DGYrIx0j0yc8g=;
 b=lzd3L0A6LEgqFbRyi48dDSqch1mMDDxoqjxDtC/XLqZA6qIGJSpBgHFqntIuadGHar
 yHkFwTCT+jsQ1DcyjS0jFqjJOblgNl5iAs62t7dJkVelWASOnQFSb73bSN48vuRZ1kZv
 OrzViEeIH1NVd1ZqQLIZiUrcoxEAS8qZzCRdo6U3j5a0XkcAkHIked3inVivXLmgh+Du
 JeTjrv154HRkOIRSKbUVQQaBdr7De1L2fH2dYMKrTAOtXwpoRzpvu+Ty8PZunEOYlZlD
 M7duxVqBbftLA4xHQH3ZUVjzPJGXt8SYw6LebrXW/FeWxRhrxCPCHK0oLgbKQ22Sm0ow
 bTUw==
X-Gm-Message-State: AOAM533rjZUa7mjOsDD7B/7E2GBRTeZhrhqijsCKOMq7st3dJKbZtkio
 k6pm9T9Ii4rU9dHEQxBfSxM=
X-Google-Smtp-Source: ABdhPJzT0RsZE0QP/IGJleF9Q/yp0CofsPObSNSKu1mCiX7KGz2wisGPE0W0Y8jIxdNUmg9Ui6IRbg==
X-Received: by 2002:a5d:4521:: with SMTP id j1mr85665wra.44.1628092569603;
 Wed, 04 Aug 2021 08:56:09 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id g5sm6132769wmh.31.2021.08.04.08.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:56:09 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] arm64: dts: mt8173: elm: Use aliases to mmc nodes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210727111502.2506311-1-hsinyi@chromium.org>
 <20210727111502.2506311-2-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <044b85f1-dd05-19c9-f9ee-17e620699733@gmail.com>
Date: Wed, 4 Aug 2021 17:56:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727111502.2506311-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_085611_145549_FC97E4DB 
X-CRM114-Status: GOOD (  19.21  )
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



On 27/07/2021 13:15, Hsin-Yi Wang wrote:
> fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree alias")
> allows the use of aliases to number SD/MMC slots. This patch use aliases
> to mmc nodes so the partition name for eMMC and SD card will be consistent
> across boots.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 21452c51a20a8..d5a2cad39c9c7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -10,6 +10,12 @@
>  #include "mt8173.dtsi"
>  
>  / {
> +	aliases {
> +		mmc0 = &mmc0;
> +		mmc1 = &mmc1;
> +		mmc2 = &mmc3;
> +	};

I overwrote v1 of this patch with this one. Both of the series are now in
v5.14-next/dts64

Thanks

> +
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0 0x40000000 0 0x80000000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
