Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D12DD116F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xd04XdmAGe70xw02O+BseE6+4n3YbnX/7asIzkdBhqk=; b=MX05u08EbdcE3L3P4JuDxp3m3Z
	NbwPYZHgHQv9Z/JDgcVjKRUD8Vds6isRXGWRCtShNkdWz0exy5XEmzyZyW7UV2MTxSLJ/MfpQZLv2
	dvb25TDQupx2IrpYOOxhu7SRXaMHhNkf00QZE/2rMm8XNr1IixzSyffzG9Pe1QliQq2p04eJvpfC9
	BUEsL+G+gTGRH/R/nYhZjHPc8leVR12KhcfAZRDrGZMauOndX7DY1psgYyyf2SST4uRGnN6FraJxA
	s6ppGMSeznuUM6o42UMj+mqUawgjJslrfi1QsYxxgvowNu/T1KWe7gdUng7mKq9cLaneCAQqhktBV
	h0MjuhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0m9-00000003H4v-0NLq;
	Mon, 01 Dec 2025 10:04:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0m6-00000003H3E-0gF7
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 10:04:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47790b080e4so18832015e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 02:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764583492; x=1765188292; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xd04XdmAGe70xw02O+BseE6+4n3YbnX/7asIzkdBhqk=;
        b=YdmvxxtZN+PlGY3J8YF1bFkSJV9MRFZH+XGnuBcxtksXRwzqGZYF/ZSwQkb70vpWqD
         hKTmuMSkmdlNB6lC0VH1N5SiH14F6r9APXE4tW9fd01X2SRPzB1biuayIsjnagOoEpV3
         1PSU+Dtlo3/vKD9eOBeeQGs+dC6/rkfv7YXlHtXjxj3kiHIGPADE/layxVGH8mOdseGG
         JT+Cn/aAw3ThH/ybPDG2NIPijPJB9SQAk5IegPAarQog4siYc0114uZz7om4YSujDMIZ
         PTHlb0HYYD+Cgbdomy9W9/PqTbFrR4zAltAlz8I+/spN7cuDuq1WA+J0c/Kk10Mnx47F
         ON5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764583492; x=1765188292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xd04XdmAGe70xw02O+BseE6+4n3YbnX/7asIzkdBhqk=;
        b=UzrYZkmrLXep7c3CjPK9plEXBCxYk4ErD0Jxpdgr0fJoDb+1Be5C4Q9xUpm9W2Zad1
         12KbDh3UdKe7t3agBbS4GPolS2fkRX840a+HC4Dp2qPHBKabCSzr+y0+S1OBjJF5epYS
         7V/ZBkhUsp4zRPoK0xAUxFJyrcWcIxQh/VEsTB9qoUbUV6R2LVizFa36kZDCZp2jPStF
         i/43eS7SOcJ0tj61VQmvTmxBtf3RHCP1Fg9rzN+Lly+G9NTyODgCKO2I4N2+xKYJ2XkA
         q1zyErWCGDrgr8ofXI4vzZDuyLPdz883FRNxjPBBRmgG/d9Ibaszx8IIRXHXf3i5G0n9
         QNHg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ8mtF01OwIxZHok3G6kp/9whzg8yZenPFRhlaZK0g13wk6TMapAi/m/dIN8e+QVm3WaJQevdLYKwM++PsKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwm8KWIis3MzHJdTsgWJMBVmczU/t/J5ON0bPnad9+S9hpEa3i
	dt1dgHxga+EwotPzLv+kxG77R6Vo/QneLGO4IGofGECUGZvEVv0W/CbTZAlofQ==
X-Gm-Gg: ASbGnctQifcNpaXqBFCvB2bN9OrJd7pftU/MnHKJXTlbLzBVzvKd1LLY4k990KGtTwK
	GKPw18uatmIEReE1tEZHlToxhLbIqRImaaD3s0DmWRQ+UYmipbu9q8XK8g3tVLpOmL5B/3Yfb2G
	VxedUXyOLYyaXhOJ8y21X8hfkUk5hlcZH++aMCxywBY9a+lvNh44ZM9CYXOJQhkrX19cXyTxS8E
	NEtyXMG4c8qE6qHNcVpoVvcPZbwL96mw8d4h12j2Jve9b0Dy7z95vzJX+IZZ6VIgGZVXvjwYZN6
	/mfbZDzPzXwmVRAUYl5mZIOgjRCaUNmjaQD/Gdt6uo5asBR6f6tnrUCHXgkjJtHhGlcMtZTb4gn
	mHvi4VpUtOaAU87Iy0FShhUTD+65jMPRkcKSIB5v39INpwLWPJqeQaDeEMvjbmYSGphI8r1y3qS
	14PT8iwo+X8VT9MWO5
X-Google-Smtp-Source: AGHT+IHo5bI1IRZ9DJRFKm5suWsmADqZbLqR/rj8bQ8rERwyjgO7HPxMN1i7xosry+PHVlL5KsnDVQ==
X-Received: by 2002:a05:600c:1f0f:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-477c1132bf2mr369712165e9.30.1764583491941;
        Mon, 01 Dec 2025 02:04:51 -0800 (PST)
Received: from owl5 ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791163e36csm224508325e9.9.2025.12.01.02.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:04:51 -0800 (PST)
Date: Mon, 1 Dec 2025 11:04:50 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Ezurio LLC
Message-ID: <aS1oQonkuFpyqSI2@owl5>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
 <20251201084140.376058-2-bisson.gary@gmail.com>
 <176458161856.2489196.6170126310129033736.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176458161856.2489196.6170126310129033736.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_020454_263555_34862077 
X-CRM114-Status: GOOD (  20.96  )
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

Hi,

On Mon, Dec 01, 2025 at 03:33:40AM -0600, Rob Herring (Arm) wrote:
> 
> On Mon, 01 Dec 2025 09:41:36 +0100, Gary Bisson wrote:
> > Ezurio is the new name of Laird Connectivity after it acquired Boundary
> > Devices.
> > 
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > ---
> > Cc: robh@kernel.org
> > Cc: krzk+dt@kernel.org
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Traceback (most recent call last):
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 428, in get_or_retrieve
>     resource = registry._retrieve(uri)
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 426, in retrieve
>     return DRAFT201909.create_resource(self.schemas[uri])
>                                        ~~~~~~~~~~~~^^^^^
> KeyError: 'http://devicetree.org/schemas/thermal/qcom-tsens.yaml'
> 
> The above exception was the direct cause of the following exception:
> 
> Traceback (most recent call last):
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
>     retrieved = self._registry.get_or_retrieve(uri)
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 435, in get_or_retrieve
>     raise exceptions.Unretrievable(ref=uri) from error
> referencing.exceptions.Unretrievable: 'http://devicetree.org/schemas/thermal/qcom-tsens.yaml'
> 
> The above exception was the direct cause of the following exception:
> 
> Traceback (most recent call last):
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 463, in _validate_reference
>     resolved = self._resolver.lookup(ref)
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 686, in lookup
>     raise exceptions.Unresolvable(ref=ref) from error
> referencing.exceptions.Unresolvable: /schemas/thermal/qcom-tsens.yaml#
> 
> The above exception was the direct cause of the following exception:
> 
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-validate", line 8, in <module>
>     sys.exit(main())
>              ~~~~^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 158, in main
>     sg.check_dtb(filename)
>     ~~~~~~~~~~~~^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 95, in check_dtb
>     self.check_subtree(dt, subtree, False, "/", "/", filename)
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 88, in check_subtree
>     self.check_subtree(tree, value, disabled, name, fullname + name, filename)
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 88, in check_subtree
>     self.check_subtree(tree, value, disabled, name, fullname + name, filename)
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 83, in check_subtree
>     self.check_node(tree, subtree, disabled, nodename, fullname, filename)
>     ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 34, in check_node
>     for error in self.validator.iter_errors(node, filter=match_schema_file,
>                  ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                                             compatible_match=compatible_match):
>                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 448, in iter_errors
>     for error in self.DtValidator(schema, registry=self.registry).iter_errors(instance):
>                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 384, in iter_errors
>     for error in errors:
>                  ^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 296, in properties
>     yield from validator.descend(
>     ...<4 lines>...
>     )
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 432, in descend
>     for error in errors:
>                  ^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 275, in ref
>     yield from validator._validate_reference(ref=ref, instance=instance)
>                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 465, in _validate_reference
>     raise exceptions._WrappedReferencingError(err) from err
> jsonschema.exceptions._WrappedReferencingError: Unresolvable: /schemas/thermal/qcom-tsens.yaml#
> Traceback (most recent call last):
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 428, in get_or_retrieve
>     resource = registry._retrieve(uri)
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 426, in retrieve
>     return DRAFT201909.create_resource(self.schemas[uri])
>                                        ~~~~~~~~~~~~^^^^^
> KeyError: 'http://devicetree.org/schemas/thermal/qcom-tsens.yaml'
> 
> The above exception was the direct cause of the following exception:
> 
> Traceback (most recent call last):
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
>     retrieved = self._registry.get_or_retrieve(uri)
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 435, in get_or_retrieve
>     raise exceptions.Unretrievable(ref=uri) from error
> referencing.exceptions.Unretrievable: 'http://devicetree.org/schemas/thermal/qcom-tsens.yaml'
> 
> The above exception was the direct cause of the following exception:
> 
> Traceback (most recent call last):
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 463, in _validate_reference
>     resolved = self._resolver.lookup(ref)
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 686, in lookup
>     raise exceptions.Unresolvable(ref=ref) from error
> referencing.exceptions.Unresolvable: /schemas/thermal/qcom-tsens.yaml#
> 
> The above exception was the direct cause of the following exception:
> 
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-validate", line 8, in <module>
>     sys.exit(main())
>              ~~~~^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 158, in main
>     sg.check_dtb(filename)
>     ~~~~~~~~~~~~^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 95, in check_dtb
>     self.check_subtree(dt, subtree, False, "/", "/", filename)
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 88, in check_subtree
>     self.check_subtree(tree, value, disabled, name, fullname + name, filename)
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 88, in check_subtree
>     self.check_subtree(tree, value, disabled, name, fullname + name, filename)
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 83, in check_subtree
>     self.check_node(tree, subtree, disabled, nodename, fullname, filename)
>     ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 34, in check_node
>     for error in self.validator.iter_errors(node, filter=match_schema_file,
>                  ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                                             compatible_match=compatible_match):
>                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 448, in iter_errors
>     for error in self.DtValidator(schema, registry=self.registry).iter_errors(instance):
>                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 384, in iter_errors
>     for error in errors:
>                  ^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 296, in properties
>     yield from validator.descend(
>     ...<4 lines>...
>     )
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 432, in descend
>     for error in errors:
>                  ^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 334, in allOf
>     yield from validator.descend(instance, subschema, schema_path=index)
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 432, in descend
>     for error in errors:
>                  ^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 275, in ref
>     yield from validator._validate_reference(ref=ref, instance=instance)
>                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 465, in _validate_reference
>     raise exceptions._WrappedReferencingError(err) from err
> jsonschema.exceptions._WrappedReferencingError: Unresolvable: /schemas/thermal/qcom-tsens.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251201084140.376058-2-bisson.gary@gmail.com

This link gives me a 404 error, is it expected?

> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

Couldn't reproduce, I can't seem to see any error/warning that would be
introduced by this patch, can the above be discarded then?

Regards,
Gary

