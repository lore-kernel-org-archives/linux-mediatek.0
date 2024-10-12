Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49499D1A431
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKVPThxvf989v7DtzxaKQzLXa5qNtAiRX3s8s9yAlHA=; b=H0BbF3ipyn3PT4SKVUDVFXi3jI
	QInNUARBMoZ1JetazUNTHM9RczRkKrbJWP1jdvjWbaG87tNzwV6YIYkKPT6r5cFzui/nw5pkXchfG
	FPK0nLCnVW1Jmf/GCAXPWnxiVY95rPviJDQ2ypDWVStLzaa0fO+VvR+hQ4sE5zp0R/y/OV1woxQuR
	cHwN4imdyVb8vPtT/Lw7P9dgZc/ZxgT9DbEkIP8wtiTU4aRRbvsrdDE9vPlDUz8rCUQckbfDVG5Ym
	FVmsEUwHKUF25bBLQgoDMWEVspscu6wlsnzNPn3WbSFEM0HDCHZwSF/PlZcFIzXc5kokSXam+OhH0
	VhogBIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szWLI-00000000geb-3VIc;
	Sat, 12 Oct 2024 07:15:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szWLG-00000000geO-3TmM;
	Sat, 12 Oct 2024 07:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eKVPThxvf989v7DtzxaKQzLXa5qNtAiRX3s8s9yAlHA=; b=Fv5HbSLWfV5EjjJf5I4hXM/fl6
	9NoEikqbc6ST/MAgVg9YhMH1t+OEcTUq9hUmoraPJ4VZJAfy39UPGDedI/NJDrkQEDxknP+z+Cfiz
	Z9RZTgEma9+i4QWKjrqX/P9+m5nKTpRbLbQlQ6HvHKa4rdExB/jzzh2KQtDkpLcG8Ma0d4cOoWPIQ
	L4GcKjVBnpUa7kSTeBE9m7F4jrTLplLK0D4QJzOIfKRBSFMSZ217DGQ162R0wjc5hV2bKqklBpxGt
	B8ENowmQa/nf8VCmqY9bOnHOIfUmp292uBV88DDm6NVoyVHSQ74cXDT8LQwu/PEePmIC0XJnzTW+o
	4ySAGaNw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1szWL2-0000000Cxxw-1P51;
	Sat, 12 Oct 2024 07:14:59 +0000
Date: Sat, 12 Oct 2024 08:14:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Qun-wei Lin =?utf-8?B?KOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>
Cc: "ying.huang@intel.com" <ying.huang@intel.com>,
	Andrew Yang =?utf-8?B?KOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"baohua@kernel.org" <baohua@kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"david@redhat.com" <david@redhat.com>,
	"schatzberg.dan@gmail.com" <schatzberg.dan@gmail.com>,
	Chinwen Chang =?utf-8?B?KOW8temMpuaWhyk=?= <chinwen.chang@mediatek.com>,
	John Hsu =?utf-8?B?KOioseawuOe/sCk=?= <John.Hsu@mediatek.com>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"kasong@tencent.com" <kasong@tencent.com>,
	Casper Li =?utf-8?B?KOadjuS4reamrik=?= <casper.li@mediatek.com>,
	"chrisl@kernel.org" <chrisl@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>
Subject: Re: [PATCH 0/2] Add BLK_FEAT_READ_SYNCHRONOUS and
 SWP_READ_SYNCHRONOUS_IO
Message-ID: <Zwoh8DrKgSD99xVQ@casper.infradead.org>
References: <20240919112952.981-1-qun-wei.lin@mediatek.com>
 <87frporxtt.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <17b30f253172cce94d1e2ec86d00e82eea077bde.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17b30f253172cce94d1e2ec86d00e82eea077bde.camel@mediatek.com>
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

On Fri, Oct 11, 2024 at 09:08:10AM +0000, Qun-wei Lin (林群崴) wrote:
> The primary motivation for these new feature flags is to handle
> scenarios where we want read operations to be completed within the
> submit context, while write operations are handled in a different
> context.
> 
> This does not necessarily imply that the write operations are slow;
> rather, it is about optimizing the handling of read and write
> operations based on their specific characteristics and requirements.

So why wouldn't we always want to do that instead of making it a
per-bdev flag?

