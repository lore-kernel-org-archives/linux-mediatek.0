Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C24C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MdxxxNf8/C9DHGNvjV9Gv4cDV8K399+6RuyVcvNPrQI=; b=xPo4haCAsSv92E
	SUFTJiL4pY4ohCCegnsrLmjgUEbv5Ii6X/G0T6d7IViBcKB4qnj0uw22jIY03220bSyyRW9rVg20F
	9AYVPWWIPrlHWZXt0368KPIN++C1sYVx87a403jGP5ixUWL+jdGPDVj9jqliRHNnB/1MSFlOEc5Re
	BjFORnnhF5LwzSdOGZ/RXl2frlMKrHKPwW/3n2gM5ULhMbLYgrXwHKhX6lXOxZvAYcLJrfgEgy3Si
	KepUkxXIILopttgr9ZNdrPwttc0rsPWAm7VJzmvXNlNJUkSJ5pX864KfVxIC9jNgXT2XKId+VwkNE
	vOkdasad4xtJEl9lsXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrHxx-001aam-VV; Wed, 18 May 2022 11:35:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrHrq-001XmQ-1J; Wed, 18 May 2022 11:29:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 i20-20020a05600c355400b0039456976dcaso2179418wmq.1; 
 Wed, 18 May 2022 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uFIsWxhH+SfWDbQeGJib3EffwTOsdWgNhmP3BKg6cTI=;
 b=GIk1v/SP46GpQB2aa29XniHa4XWAzmRQTBwJvI2ojRUnPlE+MqZBO6G6nMAupnb8W+
 G2EA2unw0FCDCoBzqtVzORAZzUFAFXx+Kdr8mqijkt1cl3qR20Nu7ks1Ou4EEIyvLfG1
 BKNUqHtpdNg9JkHJn34prfdFRVXewGK/0aMoRwE31kjLG9CzM4rhFuUz60WAX4Xx4Qtf
 Iw5hAdG4s9z4F6oM41gnCOxtwot5uL5itCKcTOqR+V3kIeqKyCtmTTLGt5h7TbNeBK4l
 1nRGHnUOJvvntrUCPXJu1pJXgzrO3r0Q2kDfNl8uDHZhwRBCu9LgjhUgB/igxBzXk6Dk
 Y+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uFIsWxhH+SfWDbQeGJib3EffwTOsdWgNhmP3BKg6cTI=;
 b=bRAHFgjPcWHQTe8xK4ACsJo0jx1g6DcSLFBjMlvsdu9wd3gA5cWmT7D3kl/Aa17Tbv
 U2+yDtZV+SaPgIh6PyzUb+LxFh/xVvOJWtB1pg3agld/bx3d+K8DJPq9KhSh4ifp5BrD
 2QViQMbwQHZtcGCBbJ9qreUiCqE+ZGw9xhRH0SR2tlTtX8uwrCGkFeDrUWpXQ/L0w0+F
 kWJYQTGGR6/nK9usV9Bc3BOutwCWQ4mS+REhbOPn0Olouc3JSXElUMO3/2A4izfLxY/b
 3uRj02gEmsHUTkEacGr8yokB9WmPPGWLdLGaKQqKrBzkKg7iYgiyRkASD9mOHJSkDM/5
 1GIA==
X-Gm-Message-State: AOAM533UOV9XrAMKGsclcJPEKUkZdUID0SSE9K7qO/gh4mbrzpvQNLsS
 d1N1LS0Zx+NUeDgOo22kL90=
X-Google-Smtp-Source: ABdhPJwmMEJmW+CILoBoRlmxrlpjiQs7Ka6eyFZQusCiGX6OE9WPle9wfc8RX8mJ6nniBuuCC/UxRQ==
X-Received: by 2002:a05:600c:3549:b0:394:89ba:e1be with SMTP id
 i9-20020a05600c354900b0039489bae1bemr25309861wmq.181.1652873364178; 
 Wed, 18 May 2022 04:29:24 -0700 (PDT)
Received: from [192.168.0.36] ([5.225.216.194])
 by smtp.gmail.com with ESMTPSA id
 v65-20020a1cac44000000b003947b59dfdesm5121659wme.36.2022.05.18.04.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 04:29:23 -0700 (PDT)
Message-ID: <4cfbc8dd-83d3-80df-630d-6f8fb2efb9fd@gmail.com>
Date: Wed, 18 May 2022 13:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/7] dt-bindings: iommu: mediatek: Add phandles for
 mediatek infra/pericfg
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
 <20220518100503.37279-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220518100503.37279-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_042926_125551_C9A07543 
X-CRM114-Status: GOOD (  16.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/05/2022 12:04, AngeloGioacchino Del Regno wrote:
> Add properties "mediatek,infracfg" and "mediatek,pericfg" to let the
> mtk_iommu driver retrieve phandles to the infracfg and pericfg syscon(s)
> instead of performing a per-soc compatible lookup.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/iommu/mediatek,iommu.yaml         | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 2ae3bbad7f1a..c4af41947593 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -101,6 +101,10 @@ properties:
>       items:
>         - const: bclk
>   
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle to the mediatek infracfg syscon
> +
>     mediatek,larbs:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       minItems: 1
> @@ -112,6 +116,10 @@ properties:
>         Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
>         according to the local arbiter index, like larb0, larb1, larb2...
>   
> +  mediatek,pericfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle to the mediatek pericfg syscon
> +

I didn't explain myself. What I was suguesting was to squash the patch that add 
requiered mediatek,infracfg with the patch that adds mediatk,infracfg to the 
binding description. And then squash the both patches adding pericfg as well.

Regards,
Matthias


>     '#iommu-cells':
>       const: 1
>       description: |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
