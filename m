Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7814C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQXI0opRyG+KP+wwVylg3slj4OSHCdGBvpftrlhigDA=; b=IJRMHXRb03nToY
	VZQBgVoxKZ/ut5gmmViSKw9clZhVl81e+UBh+BLoRliePh7B170sDvSrpMUpUQ4G45+OG7hFMvul1
	C32GJGzv8MUGi38R3j87DiWYvKC4aUKBvPBbr08pOcO72ZmyNaEjVSu+yLhJcKunfrD1cYktJu6/V
	JmRp4H7a8UquyByD8Kbs3MzmlnOKzFGW91M+jRIhoQ+jzDHYwfZ2xuT9SU5lWxnxAnog0voGkr6ug
	y7cI0wSAtV4XZX6w2hcnKA4X8o2WjaqakOKXWvukBGMqCH2+KYAw23KfLKyygN9hTS3vUS6Jy+uXX
	LD2VyVdrBVYZ+7+Yo7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj1ix-00AR0R-K2; Mon, 25 Apr 2022 16:38:07 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj1iR-00AQpB-86; Mon, 25 Apr 2022 16:37:36 +0000
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so3934641fac.12; 
 Mon, 25 Apr 2022 09:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BPP3GrMSZ4so9vOzeMSD29zszmPpXX3xsASpo0A7iF0=;
 b=r7Xo4o6zI2XCi2e2LzehaqiEJMSnZtIVSiyNrMl7iw29bV1+KUBTKh+9uwAe4w+QSO
 WHp3QSNgbfHUgQ/u6h1L7K4M3SyYR1oUmTWj00ac70M32mY0HOlQkSr5wOJp9BWjOLrU
 wUSJ1K9x+N0CcRGT4IrVgx4zhPdvv+eVDgHL8DrN0MXJiREnGpqIkW0KbpLpqLKrEHpw
 GuQWUpmF5fBk3PImcZUbdRAu3MANmoczoKSph7ApoU4aMOV1hFK2AJMWknAuXcNizRlr
 68MfDv+UOUjt2rWchZ4pk5TDyn9JmJqC+85BO8fQcBRDkXPvs1Ah9kbFPQqwcrePkO8b
 7x7Q==
X-Gm-Message-State: AOAM530JV32KMaGmy8ZeEaMkMoCoNKHJFKdpk++uJebG8pYGbiIm21tu
 Rg3BaaZJ8ZEtGld6irlE2A==
X-Google-Smtp-Source: ABdhPJx0iyWeVe+xhSq5pFWOaigeARSs207qX/GcgqnGWbeYydiw00PAO/VGIYZLJcJGhSdhBf0sTA==
X-Received: by 2002:a05:6870:a928:b0:da:b3f:320a with SMTP id
 eq40-20020a056870a92800b000da0b3f320amr6930848oab.186.1650904649920; 
 Mon, 25 Apr 2022 09:37:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 5-20020a9d0105000000b005fbe5093eb0sm3987968otu.54.2022.04.25.09.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 09:37:29 -0700 (PDT)
Received: (nullmailer pid 4024390 invoked by uid 1000);
 Mon, 25 Apr 2022 16:37:28 -0000
Date: Mon, 25 Apr 2022 11:37:28 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>, Hui Liu <hui.liu@mediatek.com>,
 Irui Wang <irui.wang@mediatek.com>
Subject: Re: [PATCH 4/4] dt-bindings: media: mtk-vcodec: Add encoder power
 domain property
Message-ID: <YmbOSHlTLRVzZOtr@robh.at.kernel.org>
References: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
 <20220421035111.7267-5-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220421035111.7267-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_093735_316306_03E8776E 
X-CRM114-Status: GOOD (  15.24  )
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

On Thu, Apr 21, 2022 at 11:51:11AM +0800, Allen-KH Cheng wrote:
> From: Irui Wang <irui.wang@mediatek.com>
> 
> Add encoder power domain property
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index e7b65a91c92c..de2df6c6352c 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -41,6 +41,9 @@ properties:
>  
>    assigned-clock-parents: true
>  
> +  power-domains:
> +    maxItems: 1
> +
>    iommus:
>      minItems: 1
>      maxItems: 32
> @@ -74,6 +77,7 @@ required:
>    - iommus
>    - assigned-clocks
>    - assigned-clock-parents
> +  - power-domains

New properties can't be required as that's an ABI change unless there is 
some explanation why it is okay/necessary.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
