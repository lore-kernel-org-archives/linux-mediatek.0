Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C457EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 14:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C3A61076
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 14:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88C3A61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6s2Wqdj5+JZzXHqpjWa2IGwyPMSS94DmAXWjk8NtOak=; b=MUo9rx0rBqcN4f
	f+etYH2EVRHF2eypHI6Tu3t2jxqsZgMOuBlzxAiVOtTR/xvr05NjAQJoMtqgA18rOWYw6eCyaukF8
	JwbDRlOuHyEyr/I0T/iy7sU+eyuGeP3iwv7smz+MU668H6jHVG6sJNjb9ea1Jw651V9oe6UlM/6rn
	+p3S+5Cv5EamWXHULki5ykc0NCu3k/LLHIy7FZVLJ8Qlz4Js6A0gxbaM8+JN2GvpQiCJhLgGfTQQZ
	aRYSBf++6WTScYGifZblXsjyMPRgyj56kcSh7wrEOOPv22hEWPAuALrTA/zPuemYBKNWbz2YT7g6d
	f2YuAMAyTrJ8bXsnCxAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTlkG-00Em6r-5G; Fri, 24 Sep 2021 14:00:08 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTlja-00ElwD-Gy; Fri, 24 Sep 2021 13:59:29 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso13174580otv.12; 
 Fri, 24 Sep 2021 06:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=WcWh55mrnHlrmpS4bF3C6RTmMv+GgWp8tjxqVJlKmm8=;
 b=pOX7E4cxvpwAsS51ge+BSh5O7mEdxj1vVZJzWFK5kL/5uOvJqgVnbdq6ujz91E4vdn
 eGKwWU8YKqBVzIL0nBP9XU7b6617+xqB9kdBbeT0Yn34XopBhGmHT2HUxueGO9OJ8ly3
 20wHnqU7DvR5U/qIAss5kvEs1QUhN/QYC9zek/xZjp8OFiMAPHqv25d/7jr7TZCVIIgc
 eh/IjnlihLrMDSSkYSDP4xN1XxLahG5MUfsjT2XmNn84FmQG968MAzrTCmpu3T8zsAQQ
 BxHc72z7mDWmfEY9zvCRh988mtAoJXwWmLlCLX+iP1p1NRKGqLiZSAZmwstPFkGWqEHU
 OS6g==
X-Gm-Message-State: AOAM531IBT4KgjbT7r0AvbiQ9I8i5KAwD8kr4JKGDWerXvCLW+7DDhni
 SsQiZjiCl/5UkBwBOZLT2w==
X-Google-Smtp-Source: ABdhPJwu5vf62gkghKqrJp812TiqZCJ5L14q4YY1lFn4pkmkXKCEkfSFSlIERBrP2Win5Yi3GNO6Sw==
X-Received: by 2002:a9d:4a83:: with SMTP id i3mr4246791otf.385.1632491964290; 
 Fri, 24 Sep 2021 06:59:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d26sm2075540oij.49.2021.09.24.06.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 06:59:23 -0700 (PDT)
Received: (nullmailer pid 1195979 invoked by uid 1000);
 Fri, 24 Sep 2021 13:59:21 -0000
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-clk@vger.kernel.org, Ryder.Lee@mediatek.com,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, seiya.wang@mediatek.com,
 sean.wang@kernel.org, robh+dt@kernel.org, enric.balletbo@collabora.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 wim@linux-watchdog.org, linux-mediatek@lists.infradead.org,
 herbert@gondor.apana.org.au, mturquette@baylibre.com,
 linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org, mpm@selenic.com,
 linux@roeck-us.net, john@phrozen.org, sboyd@kernel.org, hsinyi@chromium.org,
 linus.walleij@linaro.org
In-Reply-To: <20210924114459.28664-1-sam.shih@mediatek.com>
References: <9aa66a93-4d0c-176e-ea35-b5aa33751d51@gmail.com>
 <20210924114459.28664-1-sam.shih@mediatek.com>
Subject: Re: [v4,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date: Fri, 24 Sep 2021 08:59:21 -0500
Message-Id: <1632491961.645727.1195978.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_065926_632297_2916FFA5 
X-CRM114-Status: GOOD (  14.10  )
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

On Fri, 24 Sep 2021 19:44:59 +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
> do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v4 : used yaml format instead of txt format document
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 350 ++++++++++++++++++
>  1 file changed, 350 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: 'pin_group_table' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-up-adv: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-up-adv: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-up-adv: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-down-adv: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-down-adv: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties:conf:properties:mediatek,pull-down-adv: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
Error: Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:37.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1532240

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
