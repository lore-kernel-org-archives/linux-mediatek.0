Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A80C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 13:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHVBqSeVF4foBBH9Sc08wlUpuqSdi/7U8sXCqIJzoeA=; b=R0gqs10/+tbIq+
	fuR3FLUcxNlUgbN18yoT/kgvvSKLlW5oPaO1HPqHRhc5cmFkvLh0u9Qi1oqx8JiSS8qfsEeUFFufh
	x479IMa8aAvOAmUUTX3AyqxLVerJp69ub4iFLJimcS7g/hPO+AQdUPkslLHYjX7T928UMdx5Nv42T
	tByB4hc5DbyRW+NG6VdAnHppQHN94OsqKfn8Uj0BRNE4kKQxchpPWMs2dceDl4TMRMDaO+OfWiCC/
	QLU4OUjJ19UeoIfwEIlZxMcS+vGTQGunqVPOnbzkrkuYF88N6N2eudQl+coEcYOHxJMBvjRiBI8tC
	1mUdTxIf7Mn/Zo/9zyHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kCm-003rYr-Iz; Mon, 13 Jun 2022 13:34:08 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kC7-003r6m-17; Mon, 13 Jun 2022 13:33:28 +0000
Received: by mail-il1-f182.google.com with SMTP id h7so4237228ila.10;
        Mon, 13 Jun 2022 06:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=11tFqD3m8Y4XwFlrhzVilQYpi5rnvNYwyh/colXebbQ=;
        b=hPr96+g+jPKNFSzGlda9Gqbhxw7gdg+5LQT4BHhmGO6eIWDQ7m/D5GgcW5UKP6YsEk
         On+LaVG1pn/HMlIyDVw1PT8CoMh4788Gc0wZf/O5HUOUZnUAB/bxXFv/9xC38t3kCvrK
         srs4hnVfex+s4re/2UUijoVw71ma55H2N5uiznig/PPPQFl7PHP3eT/ZZlCwsvK29N1X
         +9sUPofcGR4Y3Y4l0xqnh68f7YG/iTO15udVsEo1WqQ3rYzXaSvEtAXjv7Vo3yqfQjY3
         6oHHxj9yfFvWyBTc+vkvso84Z+BBRwMkzJwN2rLc6WE8FfPIFXjPWxbmshY+BTA3AOiX
         taEw==
X-Gm-Message-State: AOAM5311AzsxbWL9x3NsFSut0TRx7WpeUTnwSx2/6tWdx9EmZtxVJWPG
	E1TdWROb177o3dKSpzFVcw==
X-Google-Smtp-Source: ABdhPJzmK2cQV83DMuVJPdr/ZvzCb4HSLLb6Uq1aIv7PF7+f2zyEtUCDw+8RtX1G2m0ocrPThjCEww==
X-Received: by 2002:a92:d5cf:0:b0:2d1:d9b0:d5b1 with SMTP id d15-20020a92d5cf000000b002d1d9b0d5b1mr30500068ilq.252.1655127204260;
        Mon, 13 Jun 2022 06:33:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id s18-20020a92cb12000000b002d392d98afdsm3947121ilo.9.2022.06.13.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 06:33:23 -0700 (PDT)
Received: (nullmailer pid 3564133 invoked by uid 1000);
	Mon, 13 Jun 2022 13:33:17 -0000
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, kyrie wu <kyrie.wu@mediatek.com>, Tzung-Bi Shih <tzungbi@chromium.org>, linux-arm-kernel@lists.infradead.org, nicolas.dufresne@collabora.com, maoguang.meng@mediatek.com, linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, xia.jiang@mediatek.com, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>, wenst@chromium.org, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20220613032306.23237-2-irui.wang@mediatek.com>
References: <20220613032306.23237-1-irui.wang@mediatek.com> <20220613032306.23237-2-irui.wang@mediatek.com>
Subject: Re: [V9,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
Date: Mon, 13 Jun 2022 07:33:17 -0600
Message-Id: <1655127197.551988.3564132.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_063327_148047_586F8127 
X-CRM114-Status: GOOD (  13.09  )
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

On Mon, 13 Jun 2022 11:23:00 +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  .../media/mediatek,mt8195-jpegenc.yaml        | 155 ++++++++++++++++++
>  1 file changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml: patternProperties:^jpgenc@[0-9a-f]+$:properties:mediatek,hw-id:minItems: 0 is less than the minimum of 1
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml: patternProperties:^jpgenc@[0-9a-f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems', 'minItems' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml: patternProperties:^jpgenc@[0-9a-f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml: patternProperties:^jpgenc@[0-9a-f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml: ignoring, error in schema: patternProperties: ^jpgenc@[0-9a-f]+$: properties: mediatek,hw-id: minItems
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.example.dtb:0:0: /example-0/soc/jpgenc_master: failed to match any schema with compatible: ['mediatek,mt8195-jpgenc']
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.example.dtb:0:0: /example-0/soc/jpgenc_master/jpgenc@1a030000: failed to match any schema with compatible: ['mediatek,mt8195-jpgenc-hw']
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.example.dtb:0:0: /example-0/soc/jpgenc_master/jpgenc@1b030000: failed to match any schema with compatible: ['mediatek,mt8195-jpgenc-hw']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

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
