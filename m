Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C740C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Feb 2022 03:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUZ0FVFtoX+qeTRGrFZztj7cBdUV2o3G4PdRJ3Voxj4=; b=W3hSIL1mkp2hpG
	2rqxrjYNg+VAV/OzJRXhQDCsqrEDPDvQzmRJU7hQA80W1wfp0Y8TJyadAZAR/h5ZI3IyU0aq7gayK
	7Gq+X02nZvKiCS9z9W2IF+XzI9y6vhkjS9EaJ7DIJeu1hAiX3aQbFx1q1aZpyevNbrLuq3u+8SMkK
	6HsJrzommWZXB44wOl/cJl7TJuaMNQ04bKBHq83p/NU+jmL4JYDLKBjwDCvHVxmPaqlKcqGioiYpv
	lbHIXHkeW5IK0MqaBorjQTIm91d6WUrpv8+LbRhuo6DruDPCC0Lsu4rpMTYTZvHhLWSjTd5G9GYRK
	DxSUhdry2XkcYKwGnZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNnhg-007Q9L-ET; Sat, 26 Feb 2022 03:25:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNnhT-007Q6n-6c; Sat, 26 Feb 2022 03:24:52 +0000
X-UUID: 1ff6cf3c1ae64ec3b7e1edbfbd0e5999-20220225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=T4YSrnsm23bk9ZhOlXWFOkDGFXFIs7ZY7yu/RPEFY3k=; 
 b=CukvSZBZMQnUSKdsf2TPOQ66fRtpEv1l6tY3OwV6MGwlckAa82YkX3ktlMj/EdySJKo4vECwksGm0sWblHkikRkrPpvpqc/QJkQk9kjQDHggqgX9+gvWgeaALLfE/dXtDAJTlDHFMAy5jZMk+l6OEjYve26O4Yfb2ZQg1Vb7xbY=;
X-UUID: 1ff6cf3c1ae64ec3b7e1edbfbd0e5999-20220225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 127000309; Fri, 25 Feb 2022 20:24:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 19:24:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 26 Feb 2022 11:24:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 26 Feb 2022 11:24:46 +0800
Message-ID: <55a65e5aa412f101e02c81ddb5fa38c128743db2.camel@mediatek.com>
Subject: Re: [PATCH V2 3/6] dt-bindings: spi: Add compatible for Mediatek
 IPM IP with quad mode
From: Leilk Liu <leilk.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Sat, 26 Feb 2022 11:24:46 +0800
In-Reply-To: <YhknmEtjpN7Lmoru@robh.at.kernel.org>
References: <20220221040717.3729-1-leilk.liu@mediatek.com>
 <20220221040717.3729-4-leilk.liu@mediatek.com>
 <YhknmEtjpN7Lmoru@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_192451_275753_F8C04136 
X-CRM114-Status: GOOD (  19.06  )
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

On Fri, 2022-02-25 at 13:01 -0600, Rob Herring wrote:
> On Mon, Feb 21, 2022 at 12:07:14PM +0800, Leilk Liu wrote:
> > This patch adds dt-binding documentation for Mediatek SPI IPM IP
> > with
> > quad mode.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1
> > +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > index 0a2fc0404cb3..241c0f5880d3 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > @@ -42,6 +42,7 @@ properties:
> >                - mediatek,mt8173-spi
> >                - mediatek,mt8183-spi
> >                - mediatek,ipm-spi-single
> > +              - mediatek,ipm-spi-quad
> 
> Can't you use the existing width properties to distinguish? Or is
> the 
> programming not a superset?
> 
"mediatek,ipm-spi-quad" include the feature of "mediatek,ipm-spi-
single".

> Is 'ipm' an SoC? If not, these need to be SoC specific.
> 
IPM is an version of SPI ip, we use this IP with ICs now.
So I define a compatible strings "mediatek,ipm-spi-xxx", then I can
reuse this strings with many ICs.
Currently, we plan to upstream MT7986 IC, this IC has two spi
controller ports, one support single mode only, the other support
single & quad mode both.
for example:
spi0 {
  ...
  compatible = "mediatek,ipm-spi-single";
  ...
}

spi1 {
  ...
  compatible = "mediatek,ipm-spi-quad";
  ...
}


> Rob
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
