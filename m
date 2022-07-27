Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61385C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxMgZBBSR6x/A2wREjFjHPIdimpL4MklUGMoEuhSaos=; b=KITI3NHdp0aC0yG8jbb5SYTAin
	AfDaJNj0MH9OjdN5FHgPSo9NPLKzGAqQ8TuU7li8G7eBJVMH9REj8BeP7k1yRN//M8enVpodXtWhc
	OMb2fcOYHIRNGBNps7mURijw7Pdo5C7IttDLv3fPubmps5cUD1K2VAr+DIixu1GyB4P8RVKWCOZ7Y
	Appf2a5sSFCisAYePyytd1mqFjb/oPIW1ErZqmjaJBruC8AN4NepLnqfFHtixguP/TR7UajGOLPXI
	qwHAwIeFiqxC3EA4tW/wqVp7cXESEvqOHOx9WvYD1Hd4J9oV9OSR0KU47vM1887O5hNgGyEJNF9u7
	pf1E12Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGhXL-00EGTf-MP; Wed, 27 Jul 2022 13:57:19 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGhXI-00EGPl-BH; Wed, 27 Jul 2022 13:57:18 +0000
Received: by mail-io1-f44.google.com with SMTP id p81so13614200iod.2;
        Wed, 27 Jul 2022 06:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=nxMgZBBSR6x/A2wREjFjHPIdimpL4MklUGMoEuhSaos=;
        b=SygK9XZ8ttnMTCHCuN2gsFP1N7i3SO/lEcUOcxbIdFlCU2IzYo978zNHNsNnlbLSJZ
         s9vbQGdwP5hCUJG+90WD4J4OQz+Ckmd4Bh98PYk5qfl+sYc1E617j+G9eAGCx15nmPaN
         cjkryiaNGH7j5hqOi2qVTq6DoR4304eUxoVz5GK5w640cUSph08B07cCAo5TvSrgqNDq
         OqxnhvMxH1U+mwEcAYOYk0Bbr6/Zc6h+9fOP2SBolxY7MtKiVL0dMRCLndsOdx5lyuIB
         +57UQ5OJ7SZraGqJ4SwoSvxhbeoRFZlWfCzhH9QXYspPkRS4YbgoG21Ujb2VeDJc1qyA
         TiGg==
X-Gm-Message-State: AJIora/97G0fLhSbcg2wvWcXHE2QcXSg3vgZj+nDP9x4yEdNjhTN/LaP
	4sHLCdYe6vETgTNgM29XSg==
X-Google-Smtp-Source: AGRyM1tHbCtjpdAaPcSBOs8s5kywKzBslsKMi9tkX5yfFmADwm1Ig7XSyaEXUjPOYisj2Gy3/SdZTg==
X-Received: by 2002:a5d:9c56:0:b0:67b:e426:a514 with SMTP id 22-20020a5d9c56000000b0067be426a514mr7760929iof.71.1658930234178;
        Wed, 27 Jul 2022 06:57:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n11-20020a056638110b00b0033a29ec646dsm7738293jal.4.2022.07.27.06.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 06:57:13 -0700 (PDT)
Received: (nullmailer pid 2552038 invoked by uid 1000);
	Wed, 27 Jul 2022 13:57:12 -0000
From: Rob Herring <robh@kernel.org>
To: Hui Liu <hui.liu@mediatek.com>
Cc: linux-gpio@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, jianguo.zhang@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, zhiyong.tao@mediatek.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
In-Reply-To: <20220727102140.6676-2-hui.liu@mediatek.com>
References: <20220727102140.6676-1-hui.liu@mediatek.com> <20220727102140.6676-2-hui.liu@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: add support for MediaTek mt8188
Date: Wed, 27 Jul 2022 07:57:12 -0600
Message-Id: <1658930232.177263.2552037.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_065716_419512_049AC09A 
X-CRM114-Status: GOOD (  12.17  )
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

On Wed, 27 Jul 2022 18:21:39 +0800, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add pinctrl function header file and binding document for mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8188-pinctrl.yaml      |  238 +++
>  .../pinctrl/mediatek,mt8188-pinfunc.h         | 1280 +++++++++++++++++
>  2 files changed, 1518 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.example.dtb: pinctrl@10005000: spi0-pins:pins-spi:bias-pull-up: More than one condition true in oneOf schema:
	{'oneOf': [{'items': [{'items': [{'enum': [100, 101, 102, 103]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {},
	           {'items': [{'items': [{'enum': [200,
	                                           201,
	                                           202,
	                                           203,
	                                           204,
	                                           205,
	                                           206,
	                                           207]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {},
	           {'items': [{'items': [{'enum': [1000,
	                                           1500,
	                                           2000,
	                                           3000,
	                                           4000,
	                                           5000,
	                                           10000,
	                                           75000]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {}]}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.example.dtb: pinctrl@10005000: spi0-pins:pins-spi-mi:bias-pull-down: More than one condition true in oneOf schema:
	{'oneOf': [{'items': [{'items': [{'enum': [100, 101, 102, 103]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {},
	           {'items': [{'items': [{'enum': [200,
	                                           201,
	                                           202,
	                                           203,
	                                           204,
	                                           205,
	                                           206,
	                                           207]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {},
	           {'items': [{'items': [{'enum': [75000, 5000]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {}]}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins:bias-pull-down: More than one condition true in oneOf schema:
	{'oneOf': [{'items': [{'items': [{'enum': [100, 101, 102, 103]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {},
	           {'items': [{'items': [{'enum': [200,
	                                           201,
	                                           202,
	                                           203,
	                                           204,
	                                           205,
	                                           206,
	                                           207]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {},
	           {'items': [{'items': [{'enum': [75000, 5000]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {}]}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.example.dtb: pinctrl@10005000: i2c1-pins:pins:bias-pull-up: More than one condition true in oneOf schema:
	{'oneOf': [{'items': [{'items': [{'enum': [100, 101, 102, 103]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {},
	           {'items': [{'items': [{'enum': [200,
	                                           201,
	                                           202,
	                                           203,
	                                           204,
	                                           205,
	                                           206,
	                                           207]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {},
	           {'items': [{'items': [{'enum': [1000,
	                                           1500,
	                                           2000,
	                                           3000,
	                                           4000,
	                                           5000,
	                                           10000,
	                                           75000]}],
	                       'maxItems': 1,
	                       'minItems': 1,
	                       'type': 'array'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {}]}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


