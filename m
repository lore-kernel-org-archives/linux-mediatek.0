Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FBFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDJBVZbTuHGepyHRPmC4lv5oXYg+T1F6Hna5ZCc+RrQ=; b=XJx6F52b2JnNY1
	fcfwh1ic0EM2ACFZsEvhR/hBkRyazkUQgZfFVsxMdm5BI/LdDk/KqrCJyScF0vcgoOCeZt9KpELXT
	GIOFvva1oasOvIkGqRqb4gDgjppOQMKzB/IIMtAp1upUmMCTSEkTaZyPyjEmTpUfOUIy46xlTnfgE
	Ng8/vw3Vg221GFD/I31xuCDaa8ZqH9FNC6UqiZWinZsPCL7ePW1jtlq+npsK7PBMocxyc0nrP4+SQ
	HttpGmyH8iQU/MPWPwUj7MhCiRl7yXIQBG4Wg9dkc1LkV9FkfnY+TaFPzDBoAM01mk85ngf7Frh5T
	bBRWkJgPfN5KMkJsgh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7HE-004CC1-St; Mon, 23 May 2022 12:35:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt79r-0047xe-63; Mon, 23 May 2022 12:27:36 +0000
X-UUID: 6b91d431d6b7454b96968066d96fe12c-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:6a9b26de-a0f8-4ba0-a9ce-a6a24d9a490e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:b9b83ce3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
 l,QS:0,BEC:nil
X-UUID: 6b91d431d6b7454b96968066d96fe12c-20220523
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1999017140; Mon, 23 May 2022 05:27:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 05:27:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 20:27:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 23 May 2022 20:27:23 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <robin.murphy@arm.com>
CC: <bjorn.andersson@linaro.org>, <hch@lst.de>,
 <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <m.szyprowski@samsung.com>,
 <mark-pk.tsai@mediatek.com>, <mathieu.poirier@linaro.org>,
 <matthias.bgg@gmail.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH 0/2] dma-mapping,
 remoteproc: Fix dma_mem leak after rproc_shutdown
Date: Mon, 23 May 2022 20:27:23 +0800
Message-ID: <20220523122723.32602-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <6f1f48e2-a54d-58d6-8946-853cffeb55df@arm.com>
References: <6f1f48e2-a54d-58d6-8946-853cffeb55df@arm.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_052735_280866_91738ABC 
X-CRM114-Status: GOOD (  18.64  )
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

> >> Sigh.  In theory drivers should never declare coherent memory like
> >> this, and there has been some work to fix remoteproc in that regard.
> >>
> >> But I guess until that is merged we'll need somthing like this fix.
> > 
> > Hi,
> > 
> > Thanks for your comment.
> > As I didn't see other fix of this issue, should we use this patch
> > before the remoteproc work you mentioned is merged?
> 
> TBH I think it would be better "fixed" with a kmemleak_ignore() and a 
> big comment, rather than adding API cruft for something that isn't a 
> real problem. I'm quite sure that no real-world user is unbinding 
> remoteproc drivers frequently enough that leaking a 48-byte allocation 
> each time has any practical significance.
> 

Actually we stop 2 remote processors using the same remoteproc driver
when system suspend or screen off on our arm64 platform.
And the 48-byte slab allocation will be aligned up to 128 bytes on arm64.
So the leak can be significant in our use case especially
in stress test...

We really don't want to ignore it. Maybe there're other way to fix
it without adding APIs?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
