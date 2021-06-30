Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7702C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F700611F2
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F700611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKQ49t9FbBZXUKjOB3jWeKnoa8KARbGhdVQTQGJPqkM=; b=E84Hu8xyB/NA9O
	T3BmZRQc/Le//VAeOQOQU+jdQL37YrWcfv2u0VugS9836BwNEfDCYmxqs3OjFWzr30RMVbr2zUWpM
	8PR/pJ2Y5RJT0JlG+jXU75HRmDIHiXfJuBjmguM2L9x9e7ADTKcJeYa/SSUHo+4V2l0g44E2PByEG
	RrSIxEGZj95kGhxkNXJavz25oKgl/EoVeJkvxxaIPGbk2zucknbzSI5gj031E0/6iIOYcZT4uNS0g
	rPz+IzVRhkblJn7kRwr5p7GKEP/3eu3Elzkt6PDYgrS/BF0UDJvm/QNwJWlqtd8EXTeQzLmsNC/eZ
	Hmr/jw/5gEtyYk8OwfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUkY-00D6Fe-EM; Wed, 30 Jun 2021 07:35:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUhs-00D4wg-9I; Wed, 30 Jun 2021 07:32:26 +0000
X-UUID: 7e4d290e149e41b88f4b925cd76abee0-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=62IYE54IdDULAKwoKbHVM6/DHaOQllqFJgwJn2lFs3o=; 
 b=O+hpFrPhoCp8T89GauehKEKosCD4OvwppH8G9iwJ+MELvtMDRXEt7cvYtBUplpEIVGGrqb3xC92g6w1wsBzPoq1xdyvvzEAoSZ60g+OaMBbyfBdRhHAFEohidBEsL0l4W71DsJgu+QJ+u0sNQvq3vSIsjpj0dN797dhAPO7RV5Y=;
X-UUID: 7e4d290e149e41b88f4b925cd76abee0-20210630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1602585118; Wed, 30 Jun 2021 00:32:21 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:31:09 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 30 Jun 2021 15:30:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:30:57 +0800
Message-ID: <1625038257.25647.5.camel@mhfsdcap03>
Subject: Re: [PATCH 01/24] dt-bindings: mediatek: mt8195: Add binding for MM
 IOMMU
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Date: Wed, 30 Jun 2021 15:30:57 +0800
In-Reply-To: <41809d87-0f1b-13fd-b565-26a17626aad9@canonical.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
 <20210630023504.18177-2-yong.wu@mediatek.com>
 <41809d87-0f1b-13fd-b565-26a17626aad9@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1963F5674633076AEF957F6E442E2D1D0BE305E0B7F438FD146FEE00D7D59E362000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003224_409510_1A1B90A7 
X-CRM114-Status: GOOD (  27.74  )
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

On Wed, 2021-06-30 at 08:26 +0200, Krzysztof Kozlowski wrote:
> On 30/06/2021 04:34, Yong Wu wrote:
> > This patch adds descriptions for mt8195 IOMMU which also use ARM
> > Short-Descriptor translation table format.
> > 
> > In mt8195, there are two smi-common HW and IOMMU, one is for vdo(video
> > output), the other is for vpp(video processing pipe). They connects
> > with different smi-larbs, then some setting(larbid_remap) is different.
> > Differentiate them with the compatible string.
> > 
> > Something like this:
> > 
> >     IOMMU(VDO)          IOMMU(VPP)
> >        |                   |
> >   SMI_COMMON_VDO      SMI_COMMON_VPP
> >   ---------------     ----------------
> >   |      |   ...      |      |     ...
> > larb0 larb2  ...    larb1 larb3    ...
> > 
> > Another change is that we have a new IOMMU that is for infra master like
> > PCIe and USB. The infra master don't have the larb and ports, thus we
> > rename the port header file to mt8195-memory-port.h rather than
> > mt8195-larb-port.h.
> > 
> > Also, the IOMMU is not only for MM, thus, we don't call it "m4u" which
> > means "MultiMedia Memory Management UNIT". thus, use the "iommu" as the
> > compatiable string.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../bindings/iommu/mediatek,iommu.yaml        |   7 +
> >  .../dt-bindings/memory/mt8195-memory-port.h   | 390 ++++++++++++++++++
> >  2 files changed, 397 insertions(+)
> >  create mode 100644 include/dt-bindings/memory/mt8195-memory-port.h
> > 
> 
> I understand this will go through IOMMU tree. Do you know about any
> further patches for memory controllers which will need the header?

This header file will only be used in dtsi file. the iommu masters will
use these port definitions in the dtsi.

The SMI driver no need include this header file.

By the way, the mt8195 SMI patches is at:

https://lore.kernel.org/linux-mediatek/20210616114346.18812-1-yong.wu@mediatek.com/ 

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thanks very much for your quick review.

> 
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
