Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52099C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/dqnQ2JT0K4pyQ2LmgUKloKfofYaa99pLMgGtb+Ey0=; b=hGOQthJkYJxZErpz/nnuQ4Uo66
	RcpC3htv6FujJ7TbQ1lTnxUfLzkhtRDJQQu7HKW445AIuuz21E8DVUwG9R5G0KjjUVBhfv0k4plQx
	P4+zkf11NA4BHx1MFmUp2Rh06YVT2RpZibDg/KMV6ZmjkK/gDnyJOrFls5RKTPCKDGfanwXhgoVi5
	/BWbO/ArS6B6aO4eIU2lu29xgv6dNxWKbK83lBwDCWxuXajNG3EXjSUVZJ/HhLKIeqQ/VITdlUeVc
	C66GrBEbkk5bprEjXQxCXCdUYpkI/qI4hnOpPqOKwtq3WJGkwFVpiVHbo5BTGHLcH5P0Lix72k/ju
	bfxfAz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZsh3-001z5j-2o; Thu, 31 Mar 2022 11:10:21 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZsgo-001z1f-KH; Thu, 31 Mar 2022 11:10:08 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id k7so19435986qvc.4;
 Thu, 31 Mar 2022 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LZri1QmIwLg+DYDniyH354wuZz2jQq8wnmWC2f+UvNk=;
 b=CGA6tXQogr4P9WKRr+lZhqp9py7WDO3T3bGcSQVl7FIa5pnDzCYtWC4wHcwuV2hTV1
 +ZDKRpFgLDI9okt/43VRNMa5ebU4XgNYZ6jsAPb77ZpH3NPV/reG8xbY/OKpoeqtyiNK
 TYl69QUr2tU6KLvcA/9p5nU8OXC934lN9frhCpTckQkAJIPnLegbA2D85x/k+qJtdraJ
 gJyjzUrpbLdIdm1ykbgclDVuFm2dFAiBCHNlyDtKF0Sa6KNrUMk1YwSWIyiY9mk2EMgZ
 +6vEotV7tobYGVQULCJMTDbelNBDszml1TuvdqJvx7opxStcOyAMWjRijl4ousBWvBc1
 Dk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LZri1QmIwLg+DYDniyH354wuZz2jQq8wnmWC2f+UvNk=;
 b=el3RnzFA0kwDVoKnVTsjOa4PWVzoo6hhdHny5Ke8xGQtvDZ5ihbBgUsfktMJFBIhRY
 k3ON273ZvJ18bOFE98H364ZP7njDIvp58dzzC1bI9ENq7pqBW9KEfwOD6habkn8heWxy
 kU1iAez2P+eq1YNOwl0ysRfS7R8QLl1sUadsX1CvR7Jli/ks/rsa4WjSORRDWy2lVW44
 IiFE8h3EgfO0k+OfjlfQtue5Kgnwj/UR4MTyeVePbAABVS7cJ5X17kVKkVMw77KnYRfh
 xYbH2TyXlVIAhL28dnVksLTY/zXtymMLJRIm+cJCH6f4BjwToVyIihprpNwGGUt87gDS
 TgjQ==
X-Gm-Message-State: AOAM530DNzrMsXY3dWG0HUqM4yMz80rojhI6Fp1CQOu7KC2n5hn2AMp0
 T5H9TdqVxcaaCAlCuXA+gfE=
X-Google-Smtp-Source: ABdhPJwbMO7Mb+rcF4NaO4plvZQNRBr0+sy+UcxUK021eXZb5rKWyrXmPYZFiMSqbvKzXOVrKS/fcQ==
X-Received: by 2002:a05:6214:d4e:b0:441:18d8:8366 with SMTP id
 14-20020a0562140d4e00b0044118d88366mr3464915qvr.46.1648725004854; 
 Thu, 31 Mar 2022 04:10:04 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 z203-20020a3765d4000000b0067b48d49c65sm12142999qkb.95.2022.03.31.04.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 04:10:03 -0700 (PDT)
Message-ID: <258d7152-326e-4f0a-859f-5864f01fd212@gmail.com>
Date: Thu, 31 Mar 2022 13:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 2/8] dt-bindings: arm: mediatek: mmsys: add power and
 gce properties
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-3-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220307032859.3275-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_041006_758068_76BDC0AB 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 moudy.ho@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/03/2022 04:28, jason-jh.lin wrote:
> Power:
> 1. Add description for power-domains property.
> 
> GCE:
> 1. Add description for mboxes property.
> 2. Add description for mediatek,gce-client-reg property.
> 

As you have to resend the series anyway, would you mind to make the commit 
message more sound with whole phrases? Other then that, the patch looks good.

Thanks,
Matthias

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b31d90dc9eb4..6c2c3edcd443 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -41,6 +41,30 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.
> +
> +  mboxes:
> +    description:
> +      Using mailbox to communicate with GCE, it should have this
> +      property and list of phandle, mailbox specifiers. See
> +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function blocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
>     "#clock-cells":
>       const: 1
>   
> @@ -56,9 +80,16 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/power/mt8173-power.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +
>       mmsys: syscon@14000000 {
>           compatible = "mediatek,mt8173-mmsys", "syscon";
>           reg = <0x14000000 0x1000>;
> +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>           #clock-cells = <1>;
>           #reset-cells = <1>;
> +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>       };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
