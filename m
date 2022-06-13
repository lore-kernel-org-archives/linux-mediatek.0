Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66186C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mixcz47BCHqaUDTVRHcgot9Qq8G5XmuosUaQI3Y6ods=; b=aIvcxQtnX7vPVX
	4i0LzdDkVfW1aZ2XsSx4du7+U6c1Vtlnglv7F8ZRGV6UhCfeQkyYIdqsPgdsvjYaK/5+hdKg3m6/h
	m/JOFmGXumzE9L4B4dNseAfEV4Z9TheDe+bq7acD3GVZEc88r40HRa0xln7jAKYQ+6e3v0sz3Teyf
	7IX0KnJGhf64EzzT+ZXCpbwk9F/h+a+FICm5vxwkVbBAh/0fshWsvxqf8atUB0kxVoD5nyjWxfPT9
	ZmX5Jqir9VJOLZzGjkNtuoZprGr/uSDij21wgFhZPovFslqHezEMQ5wWGce1uV+D9fP5uDajY23p/
	IwaK6tpoJUI+n+Wr3fIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kD1-003rio-MJ; Mon, 13 Jun 2022 13:34:23 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kC9-003r4t-3p; Mon, 13 Jun 2022 13:33:31 +0000
Received: by mail-io1-f54.google.com with SMTP id r5so6073573iod.5;
        Mon, 13 Jun 2022 06:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=vyoJ85txEp3wcFTSeMW6nKhdwOlY3JedEaCIumOgJX0=;
        b=jZw0Lcgd1e22Z24I+btZvitOBTGQMgyz7vLdxNEEo4cQRLLRKRMFET987Ytt04INgZ
         6Z+nLgyu1cSjh2RdRGSLdj6BXbw4WNU7zUYsi7OaM8G7loFAEYe7veW42keHq2AHSudl
         1To8IQ5As48h6IorNRaG6BbqDCLlWXw60qD6oniP8LaqWObcvL8kIQSUN8/PEbslwKfU
         qDeDse48NbL7hwCqhnWmiXf9eA721HF82NLQKKBqBHuy9BQ52pwsp2nKVh6izrLSafAx
         pl7LdLFmP/6sD2/QmXgNUXcNoqYSCxnSzBBXHzoJS7GiX5Qu3gUfXricj7m4FzO3z5sx
         kTWw==
X-Gm-Message-State: AOAM532ZeVnYM1oyg+vkhc/ikvOzw48lO6/8/dQDxwcmRPEfi2HcLd6A
	EQnKUfknLv/MP965NWdBpw==
X-Google-Smtp-Source: ABdhPJwOoiPPMXAQ3HpzpzSM0BQ0OOEN1wDLDCLjfQX27FZnwuzSrw5lgyXQOpUCBVuEPG4qAKKUYw==
X-Received: by 2002:a05:6602:2cd1:b0:66a:6f0:5867 with SMTP id j17-20020a0566022cd100b0066a06f05867mr540059iow.143.1655127199851;
        Mon, 13 Jun 2022 06:33:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b14-20020a92c84e000000b002d1df239846sm3901175ilq.79.2022.06.13.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 06:33:19 -0700 (PDT)
Received: (nullmailer pid 3564130 invoked by uid 1000);
	Mon, 13 Jun 2022 13:33:17 -0000
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Tomasz Figa <tfiga@chromium.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, wenst@chromium.org, maoguang.meng@mediatek.com, xia.jiang@mediatek.com, srv_heupstream@mediatek.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-mediatek@lists.infradead.org, kyrie wu <kyrie.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, nicolas.dufresne@collabora.com, angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org
In-Reply-To: <20220613032232.23187-2-irui.wang@mediatek.com>
References: <20220613032232.23187-1-irui.wang@mediatek.com> <20220613032232.23187-2-irui.wang@mediatek.com>
Subject: Re: [V3,1/8] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
Date: Mon, 13 Jun 2022 07:33:17 -0600
Message-Id: <1655127197.543108.3564129.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_063329_226494_F5FD656F 
X-CRM114-Status: GOOD (  13.25  )
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

On Mon, 13 Jun 2022 11:22:25 +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgdec compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 177 ++++++++++++++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml: patternProperties:^jpgdec@[0-9a-f]+$:properties:mediatek,hw-id:minItems: 0 is less than the minimum of 1
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml: patternProperties:^jpgdec@[0-9a-f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems', 'minItems' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml: patternProperties:^jpgdec@[0-9a-f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml: patternProperties:^jpgdec@[0-9a-f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml: ignoring, error in schema: patternProperties: ^jpgdec@[0-9a-f]+$: properties: mediatek,hw-id: minItems
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.example.dtb:0:0: /example-0/soc/jpgdec_master: failed to match any schema with compatible: ['mediatek,mt8195-jpgdec']
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.example.dtb:0:0: /example-0/soc/jpgdec_master/jpgdec@1a040000: failed to match any schema with compatible: ['mediatek,mt8195-jpgdec-hw']
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.example.dtb:0:0: /example-0/soc/jpgdec_master/jpgdec@1a050000: failed to match any schema with compatible: ['mediatek,mt8195-jpgdec-hw']
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.example.dtb:0:0: /example-0/soc/jpgdec_master/jpgdec@1b040000: failed to match any schema with compatible: ['mediatek,mt8195-jpgdec-hw']

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
