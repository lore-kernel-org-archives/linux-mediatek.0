Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQbGFowvfPqtQPzZtvRAINTX6VzK6HOTANCcCyyrlrw=; b=ZqE2Akr69aAvVz
	OSXrsTMtpFRaGBi6HDqmo5SToVG18/P+6yePnObOpTiZhmcCf0wYj0sVKNkSk2nMgBgtjFTMts2Xi
	IdQBAkvvrhlsy58xe6FtbJlPJN2zZz5pofsVh/zveSKftTxiLdlGwEIpC97D+hB9NNCjzdKs5dDRI
	A7gh3RNTLecWnkYS04u29KTLelVmn6yWA6rRuWor+Xr485ydZ1BNeUgr3/p+l/SaBhtAK+BpkxWOf
	aHfz1gRX7FAPauE4CZ0Kjrc9E9YF28mtWwEPRei1Kk2u8HzYd4N0sA510Mp14YRxpSI63wgfRyRRH
	GwgbhzstCkFwD1BIn7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkN6n-00AR3T-2S; Fri, 29 Apr 2022 09:40:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkN6k-00AR0N-4a; Fri, 29 Apr 2022 09:40:15 +0000
X-UUID: 815388ebcac64336b5ae75b637f2089f-20220429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hGtBh7TApnEpoz0U8eKVTYyDkjsyBdFQji208gzJOo8=; 
 b=uqLAx7mux29aPbCks8UplXbTxx+ctfy9VN9oNMxIxyh0RAFz8jpbl4pHmL+dkpqiSPCfuuAYfdHrd6bkT3xzy7Zyu+ufK+df0qVPF3+s8xFk42JD28U0BLO6E7pq8HnJFgTi0nmPHoo1JBIObnHS2dX+aCxqFKLxXcME0wW4rqU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c789e3bd-2dc4-4f8b-ac64-ac1edf242ce6, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:b1382d2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 815388ebcac64336b5ae75b637f2089f-20220429
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1629441628; Fri, 29 Apr 2022 02:40:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 02:40:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 29 Apr 2022 17:40:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:40:02 +0800
Message-ID: <5e400f7ccb3b208a033e2ad8f220331851ff9c7e.camel@mediatek.com>
Subject: Re: [v4 16/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <broonie@kernel.org>, <angelogioacchino.delregno@collabora.com>,
 <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <tzungbi@google.com>,
 <linux-mediatek@lists.infradead.org>, <trevor.wu@mediatek.com>,
 <matthias.bgg@gmail.com>, <aaronyu@google.com>, <julianbraha@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 29 Apr 2022 17:40:02 +0800
In-Reply-To: <YmqlNV31FrcAyuN9@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-17-jiaxin.yu@mediatek.com>
 <YmqlNV31FrcAyuN9@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_024014_231584_1632D342 
X-CRM114-Status: GOOD (  20.27  )
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

On Thu, 2022-04-28 at 09:31 -0500, Rob Herring wrote:
> On Thu, Apr 28, 2022 at 05:33:53PM +0800, Jiaxin Yu wrote:
> > Add document for mt8186 board with mt6366, da7219 and max98357.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 71
> > +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-
> > mt6366-da7219-max98357.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-
> > da7219-max98357.yaml
> > b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-
> > max98357.yaml
> > new file mode 100644
> > index 000000000000..55e8649f2aea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-
> > max98357.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/sound/mt8186-mt6366-da7219-max98357.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT8186 with MT6366, DA7219 and MAX98357 ASoC sound
> > card driver
> > +
> > +maintainers:
> > +  - Jiaxin Yu <jiaxin.yu@mediatek.com>
> > +
> > +description:
> > +  This binding describes the MT8186 sound card.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8186_mt6366_da7219_max98357_sound
> 
> s/_/-/
> 
Got it.
> > +
> > +  mediatek,platform:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of MT8186 ASoC platform.
> > +
> > +  headset-codec:
> > +    type: object
> 
>        additionalProperties: false
Ditto.
> 
> > +    properties:
> > +      sound-dai:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> 
> sound-dai already has a type, so drop and define how many entries.
> 
Ditto.
> > +    required:
> > +        - sound-dai
> > +

The indentation of this line is incorrect. I will fix it.

> > +  playback-codecs:
> > +    type: object
> 
>        additionalProperties: false
> 
Got it.
> > +    properties:
> > +      sound-dai:
> > +        minItems: 2
> > +        maxItems: 3
> 
> If more than 1 entry, then you need to define what each one is and
> the 
> order. Just like reg, interrupts, clocks, etc.
> 
Hi Rob,

Should I correct them as below?

---
properties:
  sound-dai:
    minItems: 2
    maxItems: 3
    items:
      - items:
          - description: xxx
          - description: yyy
          - description: zzz

> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Drop
> 
Got it.
> > +    required:
> > +        - sound-dai
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - mediatek,platform
> > +  - headset-codec
> > +  - playback-codecs
> > +
> > +examples:
> > +  - |
> > +
> > +    sound: mt8186-sound {
> > +        compatible =
> > "mediatek,mt8186_mt6366_da7219_max98357_sound";
> > +        mediatek,platform = <&afe>;
> > +        pinctrl-names = "aud_clk_mosi_off",
> > +                        "aud_clk_mosi_on";
> > +        pinctrl-0 = <&aud_clk_mosi_off>;
> > +        pinctrl-1 = <&aud_clk_mosi_on>;
> > +
> > +        headset-codec {
> > +            sound-dai = <&da7219>;
> > +        };
> > +
> > +        playback-codecs {
> > +            sound-dai = <&anx_bridge_dp>,
> > +                        <&max98357a>;
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
