Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAFDC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nNtLlLW4RmT4ynuISGEuJzDXswqCUAXVsJ9ZG+79uI=; b=NzhDYlL0t+u4i9
	j5yFGd/WoJdS9j7dxxfcShLzz/nWKkYXlhONW/m8DOEw6kKtVCLl0a3LHPbbIb63QJ7jyRV8jgQP9
	6cayemC8hiM/vjFjfzxpPDqlyxuKzLBBaK1cNXCq9kOLAHTTnRv3N7RmKxuJBAgPn1zgylklSEJjb
	Dk5tqSuQwVg+s4m3zteXjjLVfCay++yjnjOhSaVdm6PyrXD1PQuyNZuc35R1qo96knOX2C/V5YdL+
	w0vnPrhjcitJsNhN1z6sMbY+naIRNPI9bbWt1/OSODiVWEXIVUQdepgVMnE8f13IiG6R6TXqorsFD
	/6hJ437vXEE9bIxucFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeRu-008JI1-TM; Fri, 10 Jun 2022 13:13:14 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeRT-008J7P-JZ; Fri, 10 Jun 2022 13:12:52 +0000
Received: by mail-io1-f45.google.com with SMTP id y79so6679603iof.2;
        Fri, 10 Jun 2022 06:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=IkgD32JQQv4iXIcEl6HeM9jrQJQd0Tq+F8d36Y5X2zg=;
        b=7ucpBeV/lXEQAatccy9W78/CtmppaSbqZFQfeIgey0oyz44uYK7Ym2cyiEvH2EE+Vs
         pJLuxCV1kyNGPPXPi7c+sr35rvmItnAv+JE3BTQWGMzrcQFlH7yI648fiMoHVdFZhSXD
         zPkG4Z+EXpx/FpXPNQ4n2ntHUoAI+va4Va0DH3dHq5IUU20dDRkzjBDZZEGZzdlXpnTd
         PUhc7TUb6Xj4UuISBZmXLXdlw776+06fl87uMpzoiGyfvo/fsN+wb2Xllunf+VMXnBsa
         PVYbO72/NRm89aFudvNl//uXnQ9H5cCqkqUvdKv43Vt4KLmwBYoV6Chqxsbu1JYrkv8R
         getg==
X-Gm-Message-State: AOAM532jngdU2j/BLHF/jvLRfoVOZaJpbvEIrjk8J8aY0OADxYw0BzYe
	PfW2FTX4c5dNZqx+wq8obA==
X-Google-Smtp-Source: ABdhPJw7sfj49a/XqcZX4iEyYBeVBikgyBwiHnh2QxO3rAv60pfY7q66XAD3rxdzNX0bgAVsDTmVOw==
X-Received: by 2002:a5d:9a13:0:b0:668:94ba:46ab with SMTP id s19-20020a5d9a13000000b0066894ba46abmr20425276iol.155.1654866764099;
        Fri, 10 Jun 2022 06:12:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z12-20020a02344c000000b003318ba8386bsm7885984jaz.81.2022.06.10.06.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 06:12:43 -0700 (PDT)
Received: (nullmailer pid 1529407 invoked by uid 1000);
	Fri, 10 Jun 2022 13:12:35 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: wenst@chromium.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org, angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org, daniel@ffwll.ch, matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, granquet@baylibre.com, airlied@linux.ie, p.zabel@pengutronix.de, linux-fbdev@vger.kernel.org, ck.hu@mediatek.com, tzimmermann@suse.de, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, mripard@kernel.org, dri-devel@lists.freedesktop.org, deller@gmx.de, msp@baylibre.com, jitao.shi@mediatek.com
In-Reply-To: <20220610105522.13449-2-rex-bc.chen@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com> <20220610105522.13449-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri, 10 Jun 2022 07:12:35 -0600
Message-Id: <1654866755.768151.1529406.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_061247_686180_E5D1A940 
X-CRM114-Status: GOOD (  13.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jun 2022 18:55:13 +0800, Bo-Chen Chen wrote:
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
> [Bo-Chen: Fix reviewers' comment]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dtb: dp_tx@1c600000: max-lanes: b'\x04' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dtb: dp_tx@1c600000: max-linkrate: b'\x1f\xa4' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
