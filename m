Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B11CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQQyuvgw2Ih8CCznL4czbdJi4u/aUR5st1Zl8jdFdis=; b=AVfNE3+8FXi/R9VFEMdHl+aFQB
	PoKw40hxM9cxEZ2Mr2IaDk7iuVbn4Qs0On4D+aLlo0xEbh0vKjvqbDDY81NQp1IYsvm1zaItoDv/S
	3Kmh1AfPhKmLX1aTA0q52HIO8lL2yYXVXeds/yXOtiaX0sxp1EloPs5y3DqdFzJDPi5XuvRMeAoy0
	5QtumhdtlKz9EGqC4lsqMZQpP2GXC5XJGO4kEJrjTXdRkiaj4LFqtYxhLQrhYiuevp6JjZxy4RAcJ
	DhN/L29+lVtNcHDslN1RyHArHAr4Zp08Cvx592KBI+NC/pwtrvQR66h4EbyxuYE1P0rm51EnaxlmP
	8pr0e/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyZL-002Y2b-1x;
	Tue, 12 Sep 2023 08:16:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyZH-002Y0p-2d
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 08:16:21 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9ad8add163cso33801666b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 01:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694506577; x=1695111377; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQQyuvgw2Ih8CCznL4czbdJi4u/aUR5st1Zl8jdFdis=;
        b=bmjdiKLCKz697veN+HOGW/15t9WhD9ODj9pFt3zKVxcuRzeiVGHDbMEsbCOGbamVEP
         y+ES/FOP5IuISWjlFVwDuhtn9/JQ7ZudG+eMhN9NyHx6bDu215cI9Jn1CcwoKdfDeKAu
         MkrBKW+swnT7H0N2r3Ji7wYFGPzFDzvYjRpiM0d3r9lbAsJW5BSMZNdXZZkaHi5QVyBQ
         f2dcpy7MPdUM+/uP3fkoQ/wV9yu+Ustsk0kaM6LrmYP5zsMvBpibSAseX7Bs8Q/jFwIJ
         mXEjkpOmb6rFwYV4d2sPlTL2un75t1wGc4+MyBhGxRdrHnf1yLAMaQN53fGGAnl2MvlF
         z6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506577; x=1695111377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQQyuvgw2Ih8CCznL4czbdJi4u/aUR5st1Zl8jdFdis=;
        b=Tjf7ABDDZDOl2+kzKsHlgX8SMRDtStvoLmvvlaBs3MMJDZ4Xy8FkdPRASTKgu8EJgh
         acugByq4kVabhcPxORe4U6FyMnDPlMVaOP8/UMjrfEs98OosqKrzZcv7J3qQTrnDpSmz
         3fZTbui+UbszFRZxssXPrVYLEYU2M+HdFn9U0xXS6HetPOiK8JGvaZCoIrOYG1zXwId6
         RxJ/4HYMJVJSEJ5hYAnjJS1POfV1hYIfoLWk9FiGqqMOIpVR208Kf6RbnW1JDhzr5c9q
         atA7u690z/eTXixk1xnOcYSnmSmo7uA4C9Po9pMZDK/IwCxAvt7c1JQpmFHxu9Ij3adj
         9RIg==
X-Gm-Message-State: AOJu0Yw2KynNW3q2eMpfKVTOJ4qOGhAZDa8bUV5TnygrHPtNscXWcbH9
	kIrfjHhmn56B+bERX5IRfTNWNg==
X-Google-Smtp-Source: AGHT+IGnDIjB1E0+PM78RIHPjXSnqOuV7g/f+t4r79vgK/6WUopYnar+OQmHMaOMcvof7mrFdmwNsQ==
X-Received: by 2002:a17:906:8469:b0:9aa:165:aefc with SMTP id hx9-20020a170906846900b009aa0165aefcmr9205509ejc.33.1694506577602;
        Tue, 12 Sep 2023 01:16:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906851300b0099297782aa9sm6357666ejx.49.2023.09.12.01.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:16:16 -0700 (PDT)
Message-ID: <83b3f2eb-84e3-2daa-c63c-14b6792a1db5@linaro.org>
Date: Tue, 12 Sep 2023 10:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 2/3] dt-binding: mediatek: integrate MDP RDMA to one
 binding
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075651.10693-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_011619_854756_DF9EFBCB 
X-CRM114-Status: GOOD (  18.97  )
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

On 12/09/2023 09:56, Moudy Ho wrote:
> Due to the same hardware design, MDP RDMA needs to
> be integrated into the same binding.
> 

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

This applies to entire patchset. It is not dt-binding, but dt-bindings.

> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------------
>  .../bindings/media/mediatek,mdp3-rdma.yaml    |  5 +-
>  2 files changed, 3 insertions(+), 90 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> deleted file mode 100644
> index dd12e2ff685c..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: MediaTek MDP RDMA
> -
> -maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> -
> -description:
> -  The MediaTek MDP RDMA stands for Read Direct Memory Access.
> -  It provides real time data to the back-end panel driver, such as DSI,
> -  DPI and DP_INTF.
> -  It contains one line buffer to store the sufficient pixel data.
> -  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
> -
> -properties:
> -  compatible:
> -    const: mediatek,mt8195-vdo1-rdma
> -
> -  reg:
> -    maxItems: 1
> -
> -  interrupts:
> -    maxItems: 1
> -
> -  power-domains:
> -    maxItems: 1
> -
> -  clocks:
> -    items:
> -      - description: RDMA Clock

This is different and you did not explain it in commit msg.

Another difference - mboxes. Looks like you did not test your DTS...

Best regards,
Krzysztof


