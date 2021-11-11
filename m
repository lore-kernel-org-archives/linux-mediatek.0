Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57B1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 14:57:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B7360FDA
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 14:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79B7360FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wa8Gemy5SunzW7Q7blQ7/ExDRq75oRI++9owYBqfCr0=; b=g8CJdxA16N0r1M
	sCbf79qXbZOdgMBUBkGkaC5H1GD5Oh4+moVy9ZHlutRCchAHJfM0aB7FfH1U6yd9yv5WZEZt3Cr5w
	dzx2ysY2IQdpucIdtYp/bmYTnKNTS+8Pf77oPvTaOzFA/wn6cwUrhmZjWX79ohoVi8bYBONI3RPj/
	tVgafJp6Q6+CYRpqNy6qBAXpUnhxokusLA5lt/FGS7wiD4oeg7557If9k5MGMzgOMFFV8wXBiUARH
	c4T0oXRo6rYf5UT29Uv77Gg3VXBvJ5JQhMIXWqO+i8k5qDjwzoL5jD8uEqo2CBTZyG7ku/1WvoMWQ
	e+4HvcA6ZBcIQQjesGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlBWN-008COE-Ly; Thu, 11 Nov 2021 14:57:47 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlBWB-008CLW-28; Thu, 11 Nov 2021 14:57:36 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso9219922ots.6; 
 Thu, 11 Nov 2021 06:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=64/gMeluDh46xQANFHjT+1DBqKjidRINOKcAP65+XLA=;
 b=OEpcbEFzXzlEMX2YbppyUa7pIrs/GUgJGVObNZ2dFnXJ6QSU0FaJ7eDHVAOhemaO1F
 HRlCgLmiOPL6uqLqOHNLpqyNi8MK58NpNGA3/Ni8NA/Ap30M1Jpt2QxaEQFpznUZVCcP
 qohhrrN+WebSVkmSKS7SZ2Px30EKLLrq1HBBYIPnN1wHgJDgWLqPT9s3ejGyS8yqpuZd
 6nCWIpOe9JbGZrWZCuyWQdg82VsZXnC87xyT5f3bSXa56i4BKPy9ypELyluguhI4YJ+/
 CnSySppGQHyOM40/fSWISJ/kWwf+Z3jFRyY1R4cBOISrxA7KXuzjYMTojGVrjRVzll2T
 gRFA==
X-Gm-Message-State: AOAM530TiCeFK9c6mWphewsd5gzQauI17hFD4kIw22bQT4F0oodkmo1n
 2rr6xrlb2wJVuvYopTUokQ==
X-Google-Smtp-Source: ABdhPJw/R+Mjewhuy/cboJpMNmZlgIh2IRZTJ82ScnNL4x3sE567kKqKxWKBtD27mha3LodQ/D2z+g==
X-Received: by 2002:a05:6830:1dab:: with SMTP id
 z11mr5974863oti.103.1636642652099; 
 Thu, 11 Nov 2021 06:57:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 9sm695269oij.16.2021.11.11.06.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 06:57:31 -0800 (PST)
Received: (nullmailer pid 3774083 invoked by uid 1000);
 Thu, 11 Nov 2021 14:57:26 -0000
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-i2c@vger.kernel.org
In-Reply-To: <20211110194959.20611-1-fparent@baylibre.com>
References: <20211110194959.20611-1-fparent@baylibre.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml
 schema format
Date: Thu, 11 Nov 2021 08:57:26 -0600
Message-Id: <1636642646.887422.3774082.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_065735_128132_DFD8D823 
X-CRM114-Status: GOOD (  16.17  )
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

On Wed, 10 Nov 2021 20:49:56 +0100, Fabien Parent wrote:
> Convert the binding documentation for i2c-mt65xx driver to the
> YAML schema format.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v3:
> 	* rebased: added new compatible since last revision + added vbus-supply
> 		description
> 	* added clock-div description
> 
> v2:
> 	* write compatibles in a more compact way
> 	* set the node pattern to be "^i2c@[0-9a-f]+$" instead of
> 		"^i2c[0-9]*@[0-9a-f]+"$
> 
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  51 ---------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 106 ++++++++++++++++++
>  2 files changed, 106 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: properties:vbus-supply: '$ref' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: properties:clocks: {'minItems': 2, 'maxItems': 4, 'items': [{'description': 'Controller clock'}, {'description': 'DMA clock'}, {'description': 'ARB clock for multi-master when a bus has more than one i2c controllers'}, {'description': 'PMIC clock. Only when mediatek,have-pmic is set.'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: properties:clock-names: {'minItems': 2, 'maxItems': 4, 'items': [{'const': 'main'}, {'const': 'dma'}, {'const': 'arb'}, {'const': 'pmic'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: ignoring, error in schema: properties: vbus-supply
warning: no schema found in file: ./Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
Documentation/devicetree/bindings/i2c/i2c-mt65xx.example.dt.yaml:0:0: /example-0/i2c@1100d000: failed to match any schema with compatible: ['mediatek,mt6577-i2c']

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
MAINTAINERS: Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt

See https://patchwork.ozlabs.org/patch/1553583

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
