Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC5FC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:21:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D1C613B6
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2D1C613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4/oJ2c+yYwo5Iz2Cq47oaamGIPezpz09LO641cLTKA=; b=eKYmQuK0RDWOoM
	EYkUqxB7asXSDkf3VU186ehLWrRGcS5/TfA2WFwESd1XKn6w+D6HWKBWT5gCQvctWuREhcMXcDN2f
	x1z0zXEhnJoc9QDz/x5uB5n2TSo5yMBNI2f44bnGYtMWK8dfyTl+gXnb86hwxdRG9N/GfQtRA+ORb
	3IzcUiGTbFD3A+Uz+eH342y/juT+X72oJbsY88+m8wfF1wEUkGOgQO1IQQVCrx9FYo7ec2NVw7Y40
	qZ9F4Ofb8AOQxzVKJQLq/YxFA7s5y89aMIRvjtAWjzcWoINuEM1uP7/YfQZhKZRKmdbEZlaBk0pgB
	Le8uGA3V5x9rsbK0Gtrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3cwc-00DKKl-9l; Wed, 14 Jul 2021 11:20:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3cwE-00DKBr-7s; Wed, 14 Jul 2021 11:20:27 +0000
X-UUID: 91f6c532758148ba8d277aea63223dba-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JvxaiGfMsn7QBnaqj6qePbCrrXbpLHrwC0rk4w7ViDc=; 
 b=sbz3OeVTXFtBumuY38Rq1MKrRmoRIIaGKIPQhOqcbuIdIemzVL2I1/g3MMo6AIdJr9jTQnK4WzVho3wknUxYK+Duzfj8ZGlKTTdh8xRHnZfMAjzJ4zZm+Z9H5E0DmViR9gazXPZBqw1ifPo9Ue/OuFqLHLLxRSmb3n8c2OJIYn0=;
X-UUID: 91f6c532758148ba8d277aea63223dba-20210714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 707002589; Wed, 14 Jul 2021 04:20:21 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:20:19 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Jul 2021 19:20:13 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:20:12 +0800
Message-ID: <1626261612.8134.1.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add property to
 disable dvfsrc voltage request
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Qizhong Cheng <qizhong.cheng@mediatek.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <youlin.pei@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <ot_jiey.yang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski <kw@linux.com>,
 <Ryan-JH.Yu@mediatek.com>
Date: Wed, 14 Jul 2021 19:20:12 +0800
In-Reply-To: <1625024423.20084.12.camel@mhfsdcap03>
References: <20210630024934.18903-1-jianjun.wang@mediatek.com>
 <20210630024934.18903-2-jianjun.wang@mediatek.com>
 <1625024423.20084.12.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2BFD83614F95DED623F532636757125FFAAE8188D0AA27564AC8C064EC7B622D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_042026_346869_5D66C3FB 
X-CRM114-Status: GOOD (  17.41  )
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

Hi,

Just gentle ping for this patch set, please kindly let me know your
comments about this patch set.

Thanks.

On Wed, 2021-06-30 at 11:40 +0800, Qizhong Cheng wrote:
> Reviewed-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
> Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
> 
> On Wed, 2021-06-30 at 10:49 +0800, Jianjun Wang wrote:
> > Add property to disable dvfsrc voltage request, if this property
> > is presented, we assume that the requested voltage is always
> > higher enough to keep the PCIe controller active.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> >  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml       | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index e7b1f9892da4..3e26c032cea9 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -96,6 +96,12 @@ properties:
> >    phys:
> >      maxItems: 1
> >  
> > +  disable-dvfsrc-vlt-req:
> > +    description: Disable dvfsrc voltage request, if this property is presented,
> > +      we assume that the requested voltage is always higher enough to keep
> > +      the PCIe controller active.
> > +    type: boolean
> > +
> >    '#interrupt-cells':
> >      const: 1
> >  
> > @@ -166,6 +172,8 @@ examples:
> >                       <&infracfg_rst 3>;
> >              reset-names = "phy", "mac";
> >  
> > +            disable-dvfsrc-vlt-req;
> > +
> >              #interrupt-cells = <1>;
> >              interrupt-map-mask = <0 0 0 0x7>;
> >              interrupt-map = <0 0 0 1 &pcie_intc 0>,
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
