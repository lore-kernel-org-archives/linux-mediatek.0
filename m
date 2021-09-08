Return-Path: <SRS0=79RL=N6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2123C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 10:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7AEE6115C
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 10:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7AEE6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8/9O0eRXxNlNJVtW+NUVxIK48iLB3EgCEIhznB7aPs=; b=Aqv3OA9rc/yTW8
	ysMZUOXufrQpOn0s6UeizAhb5CyaWCJ3FliwbRxErF2M0rwydGGwXEiVFo/Fn5tgy+dc2G5W21XO3
	FK0rqvAb8YJkrOfb8EDr9kpEsIfdbyJmEfrpe2AL9R19OQuyxFVYbdCmO6Up8MAhc15OLg4lyyGFV
	ksTLKlryykRC0IcwCV77o16eD4RemkwwJ2V58NRbEyIl0Lhsso3WVAd4zS48L3eeQ1ZwbBh0Be+8A
	XYstOb+GV0oMynQylxPA1bm0dJgF9CGG472d/XvQAel0z2T0iVlqicimsz5jNrFMmcljhfPwDOKCP
	KhYzjZywIjachDjEdf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNubM-006Orf-UV; Wed, 08 Sep 2021 10:14:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNubJ-006Or1-6Z; Wed, 08 Sep 2021 10:14:42 +0000
X-UUID: 9bafa860d39d4ef983d928a9ad923a47-20210908
X-UUID: 9bafa860d39d4ef983d928a9ad923a47-20210908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2007312124; Wed, 08 Sep 2021 03:14:33 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 03:13:07 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 18:13:06 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Sep 2021 18:13:06 +0800
Message-ID: <7b375cc4f2899408d8f49867cf8cab16b93b10d2.camel@mediatek.com>
Subject: Re: [PATCH v10 01/17] dt-bindings: arm: mediatek: mmsys: add power
 and gce properties
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <hsinyi@chromium.org>, <fshao@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Wed, 8 Sep 2021 18:13:06 +0800
In-Reply-To: <8de99666-f9be-320d-96c0-b9e140d3d4b4@collabora.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
 <20210908060312.24007-2-jason-jh.lin@mediatek.com>
 <8de99666-f9be-320d-96c0-b9e140d3d4b4@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_031441_276345_8FEEB756 
X-CRM114-Status: GOOD (  26.45  )
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

Hi Enric,

Thanks for the reviews.

On Wed, 2021-09-08 at 10:32 +0200, Enric Balletbo i Serra wrote:
> Hi Jason,
> 
> Thank you for your patch. One small comment below.
> 
> On 8/9/21 8:02, jason-jh.lin wrote:
> > Power:
> > 1. Add description for power-domains property.
> > 
> > GCE:
> > 1. Add description for mboxes property.
> > 2. Add description for mediatek,gce-client-reg property.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 30
> > ++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 2d4ff0ce387b..a2e7bddfed03 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -39,6 +39,30 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  power-domains:
> > +    description:
> > +      A phandle and PM domain specifier as defined by bindings
> > +      of the power controller specified by phandle. See
> > +      Documentation/devicetree/bindings/power/power-domain.yaml
> > for details.
> > +
> > +  mboxes:
> > +    description:
> > +      Using mailbox to communicate with GCE, it should have this
> > +      property and list of phandle, mailbox specifiers. See
> > +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for
> > details.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
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
> > +
> >    "#clock-cells":
> >      const: 1
> >  
> > @@ -53,6 +77,10 @@ examples:
> >    - |
> >      mmsys: syscon@14000000 {
> >          compatible = "mediatek,mt8173-mmsys", "syscon";
> > -        reg = <0x14000000 0x1000>;
> > +        reg = <0 0x14000000 0 0x1000>;
> 
> Why this change?
> 
> Thanks,
>   Enric
> 

I think the first version of this example is not correct.
I,ve checked the first version of mt8173.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/boot/dts/mediatek/mt8173.dtsi?id=b3a37248415716663ea2d752da4a5f765fc87442

Because #address-cells and #size-cells of parent node are defined as 2.

e.g.

soc {
	#address-cells = <2>;
	#size-cells = <2>;
...

};


Regards,
Jason-JH.Lin

> 
> > +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> >          #clock-cells = <1>;
> > +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> > +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> > +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> >      };
> > 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
