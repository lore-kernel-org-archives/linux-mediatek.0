Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48D0C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 08:06:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458C861042
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 08:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458C861042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=01eZFboIOW2NsmkQBqYYy3sw/85YoLkchqFZ11lKnFw=; b=lLvZeDg18Itp4XcUnATC66vvp
	iOoiWG9lb24yP3cNBR46MiCVN7+pRu0GzVm0hbEKvgkzurGHo2aouM0YTJZIf8giEaw+m3Bh/35ZG
	Obz7rGwtmEkh8JSzL3GKvOhYYVuNWJF96rgy4jA79i5RmEmC1QFdlDQ1Z5uzIaoo+CCmZD1p4ZRgy
	7ZZ+sp2OJkMDapHPqVVb4uE9tndg/LZ79EuU7Uzc+tvSoYVFMvIV6KeVMKCyYWfygrIIKYCeQ16fP
	YEg5620uKd61PPBJFy5oxbJFc8P0I1oHB8ePp5cv9MZLox3UaIz5BXHFX5IX2htBcLjoTlGnFE6FU
	aSRnf6asw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liYG7-00EA9D-PC; Mon, 17 May 2021 08:05:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liY2t-00E6l6-UL; Mon, 17 May 2021 07:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=h+98Z93ZAZ7sxTZlhBFEYtH38irCUScH0nEBanpBnHA=; b=URip+EEprywZ9Y/2bsHv4UIOnX
 lh90CkiUvvXgln5wbxkSEvXGyn1QuWUivnxn/cBuYO1yPrI2aMMr7bahFYjVpXZDkcrDWxGq+GvqV
 9okAC6Wu1ps4VpAsGhhvZKjM8WD9iBh+pltisJt9vAZ1Lp6JHai5ZDih1sLi1PuZY2KZWK0+2yeYc
 RMxQ3JIJlUpOJS1qawUvvvDv+bWjWwnqKCTqHFAVbe4/kcH0dDk3X3ffY3x4l8Um3pSSx2miPnxdj
 jPPQyshwT9xX7TOZwyeXlBg28xw7G6DHDzjNXr8UiXllj08eHIJoZeN3O+ny2FkOCSyKbY+uudCO7
 GSoQJd3w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liY2q-00DZ1H-Ms; Mon, 17 May 2021 07:52:10 +0000
X-UUID: 70f045f3457b4b9ca1420bcd68ffa17c-20210517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=h+98Z93ZAZ7sxTZlhBFEYtH38irCUScH0nEBanpBnHA=; 
 b=i6N3nGDgqSMlIAIVNEN4LRA8veMXn1siggz7ICJvOKUPq+bY5c7kpwcxPmuvHYpcanz/kh0gvTy8fJDyHaiPNEtKpvp5CjSpXPhpf0X6L54/HxZwJzmEK/0L6DIkl9mtjvFZ0LfwRnV99ZdHWJAHkrJ5X0HocgQ22AtAp3+mEfQ=;
X-UUID: 70f045f3457b4b9ca1420bcd68ffa17c-20210517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 333086180; Mon, 17 May 2021 00:52:03 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 May 2021 00:52:01 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 May 2021 15:51:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 May 2021 15:51:57 +0800
Message-ID: <1621237917.25594.7.camel@mhfsdcap03>
Subject: Re: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Rob Herring <robh@kernel.org>, Alexandre Courbot <acourbot@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Fritz Koenig
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>
Date: Mon, 17 May 2021 15:51:57 +0800
In-Reply-To: <2b97b41c-d5d8-ac32-a9cf-c7bef09ed8ef@xs4all.nl>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
 <20210203083752.12586-2-irui.wang@mediatek.com>
 <20210210225323.GA2961490@robh.at.kernel.org>
 <1614581129.14457.0.camel@mhfsdcap03>
 <2b97b41c-d5d8-ac32-a9cf-c7bef09ed8ef@xs4all.nl>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AC0AA144FDC81F6D769A28429EE706EB2A987DF65EC0BB169DF477EAD59927522000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_005208_756883_B263650A 
X-CRM114-Status: GOOD (  26.14  )
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

Dear Hans, Rob and Maintainers,

Much appreciated for reviewing this patchset, we have sent PATCH-V3 for
the patchset with Rob's comments:
https://patchwork.kernel.org/project/linux-mediatek/cover/20210412124555.26897-1-irui.wang@mediatek.com/

Just Gentle ping for this V3 patch.

Thanks,
Best Regards

On Thu, 2021-04-29 at 13:15 +0200, Hans Verkuil wrote:
> Hi Rob,
> 
> On 01/03/2021 07:45, Irui Wang wrote:
> > On Wed, 2021-02-10 at 16:53 -0600, Rob Herring wrote:
> >> On Wed, Feb 03, 2021 at 04:37:48PM +0800, Irui Wang wrote:
> >>> Adds dma-ranges property for DMA addresses translation.
> >>>
> >>> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> >>> index f85276e629bf..e4644f8caee9 100644
> >>> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> >>> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> >>> @@ -23,6 +23,8 @@ Required properties:
> >>>  - iommus : should point to the respective IOMMU block with master port as
> >>>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >>>    for details.
> >>> +- dma-ranges : describes how the physical address space of the IOMMU maps
> >>> +  to memory.
> >>
> >> dma-ranges is supposed to be in a bus/parent node.
> > Dear Rob,
> > 
> > The mt8192 iommu support 0~16GB iova. We separate it to four banks:
> > 0~4G; 4G~8G; 8G~12G; 12G~16G.
> > 
> > The "dma-ranges" could be used to adjust the bank we locate.
> > If we don't set this property. The default range always is 0~4G.
> > 
> > Here we don't have actual bus/parent concept here.  And the iova
> > requirement is for our HW. Thus put the property in our node.
> > 
> > Is this OK? If this is ok for you, I will put this message in the commit
> > message and binding in next version.
> 
> Can you answer Irui's question? Just a reminder...
> 
> Much appreciated!
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Regards
> >>
> >>>  One of the two following nodes:
> >>>  - mediatek,vpu : the node of the video processor unit, if using VPU.
> >>>  - mediatek,scp : the node of the SCP unit, if using SCP.
> >>> -- 
> >>> 2.25.1
> >>>
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
