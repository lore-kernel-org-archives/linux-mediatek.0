Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F302DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 07:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcfJPJX9Ic9wWWIi4of3spNB1RfH9ywBAKoANeznSL8=; b=N2IVvf25bbbl28
	rfEJ2FvOXlaf5JzB2o1UEuNAblZHVSqOJLV9EpwGg1tS1DN2o4CPvjYP21D5xyBoGuwqckH1jijJu
	nmozUf3mS59ods2jCntH3wfhBMVCgfHpG6B1leh8ePmxZo/I9/djTgpUFP9bx61PzDv+cSbiOG4fT
	IsGgihb2BtpP4BDvkY5x47XDv45AXrKJFbcjoPe3ceXIyPxfGRiQBuKLBKwdqI2mmQzEEg7gxa2tv
	5ql1y9iUHuj0Vpl3htxL3mddD/h4eZRUQylJ9VvVdv6nvoKXiVdpEj1jm8oJ0R0KgSsvVmUpiZMh/
	166e6ZMs6L+cQDqQfUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyOS-0056zh-IS; Thu, 28 Apr 2022 07:16:52 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyO6-0056rY-WB
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 07:16:34 +0000
Received: by mail-ed1-x529.google.com with SMTP id p4so4503635edx.0
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 00:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qK/yNrchERZZb5WKsXnjQKVBWPRpxhxKirZegeYDkkY=;
 b=vJtMFaDNzaFtW99IRYyFTdk1Q8rYW6IgWzug6j118ma2yzmHBEoZiIvjA+nqqYpWTQ
 Jn8F9zn8piDuH+HVvvDNy9n1snQ3Zs+xiBydHljNiaIbnqk8kbFOE0jRdRmK/FE35t8E
 FwMLiIdpJsgd6pblclSuZNN8qA/zm0bLgh3FI8opcF/fbId2RbGSF/AZhU+Y01/1Kqkj
 8V7lXoleyRtSyGVds/TB01VyhRAALqiMR4zPJ06+KXwLXXWgClKJKlvHm/ahNu2qXB5t
 B4+IvMdt7au54atFCYPkxViu6/L/e/tVm+btfCw+jvW12VGe5M7Cz3wa/8D2RaJ5SqI9
 EYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qK/yNrchERZZb5WKsXnjQKVBWPRpxhxKirZegeYDkkY=;
 b=Mdg3A089GBuU0TGLZY0T15Br2pcEYiWMIHHiiBp56KEiYi6BzxpWnYr2QJ6OV0grqJ
 a9/tL13KHWO2KOnjv/BpPkdpjUR60nGNiLl1asfBIpnvSfXhRRA0FY3hLhjtOdK1nk+Y
 FM8e4/gyHq+mzwWJy4LSchea9LmvmWff2pmNZz9otBnSRHs3/ocXHzhzGIhH2/gtN7X3
 8MILaLlrdkQqq4xqTz8ZNY7AicLLNCTCIJbM6iVyh+rM1FQyB5S5x1CSr80OEccrMcr7
 Mg66Rav56R8H2pf57UwAPBqRnsJn2TUXhwoS9zv+IzDcDFDcgz0L1xTt2B6zEAvUDQQv
 smLw==
X-Gm-Message-State: AOAM531RmfcDZulLl7kMQNy3vJpLFG4kWHre4U4zn3Ta8jwXHaVIrfje
 AootDyIBdzMrGPk2AwfYdQ4v6g==
X-Google-Smtp-Source: ABdhPJwRIlMZ/N3CaLiouXW/V1Nu5fEPPg34JRXTySZPqf2rTLSJUyAHmbmbfn25DsZhtMrqpgtQAw==
X-Received: by 2002:a05:6402:2985:b0:425:d51f:ae4 with SMTP id
 eq5-20020a056402298500b00425d51f0ae4mr26454621edb.379.1651130189275; 
 Thu, 28 Apr 2022 00:16:29 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 z14-20020a170906944e00b006f38c33b6e3sm6086651ejx.68.2022.04.28.00.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:16:27 -0700 (PDT)
Message-ID: <b7bb228f-751c-e7ad-a695-3dc40d889a72@linaro.org>
Date: Thu, 28 Apr 2022 09:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: refine power and gce
 properties
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220428012715.2619-1-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428012715.2619-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_001631_110286_34C7ADA8 
X-CRM114-Status: GOOD (  22.08  )
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

On 28/04/2022 03:27, jason-jh.lin wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> Power:
>   Refine description and add item number for power-domains property.
> 
> GCE:
>   Refine description and add item number for mboxes property and
>   mediatek,gce-client-reg property.
> 
> Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power and gce properties")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 29 +++++++++----------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..6722f1b724ef 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -43,28 +43,27 @@ properties:
>      maxItems: 1
>  
>    power-domains:
> +    maxItems: 1
>      description:
> -      A phandle and PM domain specifier as defined by bindings
> -      of the power controller specified by phandle. See
> -      Documentation/devicetree/bindings/power/power-domain.yaml for details.
> +      Each mmsys belongs to a power-domains. If mmsys wants to use PM
> +      interface to control the power controller of mmsys, it should have
> +      this property.
>  
>    mboxes:
> +    minItems: 1

maxItems, surely you cannot have infinite number of mailboxes to talk with?

>      description:
> -      Using mailbox to communicate with GCE, it should have this
> -      property and list of phandle, mailbox specifiers. See
> -      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> +      If using mailbox to communicate with GCE, it should have this
> +      property. GCE will help configure the hardware settings for the
> +      current mmsys data pipeline.
>  
>    mediatek,gce-client-reg:
> -    description:
> -      The register of client driver can be configured by gce with 4 arguments
> -      defined in this property, such as phandle of gce, subsys id,
> -      register offset and size.
> -      Each subsys id is mapping to a base address of display function blocks
> -      register which is defined in the gce header
> -      include/dt-bindings/gce/<chip>-gce.h.
> -    $ref: /schemas/types.yaml#/definitions/phandle-array

Why removing ref? Does your binding work after such change?

>      maxItems: 1
> +    items:
> +      - items:
> +          - description: phandle to GCE
> +          - description: subsys id
> +          - description: register offset
> +          - description: register size
>  
>    "#clock-cells":
>      const: 1


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
