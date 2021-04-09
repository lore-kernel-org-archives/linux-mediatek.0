Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30AAC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 03:31:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44A0761157
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 03:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44A0761157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Rls2QalIPAy1W6jZ1GQrW3YJ+jg85J4Sbq7JPAje88=; b=H/JsUpjAM8roqImwNpbhCmJmp
	LDSCDgt39fEJAY2KWq1MysxvxsMoSGS0LC+ouruAw2QGbGNP3JthfnvULPaUanWr9klAM9S1uLocx
	Q/kNU8DckYhMThQPkhEsP/zKg+cONTyoqvoptbidGwmVKshK6wv7R44SeVP92ZIuKKGgp1fhZbSS0
	iO9V2/A0Qq6RMY3FCuDzORKCJYu6CqO68O4cnntEWRwb1NYZ3pci75svNS1Q8BFntP8qYRWutOrdx
	/1miRRnnKqxNn5XnmU1QHTCpcx7Z7aUjxrf1a9T3IQdCkg+EeMmrlgR/FeSyaVuRps7LIY92eVFcn
	E9tXwIxVA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUhrH-009rJN-HB; Fri, 09 Apr 2021 03:31:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUhr7-009rG8-QW; Fri, 09 Apr 2021 03:30:53 +0000
X-UUID: 4623ced3b00048628ef0093212609473-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=arJG16CDzyUkGqPEnWMf6l856hAp9u/dcfwy2lSC6GM=; 
 b=SMUC/7J8aha+qWUl9RrZg5RUZCEJYW+XYezJcjLY4J6bFmbwEHDwqzdPjZYRXDy163q1LAIuMuvRpaVtsb3WFAo0eFc7+BC4wcNrHSWsZrhWyZhkHEuwKOT7qLXjQaVQjt5rlq4JSNCItsO6XfBzsg2dGxN4CZtECA5p2GTu0bA=;
X-UUID: 4623ced3b00048628ef0093212609473-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 435403162; Thu, 08 Apr 2021 20:30:45 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 20:30:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 11:30:30 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 11:30:29 +0800
Message-ID: <1617939030.29552.2.camel@mtksdccf07>
Subject: Re: [PATCH v2 1/6] dt-bindings: devapc: Update bindings
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Zhen Lei
 <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>
Date: Fri, 9 Apr 2021 11:30:30 +0800
In-Reply-To: <20210408204354.GA1926089@robh.at.kernel.org>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <20210408204354.GA1926089@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 38F287E4ECC4047A38808EFB92A57C55DE4F89C14B2D8C99AB07417FB55904862000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_043050_611209_5BA57289 
X-CRM114-Status: GOOD (  20.82  )
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

On Thu, 2021-04-08 at 15:43 -0500, Rob Herring wrote:
> On Thu, Apr 01, 2021 at 02:38:02PM +0800, Nina Wu wrote:
> > From: Nina Wu <Nina-CM.Wu@mediatek.com>
> 
> Every change is an 'update'. Perhaps mention mt8192 in the subject.
> 

OK.
I will try to make it clear in the next version.

> > 
> > To support newer hardware architecture of devapc,
> > update device tree bindings.
> > 
> > Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > index 31e4d3c..42b284e 100644
> > --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > @@ -20,11 +20,17 @@ properties:
> >    compatible:
> >      enum:
> >        - mediatek,mt6779-devapc
> > +      - mediatek,mt8192-devapc
> >  
> >    reg:
> >      description: The base address of devapc register bank
> >      maxItems: 1
> >  
> > +  vio-idx-num:
> 
> Needs a vendor prefix.

OK.
I will fix it in the next version.

Thanks.

> 
> > +    description: The number of the devices controlled by devapc
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maxItems: 1
> > +
> >    interrupts:
> >      description: A single interrupt specifier
> >      maxItems: 1
> > @@ -40,6 +46,7 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > +  - vio-idx-num
> >    - interrupts
> >    - clocks
> >    - clock-names
> > @@ -54,6 +61,7 @@ examples:
> >      devapc: devapc@10207000 {
> >        compatible = "mediatek,mt6779-devapc";
> >        reg = <0x10207000 0x1000>;
> > +      vio-idx-num = <511>;
> >        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
> >        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> >        clock-names = "devapc-infra-clock";
> > -- 
> > 2.6.4
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
