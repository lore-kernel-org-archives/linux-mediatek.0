Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D2DC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIuJOr9KDqgRyNZKu6Tt8XNVFok6Ecpq3eqDXh3VdVw=; b=Ld++TUrzCfgtZ493shQ6VInL2g
	YllUBTc3146ab6gyevuNMnVg9w9rVxKgr4V8aKcpdlWEEbMsuqWjSjT8ZI2ffDbXc/KRdyh0IkVOz
	IPJzpUHcm3E1QOgpIrNs1F8C7ETIYOyXa1Dy/05kea2jYfwW4VQKA40Knw7R4pUB6afgd5NikOfVU
	0DEdZXFQeKof2bAHEgEfaXK/eFiFWTAGFbEojY+r7X2n9uZS+Icujltoqi1cmDqLf8MLaFauauCQ5
	ZufDmw6pXHsoVdCGI0mOxbYInUCLtg9yEEcpnbYd3ElCjF16hWa0SJH2j7HwKjbkLMvigGuwAxYLF
	ZU9H06yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pptrW-00BPrt-0f;
	Fri, 21 Apr 2023 16:43:54 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pptrS-00BPqi-1t
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 16:43:51 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5055141a8fdso2692633a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682095429; x=1684687429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIuJOr9KDqgRyNZKu6Tt8XNVFok6Ecpq3eqDXh3VdVw=;
        b=lBQgSPyCip8rYuFpD+Us5fMponEiWICDi4kBwWqP5Gu6VnZDpRxF90JVMutN889EKh
         BklKXuWF0K0mMfc8jCX0zhVJHYmQ+OgHRfrDSwZnXv7BwbkN9TkrGVS+6VLWtIftCalK
         24g4MpMs+/2fwlJ5QYO+dTLQFWz9aW1Ma200XNRjpdyriDrKqyP6AguuNqgJrIXFFmAr
         Zo/Hx+b4IfPpjTKYCqYBPhgDzx6NDyCLPKbm0LnfGvwwyBbTRnhH+1TYmJa7Ffd4xug2
         INwJ+T5PyDE3ETo4Wy3lM7AJjxq5t3KThmm+D580q14eObdPzLZku1G2h6G6rH6Q1KAO
         bzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095429; x=1684687429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIuJOr9KDqgRyNZKu6Tt8XNVFok6Ecpq3eqDXh3VdVw=;
        b=j0lUjXmX1CiJG0ngLHDZyDprq1yszAqebbITJpDaoeI24Uaz9rd+hL4KdBLeoBAyvJ
         UQq1wzldfwE+LyjnPZBLSE/XcEKt5bl9+KCX2A1SxbdQo0annJiIZtZR/BWPaHtfCCdR
         9z8hft5rdvvvALBRIkOUXwbrklpCNI6fLGrwB645rk89oZ1WVcFldCFS7boZ0bcgxSRR
         e4kOyTatKE4gBiSJdgdh27KAMkGdMQ3HJ9XFlkPexjgLCUjSWXEFWXqY5yvinqUSdfh9
         B/fqtPAs+v+zUpbV7YRL+EPYSULh2Vl4Pxn2iKFz3JnyL+QSZYzt347Sxi+TmYEfKWqQ
         9/9g==
X-Gm-Message-State: AAQBX9eSxwhDym7E4Ls/bRHS3zkInj2XmbRv32CRteHE3xg5ZF2hDeoZ
	6XP1+AAlDK9QyjRxJZz/A0PPgg==
X-Google-Smtp-Source: AKy350Z9W1Awuyb/afDJDAwM+gnsZX1x4JGUQFrDP8K1cSk1huw1//Tq6t/V1q559iCtPTZ58No0sA==
X-Received: by 2002:a17:907:e92:b0:94a:4d06:3de3 with SMTP id ho18-20020a1709070e9200b0094a4d063de3mr3205814ejc.72.1682095428846;
        Fri, 21 Apr 2023 09:43:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883? ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id t18-20020a17090616d200b0094f969e877bsm2242742ejd.43.2023.04.21.09.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:43:48 -0700 (PDT)
Message-ID: <5e622e88-5287-1ffc-aa9b-c7c85a661fd9@linaro.org>
Date: Fri, 21 Apr 2023 18:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230421100905.28045-1-trevor.wu@mediatek.com>
 <20230421100905.28045-8-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421100905.28045-8-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_094350_627917_A2F73DA7 
X-CRM114-Status: GOOD (  15.88  )
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

On 21/04/2023 12:09, Trevor Wu wrote:
> Assign top_a1sys_hp clock to 26M, and add apll1_d4 to clocks for switching
> the parent of top_a1sys_hp dynamically
> On the other hand, "mediatek,infracfg" is included for bus protection.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml      | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> index 82ccb32f08f2..812e0702ca36 100644
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
>  
>    mediatek,etdm-in1-cowork-source:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -147,6 +153,8 @@ required:
>    - power-domains
>    - clocks
>    - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents

You were explaining it last time, but it did not solve my concerns.
Requiring these properties means that your hardware boots with incorrect
clock parents, including result of any firmware, and there is no way it
can correctly work without reparenting. What's more, this means that
your clock hierarchy does not include these clocks for some reason, e.g.
you need to reparent parents of some parent of your clock input,
otherwise device cannot work. Cannot work never ever.

Is this the case?

Have in mind that bindings are used also by other OS and projects, like
bootloaders, firmware etc.

Best regards,
Krzysztof


