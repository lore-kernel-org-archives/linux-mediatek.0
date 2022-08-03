Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5CBC19F2B
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 22:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75J351RhvLWaNaDEuKDQSYMAYS+EvEUS1HxFqA844aM=; b=YhWJYDFpiQ5x7WpyqJ9dLQDRBX
	WZt+pvzDRRxeMHfSn1cJXITe0p4RKl2opLRZ8f9hEdPzWny4ccXzEGwy5uIQGX0AAj2OMHCMS4DpA
	u6ieFi/TUOBHWlNvJC66fdJnISq0AzIXbzYzkqK8pkXYNXKE5xVs8A2Obwym/wINrE0VZaDetWlYm
	XWJGinN5m/oWZXb7uIOYfIjbGfyEFZo17UkCNJbO4XD99H+9y/ZQX8f3Uib9OBVgCfADc2jS4EOp5
	gID0DchFngFjZ+SD7OxdXGaUR+GwyO6qteLLM5IV/vLxJSkbzKSbWejLHfX4FQEsrS2U60ZEHvnDC
	8gbLUw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJMoc-00AKZz-D2; Wed, 03 Aug 2022 22:26:10 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJMoP-00AKNG-V0; Wed, 03 Aug 2022 22:25:59 +0000
Received: by mail-il1-f176.google.com with SMTP id g18so9189915ilk.4;
        Wed, 03 Aug 2022 15:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=75J351RhvLWaNaDEuKDQSYMAYS+EvEUS1HxFqA844aM=;
        b=v6yq2c5pqsRmmncY7gmSYIXsreECVmqJNi6yDDxHaYZzl4gPe2qZfXePStVou9Zsrn
         uaFen+4m1RvvbXsIPBWOFlk+52T7mNGBtqhQ45bNL7vajfC8LnSNU6plmIzz3EeLydP5
         ftDY/9DPCavFGU7Hz4j5acLsN5p4qTH3lp6f7YHG/IolCcsVjNJxLeAXX+8ns/t2pC5h
         ubINdFzxr1YSXRavHp+n67BuRrnynaJxqZhgv3EWj9MJRv2k4mqSS+giBfE68y9I6FLJ
         rh7lMGmxdzWtAqDJTYvPD7MmIyMU9yMPpdPNHIHMB7MMe+jj6DdQ4XhVmFIjqB53h/D5
         rtzg==
X-Gm-Message-State: AJIora+p3UK8QWcfIyn/4xwzu1fPGRpfyiiT9Oz+c3YEAi6/UkCTbLu6
	FBhUQ1XhsAP5rC8M9YHhzxcQPqV5pg==
X-Google-Smtp-Source: AGRyM1vFgEiM4mqDqG8n02VeO5CgzGHFBqz8H57zw5X0V7f6EMV3CS5bmW+6+WMG6BHO7ysuxySmDQ==
X-Received: by 2002:a05:6e02:1a25:b0:2dc:743c:864a with SMTP id g5-20020a056e021a2500b002dc743c864amr11342302ile.248.1659565555800;
        Wed, 03 Aug 2022 15:25:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id bc11-20020a0566383ccb00b00335b403c3b4sm8176076jab.48.2022.08.03.15.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 15:25:55 -0700 (PDT)
Received: (nullmailer pid 2730520 invoked by uid 1000);
	Wed, 03 Aug 2022 22:25:53 -0000
Date: Wed, 3 Aug 2022 16:25:53 -0600
From: Rob Herring <robh@kernel.org>
To: Elvis Wang <Elvis.Wang@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add definition for mt8188
Message-ID: <20220803222553.GA2727128-robh@kernel.org>
References: <20220729084319.6880-1-Elvis.Wang@mediatek.com>
 <20220729084319.6880-2-Elvis.Wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729084319.6880-2-Elvis.Wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_152558_074171_AFE5257A 
X-CRM114-Status: GOOD (  15.55  )
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

On Fri, Jul 29, 2022 at 04:43:18PM +0800, Elvis Wang wrote:
> Add dt-binding header for mt8188.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> index c2aeba63bd47..50f97f6feeef 100644
> --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> @@ -41,9 +41,9 @@ Optional properties for a client mutex node:
>    defined in 'dt-bindings/gce/<chip>-gce.h'.
>  
>  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
> -'dt-bindings/gce/mt8183-gce.h', 'dt-bindings/gce/mt8186-gce.h'
> -'dt-bindings/gce/mt8192-gce.h', 'dt-bindings/gce/mt8195-gce.h' or
> -'dt-bindings/gce/mt6779-gce.h'.
> +'dt-bindings/gce/mt8183-gce.h', 'dt-bindings/gce/mt8186-gce.h',
> +'dt-bindings/gce/mt8188-gce.h', 'dt-bindings/gce/mt8192-gce.h',
> +'dt-bindings/gce/mt8195-gce.h' or 'dt-bindings/gce/mt6779-gce.h'.
>  Such as sub-system ids, thread priority, event ids.

What about a new compatible string?

Really, this needs to be converted to schema...

Rob

