Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52D5C25B67
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 12:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYlGtsDkwIplMMDKnitSehXlNwqD+lQR4ItqdPikmlA=; b=gVQ79v/aIf6CqGtEMzCXaVmrKZ
	d0/7Yl6bvFKXv3NcudHixKB84oddHapAngOEBqc/karAh9SD8wBm9i/MmD7fM75a12pi86hL216kr
	Ngsz5Lbd9dvwvXl5Px2NtU2p/Gbkg9QOLECG/LmeHOlh6VNtYGk7ZSA8v7Okk6AJqTN9C3rVJ2yNs
	Eb2PRYoYDqgz3EnRsP4t+HfuLxCrPfcV8UYbLyuCyYG9usR3ihpApelT6D6kWJBk61bOzRYq/oNCE
	MBEJFGoOeo3Vi43Gn4ZMxJLJLi4C7Ngpsvtd0p/087hPo/4HFdbp2JqAU9iNoKJamdFW7cXIdJgnP
	uEWwGfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvzdO-00ES8k-0O;
	Thu, 26 Oct 2023 12:38:46 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvzdK-00ES7e-36;
	Thu, 26 Oct 2023 12:38:44 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6c496719a9aso423057a34.0;
        Thu, 26 Oct 2023 05:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698323920; x=1698928720;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mYlGtsDkwIplMMDKnitSehXlNwqD+lQR4ItqdPikmlA=;
        b=Mt9y+P/8Yd0K8vIWHTbZvhUcVvC/dCWMNW3+rHSXwQ5CKrNDBwV6zA3fKs1vP3KcBL
         gbRvWv3gT3wE3s4/3/c0TJmca0+b60TvYFiDyl+sxgiaAdBT149k2ZRGFhdLRzKe7Mst
         KoimOtM9cU5ReSGo0cvhhtv4p47NYQRlq47EkBLIzdTwVte4yda0Pk5SzBpSYwkM0+SQ
         950qSCDLRTXgBu/ct7arYUhAX2i9e3x6VMNvTYCkXcrnh3rxPtjFCaNFR1XIo+ypHHZz
         /L2lKnenI+3wEKSKnutaCPWE0FT6XsvfpiSK0XNUTh623xXOfjpp+J19O1hBN/uRxt2x
         7LmA==
X-Gm-Message-State: AOJu0YygI00YSB0viKLiPQlL07BwsM3DhYVQwVaVxLRLN2mJoRpt0jQk
	Ca0PjGouFk80BXpDHMD01Q==
X-Google-Smtp-Source: AGHT+IGPNkjxWdQ54Pt7m6sZj9ctL7yRpUNOch/924+5N+/XoEwdc5zfnlX7MrRmcNHcUD8UlspAKA==
X-Received: by 2002:a9d:63d7:0:b0:6b4:4ee1:b525 with SMTP id e23-20020a9d63d7000000b006b44ee1b525mr1369239otl.1.1698323920284;
        Thu, 26 Oct 2023 05:38:40 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v7-20020a9d6047000000b006ce33902b07sm2589636otj.30.2023.10.26.05.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 05:38:39 -0700 (PDT)
Received: (nullmailer pid 3459246 invoked by uid 1000);
	Thu, 26 Oct 2023 12:38:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20231025215517.1388735-5-hsinyi@chromium.org>
References: <20231025215517.1388735-1-hsinyi@chromium.org>
 <20231025215517.1388735-5-hsinyi@chromium.org>
Message-Id: <169828011805.2202183.11133384715258450793.robh@kernel.org>
Subject: Re: [PATCH v3 4/7] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Date: Thu, 26 Oct 2023 07:38:38 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_053843_003486_256FDBC1 
X-CRM114-Status: GOOD (  12.27  )
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


On Wed, 25 Oct 2023 14:48:46 -0700, Hsin-Yi Wang wrote:
> Add makomo sku0 and sku1 which uses different audio codec.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2->v3: remove rev since match on sku is sufficient.
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek.yaml: properties:compatible:oneOf:42:items: 'oneOf' conditional failed, one must be fixed:
	[{'enum': [{'const': 'google,makomo-sku0'}, {'const': 'google,makomo-sku1'}]}, {'const': 'google,makomo'}, {'const': 'mediatek,mt8183'}] is not of type 'object'
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek.yaml: properties:compatible:oneOf:42:items:0:enum: 'oneOf' conditional failed, one must be fixed:
		{'const': 'google,makomo-sku0'} is not of type 'integer'
		{'const': 'google,makomo-sku0'} is not of type 'string'
		{'const': 'google,makomo-sku1'} is not of type 'integer'
		{'const': 'google,makomo-sku1'} is not of type 'string'
		hint: "enum" must be an array of either integers or strings
		from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek.yaml: properties:compatible:oneOf:42:items: 'oneOf' conditional failed, one must be fixed:
	[{'enum': [{'const': 'google,makomo-sku0'}, {'const': 'google,makomo-sku1'}]}, {'const': 'google,makomo'}, {'const': 'mediatek,mt8183'}] is not of type 'object'
	{'const': 'google,makomo-sku0'} is not of type 'string'
	{'const': 'google,makomo-sku1'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231025215517.1388735-5-hsinyi@chromium.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


