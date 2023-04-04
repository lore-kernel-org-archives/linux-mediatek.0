Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CA5C77B6C
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tODEIpAwPnvNGUawqsylxasQ6Mk6tuNFhtn3yBSRNT0=; b=GbhoZUGGNBVgZ9mgxls2vvFPKy
	YzT50ux7vJn/VpaPzLPkBdKLvLRH1otHULVmatHLtrIUgzR7vx7W5ezWG2MUFnnVhEn7BN3mOcUbY
	dbtZZ+5K5ySiWEeFew3WMs/kIEjbbyeGK6IrjINSrXqVavz9leBYn+Rc4NCNi9RuFi3zlNlNtFLIy
	LHYPZ5YLaeG3oa+BkjmZKJimrjU5TElp+G6bAgGHJ3WZGNSQUJ3FF9sHnWRZWUhKRg25ybVY9VpE5
	rwWDF1dxMy0AjpeqEe0/p17dMehCBmAoqyomoIX72dH9x8lc0j7WADyVUUW1kin0f5lRmLupQGLU6
	zc7pi8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjgx7-001WJt-0k;
	Tue, 04 Apr 2023 13:44:01 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjgx0-001WEc-1M;
	Tue, 04 Apr 2023 13:43:58 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-17786581fe1so34547529fac.10;
        Tue, 04 Apr 2023 06:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tODEIpAwPnvNGUawqsylxasQ6Mk6tuNFhtn3yBSRNT0=;
        b=0LkmE0sYtzIxIrX3N4AwsR5+GxJxSsiBDSXAd2fVjnD2A+ZIOALcUR9xGI7gr2qBb4
         To0udeCYrbWKr1m6EZS80WhKuF7nkY5lX22ppB2amgROLQqJASCshHeGxuCBqH76ZjDk
         Enx81Za13V4H5S9tv1NdTwEBmvqDBL6VLdkLQGX6riz6rV6oWWQ6XZbnbgNoZZqtM440
         vyW39XP7P/FSySRTa6or2vMOipY/y+Pjxemu7hKE42tG52W8GJPuvuWJGqpZWd5WazhE
         PyYCm/1bg80EUB2O13BKtJJ/zP8KQmuNJq6dkyZdwhw6hDi0Y7BFkf4LDgI3Hu17XdYK
         Qkrg==
X-Gm-Message-State: AAQBX9eI6MpKaWIvRXUMl9wgEgp0dTMLmPgRYE1xnJleQqzK4ILb970/
	ecOAkZoWCuKcSn3motRq1Q==
X-Google-Smtp-Source: AKy350bsxMNesEfeufKU5Vad6zN3YBIROdhHPyyDXnruiII2TswWfiDxkGwWW7TE7zwGEZ5lANV1XQ==
X-Received: by 2002:a05:6870:f223:b0:177:80ce:497f with SMTP id t35-20020a056870f22300b0017780ce497fmr1909308oao.7.1680615831247;
        Tue, 04 Apr 2023 06:43:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id yg21-20020a05687c009500b0016a37572d17sm4853705oab.2.2023.04.04.06.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:43:50 -0700 (PDT)
Received: (nullmailer pid 3785276 invoked by uid 1000);
	Tue, 04 Apr 2023 13:43:50 -0000
Date: Tue, 4 Apr 2023 08:43:50 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>
Subject: Re: [PATCH 6/7] dt-bindings: usb: mtu3: add two optional clocks
Message-ID: <20230404134350.GA3782583-robh@kernel.org>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
 <20230403025230.25035-6-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403025230.25035-6-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_064354_478941_1C72EB1E 
X-CRM114-Status: GOOD (  13.91  )
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

On Mon, Apr 03, 2023 at 10:52:29AM +0800, Chunfeng Yun wrote:
> Add optional clock 'xhci_ck' and 'frmcnt_ck';
> Add optional property "assigned-clock" and "assigned-clock-parents";
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index d2655173e108..50c15f2ce14d 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -66,6 +66,8 @@ properties:
>        - description: Reference clock used by low power mode etc
>        - description: Mcu bus clock for register access
>        - description: DMA bus clock for data transfer
> +      - description: DRD controller clock
> +      - description: Frame count clock
>  
>    clock-names:
>      minItems: 1
> @@ -74,6 +76,16 @@ properties:
>        - const: ref_ck
>        - const: mcu_ck
>        - const: dma_ck
> +      - const: xhci_ck
> +      - const: frmcnt_ck
> +
> +  assigned-clocks:
> +    minItems: 1
> +    maxItems: 6
> +
> +  assigned-clock-parents:
> +    minItems: 1
> +    maxItems: 6

You don't need to include assigned-clocks properties. They are 
implicitly allowed (when clocks is present).

Rob

