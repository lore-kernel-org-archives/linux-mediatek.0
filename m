Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45DAC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ABYdNkFKBFRNWab8mxw4kb18qdWZBOQPLFeqpwcNJk=; b=T013TCgJoCj3ejeOpMPIfJ3RNd
	a4nDNwIRGailt/1jXsQ+0rDM5wR5qYS+aQjSFQ39a9FysQtDLVPiwGnYymLQEc0qfSxCoCaTNBJQR
	11n26ElJFQ9glZLlZB/7KSsC+HkrF/0To3jP0q2Q7jmQ/8kIZhURZ3Wb7HzvdRF8MqKhgm20X49zE
	UQeLWTiQmvmrBeBrBK8gpmOe66E85DKjEdj/J8eRh7qc0PcBAlgz2TQD36LMljFfUQEY/tasJdY0V
	Swd0rmFBHWllD2u2bE/dMJxD+GxobVZ2DsB8GwZDtsZpJVFJ4gRaLJl7RgAlTSrtyW+2Fi7BTRaBL
	SK7NzqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r68dS-004lHA-2v;
	Thu, 23 Nov 2023 12:16:46 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r68dQ-004lG1-0I;
	Thu, 23 Nov 2023 12:16:45 +0000
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-35b1d57d7dbso2375795ab.3;
        Thu, 23 Nov 2023 04:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700741803; x=1701346603;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ABYdNkFKBFRNWab8mxw4kb18qdWZBOQPLFeqpwcNJk=;
        b=vgZfA3qrRlG/hJk1C3Z4nsn2tRAiWW7JG/N+2QqQUr4bthC+XPFhnbNNv0aetEZS0L
         A3lzUBBYZA63dDGOS1I2Swn8C5XQ19LufYHZSHOmD0O+P5Aaxvxc84v796h9lXNv1Fhz
         pUvUHLh9d4IOxGMTGlR8RvIXYETdWJOS90++aM9890EqUjqNh9aWweBnkuoPTigCm3IB
         fzsu4dxle0D784j15XZG3zt02fegUp83dys/6F35xKBaS3hlQRylCmEzoPpY2MxQurhn
         m+i5mYHs7ufRjRxdwfnv2qV1Iol2ntqn1lGbHab+ch+XRN5/v3nGEpOoeexIdIohHh8K
         Tw0w==
X-Gm-Message-State: AOJu0YxjTfQ6Cbzw+elrme99vfjFARazLX6ZOXK9ft6XrDnZmqoF3thv
	/tYNBzh3YTsPByNlDOJpgA==
X-Google-Smtp-Source: AGHT+IGnJ5zLxO0Amw6q36pyoOYqwFkUrfD9vSmlUmkYLqpXg8cbkLjhN79VbrEGip0Himn8/AUBxQ==
X-Received: by 2002:a05:6e02:1145:b0:35b:41e:6357 with SMTP id o5-20020a056e02114500b0035b041e6357mr5236207ill.14.1700741802689;
        Thu, 23 Nov 2023 04:16:42 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a17-20020a92ce51000000b003576e122389sm321280ilr.24.2023.11.23.04.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:16:41 -0800 (PST)
Received: (nullmailer pid 826780 invoked by uid 1000);
	Thu, 23 Nov 2023 12:16:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: sakari.ailus@linux.intel.com, 10572168@qq.com, linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, macromorgan@hotmail.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, bingbu.cao@intel.com, jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, hdegoede@redhat.com, heiko@sntech.de, hverkuil-cisco@xs4all.nl, yaya.chang@mediatek.com, tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net, jacopo.mondi@ideasonboard.com, andy.shevchenko@gmail.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, yunkec@chromium.org, shengnan.wang@mediatek.com, dan.scally@ideasonboard.com, linux-media@vger.kernel.org, conor+dt@kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20231123115104.32094-2-zhi.mao@mediatek.com>
References: <20231123115104.32094-1-zhi.mao@mediatek.com>
 <20231123115104.32094-2-zhi.mao@mediatek.com>
Message-Id: <170074179924.826739.5309761699074670232.robh@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Document GC08A3
 bindings
Date: Thu, 23 Nov 2023 05:16:39 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_041644_125035_BE083BF8 
X-CRM114-Status: GOOD (  11.71  )
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


On Thu, 23 Nov 2023 19:51:03 +0800, Zhi Mao wrote:
> Add YAML device tree binding for GC08A3 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>  .../bindings/media/i2c/galaxycore,gc08a3.yaml | 128 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.example.dts:29.37-38 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231123115104.32094-2-zhi.mao@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


