Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D22EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTDuY1fub/AlYVcXZL8jYlsmiEw4GE6gVtFVz9G9Nys=; b=AgdOIt8ecGNHskXUg6DzmPL21S
	ezxN7/IvZev+Zg/Q54kT20KZE6g0kLlfY+AXzxUqJG9E/xxxFJoZHTRdtOOjVXsF6IFiAk/OPfosu
	DsuCVY9K8fOMcKNHqCuaS5hoeul58xlc5zLIeXKo/r8PPUg2Vl9F5GPTntdTaldsEFEH/f1gM5yf6
	SymEeVtwRkCfHBP6uj84MandSuB6dFv6EcqOITV4LhoDD4WX8klvneySmj2wzbQffEEoit6K2KqtD
	yx6Owo/LytjGrBvRIq48LPMlMAWRuRXOruB2W0tEcrihajq0pCs4bSph94eldSEKTxAYcpHgmZrcF
	0WG9QFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCEN-003aPE-0D;
	Fri, 30 Jun 2023 11:24:03 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCEJ-003aNx-1T;
	Fri, 30 Jun 2023 11:24:00 +0000
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3459baa237bso7529925ab.3;
        Fri, 30 Jun 2023 04:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688124237; x=1690716237;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qTDuY1fub/AlYVcXZL8jYlsmiEw4GE6gVtFVz9G9Nys=;
        b=BPJpiPIiBYTh51DfZWyQSzPznFroElL6dso+sJ2V+O34W+p3eYNDqopgDoCJZMVpYj
         RW/kenI5l5XMKDnlSMZNThm6YrUrjexzkfvRdc8niX35qpwTTl7orPCKTHv58gUIw7Db
         uFVetxHHfEPdgsOJOkKcAUN7peXBX2ogdspJcrgMHbL4T4vrCKxsTLyhbr6Ws4hBcUpC
         LHM6eB57xzsZzWj1BmyjU2ek1LuhzD3gnGVRYjY8lPGzNPd99x7X5QoQXM1yo8gsLhke
         nno9lceQgykLylxZvc9xoAZTJ7+3ULtyI7CUgg2Bt/3JcoDEsnRTIQ6e1EV0UcIQJkr5
         qXRw==
X-Gm-Message-State: AC+VfDwhbpY232X1GPnG67Bo/CWYP9+hpnGNt/DuX+Y5cadlUzbA/LMS
	wZhgUDNOQoJGoN4xi7Hm5w==
X-Google-Smtp-Source: ACHHUZ7DcLDIREaS/YBHqwtSxRlaLvmAB1fHHkDnsf1HSnobtWWdY9D3unVpsCudqGOJcAmi/2q4tw==
X-Received: by 2002:a05:6602:3056:b0:783:67a3:a69f with SMTP id p22-20020a056602305600b0078367a3a69fmr2672870ioy.18.1688124237219;
        Fri, 30 Jun 2023 04:23:57 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e15-20020a056638020f00b0042ae858d84dsm2191300jaq.88.2023.06.30.04.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:23:56 -0700 (PDT)
Received: (nullmailer pid 1082765 invoked by uid 1000);
	Fri, 30 Jun 2023 11:23:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Sumanth Korikkar <sumanthk@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>, Andy Hsieh <andy.hsieh@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Sylvestre <fsylvestre@baylibre.com>, daoyuan huang <daoyuan.huang@mediatek.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20230630100321.1951138-2-jstephan@baylibre.com>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-2-jstephan@baylibre.com>
Message-Id: <168812423326.1082703.10045152844736741396.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Date: Fri, 30 Jun 2023 05:23:54 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_042359_494678_108FC3D8 
X-CRM114-Status: GOOD (  15.23  )
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


On Fri, 30 Jun 2023 12:01:50 +0200, Julien Stephan wrote:
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
>  .../media/mediatek,mt8365-seninf.yaml         | 295 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 302 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230630100321.1951138-2-jstephan@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


