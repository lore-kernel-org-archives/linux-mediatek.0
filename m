Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B8DC001DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 11:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjHUbpsXNTdXDllv/Zczg2nbxv2zyY7VFFQt2sH3BkI=; b=d1K12AtASfxAY3XmMTC4eOdDIS
	LDqSHjChkAFd0K+60Fm6At/B4Hitt89rPmskz77Q0PGHMEj9PMktmTcudr34kJET7R+eP1DCbIAyM
	etxv3WWIUEeTCkwn1WQQvOTKs8LmxAXILPh4ZEUs/fsLKtGiqYdZzDaaAyjoW06jumuoTVC56oUrj
	DkuMNTEG9bR6G7we2Pa31iWUuNwX0VEyozu2FJiueisZMeas928R5euqqjt3SMzBVMv7HRnPssZOR
	dTvE7/Yf2qL+Wid4jR8hapZ0ECmE3f++C6whzwfdJsLGVBY+tsg7/F3Bqs1ZU0XxHDQloFFWHgB+a
	LQ90mKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyRG-00H5dO-22;
	Mon, 07 Aug 2023 11:30:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSxPb-00GlwQ-2E;
	Mon, 07 Aug 2023 10:24:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE19C6176A;
	Mon,  7 Aug 2023 10:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91344C433C8;
	Mon,  7 Aug 2023 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691403870;
	bh=kIxXXpUAI67ManDrcGXE3YDE4EVMXn6NSEkXJ/fOOpc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J9MfkH41er9naJzIKmcUvOMwb+y45aHUagRy050m1jH5jq0vWRz9z+qJpVXi2KvpR
	 hCwoIssCZ06zgHKlWimHqw6LEbN7IbKkc92cu4rUsrirFuBgMEgXFQwoJb0r3SOv5L
	 2u94SOUH1q2fqdVAMEhnE7CjTLhNWzcLkGsuGir2NE2nS3UG8gWMdaaIyVkVzjH/DJ
	 dvHQeQ8rEYS7Ecu7sK2RDVAV+6LixGftRs5imgYosYbsNb+GLJwxlB+FweRV4B6rcO
	 V8mlURxgh0HN+dj0VQKUf82CUi+Hknx5ChATup/VNmFcKZaqpPdNaJrPLvotdcgp5z
	 5L5Z4IFV/hNdQ==
Received: (nullmailer pid 791243 invoked by uid 1000);
	Mon, 07 Aug 2023 10:24:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Florian Sylvestre <fsylvestre@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, daoyuan huang <daoyuan.huang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Hsieh <andy.hsieh@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Louis Kuo <louis.kuo@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Moudy Ho <moudy.ho@mediatek.com>
In-Reply-To: <20230807094940.329165-2-jstephan@baylibre.com>
References: <20230807094940.329165-1-jstephan@baylibre.com>
 <20230807094940.329165-2-jstephan@baylibre.com>
Message-Id: <169140386586.791137.15518824950356939117.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Date: Mon, 07 Aug 2023 04:24:27 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_032431_819325_25DA3ED1 
X-CRM114-Status: GOOD (  16.60  )
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


On Mon, 07 Aug 2023 11:48:10 +0200, Julien Stephan wrote:
> From: Louis Kuo <louis.kuo@mediatek.com>
> 
> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../media/mediatek,mt8365-seninf.yaml         | 259 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 266 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.example.dts:28:18: fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
   28 |         #include <dt-bindings/power/mediatek,mt8365-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230807094940.329165-2-jstephan@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


