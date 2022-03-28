Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF09C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZj8k9Ygk5PsGCHM1dnd/cJ+pUJyMJizheBoHkyc394=; b=hHaaULUURyQu66
	K5jMK5AncUEPQIqgNPMrqwJjj/rSb69CWBcAji8+1rA5V/6+k1lje5Tvq6D41DlsCAdqXmXNSCIlt
	hTaIWWrZ6DWcYTVYiD+HVHd8MyZtnI3Mt4OY/GVhmxe9QqO9TrfsvbP5d7JyLA8p+1HizZ89EOzUw
	3tdKHBFYDcNVDb2i1mz0BBZWwU/HbAJaglqs6irxTJExdWk8bxGIk16bB4y4kAvT+wjhwUKvzO171
	bYunIvYtXw5gLjL1b3yzDvXGIQyaDPr2PyF84jQUcbAR4iCvfLMZIIqUUM7joEBvRoxHFzZ1DS+NX
	/26WRa67Yu7QifdSpXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYsJ9-009Vqz-Dm; Mon, 28 Mar 2022 16:33:31 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYsIx-009Vnj-1T; Mon, 28 Mar 2022 16:33:20 +0000
Received: by mail-oi1-f171.google.com with SMTP id q129so16176825oif.4;
 Mon, 28 Mar 2022 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bIvjLAN1WghVKdHbiAwbpiS4KUlO9J5lK2uou4RVILk=;
 b=wa2UaokmUWtPpfej6rW85dc/5pSFJI1kDiW3jwMZDcJyD9sV4aLvmI6utauUsElIU7
 k749i5CwGy+iY7ifDAgtB3X6/q6GNC98F/DHn6tRbwEFKg4DKIb6rrTrtAIEq/HZd6p3
 tW/kXjMHCaKH0mTXnqA+wXxYYcEw5hxltwMd9fNm6AylxM4nFJ6o6je7GGfOBgNHSvPV
 iOZ1pSb3vf2PdUV0Jxp26URmaHjcYu5oU2lt9vzwKEmHlsbJ1czYDWhsHUEvOFQfTp9k
 mAVWLWYgaqcNW/xvE0N0sMKmJ3dRCZSsHWF//D8LtG4MsZwLcD/fQzzsSdy0sYV+AlZ/
 8NKw==
X-Gm-Message-State: AOAM5325HfTzHSpUyPBuWxEyKlU5xOwCK+Rz2fXTgXd1qsL2fPN1yjie
 EIAMwkBLK1+XvSGuJczJnP3AqxCifQ==
X-Google-Smtp-Source: ABdhPJwNVh5RZ1sp9MXlR5GlreRlGRTmHJKVh03oTfj9pol2juq4vLORJb84KwOjAAWD3ibi6+xCCg==
X-Received: by 2002:a05:6808:1059:b0:2ed:b699:7f2e with SMTP id
 c25-20020a056808105900b002edb6997f2emr909oih.240.1648485197630; 
 Mon, 28 Mar 2022 09:33:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t15-20020a056808158f00b002e331356c87sm7218218oiw.39.2022.03.28.09.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 09:33:16 -0700 (PDT)
Received: (nullmailer pid 2515489 invoked by uid 1000);
 Mon, 28 Mar 2022 16:33:15 -0000
Date: Mon, 28 Mar 2022 11:33:15 -0500
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
 linux-phy@lists.infradead.org, markyacoub@google.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v9 02/22] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <YkHjS9ToXqyliItf@robh.at.kernel.org>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-3-granquet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220327223927.20848-3-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_093319_113600_B84BDA2F 
X-CRM114-Status: GOOD (  17.02  )
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

On Mon, Mar 28, 2022 at 12:39:07AM +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..802cc406c72b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Display Port Controller
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the Mediatek (embedded) Display Port controller
> +  present on some Mediatek SoCs.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8195-dp-tx
> +      - const: syscon

Add something to the above description to convince me this is a syscon. 

If you need a regmap, the driver can create one. 'syscon' is really only 
needed if there's not a specific driver.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
