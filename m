Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 22:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=to1MrM6ACDytoT71Zga031qMhmL9mk/RPjmcq8yQk0s=; b=l3PSTdnzD2IUJu
	JJ+44CpoYiMoUcrmYUtQUtWTATA1WR6/iFwpYN3SJoMtJK1dlqZEFg0NQdr51ehQQANDw3CGYQ+8P
	YAyolTHLnBtGDTCIJV9557tA2jeBzPaENwIfxrfJXLavdBm9h4u6UBQzEjG3K+4b4x1mf9RfDXQVj
	cnwdlDLeRpiiBF6Gii2HbRYXT0nC9nNCM+RV4IvHDE5hAF7TKrdGyg/pN1X9lJFWqU5WTazNGYQHg
	Mm3QG+izaQ7/zDt4mvkuRQVTehC8mlQaSkhBrs5loMM6yvcSdX+P9HOq/IvtBLBhLNGp+j4brRCQq
	/Epi4NpoIOrqRRwG1o8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4sMs-00D2jT-EN; Tue, 04 Jan 2022 22:33:22 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4sMg-00D2gg-Mf; Tue, 04 Jan 2022 22:33:11 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so12027435ooj.5; 
 Tue, 04 Jan 2022 14:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vyp0ZlymfUBJlUAVtIOpIrm/4K+CwyVLR4ySvnMgQQs=;
 b=lS0K1SXPmrnT3FXXnN6dI0SN6+box49D5brruHCOlFViK+OuYmUXCT8cniA1ULE+44
 ah22QTnGk2ksI6F+FPXgZDatyOI6zr0vcRAf97+EQbEyvzetEEn63l5AOYvKksfiC6Hk
 na7pYAJN85hkWAtl9lfXi0bfBQSUjkmTMKVo2jVXGCwGtbgcHxrZ8O3zyKP0uQrFKN91
 L1T00aBx9ckjPCu1fJ8MU/ae/0TOESKBPe2QE7gx8A1SFmehl9Upy8j8TEYyClD/kWGk
 Wx3E3RbSbDWqsor3CJTDFZTYiJxFFsZFGOBoib3miEJ2LEKm7pcase51AugLC3l7rWPQ
 1+KQ==
X-Gm-Message-State: AOAM532/G9OjlziPZovSklEeTFYzNpGheDKKcWb+vxCOuHaGcFv4zrpx
 B6nYdwtsy+MvoJSZbgpUUA==
X-Google-Smtp-Source: ABdhPJzNpFrcI/rkXMcHtDq7VDwS73qIpjhsYqKdPBLPM3cpBiZjkTX+V0DOvCWOkIvFUhaA/aESKw==
X-Received: by 2002:a4a:cf09:: with SMTP id l9mr31402830oos.89.1641335589318; 
 Tue, 04 Jan 2022 14:33:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g12sm6073845otp.45.2022.01.04.14.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:33:08 -0800 (PST)
Received: (nullmailer pid 1569633 invoked by uid 1000);
 Tue, 04 Jan 2022 22:33:07 -0000
Date: Tue, 4 Jan 2022 16:33:07 -0600
From: Rob Herring <robh@kernel.org>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>,
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: add cap-sdio-async-int flag
Message-ID: <YdTLI/Nms4JiNutt@robh.at.kernel.org>
References: <20211227083641.12538-1-axe.yang@mediatek.com>
 <20211227083641.12538-2-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227083641.12538-2-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_143310_769380_53EFC59B 
X-CRM114-Status: GOOD (  18.03  )
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

On Mon, Dec 27, 2021 at 04:36:39PM +0800, Axe Yang wrote:
> Asynchronous interrupt is a mechanism that allow SDIO devices alarm
> interrupt when host stop providing clock to card. Add a DT flag to
> enable this feature if it is supported by SDIO card.

A card property should be in the card node. Is this not discoverable?

> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 25ac8e200970..7230421583c6 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -165,6 +165,11 @@ properties:
>      description:
>        eMMC hardware reset is supported
>  
> +  cap-sdio-async-int:

Perhaps be consistent with the next property and use 'irq'.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      SDIO async interrupt is supported.
> +
>    cap-sdio-irq:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
