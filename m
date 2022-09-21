Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D1C54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 02:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktfKjkuCSlQ6+XBcD3iNIlUZc9IseljbIXo3FqlLINs=; b=1ZWRRsHe0HvfMN/hcbMr0I0cAI
	DaFmZ0zCB0jojar5YY5NYs7Ep9iJHgqn1K5nWktBXEj45cAzrL3wAfX7TVEEehtZ4xYwImZOw6Ydn
	8MKjfhI1ZUO6gJ6rlW0PlYsgYpBlUqTlLVxunLXS+2f84hC3n7PYEf9gQL8kuacbsfjVZUnyX68Ac
	OItf2SqMxaYOU0628oSysHbtvp1DZ7TDHi2sicChNNJdX7wwoYh25alhIKSCSwybFwAWsOBFcreMa
	uedRGg+w0gW6cPRkvm7dyCEIYhGRF6iJm74Ejb2JclK5YVl+cYx+8GTLDGMiBzkbMWuQxZJPD9ZiT
	b3qf8G3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oap81-008AeN-Jo; Wed, 21 Sep 2022 02:06:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oap7y-008AdC-4e; Wed, 21 Sep 2022 02:06:19 +0000
X-UUID: 777900c304c74683b265740cffb37a6e-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ktfKjkuCSlQ6+XBcD3iNIlUZc9IseljbIXo3FqlLINs=;
	b=ONomnynQNKYp/OtLRjDQSsdjunAulXc1ExepZW83eEyolFjTf/K2V4hU9q+NGLNwuri/TnbdNG4N7UITHO9xQ0jAi5EAWM4rEpM46EguIoWOcOXrFQDT0rfE8KMxckJJc0xDRl3ihTdZCjWQSkdl27exgzBUw3VjdEsdIrJ6j2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:77d388da-a6f7-4ef9-ac1c-62571ba23f51,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:ff31585e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 777900c304c74683b265740cffb37a6e-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 402087868; Tue, 20 Sep 2022 19:05:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 09:14:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 09:14:45 +0800
Message-ID: <63ca556b81bc2874d3f0a5b87ee0e2f7a4fdeb18.camel@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: mediatek-dwmac: add support for
 mt8188
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 21 Sep 2022 09:14:44 +0800
In-Reply-To: <3ed55b0d-6c14-79a1-b4c1-5764c667d195@collabora.com>
References: <20220920083617.4177-1-jianguo.zhang@mediatek.com>
	 <20220920083617.4177-2-jianguo.zhang@mediatek.com>
	 <3ed55b0d-6c14-79a1-b4c1-5764c667d195@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_190618_222897_20F0120A 
X-CRM114-Status: GOOD (  21.03  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear AngeloGioacchino

	Thanks for your comment.

On Tue, 2022-09-20 at 15:22 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/09/22 10:36, Jianguo Zhang ha scritto:
> > Add binding document for the ethernet on mt8188
> > 
> > Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> > ---
> >   .../devicetree/bindings/net/mediatek-dwmac.yaml        | 10
> > ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > index 61b2fb9e141b..eaf7e8d53432 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -20,6 +20,7 @@ select:
> >           enum:
> >             - mediatek,mt2712-gmac
> 
> Please keep the list ordered by name. MT8188 goes before 8195.
> 
We will adjust the order in next version patches.

> >             - mediatek,mt8195-gmac
> > +          - mediatek,mt8188-gmac
> >     required:
> >       - compatible
> >   
> > @@ -37,6 +38,11 @@ properties:
> >             - enum:
> >                 - mediatek,mt8195-gmac
> >             - const: snps,dwmac-5.10a
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8188-gmac
> > +          - const: mediatek,mt8195-gmac
> > +          - const: snps,dwmac-5.10a
> >   
> >     clocks:
> >       minItems: 5
> > @@ -74,7 +80,7 @@ properties:
> >         or will round down. Range 0~31*170.
> >         For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> >         or will round down. Range 0~31*550.
> > -      For MT8195 RGMII/RMII/MII interface, Allowed value need to
> > be a multiple of 290,
> > +      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value
> > need to be a multiple of 290,
> 
> For MT8188/MT8195
> 
We will adjust the order in next version patches.

> >         or will round down. Range 0~31*290.
> >   
> >     mediatek,rx-delay-ps:
> > @@ -84,7 +90,7 @@ properties:
> >         or will round down. Range 0~31*170.
> >         For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> >         or will round down. Range 0~31*550.
> > -      For MT8195 RGMII/RMII/MII interface, Allowed value need to
> > be a multiple
> > +      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value
> > need to be a multiple
> 
> For MT8188/MT8195
> 
We will adjust the order in next version patches.

> >         of 290, or will round down. Range 0~31*290.
> >   
> >     mediatek,rmii-rxc:
> 
> 
BRS
Jianguo


