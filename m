Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC67C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 02:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU/bcmXhmnxn0XhTlBy7fp70VrnaTZUt5AaTtqK1BdA=; b=Uw3dZmkgokyTZ0
	61KWEYR7tctSGRRtGkUthmvFRaVhUJWeA/V4SZ7MSVJjeOUPWqxotlolEWYgu3uV48fP4mVi2qLeb
	vtcrWe138mcan2yxATgbJD/xvtt7FzWIqNArpc3D22e8Ca0OAfgFjYTbKgOn6Yu7WCAf294MXexke
	ISYMN8jWiWmb+Yxmn6Yflm5nCtpjq8Gg94V3cyn/b2FlInGL1qW+MmsVxYbUE5ut3i8xXjSk9DUAK
	0eOCnwzUjzStpjD07NB+QwQ7vDNwDy6FAhYR6Oxo01sCZhBOlhGyToSvYt0Fj3j/52uc0prCO3dGO
	J/vE/QLz6KwPSora/Nfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njXkC-00H5WY-8A; Wed, 27 Apr 2022 02:49:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njXk0-00H5TG-EE; Wed, 27 Apr 2022 02:49:22 +0000
X-UUID: 2c96001daf7d496a92843e548e6f516d-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:246ba0ae-d646-4f4f-bb75-db45bb0bd060, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:d4dfd22e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2c96001daf7d496a92843e548e6f516d-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1127032752; Tue, 26 Apr 2022 19:49:12 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 19:47:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 10:47:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 10:47:28 +0800
Message-ID: <2fe82b5743786744432c44115122b60b762561de.camel@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: add power and
 gce properties
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Rex-BC Chen <rex-bc.chen@mediatek.com>
CC: <krzysztof.kozlowski+dt@linaro.org>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <nancy.lin@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Apr 2022 10:47:28 +0800
In-Reply-To: <Ymg6dn3PotTeWbqF@robh.at.kernel.org>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-2-rex-bc.chen@mediatek.com>
 <Ymg6dn3PotTeWbqF@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_194920_553376_675C38FF 
X-CRM114-Status: GOOD (  29.03  )
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

Thanks for the reviews.
Since this patch has already applied in:

https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.18-next/soc&id=1da90b8a7bae09358569dba26e784d1f471b4aa0

I'll send a fixup-patch for your commnet.

On Tue, 2022-04-26 at 13:31 -0500, Rob Herring wrote:
> On Tue, Apr 19, 2022 at 11:32:33AM +0800, Rex-BC Chen wrote:
> > From: "jason-jh.lin" <jason-jh.lin@mediatek.com>
> > 
> > Power:
> > 1. Add description for power-domains property.
> > 
> > GCE:
> > 1. Add description for mboxes property.
> > 2. Add description for mediatek,gce-client-reg property.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 31
> > +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index b31d90dc9eb4..6c2c3edcd443 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -41,6 +41,30 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  power-domains:
> 
> How many and what are they.
> 
maxItems: 1
description:
  Each mmsys belongs to a power-domains, so we can add the power-
  domains property to make it clearer, and also bind to the power
  controller.

> > +    description:
> > +      A phandle and PM domain specifier as defined by bindings
> > +      of the power controller specified by phandle. See
> > +      Documentation/devicetree/bindings/power/power-domain.yaml
> > for details.
> 
> Drop. Don't need generic descriptions of common properties.
> 
OK, I'll drop this.

> > +
> > +  mboxes:
> 
> How many?
> 
minItems: 1

> > +    description:
> > +      Using mailbox to communicate with GCE, it should have this
> 
> If using?
> 
description:
  If using mailbox to communicate with GCE, it should have this
  property. GCE will help configure the hardware settings for the
  current mmsys data pipeline.

> > +      property and list of phandle, mailbox specifiers. See
> > +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for
> > details.
> 
> Drop
> 
OK, I'll drop this.

> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Already has a type.
> 
OK, I'll drop this.

> > +
> > +  mediatek,gce-client-reg:
> > +    description:
> > +      The register of client driver can be configured by gce with
> > 4 arguments
> > +      defined in this property, such as phandle of gce, subsys id,
> > +      register offset and size.
> > +      Each subsys id is mapping to a base address of display
> > function blocks
> > +      register which is defined in the gce header
> > +      include/dt-bindings/gce/<chip>-gce.h.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> 
> This needs to define exact sizes.
> 
> items:
>   - items:
>       - description: phandle to GCE
>       - description: subsy id
>       - description: register offset
>       - description: register size
> 
OK, I'll fix it like this:

mediatek,gce-client-reg:
  minItems: 1
  items:
    - items:
        - description: phandle to GCE
        - description: subsys id
        - description: register offset
        - description: register size


Regards,
Jason-JH.Lin

> > +
> >    "#clock-cells":
> >      const: 1
> >  
> > @@ -56,9 +80,16 @@ additionalProperties: false
> >  
> >  examples:
> >    - |
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +    #include <dt-bindings/gce/mt8173-gce.h>
> > +
> >      mmsys: syscon@14000000 {
> >          compatible = "mediatek,mt8173-mmsys", "syscon";
> >          reg = <0x14000000 0x1000>;
> > +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> >          #clock-cells = <1>;
> >          #reset-cells = <1>;
> > +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> > +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> > +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> >      };
> > -- 
> > 2.18.0
> > 
> > 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
