Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811EBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 01:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22G/iDb8lm92M6CLgYZA2ZVxMk8UnGHADnOz2v9uoo0=; b=3IyCimUIb7nc1h
	0Y89Q/YBwaOdZtpRVNRMja3+PPB8ktCXMnEJte67wprjrtrv7JZGVFrUTMhDIQILcD2vXNqr7jH0s
	RfuJba7YPKz2JQ7Kki9+DU7Dw/cqGQED9E29SZVMhH41wbtlsggvTYUTeMSpCVj5ETkqsN4ldVSqs
	boJxX1Sp64OKM4kjJyXPbU3dc6Wpw4mzQgbGgAZNJdAqdbsZvT/S+Tc/ygBxkIyvxM4L4wxJNY7bK
	hIJ2JrCwJsCKB4O95/M345/GcL/nnu5gurrcUmjbxWrP1782ZM8y5oW/TkszVQ0rA3cVMYQtAf0iX
	6WRVU1JXUj08NSnwl+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJQYr-00CwWR-AH; Mon, 14 Feb 2022 01:53:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJQYg-00CwUD-62; Mon, 14 Feb 2022 01:53:43 +0000
X-UUID: ad60976e14a64e099eb42d57cf1ed497-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8WBhPU5HQSKdcU3HPnUfhO2Un0UbV6um2gVYvOMIyzI=; 
 b=dlUjdqvvKUJPKJjH1SrwGmfNTsxcvvQ3hV/7mOdUliGR/MxkaQzyAN/P7NOYjdAWzs5Sg9xWI7QxaGDoV/mArEhB0T8Rn7AeyGWOzh3b0H9K/ikeZMLAQM8f7bf/d7cBTmrH9yK1gIpZuQpSrmn0sd12oh51VTELUu39GiBhXm0=;
X-UUID: ad60976e14a64e099eb42d57cf1ed497-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1651959931; Sun, 13 Feb 2022 18:53:38 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 17:53:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Feb 2022 09:53:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 09:53:34 +0800
Message-ID: <cf97cd654fc2549065cbfc78e9c45ecb06232059.camel@mediatek.com>
Subject: Re: [PATCH 5/6] dt-bindings: spi: support mediatek,need_ahb_clk flag
From: Leilk Liu <leilk.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 14 Feb 2022 09:53:35 +0800
In-Reply-To: <YgaV6w1ooAzTpYNz@robh.at.kernel.org>
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
 <20220209111938.16137-6-leilk.liu@mediatek.com>
 <YgaV6w1ooAzTpYNz@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_175342_252869_67F54300 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, 2022-02-11 at 10:59 -0600, Rob Herring wrote:
> On Wed, Feb 09, 2022 at 07:19:37PM +0800, Leilk Liu wrote:
> > this patch support mediatek,need_ahb_clk flag.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml         | 5
> > +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > index 241c0f5880d3..af12c1711182 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > @@ -71,6 +71,11 @@ properties:
> >        specify which pins group(ck/mi/mo/cs) spi controller used.
> >        This is an array.
> >  
> > +  mediatek,need_ahb_clk:
> 
> s/_/-/
> 
> But really, this should be implied by the compatible string or
> presence 
> of the clock in 'clocks'.
so I can only add "spi-hclk" in clocks' and don't need
"mediatek,need_ahb_clk" again? thanks

> 
> Rob
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
