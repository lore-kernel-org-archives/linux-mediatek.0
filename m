Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C33C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 02:30:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71980222E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 02:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z+B2p8Y0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Jk3PsQHl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71980222E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ig8uRTmx4iFgfqt9Nt84fzrMFU1usC5TzwVQ4ne7/Zo=; b=z+B2p8Y0iP6ox8/HWb0XjMeN8
	kIPlE/pIv6BvmCSLV/jsJlBYMzlR6HI/VW229EugUkQNRiVqFj6A6+YZNCfCWxGCbXFTqpfT4lGFf
	GBXcLBMwQNq4bxLlophxIXxEU2zo7I4Bt8OtEIYxX4HhM14YWtAmtMGxeflMYA6cAZn18JqWkOBAa
	NHrZWDa93r9pq5GXxgPU+yTXiTg3x4U4PdNGMRpyasfowXpp7KaSLaoPvqdJFSEqsJDsbzcRzR5A5
	oyHRIkDsBl5qvzcQ7c9VFDef0nODyReyo4IcySNu4kApsigePDpPelshHt02c9/SkCfxUz0UrlENH
	klZQ0vHhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUhPw-0002ba-J5; Tue, 20 Oct 2020 02:30:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUhPt-0002YN-CY; Tue, 20 Oct 2020 02:30:26 +0000
X-UUID: 26874f6234124a448b2290ba18fa0c46-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Meq6SMM9NCGXd0ezAvIYe7RYnC+ZkZUEfKlU7K9AvO0=; 
 b=Jk3PsQHlj1xArPyMeyfpnbKcv8E0Skq620YzqEKS9shjuBWWNJZWqErb2tm24GM+wS4C6G8/ukwDEe8ZVNSbxjmY5dFu9/aOllDD/Jt4gBV8GId/IksqGvsX39L3qbgzAxIKOxJf4PiuKEluxbRRrk3LDilcSIWnjKQ6af78HLc=;
X-UUID: 26874f6234124a448b2290ba18fa0c46-20201019
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 341255826; Mon, 19 Oct 2020 18:30:16 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:30:13 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Oct 2020 10:30:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 10:30:10 +0800
Message-ID: <1603161010.29336.138.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/8] dt-bindings: phy: convert phy-mtk-xsphy.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 10:30:10 +0800
In-Reply-To: <20201016170003.GA1562276@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201016170003.GA1562276@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBCCCD990EB25D087AF48EDB6BFB253E0AAAA7B568F8028A17DF86A16663C7DB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_223025_558936_612432A6 
X-CRM114-Status: GOOD (  20.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, CK
 Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-16 at 12:00 -0500, Rob Herring wrote:
> On Tue, Oct 13, 2020 at 04:52:00PM +0800, Chunfeng Yun wrote:
> > Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: modify description and compatible definition suggested by Rob
> > ---
> >  .../bindings/phy/mediatek,xsphy.yaml          | 200 ++++++++++++++++++
> >  .../devicetree/bindings/phy/phy-mtk-xsphy.txt | 109 ----------
> >  2 files changed, 200 insertions(+), 109 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > new file mode 100644
> > index 000000000000..86511f19277a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > @@ -0,0 +1,200 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek XS-PHY Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> > +
> > +description: |
> > +  The XS-PHY controller supports physical layer functionality for USB3.1
> > +  GEN2 controller on MediaTek SoCs.
[...]
> > +
> > +  ranges: true
> > +
> > +  mediatek,src-ref-clk-mhz:
> > +    description:
> > +      Frequency of reference clock for slew rate calibrate
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Properties with a standard unit suffix don't need a type.
Ok, will remove it, and also do it for other patches, thanks

> > -- 
[...]
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
