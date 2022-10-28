Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5799C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VYCNGu5up7oXK9iByzpPm+c/SezPGc55UX86NGHyoQ=; b=pa309uJT2u5RLUhkS6VQq0coKf
	WcBho3H8kpTrOhkppfe+LV7ynsOdbluKTmDK8WJrNHh655V2t0vO3qRpvcUFRZvPyoXNVMl6+ow4q
	n8RS0jlCusf0UwYyrraZXbPOcuH5I/4CjVbgHDjjjK4BhcNMYChJEMaKC6UXzFxMntvbJPV25aiQW
	Aegfx2dswlsTKi8FiPzwTYGIX4QhWQflUO+qPx6cuHr73hRDifG0RZKuYHcwD3lfyoqfJpimVUaxe
	Lw60OnDIF9eCyK5UMyupIRjJcGs2EYfSQvVYFJBYi5gT4br9CVzuRuKxRQ4akNAm51AVv6cuBpeOE
	RgpW9ePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooJLN-00FyOO-6j; Fri, 28 Oct 2022 06:59:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooJLK-00FyN9-Mm; Fri, 28 Oct 2022 06:59:52 +0000
X-UUID: 9cebf63a7f8f4a51abef368e3dc85f82-20221027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0VYCNGu5up7oXK9iByzpPm+c/SezPGc55UX86NGHyoQ=;
	b=mSPEaNogr8FD3RF1QwodsxmV51YaONLGGP3pm4J7D7FlPj+I4hvu612hd4OG/vb8iUZs7jvjQXcKJqMud1DjkMA4PX/KkvSQ7lUuOAzrh8V4pXpYWTGN7P3NSRNzAT5FHGihjpmTJsnQio+PPlaXQSpxJxRM8+96/zZSZl7oJLg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:3523c37d-5966-4b50-a3af-b5ebd7176eb0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:4f046927-9eb1-469f-b210-e32d06cfa36e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:-5,EDM:-3,IP:nil,
	URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9cebf63a7f8f4a51abef368e3dc85f82-20221027
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 329959737; Thu, 27 Oct 2022 23:59:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 28 Oct 2022 14:59:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 28 Oct 2022 14:59:07 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <bagasdotme@gmail.com>
CC: <Brian.Starkey@arm.com>, <benjamin.gaignard@collabora.com>,
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<jstultz@google.com>, <labbott@redhat.com>, <linaro-mm-sig@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lmark@codeaurora.org>, <mark-pk.tsai@mediatek.com>,
	<matthias.bgg@gmail.com>, <sumit.semwal@linaro.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] dma-buf: cma_heap: Fix typo in comment
Date: Fri, 28 Oct 2022 14:59:06 +0800
Message-ID: <20221028065907.23954-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Y1tSWo+eRvkVofbv@debian.me>
References: <Y1tSWo+eRvkVofbv@debian.me>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_235950_777202_20891589 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

> [-- Attachment #1: Type: text/plain, Size: 349 bytes --]
> 
> On Fri, Oct 28, 2022 at 09:44:17AM +0800, Mark-PK Tsai wrote:
> > Remove duplicated "by" from comment in cma_heap_allocate().
> > 
> 
> This patch isn't typofix but duplicate word stripping, right? If so, the
> patch subject should be "dma-buf: cma_heap: Remove duplicated 'by'".

Okay, I've update the title in v3.
Sorry for the horrible commit description.
Thanks.

> 
> Thanks.
> 
> -- 

