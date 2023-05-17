Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216AEC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mctQMwQ1c+oB4gTe4gyG4JXC6wODbSHM0afcemBmK5E=; b=OLYM/0BSj4pceP3SHnYQlQohJE
	EcY3AqxkvHMGdG2JWvMkH5eoiHXVr5+mX6uRaP9RxgkEn9MqnMpkfASBeXgVWI0EOGlHsMzHefPOJ
	qQANIBYuo+1wtSbUkCJq39DdxAX5HYBgIWNY8c4tEI8xCRAHURjTCDQ3Pq19tceh8Tp7GGVcU3FWY
	3xy5TrgpkRifWg39jZeTDLEIwmUSr+Ka3ssUl0sc1TO13A9rrJvCg1tQ00rRRrBHc6gE7zjNFpqBX
	4Ja0PYEu21RG5vnAVD8xk8TpKgOIplpAnT87sqqbuaswSNazjjqfTuwggGm4JM4VIlyW7V/GEs8sg
	agod9pMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCDF-008nJp-2b;
	Wed, 17 May 2023 08:08:45 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCDC-008nJF-2n;
	Wed, 17 May 2023 08:08:42 +0000
Date: Wed, 17 May 2023 01:08:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Xiaoming Ding <xiaoming.ding@mediatek.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com,
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Subject: Re: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
Message-ID: <ZGSLiiK/JzD5KMd7@infradead.org>
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org>
 <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
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

On Wed, May 17, 2023 at 01:22:51PM +0530, Sumit Garg wrote:
> > > +#if IS_ENABLED(CONFIG_CMA)
> > > +     page_flag |= FOLL_LONGTERM;
> > > +#endif
> > >       if (flags & TEE_SHM_USER_MAPPED)
> >
> > If this mapping is long live it should always use FOLL_LONGTERM.
> 
> It depends on the userspace application needs. However, I think it
> should be safe to use FOLL_LONGTERM by default to serve cases like
> secure media playback.

long term is defined as won't automatically go away during the same
syscall.

