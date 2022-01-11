Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7F0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 01:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bw7fgUKMHWEv4u32HKkV81B/UVO5AXc874tp7PmkVqs=; b=PsYdVvLKIvMR/g
	W4fRvi0LBjD/0irPpbtOEYIZxJLRr9j9QtWgKUBrRpUlAeGtt5yPMPx911jmGeWm/yNrKpK72NwHr
	N6wKH+JA00yzw6cG0ORqeYU91vMbU1PSLlonpwLp+Z9L8LW9/1CLIVGio6mT6Rzs5KLkc+OOPlF2j
	DzmMDAJ77jkxY6dGgWsHZrzNmbuyTiXz9Wo2VLFE5MGlqr60gFebiSjbtnW76N3JMW1ZeXnEyt7h+
	Mb8ZPzgI+98OvcHiFtsk76qiEKAy58LFYMNSyh3oSpwBrMm9w8mCdTMAsMuDb8xtc4WJF9B5H5LRG
	UER1DPzPit1yyEnd1qXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n76HZ-00EFpi-T7; Tue, 11 Jan 2022 01:49:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n76HW-00EFoD-B9; Tue, 11 Jan 2022 01:49:04 +0000
X-UUID: d9cd3b465ddb4f4db20dce5a799066f4-20220110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=A9dZHK7o6uDJ+ezxdVvtTqNKB5+FlQTaCobZopYWpSw=; 
 b=BHnp9YSUvVY9f0eXqB9T7ZyffC2rJ5QvJ5pin4qJwbH4ntS9hIXUg1Ifq2HVj5TIO4pupNdKfNbeqQIq58b/hQ9+oRz1+0mafUIsHBlpaJ8I++55laKRPB0SrAC0/L0xCbu3QAcmDnKc/KkqS754FWcgFax/dVq5Ctxs9Mu1DSs=;
X-UUID: d9cd3b465ddb4f4db20dce5a799066f4-20220110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 541465221; Mon, 10 Jan 2022 18:48:59 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 17:48:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 11 Jan 2022 09:48:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Jan 2022 09:48:49 +0800
Message-ID: <f9ee59dab63c33001b196e56fd55aa890948ddcd.camel@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: Convert spi-mt65xx &
 spi-slave-mt27xx to json-schema
From: Leilk Liu <leilk.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Brown <broonie@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-mediatek@lists.infradead.org>
Date: Tue, 11 Jan 2022 09:48:49 +0800
In-Reply-To: <1641833339.690847.1067453.nullmailer@robh.at.kernel.org>
References: <20220110053744.30323-1-leilk.liu@mediatek.com>
 <1641833339.690847.1067453.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_174902_433877_96B15F7D 
X-CRM114-Status: GOOD (  20.30  )
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

On Mon, 2022-01-10 at 10:48 -0600, Rob Herring wrote:
> On Mon, 10 Jan 2022 13:37:43 +0800, Leilk Liu wrote:
> > Convert Mediatek ARM SOC's SPI Master & Slave controller binding
> > to json-schema format.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  .../bindings/spi/mediatek,spi-mt65xx.yaml     | 96
> > +++++++++++++++++++
> >  .../spi/mediatek,spi-slave-mt27xx.yaml        | 69 +++++++++++++
> >  .../devicetree/bindings/spi/spi-mt65xx.txt    | 68 -------------
> >  .../bindings/spi/spi-slave-mt27xx.txt         | 33 -------
> >  4 files changed, 165 insertions(+), 101 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/spi/mediatek,spi-slave-
> > mt27xx.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/spi/spi-
> > mt65xx.txt
> >  delete mode 100644 Documentation/devicetree/bindings/spi/spi-
> > slave-mt27xx.txt
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
> review/Documentation/devicetree/bindings/spi/mediatek,spi-slave-
> mt27xx.yaml: properties:compatible:oneOf: [{'const':
> 'mediatek,mt2712-spi-slave'}, {'const': 'mediatek,mt8195-spi-slave'}] 
> should not be valid under {'items': {'propertyNames': {'const':
> 'const'}, 'required': ['const']}}
> 	hint: Use 'enum' rather than 'oneOf' + 'const' entries
> 	from schema $id: 
> http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/spi/mediatek,spi-slave-
> mt27xx.yaml: ignoring, error in schema: properties: compatible: oneOf
> Documentation/devicetree/bindings/spi/mediatek,spi-slave-
> mt27xx.example.dt.yaml:0:0: /example-0/spi@10013000: failed to match
> any schema with compatible: ['mediatek,mt2712-spi-slave']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1577767
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

OK, I'll re-send it, thanks

> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
