Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117A1C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaRFwq/unHCPpO35rMNVysowvWByqjfa9IRqKS3kNFE=; b=CemlWwL6iuAsen2lHxaM1OPL+Q
	1pDWWXv66q1GnZkg65j+l9nU9Vcnhf+kzaZ0ZA61Ir+gioaLOPrOK95WSIxyhe02+4nXGJiCCGVH2
	enISLW1WH7BzNZvj7BStre0LDhhXdi8n83QtnqBd912eYHd4aMG6CK5JKv63LivUO2RJVzIjuTsYU
	SsDkjS1F0QIVIlxdQzjYTIzS37cIxk5TKhEST82pFGwTARwdq7VpVywdhsZPurkp1yWJQPxQ2yKBZ
	QGPzzeQrOnA8Ha+Qkx5ChmgEK7XAK+dXbRR6bC6C9ieX/nJj0bMi0ONrPgPUPEWm+leS9wVdOw0xO
	LQrJjLIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFRo-00BgwA-L7; Wed, 02 Nov 2022 15:14:32 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFRc-00Bgt5-Vi
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 15:14:24 +0000
Received: by mail-pg1-x52c.google.com with SMTP id f63so314864pgc.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BaRFwq/unHCPpO35rMNVysowvWByqjfa9IRqKS3kNFE=;
        b=cVY6eJN+1gXte9FHQ4h+lJGGAwY9Bzj+De4I6vGn4sgR2c78SYMgxw2wsIpd5KP+Fw
         4b5oD8byxHeVU5q3Vr32oFB1w0QVjjL/jVLk0gevxv3kgh7/h919o3UYhBFofPwKF6lc
         IaiD6Xzs/mO3V5IxNOcCFn09pN4eUGYK7YpcgzT8Xmm+E6ayTg1C2+JASxB9dJ9411qj
         ojzst8nAeuoTiyafz0Fbez8kCWXa/BrM9+lGB8slJJhumgkgQyoMfGJCGr7zUeDJpdNJ
         wNphOGbprj0EqO8/mHgUYdoEKV+5XTD2c4YuAHIUnpVLiqx0Z0rpIepHMENy5vZLcr89
         Bynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaRFwq/unHCPpO35rMNVysowvWByqjfa9IRqKS3kNFE=;
        b=nYwbhwlYwtaDzJVJI/7vwM9Mu0Z4O0qMiWnkgqCFyVZXApau/oO+IPe9oRd4XxMK54
         WdXkS/oXHqncgzO+3iuA2S6g77SOysv5t0XopuncYaroGHMk4tKf9IWHHwWQPgi4LTiJ
         sdThe95e7+GHb3FoIKKPtvArRNdcZEbxg+0dOdWPwf60M+4UAseV6qief/i+wmIgOu5X
         kkOlJyUIavVXbS+wh6qHEZ2fXC2FlIxpnLNKgD1QNXf1pWBPvFVEWAQfjLuiY1X6cbKk
         tHW9+ixVqxwJZfgva8AQrYN9e9/c+pvdU86KWSF4UZuibCs/qqPJ7CUgHoCp5KXKrmvk
         VOSg==
X-Gm-Message-State: ACrzQf2Wg/qcv4404VnkKT3CideiduVerDtDXvh8j3eKa/fAX7ffEVon
	Z3P9KZnN9a0hxzlAFgNhZZfLNICdyTZBs1mYkZnjqg==
X-Google-Smtp-Source: AMsMyM5c++58mJg6Fj39MwXHlnL6qJBS4f0332CHdhdif7HvK4LEVjIVod0Q2Md/RTcCOCLNWTeDPXB2Zydg5D3nTck=
X-Received: by 2002:a05:6a00:24c2:b0:52e:7181:a8a0 with SMTP id
 d2-20020a056a0024c200b0052e7181a8a0mr25739737pfv.57.1667402059116; Wed, 02
 Nov 2022 08:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221017142007.5408-1-mengqi.zhang@mediatek.com> <20221017142007.5408-3-mengqi.zhang@mediatek.com>
In-Reply-To: <20221017142007.5408-3-mengqi.zhang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Nov 2022 16:13:42 +0100
Message-ID: <CAPDyKFowa5mXVTU+ZcoSRp8daz=O=AJ1BdnH2roCG-hmB3Bz9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bingdings: mmc: Mediatek: add ICE clock
To: Mengqi Zhang <mengqi.zhang@mediatek.com>
Cc: chaotian.jing@mediatek.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	wenbin.mei@mediatek.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_081421_090339_D7C3B7DA 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, 17 Oct 2022 at 16:20, Mengqi Zhang <mengqi.zhang@mediatek.com> wrote:
>
> Document the binding for crypto clock of the Inline Crypto Engine
> of Mediatek SoCs.
>
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index d8e1e2e9adf2..f93d686e2911 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -57,6 +57,7 @@ properties:
>        - description: peripheral bus clock gate (required for MT8192).
>        - description: AXI bus clock gate (required for MT8192).
>        - description: AHB bus clock gate (required for MT8192).
> +      - description: crypto clock used for data encrypt/decrypt (optional).
>
>    clock-names:
>      minItems: 2
> @@ -69,6 +70,7 @@ properties:
>        - const: pclk_cg
>        - const: axi_cg
>        - const: ahb_cg
> +      - const: crypto

Looks like minItems/maxItems for clocks needs to be updated too.

>
>    interrupts:
>      description:
> --
> 2.25.1
>

Kind regards
Uffe

