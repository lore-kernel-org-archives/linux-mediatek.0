Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE07C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:
	Message-Id:References:In-Reply-To:To:From:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DoovjTJROPf6fM2d6KbXfBg+AzBsvogq3b4O78GD5fc=; b=mrwWLiQMnkmGT7YlmhkM9mBCRE
	40czABdNoP2EdhC8+18CT3jHvAA/X5LTex1RDeSmQpZ8r5Bolei67BqHbC5l7hIX4IMBVBsD+p/JR
	zjcOK/DP0yYbHmgH0pAlmEiU4sL23y1+TeUVfhj33qD6tngNTmEKa23PkYhiUpL1UbyIOfa22kwUE
	QfwE6d9YejeYmxNMA63PBZMYKMaHG/AtO6pDy8prKfJCikdmPwaeSqvUNUTaxZrVZ8ERLdsCWF0Vo
	Mg0x9F+bmo/04NUsJfu6pGqvCQisbOxDL/++jTE5FbvsXpycd4Yo/pJz6ta+AZ9KfT0U4LwZvwN2Z
	jzOJixaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orKXE-006kkz-SW; Sat, 05 Nov 2022 14:52:36 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orKWw-006ked-Mi; Sat, 05 Nov 2022 14:52:20 +0000
Received: by mail-ot1-f45.google.com with SMTP id p8-20020a056830130800b0066bb73cf3bcso4187777otq.11;
        Sat, 05 Nov 2022 07:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoovjTJROPf6fM2d6KbXfBg+AzBsvogq3b4O78GD5fc=;
        b=3llV3tdmDmHfa2IixB1cTLfGeqz6zKeDZ9JDHF3AGDTOFrAk0hZjcw98pqznKhNUoY
         nDEG99eZladjkny2GOnnB97XhrvFsjJYKvCYc5mlUCuOiT0KvPooNXvZCSzMips78Qr5
         2kdf7AEt1T89dMDYm9XN1yHcrEC8mUmRO2QW7pIMHEATaMDHg4aU0cLHDqnpqLR2AFYH
         OlhgR3smXLQM+jRGCSnGNlI1hLNtlrPGnHl2RfpgKiNQDIY7i6aajdh0et9CBlJFrFCc
         Fcy3/0+pgmiXxhWoISNvdxZ4J3v1Aar4s45f6qp8YKSqZY3VbQn4mzKn3TJf6B+yoZnb
         ld+A==
X-Gm-Message-State: ACrzQf3Ibib6fYWmUlMyfIhPI8f99sMKyyyXOIWLClh77OP14g5r2ai2
	d5ez4SagSbAHkFtoRtHi2Q==
X-Google-Smtp-Source: AMsMyM7ctCunns3BMIghObU2ApaO5yOV/1suuvtsTcyoWTfq/xmUWqLoqyUTo48J6DKebXvozOisyw==
X-Received: by 2002:a9d:4b85:0:b0:66c:9226:75b0 with SMTP id k5-20020a9d4b85000000b0066c922675b0mr3999606otf.365.1667659937513;
        Sat, 05 Nov 2022 07:52:17 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y77-20020a4a4550000000b0049e9a4b2dd4sm655355ooa.30.2022.11.05.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 07:52:16 -0700 (PDT)
Received: (nullmailer pid 27960 invoked by uid 1000);
	Sat, 05 Nov 2022 14:52:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20221105092500.12145-1-linux@fw-web.de>
References: <20221105092500.12145-1-linux@fw-web.de>
Message-Id: <166765939212.4158869.5881767839110614067.robh@kernel.org>
Subject:  Re: [PATCH v3] dt-bindings: pinctrl: update uart/mmc bindings for MT7986 SoC
Date: Sat, 05 Nov 2022 09:52:16 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_075218_772036_DCD334B5 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sat, 05 Nov 2022 10:25:00 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Some pinmux pins of the mt7986 pinctrl driver is composed of multiple
> pinctrl groups, the original binding only allows one pinctrl group
> per dts node, this patch sets "maxItems" for these groups and add new
> examples to the binding documentation.
> 
> Fixes: 65916a1ca90a ("dt-bindings: pinctrl: update bindings for MT7986 SoC")
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> sorry, messed up email-list, so resend it
> 
> v3:
> - squashed version from sam
> - v2 was ack'd by Krzysztof, but sams patch included updated emmc-names
>   and different structure for uart to allow 2 pingroups
> v2:
> - wrap on col 80
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 46 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dtb: pinctrl@1001f000: pcie-pins:mux:groups: ['pcie_clk', 'pcie_wake', 'pcie_pereset'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dtb: pinctrl@1001f000: pwm-pins:mux:groups: ['pwm0', 'pwm1_0'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dtb: pinctrl@1001f000: spi0-pins:mux:groups: ['spi0', 'spi0_wp_hold'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


