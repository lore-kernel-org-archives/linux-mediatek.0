Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6C8C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHkpIHsDJMVccFbSYcXY2khZL4erb7v3HbneWR1g+cI=; b=fV1aw8TxL5a0K5yOJOLWBunKPk
	4tpC77pLehezxtnWfhUKGe513HqK1gGENC65UvMzQYOx76zLyIn8G+2mUnAPQEpxRIwH5s25hWeL2
	JxsOfFX2r7dzu6VcjG3swhy9E62VKceQL5VFQ77N9JGAdkerQuf4sEOQC14nke/8kwmB8YaIRewxI
	m7VXXMMEcpZySJyyLeEGDAlvH9FRHM7GaYgWj9wsJhJNplKV6OblJaJH+UU15HLiKoWD0B5KntKa+
	4wyAIyuOnkOJeScMop7hUhxUqZ99HcbEHsh+ZFiyToV23FITk1Qo3xZdWRaQ2b/4ZLvFV9DhtcLN1
	pYWgFMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHHa-000dL1-0Q;
	Tue, 11 Apr 2023 16:55:50 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHHV-000dKG-2A;
	Tue, 11 Apr 2023 16:55:45 +0000
Date: Tue, 11 Apr 2023 09:55:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Chuck Lever III <chuck.lever@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Jeroen de Borst <jeroendb@google.com>,
	Catherine Sullivan <csully@google.com>,
	Shailend Chand <shailend@google.com>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH net-next v6 04/18] mm: Make the page_frag_cache allocator
 use per-cpu
Message-ID: <ZDWREY2ATn3VcLDW@infradead.org>
References: <20230411160902.4134381-1-dhowells@redhat.com>
 <20230411160902.4134381-5-dhowells@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411160902.4134381-5-dhowells@redhat.com>
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

On Tue, Apr 11, 2023 at 05:08:48PM +0100, David Howells wrote:
> Make the NVMe, mediatek and GVE drivers pass in NULL to page_frag_cache()
> and use the default allocation buckets rather than defining their own.

Why makes these different from the other users?

