Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192C2CFD2FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU4r4tbL0K3+5Mx7gnspEYb/vcINY3gT5cXeOgb5F4w=; b=Cvtw9zNkeywNA03d3rCi/cTx11
	0CEmQnis+GuBM/dzqhQqGmmALwIKjqkPS8GjIGvL096pCw20+WpoRUCzcfk3LAXbZ6zNDbkzhRERm
	/7CQHH4LBItRVIaY3ya0BXzCJ4u89+Tggz7aCha8QWKz/0dGZSh4jtIOZXlm090u9vTqu015DEDhk
	DNOmZiWEp0RF+HD2ilFZOhf8EgrJ79ZvmaDIEeHZb914/9UNeHsKGzeUaW//AdYBKt3kramNu/N7B
	OD0j4i/dAuzuOr+hB/6ctI5ZAXLpxHWCPU4j4MdGrNP9ePeVin6n8Loc0e5u9qVX4d0NtdBBIyFCf
	aRE0ViYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBo9-0000000FoAN-3Xz3;
	Fri, 11 Oct 2024 09:19:37 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1szBmb-0000000FnpU-3CEE;
	Fri, 11 Oct 2024 09:18:01 +0000
Date: Fri, 11 Oct 2024 02:18:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Huang, Ying" <ying.huang@intel.com>, Chris Li <chrisl@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Kairui Song <kasong@tencent.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Dan Schatzberg <schatzberg.dan@gmail.com>,
	Barry Song <baohua@kernel.org>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Casper Li <casper.li@mediatek.com>,
	Chinwen Chang <chinwen.chang@mediatek.com>,
	Andrew Yang <andrew.yang@mediatek.com>,
	John Hsu <john.hsu@mediatek.com>, wsd_upstream@mediatek.com
Subject: Re: [PATCH] mm: Split BLK_FEAT_SYNCHRONOUS and SWP_SYNCHRONOUS_IO
 into separate read and write flags
Message-ID: <ZwjtSe8zL3WO32h5@infradead.org>
References: <20241011091133.28173-1-qun-wei.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011091133.28173-1-qun-wei.lin@mediatek.com>
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

On Fri, Oct 11, 2024 at 05:11:33PM +0800, Qun-Wei Lin wrote:
> This patch splits the BLK_FEAT_SYNCHRONOUS feature flag into two
> separate flags: BLK_FEAT_READ_SYNCHRONOUS and
> BLK_FEAT_WRITE_SYNCHRONOUS. Similarly, the SWP_SYNCHRONOUS_IO flag is
> split into SWP_READ_SYNCHRONOUS_IO and SWP_WRITE_SYNCHRONOUS_IO.
> 
> These changes are motivated by the need to better accommodate certain
> swap devices that support synchronous read operations but asynchronous write
> operations.
> 
> The existing BLK_FEAT_SYNCHRONOUS and SWP_SYNCHRONOUS_IO flags are not
> sufficient for these devices, as they enforce synchronous behavior for
> both read and write operations.

You're still failing to provide a user.  Without that it is dead in
the water from the very beginning.


