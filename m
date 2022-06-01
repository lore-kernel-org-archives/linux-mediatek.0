Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86509C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QvdYtodBVOGd/el/L2KiQnavc4DMsxTKY7NKSvRKjU=; b=nc6saDvJGGI8k2
	RKOJ7mLGGBtcri0VW141+C2zKnqwGINPxGg6vV7ywAunpYFAqs7bKzmK7XPNsoZVBsWeAuU8udQlg
	K0MWxr+xoTpJJnWSTzejpq3bWkvqVHkqIBvoQQO7Gz7Xk+FCVONtDbfL8j4r2W/moFE4JOTHxhZyJ
	OZqbcbxxFBVAPBA3n+yecrtiztIX2Ah0cJ4Ou25Bcexl5ehv9I5LE2bkpYJ26rd56swQjrNaCBewM
	IPgqEpEu0HZfRWfxx/Cag3yEyILJ+Ad2GKDkscLjziiSk5A+SJdmLuHkEdkdHySOmXU353RHqNV3k
	rosZ1tCeegnA29NyIjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMrs-00Fkv4-9n; Wed, 01 Jun 2022 11:50:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMrg-00FktH-Oc
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 11:50:18 +0000
Received: by mail-ed1-x52b.google.com with SMTP id n28so1797170edb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 04:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NCu09c7It8PCgWDIsBdAVtichE5PsFctC0ahaIHP8Xk=;
        b=KD/GF46y0L9iV/6oC8B0iJGCrA1YOd1ZDr5ZyyRZKnNDXwqFSyH7pMugTFD19FNvuK
         DLG3zOI1/3Fg4wUPC6NHPSQsy5OZb4b0Gzq06f1NQQgETWqm89FW05A3FR2gVOXq19JI
         CVJ6LZEFdk42WkWzwgK+DKTWazScy0oP4rYwVZuAJM9xGuHcCJziiPFOQ+DYiY0ziLC9
         879vFCoj64XlDCsamSFbS8NsBkT6Wd/mB/bfROk0lZwGArhZOmwQjbsMRzUVQWJzSFqQ
         TKzfvDC846UfKtt8N47ycGDKj/fiFXjMu2XbHSJn7sd2vqALeK2+srAsZBIKPsgY1YKN
         9Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NCu09c7It8PCgWDIsBdAVtichE5PsFctC0ahaIHP8Xk=;
        b=tHR9hHWC2SEsR+CGll4Z6hx3dE2wCmlBOmvtoKw4mmfyIsDX8rkHQEA1VCtBzaRFkd
         avtVuMZRjwbYt5SBM4bPtTQufnKfjn+Vo6497nuOi9seJmkoytfz6URdWfet7jYKzAQU
         /9hpOZqmRybGoO9bOETMp5XpqM5KwvjIEIMsg7AVOKrWaiL+SDKzxdTgYQoP24UXUmG/
         Zgt+uSuBo7QIrT2+zNsCsRSV7UoTC31drDRN5OPIL1AtHz8IJW32SK/UNYwbVF23/Jpu
         zTwpQsGfdPSp8iZ5AWn8dBcRNuQp57m5rMVO6VOY1jLe+STPg7iEZi1fGwZ08DVfjcKK
         FESg==
X-Gm-Message-State: AOAM5314PxKd2pvi3IFpNUa89Kr8cO//7Q84aevwd38ZhJ/h+3lOSoFZ
	fTcyOLjRi1ZQw32ua0jqQUtB/g==
X-Google-Smtp-Source: ABdhPJyELI2heE5E7DXJZNsKABuJGaTaxV4OxNBunIxicg2IcK642ipDPhUCnEa0+rHGU5oepmuQnQ==
X-Received: by 2002:a05:6402:1851:b0:42d:c904:d73b with SMTP id v17-20020a056402185100b0042dc904d73bmr20563379edy.417.1654084213214;
        Wed, 01 Jun 2022 04:50:13 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e26-20020a50ec9a000000b0042ad0358c8bsm855792edr.38.2022.06.01.04.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:50:12 -0700 (PDT)
Message-ID: <dd3ea397-fa21-abe5-85ad-b8a4818dc011@linaro.org>
Date: Wed, 1 Jun 2022 13:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 01/15] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Daisuke Nojiri <dnojiri@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Prashant Malani <pmalani@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Brian Norris <briannorris@chromium.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 Project_Global_Chrome_Upstream_Group@mediatek.com, weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <20220601112201.15510-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601112201.15510-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_045016_871621_3248039A 
X-CRM114-Status: GOOD (  20.83  )
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

On 01/06/2022 13:21, Tinghan Shen wrote:
> The SCP co-processor is a dual-core RISC-V MCU on MT8195.
> 
> Add a new property to identify each core and helps to find drivers
> through device tree API to cooperate with each other, e.g. boot flow and
> watchdog timeout flow.
> 
> Add a new compatile for the driver of SCP 2nd core.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index eec3b9c4c713..b181786d9575 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -20,6 +20,7 @@ properties:
>        - mediatek,mt8186-scp
>        - mediatek,mt8192-scp
>        - mediatek,mt8195-scp
> +      - mediatek,mt8195-scp-dual
>  
>    reg:
>      description:
> @@ -57,6 +58,16 @@ properties:
>    memory-region:
>      maxItems: 1
>  
> +  mediatek,scp-core:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      The property value is a list with 2 items, a core id and a phandle

uint32, not phandle.

> +      to the sibling SCP node. 

Skip this. First part is obvious from the schema, second part should be
described via items.

The core id represents the id of the dts node contains
> +      this property. The valid values of core id are 0 and 1 for dual-core SCP.
> +      The phandle of sibling SCP node is used to find the register settings,
> +      trigger core dependent callback, and invoke rproc API.

Entire description did not help me to understand what's this. So far it
looks like it is not a hardware property but some programming help, so
it does not look like properly described in bindings.

> +    maxItems: 1

In description you said - two items.

You need allOf:if:then disallowing this property for other variants.

> +
>  required:
>    - compatible
>    - reg
> @@ -115,6 +126,7 @@ examples:
>          reg-names = "sram", "cfg", "l1tcm";
>          clocks = <&infracfg CLK_INFRA_SCPSYS>;
>          clock-names = "main";
> +        mediatek,scp-core = <0 &scp_dual>;

This looks like phandle, so wrong type.
>  
>          cros_ec {
>              mediatek,rpmsg-name = "cros-ec-rpmsg";


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
