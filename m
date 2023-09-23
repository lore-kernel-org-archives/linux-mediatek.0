Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F282CE7A89
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8e4WOeV3uP0Avl4Q9o2tfB8fRCYhZPCMlDY4X+oryg=; b=Fw3pNkbQokz76U8pVR0XErfMCh
	CrGaorDBNYZS2a5bCiUVMKGXbUjJNHwdFuTHrAp+5ej4lTzwiCO4fPWHeHdNNHlTZzut8WR1dpeWp
	6fp7Qxlp/AF98TGDJ5ITSEpSss/1edGRi/+Bc6pzJCgHQdpHUvsGqrgAkr4GpEsWRIWJ/sA4vre5p
	/wbNUvqmohWTLIikxiFGNAjDSo+xbYqzHcDqg9lb1Yh9lfz3odQH+jqnrfrH/WJKtx8zZFe3amYrL
	T519ypZrWej3XAAZPsANonkEHGOd6NsJK9zDX2XtPsw9k8OhO9xROlHOc8Hre7YDVQfZcP44CpkJa
	KzbBeoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6WF-00BG8i-2Y;
	Sat, 23 Sep 2023 17:34:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6WC-00BG7x-0j
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 17:34:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31dd10c2b8bso3754144f8f.3
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695490450; x=1696095250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8e4WOeV3uP0Avl4Q9o2tfB8fRCYhZPCMlDY4X+oryg=;
        b=ooRUAmLHMM3EBxSJ91xYpGoUvJCgvY5PtVYJsCA05HmvuygIuEMfOhxgvf7FqSfjaV
         0+HgNSknLLNp4GRFrXnSFn3w3+gDZeD3SguZprMb8DSClz/ViGtn3VX1OPPtOCES1JCW
         jTYN9rybvCvBDUMYtnMCJyJzTdslovkoW+fG44q/FHPqYmJhwW7YPdhtk415wATIKPrX
         H+qFLA1yW00TZGXPJCJepmEA1C6YlF7nZ3eXIr5FKT9gvfLI92WplL6R+26E1PN3Q7sU
         uTm9nLKqrgnXfxI99ORWIiHVFExUym6RyHBK1GerqDXrcDq6bSCuEJewOcXTY7YVTeib
         F+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490450; x=1696095250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8e4WOeV3uP0Avl4Q9o2tfB8fRCYhZPCMlDY4X+oryg=;
        b=VnFOhOWd+1gLpMK0BviMoli8ObYv4e3pEsSpDaVw/L1RDfa1wUBPMf00uevwFs8ZIR
         U8vta3ZmwTuEEAarHg3yXocnKyXuHHhPrVdfOdn8F1kajWOAZ4o8dropWl8WmXqVzC5S
         5kHBc9njP+d5ZghZSQ79dp6T9rn1POmq2d6ilH0bhPWjlBL/5zGqzTEN7QCdd7cf01vh
         YsyfwrZiPEUbz5qIO/7Gs7NSlGFc2pF4Yqui4JFIkjavy+xl2SLm7wfLx8baBnwRi4O5
         vxq/tLqMlo9AR8seKwqcO7yIgO9B+JTc543C+VD6mqEHl3UZOVNPR8dU0euUSRM9Gc5y
         DSkg==
X-Gm-Message-State: AOJu0YzcTcHBkod5mPSiubOuNVeLcT634W2Y1bbNitvYSLadDitbUvQU
	qgztoyhBf1t5TiLE9cDA1KU4YQ==
X-Google-Smtp-Source: AGHT+IGywFoLRHTpFCviFneYTV3hIVt1uqS6WEMAUjyo6HuW9R7DnOeXATYbyZiXoF0+vDPukj7PRg==
X-Received: by 2002:a5d:44ca:0:b0:31f:fdd8:7d56 with SMTP id z10-20020a5d44ca000000b0031ffdd87d56mr2347231wrr.12.1695490450364;
        Sat, 23 Sep 2023 10:34:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d68cd000000b00321673de0d7sm7374280wrw.25.2023.09.23.10.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:34:09 -0700 (PDT)
Message-ID: <948a37c4-2237-8ec8-270d-8a704c8c4835@linaro.org>
Date: Sat, 23 Sep 2023 19:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 10/16] dt-bindings: media: mediatek: mdp3: add
 component TDSHP for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-11-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-11-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_103412_305398_0A09F780 
X-CRM114-Status: GOOD (  18.61  )
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

On 22/09/2023 09:21, Moudy Ho wrote:
> Add the fundamental hardware configuration of component TDSHP,
> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> new file mode 100644
> index 000000000000..0ac904cbc2c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 TDSHP
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to improve image
> +  sharpness and contrast.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-tdshp
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

NAK. So you ignored all the review. Brilliant.

I am getting fed up with Mediatek's approach. It's not the first time.

Best regards,
Krzysztof


