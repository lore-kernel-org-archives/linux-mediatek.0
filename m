Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890BFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7Z8Oq/N1snRilFkDMnuPrdPEDMso2jM0FaGQDzdi0Y=; b=q41hvoYua7Sskd
	t5Rm22u/C731tGqKA+g1M0P5rFhIF+suz6Spb99vTig1zBotfntfkqyKghPhBRPglhN6kobxQE3jm
	6TTk7jbjlzbvLvtGSgAKy6rRmJOeZg6W+pdNC5nFUU8yUpuBW1sjGgjFA6DdAn5b5FyrCsGwPOqk9
	1ZaPNmZHS4kFayRaE8PD1lIH4PLA40+KoDuiY9lYX3gD+1ZLUS/k1cmGQWj5atGTQhR+tMxsQj+Md
	YcdyMZ1q8NVMbQHO3PoXmrU5kuGsi5mRHaClkica94RZecnIrboavAGI8rWWJe7Yg0LlJr0iHZEkH
	ymhzijhXyTdhjy1crrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlYXF-001cwW-50; Mon, 02 May 2022 16:04:29 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlYX2-001ctu-4J; Mon, 02 May 2022 16:04:19 +0000
Received: by mail-oi1-f172.google.com with SMTP id s131so15654503oie.1;
 Mon, 02 May 2022 09:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=noR4HJFk7F0HSQNOMAQMG2M3tgi4T2ok0ZfyfqSOv20=;
 b=Cc7eAQqFMLjAmc9hLbKQ8ImRTUO64ypueOiFXbW1WDEh/vtkMwEdCuARpiiGQkNXkw
 /k7n+rwgny9Ba5Z1yLGrmnHhyLPjKKwS76DXalbQAIQIrsSEum+BAQOIM0JkrqnRCNwO
 iMn8qzK7u2YiqJsTB2lQIENILFAD+VceN4qLjiQ+2ycGxk4qSxSwbw8ltbQIyi6qH+ks
 SQ5G8ppfp02MmPts+3UdD1A4ZfkTkmwMvPwP80Ciji8jovr0XwG8UVT/ypzde5zA7gJT
 ASEaEX4Pn587eTYP93J6NcnDv5yXttiqnlAdOlMMk5vM694d56pTE/TyEZUF8r4BxlCz
 XTBQ==
X-Gm-Message-State: AOAM531cTHDhE+b/PxbP7WJKbmnk1e65gvc4zFZBzujEXGN08SLLoT6f
 gdyWHM5pJ9WLTszl7TwLmw==
X-Google-Smtp-Source: ABdhPJyp3N6PwcEyY2JXcQYDhoqtY3kwoqFv7iQuO063fxQxQ8tSr8xXiV7qNElm4YmaKCFaLGRjOA==
X-Received: by 2002:a05:6808:1b0a:b0:325:ee07:e289 with SMTP id
 bx10-20020a0568081b0a00b00325ee07e289mr2987836oib.281.1651507453547; 
 Mon, 02 May 2022 09:04:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e12-20020a4ae0cc000000b0035eb4e5a6d9sm3957814oot.47.2022.05.02.09.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:04:12 -0700 (PDT)
Received: (nullmailer pid 1215744 invoked by uid 1000);
 Mon, 02 May 2022 16:04:12 -0000
Date: Mon, 2 May 2022 11:04:11 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk,scp
Message-ID: <YnAA+7eqP/WzGrhQ@robh.at.kernel.org>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429211111.2214119-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_090416_204680_30078B5F 
X-CRM114-Status: GOOD (  15.66  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 29, 2022 at 05:11:10PM -0400, N=EDcolas F. R. A. Prado wrote:
> The SCP co-processor can optionally be passed a reserved memory region
> to use. Add this property in the dt-binding.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> =

>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/=
Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index ec9ddeb6ca2c..64a9d2c7ed0d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -51,6 +51,10 @@ properties:
>    interrupts:
>      maxItems: 1
>  =

> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle

memory-region has a type already, so drop. What's needed is how many =

entries and what they are if more than 1.

> +    description: phandle to reserved memory region.
> +
>  required:
>    - compatible
>    - reg
> -- =

> 2.36.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
