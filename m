Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE384C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 22:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH8Ij15Y7lc1TeAmRnVyXzxu4YdUdQR/MP3H9oPsX5w=; b=aXbfX665LjGk3b
	JwuHDSn8fKAWeE5E/JPoU9ZGTLFCk6VkjEGsPYBsYXVle7Wig18gWIwYaiYSDd9ZOPmVdDeW/1poM
	9fUaxEyG4KARTYPob0eQAYsLeubk7zoVuwrqoPmNtAouK19JzKqsdEKK/YNaK14Siq8EjLwNDkfv/
	GLIRnlhCqHSeSYCXZ7+HUq35YLr93szn5cclfjzqt795fYcI/FyYOOGFQvBb7ghcnhhNd7dswugIV
	L216XPze+fMxSKFJM4uQGStO4KCXYPMswGSLOv0Ol1lyzLT1hynVcFUOMH4hmtgBWNxTABUwxIyx4
	sSdYCE3oa87t9nq7TD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZKnH-00DgbS-Uc; Tue, 29 Mar 2022 22:58:31 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZKn4-00DgXb-E9; Tue, 29 Mar 2022 22:58:19 +0000
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso20349734fac.9; 
 Tue, 29 Mar 2022 15:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LWrhu1SJIKP91XWNKb4WbsxhL8e6xpsiZxtyqvL5Z0w=;
 b=i2dMi1Nh5Hn61K7oRSsk7r4cL4PeanSZ+x9uOp9WK2vi1yeISfHzNVYa/9P//Pzxmn
 kV8j6rtdfTO6qi5pUpiS0Dvy/ARr0uxXnVZEbCKKUXt6Jerz3oC4gN0tL4p1tGHZL4XW
 6b0r0PqbRnDyc6iefzD6crVxPbJw+MUpzXduJzbzxGLHAHP/OSGW3paXsKtvcxIPVa82
 62VlZWZhMw3C0kGwbnglWLb1xvzms702EtVEvU8kfOlu8zewe8Eyq/WGB89E+/kPhX1U
 SakJPFOU+4+7HL/IlfaxwtwLYwOo2DM1YmQm8+30i004o1ceguCT0Mja3IpaFoeFG2h/
 d+6A==
X-Gm-Message-State: AOAM530B7oZynGfJGdj4gkcL0lfArPjn/thkuQz1X6JSnYwZQcwzucuV
 hkQIRvCOaTIuJJM640SUGA==
X-Google-Smtp-Source: ABdhPJz+emekgDFz5mKWRmNRlRNMSrX19JPwwY5w06pHDZVUQBWmNvGk1+vhyDXsbkBHNm4tAEBj9Q==
X-Received: by 2002:a05:6870:a106:b0:de:de08:4e3d with SMTP id
 m6-20020a056870a10600b000dede084e3dmr859501oae.256.1648594697439; 
 Tue, 29 Mar 2022 15:58:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k22-20020a056870959600b000d277c48d18sm9802811oao.3.2022.03.29.15.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 15:58:16 -0700 (PDT)
Received: (nullmailer pid 1505955 invoked by uid 1000);
 Tue, 29 Mar 2022 22:58:15 -0000
Date: Tue, 29 Mar 2022 17:58:15 -0500
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mripard@kernel.org, p.zabel@pengutronix.de, tzimmermann@suse.de,
 vkoul@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com
Subject: Re: [PATCH v9 03/22] dt-bindings: mediatek,dp_phy: Add Display Port
 PHY binding
Message-ID: <YkOPB5W7uXkOc72/@robh.at.kernel.org>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-4-granquet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220327223927.20848-4-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_155818_506126_142AF407 
X-CRM114-Status: GOOD (  17.43  )
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

On Mon, Mar 28, 2022 at 12:39:08AM +0200, Guillaume Ranquet wrote:
> This phy controller is embedded in the Display Port Controller on mt8195 SoCs.

Sorry, but I think you need to go back to what you had in v8. While yes, 
the phy and controller IP often do change independently, this h/w looks 
pretty interwined. 

You could make the controller a phy provider to itself if you wanted.

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> new file mode 100644
> index 000000000000..1f5ffca4e140
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2022 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port PHY
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the Mediatek (embedded) Display Port PHY
> +  present on some Mediatek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-dp-phy
> +
> +  mediatek,dp-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Display Port node.
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - mediatek,dp-syscon
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dp_phy: dp-phy {
> +      compatible = "mediatek,mt8195-dp-phy";
> +      mediatek,dp-syscon = <&dp_tx>;
> +      #phy-cells = <0>;
> +    };
> -- 
> 2.34.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
