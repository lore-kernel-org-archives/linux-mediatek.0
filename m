Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4269C9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 06:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KV1kJEu9MWCxcXdqLjfpsTub2AJOESaQRgwi2TfgLL4=; b=GWDdQfeKGwNTm1wr18MMeu3eb3
	B7Qxgsk6NSxW8Pcf2PSWk6G7bdaBG6YDLr8iFE0L59qzhHwe2mREZ+mykE5ZaXWSzjGtnp8CJcbJp
	SQCLFEjtg1vZGibdHEsvGIsIrYMWlR9i5mPCcngcMDvsj9PlRHh8y2efBZcRGoopdfqIgIFIaM60B
	EXLG9i6MgpSUI5evd7GnxkpH0Bw9m43rp7JhYEXfUXbfmIpAZdZH0ePmenc59ueHIP5EoNAhVsYvZ
	Bdo5xXOUhdFffdTNGyqLUc6KRnJZoYyjgOM1NdURLt5tLlRNFLvxTE8SmzxR9aooMWlR2UDBFz05u
	FNLxp3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zoY-0000000Cm84-3bXC;
	Fri, 25 Sep 2026 06:53:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zoX-0000000Cm7r-0Fou;
	Fri, 25 Sep 2026 06:53:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FDF9419F7;
	Fri, 25 Sep 2026 06:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDFA1F000FF;
	Fri, 25 Sep 2026 06:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790319224;
	bh=KV1kJEu9MWCxcXdqLjfpsTub2AJOESaQRgwi2TfgLL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIPhYy/v6lOlVOrdKTETZSFGQOUQDX4VvpgoOAgfsEWsEbR0WGx6L3qbsCmdY984L
	 AXL4dg4kYZaFrLO8YGgfDtN5Qe72DWU5dDtzLq9qkBew6ZKV0UaKfWf6lVobzyr2vr
	 uH5afNmXfUs3SsmRZ2RL5i2b9JqB0ivO86CLDHtGg8X7ulkUlPO9PEUT3eTvzPRi+Q
	 ZCoJS54GVLNIQvIoKxXSXIL3rorzGMkFXrvWdV8+c8L+fVqPJ+oVIhuge680tnMcNM
	 S6B3nfh+f0adbHsBaejq3savqsC8rLoyjYcAYwDemT/IhJIoVo1b8vn4an7rNAzoby
	 qwZEyqt5ju17Q==
Date: Fri, 25 Sep 2026 08:53:36 +0200
From: Gao Xiang <xiang@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Artem Dinaburg <artem@trailofbits.com>, stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sandeep Dhavale <dhavale@google.com>,
	Will Shiu <will.shiu@mediatek.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 6.1.y] erofs: Fix detection of atomic context
Message-ID: <arYacJ7KdcTO7UDQ@MacBookPro.fritz.box>
Mail-Followup-To: Sasha Levin <sashal@kernel.org>,
	Artem Dinaburg <artem@trailofbits.com>, stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sandeep Dhavale <dhavale@google.com>,
	Will Shiu <will.shiu@mediatek.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
References: <20260922200448.27724-1-artem@trailofbits.com>
 <arSoAUX4jDzgY-rG@MacBookPro.fritz.box>
 <2026-09-24-daily-reply-0004-re-erofs-atomic-context-follow-up@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026-09-24-daily-reply-0004-re-erofs-atomic-context-follow-up@kernel.org>
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

Hi Sasha,

On Thu, Sep 24, 2026 at 01:13:23PM -0400, Sasha Levin wrote:
> > Thanks for your effort, this commit has a follow-up commit
> > commit c99fab6e80b76422741d34aafc2f930a482afbdd
> >
> > erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC
> >
> > could you please consider backport those to stable kernels as well?
> 
> c99fab6e80b7 ("erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC")
> is queued for 6.1 together with this patch, and 6.6.y and 6.12.y already
> have it. I've also queued both commits for 5.15. 5.10 doesn't need either,
> since it always hands decompression off to the workqueue.

Thanks for the effort!

btw, just correct a bit 5.15.y also has commit 648f2de053a8 ("erofs: use
workqueue decompression for atomic contexts only"), so

upstream commit 12d0a24afd9e ("erofs: Fix detection of atomic context")
upstream commit c99fab6e80b7 ("erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC")

are also needed for 5.15.y.

Thanks,
Gao Xiang

> 
> -- 
> Thanks,
> Sasha
> 

