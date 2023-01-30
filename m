Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86BCC54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxoG6gV1rFEV8jUi3iioYWYa6LJ497ln+I6ZTMw2538=; b=gphMf/pqo7u35scuVWr5cgWHpi
	ODLl2VrJcMLBifIIOkaFTYh2wCpSq5x0MzBlEKVHAxtE+F7y/ZATFNYHU+E47H8JJshx229aPYqh9
	BCGV1FgVlpiYt6GeW2+s05EixDOoJV0ZANa6Y88vW671oZBunphh/rHuDo4ex1swXh12GhwkuETp0
	1E1s36A3mZAgEixzkyrvJcjt5Y6CXT49RR4+4Eu+3u1L7kfwA1GLnjdYxAs8IT2cTnyFPGL6lYy8W
	2DyFtDiZQyvNMjGdzgg/n799ennE2ead5ffcMjUoh6kRP9PjUFKZjai7YnDK+9sZ9VumDJhc2OPYq
	YkmwXYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUVo-003k4C-Lv; Mon, 30 Jan 2023 13:47:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUV0-003k1o-RN
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 13:47:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 297F161008;
	Mon, 30 Jan 2023 13:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFAFC4339E;
	Mon, 30 Jan 2023 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675085849;
	bh=xVUKXbUIi6xLEiIYm55wmvp+1ETe+NKrYKfL39iZqjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWhdZxNByqgLSw9ZeTKMACA5jYn4ulj+8bWVDJshVzFGSC7BiIUszBGzEsXnrQBZN
	 Y6mR3+pWmnNoRqLRkrZHQtJj9e/k4IryR/3jnJpRPLqP9UWarUAFRJ83gj7OeH0Nbf
	 x+vu/g0l6yctoaZ/DAaPY/eJt8CD6euDYXXQyicQ=
Date: Mon, 30 Jan 2023 14:37:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?0JbQsNC90LTQsNGA0L7QstC40Ycg0J3QuNC60LjRgtCwINCY0LPQvtGA0LU=?=
	=?utf-8?B?0LLQuNGH?= <n.zhandarovich@fintech.ru>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: Re: [PATCH 5.10 1/1] mt76: fix mt7615_init_tx_queues() return value
Message-ID: <Y9fIFirNHNP06e1L@kroah.com>
References: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
 <20230130123655.86339-2-n.zhandarovich@fintech.ru>
 <Y9fAkt/5BRist//g@kroah.com>
 <b945bd5f3d414ac5bc589d65cf439f7b@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b945bd5f3d414ac5bc589d65cf439f7b@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_054706_946371_DE9A6C35 
X-CRM114-Status: GOOD (  14.77  )
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

On Mon, Jan 30, 2023 at 01:27:26PM +0000, Жандарович Никита Игоревич wrote:
> > What is the git commit id of this upstream?
> > 
> > And I can't apply this as-is for the obvious reason it would mess up the
> > changelog, how did you create this?
> > 
> > confused,
> > 
> > greg k-h
> 
> Commit in question is b671da33d1c5973f90f098ff66a91953691df582
> upstream. I wasn't certain it makes sense to backport the whole patch
> as only a small portion of it pertains to the fault at question.

What is the "fault"?

And why not take the whole thing?  What's wrong with that?  We almost
always want to take whatever is in Linus's tree because when we do not,
we almost always cause bugs or other problems (later merge issues.)

So always take the original fix please.

thanks,

greg k-h

