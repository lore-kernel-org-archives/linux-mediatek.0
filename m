Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06448C47089
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 01:38:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2CB6613B5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 01:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2CB6613B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lC4GRWmzc6CFj+SruI0Gh8gzjWdNKrxy9ivswRp1Ht8=; b=C3BQ9IeVRCfd4t
	dW+4+9SlGMzvLV/oXugsMIb7b5fd0DFI/i1FNLG6frD1EMDnYesqRxlBrCBqaQmtKCi+EKsXYPfUp
	CX6/V90A67NH2DuM4IyqbIjG5dpAtV3mPcpFbRRpDUIE9U3b+DY4NoZFbFGXzCHTdcogvkz0cIxfz
	/dy7MEDFXcj4BqKSfZk7wc0e8aG619eUsia56RW65SQ4GRd5yG1pC3IJDc3ANEb+4zkEAJp4UW4mf
	eeGXLo0qJ1ARUEr+l7ICOjuV6sRiV6oEWJUxgLp6xD76fKMfcUEfZi4Df2UFblMwUVdJA4wczQ0yU
	CNsp1hdvzaadMTadvViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmRS9-00B0ZN-Pl; Fri, 28 May 2021 01:38:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmRRp-00B0PF-Gt; Fri, 28 May 2021 01:38:04 +0000
X-UUID: 93b66efee1ea414d8c40a1030ba6ddc9-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QrMvjMYFuFTBM7jcmVcI5ahKgZpshwo6hK1fPt+ufjM=; 
 b=NAq1XEIsRLdtTozLuVHBidYlRLOrat91FHocM0dm3LOwLngY8PpG7LoWVjW+cDgHOT5+W/1iges3hYSWWxCtRAYzXLtxvGBSxZ3mQ2j33hT66spPQsWeZVG8fTrlr9+gtCnFVtC9WTIft+pHiT+xL9iTKS1G2BWPfMyxob8iqvk=;
X-UUID: 93b66efee1ea414d8c40a1030ba6ddc9-20210527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1854514495; Thu, 27 May 2021 18:37:57 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 18:37:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 May 2021 09:37:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 May 2021 09:37:43 +0800
Message-ID: <1622165863.15667.3.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Disable i2c start_en and clear intr_stat
 brfore reset
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>
Date: Fri, 28 May 2021 09:37:43 +0800
In-Reply-To: <YK/9wMhoACc0beN/@kunai>
References: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
 <YK/9wMhoACc0beN/@kunai>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5E88BF11A0816A7B0929EAA4BD18F0349C9EDA1B743732DD7FA01BC962629EE32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_183803_063896_0BAA3573 
X-CRM114-Status: GOOD (  14.00  )
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

On Thu, 2021-05-27 at 22:14 +0200, Wolfram Sang wrote:
> On Thu, May 27, 2021 at 08:04:04PM +0800, qii.wang@mediatek.com wrote:
> > From: Qii Wang <qii.wang@mediatek.com>
> > 
> > The i2c controller driver do dma reset after transfer timeout,
> > but sometimes dma reset will trigger an unexpected DMA_ERR irq.
> > It will cause the i2c controller to continuously send interrupts
> > to the system and cause soft lock-up. So we need to disable i2c
> > start_en and clear intr_stat to stop i2c controller before dma
> > reset when transfer timeout.
> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> 
> Is there a suitable Fixes tag for this?
> 

Can you help to add the following tag, thanks
Fixes: aafced673c06("i2c: mediatek: move dma reset before i2c reset")

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
