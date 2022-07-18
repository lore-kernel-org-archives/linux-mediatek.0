Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB5EC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjYtWWfAKoGBLkN3ePtgZPz8hbvJlD5dayq7LK+HM8c=; b=1QLvrLsn2M+Vp2JXJylC46piCI
	xO3f8op4EbdL6mC9rO3cIjhixW99pHuIVgC2X8qhkZ9A0ok6hOXiSW9XnsdvQPi18ONwk0rFhgVDL
	4juxfZZ4vqIAZCpHcLGlL4t4zadW79Phcmu38Ay/Za0aaXjMTccuV+2c6WL4Ft9ZtxsEP4cjbG261
	UdjMf+GVjZZjcQ0umi1AucHtk6Xu5sUvoTlP+kCMBaFS9zb71TtmN3YOt37/5ZiogJmrIFuYCXz1v
	krh6si35EiGrIsNfg44X9SGQQw3BpxKe8ZYmOSO8+QBnIEVn/ziVEEzeiWLQdT+ZxnY3Er58PQeMa
	5Ik3sR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRUW-00ETsN-Kg; Mon, 18 Jul 2022 14:12:56 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRUT-00ETcc-IJ; Mon, 18 Jul 2022 14:12:55 +0000
Received: by mail-io1-f53.google.com with SMTP id v185so9310595ioe.11;
        Mon, 18 Jul 2022 07:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=CjYtWWfAKoGBLkN3ePtgZPz8hbvJlD5dayq7LK+HM8c=;
        b=OYcy2GRXoxIHJYSvhfIUSzoSko1vVwQf1x5pR/1Ze82h3HGFIv/hq1mptMjnH2cdB7
         e64j13GLALj2gmRPheBN6LPxgV49jBTdCsyVFH3+zUKsl2UNR6zXdTpqeyBOocJu+99g
         H3xXmaafPTRkgTJQiLsYSHw+WUfiqaYGPxgrLhEmFXPMjll7QplvJZDyQLZ2EIf3MAxh
         Rvazg1uWntSYepmgg+3+ieIsaoL1pQU0jMkCUyswGjtla9RY/STfUnPpeZTFOZaP5xT4
         BOBtOFuQgtx5FHeBHTqjQarvZZzZ0TcQmMaYvbzmf9F5yd8ivBWmeQ3qSKr2dnWpJi8Z
         rsFw==
X-Gm-Message-State: AJIora/Bmt96oSqBEWjoLbLZ5xaCONw106ABYYKYrgoxpG1jWqYUfnB2
	NO7owKA2LKODrOinjnmVYg==
X-Google-Smtp-Source: AGRyM1vdc6FYIMZSZdxh3LHKeIA7iTeO8nBZvbxzi60Hlrt2wYs8YOgH55g1NF3Vp4WB4jtfMlecXA==
X-Received: by 2002:a05:6638:dd1:b0:341:595e:4ef8 with SMTP id m17-20020a0566380dd100b00341595e4ef8mr5884376jaj.26.1658153571163;
        Mon, 18 Jul 2022 07:12:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x12-20020a92dc4c000000b002dc0d743570sm4864230ilq.43.2022.07.18.07.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:12:50 -0700 (PDT)
Received: (nullmailer pid 2879771 invoked by uid 1000);
	Mon, 18 Jul 2022 14:12:49 -0000
From: Rob Herring <robh@kernel.org>
To: Hui Liu <hui.liu@mediatek.com>
Cc: zhiyong.tao@mediatek.com, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org, linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, johnson.wang@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sean.wang@mediatek.com, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org
In-Reply-To: <20220718113813.23787-2-hui.liu@mediatek.com>
References: <20220718113813.23787-1-hui.liu@mediatek.com> <20220718113813.23787-2-hui.liu@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: add pinctrl definition for mt8188
Date: Mon, 18 Jul 2022 08:12:49 -0600
Message-Id: <1658153569.317351.2879770.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_071253_636444_06A63E29 
X-CRM114-Status: GOOD (  13.98  )
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

On Mon, 18 Jul 2022 19:38:11 +0800, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> This commit adds mt8188 compatible node in binding document.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8188.yaml      | 306 ++++++++++++++++++
>  1 file changed, 306 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8188.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8188.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt8188-pinfunc.h: No such file or directory
   21 |         #include <dt-bindings/pinctrl/mt8188-pinfunc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8188.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


