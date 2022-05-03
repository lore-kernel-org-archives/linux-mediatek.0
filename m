Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 21:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2IJFcfDYAL020Yir3w61NI84mSlubLLLiZeZG0taV0=; b=pih6wJKJVNl7oY
	QkwPJhDPEv9wpbr5VHHt4SUTL7Chp+RyLTmDN36u6pATo/iwa+e1672RgQP2Uh+kD4tDWP3GkxQhz
	6FKeZ/Nng9rNsjsDR30Bs6wSRIcxqjYhjVfQCmJ2SDAUyvq2oRWAieIbIbuiXF5RFWIZAi7kRYX4p
	XmwrzFx4dY7T4PJNVGM2FIeVWQKYsHA1Ebsf+YcpuayInG1foSPc0dn8RxVFvpELPwOfU9UyTG2RY
	mPUek7S1QkLPlKiY+6YOR5gClxt+MAhdDKdaK2/3CjYURrnWNKzGDKCBtek6wssVJCjd3fOXDczF4
	zqIVvS2a7gjqqLTuD74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm0OH-007rYX-Vi; Tue, 03 May 2022 21:49:06 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm0OE-007rVJ-1o; Tue, 03 May 2022 21:49:05 +0000
Received: by mail-oi1-f174.google.com with SMTP id l16so12318539oil.6;
 Tue, 03 May 2022 14:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PMK6sujVThrZqgCpTOHtQZPh22N0TVlCzqEoQCk6YC0=;
 b=wus4XLt3Q1/zvvCor/GUQWbX9LTiyq/acP6hXaDRS/zZA0uscyTViJEwz7v/8vjMJg
 dih0WNfQ9mSzGIN7HIQnojAggoqk/9bJ1mvU9f37qnQQ1xGqM5iI8N8qSM+MXrugbsLG
 57cDliryGIGqrdPL/yn1Zy9PDLflvRQPpVcw8GriaftJXW86q/h7+dcah0Q73tuiHKy8
 xOyc1FE9LBNFLD0eh1t9kU+5KOi61M30KEmBpIXpY9fquXgJp5coNwnC348/YOWIdCuN
 N4hdm0ZC2eaJD1/fudHVLzAwKh2mzbnDKDkqnSy0EjbDUIYDovhWQF5GDPqltzjgr7ti
 gP/A==
X-Gm-Message-State: AOAM530QTVDucoJ8y0nNvLi/AN3QDRQsZuZjI0a+6dO9tDj5mg19rcC+
 651vrtJ36BVBRPd7mAJraA==
X-Google-Smtp-Source: ABdhPJyXG3Qb+wCY6PcVesYD78Lvr1fJPRxuDGrnHOap6UmNMid5rtVdvpuNP3xxFfMNVRKy3LDlTQ==
X-Received: by 2002:aca:2403:0:b0:325:6dae:a63b with SMTP id
 n3-20020aca2403000000b003256daea63bmr2595593oic.230.1651614538887; 
 Tue, 03 May 2022 14:48:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a11-20020a4a9b0b000000b0035ec65ac944sm4941869ook.16.2022.05.03.14.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 14:48:58 -0700 (PDT)
Received: (nullmailer pid 91855 invoked by uid 1000);
 Tue, 03 May 2022 21:48:57 -0000
Date: Tue, 3 May 2022 16:48:57 -0500
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, allen-kh.cheng@mediatek.com,
 weiyi.lu@mediatek.com, chun-jie.chen@mediatek.com,
 linux-kernel@vger.kernel.org, ikjn@chromium.org, miles.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding
 of MT8192 clock
Message-ID: <YnGjScfQA9axBYBO@robh.at.kernel.org>
References: <20220429123133.28869-1-matthias.bgg@kernel.org>
 <20220429123133.28869-2-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429123133.28869-2-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_144902_156076_9D9837B3 
X-CRM114-Status: GOOD (  15.16  )
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

On Fri, Apr 29, 2022 at 02:31:31PM +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The msdc gate is part of the MMC driver. Delete the binding description
> of this node.

An ABI break is okay because ...?

> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> ---
> 
> Changes in v2:
> - Delete compatible in binding descprition as well
> 
>  .../bindings/arm/mediatek/mediatek,mt8192-clock.yaml      | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> index c8c67c033f8c..b57cc2e69efb 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> @@ -24,7 +24,6 @@ properties:
>            - mediatek,mt8192-imp_iic_wrap_w
>            - mediatek,mt8192-imp_iic_wrap_n
>            - mediatek,mt8192-msdc_top
> -          - mediatek,mt8192-msdc
>            - mediatek,mt8192-mfgcfg
>            - mediatek,mt8192-imgsys
>            - mediatek,mt8192-imgsys2
> @@ -107,13 +106,6 @@ examples:
>          #clock-cells = <1>;
>      };
>  
> -  - |
> -    msdc: clock-controller@11f60000 {
> -        compatible = "mediatek,mt8192-msdc";
> -        reg = <0x11f60000 0x1000>;
> -        #clock-cells = <1>;
> -    };
> -
>    - |
>      mfgcfg: clock-controller@13fbf000 {
>          compatible = "mediatek,mt8192-mfgcfg";
> -- 
> 2.34.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
