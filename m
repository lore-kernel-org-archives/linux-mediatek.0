Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480F2C19F2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gq6/HNhAQ3BSIj0Ba+RrM6ince6+tYXHxLdu6U01oYA=; b=wocD2nqmxYrA2MhTWMjBMIQIaQ
	OvJeyhlDvPcNZgsqf3eWumsYb7pMKWKy/+unAioFD+hyPDfo6BAkRXkYcIgQHP2hqpo2bkqyh9dWC
	Zd6Sc5zpcPKegpVYD+tbgGglhI2MDuNhN2i+CtfmcyOUS+Q1R4plIHnloKg7WzAyW3kQranaImMnF
	So3uiiy/fcGJJwxlamEft+awK8Sd0vM6l6j+ZQAx1eMIOr6sHWc7OxuSUDvC1pHXKg4Kc8UALZ8JG
	4tpd7pJeVLeJXawZmf4Wqe2w+kX/Yv1NMFuFJhwDrI8VtiH+G8J/XuQVzRGRQeADMbyhiuwthWukh
	W0BxPLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJWRr-004XbE-MN; Thu, 04 Aug 2022 08:43:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJWRo-004XZ6-Vd; Thu, 04 Aug 2022 08:43:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id p10so20187703wru.8;
        Thu, 04 Aug 2022 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Gq6/HNhAQ3BSIj0Ba+RrM6ince6+tYXHxLdu6U01oYA=;
        b=Bz4WTRlH4WuC24dGsS4v9wUmu3j89xaxP+rFpcK9gzNyf2u7WsaEbVSkqPKTaRhp1K
         rCtoYXRr7DMDHo0p2wuEyRK5ESAigQlLRsQK048vHx+ZN3MlEJU6NjbligKTJhlDIyCa
         v6op2mKcqOaJnMtUnL+3EFmjIEyd8NFLRpjI+6Ajx4sstc6mkHuuGC33qfST+QgqVLe0
         6OxL3SquzsqrtYtHJAICTDBBbSRXx+RqJU98kzovk5vUrn6uhY8GFef0H6u3EW9BCcxA
         uVmSMsG/ujV2dJnRrdvdW8ZfxWPUNnNXim6cPFWvzprMZqohemyuebKpfnc3SWdroqHK
         Miag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Gq6/HNhAQ3BSIj0Ba+RrM6ince6+tYXHxLdu6U01oYA=;
        b=RTGZLuxdEwx6zPW3Q+H05VMbvgoF6i/EpDbO7herxFehgxYKnI6C9Zzq6HooT5g8yZ
         A2yHqc8QwEhK4oQXnKDJJMDwysbyJxeX1Gxi1jNg03xmSlkbJQ/dqrCgar30tLtUZvMd
         3WvUg06Kmc69tF5Td2aPYDMpWlYlb89dBeX02Tr6N/z3LywwqiVdwONW8O1t/TVOmtrb
         0WR+w5G5yjXMuyGvsIhVPmtC01DS0lNY/HpG6Zedg9vni/aIBpUC0A0N96DZTDhSSwM9
         ARd2uDsBWIhOFCq0Nc8VhleGiq/0RZVoKFlf8JQNuhIAolWPQ6uJNILgVQs0GK7p15TK
         uLbg==
X-Gm-Message-State: ACgBeo03ozfrJxH7juU/zUGlFqF8PO3Z1Qe/S/5lqAwDjCJ6pMQlOcZB
	8eRiYHClZM1ppH+srRO5Gf4=
X-Google-Smtp-Source: AA6agR7JMuieExtxMItJInX7x5ROJ6BsC9WvMHLa0/yaf92L6oTFOHBtIasKgc7TcO8y2gvcevC/6A==
X-Received: by 2002:adf:f407:0:b0:21f:a7b:b81c with SMTP id g7-20020adff407000000b0021f0a7bb81cmr661641wro.42.1659602593746;
        Thu, 04 Aug 2022 01:43:13 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b6-20020a5d6346000000b0022063e5228bsm422563wrw.93.2022.08.04.01.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 01:43:12 -0700 (PDT)
Message-ID: <11c7b04e-9837-440c-fa5b-3074a706e0ba@gmail.com>
Date: Thu, 4 Aug 2022 10:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 05/20] dt-bindings: power: mediatek: Update maintainer
 list
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
 <20220729063208.16799-6-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220729063208.16799-6-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_014317_048850_456CDB7D 
X-CRM114-Status: GOOD (  14.77  )
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

Weiyi Lu,

On 29/07/2022 08:31, Tinghan Shen wrote:
> Update the maintainer list of power controller binding.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/power/mediatek,power-controller.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 2d6afc0909473..03b7f6aa591d4 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Mediatek Power Domains Controller
>   
>   maintainers:
> -  - Weiyi Lu <weiyi.lu@mediatek.com>
> +  - MandyJH Liu <mandyjh.liu@mediatek.com>

Are you ok with this change. Can you provide a Acked-by tag for that?

Regards,
Matthias

>     - Matthias Brugger <mbrugger@suse.com>
>   
>   description: |

