Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F33C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 06:55:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF9964E38
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 06:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DF9964E38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ecZ4B0AXD8AY+Fm1dhVPlnfFmDjYL1rLPJH348qQZtE=; b=WFm6Yo+tFzIW2WeXWc84sXgMX
	K8Q2utRhfmVRjnA+qX+tJEGOzY+jCIYK+Zrymjvc5G6PHNc6yPIOgTJ6bYbZQb0Nth1imYZU+Szej
	TSzug6IAP9BCVl48W5W6DuyVM0xiokWfZQJX7kGoz7YUtI2fxDp6XsnXRmrjn3RFxRoZi9tfxnh0O
	uIP9k77Sm4xv4rkrqUw0QLy6qjonQJ0Pmw0jPz9zoLxGyCl1QMk7yKH5sgGt/QsiFzZvDmwpMwog2
	sUO2Ar65YTADe+Z1cx+4DDiLzammRSDS8RaBxpGhQ+0Lk8Dguf3a7fO7JrWWJgrk7zbPdow2RSdlM
	GKmC7T1YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGcT2-0001cS-4n; Mon, 01 Mar 2021 06:55:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGcT0-0001b3-0e; Mon, 01 Mar 2021 06:55:43 +0000
X-UUID: cb9c92cd3c844b3d99505c71f1a86c34-20210228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QVGn0n8BLUxEWDtnLqCxnMqkZncL3xMO0eBBB5gr4Yo=; 
 b=p3u6fp9MFzbfHX0gEnuM9IYWtDEH+dsnDeopNQLOWlkZHtVhRr0NbNJ95UP771H7Dn7dEkj4qgjj4sCNb3JUPuHq4R5y6+E4YJlZHLDTpTBSisIXCv1hgffv8OtpEPVLhXFM1IIkzO7C/8KX7fSQNm+U6pSqo5MsCJJSYOy5q64=;
X-UUID: cb9c92cd3c844b3d99505c71f1a86c34-20210228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1127926855; Sun, 28 Feb 2021 22:55:34 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Feb 2021 22:45:33 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Mar 2021 14:45:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Mar 2021 14:45:29 +0800
Message-ID: <1614581129.14457.0.camel@mhfsdcap03>
Subject: Re: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
From: Irui Wang <irui.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 1 Mar 2021 14:45:29 +0800
In-Reply-To: <20210210225323.GA2961490@robh.at.kernel.org>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
 <20210203083752.12586-2-irui.wang@mediatek.com>
 <20210210225323.GA2961490@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 62560B53CD9D2FC90A2C93FBF883E1ACB0740244722726113DF61E297D86CCD92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_015542_265880_3CD931B3 
X-CRM114-Status: GOOD (  20.80  )
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
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, srv_heupstream@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>, devicetree@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, linux-mediatek@lists.infradead.org,
 Fritz
 Koenig <frkoenig@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-02-10 at 16:53 -0600, Rob Herring wrote:
> On Wed, Feb 03, 2021 at 04:37:48PM +0800, Irui Wang wrote:
> > Adds dma-ranges property for DMA addresses translation.
> > 
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index f85276e629bf..e4644f8caee9 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -23,6 +23,8 @@ Required properties:
> >  - iommus : should point to the respective IOMMU block with master port as
> >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >    for details.
> > +- dma-ranges : describes how the physical address space of the IOMMU maps
> > +  to memory.
> 
> dma-ranges is supposed to be in a bus/parent node.
Dear Rob,

The mt8192 iommu support 0~16GB iova. We separate it to four banks:
0~4G; 4G~8G; 8G~12G; 12G~16G.

The "dma-ranges" could be used to adjust the bank we locate.
If we don't set this property. The default range always is 0~4G.

Here we don't have actual bus/parent concept here.  And the iova
requirement is for our HW. Thus put the property in our node.

Is this OK? If this is ok for you, I will put this message in the commit
message and binding in next version.

Regards
> 
> >  One of the two following nodes:
> >  - mediatek,vpu : the node of the video processor unit, if using VPU.
> >  - mediatek,scp : the node of the SCP unit, if using SCP.
> > -- 
> > 2.25.1
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
