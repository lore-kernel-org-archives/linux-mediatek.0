Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84569C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 01:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GahCDG1Jh6F+H64E+xZIzEnY7cind/JVwIzcsO5rVQ=; b=UO6Ma3X1FeZyvs
	CGFSgPOB7uiVJAL0wt0jedhVBJKIMgMxcXdwXh3pxC8MxS3/MjGFU/0m8CeJFvJARjBbWyuJHN0Vz
	wOIcqhWuuXrVY/RtdqO9ChTc1V9eSudysJkBLl1D4sHaVLzkQFz+c50wpUUWp4jfZCo1e3Wj1eTQP
	OPaqhG1cL8w/0aprOS+czmes2FSQuwJKcLGZckKva/IQDCuNXsKB9B/Gm+GvAiOkAg4HzcMQY+pAa
	+KDb/fQqfEK69HuoyvvkxoL4lJzTLhE3sjAcYaO1AKDDoUi74pnHfvvel6eMtEsZzFgw3ZO2Exl0L
	4BaGNGlJ74vzG5qy7RCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRP17-002NBy-Ko; Tue, 08 Mar 2022 01:52:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRP0v-002N9V-09; Tue, 08 Mar 2022 01:51:50 +0000
X-UUID: 001c54a367b24e0a875ec6fb1d74137f-20220307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UEx22GynCCxut7puztAW+3Z2X6ycbV8EnxlqwxRD56o=; 
 b=kJgC2slXCW8BPEg247eqgJQ+Ic0GxCEaxQrP0nTe3kWQ+qwpzbmF/vMlk7q3yQOP+69qdlLClV/+fnY3uXJxqYXzeV/qCCBGNBaMnHdzdIm0ZHwQZUH1AdkCoBBZcNiMKu+WSrLhtxcbcJyNa6ITOF8vsPjHNaTzJUQswOkI430=;
X-UUID: 001c54a367b24e0a875ec6fb1d74137f-20220307
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1193800484; Mon, 07 Mar 2022 18:51:40 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 17:51:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Mar 2022 09:51:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 09:51:37 +0800
Message-ID: <7ae469a94ad51be85f0731c4c42088d65b241581.camel@mediatek.com>
Subject: Re: [PATCH V3 2/7] dt-bindings: spi: Add compatible for MT7986 with
 single mode
From: Leilk Liu <leilk.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Mark Brown" <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Rob
 Herring" <robh@kernel.org>
Date: Tue, 8 Mar 2022 09:51:36 +0800
In-Reply-To: <b3950b6b-bfbe-da80-90cc-1a836958f931@collabora.com>
References: <20220307065230.12655-1-leilk.liu@mediatek.com>
 <20220307065230.12655-3-leilk.liu@mediatek.com>
 <b3950b6b-bfbe-da80-90cc-1a836958f931@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_175149_075184_657DEB98 
X-CRM114-Status: GOOD (  23.94  )
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

On Mon, 2022-03-07 at 11:32 +0100, AngeloGioacchino Del Regno wrote:
> Il 07/03/22 07:52, Leilk Liu ha scritto:
> > This patch adds dt-binding documentation for MT7986 with single
> > mode.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >   Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml |
> > 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > index bfa44acb1bdd..48024b98408a 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > @@ -41,6 +41,7 @@ properties:
> >                 - mediatek,mt8135-spi
> >                 - mediatek,mt8173-spi
> >                 - mediatek,mt8183-spi
> > +              - mediatek,mt7986-spi-single
> >   
> >     reg:
> >       maxItems: 1
> 
> I think that the best way to do this is to better organize the
> compatibles
> per-hardware, here... or the compatibles list will eventually grow
> out of
> control for little reason.
> 
> Since "IPM" is a new SPI controller IP, I would expect more and more
> MediaTek
> SoCs using it in the future, so here's my proposal:
Yes, we plan to use this IP with new ICs.

> 
> - Add a generic (const) compatible "mediatek,spi-ipm" to describe the
> hardware
> - Add an enumeration with "mediatek,mt7986-spi-ipm" as the only
> member, as to
>    prepare this binding for the future.
> - Single and quad mode can be expressed with generic SPI bindings!
> 
> Specifically, you can express that with "spi-rx-bus-width" for
> SPI_RX_{....}
> and "spi-tx-bus-width" for SPI_TX_{....}, so you don't need different
> compatibles
> for "mediatek,mt7986-spi-single" and "mediatek,mt7896-spi-quad".
> 
> Fast example:
> 
> spi@12345678 {
>      compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
>      reg = <....>
>      /* Quad mode */
>      spi-rx-bus-width = <4>;
>      spi-tx-bus-width = <4>;
> 
>      .... etc ....
> }
> 
OK, thanks for your advice.

> Regards,
> Angelo
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
