Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C2DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 03:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ix9S2mqcvLurtLZeCnlvbXq/ssbKT9zNNHw8TWGpBT4=; b=BaVE3HTURyKlVV
	zJjZ9UJatB0DMVR6ri9Fh9kfCEaMv+51yBiYhfP8/t96SKkcavSbOI95rWDKtToFSw+J89mzRtM/O
	6ZTfj9RQ76J46DcaKsjCulhRT9CTHHQHkhKWf5QBHt/DwIe77uX4tzWO8Bb4AvOm9CUKFfyUFT+WS
	lfJokpO3ksXCd6IH2aqoKSO8bYm2D94ptl9Y/8jEIjXaslcQZPTpWxlfUuzBjuuaT0yV6wI/Z994z
	TmWIBFU3kzLtQT2bcK4U1zfPgbHi/tWb7lmlOZcRNxmZ8A1NBSBlaalBMTLuwkXj3Hx7BB0en+nui
	52o8Nm2GIJEHEkGq9DhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWVSv-009uuH-E7; Tue, 22 Mar 2022 03:45:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWVSo-009utA-Nd; Tue, 22 Mar 2022 03:45:48 +0000
X-UUID: 038aa053f0c6487285b6a36826e5b9be-20220321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=X9jhCnGqvno9UdTXf2UXhoimqw9YrbSB8oycMk9qWeQ=; 
 b=OcNVjehuMa7c7sUa8+Sz8Ys/9LdiooiqtfOY4NFxDam3hD2am0Bdod7jCUxfhNOhLWMCTemg6+Pov4W09YTDgzKNiTfDmWUnT8Qo/hvdOFjnqPK29OmR1yNCn85pRdeo8N3AiAGWLziLIp6fM+Q06G2O1pWkcFnm2EnE0nV+/fI=;
X-UUID: 038aa053f0c6487285b6a36826e5b9be-20220321
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 786835327; Mon, 21 Mar 2022 20:45:40 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 20:45:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 22 Mar 2022 11:45:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 11:45:25 +0800
Message-ID: <0e909de12a52ae88633634d868bd5001eef1b830.camel@mediatek.com>
Subject: Re: [v5 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <broonie@kernel.org>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 22 Mar 2022 11:45:24 +0800
In-Reply-To: <YjkLVwvxvOKr30qL@robh.at.kernel.org>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-2-jiaxin.yu@mediatek.com>
 <YjkLVwvxvOKr30qL@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_204542_805459_5D62786A 
X-CRM114-Status: GOOD (  19.71  )
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

On Mon, 2022-03-21 at 18:33 -0500, Rob Herring wrote:
> On Sat, Mar 19, 2022 at 07:41:08PM +0800, Jiaxin Yu wrote:
> > 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for
> > machines
> > with rt1015p and rt5682s.
> > 2. Adds new property "mediatek,headset-codec" for getting headset
> > codecs.
> > 3. Adds new property "mediatek,speaker-codec" for getting speaker
> > codecs.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 29
> > +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-
> > rt1015-rt5682.yaml
> > b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > rt5682.yaml
> > index a781e7aaaa38..aa0476eedd38 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > rt5682.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > rt5682.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      enum:
> >        - mediatek,mt8192_mt6359_rt1015_rt5682
> >        - mediatek,mt8192_mt6359_rt1015p_rt5682
> > +      - mediatek,mt8192_mt6359_rt1015p_rt5682s
> >  
> >    mediatek,platform:
> >      $ref: "/schemas/types.yaml#/definitions/phandle"
> > @@ -27,6 +28,25 @@ properties:
> >      $ref: "/schemas/types.yaml#/definitions/phandle"
> >      description: The phandle of HDMI codec.
> >  
> > +patternProperties:
> > +  "^mediatek,headset-codec$":
> 
> Fixed string, not a pattern. Move to 'properties'. Drop the vendor 
> prefix too.
> 
Hi Rob,

I originally referred to simple-card.yaml and move "xxx.yyy" to the
patternProperties.

Such as:
# use patternProperties to avoid naming "xxx,yyy" issue
patternProperties:
  "^simple-audio-card,widgets$":
    $ref: "#/definitions/widgets"

But your comment is more reasonable. I will move them to 'properties'
and drop the vendor prefix. Thanks for your review.


> > +    description: Holds subnode which indicates headset dai.
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Standard property, don't need a type or description. Just how many
> and 
> what each one is if more than 1.

Should I describe them as below?

properties:
...
  speaker-codec:
    type: object
    properties:
      sound-dai:
         maxItems: 1
...

> 
> > +        description: List of phandles to the headset codec nodes.
> 
> More than 1?
> 

Sorry, the description here is incorrect, there is only one phandle.

> > +    additionalProperties: false
> > +
> > +  "^mediatek,speaker-codec$":
> > +    description: Holds subnode which indicates speaker dai.
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        description: List of phandles to the speaker codec nodes.
> 
> Same here.
> 
> > +    additionalProperties: false
> > +
> >  additionalProperties: false
> >  
> >  required:
> > @@ -44,6 +64,15 @@ examples:
> >                          "aud_clk_mosi_on";
> >          pinctrl-0 = <&aud_clk_mosi_off>;
> >          pinctrl-1 = <&aud_clk_mosi_on>;
> > +
> > +        mediatek,headset-codec {
> > +            sound-dai = <&rt5682>;
> > +        };
> > +
> > +        mediatek,speaker-codec {
> > +            sound-dai = <&rt1015_l>,
> > +                        <&rt1015_r>;
> > +        };
> >      };
> >  
> >  ...
> > -- 
> > 2.18.0
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
