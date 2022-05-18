Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED716C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zex5UlufS6BOrcXLMlmxbs2VcRGRCTPYbQ+freXeg1Y=; b=1p/T65R4rcf3rX
	yFqVhaNGsd1CedLdMg39dLFODP5KrhraHa6sUJQ/NL/IgrYE/+j0xyphH6W18A7bJqN7mhVG7h9oE
	tHYhwo4l9raWw2rOjE9uXSlYJWNIhVS+OzRJAyPy+uyJ1lPjUc4s85p7PEEsx4GaQnU+KyhV1bD7+
	L+Uod1bxE+DHhShmkSR7xdjHRfj9Wz7vE3lY982MGN0gDqYnACR1MEa8qnymHpY8nx+IBRYDWWzcZ
	caN3sHnClS6p+8+ssW22nCBa01bYNlOJruxJxiuzlhHgxg/T7AIJ8fyFxyhfodQgSRxh49zbSi9i5
	nfACkszn3MWjZmD7Eezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrFnH-000o16-5h; Wed, 18 May 2022 09:16:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrFnE-000nx7-D2; Wed, 18 May 2022 09:16:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id r23so1795917wrr.2;
 Wed, 18 May 2022 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AJ/PeRbastM8KtwKP00d5Dtpk6YYbHWpbi26hK6kis8=;
 b=Sb6MUDzpI3Do12SoVOog4trxfn9HkOWzjeJE76NDXkSoA5+fRAmSg1quRuL0EaHHMq
 m6AxmVYU7qZ4kUOuIhQsD2r+4H7X/eY9MdaLsZClCj+chZ/DoiVRhX9q9MC9cVk+qB2u
 rKLz50JW6LMpRFFumwP9Jdf2NLUMxYBb39/m7I1paORnMA76t7UYktiptr2D7kQNW9fM
 Ilp+EyfIAquY2zUojfnFJBq50LF3ol0dyv8ykoL/ce1uU9ZpB3AJf2RGUb5yvijmFIHy
 vhOOAZG3Pzx1dZuw2baXFhCQfbnqUvTEPayqaYHkt2lviWQdjqQoRKNEAeblCa+BKcYt
 CR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AJ/PeRbastM8KtwKP00d5Dtpk6YYbHWpbi26hK6kis8=;
 b=4ftgRc72650yXS5/zs0zOegvxhAzf15Z+16rqaynmiFF6SsuQoPB8d1aoHdUQa2cI3
 n6ddfBJz2U/Gh0tzX1x7m/Yxo931G9jgyu8xEm41mg3hT+I/tQoe3ta1WMbNYSVkb0t1
 /zU/DiHM+NB0LhQR8WND3yQcW/xwDw+kGm2uQFTCNzuDE/JQjrp9byKlVjVmeMzC7DFc
 WyAyzY4mzt6YIdlzUdCcXAOyHqNfhEKtQ9pEAC3eb/qHbYfDIZQctiHIMQDe/fpm29b+
 Gy8K1cfQXhGCl1ZC8/J2gXDN/cFD/VdowPO9CXv39EOp0s0oXR6cfb9tijENrP8SCP8k
 UA+g==
X-Gm-Message-State: AOAM532XuAJdS73OqOutB0XT1XiwC37unfYBSkBp45pA7jziCmaZBlVA
 W+v4xm78ceg2gPL+aIiImYk=
X-Google-Smtp-Source: ABdhPJwEWT0S1cQNRyp2Os4DAQEhukNT425BpsOswVM115DyQwaHDTQ4H/1aAl9xuumtGy5hK18drg==
X-Received: by 2002:a05:6000:1a45:b0:20e:6164:d86c with SMTP id
 t5-20020a0560001a4500b0020e6164d86cmr1405752wry.561.1652865390262; 
 Wed, 18 May 2022 02:16:30 -0700 (PDT)
Received: from [192.168.0.36] ([5.225.216.194])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c1d9200b00397122e63b6sm1227595wms.29.2022.05.18.02.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 02:16:29 -0700 (PDT)
Message-ID: <ad4aac8a-ef1b-d4eb-7045-a46bd39ad3fc@gmail.com>
Date: Wed, 18 May 2022 11:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] dt-bindings: iommu: mediatek: Add mediatek,infracfg
 phandle
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220517132107.195932-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_021632_496165_8B625639 
X-CRM114-Status: GOOD (  13.96  )
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



On 17/05/2022 15:21, AngeloGioacchino Del Regno wrote:
> Add property "mediatek,infracfg" to let the mtk_iommu driver retrieve
> a phandle to the infracfg syscon instead of performing a per-soc
> compatible lookup.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 2ae3bbad7f1a..78c72c22740b 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -101,6 +101,10 @@ properties:
>       items:
>         - const: bclk
>   
> +  mediatek,infracfg:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle to the mediatek infracfg syscon
> +
>     mediatek,larbs:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       minItems: 1

I think we can squash patch 7 in here. Same holds for pericfg

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
