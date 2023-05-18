Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACF2C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 04:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIkCd52W+zN1SoFPBBm4oRim+UuYVpQOjJ1oTywL0QA=; b=1KqZHRYslcESzc9HgpcT8MBcmZ
	iaUoguWJiFCLKVrtbUYkjgTHAeinyqTvCRB+SWFeZNy9caBcjtKTlC8z3GiptLH6a5/BsBTMBYQZb
	JSo2Qn8z4kKNhch26fFL4/maVTryzi7Xl8+hsBmQO1W96WZbR0PABe9YQuD8uUSf69YBklEDI/PRr
	9SjWrfMGD50+h3ZkLzgOcZoro3O60EYTT7hif/CcBKHXjbGQHJly7nK5UXp5vhyU/B1eD0Mm1lQDL
	oLv5y5kJqNKk13bFCSk0Y61/Cgkmp6w0WJQZRvHvzm136Bj6gf4k99EaTSJcJQr7EIXRbVlNGIwxq
	FhPFOmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzV8P-00Bq8V-2j;
	Thu, 18 May 2023 04:21:01 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pzV8N-00Bq7k-20;
	Thu, 18 May 2023 04:20:59 +0000
Date: Wed, 17 May 2023 21:20:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Sumit Garg <sumit.garg@linaro.org>,
	Christoph Hellwig <hch@infradead.org>,
	Xiaoming Ding <xiaoming.ding@mediatek.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com,
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Subject: FOLL_LONGTERM vs FOLL_EPHEMERAL Re: [PATCH] tee: add FOLL_LONGTERM
 for CMA case when alloc shm
Message-ID: <ZGWnq/dAYELyKpTy@infradead.org>
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org>
 <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org>
 <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
 <ZGSgCZrg+RjAbGO1@infradead.org>
 <CAFA6WYO+EpiECFxdVgmd-Ey9jq1Ybt78WupK_bW5+oDcW-soVQ@mail.gmail.com>
 <d4773626-6cf0-c929-c775-a84ac41fd719@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4773626-6cf0-c929-c775-a84ac41fd719@redhat.com>
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

On Wed, May 17, 2023 at 08:23:33PM +0200, David Hildenbrand wrote:
> In general: if user space controls it -> possibly forever -> long-term. Even
> if in most cases it's a short delay: there is no trusting on user space.
> 
> For example, iouring fixed buffers keep pages pinned until user space
> decides to unregistered the buffers -> long-term.
> 
> Short-term is, for example, something like O_DIRECT where we pin -> DMA ->
> unpin in essentially one operation.

Btw, one thing that's been on my mind is that I think we got the
polarity on FOLL_LONGTERM wrong.  Instead of opting into the long term
behavior it really should be the default, with a FOLL_EPHEMERAL flag
to opt out of it.  And every users of this flag is required to have
a comment explaining the life time rules for the pin..

