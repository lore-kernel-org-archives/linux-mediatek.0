Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC58C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiATJ9Ae1Pi7ofcD6bHPkPAkJ7RwAhGEYTi2JIxus3w=; b=Dy+u1b1gcapTaLEdd5fhuQF0IH
	vvHkCRj6jBAwpiKKA7DqcDKUXLuIYGWuWtfB3wA4CbkL1AQpYGUDAQQIL9gxVgxkSgDJrVHu8b5IR
	AhQBnKLLYpfnMW0lSaHXccmUq5RJg5DBaLFCVEE/xTOQh9rsxRrFM7Qj+0Rwni5vWqw8P3zN5drIr
	oyo6xuF31Wn4+BfJqgypWLzGoExXyDLdB2h2RtqqdWs6aF2/slo3o6+DU+tgM53/N3YwpTPI5IiAa
	O1W4pIsrM3G63QQdijf+Q77ggrOwy2jgEDm3Hd1bKR82k07Az3F0spmmCCaaGkV4luMQrikS96m2Z
	lqfTATNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3cOp-003asG-0A;
	Thu, 16 Nov 2023 13:27:15 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3cOl-003aqe-1r;
	Thu, 16 Nov 2023 13:27:13 +0000
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b58d96a3bbso447528b6e.1;
        Thu, 16 Nov 2023 05:27:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700141229; x=1700746029;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EiATJ9Ae1Pi7ofcD6bHPkPAkJ7RwAhGEYTi2JIxus3w=;
        b=gHDefY3YKnqbqEmBcbrDfl4Oelo+bQju0HelysotCRIYqBjSiSRzXrLm24K8NIxTEE
         k/SpdZbvn3UUVJkDwsZ94+v6Qkd2dYWtYmPuI0Il1tEmbVgw7lEI+5xTHOl8ih+L/E/7
         GzXT+x0KojZvZjfU9LkC1qXq0b9t+ejLVanZYG/F5i1isRZLusk17O3MRKBRDhvpPBOt
         9evVMYwRmdJDli6iZbBvjtTwt/rPAXaeAPyG4PHl+yEsvxFMF/JZlAPUltSDWetgSlHA
         ImuJ6Vio321O3JDpwsrNHIi1CQ28Sq04sROor4Qk2wM8VOlGucGAf9yjDgie4DQXGbbw
         KBig==
X-Gm-Message-State: AOJu0YwPZrG0icD+ckISW2zFv6FAPwyqJgKxUrMeFoEjdNGgqVjdvF6B
	LLqm+7/+UPm1xuwYY6C8VQ==
X-Google-Smtp-Source: AGHT+IHNttpWJHud5egHX7x35FHNuN5x7ZpDa2udGMDZU3OfKdGWUGV4Qavil1YBq7dDUwm1Psyq/g==
X-Received: by 2002:a05:6808:290d:b0:3b5:64c9:5146 with SMTP id ev13-20020a056808290d00b003b564c95146mr14830718oib.42.1700141229661;
        Thu, 16 Nov 2023 05:27:09 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b24-20020a9d4798000000b006c4edf462d7sm906748otf.43.2023.11.16.05.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:27:09 -0800 (PST)
Received: (nullmailer pid 1870084 invoked by uid 1000);
	Thu, 16 Nov 2023 13:27:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>, Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20231116120225.29999-1-zajec5@gmail.com>
References: <20231116120225.29999-1-zajec5@gmail.com>
Message-Id: <170014122769.1870053.16125262341176189916.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: thermal: convert Mediatek Thermal to the
 json-schema
Date: Thu, 16 Nov 2023 07:27:07 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_052711_619540_56D0EEF7 
X-CRM114-Status: GOOD (  12.22  )
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


On Thu, 16 Nov 2023 13:02:25 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/thermal/mediatek-thermal.txt     | 52 ----------
>  .../bindings/thermal/mediatek-thermal.yaml    | 98 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/mediatek-thermal.yaml: properties:resets: 'Reference to the reset controller controlling the thermal controller.' is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/mediatek-thermal.yaml: properties:resets: 'Reference to the reset controller controlling the thermal controller.' is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/mediatek-thermal.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 8, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 144, in main
    sg.check_dtb(filename)
  File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 89, in check_dtb
    self.check_subtree(dt, subtree, False, "/", "/", filename)
  File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 82, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 82, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 77, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
  File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 33, in check_node
    for error in self.validator.iter_errors(node, filter=match_schema_file):
  File "/usr/local/lib/python3.11/dist-packages/dtschema/validator.py", line 393, in iter_errors
    for error in self.DtValidator(sch,
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 288, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/_validators.py", line 414, in if_
    yield from validator.descend(instance, then, schema_path="then")
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 305, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 288, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/_validators.py", line 332, in properties
    yield from validator.descend(
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 305, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 278, in iter_errors
    scope = id_of(_schema)
            ^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 101, in _id_of
    return schema.get("$id", "")
           ^^^^^^^^^^
AttributeError: 'str' object has no attribute 'get'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231116120225.29999-1-zajec5@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


