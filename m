Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307AEC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nc5z+fIoiWRGbEoDiN5kVtNuvPICZUxfahsCp834BCE=; b=o70Ln9KhW88B3BDkMaGE/qVkqG
	0b6oemGb9UFXDZhq9v2eFV3aOdDitpHXjlTimLC8ODFmjUDNTCm9vEOlF+F6wZblorotDg8jj1bNS
	w9E4/2qsYJiEC2Z97DB4fpv81ynqiHhKVE9HDO3Hfub6zar9sipJi2/HXNxa7Iu1dWQBs3Iqqe0LP
	FRPHKW4+1+cJXrWygNpTyTAq4bg7CqPtdd0gRRA36KHCkJApBNz8yiE/+ptN+M8gZCXI7G+w9V9LK
	MmT7cqZHjLZjbX7s9+bpJ8vSudtx8proep5Zsc39CWm64adgGUMXhnayDnW2/gDUOMY4j6ZYEd0iM
	gh5poP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypL6-00Axfi-0x;
	Fri, 03 Nov 2023 08:15:36 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qypL3-00AxfM-33;
	Fri, 03 Nov 2023 08:15:33 +0000
Date: Fri, 3 Nov 2023 01:15:33 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	Will Shiu =?utf-8?B?KOioseaBreeRnCk=?= <Will.Shiu@mediatek.com>,
	Peter Wang =?utf-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alice Chao =?utf-8?B?KOi2meePruWdhyk=?= <Alice.Chao@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	Casper Li =?utf-8?B?KOadjuS4reamrik=?= <casper.li@mediatek.com>,
	Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>,
	Powen Kao =?utf-8?B?KOmrmOS8r+aWhyk=?= <Powen.Kao@mediatek.com>,
	Naomi Chu =?utf-8?B?KOacseipoOeUsCk=?= <Naomi.Chu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Stanley Chu =?utf-8?B?KOacseWOn+mZnik=?= <stanley.chu@mediatek.com>
Subject: Re: [PATCH 1/1] block: Check the queue limit before bio submitting
Message-ID: <ZUSsJbcSPSR52J2l@infradead.org>
References: <20231025092255.27930-1-ed.tsai@mediatek.com>
 <64db8f5406571c2f89b70f852eb411320201abe6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64db8f5406571c2f89b70f852eb411320201abe6.camel@mediatek.com>
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

You need to look into the splitting code to see why the splits are
suboptimal for your device.  We can't limit the upper bio size as
we have code relying on it not having arbitrary limits.


