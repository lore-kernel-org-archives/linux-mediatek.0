Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6BAC76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 00:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1VZzDi4GY18ewCATzaBVBi3jFt9uNVAIW9Am330oLQ=; b=mCkb9VTG+a4SjPtJM2A1a3kPH9
	T138D4O0hURgPUjD0+Ymui/tdV+jTLrD52CoVe/gIg2AM89oh23cbgQlrIKPe03Z2MV3vUk9b+YN7
	gnrLFDh2aGB8oOj9S32Hg9AMPGfmWoW9JgQZHCqffYptq2T6mKsKr9XIwx0YxIf2PNjnpkP+x0eZB
	43It20GuaJPxSXaqhxybr+kVoFbxMY7py5usMqHykuS9FHzmv617oClCqjal2aa8H6mXtnUUZq645
	aNx0se/hbpa6rGQnox4iXGplDV8rhWeuGmexqACEUhGzL26FvDFgcW2fuRHlSup8yyq26JPkjYcu7
	aUrtm6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkaNH-008ugW-0S;
	Fri, 07 Apr 2023 00:54:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkaNC-008uei-16;
	Fri, 07 Apr 2023 00:54:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A4A364DE9;
	Fri,  7 Apr 2023 00:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C35C433D2;
	Fri,  7 Apr 2023 00:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680828876;
	bh=uvT44qx5YO7bon6aMmqTeZtryVy3J03QEXu1FpcUChw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gb3r4KSO9gRu1kunqKSKRVILUWmx2/w1729zO1bnmOFwGTjK8Ft7VgeVIqQTRYktv
	 IWoDAI4k/MGasNqIg8yOC4EaHRFW3OexmHky+FTATmWwQPv0fuyPhD9KqpUrJdUZvy
	 04jSqe8Mz+djYDYAxW63CiCRaFAhGWCyS7LpVaX5D/mfbaRIUmoNGKxiZhnx++WVAf
	 0Hlc/LhrSf7+y2+OvyhZRwCWgXuEjgUquY5PkBpHS6jI2oxJ0oTdmh9/bpv7XFAxsC
	 dkHpoI3IwMJoz2Lwc/5kivXju8kVrsuuL0xWPpJK8r4SLNxcjeTU1NMtBFmuDOtKIE
	 XV9HKRzNQ6t1Q==
Date: Thu, 6 Apr 2023 17:54:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de
 Bruijn <willemdebruijn.kernel@gmail.com>, Matthew Wilcox
 <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig
 <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, Jeff Layton
 <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, Chuck Lever
 III <chuck.lever@oracle.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Jeroen de Borst
 <jeroendb@google.com>, Catherine Sullivan <csully@google.com>, Shailend
 Chand <shailend@google.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH net-next v5 03/19] mm: Make the page_frag_cache
 allocator use multipage folios
Message-ID: <20230406175434.0d74bbcc@kernel.org>
In-Reply-To: <20230406094245.3633290-4-dhowells@redhat.com>
References: <20230406094245.3633290-1-dhowells@redhat.com>
	<20230406094245.3633290-4-dhowells@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_175438_445356_2D4551AE 
X-CRM114-Status: GOOD (  11.70  )
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

On Thu,  6 Apr 2023 10:42:29 +0100 David Howells wrote:
> Change the page_frag_cache allocator to use multipage folios rather than
> groups of pages.  This reduces page_frag_free to just a folio_put() or
> put_page().

drivers/nvme/host/tcp.c:1315:15: warning: unused variable 'page' [-Wunused-variable]
        struct page *page;
                     ^

drivers/net/ethernet/mediatek/mtk_wed_wo.c:306:15: warning: unused variable 'page' [-Wunused-variable]
        struct page *page;
                     ^

