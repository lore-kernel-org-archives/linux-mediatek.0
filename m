Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B46EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/Ih3YIiIR6unWpavHkikjHDe22gBWXeu/QbTsqOapE=; b=d9QcFEs1eIJW3RKw6mN1reo8vL
	0cq69Zhfump8coZwnAJLXf1wPPwmpgH35EIedkCC9QgYA5V5XHqCu5HCbAYTiU/+f8eEd6H7W61IL
	PGH5X5MzVDcu+uLstp3mTCBqf1X7KG41TwJColGN5MKGWAQWWudOceUIJPrJ1FZ4tlvIj5W0Xojka
	j8OipS1wmx67ivL9UlTI6ivmOjGI6T+ynEijIvGh9VWBnN1xPiENmrOidJS5mf76eoeGve7OvAqmi
	/m7OHR0wQeF8PrBXzqb1swKi4oAd1GIFTMHT2KhlrGWu6cqExFeaUMjWQtGQqgBkl0yuQnJ7eDmPR
	peuG2uoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSxPj-00Gm3g-04;
	Mon, 07 Aug 2023 10:24:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSxPd-00Glyk-2r;
	Mon, 07 Aug 2023 10:24:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AC546178A;
	Mon,  7 Aug 2023 10:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551A5C433C8;
	Mon,  7 Aug 2023 10:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691403872;
	bh=OXkWXf3mQvnfuf2YiExY+02t7E86/XvPKPiNUAYPdGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IJLaPMHht6I5pDFshVs4PHF5CHdlWqSbsr0Pqadxd9AEpsQSLfI4L+eoHU9WAbfSP
	 i7GsIlCDyAjJZAPLZi9LqVPFbbMsGBRmZ4GbDETUm/+DwUViUwe8MV9oZo2uCsyDzE
	 jf7PTRYSje5ztda1834Hno1IwDbaivBp8zFAwZK1Pdbr0ShjCX8FMtGl2g/uc850N3
	 xDejUM9zjLwIOqTyIYdySQACWH6sYouHNJhbWjllCzyfF7SveMj65U4C7DTKGTAyRw
	 ge0or8bF0VbZHCB0v/L/3lvXJq9bpNYcqBmCla/X/YoA1HnCLOwg4FpPO1ptRKufA7
	 BrD5hTx7tr31A==
Received: (nullmailer pid 791246 invoked by uid 1000);
	Mon, 07 Aug 2023 10:24:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Hsieh <andy.hsieh@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Florian Sylvestre <fsylvestre@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, Phi-bang Nguyen <pnguyen@baylibre.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230807094940.329165-4-jstephan@baylibre.com>
References: <20230807094940.329165-1-jstephan@baylibre.com>
 <20230807094940.329165-4-jstephan@baylibre.com>
Message-Id: <169140386751.791200.3224440007530474739.robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: media: add mediatek ISP3.0 camsv
Date: Mon, 07 Aug 2023 04:24:27 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_032434_018080_CE9493A6 
X-CRM114-Status: GOOD (  16.49  )
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


On Mon, 07 Aug 2023 11:48:12 +0200, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-camsv.yaml | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.example.dts:28:18: fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
   28 |         #include <dt-bindings/power/mediatek,mt8365-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230807094940.329165-4-jstephan@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


