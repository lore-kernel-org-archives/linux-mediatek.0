Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABFBC46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=draqL+CE/rP10cXaUi8xoo+aCaYER4SdwSjRFB4PIm8=; b=gBM75ShJkLl4qwruafCiJSSuWp
	j0W+gXxSXEVxGBtIJFXBqsO2B/R6phHX5Ttf1MQngunYXhxXs/s3fpbfSYCN0j6TJWQDgF2wZ0N/J
	/rhvVwzNwAcgJNQmhNcbCABaTYYkGonWOI7ZXk9bK+85qygNbfxFdGY4nFHB8lP7YMbwpEZfv44rE
	GgwmElEiDcLd3yoyuSxo+vY5eKVhkG4yWd3c9f4agfDQfS3ckLxYcdxSTO6AQFtAd42iYc5Rmzt5X
	acGuQbbtvFTJYunAdQ74o+B/x3t28HopMMDOC/Tn5M/k68debsPcLybu3tgdB5U8BtG7nTDXeFHek
	JtrguAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiAW-004jaD-2K;
	Wed, 24 Jan 2024 18:40:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiAU-004jZm-1u;
	Wed, 24 Jan 2024 18:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=draqL+CE/rP10cXaUi8xoo+aCaYER4SdwSjRFB4PIm8=; b=g+zmg+YmwmdzlghpYwJW/wat/t
	I/cEHh96j3CYzc1CTJqQpLR5HDfuqmoh7R+NZ42ScpDxaJF6gVLHWAL2nZchFm5v58pWmvbMeglcZ
	MzyF6Q2qAJeOzsmHNiGeTCRXXfqxTMW5L6tBKrwj5/B/oTA3UQ4ZS004KWeY9HEpm3HT5JyHChscz
	UFlgYfyno6PQR58/cQhX1glfFvyaelEpSFCbyIa0W8qR5M3QHKUwgZOhkm9A8xE9xMd05M/SaoN7s
	payZ5Eq73rquLSQmgMppR1ujBfIE5U0Xfucr3M/h90xU8t2SQfIvShi22ZeFYcHm+/0UNeBD9xqcB
	X3Zp449A==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSiAR-00000007SKc-2nnP;
	Wed, 24 Jan 2024 18:40:07 +0000
Date: Wed, 24 Jan 2024 18:40:07 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Haiqiang Gong =?utf-8?B?KOm+mua1t+W8uik=?= <Haiqiang.Gong@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mike Zhang =?utf-8?B?KOW8oOS8n+S8nyk=?= <Mike.Zhang@mediatek.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= mm/compaction:
 add check mechanism to avoid cma alloc fail
Message-ID: <ZbFZh-E7BZEGm_Ed@casper.infradead.org>
References: <20240122022317.30091-1-Haiqiang.Gong@mediatek.com>
 <Za3hf6A4V5QECvDy@casper.infradead.org>
 <JH0PR03MB8809FC349066C215C28DE119947B2@JH0PR03MB8809.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <JH0PR03MB8809FC349066C215C28DE119947B2@JH0PR03MB8809.apcprd03.prod.outlook.com>
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

On Wed, Jan 24, 2024 at 07:20:53AM +0000, Haiqiang Gong (龚海强) wrote:
> > I don't understand.  You say that the memory isn't movable, but then you 
> > say that it's migrated in.  So it was movable, but it's no longer
> > movable after being moved once?  
> Sorry for not expressing clearly
> When doing memory migration, the kernel will determine whether the current 
> page can be moved based on the refcount and mapcount of the current page.
> This memory can be moved during kernel compaction. At this time, refcount 
> is less than or equal to mapcount.
> After this memory is kcompacted and placed in the cma buffer, under 
> certain special conditions, the refcount may be greater than the mapcount
> （ex:the current page is being used by fs）, and then migrate will fail.

But that's always true.  Any page that is currently in use might have
its refcount temporarily incremented.  There's nothing special about
pages that belong to a file.  You've basically just prevented all
filesystem memory from being migrated to the CMA area, and that's wrong.

What's special about this page?  Or were you just unlucky?

