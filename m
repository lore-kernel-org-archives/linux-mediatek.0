Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68003C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M31n+XREzugmZ1EKOJc53wCBLFu4hpN+NfwfiegJw4Y=; b=QL4C3gcJ9+5UGuWHN+a0D/GQ89
	UNOm4GtbDv8y6xW1UldkMeRn2jprAq/nj0nUQbU9WtEYjENIMMwj7twklUl0E+318cnJEgIb7c/Vr
	sDykI8Vi/SWjbsDaG9+nK0pb+fszrxULauEIgXDz7KkfDeKaRovx0Chvz9MVkXf0wthqaBU2XsaVN
	pNa9PmKwPYUWfZJRnYdQqWBPg4pUvKdeJOAt1pkfXrQ1qKubBVmm2EwxGW22HIh/kOTtg8FVuL8+q
	/MPdWkbiEcobfew2TwRuIjazmgsHH84vOH2C7fE+cyQgccx8HW/vlDyfKIa4TxdNN4EeLATpLa+Ud
	+VVjeC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps2vF-006ogD-1A;
	Thu, 27 Apr 2023 14:48:37 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps2vC-006ofX-2f;
	Thu, 27 Apr 2023 14:48:36 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6a60460a23dso6730530a34.0;
        Thu, 27 Apr 2023 07:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682606914; x=1685198914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M31n+XREzugmZ1EKOJc53wCBLFu4hpN+NfwfiegJw4Y=;
        b=ZttfJJ1gMkw3MC0FjNGruYH88d2kiFSVD2eEKxp0BKS//v6H973r0w0A6EMiyQieMh
         QGrbjEGZvJQgqR0nKMAbb74VaCjD2DuYqhnaP1WUkS2Nor77gc+ZNqUuJ58WH/Th7508
         MDSUH4x2OVMMFYK4kGQqhQGj4RXC5n+AvOUBRGQZ0llsnt1vGxoHkipkIg/Mc/VWd91t
         7x/2YHuCC4vh+IylCUDzfZ8j/Rz2wJ5oN+tLpqzIAhzLIRN6QY7Teq+QQ6cYsIPnXAfs
         A7d//huWzey76GYA6q8y3yCAHfw3nyX7rpC9Q0b/VqL73mudh8tMrBKd/pf4xA0fOzqW
         SwsQ==
X-Gm-Message-State: AC+VfDxEfiZQ5hqVsnnlkyex7mf/4Sirz63EDUllHzaUuxFd6F2pDNpR
	D4bsALLZ9R8MrOzjsk8UsQ==
X-Google-Smtp-Source: ACHHUZ7Gy9jZRZPv3O8hPWV17h7xoBKxBXZHUuJlHDEj5firr1OAVrcrJ0Ju0D2jaIC1gyaw5XDBgQ==
X-Received: by 2002:a9d:6404:0:b0:6a4:2f1d:133e with SMTP id h4-20020a9d6404000000b006a42f1d133emr771755otl.3.1682606913964;
        Thu, 27 Apr 2023 07:48:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z5-20020a9d65c5000000b006a12509bd94sm8042181oth.13.2023.04.27.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 07:48:33 -0700 (PDT)
Received: (nullmailer pid 3018266 invoked by uid 1000);
	Thu, 27 Apr 2023 14:48:32 -0000
Date: Thu, 27 Apr 2023 09:48:32 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Message-ID: <20230427144832.GA2992031-robh@kernel.org>
References: <20230426055124.16529-1-trevor.wu@mediatek.com>
 <20230426055124.16529-8-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426055124.16529-8-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_074834_861795_3F6D140E 
X-CRM114-Status: GOOD (  16.55  )
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

On Wed, Apr 26, 2023 at 01:51:24PM +0800, Trevor Wu wrote:
> Add apll1_d4 to clocks for switching the parent of top_a1sys_hp
> dynamically. On the other hand, "mediatek,infracfg" is included for bus
> protection.

Bus protection? Meaning access controls for the device? If so, there's a 
proposed binding[1] for just that. If that's something Mediatek needs 
too, please participate in that discussion. It's easier to define new 
common bindings if there is more than one user.

> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml          | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> index 82ccb32f08f2..eb58de8c0e68 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> @@ -29,6 +29,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of the mediatek topckgen controller
>  
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek infracfg controller
> +
>    power-domains:
>      maxItems: 1
>  
> @@ -52,6 +56,7 @@ properties:
>        - description: mux for i2si1_mck
>        - description: mux for i2si2_mck
>        - description: audio 26m clock
> +      - description: audio pll1 divide 4
>  
>    clock-names:
>      items:
> @@ -73,6 +78,7 @@ properties:
>        - const: i2si1_m_sel
>        - const: i2si2_m_sel
>        - const: adsp_audio_26m
> +      - const: apll1_d4

A new required entry may break the ABI. If that's okay, it needs to be 
explained in the commit msg.

Rob

[1] https://lore.kernel.org/lkml/cover.1668070216.git.oleksii_moisieiev@epam.com/

