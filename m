Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUsBVQwqVZU0wBz9L4owR9FALDjfRAZmSIluNFZR/S0=; b=3RuO8R1dFO+HuG
	kSFV6gHNC7HYIR07BfOU14IEsNf9MRwRrGdHRcWyxrUd4qMM3PgNRXnaOH4dR5j0EKSrkr7PkVXQH
	B5XqVidp6HxAbmZRNuMSMonHOPc947dZ+w93sO1nBU9PewOMvsBmpTzT6X7OEEP6xawpeAKNOXHZM
	sQwW+gc0hDvUO8ag1gX4eVgNJxGIBggfHckc8c3wj/x5yTHfz1sKOQdwT+Np2dWFt3knc8fKDa2BW
	200D/gGhoklDwgcPPyYBNfhy4dkuCrOgxcse002S3OB8YQG9mdzHeQqNGwZcnjMmQ3Qm96dAoKC6O
	jplsIxgp4HIRMX3/wjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwo41-00AYXi-67; Mon, 13 Dec 2021 16:20:33 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwo3m-00AYSI-Sv; Mon, 13 Dec 2021 16:20:20 +0000
Received: by mail-oi1-f173.google.com with SMTP id s139so23710607oie.13;
 Mon, 13 Dec 2021 08:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=l6ZLi0PGoBXQBBSQe+jVt6PyRuLOnFoXjb9xaIaFyd8=;
 b=qB+OY9YJx/3TLTE2a78xqTZp9dny/WKxkhbMqwahR0Xtnol/WQ6QUDFeCHeAjmi7DT
 aMeOeWHiQPOFxUv+PBXvYjqZdx3vUcg8Q4iGxPe1n9JtTiAMflkHwRjii3ZZFtotdsW9
 qdSu7OYhfVQY3jUf61KcbkVQJp4B2M9//eWhw3aGFz3H1/ZnNAPsfdXfP5J/Y4fovPD0
 qxj7MoWVLm6xl9Bbi+QNGOXWA4JWWoTshIhxHQyMrE1MiyMucHr+v0bC33i6USw9iP0f
 HQY5Bi4XDhIuS75mzZI650KMjFJS/m7dU5u7qvWPZ8iaCy4IEOhmi+lxf2xkimBANveH
 4MyQ==
X-Gm-Message-State: AOAM532rShUdnUAesWedVyOO2hWzL0PX2/9axpqBVHqIDnAFNSfdcwWt
 AmaX3polV2t2t9oUxrC9Zg==
X-Google-Smtp-Source: ABdhPJxD5WHxXNNHT+o8W64P92PeYWFg6nzCIiFA7fdbpNK3L3FRy93EXTKDfdFeGxasBHOlryCJpQ==
X-Received: by 2002:a05:6808:2014:: with SMTP id
 q20mr28900955oiw.9.1639412416725; 
 Mon, 13 Dec 2021 08:20:16 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e21sm2219792ote.72.2021.12.13.08.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 08:20:16 -0800 (PST)
Received: (nullmailer pid 1139463 invoked by uid 1000);
 Mon, 13 Dec 2021 16:20:15 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20211213072355.4079568-4-hsinyi@chromium.org>
References: <20211213072355.4079568-1-hsinyi@chromium.org>
 <20211213072355.4079568-4-hsinyi@chromium.org>
Subject: Re: [PATCH 4/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Date: Mon, 13 Dec 2021 10:20:15 -0600
Message-Id: <1639412415.371102.1139462.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_082018_966797_3794ACEC 
X-CRM114-Status: GOOD (  11.05  )
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

On Mon, 13 Dec 2021 15:23:55 +0800, Hsin-Yi Wang wrote:
> Makomo is known as Lenovo 100e Gen 2 Chromebook.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../devicetree/bindings/arm/mediatek.yaml          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek.yaml: properties:compatible:oneOf:31:items: 'oneOf' conditional failed, one must be fixed:
	[{'enum': [{'const': 'google,makomo-rev4-sku0'}, {'const': 'google,makomo-rev5-sku0'}, {'const': 'google,makomo'}, {'const': 'mediatek,mt8183'}]}] is not of type 'object'
	{'const': 'google,makomo-rev4-sku0'} is not of type 'string'
	{'const': 'google,makomo-rev5-sku0'} is not of type 'string'
	{'const': 'google,makomo'} is not of type 'string'
	{'const': 'mediatek,mt8183'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek.yaml: properties:compatible:oneOf:32:items: 'oneOf' conditional failed, one must be fixed:
	[{'enum': [{'const': 'google,makomo-rev4-sku1'}, {'const': 'google,makomo-rev5-sku1'}, {'const': 'google,makomo'}, {'const': 'mediatek,mt8183'}]}] is not of type 'object'
	{'const': 'google,makomo-rev4-sku1'} is not of type 'string'
	{'const': 'google,makomo-rev5-sku1'} is not of type 'string'
	{'const': 'google,makomo'} is not of type 'string'
	{'const': 'mediatek,mt8183'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek.yaml: ignoring, error in schema: properties: compatible: oneOf: 31: items
warning: no schema found in file: ./Documentation/devicetree/bindings/arm/mediatek.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1567163

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
