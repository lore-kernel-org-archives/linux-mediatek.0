Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE13C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 03:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3LEratcx0DI+S5h/Es+Cy4WQTiAG2bPGbEIVltZMZU=; b=ptGWo2TUkVvqpJ
	gF6MMltaZEqh9jPObivWTMTikTykOCpOlMZBu+11W9+l4tVkW3Q+zs8b9NjrWVV8okUHbYoWaqhPF
	R78YyiG4Z761zRznoVt9ExT6tjhSL5F+48lqwDvpI2aeOVCVECmKU04YsbRMii/tBU1o2cPBJOo5i
	Xr9lVSazktIsixz3LKvTdRUFIP+bA+9QMLz23aD2AMB8pyOsnqkyrLxpEb048CsxKZ2XGSFp8uEJH
	+c0tbriGxbFKBJ4CoZgahXTgMIVkJCZNfgsjYnfaT0tIvrT9P+1BGniqj9tIM5f+TS46r5PjpRtsW
	r+8jJK0YaXUP9+Y23yyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzn4-002MOF-VY; Thu, 10 Feb 2022 03:06:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzmk-002MH1-Ux; Thu, 10 Feb 2022 03:06:20 +0000
X-UUID: 2ec849cbb95a416c851e730bed2d4c90-20220209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RzZLjclFz+woL99hR0xQKcS7eJZlBvlNL1Be8VmvQUo=; 
 b=bdKw/XvwgSCPqYkGVloZfxa3RyLyxu5g8Ayg97ZOn6ESDdLq0qfzmO5+7cddg+M8V0aU8oKSoWD7PPoop1Ts8AfMrQVUsTF0ptuU/7BnB8up1bpTGB22eC0K4hrr/Omw0nbugn8dehC6aMvpBZRaKV2dZUt06V5pIqUpBX5sR2I=;
X-UUID: 2ec849cbb95a416c851e730bed2d4c90-20220209
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1266649125; Wed, 09 Feb 2022 20:06:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 19:06:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 11:06:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 11:06:06 +0800
Message-ID: <aa72bec2064e25990e1a3641b920cb5528cfccd4.camel@mediatek.com>
Subject: Re: [PATCH v2, 1/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for lat soc
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Tiffany Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
 "Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 10 Feb 2022 11:06:06 +0800
In-Reply-To: <YgQl8CtttQ99+8lB@robh.at.kernel.org>
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
 <20220128035440.24533-2-yunfei.dong@mediatek.com>
 <YgQl8CtttQ99+8lB@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_190619_052571_A34E6E7A 
X-CRM114-Status: GOOD (  19.87  )
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

Hi Rob,

Thanks for your suggestion.
On Wed, 2022-02-09 at 14:37 -0600, Rob Herring wrote:
> On Fri, Jan 28, 2022 at 11:54:34AM +0800, Yunfei Dong wrote:
> > Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-
> > soc".
> 
> What's lat soc? How does this relate to what's already there in this 
> binding.
> 
lat soc is another hardware, is related with some vdec larb ports.
Won't be used to decode, but must to write it in dtsi, or hardware
can't work well.

Need to enable clock/power/iommus, no interrupt.
> The subject space is limited, avoid saying the same thing twice 
> (dt-bindings).
> 

Best Regards,
Yunfei Dong
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 49
> > +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > index 6415c9f29130..a3c892338ac0 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > subdev-decoder.yaml
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > subdev-decoder.yaml
> > @@ -189,6 +189,55 @@ patternProperties:
> >  
> >      additionalProperties: false
> >  
> > +  '^vcodec-lat-soc@[0-9a-f]+$':
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mtk-vcodec-lat-soc
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      iommus:
> > +        minItems: 1
> > +        maxItems: 32
> > +        description: |
> > +          List of the hardware port in respective IOMMU block for
> > current Socs.
> > +          Refer to bindings/iommu/mediatek,iommu.yaml.
> > +
> > +      clocks:
> > +        maxItems: 5
> > +
> > +      clock-names:
> > +        items:
> > +          - const: sel
> > +          - const: soc-vdec
> > +          - const: soc-lat
> > +          - const: vdec
> > +          - const: top
> > +
> > +      assigned-clocks:
> > +        maxItems: 1
> > +
> > +      assigned-clock-parents:
> > +        maxItems: 1
> > +
> > +      power-domains:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - iommus
> > +      - clocks
> > +      - clock-names
> > +      - assigned-clocks
> > +      - assigned-clock-parents
> > +      - power-domains
> > +
> > +    additionalProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
