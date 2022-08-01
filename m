Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D702DC3F6B0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gtc2WIcu48QmHOng6TWwwO8Dfm8/xcflk0wo50jOCxw=; b=lDE1GXThH/dDWa5DYdltuQB7zP
	Qheg7pB5h4KemrMu4Zx3IJKFFkbBQZZDO6qbNR+4LPTWoXxoNjzboBdXdyp31FRW0zSTN9hnRMUFP
	JpRYdtJPiTpX4s1Qs91yXTzjYlHobqT4Idmh3ApmDvhD1VIz3azWhZ7+h1+dFkxpjMIPyfaZm2KAF
	SolEni1mczeBHOeRsTQHdXppI40mLemgRrajYbuH23ZRi9qaAYcSajGTsKldbOMwQ9YbtFgpoHm9+
	SmR21yuM3dTSpIqrMtlut+zkxeQ+sJV8bC02HxH0TSfnw3DJxpcHeLf6JobCe3MHra4oqWFY3IY0o
	M1Xc8fsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZvr-008kzS-FM; Mon, 01 Aug 2022 18:14:24 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZvl-008kvA-W2; Mon, 01 Aug 2022 18:14:18 +0000
Date: Mon, 1 Aug 2022 11:14:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Christoph Hellwig <hch@infradead.org>, peter.wang@mediatek.com,
	stanley.chu@mediatek.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, avri.altman@wdc.com,
	alim.akhtar@samsung.com, jejb@linux.ibm.com,
	wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	cc.chou@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com, powen.kao@mediatek.com,
	qilin.tan@mediatek.com, lin.gui@mediatek.com
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
Message-ID: <YugX+ZlD6cHC0+Kz@infradead.org>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <YugT7jfkMGGvH7hO@infradead.org>
 <ffa00837-5e3f-24fa-ac2c-7d4a505c848b@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffa00837-5e3f-24fa-ac2c-7d4a505c848b@acm.org>
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

On Mon, Aug 01, 2022 at 11:12:17AM -0700, Bart Van Assche wrote:
> Agreed that the description should become more clear. I think Peter wanted
> to refer to the "vendor driver" where he wrote "vendor".

vendor driver makes just as little sense.  hardware interfaces do not
map to vendors in any sensible way.

