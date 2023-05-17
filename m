Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2165C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RASfi4C6iFM4Ndi70/5KgD6n2tXBLGdQMzw0G7ZIRkw=; b=O1Rk3VZyXJOdN0ZvXqcLKGG73w
	SP7sJ83mcFKJJpmh2+8KYfstoZmMQa20smLvvV8CR7IbhIhwsinHh6LyD2ffIdAyRfMneXvdzjijn
	vYuElKIpHK9g7j3+qtMl9t6yjEJaBqgj1hL37XDIwSVpc74tKdgpTaAtq0zoF+iy1Cpxv5Dq/MU44
	5i+ZhATRgb3Jj2VmzjiK8bVN2xIb3cQEhF1v4jlaogsJybjakIk/X3BJUpaZRCkwRLkg7H/ZpjcRA
	KTNJwZKoQCUk3mTc5oVPJYGkmD3OnzlLmmCO+MXXCzGlVce6ZD8m2aGqsebF0DP54rEzTMd2SRJho
	xirtwnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJ4j-00AIwu-06;
	Wed, 17 May 2023 15:28:25 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJ4f-00AIwF-3D;
	Wed, 17 May 2023 15:28:23 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6acc9273e3eso680373a34.2;
        Wed, 17 May 2023 08:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684337300; x=1686929300;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RASfi4C6iFM4Ndi70/5KgD6n2tXBLGdQMzw0G7ZIRkw=;
        b=hupnzEpT6GCWUTslRjIgxiNG8UpoTnZtfBdyqm2AkBZJy0515mlC0U0kya0ie8QYB4
         nd0VqMUMyyyJk5poFKtIdQC8W9V6DMT/IKm2sw/jnfmbQqzyk7akRVy6BxvMJdDySXIO
         rmSQztYAa+9AQKpj9XZrJ+VKCq43X55b34LZghJ6wM9XpKhLzOKygu7SXT+qRypsBW6n
         5kBSbFWxYdvJYIujTMapXwxOjo56rw3EKxc6pFxlYMLBzfoSwpfX9mxiNGVHm5oW6QuF
         bXB/6hb9qTZtzTy/4042NEfzMn1inrZN3Wz+UAkz//VL2wQDL3O1qu+S5131C8FvGTJ0
         YhIQ==
X-Gm-Message-State: AC+VfDxJU1W22cJT1Gp5zhyRteiHX6qYnRtfvBgxv88XEBdPjFokS78F
	CktXsB1kSPAiisiCC+H+3g==
X-Google-Smtp-Source: ACHHUZ6ijD9N5SseCCQ1cWe5HZUVSbftXF5bMVUuAmhW+DgCGKOm3XkKpKsWZ5OlaP5anPyYkVoUGA==
X-Received: by 2002:a05:6830:14c9:b0:6ab:840:c498 with SMTP id t9-20020a05683014c900b006ab0840c498mr15482515otq.33.1684337300240;
        Wed, 17 May 2023 08:28:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id di10-20020a0568303a0a00b006a5db4474c8sm13400347otb.33.2023.05.17.08.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 08:28:19 -0700 (PDT)
Received: (nullmailer pid 894363 invoked by uid 1000);
	Wed, 17 May 2023 15:28:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: khilman@baylibre.com, linux-mediatek@lists.infradead.org, tzimmermann@suse.de, devicetree@vger.kernel.org, linux-media@vger.kernel.org, matthias.bgg@gmail.com, nbelin@baylibre.com, linux-arm-kernel@lists.infradead.org, airlied@gmail.com, maarten.lankhorst@linux.intel.com, linaro-mm-sig@lists.linaro.org, krzysztof.kozlowski+dt@linaro.org, daniel@ffwll.ch, conor+dt@kernel.org, christian.koenig@amd.com, mripard@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, bero@baylibre.com, dri-devel@lists.freedesktop.org, jstephan@baylibre.com, sumit.semwal@linaro.org, angelogioacchino.delregno@collabora.com
In-Reply-To: <20230517145237.295461-8-abailon@baylibre.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
Message-Id: <168433729744.894347.3314650002007733913.robh@kernel.org>
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Date: Wed, 17 May 2023 10:28:17 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_082822_038724_D7B0172D 
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


On Wed, 17 May 2023 16:52:37 +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
./Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/mtk,apu-drm.yaml#
Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dts:18.15-22.11: Warning (unit_address_vs_reg): /example-0/apu@0: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dtb: apu@0: remoteproc: [[4294967295, 4294967295]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230517145237.295461-8-abailon@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


