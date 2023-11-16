Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E307BC54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJLCa9BJUO9S4zHRYogwFMFK2PMpkEI3l/l2BEdzPTY=; b=h7Rq/8EuomnEluO5euApML3JWr
	CyUUt4hoLVWU8MDwZuYI9gvbXcNFNpSSy/pJvGIeQ/1pbycAZ8F9MRcFUUOBhRUXILcFDkXJ1My0Z
	76d9rJQbzEc3+QfoNEwFrhKH3BhuT5ncVQw5b3kGbpCCPD61BkvK1dWSKRHECNw1lEUMHzoT5EFVe
	T83hsvEhxVw3P8ihlvuzzlEYiii0le5CptecPoRYuzB3uyOZoF3XWwv/cp0/MEdECnHCgBPxmQQpW
	ipgeVO07LVdrcjdXqtaBbAW8z8wO7k81zcfL3rdSYi/ucp+wkJ9AuODxR8JSLjH3ijhDBgRIDwBXE
	bFkAMotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3dej-003jc2-1G;
	Thu, 16 Nov 2023 14:47:45 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3deg-003jbK-37;
	Thu, 16 Nov 2023 14:47:44 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b565e35fedso499718b6e.2;
        Thu, 16 Nov 2023 06:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146060; x=1700750860;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJLCa9BJUO9S4zHRYogwFMFK2PMpkEI3l/l2BEdzPTY=;
        b=jTeTSv6A1p8ec+cuE9giG6i2Z01rsrp4JQJU5xp25PR05DhwBvyEV0FRdpAmOv5F1I
         46GeNrs56nmCtlygNfeFR9EMN+5MdhFj4E6GpWpmX+JfP3X7WqF7z4K9/UXJDTI9KB//
         /B1/6eACNoH1LD+FHsiePBJSPiAL3ByNyFTOEITNFfo3kkv/2J/FDVcXQXmKCi/ALoiE
         BmJR/lQ0L/o1qVgAuWQcImFEtKsSuemkUAXcnF4zzJY//cDP8uI/E2vNoaEvTPf+kuP5
         9aVkksQLl1NWCbSj1y7bwmAEjcBIT/JXamxp0XSN9G+7/pqZ65FGhti8fGw1ZEDvZpza
         NTMQ==
X-Gm-Message-State: AOJu0YwViXHNWLvheQPDgr79ILasATwmAIErAu6mADU4TxMkE4cITT9d
	rFhzq82mNSlUXrovr02h5g==
X-Google-Smtp-Source: AGHT+IFPfLMk9ZXtrXSoZO9M87qip+tgRskdEnJSSG1IlVIMZTyPT241QDgnYApZSoaLb6iwLIw3Rg==
X-Received: by 2002:a54:479a:0:b0:3b3:e64e:e0a4 with SMTP id o26-20020a54479a000000b003b3e64ee0a4mr17693802oic.54.1700146059680;
        Thu, 16 Nov 2023 06:47:39 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dj4-20020a056808418400b003b2f369a932sm1835291oib.49.2023.11.16.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 06:47:39 -0800 (PST)
Received: (nullmailer pid 2201084 invoked by uid 1000);
	Thu, 16 Nov 2023 14:47:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Sascha Hauer <s.hauer@pengutronix.de>, Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20231116131316.5897-1-zajec5@gmail.com>
References: <20231116131316.5897-1-zajec5@gmail.com>
Message-Id: <170014605188.2201020.9043410621344203853.robh@kernel.org>
Subject: Re: [PATCH V2] dt-bindings: thermal: convert Mediatek Thermal to
 the json-schema
Date: Thu, 16 Nov 2023 08:47:32 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_064743_026247_5965B570 
X-CRM114-Status: GOOD (  13.00  )
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


On Thu, 16 Nov 2023 14:13:16 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Add "maintainers"
> 
>  .../bindings/thermal/mediatek-thermal.txt     |  52 ---------
>  .../bindings/thermal/mediatek-thermal.yaml    | 101 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 52 deletions(-)
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231116131316.5897-1-zajec5@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


