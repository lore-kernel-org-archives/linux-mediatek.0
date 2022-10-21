Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407D2C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 03:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liRN+HmxoIKuY83k0B956REc4h3T4bcOVKQySzS8Z7g=; b=y7k0BPIyhfpe5rXjcMh1eqBqKl
	njBdd46Cmj/Dd2shWB+3X5gQPe3qrdCXEvps1hg8+AB+pTQf58ohOyxDIUGJFepKRFo78XHMiHOdo
	HZrd1+jFMx9K8ShpQTkYsd/mfo2wmEgryyIe35RhifbwVu7bTLQxwAY0mG6Qjm434O0eEMxA4vXGT
	rAzKzStFVmrUTVuITWBZGkj0AwAo9CWuW/Z7n31OWEDChIA+Tm2Q15AtBOZDorEmR1y1tD1Erfqqp
	2vdfrX4F7ohnn+FnmLBKcWwft6Mv4coBLrHQSx4GcLDtjtUPpFZ/KkaDdMw1G8VD20ZEngGaVVwCM
	IyG+1fBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olihv-004lPP-I6; Fri, 21 Oct 2022 03:28:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olihl-004lKI-2c; Fri, 21 Oct 2022 03:28:18 +0000
X-UUID: fa0d5d5609fd4595bf0d0cd6667cddb3-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=liRN+HmxoIKuY83k0B956REc4h3T4bcOVKQySzS8Z7g=;
	b=TtpGlCVMq3Zes+NBDYyLEj22qgKyjATJni/4fRyQ/e6MjRcLUhLFEd3QoDNG/uf7oquQMHuWiVFeIFsuDFeztOrhVW0jnMzi4x91elDV6+lYwWfY1YD3Y7MeeZ6ZmmQo8DTKu+fsCj2WPSf5TLbavBtc/TSiWcAoQ8p3UoKd7QY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:44f0a5b2-9434-4778-9dfd-626bd224a3d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:fabd35e4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fa0d5d5609fd4595bf0d0cd6667cddb3-20221020
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 360472238; Thu, 20 Oct 2022 20:28:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 21 Oct 2022 11:27:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 21 Oct 2022 11:27:34 +0800
Message-ID: <20a87e771e4bcce4e9c9f0a1db13e20f75ce3b72.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 21 Oct 2022 11:27:33 +0800
In-Reply-To: <20221021022647.GA2195154-robh@kernel.org>
References: <20221020111925.30002-1-tinghan.shen@mediatek.com>
	 <20221020111925.30002-2-tinghan.shen@mediatek.com>
	 <20221021022647.GA2195154-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_202817_181214_7BC151CD 
X-CRM114-Status: GOOD (  21.80  )
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

Hi Rob,

Thanks for your review.

On Thu, 2022-10-20 at 21:26 -0500, Rob Herring wrote:
> On Thu, Oct 20, 2022 at 07:19:23PM +0800, Tinghan Shen wrote:
> > From: Jianjun Wang <jianjun.wang@mediatek.com>
> > 
> > In order to support mt8195 pcie node, update the yaml to support
> > new
> > properties of iommu and power-domain, and update the reset-names
> > property to allow only one 'mac' name.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml         | 16
> > +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-
> > gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-
> > gen3.yaml
> > index c00be39af64e..af271018b134 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -70,14 +70,21 @@ properties:
> >      minItems: 1
> >      maxItems: 8
> >  
> > +  iommu-map:
> > +    maxItems: 1
> > +
> > +  iommu-map-mask:
> > +    maxItems: 1
> 
> This is not a array. It needs a value. Must be 0 if iommu-map only
> has 1 
> entry? Or you only support 1 downstream device?

We only has 1 entry for iommu-map, we'll change it to 0 in the next
version.

Thanks.

> 
> > +
> >    resets:
> >      minItems: 1
> >      maxItems: 2
> >  
> >    reset-names:
> > -    minItems: 1
> > -    items:
> > -      - const: phy
> > +    oneOf:
> > +      - items:
> > +          - const: phy
> > +          - const: mac
> >        - const: mac
> >  
> >    clocks:
> > @@ -107,6 +114,9 @@ properties:
> >      items:
> >        - const: pcie-phy
> >  
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    '#interrupt-cells':
> >      const: 1
> >  
> > -- 
> > 2.18.0
> > 
> > 


