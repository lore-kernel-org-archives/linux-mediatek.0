Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8361CCE8D7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QwzbUtjn0JVsLE53dxj+9O1VYVnrHWhgyHOajQf6gM=; b=U0SFVdxZldy51xmnrIEVIxBclV
	Zgp06FoZy/yOzdFWEoypAKOk60u87cBeO+8pS2YqHnTbs5JyU+1rmvWhln/eh4rOSfPZ81TmysDSg
	5Tpc7I62UaQwNT4pPWXCNwTNtjQNX8cVVVrkKzB8fy8Ap/yNXDoDdXIGCXRSMu0kxEdAJa3LwikIF
	55vbgAM8Y0GNAWsrJiF+49Ak4ko3XHszUHwkrliOn7Lrd2vo3WGMzaLSIZ7j3KtskIzNqV3+/5jkr
	pJVZTQS+HiyjXeFb4EA2/W3nF2g45YucOtNstApLK0F/lUZMzGCzYujtBHJ4AC86qwbJAW6c4VbAW
	FfiGr2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srFUg-0000000AB4Q-0kgS;
	Thu, 19 Sep 2024 11:38:42 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1srFTV-0000000AAxh-30TU;
	Thu, 19 Sep 2024 11:37:29 +0000
Date: Thu, 19 Sep 2024 04:37:29 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"Huang, Ying" <ying.huang@intel.com>,
	David Hildenbrand <david@redhat.com>, Chris Li <chrisl@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Dan Schatzberg <schatzberg.dan@gmail.com>,
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-block@vger.kernel.org,
	Casper Li <casper.li@mediatek.com>,
	Chinwen Chang <chinwen.chang@mediatek.com>,
	Andrew Yang <andrew.yang@mediatek.com>,
	John Hsu <john.hsu@mediatek.com>, wsd_upstream@mediatek.com
Subject: Re: [PATCH 0/2] Add BLK_FEAT_READ_SYNCHRONOUS and
 SWP_READ_SYNCHRONOUS_IO
Message-ID: <ZuwM-aEEo7DE-qXw@infradead.org>
References: <20240919112952.981-1-qun-wei.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919112952.981-1-qun-wei.lin@mediatek.com>
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

Well, you're not actually setting your new flags anywhere, which -
as you might know - is an reson for an insta-NAK.


