Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5855C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZTdwXMG2el/ea1BKsWEd08tIXIZ8zFxXn8tPBkGQ5A=; b=zrR+FmP4IYbCX6GoOOb/M8ZpMh
	xfiXgG52vChGqJ5tqanKpxX2BcdkPQhP/MKZdbR/lub55I9UYsQKpycP4O+7ldGinC5+JfanksC90
	2lwAfejkU9cRQ3MHnaXpn2J+yytaO++UAclIg8Z3gmmGj1lhnPSuSeFMd+PtCgth//DhMH0vTQ3pv
	a94k3vEydAzt6gOJzuFBDV3m8gRLDuse8i7KazmnZI9WOftfPb4l45sxZ6GlPP9hi4blgkdN+iq++
	ZkXBnmWD7b3+dso7WjVApHH9rNNwwJlPu1etnOGETyQ16m83YFWGGsm5Q5JvgDd4YxOuI4gHUazZL
	n7WGPHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJxH-00FPMK-1a;
	Mon, 03 Apr 2023 13:10:39 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJxD-00FPKd-2I;
	Mon, 03 Apr 2023 13:10:37 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-17aaa51a911so30693372fac.5;
        Mon, 03 Apr 2023 06:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680527432;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ZTdwXMG2el/ea1BKsWEd08tIXIZ8zFxXn8tPBkGQ5A=;
        b=x8nbIRZOTKNF3A+sYviz96/E8oU48ExPSjJzHbxTJf5Ol7DCcioy0QXHb9JKQ/8/K3
         z9W+VJVFu3q2Juhbbui2N0AlHa2Axim07nGHyjRhNNj/wj+qhvO0aoflWCtm+RGkKHz+
         66XM1PfgFUK/TENMj4vuHgD5YUOreN0BTznnLd/iDmvIeZe+jzgFxATJAhGV2oFQrriT
         j+Aw/bg4jvTcwrZFu10rHzknRZcKVxTddPK2GJGHZnvEwGsPsF3ZpHeNyZcsTn+3jh1M
         B1wJesUAe7FGKRvzfNwM31BDx/OCpByoXhm9Z+S5Ik3V9ZeSAjs9SbplzbFXERlCAlCH
         KvIQ==
X-Gm-Message-State: AAQBX9c4wNRAjK1vU6sPPbAUNhiDj0ihvLTXcLUl6XJXmPrpcreOVnVu
	COH7uSvvP3y73tqJZ358RhV2OGGZ1w==
X-Google-Smtp-Source: AKy350bpXhr4xTknMKxWepZjrNZtrRCKwVKbMunz/PN41Xn3HTuhhAtDnaic+81eg7Onom6tpE9f9w==
X-Received: by 2002:a05:6870:4587:b0:176:3731:69 with SMTP id y7-20020a056870458700b0017637310069mr7607069oao.24.1680527432711;
        Mon, 03 Apr 2023 06:10:32 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id kw17-20020a056870ac1100b001802d3e181fsm3506534oab.14.2023.04.03.06.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:10:32 -0700 (PDT)
Received: (nullmailer pid 522008 invoked by uid 1000);
	Mon, 03 Apr 2023 13:10:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Andy Hsieh <andy.hsieh@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Florian Sylvestre <fsylvestre@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230403071929.360911-2-jstephan@baylibre.com>
References: <20230403071929.360911-1-jstephan@baylibre.com>
 <20230403071929.360911-2-jstephan@baylibre.com>
Message-Id: <168052512219.461959.16950455567862466256.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: add mtk-mipi-csi driver
Date: Mon, 03 Apr 2023 08:10:30 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_061035_749323_B0A3EE19 
X-CRM114-Status: GOOD (  11.14  )
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


On Mon, 03 Apr 2023 09:19:28 +0200, Julien Stephan wrote:
> From: Florian Sylvestre <fsylvestre@baylibre.com>
> 
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/phy/mediatek,csi-phy.yaml        | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,csi-phy.example.dtb: phy@10011800: reg: [[0, 268507136], [0, 96]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230403071929.360911-2-jstephan@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


