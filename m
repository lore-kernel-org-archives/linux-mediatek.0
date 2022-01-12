Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 06:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYeltUhRbmnVdOYbw/bovmR/421vlKkNdB5jB3yjTks=; b=WR1yNMOx+5YZhk
	Dzap/QfSNOKd1jxX5TGKXPMPNzckd9baroafSz/vMl12+jvES2zgRVUJbevLZmhQ3WAMktYUXDrS0
	Ay+AgxsJMC+7fW2vhTy508EYXoWB2DnQT8HOjgAbLRZIQpOzJp/aJDpUOQ448g4tIYrXRT9kXB3Wr
	s2VV9locnih7CYW6CuGHUNq9a/QQgIpnyY/lpyAHWnw1AQ+9hoccl4dzPxuzWrzM/GM+Id7md74Vt
	SPfaGr5pqBdIRzlxhjEs3C0TfJbgHb/uOCKbry5E1raZIUaIbpWHD/S0E9mfCybVuk0Zvag1Zuha5
	x/+F5ckMo459B6uib3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Wr6-001FPl-1D; Wed, 12 Jan 2022 06:11:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Wr2-001FOv-OI
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 06:11:30 +0000
X-UUID: f982406af1ed43fe8e5d07c95dbb9791-20220111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=D+/1iy9GtoXCHqf2waJqMfnsHfbcY2gotPFr72UrrLM=; 
 b=DQ3raHg6m4SSWCrBtTlvoJBRUFv7NvyHw+VHKANTzpybWaGMS0MrRJMXYQJ9w+EyFQKIz64y5U/vi0U0JCCN7qD+wn6hfT/uQQkeC704gnb7rkZWbQ4EhLInWN6VOAHEuRV7mlVnjgchqAnkPE9UptTvPZaDDHH/XkEmVQEViv4=;
X-UUID: f982406af1ed43fe8e5d07c95dbb9791-20220111
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1230246601; Tue, 11 Jan 2022 23:11:28 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 22:11:26 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Jan 2022 14:11:24 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 12 Jan 2022 14:11:23 +0800
Message-ID: <1636d759ab9ad551b6c859d566a3a4c981394c0f.camel@mediatek.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: net: wireless: mt76: document
 bindings for MT7986
From: bo.jiao <bo.jiao@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, linux-wireless
 <linux-wireless@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, "Xing
 Song" <xing.song@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Peter Chiu
 <chui-hao.chiu@mediatek.com>, <devicetree@vger.kernel.org>
Date: Wed, 12 Jan 2022 14:11:23 +0800
In-Reply-To: <Yd38YhK5IC0PDkVJ@robh.at.kernel.org>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <67eb9adaa2ed281cb6b8f3c74afc0cc7081f0f6b.1641901681.git.Bo.Jiao@mediatek.com>
 <Yd38YhK5IC0PDkVJ@robh.at.kernel.org>
X-Mailer: Evolution 3.28.1-2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_221128_832735_748F30BE 
X-CRM114-Status: GOOD (  21.56  )
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

hi rob,

I will rework this patch ASAP.
thanks.

On Tue, 2022-01-11 at 15:53 -0600, Rob Herring wrote:
> On Tue, Jan 11, 2022 at 07:59:17PM +0800, Bo Jiao wrote:
> > From: Peter Chiu <chui-hao.chiu@mediatek.com>
> > 
> > Add an entry for MT7986 SoC.
> > 
> > Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  .../bindings/net/wireless/mediatek,mt76.yaml  | 29
> > +++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> > b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> > index 1489d3c..4444524 100644
> > ---
> > a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> > +++
> > b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> > @@ -18,7 +18,7 @@ description: |
> >    wireless device. The node is expected to be specified as a child
> >    node of the PCI controller to which the wireless chip is
> > connected.
> >    Alternatively, it can specify the wireless part of the
> > MT7628/MT7688
> > -  or MT7622 SoC.
> > +  or MT7622/MT7986 SoC.
> >  
> >  allOf:
> >    - $ref: ieee80211.yaml#
> > @@ -29,9 +29,10 @@ properties:
> >        - mediatek,mt76
> >        - mediatek,mt7628-wmac
> >        - mediatek,mt7622-wmac
> > +      - mediatek,mt7986-wmac
> >  
> >    reg:
> > -    maxItems: 1
> > +    maxItems: 3
> 
> You just changed existing users. You need 'minItems: 1' to keep 1
> reg 
> entry being valid.
> 
> >  
> >    interrupts:
> >      maxItems: 1
> > @@ -39,6 +40,17 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  memory-region:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +    description:
> > +      Specify the consys reset for mt7986.
> > +
> > +  reset-name:
> > +    const: consys
> > +
> >    mediatek,infracfg:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description:
> > @@ -231,3 +243,16 @@ examples:
> >  
> >        power-domains = <&scpsys 3>;
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/reset/mt7986-resets.h>
> > +    wifi@18000000 {
> > +        compatible = "mediatek,mt7986-wmac";
> > +        resets = <&watchdog MT7986_TOPRGU_CONSYS_RST>;
> 
> I'd suggest you don't use the define here to avoid the dependency.
> 
> > +        reset-names = "consys";
> > +        reg = <0 0x18000000 0 0x1000000>,
> > +              <0 0x10003000 0 0x1000>,
> > +              <0 0x011d1000 0 0x1000>;
> > +        interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
> > +        memory-region = <&wmcpu_emi>;
> > +    };
> > -- 
> > 2.18.0
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
