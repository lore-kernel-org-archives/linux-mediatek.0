Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D367C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uekJL1E5Uz+9JLqowhoPzZVYALfVqMM/z7Y13jfCLzU=; b=JzOPp4IbedNZk3RDzKlD4wXkE5
	KECowyHSE7GWNwSn+Ar+VNAZ477C49ndw6Sf940L300bZUM0B1FmOkdi0uIqnkR97DNd7rUsuvboY
	Bfkwo6mqQm2QKRZzCUcUwpyslPVIXkv1f0F85zkZTcupkKtWqHgpvCRwqrkHTNCFX4JLGuSh5aFRZ
	qROWpP/1ifN0t5SUzpJdfr7I/6eC3Dt04N2/IgYd0n07ms16KJUYDpRVSnfgFmO4d0h3exJ0kKT+w
	WzLTq+Fc25X+w2M2Hel8os6GXFPMXz0mFXVNoBxAZRQBdCYScE/cr0MxpG9oztuKsr0RAmM4ubrfo
	rCSLjjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1qUp-00Dqr4-2v;
	Wed, 24 May 2023 15:33:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1qUi-00Dqkq-3A
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 15:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684942424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uekJL1E5Uz+9JLqowhoPzZVYALfVqMM/z7Y13jfCLzU=;
	b=X1XwJX09jPb/cmsYbgeMIkOo46IIOZjNA9zVVyKVlz8zc5jO2nGJivyOek/hbxhR2hH++G
	h8/u5I2yWcfU5OuNf3sJtZ0UrRCm+j22cGl9yoIKZ+ShDzzpqilUAZcJDMFy0rbo0ioYGh
	QXIgXDuQZPD7+Yt7ELmc0+FfQ5r36+E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-UtOOYHJNMQqeOwkvKYu_rw-1; Wed, 24 May 2023 11:33:38 -0400
X-MC-Unique: UtOOYHJNMQqeOwkvKYu_rw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F027280BCA2;
	Wed, 24 May 2023 15:33:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.39.192.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A068492B0A;
	Wed, 24 May 2023 15:33:32 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jeroen de Borst <jeroendb@google.com>,
	Catherine Sullivan <csully@google.com>,
	Shailend Chand <shailend@google.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH net-next 05/12] mm: Make the page_frag_cache allocator handle __GFP_ZERO itself
Date: Wed, 24 May 2023 16:33:04 +0100
Message-Id: <20230524153311.3625329-6-dhowells@redhat.com>
In-Reply-To: <20230524153311.3625329-1-dhowells@redhat.com>
References: <20230524153311.3625329-1-dhowells@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_083345_098268_9EE83FDF 
X-CRM114-Status: GOOD (  17.90  )
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

Make the page_frag_cache allocator handle __GFP_ZERO itself rather than
passing it off to the page allocator.  There may be a mix of callers, some
specifying __GFP_ZERO and some not - and even if all specify __GFP_ZERO, we
might refurbish the page, in which case the returned memory doesn't get
cleared.

This is a potential bug in the nvme over TCP driver.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Eric Dumazet <edumazet@google.com>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Jens Axboe <axboe@kernel.dk>
cc: Jeroen de Borst <jeroendb@google.com>
cc: Catherine Sullivan <csully@google.com>
cc: Shailend Chand <shailend@google.com>
cc: Felix Fietkau <nbd@nbd.name>
cc: John Crispin <john@phrozen.org>
cc: Sean Wang <sean.wang@mediatek.com>
cc: Mark Lee <Mark-MC.Lee@mediatek.com>
cc: Lorenzo Bianconi <lorenzo@kernel.org>
cc: Matthias Brugger <matthias.bgg@gmail.com>
cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
cc: Keith Busch <kbusch@kernel.org>
cc: Jens Axboe <axboe@fb.com>
cc: Christoph Hellwig <hch@lst.de>
cc: Sagi Grimberg <sagi@grimberg.me>
cc: Chaitanya Kulkarni <kch@nvidia.com>
cc: Andrew Morton <akpm@linux-foundation.org>
cc: Matthew Wilcox <willy@infradead.org>
cc: netdev@vger.kernel.org
cc: linux-arm-kernel@lists.infradead.org
cc: linux-mediatek@lists.infradead.org
cc: linux-nvme@lists.infradead.org
cc: linux-mm@kvack.org
---
 mm/page_frag_alloc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/mm/page_frag_alloc.c b/mm/page_frag_alloc.c
index ffd68bfb677d..2b73c7f5d9a9 100644
--- a/mm/page_frag_alloc.c
+++ b/mm/page_frag_alloc.c
@@ -23,7 +23,10 @@ static struct folio *page_frag_cache_refill(struct page_frag_cache *nc,
 					    gfp_t gfp_mask)
 {
 	struct folio *folio = NULL;
-	gfp_t gfp = gfp_mask;
+	gfp_t gfp;
+
+	gfp_mask &= ~__GFP_ZERO;
+	gfp = gfp_mask;
 
 #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
 	gfp_mask |= __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC;
@@ -71,6 +74,7 @@ void *page_frag_alloc_align(struct page_frag_cache *nc,
 {
 	struct folio *folio = nc->folio;
 	size_t offset;
+	void *p;
 
 	WARN_ON_ONCE(!is_power_of_2(align));
 
@@ -133,7 +137,10 @@ void *page_frag_alloc_align(struct page_frag_cache *nc,
 	offset &= ~(align - 1);
 	nc->offset = offset;
 
-	return folio_address(folio) + offset;
+	p = folio_address(folio) + offset;
+	if (gfp_mask & __GFP_ZERO)
+		return memset(p, 0, fragsz);
+	return p;
 }
 EXPORT_SYMBOL(page_frag_alloc_align);
 


