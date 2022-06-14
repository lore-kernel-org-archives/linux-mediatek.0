Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ABEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2gtedBviX3T1YdOvuiqq7sKE2LnDhjnr08cFxfp27k=; b=dHfw2V/+eVBQET
	4CtUVvniEfHelrBZgBv6oC05hbRn04E2FT7aIHr12YGvCWntw7Y0OIxjHW51u+QPlM8IRMFVwz/YZ
	rXhaBUSz4CQzPGGuWKIxDr/Q9GAjTK2zeqPiTtVyabqVdTNmeumyplHyT+rSGLV1QSIxIjgOeE27y
	KfyQok9ScXWS0Rl664Koh3vRWUUyY2zZbvBaXDCXeWqjGwwRlYC3nC7iT2FhvnS+VZf3K3XbItCXn
	XW7PvK2Fg11dHqZHVaJfxq/X0lE+9lGXt+v9A0EBME4mNCWbdZAq/sYh7YoSIf4gF8osrEvPz/Leb
	/LO4WvK0tdGyxKh5qcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15Ur-009QvP-At; Tue, 14 Jun 2022 12:18:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15TY-009QEj-RR; Tue, 14 Jun 2022 12:16:55 +0000
X-UUID: c4497e0d59d741329eedb1e70594a856-20220614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=L+MTDsUbaTA4uwKnLgJeHifV563O5P03kwoD0fUmc9M=;
	b=sqTRsSUhfWiZbkXAZRN2QZzZlWM5UBXIF71G7rEZ84yxCJqzB+Ogcb5Q+JnkQKC85Y55kKB2wZDkgIxeclaGn0uj3QRqib6p2RN4lpytM2XHX73JJ1xREzSD7hMmVEO7LBPJIjAa9WpayZN9PTTVgewnLRhKJxE8lfHxe97QavY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d8e86885-4288-4caf-9365-92d5c5b2fa47,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:b14ad71,CLOUDID:4d289207-b57a-4a25-a071-bc7b4972bc68,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c4497e0d59d741329eedb1e70594a856-20220614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 357538166; Tue, 14 Jun 2022 05:16:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 05:06:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 14 Jun 2022 20:06:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 20:06:35 +0800
Message-ID: <85124ade3a3d06b8de90d3abcb671b85b1d2aa18.camel@mediatek.com>
Subject: Re: [V9,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
 compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Irui Wang <irui.wang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tzung-Bi Shih
	<tzungbi@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
	<nicolas.dufresne@collabora.com>, <maoguang.meng@mediatek.com>,
	<linux-media@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<xia.jiang@mediatek.com>, <srv_heupstream@mediatek.com>,
	<linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, <wenst@chromium.org>, Rob Herring
	<robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 14 Jun 2022 20:06:34 +0800
In-Reply-To: <1655127197.551988.3564132.nullmailer@robh.at.kernel.org>
References: <20220613032306.23237-1-irui.wang@mediatek.com>
	 <20220613032306.23237-2-irui.wang@mediatek.com>
	 <1655127197.551988.3564132.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_051652_933024_C7B2BCFD 
X-CRM114-Status: GOOD (  22.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-06-13 at 07:33 -0600, Rob Herring wrote:
> On Mon, 13 Jun 2022 11:23:00 +0800, Irui Wang wrote:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > Add mediatek,mt8195-jpgenc compatible to binding document.
> > 
> > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > ---
> >  .../media/mediatek,mt8195-jpegenc.yaml        | 155
> > ++++++++++++++++++
> >  1 file changed, 155 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/media/mediatek,mt8195-
> jpegenc.yaml: patternProperties:^jpgenc@[0-9a-
> f]+$:properties:mediatek,hw-id:minItems: 0 is less than the minimum
> of 1
> 	from schema $id: 
> http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/media/mediatek,mt8195-
> jpegenc.yaml: patternProperties:^jpgenc@[0-9a-
> f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must
> be fixed:
> 	'type' is a required property
> 		hint: A vendor boolean property can use "type: boolean"
> 	Additional properties are not allowed ('maxItems', 'minItems'
> were unexpected)
> 		hint: A vendor boolean property can use "type: boolean"
> 	/builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/media/mediatek,mt8195-
> jpegenc.yaml: patternProperties:^jpgenc@[0-9a-
> f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must
> be fixed:
> 		'enum' is a required property
> 		'const' is a required property
> 		hint: A vendor string property with exact values has an
> implicit type
> 		from schema $id: 
> http://devicetree.org/meta-schemas/vendor-props.yaml#
> 	/builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/media/mediatek,mt8195-
> jpegenc.yaml: patternProperties:^jpgenc@[0-9a-
> f]+$:properties:mediatek,hw-id: 'oneOf' conditional failed, one must
> be fixed:
> 		'$ref' is a required property
> 		'allOf' is a required property
> 		hint: A vendor property needs a $ref to types.yaml
> 		from schema $id: 
> http://devicetree.org/meta-schemas/vendor-props.yaml#
> 	hint: Vendor specific properties must have a type and
> description unless they have a defined, common suffix.
> 	from schema $id: 
> http://devicetree.org/meta-schemas/vendor-props.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/media/mediatek,mt8195-
> jpegenc.yaml: ignoring, error in schema: patternProperties:
> ^jpgenc@[0-9a-f]+$: properties: mediatek,hw-id: minItems
> Documentation/devicetree/bindings/media/mediatek,mt8195-
> jpegenc.example.dtb:0:0: /example-0/soc/jpgenc_master: failed to
> match any schema with compatible: ['mediatek,mt8195-jpgenc']
> Documentation/devicetree/bindings/media/mediatek,mt8195-
> jpegenc.example.dtb:0:0: /example-0/soc/jpgenc_master/jpgenc@1a030000
> : failed to match any schema with compatible: ['mediatek,mt8195-
> jpgenc-hw']
> Documentation/devicetree/bindings/media/mediatek,mt8195-
> jpegenc.example.dtb:0:0: /example-0/soc/jpgenc_master/jpgenc@1b030000
> : failed to match any schema with compatible: ['mediatek,mt8195-
> jpgenc-hw']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
Dear Rob,

I have took your suggestions and fixed the above errors.
I will resend all patches, please test again.

Thanks.

sincerely,
kyrie.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
