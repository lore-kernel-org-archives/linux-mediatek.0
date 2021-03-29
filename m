Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DC6C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 18:09:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E4A161929
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 18:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E4A161929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/w4n28i/ZpYJJdxY/lzr43/UMr9E1B4+gOKfe69oJI=; b=e4c2cLTbfFXlB4LAfcYUMzMZe
	vM9AnUy8yY3Ffbb0VOLnhatxnEMVjextGpByZ+PYhvA58r9XRuffOHRttwv2R7jZBnpNZgwZqK6wB
	p+wrFxqDHGemCKPhDiibFhnUrTcYr+jLfO+gPQz2pC1YzRbvZOemYwy7eVY3bG714tnAGA4JJMVqw
	jP3ukd5hgNJRBAVQgl2NB/HD9K8to+pcI3QZbvgRjW4GXz6ooMYtXTGkuvKaZC8Ec+jk2SXVcaxMj
	UIkFzXH3dE1x2t80tDQwg7lfKT7ahWEx0FKd/RBMZ8/rW2nQIY+FGZ1w/hns4JRfeJja+7ZVSVG2/
	SI4g09lLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQwKG-000zQH-WA; Mon, 29 Mar 2021 18:09:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQp6g-000a4o-GN; Mon, 29 Mar 2021 10:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=S7e6/7OOnIOS0svOawoNSqRYHZwfkX/E2FkAsDNvQJg=; b=Cav30jsUi9Dd+qbI3Ey0UViCzc
 o42mckUK/MflpiwF1bo2yXalFfUnBM+EHIXI3i6H20wKARB5J2yHq2K3oYkMbCpPY2kUA6PWWLSKn
 0y1f9ONsIT6O+SnXJpP0yhzwDVI9fNc6ZvMqYdbJLVDQ0DvtDsvjWQHUWcZQvJPCNl58rklPTOS2E
 A/ETeJpdh2wrWJSiFCN6yClDwVth5h0/UtFB+c4V/+kuSl+ft8cfncUyFC54JN17yOCWGynRTIc85
 7gjtCTsUCjJ3F1w2CnIZBbtK/OnVd5TT0q/ii+/ZdYQw3Jf0a3tJQTyRfPjRrMQD2BRB2kIkpN6a3
 iL+Q/Ieg==;
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQigX-000vWE-UQ; Mon, 29 Mar 2021 03:35:31 +0000
X-UUID: 9cec68b92bef46d0b49530529b58e954-20210328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=S7e6/7OOnIOS0svOawoNSqRYHZwfkX/E2FkAsDNvQJg=; 
 b=JtMQEuBF0bmIh4zlb2xUrI/IbCrqbLVD/fTwE/Ggb5y6Ocy0b5w+YGauYRj7+c/A3nRTa62WNrFYZyyjRoHTLPvWNGiLdPTBrrxKdSRKniCbBkUQdtMT5CHccTHAKbl7xs370C9OuQ8Vz7DbikC1398rTyiEkBnidxiHYrQicss=;
X-UUID: 9cec68b92bef46d0b49530529b58e954-20210328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2061607272; Sun, 28 Mar 2021 19:22:57 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Mar 2021 20:22:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 11:22:42 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 11:22:42 +0800
Message-ID: <1616988162.26412.32.camel@mtksdccf07>
Subject: Re: [PATCH 1/2] dt-bindings: devapc: Update bindings
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Zhen Lei
 <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <nina-cm.wu@mediatek.com>
Date: Mon, 29 Mar 2021 11:22:42 +0800
In-Reply-To: <20210326195802.GA3761703@robh.at.kernel.org>
References: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
 <20210326195802.GA3761703@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B841F752D2FA1811A4B02DAD58ECC1AD0F980378278587B19E66D9AA2158CFD92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_043527_655111_28F35B42 
X-CRM114-Status: GOOD (  29.20  )
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

Hi, Rob


On Fri, 2021-03-26 at 13:58 -0600, Rob Herring wrote:
> On Fri, Mar 26, 2021 at 03:31:10PM +0800, Nina Wu wrote:
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
> 
> This should be implied by the compatible string.

The version attribute is used to decide how we interpret the debug info
got from registers.
As you mentioned, we can know the version of the architecture from the
compatible, but I think there will be code like this:

if (compatible is mt6779) version = 1
else if (compatible is mt8192) version = 2

And once we have more chips to support, the code will be quite long.
So I prefer to add a 'version' here.


> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2]
> > +    maxItems: 1
> > +
> > +  slave_type_num:
> 
> vendor prefix needed and s/_/-/

I will fixed in next version.

> 
> > +    description: The number of the devapc set
> 
> What?

For mt8192, there are multiple pieces of devapc HW for different subsys.
EX: infra devapc, peri devapc, etc.
'slave_type_num' is the total number of the devapc HW.
I cannot come up with an accurate description, though.


> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 4]
> > +    maxItems: 1
> >  
> >    reg:
> >      description: The base address of devapc register bank
> > +    maxItems: 4
> 
> Need to define what each region is.

I will fix it in the next version.

> 
> > +
> > +  vio_idx_num:
> 
> vendor prefix needed and s/_/-/

OK, will be fixed in the next version.

> 
> > +    description: The number of the devices controlled by devapc
> 
> No need to know which devices?

yes, the current driver does not care each of them.

> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >      maxItems: 1
> 
> uint32-array with 'maxItems: 1' is just 'uint32'
> 

got it, so it should be 'maxItems: 4'

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
> 
> Is the length of this the same as the value of slave_type_num? If so, 
> don't need both.
> 

yes, the length is equal to slave_type_num.
I will try to remove it in the next version.

> > +        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> > +        clock-names = "devapc-infra-clock";
> > +    };
> > -- 
> > 2.6.4
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
