Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 01:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xExktbtCGIR2EfAY1OPuKD/LQZLHJQ36rsbeC8KWK+c=; b=NpPbfDRoOTSQvZ
	3yZnG5CvclOzeK2agJJOFo21rc99sv0dIaNA4miq9Nc7bVIC1kNbmvR2SNcJnW8H3iHCWpn45nucX
	PeHFUwqeC4Hj8/pdVizKysR7wlagjPIovNg7Q514rkhNzLjlsPRe7uwcyaKPL0m3/GZVd8RoKDwLZ
	KIxdsbM5gCtmTwjwfrY2M5Uu1viUzky7s/mXnvLaBVXDG8bQKHnN3N0voFajb85leWvbgre1D+KGN
	0zNi/nxcvozGAUJU290R3g1BaHM3yr1N0eLQmkl5iKTCXNimRlKIIICBWFUFQ+cnZriNahqc1y8yz
	dZQLXhdp0lktnwMbjAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJQPT-00CvVM-QT; Mon, 14 Feb 2022 01:44:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJQPI-00CvSc-5W; Mon, 14 Feb 2022 01:44:01 +0000
X-UUID: 0a1ba0a180fe42eb89a641bca34488d1-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PH5ErV6/m7eJrChUaLPcPEX/q/trKclIY0ToUVfFBm4=; 
 b=eL2ziMQoJc2Rj8B9RjUHZlt5DDnY9NCbfRJgQZBjkAJ7gkussSwYUj23IMuKQ9x/3BsMZeiqDSLKjrtQlNxzEo912gncoRGTJHDQk9W84iGeLoZT/UCzOqESX8RKKyrz5YTKLNxUQsqXrjo0IVrKZBIhOo/nU2AyI/SzKY78D4s=;
X-UUID: 0a1ba0a180fe42eb89a641bca34488d1-20220213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 668719092; Sun, 13 Feb 2022 18:43:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 17:43:54 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 09:43:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 09:43:50 +0800
Message-ID: <8039ba062ec9408c773292f21d5604f6ddb86d1b.camel@mediatek.com>
Subject: Re: [PATCH 3/6] dt-bindings: spi: Add compatible for Mediatek IPM
 IP with quad mode
From: Leilk Liu <leilk.liu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Mark Brown
 <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 14 Feb 2022 09:43:50 +0800
In-Reply-To: <bed10d2e-a3eb-ddcb-8b84-9b5ba7f138f1@canonical.com>
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
 <20220209111938.16137-4-leilk.liu@mediatek.com>
 <bed10d2e-a3eb-ddcb-8b84-9b5ba7f138f1@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_174400_229109_103AF9E5 
X-CRM114-Status: GOOD (  12.65  )
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

On Fri, 2022-02-11 at 12:44 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2022 12:19, Leilk Liu wrote:
> > This commit adds dt-binding documentation for
> > Mediatek SPI IPM IP with quad mode.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1
> > +
> >  1 file changed, 1 insertion(+)
> 
> Same comments as for patch 1 apply.
> 
OK, I'll fix it.thanks
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
