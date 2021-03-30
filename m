Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2D0C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:58:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDAC6198F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BDAC6198F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PZhIltzPhRquH4+wmDEdNxN5kzFWbIcX+isP2do/ZGs=; b=BwB+bqnoM5kIIBbkHFnApIhdF
	xcGWIJU25BdKJf1i+B2SUwmHw5rrcyevW0QCXE/xVsrUr3K/9HOAjVGCiT0YEhEEqe/Lh9PsJWRlg
	dsYiNLmGAQIZXHMqwobDbTAEP3xacCdaJZ+DQBbhbutqJp7hHYf+6zE5gHzH1IG6P5JKJHkQH22vW
	MsvIQ2C4JIaAo/bARxfIi/d0PR926Lb0pmWJPQujKvDn8XRmxu1WOmanOtOFBlWs17Hj9D/SbT4mB
	0UnRG2Uun05LH6ebZJBsI5X+NqrqgFm2VN8NkSpHeaE8D74TSeAxTOxhlDsJkHbXY7Ji31qcUCM79
	PwHnvEn7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR3eL-002Oax-6g; Tue, 30 Mar 2021 01:58:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR2qD-002Iuz-5a; Tue, 30 Mar 2021 01:06:47 +0000
X-UUID: 6344e73625114d649b4db5859fc39a54-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eIwgc0r+QIYxa5BYwiIyGnWzADT9Ny1eTWElVufgXQA=; 
 b=R+ERG0/MSmU6Ql4mz3kIyZLwLgD4NgH/0VznsLh+ODR3M7+aPeDjvhfCNTQkYJfK/hZJfQgcXs1DPLjWMnnJ1pJR4VDjYIZKnf3jtyxDfcjaAtgcJztlLbk3sdbuOVbg80RsWsz8LD1Fta9uydz5nk2GC3zLCIOrjodBD17O09g=;
X-UUID: 6344e73625114d649b4db5859fc39a54-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1337767765; Mon, 29 Mar 2021 17:06:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 18:06:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 09:06:35 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 09:06:35 +0800
Message-ID: <1617066395.9554.12.camel@mtksdccf07>
Subject: Re: [PATCH 1/2] dt-bindings: devapc: Update bindings
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <nina-cm.wu@mediatek.com>
Date: Tue, 30 Mar 2021 09:06:35 +0800
In-Reply-To: <8417423c-0462-f3af-b3a0-2af638850d51@gmail.com>
References: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
 <8417423c-0462-f3af-b3a0-2af638850d51@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_020646_220143_A6F47D66 
X-CRM114-Status: GOOD (  21.04  )
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

Hi, Matthias

On Mon, 2021-03-29 at 13:16 +0200, Matthias Brugger wrote:
> 
> On 26/03/2021 08:31, Nina Wu wrote:
> > From: Nina Wu <Nina-CM.Wu@mediatek.com>
> > 
> > To support newer hardware architecture of devapc,
> > update device tree bindings.
> > 
> > Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> > ---
> >  .../devicetree/bindings/soc/mediatek/devapc.yaml   | 41 ++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > index 31e4d3c..489f6a9 100644
> > --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > @@ -20,9 +20,27 @@ properties:
> >    compatible:
> >      enum:
> >        - mediatek,mt6779-devapc
> > +      - mediatek,mt8192-devapc
> > +
> > +  version:
> > +    description: The version of the hardware architecture
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2]
> > +    maxItems: 1
> > +
> > +  slave_type_num:
> > +    description: The number of the devapc set
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 4]
> > +    maxItems: 1
> >  
> >    reg:
> >      description: The base address of devapc register bank
> > +    maxItems: 4
> > +
> > +  vio_idx_num:
> > +    description: The number of the devices controlled by devapc
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> This can all per compatible DT data objects in the driver. Don't add new
> properties here.

I will try to remove it in the next version
Thanks


> 
> Regards,
> Matthias
> 
> >      maxItems: 1
> >  
> >    interrupts:
> > @@ -39,7 +57,10 @@ properties:
> >  
> >  required:
> >    - compatible
> > +  - version
> > +  - slave_type_num
> >    - reg
> > +  - vio_idx_num
> >    - interrupts
> >    - clocks
> >    - clock-names
> > @@ -53,8 +74,28 @@ examples:
> >  
> >      devapc: devapc@10207000 {
> >        compatible = "mediatek,mt6779-devapc";
> > +      version = <1>;
> > +      slave_type_num = <1>;
> >        reg = <0x10207000 0x1000>;
> > +      vio_idx_num = <511>;
> >        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
> >        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> >        clock-names = "devapc-infra-clock";
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8192-clk.h>
> > +
> > +    devapc: devapc@10207000 {
> > +        compatible = "mediatek,mt8192-devapc";
> > +        version = <2>;
> > +        slave_type_num = <4>;
> > +        reg = <0 0x10207000 0 0x1000>,
> > +            <0 0x10274000 0 0x1000>,
> > +            <0 0x10275000 0 0x1000>,
> > +            <0 0x11020000 0 0x1000>;
> > +        vio_idx_num = <367 292 242 58>;
> > +        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> > +        clock-names = "devapc-infra-clock";
> > +    };
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
