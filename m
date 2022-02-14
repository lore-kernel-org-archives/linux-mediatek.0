Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971F9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 01:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5b2RkpdKy9HToTPvi5dYS1CTkDcTJdx2O5kANRlBS1g=; b=v+n16UysStH5+3
	2hZDwHYtTipd4tEooRp/I2wLIq5aDf4FUI/W5wY42F17zBjdXxSFx/czjiVkQiaAYPXWauWAK/SN8
	YW3eYWVw7S5j9PjJb/bZMYYAacjDltbSbAdDlRv4v2e2PKTmQCURZWuocNt0WfdLHp26bGzlpDvlp
	sKnVydkmPopkQVB9lzC6HCmUk9GJogooQtsKJtaKYWA0xOyQqVF1nU8MoW3SYhMkULnoamDqRrP1h
	O4hVG9sSnc2K4bZoRAsab8opx/NZzkI4W7z0jHiUechEMRxN8f+grMUP6PImcCIWreipZ6wxb9/XT
	T1l3/HlvVMlP0rFkw/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJQUd-00Cw0W-4t; Mon, 14 Feb 2022 01:49:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJQUR-00Cvys-Fg; Mon, 14 Feb 2022 01:49:20 +0000
X-UUID: 049b9184306d49a8bd7e686b155b35cb-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hTWQh6qiaRjbXbOslFGSuJeie2WRrbknuk23YiZsHic=; 
 b=tC/7DUNhRzXvjRWbr4WX2gVCoA10t8FIHuvAQggmp70bZLUV6wCPeunA63quDM0k73/LBeszhtMrqXYHDyv2/jx1elg7Z1ThKV3d8Rg67XVFis4ssFkow23SP06yfBnNBpfOw2l312DoyJqjDQfWhNeCiTFggCca1JPvPZVTZjU=;
X-UUID: 049b9184306d49a8bd7e686b155b35cb-20220213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 176858791; Sun, 13 Feb 2022 18:49:18 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 17:49:16 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 09:49:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 09:49:06 +0800
Message-ID: <16f9272489ee3cc15a4816825f3537eb5cece31a.camel@mediatek.com>
Subject: Re: [PATCH 1/6] dt-bindings: spi: Add compatible for Mediatek IPM
 IP with single mode
From: Leilk Liu <leilk.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 14 Feb 2022 09:49:06 +0800
In-Reply-To: <YgaVCmizWJfFMK5I@robh.at.kernel.org>
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
 <20220209111938.16137-2-leilk.liu@mediatek.com>
 <YgaVCmizWJfFMK5I@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_174919_549789_5EF386CA 
X-CRM114-Status: GOOD (  16.33  )
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

On Fri, 2022-02-11 at 10:55 -0600, Rob Herring wrote:
> On Wed, Feb 09, 2022 at 07:19:33PM +0800, Leilk Liu wrote:
> > This commit adds dt-binding documentation for
> > Mediatek SPI IPM IP with single mode.
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
> > index bfa44acb1bdd..0a2fc0404cb3 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > @@ -41,6 +41,7 @@ properties:
> >                - mediatek,mt8135-spi
> >                - mediatek,mt8173-spi
> >                - mediatek,mt8183-spi
> > +              - mediatek,ipm-spi-single
> 
> Is IPM an SoC? Compatible strings should be SoC specific or whatever 
> granularity could have a unique errata.
> 
IPM is an version of SPI ip, we use this IP with ICs now. So I define a
compatible strings "mediatek,ipm-spi-single", then I can reuse this
compatible strings with many ICs.

> Rob
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
